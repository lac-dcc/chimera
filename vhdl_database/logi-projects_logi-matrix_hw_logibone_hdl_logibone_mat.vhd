library ieee;
use ieee.std_logic_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library work ;
use work.logi_wishbone_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;


entity logibone_mat is
	port(
		OSC_FPGA : in std_logic ;
		GPMC_AD :   inout  std_logic_vector((16-1) downto 0);
		GPMC_CSN :  in std_logic;
		GPMC_OEN :  in std_logic;
		GPMC_WEN :  in std_logic;
		GPMC_ADVN :  in std_logic;
		GPMC_CLK :  in std_logic;
		LED :   out  std_logic_vector((2-1) downto 0);
		PMOD1 :   inout  std_logic_vector((8-1) downto 0);
		PMOD2 :   inout  std_logic_vector((8-1) downto 0);
		ARD :   inout  std_logic_vector((6-1) downto 0);
		PB :  in std_logic_vector((2-1) downto 0);
		SW :  in std_logic_vector((2-1) downto 0);
		ARD_SCL :   inout  std_logic;
		ARD_SDA :   inout  std_logic	
	);
end logibone_mat;

architecture structural of logibone_mat is
	
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

	signal gls_clk, gls_clk_buff, gls_reset, clk_locked, osc_buff, clkfb : std_logic ;

	signal Master_0_wbm_Intercon_0_wbs_0 : wishbone_bus;
	signal top_GPMC_CSN_Master_0_gpmc_csn_0 : std_logic;
	signal top_GPMC_CLK_Master_0_gpmc_clk_0 : std_logic;
	signal top_GPMC_OEN_Master_0_gpmc_oen_0 : std_logic;
	signal top_GPMC_WEN_Master_0_gpmc_wen_0 : std_logic;
	signal top_GPMC_ADVN_Master_0_gpmc_advn_0 : std_logic;
	signal top_GPMC_AD_Master_0_gpmc_ad_0 : std_logic_vector((16-1) downto 0);
	signal Intercon_0_wbm_MAT_0_wbs_0 : wishbone_bus;
	signal MAT_0_R_out_top_PMOD1_0 : std_logic;
	signal MAT_0_R_out_top_PMOD1_1 : std_logic;
	signal MAT_0_G_out_top_PMOD1_0 : std_logic;
	signal MAT_0_G_out_top_PMOD1_1 : std_logic;
	signal MAT_0_B_out_top_PMOD1_0 : std_logic;
	signal MAT_0_B_out_top_PMOD1_1 : std_logic;
	signal MAT_0_A_out_top_PMOD2_0 : std_logic_vector((4-1) downto 0);
	signal MAT_0_BLANK_out_top_PMOD2_0 : std_logic;
	signal MAT_0_LATCH_out_top_PMOD2_0 : std_logic;
	signal MAT_0_SCLK_out_top_PMOD2_0 : std_logic;

begin


gls_reset <= (NOT clk_locked); -- system reset while clock not locked



Master_0 : gpmc_wishbone_wrapper
generic map(sync => true) 
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	gpmc_ad(15 downto 0) =>  top_GPMC_AD_Master_0_gpmc_ad_0,

	gpmc_csn =>  top_GPMC_CSN_Master_0_gpmc_csn_0,

	gpmc_oen =>  top_GPMC_OEN_Master_0_gpmc_oen_0,

	gpmc_wen =>  top_GPMC_WEN_Master_0_gpmc_wen_0,

	gpmc_advn =>  top_GPMC_ADVN_Master_0_gpmc_advn_0,

	gpmc_clk =>  top_GPMC_CLK_Master_0_gpmc_clk_0,

	wbm_address =>  Master_0_wbm_Intercon_0_wbs_0.address,
	wbm_writedata =>  Master_0_wbm_Intercon_0_wbs_0.writedata,
	wbm_readdata =>  Master_0_wbm_Intercon_0_wbs_0.readdata,
	wbm_cycle =>  Master_0_wbm_Intercon_0_wbs_0.cycle,
	wbm_strobe =>  Master_0_wbm_Intercon_0_wbs_0.strobe,
	wbm_write =>  Master_0_wbm_Intercon_0_wbs_0.write,
	wbm_ack =>  Master_0_wbm_Intercon_0_wbs_0.ack	
);

