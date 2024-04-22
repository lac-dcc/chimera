--------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--
--   ov7670_ctrl_reg.vhd
--   Module in charge of telling the SCCB module what registers to write
--   in the camera camera and to control the camera inputs:
--     - ov7670_rst_n
--          0: camera reset
--          1: normal mode            
--     - pwdn: power down mode selection
--          0: normal mode
--          1: power down mode
--     - xclk: system clock input
--          freq   :  min: 10 MHz  -- typ: 24 MHz  -- Max: 48 MHz
--          Period : max: 100 ns   -- typ: 42 ns   -- Max: 21 ns
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ov7670_pkg.all;  -- definition of the clk frequency
use work.pkg_fun.all;  -- definition of the clk frequency

entity ov7670_ctrl_reg is
  port(
    rst        : in  std_logic;                    --reset, active high
    clk        : in  std_logic;                    --fpga clock
    test_mode  : in  std_logic;                    --if '1': in test mode
    test_send  : in  std_logic;                --in testmode, send 1 instruction
    sw_regs    : in  std_logic_vector(1 downto 0);
    resend     : in  std_logic;                    --resend all the sequence
    sccb_ready : in  std_logic;                    --SCCB ready to transmit
    start_tx   : out std_logic;                    --start transmission
    done       : out std_logic;                    --all the registers written
    id         : out std_logic_vector(6 downto 0); --id of the slave
    addr       : out std_logic_vector(7 downto 0); --address to be written
    data_wr    : out std_logic_vector(7 downto 0); --data to write to slave
    ov7670_rst_n : out std_logic;                  --camera reset
    ov7670_clk   : out std_logic;                  --camera system clock
    ov7670_pwdn  : out std_logic                   --camera power down
  );
end ov7670_ctrl_reg;

