--------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--
--   sccb_master.vhd
--   Module in charge of the SCCB communication with the OmniVision OV7670
--   camera.
--   SCCB (Serial Camera Control Bus) is like the I2C
--   This module is the master.
--   For this first version, it will only write to the camera, therefore
--   it will be a 3-phase write transmission cycle
--   As explained in the Register Set section of the datasheet, the camera
--   slave address is x"42" (0x42, hexadecimal) for writting and and x"43" for
--   reading
--
--   Instead of generics, constants are defined in packages
--
--                 0 1 2 3
--       :________:     ___:     ___:
--  SCL  :        :\___/   :\___/   :
--       :        :        :        :
--       :__      :   _____:__ _____:
--  SDA  :  \_____:__/__d7_:__X__d6_:
--       :0 1 2 3 :0 1 2 3 :0 1 2 3
--                :        :
--                :.Tsccb..:

--          init                                  dont   Another phase
--        sequence 0 1 2 3                        care    OR end bit
--       :______  :   ___  :   ___  : :   ___  :   ___  :  ______
--  SCL  :      \_:__/   \_:__/   \_: :__/   \_:__/   \_:_/
--       :        :        :        : :        :        :
--       :__      : _______: _______: : _______: _______:    ____
--  SDA  :  \_____:/__d7___:X__d6___: :X__d0___:X___Z___:___/    
--       :0 1 2 3 :0 1 2 3 :0 1 2 3
--                :        :
--                :.Tsccb..:                     DNTC_ST:END_SEQ_ST
--       INIT_SEQ_ST
--
--     The period Tsccb is divided in 4 parts.
--     SCL changes at the end of 1st and 3rd quarters
--     SDA changes at the end of the peridod (end of last (4th) quarter)
--     When transmiting bits, SDA must not change when SCL is high
--     Max frequency of the sccb clock 400 KHz: Period 2.5 us
--     Half of the time will be high, the other half low: 1.25 us
--     However, the minimum clok low period for the sccb_clk is 1.3 us
--     making low and high the same time, would be 2.6 us (~384,6 KHz)
--     We will make a divider of the 1/4 the period, to be able to change
--     the signals at the quarter. That would be 650 ns.

--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ov7670_pkg.all;  -- definition of the clk frequency
use work.pkg_fun.all;  -- definition of the clk frequency