Intercon_0 : wishbone_intercon
generic map(
memory_map =>  (0 => "000000XXXXXXXXXX")
)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	wbs_address =>  Master_0_wbm_Intercon_0_wbs_0.address,
	wbs_writedata =>  Master_0_wbm_Intercon_0_wbs_0.writedata,
	wbs_readdata =>  Master_0_wbm_Intercon_0_wbs_0.readdata,
	wbs_cycle =>  Master_0_wbm_Intercon_0_wbs_0.cycle,
	wbs_strobe =>  Master_0_wbm_Intercon_0_wbs_0.strobe,
	wbs_write =>  Master_0_wbm_Intercon_0_wbs_0.write,
	wbs_ack =>  Master_0_wbm_Intercon_0_wbs_0.ack,

	wbm_address(0) =>  Intercon_0_wbm_MAT_0_wbs_0.address,
	wbm_writedata(0) =>  Intercon_0_wbm_MAT_0_wbs_0.writedata,
	wbm_readdata(0) =>  Intercon_0_wbm_MAT_0_wbs_0.readdata,
	wbm_cycle(0) =>  Intercon_0_wbm_MAT_0_wbs_0.cycle,
	wbm_strobe(0) =>  Intercon_0_wbm_MAT_0_wbs_0.strobe,
	wbm_write(0) =>  Intercon_0_wbm_MAT_0_wbs_0.write,
	wbm_ack(0) =>  Intercon_0_wbm_MAT_0_wbs_0.ack	
);

MAT_0 : wishbone_led_matrix_ctrl
generic map(
nb_panels => 1
,
bits_per_color => 4
)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	wbs_address =>  Intercon_0_wbm_MAT_0_wbs_0.address,
	wbs_writedata =>  Intercon_0_wbm_MAT_0_wbs_0.writedata,
	wbs_readdata =>  Intercon_0_wbm_MAT_0_wbs_0.readdata,
	wbs_cycle =>  Intercon_0_wbm_MAT_0_wbs_0.cycle,
	wbs_strobe =>  Intercon_0_wbm_MAT_0_wbs_0.strobe,
	wbs_write =>  Intercon_0_wbm_MAT_0_wbs_0.write,
	wbs_ack =>  Intercon_0_wbm_MAT_0_wbs_0.ack,

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



-- Connecting inputs
top_GPMC_CSN_Master_0_gpmc_csn_0 <= GPMC_CSN;
top_GPMC_OEN_Master_0_gpmc_oen_0 <= GPMC_OEN;
top_GPMC_WEN_Master_0_gpmc_wen_0 <= GPMC_WEN;
top_GPMC_ADVN_Master_0_gpmc_advn_0 <= GPMC_ADVN;
top_GPMC_CLK_Master_0_gpmc_clk_0 <= GPMC_CLK;
-- <= PB;
-- <= SW;

-- Connecting outputs
LED(1 downto 0) <= (others => 'Z');

-- Connecting inouts

GPMC_AD(15 downto 0) <= top_GPMC_AD_Master_0_gpmc_ad_0;
--top_GPMC_AD_Master_0_gpmc_ad_0 <= GPMC_AD(15 downto 0);



PMOD1(3) <= 'Z';
--'Z' <= PMOD1(3);


PMOD1(7) <= 'Z';
--'Z' <= PMOD1(7);

PMOD2(7) <= 'Z';
--'Z' <= PMOD2(7);


ARD(5 downto 0) <= (others => 'Z');
--(others => 'Z') <= ARD(5 downto 0);


ARD_SCL <= 'Z';
--'Z' <= ARD_SCL;


ARD_SDA <= 'Z';
--'Z' <= ARD_SDA;






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
      CLKOUT0 => gls_clk_buff,      CLKOUT1 => open,
      CLKOUT2 => open,      CLKOUT3 => open,
      CLKOUT4 => open,      CLKOUT5 => open,
      LOCKED  => clk_locked,  -- 1-bit output: PLL_BASE lock status output
      CLKFBIN => clkfb, -- 1-bit input: Feedback clock input
      CLKIN   => osc_buff,  -- 1-bit input: Clock input
      RST     => '0'    -- 1-bit input: Reset input
   );

    -- Buffering of clocks
	BUFG_1 : BUFG port map (O => osc_buff,    I => OSC_FPGA);
	BUFG_2 : BUFG port map (O => gls_clk,    I => gls_clk_buff);
end structural ;
