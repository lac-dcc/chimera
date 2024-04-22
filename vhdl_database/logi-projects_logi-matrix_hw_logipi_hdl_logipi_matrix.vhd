library ieee;
use ieee.std_logic_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library work ;
use work.logi_wishbone_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;

entity logipi_matrix is
	port(
		OSC_FPGA : in std_logic ;
		MOSI :  in std_logic;
		MISO :   out  std_logic;
		SS :  in std_logic;
		SCK :  in std_logic;
		LED :   out  std_logic_vector((2-1) downto 0);
		PMOD1 :   out  std_logic_vector((8-1) downto 0);
		PMOD2 :   out  std_logic_vector((8-1) downto 0);
		PMOD3 :   out  std_logic_vector((8-1) downto 0);
		PMOD4 :   out  std_logic_vector((8-1) downto 0);
		PB :  in std_logic_vector((2-1) downto 0);
		SW :  in std_logic_vector((2-1) downto 0)	
	);
end logipi_matrix;

architecture structural of logipi_matrix is
	component wishbone_led_matrix_ctrl is
		generic(wb_size : positive := 16;
			  clk_div : positive := 10;
			  nb_panels : positive := 1 ;
			  bits_per_color : INTEGER RANGE 1 TO 4 := 4 ;
			  expose_step : positive := 191
			  );
		port(
			  -- Syscon signals
			  gls_reset    : in std_logic ;
			  gls_clk      : in std_logic ;
			  -- Wishbone signals
			  wbs_address       : in std_logic_vector(15 downto 0) ;
			  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
			  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
			  wbs_strobe    : in std_logic ;
			  wbs_cycle      : in std_logic ;
			  wbs_write     : in std_logic ;
			  wbs_ack       : out std_logic;
			  
			  
			  SCLK_OUT : out std_logic ;
			  BLANK_OUT : out std_logic ;
			  LATCH_OUT : out std_logic ;
			  A_OUT : out std_logic_vector(3 downto 0);
			  R_out : out std_logic_vector(1 downto 0);
			  G_out : out std_logic_vector(1 downto 0);
			  B_out : out std_logic_vector(1 downto 0)
	);
	end component;


	type wishbone_bus is
	record
		address : std_logic_vector(15 downto 0);
		writedata : std_logic_vector(15 downto 0);
		readdata : std_logic_vector(15 downto 0);
		cycle: std_logic;
		write : std_logic;
		strobe : std_logic;
		ack : std_logic;
	end record;

	signal gls_clk, gls_reset, clk_locked, osc_buff, clkfb : std_logic ;

	signal Master_0_wbm_Intercon_0_wbs : wishbone_bus;
	signal Intercon_0_wbm_MAT_0_wbs : wishbone_bus;
	signal Intercon_0_wbm_MAT_1_wbs : wishbone_bus;


begin


gls_reset <= (NOT clk_locked); -- system reset while clock not locked



Master_0 : spi_wishbone_wrapper
-- no generics
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

mosi =>  MOSI
,

miso =>  MISO
,

ss =>  SS
,

sck =>  SCK
,

wbm_address =>  Master_0_wbm_Intercon_0_wbs.address,
wbm_writedata =>  Master_0_wbm_Intercon_0_wbs.writedata,
wbm_readdata =>  Master_0_wbm_Intercon_0_wbs.readdata,
wbm_cycle =>  Master_0_wbm_Intercon_0_wbs.cycle,
wbm_strobe =>  Master_0_wbm_Intercon_0_wbs.strobe,
wbm_write =>  Master_0_wbm_Intercon_0_wbs.write,
wbm_ack =>  Master_0_wbm_Intercon_0_wbs.ack	
);

Intercon_0 : wishbone_intercon
generic map(
--memory_map => (0 => "00XXXXXXXXXXXXXX")
memory_map => ("000XXXXXXXXXXXXX", -- panel 0 mapped at address 0x0000
"001XXXXXXXXXXXXX") -- second panel mapped at address 0x2000
)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

