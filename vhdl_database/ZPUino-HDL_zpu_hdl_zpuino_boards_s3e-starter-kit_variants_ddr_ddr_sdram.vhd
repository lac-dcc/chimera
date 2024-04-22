library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

entity ddr_sdram is
  generic (
    HIGH_BIT: integer := 25;
    MHZ: integer := 96;
    tOPD: time := 1.962 ns;
    tIPD: time := 0.956 ns
  );
  PORT (
    clk: in std_logic;
    clk270: in std_logic;
    clk90: in std_logic;
    clkddr:in std_logic;
    rst: in std_logic;

    DRAM_ADDR     : OUT   STD_LOGIC_VECTOR (12 downto 0);
    DRAM_BA       : OUT   STD_LOGIC_VECTOR (1 downto 0);
    DRAM_CAS_N    : OUT   STD_LOGIC;
    DRAM_CKE      : OUT   STD_LOGIC;
    DRAM_CLK      : OUT   STD_LOGIC;
    DRAM_CLK_N    : OUT   STD_LOGIC;
    DRAM_CS_N     : OUT   STD_LOGIC;
    DRAM_DQ       : INOUT STD_LOGIC_VECTOR(15 downto 0);
    DRAM_DQM      : OUT   STD_LOGIC_VECTOR(1 downto 0);
    DRAM_DQS      : INOUT STD_LOGIC_VECTOR(1 downto 0);
    DRAM_RAS_N    : OUT   STD_LOGIC;
    DRAM_WE_N     : OUT   STD_LOGIC;

    --wb_clk_i: in std_logic;
	 	--wb_rst_i: in std_logic;

    wb_dat_o: out std_logic_vector(31 downto 0);
    wb_dat_i: in std_logic_vector(31 downto 0);
    wb_adr_i: in std_logic_vector(31 downto 0);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_stall_o: out std_logic
   );
end entity;

architecture behave of ddr_sdram is

-- clock - 10.417ns

-- tMRD - 15ns    2
-- tRFC - 75ns    8
-- tRP  - 15ns    2
-- tREFI - 7.8us  748 (use 730)
-- tRAS - 120 ns  12
-- tRCD - 15ns    2
-- tRC - 60 ns    6

type state_type is (
  start,
  wait_200us,
  enable_cke,
  pre1,    -- wait tRP
  pre1_wait,
  lemr,    -- wait tMRD
  lemr_wait,
  lmr,     -- wait tMRD
  lmr_wait,
  pre2,    -- wait tRP
  pre2_wait,
  pre3,    -- wait tRP
  pre3_wait,
  ar1,     -- wait tRFC
  ar1_wait,
  ar2,     -- wait tRFC
  ar2_wait,
  dll_wait,
  ar3,     -- wait tRFC
  ar3_wait,
  idle,
  ract1,
  ract2,
  read1,
  read2,
  read3,
  read4,
  write,
  write2,
  await,
  wras,
  dr1,
  dr2
);

--signal DQ_i:  std_logic_vector(15 downto 0);
signal DQS_i, DQS_i_i: std_logic_vector(1 downto 0);
signal nWE_i: std_logic;
signal CKE_i: std_logic;
signal nCK_i: std_logic;
signal CK_i: std_logic;
signal nRAS_i: std_logic;
signal nCAS_i: std_logic;
signal BA_i: std_logic_vector(1 downto 0);
signal nCS_i: std_logic;
signal ADDR_i: std_logic_vector(12 downto 0);

signal not_clk, not_clk_ddr: std_logic;

constant COUNT_WAIT200US: integer := (MHZ*200)+1;
constant COUNT_REFRESH: integer := integer((real(MHZ)*7.8)-10.0);

constant CMD_DESELECT   : std_logic_vector(3 downto 0) := "1XXX";
constant CMD_NOP        : std_logic_vector(3 downto 0) := "0111";
constant CMD_LMR        : std_logic_vector(3 downto 0) := "0000";
constant CMD_ACTIVATE   : std_logic_vector(3 downto 0) := "0011";
constant CMD_READ       : std_logic_vector(3 downto 0) := "0101";
constant CMD_WRITE      : std_logic_vector(3 downto 0) := "0100";
constant CMD_PRECHARGE  : std_logic_vector(3 downto 0) := "0010";
constant CMD_BST        : std_logic_vector(3 downto 0) := "0110";
constant CMD_AR         : std_logic_vector(3 downto 0) := "0001";

