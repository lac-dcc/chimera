library ieee;
use ieee.std_logic_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library work ;
use work.logi_wishbone_pack.all ;
use work.logi_wishbone_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;
use work.control_pack.all ;


entity test_ugv is
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
		ARD :   inout  std_logic_vector((6-1) downto 0);
		PB :  in std_logic_vector((2-1) downto 0);
		SW :  in std_logic_vector((2-1) downto 0)	
	);
end test_ugv;

architecture structural of test_ugv is
	
component l3gd20_interface is
generic(CLK_DIV : positive := 100;
		  SAMPLING_DIV : positive := 1_000_000;
		  POL : std_logic := '0';
		  PHA : std_logic := '0');
port(

		  clk, resetn : std_logic ;
		  
		  
		  offset_x : in std_logic_vector(15 downto 0);
		  offset_y : in std_logic_vector(15 downto 0);
		  offset_z : in std_logic_vector(15 downto 0);
		  sample_x : out std_logic_vector(15 downto 0);
		  sample_y : out std_logic_vector(15 downto 0);
		  sample_z : out std_logic_vector(15 downto 0);
		  dv : out std_logic ;
		
		  -- spi signals
		  DOUT : out std_logic ;
		  DIN : in std_logic ;
		  SCLK : out std_logic ;
		  SSN : out std_logic

);
end component;


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
	signal Intercon_0_wbm_GPS_0_wbs : wishbone_bus;
	signal Intercon_0_wbm_PING_0_wbs : wishbone_bus;
	signal Intercon_0_wbm_SERVO_0_wbs : wishbone_bus;
	signal Intercon_0_wbm_WATCH_0_wbs : wishbone_bus;
	signal WATCH_0_reset_out_SERVO_0_failsafe : std_logic;
	signal BEAT_0_beat_out_top_LED : std_logic;
	signal top_ARD_GPS_0_rx : std_logic ;
	signal SERVO_0_servos_top_ARD : std_logic_vector((2-1) downto 0);
	signal PING_0_trigger_top_PMOD1 : std_logic_vector((3-1) downto 0);
	signal top_PMOD1_PING_0_echo : std_logic_vector((3-1) downto 0);
	signal Intercon_0_wbm_REG_0_wbs : wishbone_bus;
	
	
	-- my logic
	signal gyro_x, gyro_offset : std_logic_vector(15 downto 0) := X"0000";
	signal encoder_count, encoder_control, encoder_speed: std_logic_vector(15 downto 0);
	signal ARD_4_delayed : std_logic ;

begin


gls_reset <= (NOT clk_locked); -- system reset while clock not locked



Master_0 : spi_wishbone_wrapper
-- no generics
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

mosi =>  top_MOSI_Master_0_mosi
,

miso =>  Master_0_miso_top_MISO
,

ss =>  top_SS_Master_0_ss
,

sck =>  top_SCK_Master_0_sck
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
memory_map => ("000000001XXXXXXX", "00000000000001XX", "000000000001XXXX", "000000000000000X", "00000000000011XX")
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

