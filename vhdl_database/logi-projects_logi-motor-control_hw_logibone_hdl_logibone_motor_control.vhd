library ieee;
use ieee.std_logic_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library work ;
use work.logi_wishbone_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;
use work.control_pack.all ;


entity logibone_motor_control is
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
		
		PB :  in std_logic_vector((2-1) downto 0);
		SW :  in std_logic_vector((2-1) downto 0)	
	);
end logibone_motor_control;

architecture structural of logibone_motor_control is
	

component encoder_interface is
generic(FREQ_DIV : positive := 100);
port(
	clk, reset : in std_logic ;
	channel_a, channel_b : in std_logic;
	
	period : out std_logic_vector(15 downto 0);
	pv : out std_logic ;
	
	count : out std_logic_vector(15 downto 0);
	reset_count : in std_logic 

);
end component;

component wishbone_pwm is
generic( nb_chan : positive := 7;
			wb_size : natural := 16  -- Data port size for wishbone
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
		  
		  pwm_out : out std_logic_vector(nb_chan-1 downto 0)
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

	signal gls_clk, gls_clk_unbuf, gls_reset, clk_locked, osc_buff, clkfb : std_logic ;

	signal Master_0_wbm_Intercon_0_wbs_0 : wishbone_bus;
	
	signal Intercon_0_wbm_REG0_0_wbs : wishbone_bus;
	signal Intercon_0_wbm_PWM_0_wbs : wishbone_bus;


	signal BEAT_0_beat_out_top_LED : std_logic;

	
	
	-- my logic
	signal encoder_count0, encoder_control, encoder_speed0: std_logic_vector(15 downto 0);
	signal encoder_count1, encoder_speed1: std_logic_vector(15 downto 0);
	signal CHAN_A0, CHAN_B0 : std_logic ;
	signal CHAN_A1, CHAN_B1 : std_logic ;
	signal pwm_sig0,pwm_sig1 : std_logic ;
	signal dir_control : std_logic_vector(15 downto 0);
	
	signal loop_back : std_logic_vector(15 downto 0);
begin


gls_reset <= (NOT clk_locked); -- system reset while clock not locked



Master_0 : gpmc_wishbone_wrapper
generic map(sync => true, burst => false)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

	gpmc_ad =>  GPMC_AD,

	gpmc_csn =>  GPMC_CSN,

	gpmc_oen =>  GPMC_OEN,

	gpmc_wen =>  GPMC_WEN,

	gpmc_advn =>  GPMC_ADVN,

	gpmc_clk =>  GPMC_CLK,

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
memory_map => ("00000000000000XX", "00000000000001XX")
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

wbm_address(0) =>  Intercon_0_wbm_REG0_0_wbs.address,
wbm_address(1) =>  Intercon_0_wbm_PWM_0_wbs.address,

wbm_writedata(0) =>  Intercon_0_wbm_REG0_0_wbs.writedata,
wbm_writedata(1) =>  Intercon_0_wbm_PWM_0_wbs.writedata,

wbm_readdata(0) =>  Intercon_0_wbm_REG0_0_wbs.readdata,
wbm_readdata(1) =>  Intercon_0_wbm_PWM_0_wbs.readdata,

wbm_cycle(0) =>  Intercon_0_wbm_REG0_0_wbs.cycle,
wbm_cycle(1) =>  Intercon_0_wbm_PWM_0_wbs.cycle,

wbm_write(0) =>  Intercon_0_wbm_REG0_0_wbs.write,
wbm_write(1) =>  Intercon_0_wbm_PWM_0_wbs.write,

wbm_ack(0) =>  Intercon_0_wbm_REG0_0_wbs.ack,
wbm_ack(1) =>  Intercon_0_wbm_PWM_0_wbs.ack,

wbm_strobe(0) =>  Intercon_0_wbm_REG0_0_wbs.strobe,
wbm_strobe(1) =>  Intercon_0_wbm_PWM_0_wbs.strobe

);

BEAT_0 : heart_beat
-- no generics
port map(
	gls_clk => gls_clk, gls_reset => '0',

beat_out =>  BEAT_0_beat_out_top_LED
	
);

