-- </doc master_fifo.vhd
--
-- FIFO for use in center fpga.
-- doc/>

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity master_fifo is

  generic (
    cr_address : unsigned := X"00";
    tr_address : unsigned := X"00");

  port (
    input     : in    std_logic_vector(127 downto 0);
    index_in  : in    std_logic;        -- 10ms
    onesec_in : in    std_logic;
    tensec_in : in    std_logic;
    wr_clock  : in    std_logic;
    spare_in  : in    std_logic;
    corr_tick : in    std_logic;        -- 10ms time from correlator
    rd_clock  : in    std_logic;
    lock      : in    std_logic;        -- all clocks locked.
    d         : inout std_logic_vector(7 downto 0);  -- m&c controls
    cs        : in    std_logic;
    wrstb     : in    std_logic;
    rdstb     : in    std_logic;
    sel       : in    std_logic_vector(7 downto 0);
    output    : out   std_logic_vector(127 downto 0);
    index     : out   std_logic;
    onesec    : out   std_logic;
    tensec    : out   std_logic;
    spare     : out   std_logic);

end master_fifo;

architecture behavioral of master_fifo is

  component ram_2port
    port
      (
        data      : in  std_logic_vector (131 downto 0);
        rdaddress : in  std_logic_vector (3 downto 0);
        rdclock   : in  std_logic;
        wraddress : in  std_logic_vector (3 downto 0);
        wrclock   : in  std_logic;
        wren      : in  std_logic := '1';
        q         : out std_logic_vector (131 downto 0)
        );
  end component;

  subtype counter_t is unsigned(3 downto 0);
  subtype time_ctr_t is unsigned(23 downto 0);
  signal  time_counter  : time_ctr_t;
  signal  time_register : std_logic_vector(23 downto 0);
  signal  time_hold     : std_logic_vector(23 downto 0);
  signal  indexi        : std_logic;
  signal  read_count    : counter_t;
  signal  read_inc1     : counter_t;
  signal  read_inc2     : counter_t;
  signal  write_count   : counter_t;
  signal  wr_zero       : std_logic;
  signal  wz_chain      : std_logic_vector(7 downto 0);
  signal  lock_chain    : std_logic_vector(2 downto 0);
  signal  lock_edge     : std_logic;
  signal  cr_select     : std_logic;
  signal  cr_read       : std_logic;
  signal  cr_write      : std_logic;
  signal  tr_select     : std_logic;
  signal  tr_read       : std_logic;
  signal  tr_edge       : std_logic;
  signal  tr_rsel       : unsigned(1 downto 0);
  signal  init_cmd      : std_logic;    -- m&c command
  signal  init_cmdp     : std_logic;    -- reclocked.
  signal  adv_cmd       : std_logic;    -- advance read pointer
  signal  ret_cmd       : std_logic;    -- retard read pointer
  signal  adv_pipe      : std_logic_vector(3 downto 0);
  signal  ret_pipe      : std_logic_vector(3 downto 0);
  signal  advance       : std_logic;    -- advance read address
  signal  retard        : std_logic;    -- retard read address
  signal  cmd_done      : std_logic;    -- command has been executed.
  signal  init_done     : std_logic;
  signal  zero_rc       : std_logic;    -- zero read counter.
  signal  init_rc       : std_logic;
  signal  time_ready    : std_logic;
  signal  wr_chain      : std_logic_vector(2 downto 0);
  signal  dummy         : std_logic_vector(131 downto 0);