wbm_address(0) =>  Intercon_0_wbm_GPS_0_wbs.address,
wbm_address(1) =>  Intercon_0_wbm_PING_0_wbs.address,
wbm_address(2) =>  Intercon_0_wbm_SERVO_0_wbs.address,
wbm_address(3) =>  Intercon_0_wbm_WATCH_0_wbs.address,
wbm_address(4) =>  Intercon_0_wbm_REG_0_wbs.address,
wbm_writedata(0) =>  Intercon_0_wbm_GPS_0_wbs.writedata,
wbm_writedata(1) =>  Intercon_0_wbm_PING_0_wbs.writedata,
wbm_writedata(2) =>  Intercon_0_wbm_SERVO_0_wbs.writedata,
wbm_writedata(3) =>  Intercon_0_wbm_WATCH_0_wbs.writedata,
wbm_writedata(4) =>  Intercon_0_wbm_REG_0_wbs.writedata,
wbm_readdata(0) =>  Intercon_0_wbm_GPS_0_wbs.readdata,
wbm_readdata(1) =>  Intercon_0_wbm_PING_0_wbs.readdata,
wbm_readdata(2) =>  Intercon_0_wbm_SERVO_0_wbs.readdata,
wbm_readdata(3) =>  Intercon_0_wbm_WATCH_0_wbs.readdata,
wbm_readdata(4) =>  Intercon_0_wbm_REG_0_wbs.readdata,
wbm_cycle(0) =>  Intercon_0_wbm_GPS_0_wbs.cycle,
wbm_cycle(1) =>  Intercon_0_wbm_PING_0_wbs.cycle,
wbm_cycle(2) =>  Intercon_0_wbm_SERVO_0_wbs.cycle,
wbm_cycle(3) =>  Intercon_0_wbm_WATCH_0_wbs.cycle,
wbm_cycle(4) =>  Intercon_0_wbm_REG_0_wbs.cycle,
wbm_strobe(0) =>  Intercon_0_wbm_GPS_0_wbs.strobe,
wbm_strobe(1) =>  Intercon_0_wbm_PING_0_wbs.strobe,
wbm_strobe(2) =>  Intercon_0_wbm_SERVO_0_wbs.strobe,
wbm_strobe(3) =>  Intercon_0_wbm_WATCH_0_wbs.strobe,
wbm_strobe(4) =>  Intercon_0_wbm_REG_0_wbs.strobe,
wbm_write(0) =>  Intercon_0_wbm_GPS_0_wbs.write,
wbm_write(1) =>  Intercon_0_wbm_PING_0_wbs.write,
wbm_write(2) =>  Intercon_0_wbm_SERVO_0_wbs.write,
wbm_write(3) =>  Intercon_0_wbm_WATCH_0_wbs.write,
wbm_write(4) =>  Intercon_0_wbm_REG_0_wbs.write,
wbm_ack(0) =>  Intercon_0_wbm_GPS_0_wbs.ack,
wbm_ack(1) =>  Intercon_0_wbm_PING_0_wbs.ack,
wbm_ack(2) =>  Intercon_0_wbm_SERVO_0_wbs.ack,
wbm_ack(3) =>  Intercon_0_wbm_WATCH_0_wbs.ack,
wbm_ack(4) =>  Intercon_0_wbm_REG_0_wbs.ack	
);

GPS_0 : entity work.wishbone_gps
-- no generics
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

wbs_address =>  Intercon_0_wbm_GPS_0_wbs.address,
wbs_writedata =>  Intercon_0_wbm_GPS_0_wbs.writedata,
wbs_readdata =>  Intercon_0_wbm_GPS_0_wbs.readdata,
wbs_cycle =>  Intercon_0_wbm_GPS_0_wbs.cycle,
wbs_strobe =>  Intercon_0_wbm_GPS_0_wbs.strobe,
wbs_write =>  Intercon_0_wbm_GPS_0_wbs.write,
wbs_ack =>  Intercon_0_wbm_GPS_0_wbs.ack,

rx_in =>  top_ARD_GPS_0_rx
	
);

PING_0 : entity work.wishbone_ping
-- no generics
generic map(nb_ping => 3)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

wbs_address =>  Intercon_0_wbm_PING_0_wbs.address,
wbs_writedata =>  Intercon_0_wbm_PING_0_wbs.writedata,
wbs_readdata =>  Intercon_0_wbm_PING_0_wbs.readdata,
wbs_cycle =>  Intercon_0_wbm_PING_0_wbs.cycle,
wbs_strobe =>  Intercon_0_wbm_PING_0_wbs.strobe,
wbs_write =>  Intercon_0_wbm_PING_0_wbs.write,
wbs_ack =>  Intercon_0_wbm_PING_0_wbs.ack,

ping_io(2 downto 0) => PING_0_trigger_top_PMOD1
--trigger(2 downto 0) =>  PING_0_trigger_top_PMOD1
--echo(2 downto 0) =>  top_PMOD1_PING_0_echo
	
);

SERVO_0 : wishbone_servo
generic map(
nb_servos => 8
)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

wbs_address =>  Intercon_0_wbm_SERVO_0_wbs.address,
wbs_writedata =>  Intercon_0_wbm_SERVO_0_wbs.writedata,
wbs_readdata =>  Intercon_0_wbm_SERVO_0_wbs.readdata,
wbs_cycle =>  Intercon_0_wbm_SERVO_0_wbs.cycle,
wbs_strobe =>  Intercon_0_wbm_SERVO_0_wbs.strobe,
wbs_write =>  Intercon_0_wbm_SERVO_0_wbs.write,
wbs_ack =>  Intercon_0_wbm_SERVO_0_wbs.ack,

failsafe =>  WATCH_0_reset_out_SERVO_0_failsafe
,

servos(1 downto 0) =>  SERVO_0_servos_top_ARD
,
servos(7 downto 2) => open
	
);

BEAT_0 : heart_beat
-- no generics
port map(
	gls_clk => gls_clk, gls_reset => WATCH_0_reset_out_SERVO_0_failsafe,

beat_out =>  BEAT_0_beat_out_top_LED
	
);

