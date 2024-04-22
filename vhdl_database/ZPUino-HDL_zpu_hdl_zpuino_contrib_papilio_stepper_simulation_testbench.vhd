library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb is
end entity;


architecture sim of tb is

  constant period: time := 10 ns;

  signal clk: std_logic := '1';
  signal rst: std_logic := '0';

  component papilio_stepper is
	Generic (
		--wing_slot_g : std_logic_vector(3 downto 0) := x"0";
		timebase_g	: std_logic_vector(15 downto 0) := (others => '0');
		period_g		: std_logic_vector(15 downto 0) := (others => '0')
	);
  port (
    wb_clk_i:   in  std_logic;                     -- Wishbone clock
    wb_rst_i:   in  std_logic;                     -- Wishbone reset (synchronous)
    wb_dat_o:   out std_logic_vector(31 downto 0); -- Wishbone data output (32 bits)
    wb_dat_i:   in  std_logic_vector(31 downto 0); -- Wishbone data input  (32 bits)
    wb_adr_i:   in  std_logic_vector(26 downto 2); -- Wishbone address input  (32 bits)
    wb_we_i:    in  std_logic;                     -- Wishbone write enable signal
    wb_cyc_i:   in  std_logic;                     -- Wishbone cycle signal
    wb_stb_i:   in  std_logic;                     -- Wishbone strobe signal
    wb_ack_o:   out std_logic;                      -- Wishbone acknowledge out signal
	
	-- External connections
	st_home		: in  std_logic;
	st_dir		: out std_logic;
	st_ms2		: out std_logic;
	st_ms1		: out std_logic;
	st_rst		: out std_logic;
	st_step		: out std_logic;
	st_enable	: out std_logic;
	st_sleep	: out std_logic;
	-- IRQ
	st_irq     	: out std_logic	
  );
  end component;

  signal wb_dat_o:   std_logic_vector(31 downto 0);
  signal wb_dat_i:   std_logic_vector(31 downto 0);
  signal wb_adr_i:   std_logic_vector(26 downto 2);
  signal wb_we_i:    std_logic := '0';
  signal wb_cyc_i:   std_logic := '0';
  signal wb_stb_i:   std_logic := '0';
  signal wb_ack_o:   std_logic;
	signal st_home		: std_logic;
	signal st_dir		: std_logic;
	signal st_ms2		: std_logic;
	signal st_ms1		: std_logic;
	signal st_rst		: std_logic;
	signal st_step		: std_logic;
	signal st_enable	: std_logic;
	signal st_sleep	: std_logic;
	signal st_irq     	: std_logic := '0';

  constant REG_CONTROL:   std_logic_vector(31 downto 0) := x"00000000";
  constant REG_TIMEBASE:  std_logic_vector(31 downto 0) := x"00000004";
  constant REG_PERIOD:    std_logic_vector(31 downto 0) := x"00000008";
  constant REG_STEPCNT:   std_logic_vector(31 downto 0) := x"0000000C";
  constant REG_STEPS:     std_logic_vector(31 downto 0) := x"00000010";

  signal wb_dat_o_dly:   std_logic_vector(31 downto 0);

begin

  clk <= not clk after period/2;

  -- Reset
  process
  begin
    wait for 5 ns;
    rst <= '1';
    wait for 20 ns;
    rst <= '0';
    wait;
  end process;


  stepper: papilio_stepper
	generic map (
		timebase_g	=> "0000000000000000",
		period_g		=> "0000000000000000"
	)
  port map (
    wb_clk_i    => clk,
    wb_rst_i    => rst,
    wb_dat_o    => wb_dat_o,
    wb_dat_i    => wb_dat_i,
    wb_adr_i    => wb_adr_i,
    wb_we_i     => wb_we_i,
    wb_cyc_i    => wb_cyc_i,
    wb_stb_i    => wb_stb_i,
    wb_ack_o    => wb_ack_o,
	
	-- External connections
	  st_home		  => st_home,
	  st_dir		  => st_dir,
	  st_ms2		  => st_ms2,
	  st_ms1		  => st_ms1,
	  st_rst		  => st_rst,
	  st_step		  => st_step,
	  st_enable	  => st_enable,
	  st_sleep	  => st_sleep,
  	st_irq     	=> st_irq
  );


  -- Delayed read
  wb_dat_o_dly<=transport wb_dat_o after 1 ps;

  process
    procedure wbwrite(a: in std_logic_vector(31 downto 0); d: in std_logic_vector(31 downto 0) ) is
    begin
      wb_cyc_i<='1';
      wb_stb_i<='1';
      wb_we_i<='1';
      wb_dat_i<=d;
      wb_adr_i<=a(26 downto 2);
      wait until rising_edge(clk);
      wait until wb_ack_o='1';
      wait until rising_edge(clk);
      wb_cyc_i<='0';
      wb_stb_i<='0';
      wb_we_i <='0';
    end procedure;

    procedure wbread( a: in std_logic_vector(31 downto 0); d: out std_logic_vector(31 downto 0)) is
    begin
      wb_cyc_i<='1';
      wb_stb_i<='1';
      wb_we_i<='0';
      wb_adr_i<=a(26 downto 2);
      wait until rising_edge(clk);
      wait until wb_ack_o='1';
      wait until rising_edge(clk);
      d := wb_dat_o_dly;
      wb_cyc_i<='0';
      wb_stb_i<='0';
      wb_we_i <='0';
    end procedure;

    variable r : std_logic_vector(31 downto 0);

  begin
    
    wait until rst='1';
    wait until rst='0';
    wait until rising_edge(clk);

    -- Test register R/W

--    wbwrite( REG_CONTROL, x"0000beef");
--    wbread( REG_CONTROL, r );   assert( r(8 downto 0) = x"ef");
--
--    wbwrite( REG_TIMEBASE, x"0000cafe");
--    wbread( REG_TIMEBASE, r );  assert( r(15 downto 0) = x"cafe");
--    wbread( REG_CONTROL, r );   assert( r(8 downto 0) = x"ef");

	-- Run stepper
		wbwrite( REG_TIMEBASE, x"00000008");
		wbwrite( REG_PERIOD, x"000007D0");
		wbwrite( REG_STEPCNT,  x"00000005");
		wbwrite( REG_CONTROL, x"000001F0");	--Interupt when step count reaches REG_STEPCNT
--		wbwrite( REG_CONTROL, x"000001B0");	--Half Period Interupt
		

--    wait for 200 ns;
--    report "Finsihed" severity failure;
  end process;


end sim;