type regs is record
  cke:    std_logic;
  ctrl:   std_logic_vector(3 downto 0);
  addr:   std_logic_vector(12 downto 0);
  reqaddr:std_logic_vector(HIGH_BIT downto 0);
  ba:     std_logic_vector(1 downto 0);
  reqba:  std_logic_vector(1 downto 0);
  cur_row:std_logic_vector(12 downto 0);
  write:  std_logic_vector(31 downto 0);
  wdata:  std_logic_vector(31 downto 0);
  state:  state_type;
  wait_count: integer;
  refresh_count: integer;
  enable_refresh: std_logic;
  enable_dqs:  std_logic;
  refresh_pending: std_logic;
  read_pending: std_logic;
  write_pending:std_logic;
  tristate: std_logic;
  tras_count: integer;
  dataq1,dataq2,dataq3,dataq4: std_logic;
  stall: std_logic;
end record;

constant LEMR_VAL: std_logic_vector(12 downto 0) :=  "0000000000000";
constant LMR_VAL:  std_logic_vector(12 downto 0) :=  "000010" & "010" & "0" & "001";

signal data_write, data_write_i: std_logic_vector(15 downto 0);
signal writeq1, writeq2: std_logic_vector(31 downto 0);
signal addr_row : std_logic_vector(12 downto 0);
signal addr_bank: std_logic_vector(1 downto 0);

--constant COLUMN_HIGH: integer := HIGH_BIT - addr_row'LENGTH - addr_bank'LENGTH - 1; -- last 1 means 16 bit width
signal addr_col : std_logic_vector(12 downto 0);
signal data_read: std_logic_vector(31 downto 0);
signal data_read_i: std_logic_vector(15 downto 0);

signal r,n: regs;

attribute IOB: string;
attribute IOB of nCS_i : signal is "true";
attribute IOB of nRAS_i : signal is "true";
attribute IOB of nCAS_i : signal is "true";
attribute IOB of nWE_i : signal is "true";
attribute IOB of ADDR_i : signal is "true";
attribute IOB of CKE_i : signal is "true";
attribute IOB of BA_i : signal is "true";

signal not_enable_dqs: std_logic;