wbs_address =>  Master_0_wbm_Intercon_0_wbs.address,
wbs_writedata =>  Master_0_wbm_Intercon_0_wbs.writedata,
wbs_readdata =>  Master_0_wbm_Intercon_0_wbs.readdata,
wbs_cycle =>  Master_0_wbm_Intercon_0_wbs.cycle,
wbs_strobe =>  Master_0_wbm_Intercon_0_wbs.strobe,
wbs_write =>  Master_0_wbm_Intercon_0_wbs.write,
wbs_ack =>  Master_0_wbm_Intercon_0_wbs.ack,

wbm_address(0) =>  Intercon_0_wbm_MAT_0_wbs.address,
wbm_address(1) =>  Intercon_0_wbm_MAT_1_wbs.address,

wbm_writedata(0) =>  Intercon_0_wbm_MAT_0_wbs.writedata,
wbm_writedata(1) =>  Intercon_0_wbm_MAT_1_wbs.writedata,

wbm_readdata(0) =>  Intercon_0_wbm_MAT_0_wbs.readdata,
wbm_readdata(1) =>  Intercon_0_wbm_MAT_1_wbs.readdata,

wbm_cycle(0) =>  Intercon_0_wbm_MAT_0_wbs.cycle,
wbm_cycle(1) =>  Intercon_0_wbm_MAT_1_wbs.cycle,

wbm_strobe(0) =>  Intercon_0_wbm_MAT_0_wbs.strobe,
wbm_strobe(1) =>  Intercon_0_wbm_MAT_1_wbs.strobe,

wbm_write(0) =>  Intercon_0_wbm_MAT_0_wbs.write,
wbm_write(1) =>  Intercon_0_wbm_MAT_1_wbs.write,

wbm_ack(0) =>  Intercon_0_wbm_MAT_0_wbs.ack,
wbm_ack(1) =>  Intercon_0_wbm_MAT_1_wbs.ack

);

MAT_0 : entity work.wishbone_led_matrix_ctrl
generic map(
			  nb_panels => 4,
			  bits_per_color => 4
			  )
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

wbs_address =>  Intercon_0_wbm_MAT_0_wbs.address,
wbs_writedata =>  Intercon_0_wbm_MAT_0_wbs.writedata,
wbs_readdata =>  Intercon_0_wbm_MAT_0_wbs.readdata,
wbs_cycle =>  Intercon_0_wbm_MAT_0_wbs.cycle,
wbs_strobe =>  Intercon_0_wbm_MAT_0_wbs.strobe,
wbs_write =>  Intercon_0_wbm_MAT_0_wbs.write,
wbs_ack =>  Intercon_0_wbm_MAT_0_wbs.ack,

R_OUT(0) => PMOD1(0),
R_OUT(1) =>PMOD1(4),
G_OUT(0) =>PMOD1(1),
G_OUT(1) =>PMOD1(5),
B_OUT(0) =>PMOD1(2),
B_OUT(1) =>PMOD1(6),

A_OUT => PMOD2(3 downto 0),
BLANK_OUT => PMOD2(4),
LATCH_OUT => PMOD2(5),
SCLK_OUT => PMOD2(6)

);


MAT_1 : entity work.wishbone_led_matrix_ctrl
generic map(
			  nb_panels => 4,
			  bits_per_color => 4
			  )
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

wbs_address =>  Intercon_0_wbm_MAT_1_wbs.address,
wbs_writedata =>  Intercon_0_wbm_MAT_1_wbs.writedata,
wbs_readdata =>  Intercon_0_wbm_MAT_1_wbs.readdata,
wbs_cycle =>  Intercon_0_wbm_MAT_1_wbs.cycle,
wbs_strobe =>  Intercon_0_wbm_MAT_1_wbs.strobe,
wbs_write =>  Intercon_0_wbm_MAT_1_wbs.write,
wbs_ack =>  Intercon_0_wbm_MAT_1_wbs.ack,