architecture behav of ov7670_ctrl_reg is

  type mem_reg is array (natural range <>) of std_logic_vector(15 downto 0); 
  -- msb 8 bits are the address (15 downto 8)
  -- lsb 8 bits are the register value to be written

  -- https://thinksmallthings.wordpress.com/2012/11/03/ov7670-yuv-demystified/comment-page-1/
  constant reg_vga_00 : mem_reg := (
    x"1280", -- COM7   Reset
    x"1280", -- COM7   Reset

    -- QQVGA2
    x"1181", -- CLKRC  6->0 External clock, pre-scale /2
             --        [7]: 1 (reserved)
             --        [0]: 1 (+1) 
    x"1204", -- COM7   2,0->(1,0) RGB 
             --        1->0 disable color bar
    x"0C04", -- COM3   3->0 scale disable
             --        2->0 DCW disable
    x"3E1B", -- COM14
             --        4->1 Enable DCW
             --        3->1 Scaling can be adjusted manually (for CIF, QVGA..)
             --        [1,0]-> 11: pclk divided by 8   
    x"703A", -- SCALING_XSC (default)
    --x"70BA", -- SCALING_XSC
             -- [7] = 1 (BA) Fade to gray color bar
    --x"7135", -- SCALING_YSC (default)
    x"71B5", -- SCALING_YSC (default)
             -- [7] = 1 test color bar
    --x"7222", -- SCALING_DCWCTR (down sampling by 4)
    x"7233", -- SCALING_DCWCTR (down sampling by 8)
    --x"73F2", -- SCALING_PCLK_DIV (divided by 4)
    x"73F3", -- SCALING_PCLK_DIV (divided by 8)
    x"A202", -- SCALING_PCLK_DELAY (default)
    -- end QQVGA

    x"40F0", -- COM15  Full 0-255 output, RGB 444
                -- [7:6] = "11" 12 (C)
                -- [5:4] = x0: Normal RGB output
                -- [5:4] = x0: Normal RGB output (not what we want)
                -- [5:4] = 11: RGB

    x"0F43", -- COM6  
                -- [7] = 0 Disable HREF at optical black
                -- [1] = Resets timming when format changes
                -- others reserved
    x"8C02", -- RGB444 Set RGB format: RGB444
             -- [1]= '1' RGB444 enable
    x"1520", -- COM10 Use HREF not hSYNC
             -- bit 5: 1 pclk does not toggle during horizontal blank


    x"FFFF", -- FINISH CONDITION
    x"FFFF"  -- FINISH CONDITION
    );


  constant reg_vga_01 : mem_reg := (
           -- 7654 3210 : bit
           -- 8421 8421 : weight

    x"1280", -- COM7   Reset
    --x"1100", -- CLKRC  6->0 External clock, no pre-scale
    --x"1180", -- CLKRC  6->0 External clock, no pre-scale
    x"1181", -- CLKRC  6->0 External clock, pre-scale /2
             --        [7]: 1 (reserved)
             --        [0]: 1 (+1) 
    x"1204", -- COM7   2,0->(1,0) RGB 
             --        1->0 disable color bar
    --x"0C00", -- COM3   3->0 scale disable
             --        2->0 DCW disable
    x"3E1B", -- COM14
             --        4->1 Enable DCW
             --        3-> Manual scaling enable
             --        [1,0]-> 11: pclk divided by 8   
    x"40F0", -- COM15  Full 0-255 output, RGB 444
                -- [7:6] = "11" 12 (C)
                -- [5:4] = x0: Normal RGB output
                -- [5:4] = x0: Normal RGB output (not what we want)
                -- [5:4] = 11: RGB

    x"0F43", -- COM6  
                -- [7] = 0 Disable HREF at optical black
                -- [1] = Resets timming when format changes
                -- others reserved
    x"8C02", -- RGB444 Set RGB format: RGB444
             -- [1]= '1' RGB444 enable

    --x"A202", -- SCALING_PCLK_DELAY
             --        6:0-> 2 Scaling output delay
    x"A200", -- SCALING_PCLK_DELAY
             --        6:0-> No scalling

    --x"1500", -- COM10 Use HREF not hSYNC
    x"1520", -- COM10 Use HREF not hSYNC
             -- bit 5: 1 pclk does not toggle during horizontal blank



   --QQVGA/2
    x"0C04", -- COM3   3->0 scale disable
             --        2->1 DCW enable
    x"3E1B", -- COM14
             --        4->1 Enable DCW
             --        3-> Manual scaling enable
             --        [1,0]-> 11: pclk divided by 8   
    x"703A", -- SCALING_XSC (default)
    --x"70BA", -- SCALING_XSC
             -- [7] = 1 (BA) Fade to gray color bar
    --x"7135", -- SCALING_YSC (default)
    x"71B5", -- SCALING_YSC (default)
             -- [7] = 1 test color bar
    --x"7222", -- SCALING_DCWCTR (down sampling by 4)
    x"7233", -- SCALING_DCWCTR (down sampling by 8)
    --x"73F2", -- SCALING_PCLK_DIV (divided by 4)
    x"73F3", -- SCALING_PCLK_DIV (divided by 8)

    x"A202", -- SCALING_PCLK_DELAY (default)


    x"FFFF", -- FINISH CONDITION
    x"FFFF"  -- FINISH CONDITION
  );


  -- rgb444
  constant reg_vga_10 : mem_reg := (
    x"1280", -- COM7   Reset
    --x"1180", -- CLKRC  6->0 External clock, no pre-scale
    x"1181", -- CLKRC  6->0 External clock, pre-scale /2
             --        [7]: 1 (reserved)
             --        [0]: 1 (+1) 
    x"1204", -- COM7   2,0->(1,0) RGB 
             --        1->0 disable color bar
    --x"0C00", -- COM3   3->0 scale disable
    --x"3E00", -- COM14  4->0 Normal PCLK
             --        3->0 Scaling cannot be adjusted manually
    x"3E1B", -- COM14
             --        4->1 Enable DCW
             --        3-> Manual scaling enable
             --        [1,0]-> 11: pclk divided by 8    

    x"40F0", -- COM15  Full 0-255 output, RGB 444
                -- [7:6] = "11" 12 (C)
                -- [5:4] = x0: Normal RGB output
                -- [5:4] = x0: Normal RGB output (not what we want)
                -- [5:4] = 11: RGB
    x"0F43", -- COM6  
                -- [7] = 0 Disable HREF at optical black
                -- [1] = Resets timming when format changes
                -- others reserved
    x"8C02", -- RGB444 Set RGB format: RGB444
             -- [1]= '1' RGB444 enable

    --x"A202", -- SCALING_PCLK_DELAY
             --        6:0-> 2 Scaling output delay
    x"A200", -- SCALING_PCLK_DELAY
             --        6:0-> No scalling

    --x"1500", -- COM10 Use HREF not hSYNC
    x"1520", -- COM10 Use HREF not hSYNC
             -- bit 5: 1 pclk does not toggle during horizontal blank


   --QQVGA/2
    x"0C04", -- COM3   3->0 scale disable
             --        2->0 DCW disable
    x"3E1B", -- COM14
             --        4->1 Enable DCW
             --        3-> Manual scaling enable
             --        [1,0]-> 11: pclk divided by 8    

    x"703A", -- SCALING_XSC (default)
    --x"70BA", -- SCALING_XSC
             -- [7] = 1 (BA) Fade to gray color bar
    --x"7135", -- SCALING_YSC (default)
    x"71B5", -- SCALING_YSC (default)
             -- [7] = 1 test color bar

    --x"7222", -- SCALING_DCWCTR (down sampling by 4)
    x"7233", -- SCALING_DCWCTR (down sampling by 8)
    --x"73F2", -- SCALING_PCLK_DIV (divided by 4)
    x"73F3", -- SCALING_PCLK_DIV (divided by 8)


    x"A202", -- SCALING_PCLK_DELAY (default)



    x"FFFF", -- FINISH CONDITION
    x"FFFF"  -- FINISH CONDITION

  );


  -- cuenta 2-3 

  -- 11
  -- RGB444
  constant reg_vga_11 : mem_reg := (
    x"1280", -- 12:COM7
             -- [7]=1: Reset all registers to default values
    x"1204", -- 12:COM7
             -- [2,0]="10": Output format RGB 
    x"40F0", -- 40:COM15  Full 0-255 output, RGB 444
                -- [7:6] = "11": Full output range. 12 (C)
                -- [5:4] = x0: Normal RGB output
                -- [5:4] = x0: Normal RGB output (not what we want)
                -- [5:4] = 11: RGB 55 only if RGB444 is low, we want RGB444
                -- [3:0] = 0:  Reserved

    x"8C02", -- RGB444 Set RGB format: RGB444
             -- [1]= '1' RGB444 enable
             -- [0]= '0' word format: xR GB
    --x"6BCA", -- DBLV PLL bypass
    x"1181", -- CLKRC  6->0 External clock, pre-scale /2
             --        [7]: 1 (reserved)
             --        [5:0]: Interal clock pre-scalar
             --           F(internal clk) = F(input clk)/([5:0]+1)
             --        [5:0]= 1: Divide by 2 (internal clk)

    --x"703A", -- test
               -- [7]: 0: TestPatern (0): 10: 8-bar color
    --x"71B5", -- test
    --x"71B0", -- test
               -- [7]= 1: TestPatern (1): 10: 8-bar color
               -- [6:0]: scale factor
    x"0F43", -- COM6  
                -- [7] = 0 Disable HREF at optical black
                -- [1] = 1 Resets timming when format changes
                -- others reserved


    --x"B084", -- recommended TFG
    --x"1500", -- COM10 Use HREF not hSYNC
    x"1520", -- COM10 Use HREF not hSYNC
             -- [6]=0: Use HREF not HSYNC
             -- [5]=1 pclk does not toggle during horizontal blank
             -- others default

   --QQVGA2
    x"0C04", -- COM3
             -- [3]=1 scale enable (for QQVGA/2)
             -- [2]=0 DCW disable
    x"3E1B", -- COM14
             -- [4]=1 : Scaling PCLK enable (also DCW)
             -- [3]=1 : Manual scaling enable (QVGA)
             -- [2:0] PCLK divided when COM14[4]=1
             -- [2:0]-> 011: pclk divided by 8 -> QQVGA/2: 80x60   
    x"703A", -- SCALING_XSC 
             -- [7]: test_pattern[0], works with test_pattern[1]
             --  00: No test output                            
             --  01: Shifting "1"
             --  10: 8-bar color bar
             --  11: Fade to gray color bar
             -- [7]: 0 -> 8-bar color bar (test_pattern[1]=1)
             -- [6:0]: default horizontal scale factor
    --x"70BA", -- SCALING_XSC
             -- [7] = 1 (BA) Fade to gray color bar
    --x"7135", -- SCALING_YSC (default)
    x"71B5", -- SCALING_YSC (default)
             -- [7]: test_pattern[1], works with test_pattern[0]
             --  00: No test output                            
             --  01: Shifting "1"
             --  10: 8-bar color bar
             --  11: Fade to gray color bar
             -- [7]: 1 -> 8-bar color bar (test_pattern[0]=0)
             -- [6:0]: default vertical scale factor
    --x"7222", -- SCALING_DCWCTR (down sampling by 4)
    x"7233", -- SCALING_DCWCTR (down sampling by 8)
             -- [7]=0: Vertical average calc truncation(default)
             -- [6]=0: Vertical truncation downsampling(default)
             -- [5:4]: Vertical down sampling rate
             -- [5:4]=11: Vertical down sampling by 8->QQVGA/2
             -- [3]=0: Horztal average calc truncation(default)
             -- [2]=0: Horztal truncation downsampling(default)
             -- [1:0]: Horztal down sampling rate
             -- [1:0]=11: Horztal down sampling by 8->QQVGA/2
    --x"73F2", -- SCALING_PCLK_DIV (divided by 4)
    x"73F3", -- SCALING_PCLK_DIV (divided by 8)
             -- [7:4]=F: Reserved, and manual says default is 0
             --          but Implementation Guide says F
             -- [3]=0: Enable clk divider for DSP scale control
             -- [2:0]=011: Divided by 8 -> QQVGA/2       
    x"A202", -- SCALING_PCLK_DELAY (default)
             -- [7]: Reserved
             -- [6:0]=02: Default scaling ouput delay

    x"FFFF", -- FINISH CONDITION
    x"FFFF"  -- FINISH CONDITION
  );


  -- frequency divider for camera clk (divide by 4) 
  --signal cnt_cam_clk : unsigned (1 downto 0);
  -- frequency divider for camera clk (divide by 8) 
  signal cnt_cam_clk : unsigned (2 downto 0);

  -- 6 bits: less than 64 registers to be written, change if the number
  -- of registers to be written change
  signal cnt_reg : unsigned (5 downto 0);

  -- auxiliary signal, connected to output port done
  signal alltx_done : std_logic;

  -- auxiliary signal, connected to start_tx
  signal start_tx_aux : std_logic;

  --id of the slave; 0x21.
  -- if adding the write bit, would be 0x42 for writing and 0x43 for reading
  constant c_id_write  : std_logic_vector(6 downto 0) :=  B"0100_001" ;
  signal   addr_aux    : std_logic_vector(7 downto 0); --address to be written
  signal   data_aux    : std_logic_vector(7 downto 0); --data to write to slave
  -- register from the register memory: address & data
  signal   reg_i       : std_logic_vector(15 downto 0);

  type ctrl_states is (
                        RSTCAM_ST,    -- Reset camera during 300ms
                        WAIT_RSTCAM_ST, -- wait camera during 300ms to be ready
                        WAIT_ST,      -- waiting to send, until not busy
                        WRITE_REG_ST, -- sending the initial sequence
                        DONE_ST       -- all the registers written
                      ); 

  signal pr_ctrl_st, nx_ctrl_st  : ctrl_states;  -- present state, next state

  -- save the switch values to see if the have changed
  signal sw_regs_st : std_logic_vector (1 downto 0);
  signal sw_regs_change : std_logic;

  signal end300ms : std_logic;
  signal ena_cnt300ms : std_logic;
  signal cnt300ms : unsigned (24 downto 0);
  constant C_END300MS : integer := 30000000; -- 30 millions