begin  -- behavioral

  -- the write counter just does its thing.
  process(wr_clock)
  begin
    if wr_clock'event and wr_clock = '1' then
      write_count <= write_count + 1;
    end if;
  end process;

  wr_zero   <= '1' when write_count = 0 else '0';
  lock_edge <= lock_chain(1) and not lock_chain(2);

  -- Reclock and delay the pulse indicating write counter passes zero.
  -- this is used to initialize the read pointer.
  -- lock_chain is used to detect a rising edge on the lock inputs to determine
  -- when to initialize the read counter.
  process(rd_clock)
  begin
    if rd_clock'event and rd_clock = '0' then
      wz_chain   <= wz_chain(wz_chain'left-1 downto 0) & wr_zero;
      lock_chain <= lock_chain(1 downto 0) & lock;
      init_cmdp  <= init_cmd;
    end if;
  end process;

  -- read count initialization combinitorial logic.
  init_rc   <= init_cmdp or lock_edge;
  zero_rc   <= init_rc and wz_chain(wz_chain'left);
  init_done <= zero_rc;


  -----------------------------------------------------------------------------
  -- the read_counter in all its glory.....
  --

  read_inc1 <= read_count + 1;
  read_inc2 <= read_count + 2;

  process(rd_clock)
  begin
    if rd_clock'event and rd_clock = '1' then
      if zero_rc = '1' then
        read_count <= (others => '0');
      elsif advance = '1' then
        read_count <= read_inc2;
      elsif retard = '1' then
        read_count <= read_count;
      else
        read_count <= read_inc1;
      end if;
    end if;
  end process;

  -- M&C control bits.
  -- These clear on execute.

  cr_select <= '1' when unsigned(sel) = cr_address else '0';
  tr_select <= '1' when unsigned(sel) = tr_address else '0';
  cmd_done  <= adv_pipe(3) or ret_pipe(3) or init_done;

  cr_write <= cr_select and not cs;

  process(wrstb, cmd_done)
  begin
    if cmd_done = '1' then
      init_cmd <= '0';
      adv_cmd  <= '0';
      ret_cmd  <= '0';
    elsif wrstb'event and wrstb = '1' then
      if cr_write = '1' then
        init_cmd <= d(0);
        adv_cmd  <= d(2);
        ret_cmd  <= d(1);
      end if;
    end if;
  end process;

  advance <= adv_pipe(1) and not adv_pipe(2);
  retard  <= ret_pipe(1) and not ret_pipe(2);

  process(rd_clock)
  begin
    if rd_clock'event and rd_clock = '1' then
      adv_pipe <= adv_pipe(2 downto 0) & adv_cmd;
      ret_pipe <= ret_pipe(2 downto 0) & ret_cmd;
    end if;
  end process;

  -- auxillary functionality follows.
  -- To align the three channels...
  -- All channels get their fifos initialized with the read pointer half the
  -- fifo behind the write pointer (4 clocks). The master channel stays there.
  -- Each channel has this counter that counts the clocks between the
  -- correlator 10 ms tick and the intex pulse coming out of the fifo memory.
  -- CMIB software compares these numbers and advances or retards the pointers
  -- in the slave channels to make them the same.
  --
  -- The time between the two pulses is determined by the delay of the sync
  -- pulse to the antenna, the data transmission delay time and assorded
  -- encoding delays. This should be a few microseconds. The time between time
  -- pulses is 10ms. This is some 640000 clocks. This fits into a 20 bit
  -- counter. 24 bits are used to because its easy and might help with
  -- debugging.
  --
  --

  process(rd_clock)
  begin
    if rd_clock'event and rd_clock = '1' then
      if corr_tick = '1' then
        time_counter <= (others => '0');
      else
        time_counter <= time_counter + 1;
      end if;
    end if;
  end process;

  process(rd_clock)
  begin
    if rd_clock'event and rd_clock = '1' then
      if indexi = '1' then
        time_register <= std_logic_vector(time_counter);
      end if;
    end if;
  end process;

  process(rd_clock, tr_edge)
  begin
    if tr_edge = '1' then
      time_ready <= '0';
    elsif rd_clock'event and rd_clock = '1' then
      if indexi = '1' then
        time_ready <= '1';
      end if;
    end if;
  end process;

  -- m&c readout of the above...
  -- load holding register when first tr_select for reading this...
  process(rd_clock)
  begin
    if rd_clock'event and rd_clock = '1' then
      wr_chain <= wr_chain(1 downto 0) & tr_select;
    end if;
  end process;

  tr_edge <= wr_chain(1) and not wr_chain(2);

  process(rd_clock)
  begin
    if rd_clock'event and rd_clock = '1' then
      if tr_edge = '1' then
        time_hold <= time_register;
      end if;
    end if;
  end process;

  process(rdstb, tr_select)
  begin
    if tr_select = '0' then
      tr_rsel <= (others => '0');
    elsif rdstb'event and rdstb = '1' then
      if tr_select = '1' and cs = '0' then
        tr_rsel <= tr_rsel + 1;
      end if;
    end if;
  end process;

  tr_read <= tr_select and not cs and not rdstb;
  cr_read <= cr_select and not cs and not rdstb;

  with tr_read & tr_rsel select
    d <=
    time_hold(23 downto 16) when "100",
    time_hold(15 downto 8)  when "101",
    time_hold(7 downto 0)   when "110",
    "ZZZZZZZZ"              when others;

--  d <= time_hold(23 downto 16) when tr_rsel = "00" and tr_read = '1' else
--       time_hold(15 downto 8) when tr_rsel = "01" and tr_read = '1' else
--       time_hold(7 downto 0)  when tr_rsel = "10" and tr_read = '1' else
--       "ZZZZZZZZ";

  d <= "0000000" & time_ready when cr_read = '1' else "ZZZZZZZZ";

  index <= indexi;

  indexi <= dummy(131);
  onesec <= dummy(130);
  tensec <= dummy(129);
  spare  <= dummy(128);
  output <= dummy(127 downto 0);

  u1 : ram_2port port map (
    data      => index_in & onesec_in & tensec_in & spare_in & input,
    rdaddress => std_logic_vector(read_count),
    rdclock   => rd_clock,
    wraddress => std_logic_vector(write_count),
    wrclock   => wr_clock,
    wren      => '1',
    q         => dummy);

end behavioral;
