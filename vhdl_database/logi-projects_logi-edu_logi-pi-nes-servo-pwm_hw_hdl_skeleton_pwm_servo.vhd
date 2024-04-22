library ieee;
use ieee.std_logic_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library work ;
use work.logi_wishbone_pack.all ;
use work.logi_wishbone_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;


entity skeleton_nes_servo_pwm is
	port(
		OSC_FPGA : in std_logic ;
		MOSI :  in std_logic;
		MISO :   out  std_logic;
		SS :  in std_logic;
		SCK :  in std_logic;
		LED :   out  std_logic_vector((2-1) downto 0);
		PMOD1 :   inout  std_logic_vector((8-1) downto 0);
		PMOD2 :   inout  std_logic_vector((8-1) downto 0);
		PMOD3 :   inout  std_logic_vector((8-1) downto 0);
		PMOD4 :   inout  std_logic_vector((8-1) downto 0);
		--PMOD4 :   inout  std_logic_vector(6 downto 0);
		--PMOD4_7: in std_logic;
		ARD :   inout  std_logic_vector((6-1) downto 0);
		PB :  in std_logic_vector((2-1) downto 0);
		SW :  in std_logic_vector((2-1) downto 0)	
	);
end skeleton_nes_servo_pwm;

architecture structural of skeleton_nes_servo_pwm is
	
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
	signal top_MOSI_Master_0_mosi : std_logic;
	signal top_SS_Master_0_ss : std_logic;
	signal top_SCK_Master_0_sck : std_logic;
	signal Master_0_miso_top_MISO : std_logic;
	signal Intercon_0_wbm_pwm_wbs : wishbone_bus;
	signal servo_servos_top_PMOD4 : std_logic_vector((2-1) downto 0);
	signal pwm_pwm_out_top_LED : std_logic_vector((2-1) downto 0);
	
	signal Intercon_0_wbm_servo_wbs : wishbone_bus;
	signal Intercon_0_wbm_nes_wbs : wishbone_bus;
	
	signal nes1_data_out,nes2_data_out: std_logic_vector(7 downto 0);
	signal nes_lat, nes1_dat, nes2_dat, nes_clk: std_logic;

begin


gls_reset <= (NOT clk_locked); -- system reset while clock not locked

Master_0 : spi_wishbone_wrapper
-- no generics
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,
	mosi =>  top_MOSI_Master_0_mosi	,
	miso =>  Master_0_miso_top_MISO	,
	ss =>  top_SS_Master_0_ss	,
	sck =>  top_SCK_Master_0_sck,

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
	memory_map => (
		"000000000000XXXX", 	--0X0000 - 0X08 = PWM
		"000000000001XXXX", 	--0X0010	= SERVO
		"00000000001XXXXX" ) --0X0020	= NES
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

	wbm_address(0) =>  Intercon_0_wbm_pwm_wbs.address,
	wbm_address(1) =>  Intercon_0_wbm_servo_wbs.address,
	wbm_address(2) =>  Intercon_0_wbm_nes_wbs.address,
	
	wbm_writedata(0) =>  Intercon_0_wbm_pwm_wbs.writedata,
	wbm_writedata(1) =>  Intercon_0_wbm_servo_wbs.writedata,
	wbm_writedata(2) =>  Intercon_0_wbm_nes_wbs.writedata,
	
	wbm_readdata(0) =>  Intercon_0_wbm_pwm_wbs.readdata,
	wbm_readdata(1) =>  Intercon_0_wbm_servo_wbs.readdata,
	wbm_readdata(2) =>  Intercon_0_wbm_nes_wbs.readdata,
	
	wbm_cycle(0) =>  Intercon_0_wbm_pwm_wbs.cycle,
	wbm_cycle(1) =>  Intercon_0_wbm_servo_wbs.cycle,
	wbm_cycle(2) =>  Intercon_0_wbm_nes_wbs.cycle,
	
	wbm_strobe(0) =>  Intercon_0_wbm_pwm_wbs.strobe,
	wbm_strobe(1) =>  Intercon_0_wbm_servo_wbs.strobe,
	wbm_strobe(2) =>  Intercon_0_wbm_nes_wbs.strobe,
	
	wbm_write(0) =>  Intercon_0_wbm_pwm_wbs.write,
	wbm_write(1) =>  Intercon_0_wbm_servo_wbs.write,
	wbm_write(2) =>  Intercon_0_wbm_nes_wbs.write,
	
	wbm_ack(0) =>  Intercon_0_wbm_pwm_wbs.ack,
	wbm_ack(1) =>  Intercon_0_wbm_servo_wbs.ack,	
	wbm_ack(2) =>  Intercon_0_wbm_nes_wbs.ack	
);