entity sccb_master is
  port(
    rst        : in  std_logic;                    --reset, active high
    clk        : in  std_logic;                    --fpga clock
    start_tx   : in  std_logic;                    --start transmission
    id         : in  std_logic_vector(6 downto 0); --id of the slave
    addr       : in  std_logic_vector(7 downto 0); --address to be written
    data_wr    : in  std_logic_vector(7 downto 0); --data to write to slave
    ready      : out std_logic;                    --ready to send
    finish_tx  : out std_logic;                    --transmission finished(pulse
    sclk       : out std_logic;                    --sccb clock
    sdat_on    : out std_logic;                    --transmitting serial ('1')
    --sdat_in    : in  std_logic;                  --sccb serial data in
    sdat_out   : out std_logic);                   --sccb serial data out
end sccb_master;

architecture behav of sccb_master is

  -- saving in registers the slave ID, address or the register
  -- and data to be written. 8x3 = 24 bits
  --signal id_rg    : std_logic_vector(7 downto 0); --id of the slave
  --signal addr_rg  : std_logic_vector(7 downto 0); --address to be written
  --signal data_rg  : std_logic_vector(7 downto 0); --data to write to slave
  signal send_rg  : std_logic_vector(24-1 downto 0); --id, addr and data

   -- quarter of a period in ns
   constant c_sclk_period_div4 : integer := 650; -- see explanation above

  -- frequency divider counter end value. Divided by 4 to have it divided
  -- in 4 slots
  -- we use div_ceil, to avoid having a smaller end count,
  -- which would mean higher frequency
  constant c_sclk_div4_endcnt: natural := div_ceil (c_sclk_period_div4,
                                                    c_clk_period);

  -- number of bits necessary to represent c_sclk_endcont in binary
  constant c_nb_cnt_sclk_div4 : natural := log2i(c_sclk_div4_endcnt-1) + 1;

  -- frequency divider, but 4 time faster than the sccb period
  signal  cnt_sclk_div4 : unsigned (c_nb_cnt_sclk_div4-1 downto 0);
  -- indicates that the count reached the end: end of a quarter
  signal  sclk_div4_end : std_logic;

  -- count of the four quarters of the scc clock
  signal  cnt_4sclk : unsigned (1 downto 0);
  signal  sclk_end : std_logic; -- end of a sccb_clk cycle

  -- count the 3 phases of the sending:
  --   0: slave ID
  --   1: address of the register to be written
  --   2: data to be written
  signal  cnt_phases : unsigned (1 downto 0);
  signal  new_phase  : std_logic; -- end of a phase, starting a new one
  signal  phases_end : std_logic; -- end of the 3 phases

  signal  ready_aux : std_logic; -- not busy, ready to receive

  type sccb_states is ( IDLE_ST,      -- waiting to send, not busy
                        INIT_SEQ_ST,  -- sending the initial sequence
                        SEND_BYTE_ST, -- sending the byte of any of the 3 phases
                        DNTC_ST,      -- dont care bit, in i2c would be ack
                        END_SEQ_ST    -- sending the end sequence
                      ); 

  signal pr_sccb_st, nx_sccb_st : sccb_states;  -- present state, next state

  -- enable the counter of bits to send data and shifting the registers
  -- in any of the 3 phases: ID_ADDR_ST, REG_ADDR_ST, SEND_BYTE_ST
  signal send_data : std_logic;
  -- counter 
  signal cnt_8bits : unsigned (2 downto 0); -- 3 bits to count 0 to 7
  -- end of the 8 bit count
  signal cnt_8bits_end : std_logic;

  -- indication to save id, address and data to write
  signal save_indata : std_logic;
  --clear registers where the data to send is saved
  signal clr_datarg  : std_logic;

begin
  
  ready <= ready_aux when rst = c_off else '0';  -- if reset, not ready

  P_reg: process(rst, clk)
  begin
    if rst = c_on then
      -- the line is inactive at '1'
      send_rg   <= (others =>'1');
    elsif clk'event and clk='1' then
      if clr_datarg = '1' then
        send_rg   <= (others =>'1');
      elsif save_indata = '1' then
        --'0' indicates we are writting in the slave. Reading not implemented
        -- id has 7 bits
        send_rg   <= id & '0' & addr & data_wr;
      elsif send_data = '1' then
        if sclk_end = '1' then
          -- rotate left, fillings with '1'
          send_rg <= send_rg(send_rg'left -1 downto 0) & '1';
        end if;
      end if;
    end if;
  end process;

  -- counting a quarter of the sccb clk period
  P_sclk_div4: process(rst, clk)
  begin
    if rst = c_on then
      cnt_sclk_div4 <= (others => '0');
    elsif clk'event and clk = '1' then
      if ready_aux = '1' then
        cnt_sclk_div4 <= (others => '0');
      else
        if sclk_div4_end = '1' then
          cnt_sclk_div4 <= (others => '0');
        else
          cnt_sclk_div4 <= cnt_sclk_div4 + 1;
        end if;
      end if;
    end if;
  end process;

  sclk_div4_end <= '1' when (cnt_sclk_div4 = c_sclk_div4_endcnt-1) else '0';

  -- counting the 4 quarters of the sccb clk period
  P_sclk: process(rst, clk)
  begin
    if rst = c_on then
      cnt_4sclk <= (others => '0');
    elsif clk'event and clk = '1' then
      if ready_aux = '1' then -- if inactive, no count and start counting
        cnt_4sclk <= (others => '0');
      elsif sclk_end = '1' then
        cnt_4sclk <= (others => '0');
      elsif sclk_div4_end = '1' then
        cnt_4sclk <= cnt_4sclk + 1;
      end if;
    end if;
  end process;

  sclk_end <= '1' when (sclk_div4_end ='1' and cnt_4sclk = 4-1) else '0';

  -- counting the 8 bits of each of the 3 phases
  -- counting down to keep track of the bits, the first is the bit 7
  -- the last the bit 0
  P_8bit_cnt: process(rst, clk)
  begin
    if rst = c_on then
      cnt_8bits <= (others => '1');
    elsif clk'event and clk = '1' then
      -- send_data active in any of the 3 phases (SEND_BYTE_ST)
      if send_data = '0' then -- if inactive, no count and start counting
        cnt_8bits <= (others => '1');
      elsif cnt_8bits_end = '1' then
        cnt_8bits <= (others => '1');
      elsif sclk_end = '1' then
        cnt_8bits <= cnt_8bits - 1;
      end if;
    end if;
  end process;

  cnt_8bits_end <= '1' when (sclk_end ='1' and cnt_8bits = 0) else '0';

  -- counting the 3 phases of a SCCB write
  P_3phases_cnt: process(rst, clk)
  begin
    if rst = c_on then
      cnt_phases <= (others => '0');
    elsif clk'event and clk = '1' then
      if ready_aux = '1' then  
        cnt_phases <= (others =>'0');
      elsif phases_end = '1' then
        cnt_phases <= (others =>'0');
      elsif new_phase = '1' then
        cnt_phases <= cnt_phases + 1;
      end if;
    end if;
  end process;

  -- 3 phases for writting
  phases_end <= '1' when (cnt_phases = 3-1 and new_phase = '1') else '0';


  -- FSM sequential process
  P_FSM_seq: process(rst, clk)
  begin
    if rst = c_on then
      pr_sccb_st <= IDLE_ST;
    elsif clk'event and clk='1' then
      pr_sccb_st <= nx_sccb_st;
    end if;
  end process;

  -- FSM combinatorial process
  P_FSM_comb: process(pr_sccb_st, start_tx, cnt_4sclk, sclk_end, send_rg,
                      cnt_8bits,  cnt_phases, cnt_8bits_end)
  begin
    -- default values
    ready_aux   <= '0';  -- only ready in IDLE
    sdat_on     <= '0';
    sdat_out    <= '1';
    nx_sccb_st  <= pr_sccb_st;
    save_indata <= '0';
    clr_datarg  <= '0';
    send_data   <= '0';
    new_phase   <= '0';
    finish_tx   <= '0';
    sclk <= '1';
    case pr_sccb_st is
      when IDLE_ST => -- waiting to send, not busy
        ready_aux<= '1';  -- ready to send
        sclk     <= '1';
        sdat_on  <= '0';  --Z
        sdat_out <= '1';
        if start_tx = '1' then
          nx_sccb_st  <= INIT_SEQ_ST;
          save_indata <= '1';  --id, address and data to write have to be saved
        end if;
      when INIT_SEQ_ST =>  -- sending the initial sequence
        sclk <= '1';
        sdat_on <= '1';
        case cnt_4sclk is
          when "00" =>
            sclk <= '1';
            sdat_out <= '1';
          when "01" | "10" =>
            sclk <= '1';
            sdat_out <= '0';
          when others => --3
            sclk <= '0';
            sdat_out <= '0';
        end case;
        if sclk_end = '1' then
          nx_sccb_st <= SEND_BYTE_ST;
        end if;
      when SEND_BYTE_ST =>   -- sending the bytes of any of the 3 phases
        send_data <= '1';  -- enable the 8 bit counter
        sdat_on <= '1';
        case cnt_4sclk is
          when "00" | "11" =>
            sclk <= '0';
          when others => --1, 2
            sclk <= '1';
        end case;
        sdat_out <= send_rg(send_rg'left);
        if cnt_8bits_end = '1' then
          nx_sccb_st <= DNTC_ST;
        end if;
      when DNTC_ST =>     -- dont care bit, in i2c would be ack
        sdat_on <= '0';  -- it will be Z
        case cnt_4sclk is
          when "00" | "11" =>
            sclk <= '0';
          when others => --1, 2
            sclk <= '1';
        end case;
        if sclk_end = '1' then
          new_phase   <= '1';
          if cnt_phases = 3-1 then
            nx_sccb_st <= END_SEQ_ST; -- end of the transimission
          else
            nx_sccb_st <= SEND_BYTE_ST; -- new phase
          end if;
        end if;
      when END_SEQ_ST =>   -- sending the end sequence
        clr_datarg <= '1'; --clear registers where the data to send is saved
        sdat_on <= '1';
        case cnt_4sclk is
          when "00" =>
            sclk <= '0';
            sdat_out <= '0';
          when "01" =>
            sclk <= '1';
            sdat_out <= '0';
          when others => -- 2 or 3
            sclk <= '1';
            sdat_out <= '1';
        end case;
        if sclk_end = '1' then
          nx_sccb_st <= IDLE_ST;
          finish_tx <= '1'; -- pulse to tell that transimission is done
        end if;
    end case;
  end process;
    
end behav;