REG_0 : wishbone_register
-- no generics
generic map(nb_regs => 3)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

wbs_address =>  Intercon_0_wbm_REG0_0_wbs.address,
wbs_writedata =>  Intercon_0_wbm_REG0_0_wbs.writedata,
wbs_readdata =>  Intercon_0_wbm_REG0_0_wbs.readdata,
wbs_cycle =>  Intercon_0_wbm_REG0_0_wbs.cycle,
wbs_strobe =>  Intercon_0_wbm_REG0_0_wbs.strobe,
wbs_write =>  Intercon_0_wbm_REG0_0_wbs.write,
wbs_ack =>  Intercon_0_wbm_REG0_0_wbs.ack,

reg_out(0)(15 downto 0) => encoder_control,
reg_out(1)(15 downto 0) => dir_control,
reg_out(2) => loop_back,
reg_in(0)(15 downto 0) => encoder_count0,
reg_in(1)(15 downto 0) => encoder_count1,
reg_in(2) => loop_back
);


enc0 : encoder_interface
generic map(FREQ_DIV => 100)
port map(
	clk => gls_clk, reset => gls_reset,
	channel_a => CHAN_A0, 
	channel_b => CHAN_B0,
	
	period => encoder_speed0,
	pv => open,
	
	count => encoder_count0,
	reset_count => encoder_control(0) 

);

enc1 : encoder_interface
generic map(FREQ_DIV => 100)
port map(
	clk => gls_clk, reset => gls_reset,
	channel_a => CHAN_A1, 
	channel_b => CHAN_B1,
	
	period => encoder_speed1,
	pv => open,
	
	count => encoder_count1,
	reset_count => encoder_control(8) 

);


PWM_0 : wishbone_pwm 
generic map( nb_chan => 2)
port map(
		  -- Syscon signals
		  gls_clk => gls_clk, gls_reset => gls_reset,
		  -- Wishbone signals
			wbs_address =>  Intercon_0_wbm_PWM_0_wbs.address,
			wbs_writedata =>  Intercon_0_wbm_PWM_0_wbs.writedata,
			wbs_readdata =>  Intercon_0_wbm_PWM_0_wbs.readdata,
			wbs_cycle =>  Intercon_0_wbm_PWM_0_wbs.cycle,
			wbs_strobe =>  Intercon_0_wbm_PWM_0_wbs.strobe,
			wbs_write =>  Intercon_0_wbm_PWM_0_wbs.write,
			wbs_ack =>  Intercon_0_wbm_PWM_0_wbs.ack,
		  
		  pwm_out(0) => pwm_sig0,
		  pwm_out(1) => pwm_sig1
);


LED(0) <= BEAT_0_beat_out_top_LED;
LED(1) <= pwm_sig0;

-- Connecting inouts

CHAN_A0 <= PMOD1(2);
CHAN_B0 <= PMOD1(3);
PMOD1(0) <= dir_control(0);
PMOD1(1) <= pwm_sig0;
PMOD1(7 downto 4) <= (others => 'Z');

CHAN_A1 <= PMOD2(2);
CHAN_B1 <= PMOD2(3);
PMOD2(0) <= dir_control(8);
PMOD2(1) <= pwm_sig1;
PMOD2(7 downto 4) <= (others => 'Z');



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
      CLKOUT0 => gls_clk_unbuf,      CLKOUT1 => open,
      CLKOUT2 => open,      CLKOUT3 => open,
      CLKOUT4 => open,      CLKOUT5 => open,
      LOCKED  => clk_locked,  -- 1-bit output: PLL_BASE lock status output
      CLKFBIN => clkfb, -- 1-bit input: Feedback clock input
      CLKIN   => osc_buff,  -- 1-bit input: Clock input
      RST     => '0'    -- 1-bit input: Reset input
   );

    -- Buffering of clocks
	BUFG_1 : BUFG port map (O => osc_buff,    I => OSC_FPGA);
	BUFG_2 : BUFG port map (O => gls_clk,    I => gls_clk_unbuf);

end structural ;