WATCH_0 : wishbone_watchdog
-- no generics
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

wbs_address =>  Intercon_0_wbm_WATCH_0_wbs.address,
wbs_writedata =>  Intercon_0_wbm_WATCH_0_wbs.writedata,
wbs_readdata =>  Intercon_0_wbm_WATCH_0_wbs.readdata,
wbs_cycle =>  Intercon_0_wbm_WATCH_0_wbs.cycle,
wbs_strobe =>  Intercon_0_wbm_WATCH_0_wbs.strobe,
wbs_write =>  Intercon_0_wbm_WATCH_0_wbs.write,
wbs_ack =>  Intercon_0_wbm_WATCH_0_wbs.ack,

reset_out =>  WATCH_0_reset_out_SERVO_0_failsafe
	
);

REG_0 : wishbone_register
-- no generics
generic map(nb_regs => 4)
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,

wbs_address =>  Intercon_0_wbm_REG_0_wbs.address,
wbs_writedata =>  Intercon_0_wbm_REG_0_wbs.writedata,
wbs_readdata =>  Intercon_0_wbm_REG_0_wbs.readdata,
wbs_cycle =>  Intercon_0_wbm_REG_0_wbs.cycle,
wbs_strobe =>  Intercon_0_wbm_REG_0_wbs.strobe,
wbs_write =>  Intercon_0_wbm_REG_0_wbs.write,
wbs_ack =>  Intercon_0_wbm_REG_0_wbs.ack,

reg_out(0)(15 downto 0) => gyro_offset,
reg_out(1)(15 downto 0) => encoder_control,
reg_out(2)(15 downto 0) => open,
reg_out(3)(15 downto 0) => open,
reg_in(0)(15 downto 0) => gyro_x,
reg_in(1)(15 downto 0) => encoder_count,
reg_in(2)(15 downto 0) => encoder_speed,
reg_in(3)(15 downto 2) => open,
reg_in(3)(1 downto 0) => PB
);


--- additional logic

gyro_0 : l3gd20_interface
generic map(CLK_DIV => 100,
		  SAMPLING_DIV => 1_000_000)
port map(

		  clk => gls_clk, resetn => not gls_reset,
		  
		  
		  offset_x => gyro_offset,
		  offset_y => X"0000",
		  offset_z => X"0000",
		  sample_x => gyro_x,
		  sample_y => open,
		  sample_z => open,
		  dv => open,
		
		  -- spi signals
		  DOUT  => PMOD4(0),
		  DIN => PMOD4(1),
		  SCLK => PMOD4(2),
		  SSN => PMOD4(3)

);

enc0 : encoder_interface
generic map(FREQ_DIV => 100)
port map(
	clk => gls_clk, reset => gls_reset,
	channel_a => ARD(4), 
	channel_b => '0',
	
	period => encoder_speed,
	pv => open,
	
	count => encoder_count,
	reset_count => encoder_control(0) 

);



-- Connecting inputs
top_MOSI_Master_0_mosi <= MOSI;
top_SS_Master_0_ss <= SS;
top_SCK_Master_0_sck <= SCK;
-- <= PB;
-- <= SW;

-- Connecting outputs
MISO <= Master_0_miso_top_MISO;
LED(0) <= BEAT_0_beat_out_top_LED;
LED(1) <= 'Z';

-- Connecting inouts

PMOD1(2 downto 0) <= PING_0_trigger_top_PMOD1;
--PING_0_trigger_top_PMOD1 <= PMOD1(2 downto 0);


--PMOD1(6 downto 4) <= top_PMOD1_PING_0_echo;
top_PMOD1_PING_0_echo <= PMOD1(6 downto 4);


PMOD1(3) <= 'Z';
--'Z' <= PMOD1(3);


PMOD1(7) <= 'Z';
--'Z' <= PMOD1(7);


PMOD2(7 downto 0) <= (others => 'Z');
--(others => 'Z') <= PMOD2(7 downto 0);


PMOD3(7 downto 0) <= (others => 'Z');
--(others => 'Z') <= PMOD3(7 downto 0);


PMOD4(7 downto 4) <= (others => 'Z');
--(others => 'Z') <= PMOD4(7 downto 0);


--ARD(5) <= top_ARD_GPS_0_rx;
top_ARD_GPS_0_rx <= ARD(5);


ARD(1 downto 0) <= SERVO_0_servos_top_ARD;
--SERVO_0_servos_top_ARD <= ARD(1 downto 0);


ARD(3 downto 2) <= (others => 'Z');
--(others => 'Z') <= ARD(4 downto 2);






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