begin

  -- camera system clock:
  --     freq   :  min: 10 MHz  -- typ: 24 MHz  -- Max: 48 MHz
  --     Period : max: 100 ns   -- typ: 42 ns   -- Max: 21 ns
  -- duty cycle between 45% and 55%
  -- Since our clock is 10 ns (100 MHz), we have to divide frequency by:
  --  4: 25 MHz - 40 ns
  P_camera_clk_cnt: process(rst, clk)
  begin
    if rst = c_on then
      cnt_cam_clk <= (others => '0');
    elsif clk'event and clk='1' then
      if cnt_cam_clk = "011" then
        cnt_cam_clk <= (others => '0');
      else
        cnt_cam_clk <= cnt_cam_clk + 1;
      end if;
    end if;
  end process;

  -- when cnt_cam_clk = 0 | 1 => '0', when 2 | 3 => '1'
  ov7670_clk <= cnt_cam_clk(1);

  -- camera reset and power down
  ov7670_pwdn  <= '0';

  -------- controlling the registers to be sent ------------

  id        <= c_id_write; -- 0x21
  addr_aux  <= reg_i(15 downto 8);
  addr      <= addr_aux;
  data_wr   <= reg_i(7 downto 0);

  done     <= alltx_done;
  start_tx <= start_tx_aux;

  -- sequentially counts the registers to be sent to the SCCB
  P_reg_cnt: process(rst, clk)
  begin
    if rst = c_on then
      cnt_reg <= (others =>'0');
    elsif clk'event and clk='1' then
      if resend = '1' or sw_regs_change = '1' then
        cnt_reg <= (others =>'0'); -- start again sending the sequence
      elsif alltx_done = '0' then  -- 
        if start_tx_aux = '1' then
          cnt_reg <= cnt_reg + 1;
        end if;
      end if;
    end if;
  end process;
        
  -- instead of comparing addr_aux = x"FF", to simplify, since there is no
  -- address in F ("1111"), it can be compared
  alltx_done <= '1' when addr_aux(7 downto 4) = "1111" else '0'; 

  P_save_sw_regs: process(rst, clk)
  begin
    if rst = c_on then
      sw_regs_st <= (others => '0');
    elsif clk'event and clk = '1' then
      sw_regs_st <= sw_regs;
    end if;
  end process;

  sw_regs_change <= '1' when (sw_regs_st xor sw_regs) /= "00" else '0';

  -- without clk -> Distributed CLBS
  -- reg_i <= registers(to_integer(unsigned(cnt_reg));
  -- process with clk -> BRAM
  P_regs: process(rst,clk)
  begin
    if rst = c_on then
      reg_i <= x"1280"; -- reset
    elsif clk'event and clk='1' then
      case sw_regs is
        when "00" =>
          reg_i <= reg_vga_00(to_integer(unsigned(cnt_reg)));
        when "01" => --hamster Zed
          reg_i <= reg_vga_01(to_integer(unsigned(cnt_reg)));
        when "10" => 
          reg_i <= reg_vga_10(to_integer(unsigned(cnt_reg)));
        when others =>  -- 11
          reg_i <= reg_vga_11(to_integer(unsigned(cnt_reg)));
      end case;
    end if;
  end process;

  -- FSM sequential process
  P_fsm_seq: process(rst,clk)
  begin
    if rst = c_on then
      pr_ctrl_st <= RSTCAM_ST;
    elsif clk'event and clk='1' then
      pr_ctrl_st <= nx_ctrl_st;
    end if;
  end process;


  -- FSM combinatorial process
  P_fsm_comb: process(pr_ctrl_st, alltx_done, sccb_ready, test_mode, test_send,
                      end300ms)
  begin
    -- default values
    nx_ctrl_st <= pr_ctrl_st;
    start_tx_aux <= '0';
    ov7670_rst_n <= '1'; --inactive camera reset
    ena_cnt300ms <= '0';
    case  pr_ctrl_st is
      when RSTCAM_ST => -- reset camera
        ov7670_rst_n <= '0'; --active camera reset
        ena_cnt300ms <= '1';
        if end300ms = '1' then
          nx_ctrl_st <= WAIT_RSTCAM_ST;
        end if;
      when WAIT_RSTCAM_ST => -- reset camera
        ena_cnt300ms <= '1';
        if end300ms = '1' then
          nx_ctrl_st <= WAIT_ST;
        end if;
      when WAIT_ST => -- waiting for the SCCB to be available
        if alltx_done = '1' then
          nx_ctrl_st <= DONE_ST;
        elsif sccb_ready = '1' then
          if test_mode = '0' or (test_mode = '1' and test_send='1') then
            nx_ctrl_st <= WRITE_REG_ST;
            start_tx_aux <= '1';
          end if;
        end if;
      when WRITE_REG_ST => -- writting a new register (maybe not necessary)
        ena_cnt300ms <= '1';
        if end300ms = '1' then
          nx_ctrl_st <= WAIT_ST;
        end if;
      when DONE_ST => -- writting a new register
        if alltx_done = '0' then -- in case of resend = '1'
          nx_ctrl_st <= RSTCAM_ST;
        end if;
    end case;
  end process;

  P_cnt300ms: process(rst, clk)
  begin
    if rst = c_on then
      cnt300ms <= (others =>'0');
    elsif clk'event and clk='1' then
      if ena_cnt300ms = '0' then
        cnt300ms <= (others =>'0');
      else -- enabled
        if end300ms = '1' then
          cnt300ms <= (others =>'0');
        else
          cnt300ms <= cnt300ms + 1;
        end if;
      end if;
    end if;
  end process;

  end300ms <= '1' when cnt300ms = C_END300MS else '0';



end behav;