R_OUT(0) => PMOD3(0),
R_OUT(1) =>PMOD3(4),
G_OUT(0) =>PMOD3(1),
G_OUT(1) =>PMOD3(5),
B_OUT(0) =>PMOD3(2),
B_OUT(1) =>PMOD3(6),

A_OUT => PMOD4(3 downto 0),
BLANK_OUT => PMOD4(4),
LATCH_OUT => PMOD4(5),
SCLK_OUT => PMOD4(6)

);



LED <= PB ;
PMOD1(3) <= '0' ;
PMOD1(7) <= '0' ;
PMOD2(7) <= '0' ;

PMOD3(3) <= '0' ;
PMOD3(7) <= '0' ;
PMOD4(7) <= '0' ;




-- system clock generation

PLL_BASE_inst : PLL_BASE generic map (
      BANDWIDTH      => "OPTIMIZED",        -- "HIGH", "LOW" or "OPTIMIZED" 
      CLKFBOUT_MULT  => 16 ,                 -- Multiply value for all CLKOUT clock outputs (1-64)
      CLKFBOUT_PHASE => 0.0,                -- Phase offset in degrees of the clock feedback output (0.0-360.0).
      CLKIN_PERIOD   => 20.00,              -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
      CLKOUT0_DIVIDE => 8,       CLKOUT1_DIVIDE => 1,
      CLKOUT2_DIVIDE => 1,       CLKOUT3_DIVIDE => 1,
      CLKOUT4_DIVIDE => 1,       CLKOUT5_DIVIDE => 1,
      -- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT# clock output (0.01-0.99).
      CLKOUT0_DUTY_CYCLE => 0.5, CLKOUT1_DUTY_CYCLE => 0.5,
      CLKOUT2_DUTY_CYCLE => 0.5, CLKOUT3_DUTY_CYCLE => 0.5,
      CLKOUT4_DUTY_CYCLE => 0.5, CLKOUT5_DUTY_CYCLE => 0.5,
      -- CLKOUT0_PHASE - CLKOUT5_PHASE: Output phase relationship for CLKOUT# clock output (-360.0-360.0).
      CLKOUT0_PHASE => 0.0,      CLKOUT1_PHASE => 0.0, -- Capture clock
      CLKOUT2_PHASE => 0.0,      CLKOUT3_PHASE => 0.0,
      CLKOUT4_PHASE => 0.0,      CLKOUT5_PHASE => 0.0,
      
      CLK_FEEDBACK => "CLKFBOUT",           -- Clock source to drive CLKFBIN ("CLKFBOUT" or "CLKOUT0")
      COMPENSATION => "SYSTEM_SYNCHRONOUS", -- "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "EXTERNAL" 
      DIVCLK_DIVIDE => 1,                   -- Division value for all output clocks (1-52)
      REF_JITTER => 0.1,                    -- Reference Clock Jitter in UI (0.000-0.999).
      RESET_ON_LOSS_OF_LOCK => FALSE        -- Must be set to FALSE
   ) port map (
      CLKFBOUT => clkfb, -- 1-bit output: PLL_BASE feedback output
      -- CLKOUT0 - CLKOUT5: 1-bit (each) output: Clock outputs
      CLKOUT0 => gls_clk,      CLKOUT1 => open,
      CLKOUT2 => open,      CLKOUT3 => open,
      CLKOUT4 => open,      CLKOUT5 => open,
      LOCKED  => clk_locked,  -- 1-bit output: PLL_BASE lock status output
      CLKFBIN => clkfb, -- 1-bit input: Feedback clock input
      CLKIN   => osc_buff,  -- 1-bit input: Clock input
      RST     => '0'    -- 1-bit input: Reset input
   );

    -- Buffering of clocks
	BUFG_1 : BUFG port map (O => osc_buff,    I => OSC_FPGA);

end structural ;