begin

  DRAM_ADDR     <= transport ADDR_i after tOPD;
  DRAM_BA       <= transport BA_i after tOPD;
  DRAM_CAS_N    <= transport nCAS_i after tOPD;
  DRAM_CKE      <= transport CKE_i after tOPD;
  DRAM_CLK      <= transport CK_i after tOPD;
  DRAM_CLK_N    <= transport nCK_i after tOPD;
  DRAM_CS_N     <= transport nCS_i after tOPD;
  DRAM_DQM      <= (others => '0');
  DRAM_RAS_N    <= transport nRAS_i after tOPD;
  DRAM_WE_N     <= transport nWE_i after tOPD;

          
  nCS_i   <= r.ctrl(3);
  nRAS_i  <= r.ctrl(2);
  nCAS_i  <= r.ctrl(1);
  nWE_i   <= r.ctrl(0);
  ADDR_i  <= r.addr;
  CKE_i   <= r.cke;
  BA_i    <= r.ba;


  not_clk_ddr <= not clkddr;
  not_clk <= not clk;

  DRAM_DQ <= (others => 'Z') when r.tristate='1' else data_write_i;
  DRAM_DQS<= (others => 'Z') when r.tristate='1' else DQS_i_i;

  data_write_i <= transport data_write after tOPD;
  data_read_i  <= transport DRAM_DQ after tIPD;
  DQS_i_i <= transport DQS_i after tOPD;

  process(r.reqaddr)
  begin
    addr_bank <= r.reqaddr(25 downto 24);--HIGH_BIT downto (HIGH_BIT-addr_bank'LENGTH)+1);
    addr_row  <= r.reqaddr(23 downto 11);
    addr_col  <= (others => '0');
    addr_col(9 downto 0)  <= r.reqaddr(10 downto 2) & "0";
  end process;

process(clk, r, wb_dat_i,wb_adr_i,wb_we_i,wb_cyc_i,wb_stb_i,addr_bank,addr_row,addr_col,rst)
begin

  n <= r;

  wb_stall_o <= r.read_pending or r.write_pending;

  if r.tras_count/=0 then
    n.tras_count <= r.tras_count - 1;
  end if;

  n.dataq1 <= '0';
  n.dataq2 <= r.dataq1;
  n.dataq3 <= r.dataq2;
  n.dataq4 <= r.dataq3;

  n.stall <= '1';
  n.enable_dqs<='0';

  case r.state is
    when start =>
    when wait_200us =>
      if r.wait_count=0 then
        n.state <= enable_cke;
      else
        n.wait_count <= r.wait_count - 1;
      end if;

    when enable_cke =>
      n.state <= pre1;
      n.ba <= "00";
      n.addr(10) <= '1';
      n.tristate <= '0'; -- No more tristate, except when reading
    when pre1 =>
      n.state <= pre1_wait;

    when pre1_wait =>
      n.state <= lemr;
      n.addr  <= LEMR_VAL;
      n.ba    <= "01";

    when lemr =>
      n.state <= lemr_wait;

    when lemr_wait =>
      n.state <= lmr;
      n.addr  <= LMR_VAL;
      n.ba    <= "00";

    when lmr =>
      n.state <= lmr_wait;

    when lmr_wait =>
      n.state <= pre2;
      n.addr(10) <= '1';

    when pre2 =>
      n.state <= pre2_wait;

    when pre2_wait =>
      n.state <= ar1;

    when ar1 =>
      n.wait_count <= 6;
      n.state <= ar1_wait;

    when ar1_wait =>
      if r.wait_count=0 then
        n.state <= ar2;
      else
        n.wait_count <= r.wait_count - 1;
      end if;

    when ar2 =>
      --n.wait_count <= 6;
      n.state <= ar2_wait;

    when ar2_wait =>
      n.enable_refresh <= '1';
      n.refresh_count <= COUNT_REFRESH;
      --if r.wait_count=0 then
        n.state <= dll_wait;
        n.wait_count <= 200;
      --else
      --  n.wait_count <= r.wait_count - 1;
      --end if;

    when dll_wait =>
      if r.wait_count=0 then
        n.state <= idle;
      else
        n.wait_count <= r.wait_count - 1;
      end if;

    when ar3 =>
      n.wait_count <= 6;
      n.state <= ar3_wait;

    when ar3_wait =>
      if r.wait_count=0 then
        n.state <= idle;
      else
        n.wait_count <= r.wait_count - 1;
      end if;

    when pre3 =>
      n.tristate <= '0';
      n.state <= pre3_wait;

    when pre3_wait =>
      n.state <= idle;


    when idle =>                         -- Idle, all banks precharged
      if r.read_pending='1' or r.write_pending='1' then
        n.stall <= '1';
        n.state <= ract1;
        n.ba    <= addr_bank;
        n.addr  <= addr_row;
        n.wdata <= r.write;
        n.cur_row <= addr_row;
      end if;

      if r.refresh_pending='1' then
        n.refresh_pending <= '0';
        n.state <= ar3;
      end if;

    when ract1 =>
      n.state <= ract2;

    when ract2 =>
      n.tras_count <= 5;
      n.addr  <= addr_col;

      if r.read_pending='1' then
        n.state <= read1;
        n.ba <= addr_bank;
        n.addr <= addr_col;
        n.read_pending<=wb_cyc_i and wb_stb_i;

        if wb_cyc_i='1' and wb_stb_i='1' then
          n.reqaddr <= wb_adr_i(HIGH_BIT downto 0);
        end if;
      end if;

      if r.write_pending='1' then
        n.state <= write;
        n.ba <= addr_bank;
        n.addr <= addr_col;
        n.wdata <= r.write;

        if wb_cyc_i='1' and wb_stb_i='1' then
          n.reqaddr <= wb_adr_i(HIGH_BIT downto 0);
          n.write <= wb_dat_i;
        end if;

        n.write_pending<=wb_cyc_i and wb_stb_i;
      end if;

    when read1 =>
      n.tristate <= '1';
      n.dataq1 <= '1';
      n.ba <= addr_bank;
      n.addr <= addr_col;

      wb_stall_o<=r.refresh_pending;

      if r.refresh_pending='1' then
        n.state <= read2;
      else
        if wb_cyc_i='1' and wb_stb_i='1' and r.cur_row=addr_row and r.ba=addr_bank then
          n.reqaddr<=wb_adr_i(HIGH_BIT downto 0);
          n.read_pending<='1';
        else
          n.read_pending<='0';
        end if;
  
        if r.read_pending='0' then
          n.state <= read2;
        else
          if r.cur_row/=addr_row or r.ba/=addr_bank then
            n.state <= read2;
            wb_stall_o <= '1';
          end if;
        end if;
      end if;

    when read2 =>

      n.state <= read3;

    when read3 =>
      n.state <= read4;

    when read4 =>
      n.state <= idle;
      n.state <= pre3;

    when write =>
      n.enable_dqs <= '1';

      wb_stall_o<=r.refresh_pending;

      if r.refresh_pending='1' then
        n.state <= write2;
      else

        if wb_cyc_i='1' and wb_stb_i='1' and r.cur_row=addr_row and r.ba=addr_bank then
          n.write <= wb_dat_i;
          n.reqaddr<=wb_adr_i(HIGH_BIT downto 0);
          n.write_pending<='1';
        else
          n.write_pending<='0';
        end if;

        if r.write_pending='0' then
          n.state <= write2;
        else
          if r.cur_row/=addr_row or r.ba/=addr_bank then
            wb_stall_o<='1';
            n.state <= write2;
          else
            n.ba <= addr_bank;
            n.addr <= addr_col;
            n.wdata <= r.write;

          end if;
        end if;

      end if;
    when write2 =>
      n.tras_count <= 2; -- fix for tWR violation
      -- pre3 or idle?
      --if r.tras_count=0 then
      --  n.state <= pre3; -- this can violate tRAS
      --else
      n.enable_dqs <= '1';
      n.state <= wras;
      --end if;

    when wras =>
      if r.tras_count=0 then
        n.state <= pre3; -- this can violate tRAS
      end if;

    when others =>
  end case;

  if r.enable_refresh='1' then
    if r.refresh_count=0 then
      n.refresh_count <= COUNT_REFRESH;
      n.refresh_pending <= '1';
    else
      n.refresh_count <= r.refresh_count - 1;
    end if;

  end if;


  n.ctrl  <= r.ctrl;
  n.cke  <= '1';

  case n.state is
    when start =>       n.ctrl <= CMD_DESELECT; 
    when wait_200us =>  n.ctrl <= CMD_DESELECT; n.cke <= '0';
    when enable_cke =>  n.ctrl <= CMD_NOP;
    when pre1       =>  n.ctrl <= CMD_PRECHARGE;
    when pre1_wait  =>  n.ctrl <= CMD_NOP;
    when pre3       =>  n.ctrl <= CMD_PRECHARGE;
    when pre3_wait  =>  n.ctrl <= CMD_NOP;
    when lemr       =>  n.ctrl <= CMD_LMR;
    when lemr_wait  =>  n.ctrl <= CMD_NOP;
    when lmr        =>  n.ctrl <= CMD_LMR;
    when lmr_wait   =>  n.ctrl <= CMD_NOP;
    when pre2       =>  n.ctrl <= CMD_PRECHARGE;
    when pre2_wait  =>  n.ctrl <= CMD_NOP;
    when ar1        =>  n.ctrl <= CMD_AR;
    when ar1_wait   =>  n.ctrl <= CMD_NOP;
    when ar2        =>  n.ctrl <= CMD_AR;
    when ar2_wait   =>  n.ctrl <= CMD_NOP;
    when ar3        =>  n.ctrl <= CMD_AR;
    when ar3_wait   =>  n.ctrl <= CMD_NOP;
    when dll_wait   =>  n.ctrl <= CMD_NOP;
    when idle       =>  n.ctrl <= CMD_NOP;
    when ract1      =>  n.ctrl <= CMD_ACTIVATE;
    when ract2      =>  n.ctrl <= CMD_NOP;
    when read1      =>  n.ctrl <= CMD_READ;
    when read2      =>  n.ctrl <= CMD_NOP;
    when read3      =>  n.ctrl <= CMD_NOP;
    when read4      =>  n.ctrl <= CMD_NOP;
    when write      =>  n.ctrl <= CMD_WRITE;
    when write2     =>  n.ctrl <= CMD_NOP;
    when await      =>  n.ctrl <= CMD_NOP;
    when wras       =>  n.ctrl <= CMD_NOP;
    when others     =>  null;
  end case;

  if r.state=ract2 then
     wb_stall_o<='0';
  end if;

  if wb_stb_i='1' and wb_cyc_i='1' then
    if wb_we_i='1' then
      n.write_pending<='1';
      if r.write_pending='0' then
        n.write <= wb_dat_i;
        n.reqaddr<=wb_adr_i(HIGH_BIT downto 0);
      end if;
    else
      n.read_pending<='1';
      if r.read_pending='0' then
        n.reqaddr<=wb_adr_i(HIGH_BIT downto 0);
      end if;
      --n.write <= wb_dat_i;
    end if;
  end if;


  if rst='1' then
    n.state <= wait_200us;
    n.reqaddr <= (others => '0');
    n.reqba <= (others => '0');
    n.wait_count <= COUNT_WAIT200US;
    n.enable_refresh <= '0';
    n.refresh_pending <= '0';
    n.read_pending <= '0';
    n.write_pending <= '0';
    n.enable_dqs<='0';
    n.tristate <= '1';
  end if;

  if rising_edge(clk) then
    r <= n;
    writeq1 <= r.wdata;
  end if;

  if falling_edge(clk) then
    writeq2 <= writeq1;
  end if;

end process;

process(clk)
begin
  if rising_edge(clk) then
    if r.dataq3='1' then
      wb_dat_o <= data_read_i & data_read(31 downto 16);
      --data_read(15 downto 0) <= data_read_i;
    end if;
  end if;
  if falling_edge(clk) then
    if r.dataq3='1' then
      data_read(31 downto 16) <= data_read_i;
    end if;
  end if;
end process;

  wb_ack_o <= '1' when r.dataq4='1' or r.state=write else '0';

  dw: for i in 0 to 15 generate
  dwrff: ODDR2
    generic map (
      DDR_ALIGNMENT => "NONE",  
      INIT          => '0',
      SRTYPE        => "ASYNC") 
    port map (
      D0 => writeq1(i),
      D1 => writeq2(i+16),
      Q => data_write(i),
      C0 => clk270,
      C1 => clk90,
      CE => '1',--r.enable_dqs,
      R => '0',
      S => '0'
    );
  end generate;

  not_enable_dqs <= not r.enable_dqs;

  dqsg: for i in 0 to 1 generate
  dqs: ODDR2
    generic map (
      DDR_ALIGNMENT => "NONE",  
      INIT          => '0',
      SRTYPE        => "ASYNC") 
    port map (
      D0 => '1',--r.enable_dqs,
      D1 => '0',
      Q => DQS_i(i),
      C0 => clk,
      C1 => not_clk,
      CE => '1',--r.enable_dqs,
      R => not_enable_dqs,--rst,
      S => '0'
    );
  end generate;

  clock_p: ODDR2
    generic map (
      DDR_ALIGNMENT => "NONE",  
      INIT          => '0',
      SRTYPE        => "ASYNC") 
    port map (
      D0 => '1',
      D1 => '0',
      Q => CK_i,
      C0 => clkddr,
      C1 => not_clk_ddr,
      CE => '1',
      R => '0',
      S => '0'
    );

  clock_n: ODDR2
    generic map (
      DDR_ALIGNMENT => "NONE",  
      INIT          => '0',
      SRTYPE        => "ASYNC") 
    port map (
      D0 => '0',
      D1 => '1',
      Q => nCK_i,
      C0 => clkddr,
      C1 => not_clk_ddr,
      CE => '1',
      R => '0',
      S => '0'
    );



end behave;