pwm : wishbone_pwm generic map(
nb_chan => 7
)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	wbs_address =>  Intercon_0_wbm_pwm_wbs.address,
	wbs_writedata =>  Intercon_0_wbm_pwm_wbs.writedata,
	wbs_readdata =>  Intercon_0_wbm_pwm_wbs.readdata,
	wbs_cycle =>  Intercon_0_wbm_pwm_wbs.cycle,
	wbs_strobe =>  Intercon_0_wbm_pwm_wbs.strobe,
	wbs_write =>  Intercon_0_wbm_pwm_wbs.write,
	wbs_ack =>  Intercon_0_wbm_pwm_wbs.ack,

	pwm_out(1 downto 0) =>  pwm_pwm_out_top_LED	,
	pwm_out(6 downto 2) => open
	
);

servo : wishbone_servo generic map(
nb_servos => 8
)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	wbs_address =>  Intercon_0_wbm_servo_wbs.address,
	wbs_writedata =>  Intercon_0_wbm_servo_wbs.writedata,
	wbs_readdata =>  Intercon_0_wbm_servo_wbs.readdata,
	wbs_cycle =>  Intercon_0_wbm_servo_wbs.cycle,
	wbs_strobe =>  Intercon_0_wbm_servo_wbs.strobe,
	wbs_write =>  Intercon_0_wbm_servo_wbs.write,
	wbs_ack =>  Intercon_0_wbm_servo_wbs.ack,

	failsafe => '0',
	servos(1 downto 0) =>  servo_servos_top_PMOD4,
	servos(7 downto 2) => open
	
);

nes : entity work.wishbone_nes 
	port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	wbs_address =>  Intercon_0_wbm_nes_wbs.address,
	wbs_writedata =>  Intercon_0_wbm_nes_wbs.writedata,
	wbs_readdata =>  Intercon_0_wbm_nes_wbs.readdata,
	wbs_cycle =>  Intercon_0_wbm_nes_wbs.cycle,
	wbs_strobe =>  Intercon_0_wbm_nes_wbs.strobe,
	wbs_write =>  Intercon_0_wbm_nes_wbs.write,
	wbs_ack =>  Intercon_0_wbm_nes_wbs.ack,

--#NET "nes_clk"  	LOC = P111	|	IOSTANDARD = LVCMOS33;	#PMOD4_2
--#NET "nes_lat"  	LOC = P132	|	IOSTANDARD = LVCMOS33;	#PMOD4_3
--#NET "nes1_dat"    LOC = P133	|	IOSTANDARD = LVCMOS33;	#PMOD4_10
--#NET "nes2_dat"  	LOC = P131	|	IOSTANDARD = LVCMOS33;	#PMOD4_4

		nes1_dat => nes1_dat,
		nes2_dat => nes2_dat,
		nes_lat => nes_lat,
		nes_clk => nes_clk,
		nes1_data_out => nes1_data_out,
		nes2_data_out => nes2_data_out
);

-- CONNECTING INPUTS -----------------------------------
top_MOSI_Master_0_mosi <= MOSI;
top_SS_Master_0_ss <= SS;
top_SCK_Master_0_sck <= SCK;
-- <= PB;
-- <= SW;

-- CONNECTING OUTPUTS -----------------------------------
MISO <= Master_0_miso_top_MISO;


--LED(1 downto 0) <= pwm_pwm_out_top_LED;
--LED(1 downto 0) <= pwm_pwm_out_top_LED;
LED(0) <= nes_lat;
LED(1) <= nes1_data_out(0) or nes1_data_out(1) or nes1_data_out(2) or nes1_data_out(3) or
	nes1_data_out(4) or nes1_data_out(5) or nes1_data_out(6) or nes1_data_out(7) or
		nes2_data_out(0) or nes2_data_out(1) or nes2_data_out(2) or nes2_data_out(3) or
	nes2_data_out(4) or nes2_data_out(5) or nes2_data_out(6) or nes2_data_out(7);

-- Connecting inouts
PMOD1(7 downto 0) <= (others => 'Z');
PMOD2(7 downto 0) <= (others => 'Z');
PMOD3(7 downto 0) <= (others => 'Z');



--PMOD4(7) <= 'Z';
nes1_dat <= PMOD4(7);
PMOD4(6) <= 'Z';
PMOD4(5 downto 4) <= servo_servos_top_PMOD4;
nes2_dat <= PMOD4(3);	--nes2_dat
PMOD4(2) <= nes_lat;	--nes_latch signal
PMOD4(1) <= nes_clk;	--nes_clk
PMOD4(0) <= 'Z';	


ARD(5 downto 0) <= (others => 'Z');

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
