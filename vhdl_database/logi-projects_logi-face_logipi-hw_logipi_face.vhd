----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:38:11 07/30/2013 
-- Design Name: 
-- Module Name:    logipi_face - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.utils_pack.all ;
use work.logiface_pack.all ;
use work.control_pack.all ;
use work.logi_wishbone_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;

entity logipi_face is
port( OSC_FPGA : in std_logic;

		--onboard
		PB : in std_logic_vector(1 downto 0);
		LED : out std_logic_vector(1 downto 0);	
		
		PMOD3 : out std_logic_vector(7 downto 0); -- used for intensity output
		
		PMOD4 : inout std_logic_vector(7 downto 0); -- used for mcp3002 control
		
		PMOD2 : inout std_logic_vector(7 downto 0); -- used for matrix control
		
		PMOD1 : inout std_logic_vector(7 downto 0); -- used for servo control on arduino connector
		--i2c
		RP_SCL, RP_SDA : inout std_logic ;
		
		--spi
		SYS_SPI_SCK, RP_SPI_CE0N, SYS_SPI_MOSI : in std_logic ;
		SYS_SPI_MISO : out std_logic
		
);
end logipi_face;

architecture RTL of logipi_face is

-- Component declaration
	COMPONENT clock_gen
	PORT(
		CLK_IN1 : IN std_logic;          
		CLK_OUT1 : OUT std_logic;
		CLK_OUT2 : OUT std_logic;
		CLK_OUT3 : OUT std_logic;
		LOCKED : OUT std_logic
		);
	END COMPONENT;



signal clk_sys, clk_100,  clk_96, clk_24, clk_locked : std_logic ;
signal resetn , sys_resetn, sys_reset : std_logic ;


--Wishbone Master bus signals
signal intercon_wrapper_wbm_address :  std_logic_vector(15 downto 0);
signal intercon_wrapper_wbm_readdata :  std_logic_vector(15 downto 0);
signal intercon_wrapper_wbm_writedata :  std_logic_vector(15 downto 0);
signal intercon_wrapper_wbm_strobe :  std_logic;
signal intercon_wrapper_wbm_ack :  std_logic;
signal intercon_wrapper_wbm_write :  std_logic;
signal intercon_wrapper_wbm_cycle :  std_logic;


--Wishbone intercon bus signals
signal intercon_servo_wbm_address :  std_logic_vector(15 downto 0);
signal intercon_servo_wbm_readdata :  std_logic_vector(15 downto 0);
signal intercon_servo_wbm_writedata :  std_logic_vector(15 downto 0);
signal intercon_servo_wbm_strobe :  std_logic;
signal intercon_servo_wbm_write :  std_logic;
signal intercon_servo_wbm_ack :  std_logic;
signal intercon_servo_wbm_cycle :  std_logic;

signal intercon_led_mat_wbm_address :  std_logic_vector(15 downto 0);
signal intercon_led_mat_wbm_readdata :  std_logic_vector(15 downto 0);
signal intercon_led_mat_wbm_writedata :  std_logic_vector(15 downto 0);
signal intercon_led_mat_wbm_strobe :  std_logic;
signal intercon_led_mat_wbm_write :  std_logic;
signal intercon_led_mat_wbm_ack :  std_logic;
signal intercon_led_mat_wbm_cycle :  std_logic;

signal intercon_reg0_wbm_address :  std_logic_vector(15 downto 0);
signal intercon_reg0_wbm_readdata :  std_logic_vector(15 downto 0);
signal intercon_reg0_wbm_writedata :  std_logic_vector(15 downto 0);
signal intercon_reg0_wbm_strobe :  std_logic;
signal intercon_reg0_wbm_write :  std_logic;
signal intercon_reg0_wbm_ack :  std_logic;
signal intercon_reg0_wbm_cycle :  std_logic;

signal intercon_pwm0_wbm_address :  std_logic_vector(15 downto 0);
signal intercon_pwm0_wbm_readdata :  std_logic_vector(15 downto 0);
signal intercon_pwm0_wbm_writedata :  std_logic_vector(15 downto 0);
signal intercon_pwm0_wbm_strobe :  std_logic;
signal intercon_pwm0_wbm_write :  std_logic;
signal intercon_pwm0_wbm_ack :  std_logic;
signal intercon_pwm0_wbm_cycle :  std_logic;


signal servo_cs, led_mat_cs, reg0_cs, pwm0_cs : std_logic ;
signal loop_back_reg : std_logic_vector(15 downto 0);

signal mcp3002_sample : std_logic_vector(9 downto 0);
signal mcp3002_sample_valid : std_logic ;

signal pmw_output : std_logic_vector(2 downto 0);

begin

sys_clocks_gen: clock_gen 
	PORT MAP(
		CLK_IN1 => OSC_FPGA,
		CLK_OUT1 => clk_100,
		CLK_OUT2 => clk_24,
		CLK_OUT3 => clk_96, --96Mhz system clock
		LOCKED => clk_locked
	);
clk_sys <= clk_96 ;


resetn <= PB(0) ;
reset0: reset_generator 
	generic map(HOLD_0 => 1000)
	port map(
		clk => clk_sys, 
		resetn => resetn ,
		resetn_0 => sys_resetn
	);
sys_reset <= NOT sys_resetn ;



mem_interface0 : spi_wishbone_wrapper
		port map(
			-- Global Signals
			gls_reset => sys_reset,
			gls_clk   => clk_sys,
			
			-- SPI signals
			mosi => SYS_SPI_MOSI,
			miso => SYS_SPI_MISO,
			sck => SYS_SPI_SCK,
			ss => RP_SPI_CE0N,
			
			  -- Wishbone interface signals
			wbm_address    => intercon_wrapper_wbm_address,  -- Address bus
			wbm_readdata   => intercon_wrapper_wbm_readdata,  -- Data bus for read access
			wbm_writedata 	=> intercon_wrapper_wbm_writedata,  -- Data bus for write access
			wbm_strobe     => intercon_wrapper_wbm_strobe,                      -- Data Strobe
			wbm_write      => intercon_wrapper_wbm_write,                      -- Write access
			wbm_ack        => intercon_wrapper_wbm_ack,                      -- acknowledge
			wbm_cycle      => intercon_wrapper_wbm_cycle                       -- bus cycle in progress
			);


-- Intercon -----------------------------------------------------------
-- will be generated automatically in the future

reg0_cs <= '1' when intercon_wrapper_wbm_address(15 downto 0) = X"0000" else
			 '0' ;
led_mat_cs <= '1' when intercon_wrapper_wbm_address(15 downto 0) = X"0001" else
			 '0' ;
servo_cs <= '1' when intercon_wrapper_wbm_address(15 downto 3) = "0000000000001" else
				'0' ;
pwm0_cs <= '1' when intercon_wrapper_wbm_address(15 downto 3) = "0000000000010" else
				'0' ;				

intercon_servo_wbm_address <= intercon_wrapper_wbm_address ;
intercon_servo_wbm_writedata <= intercon_wrapper_wbm_writedata ;
intercon_servo_wbm_write <= intercon_wrapper_wbm_write and servo_cs ;
intercon_servo_wbm_strobe <= intercon_wrapper_wbm_strobe and servo_cs ;
intercon_servo_wbm_cycle <= intercon_wrapper_wbm_cycle and servo_cs ;

intercon_led_mat_wbm_address <= intercon_wrapper_wbm_address ;
intercon_led_mat_wbm_writedata <= intercon_wrapper_wbm_writedata ;
intercon_led_mat_wbm_write <= intercon_wrapper_wbm_write and led_mat_cs ;
intercon_led_mat_wbm_strobe <= intercon_wrapper_wbm_strobe and led_mat_cs ;
intercon_led_mat_wbm_cycle <= intercon_wrapper_wbm_cycle and led_mat_cs ;		

intercon_reg0_wbm_address <= intercon_wrapper_wbm_address ;
intercon_reg0_wbm_writedata <= intercon_wrapper_wbm_writedata ;
intercon_reg0_wbm_write <= intercon_wrapper_wbm_write and reg0_cs ;
intercon_reg0_wbm_strobe <= intercon_wrapper_wbm_strobe and reg0_cs ;
intercon_reg0_wbm_cycle <= intercon_wrapper_wbm_cycle and reg0_cs ;		

intercon_pwm0_wbm_address <= intercon_wrapper_wbm_address ;
intercon_pwm0_wbm_writedata <= intercon_wrapper_wbm_writedata ;
intercon_pwm0_wbm_write <= intercon_wrapper_wbm_write and pwm0_cs ;
intercon_pwm0_wbm_strobe <= intercon_wrapper_wbm_strobe and pwm0_cs ;
intercon_pwm0_wbm_cycle <= intercon_wrapper_wbm_cycle and pwm0_cs ;							


intercon_wrapper_wbm_readdata	<= intercon_led_mat_wbm_readdata when led_mat_cs = '1' else
											intercon_servo_wbm_readdata when servo_cs = '1' else
											intercon_reg0_wbm_readdata when reg0_cs = '1' else
											intercon_pwm0_wbm_readdata when pwm0_cs = '1' else
											intercon_wrapper_wbm_address ;
											
intercon_wrapper_wbm_ack	<= intercon_led_mat_wbm_ack when led_mat_cs = '1' else
										intercon_servo_wbm_ack when servo_cs = '1' else
										intercon_reg0_wbm_ack when reg0_cs = '1' else
										intercon_pwm0_wbm_ack when pwm0_cs = '1' else
										'0' ;

led_mat_interface : wishbone_max7219
		generic map(
				NB_DEVICE => 2, 
				CLK_DIV => 10,
				wb_size => 16 
		)
		port map(
			gls_reset => sys_reset,
			gls_clk   => clk_sys,

			wbs_address      =>  intercon_led_mat_wbm_address ,
			wbs_writedata => intercon_led_mat_wbm_writedata,
			wbs_readdata  => intercon_led_mat_wbm_readdata,
			wbs_strobe    => intercon_led_mat_wbm_strobe,
			wbs_cycle     => intercon_led_mat_wbm_cycle,
			wbs_write     => intercon_led_mat_wbm_write,
			wbs_ack       => intercon_led_mat_wbm_ack,
			
			DOUT => PMOD2(0),
			SCLK => PMOD2(1),
			LOAD => PMOD2(4)
		);


servo_wb : wishbone_servo
generic map(
			NB_SERVOS => 4 ,
			wb_size => 16 , -- Data port size for wishbone
			pos_width => 8 ,
			clock_period => 10 ,
			minimum_high_pulse_width => 1000000,
			maximum_high_pulse_width => 2000000
		  )
port map(
		   gls_reset => sys_reset,
			gls_clk   => clk_sys,

			wbs_address      =>  intercon_servo_wbm_address ,
			wbs_writedata => intercon_servo_wbm_writedata,
			wbs_readdata  => intercon_servo_wbm_readdata,
			wbs_strobe    => intercon_servo_wbm_strobe,
			wbs_cycle     => intercon_servo_wbm_cycle,
			wbs_write     => intercon_servo_wbm_write,
			wbs_ack       => intercon_servo_wbm_ack,
		  
			failsafe => '0',  
		   servos(0) => PMOD1(1),
			servos(1) => PMOD1(5),
			servos(2) => PMOD1(2),
			servos(3) => PMOD1(6)
);

regs0 : wishbone_register 
	generic map(
		  wb_size => 16, -- Data port size for wishbone
		  nb_regs => 1
	 )
	 port map
	 (
		  -- Syscon signals
		  gls_reset  => sys_reset,
		  gls_clk    => clk_sys,
		  -- Wishbone signals
		  wbs_address       => intercon_reg0_wbm_address,
		  wbs_writedata => intercon_reg0_wbm_writedata,
		  wbs_readdata  => intercon_reg0_wbm_readdata,
		  wbs_strobe    => intercon_reg0_wbm_strobe,
		  wbs_cycle     => intercon_reg0_wbm_cycle,
		  wbs_write     => intercon_reg0_wbm_write,
		  wbs_ack       => intercon_reg0_wbm_ack,
		  -- out signals
		  reg_out(0) => loop_back_reg,
		  
		  reg_in(0) => loop_back_reg
	 );


pmw0 : wishbone_pwm
generic map( nb_chan => 3,
			wb_size => 16 
		  )
port map(
		  -- Syscon signals
		  gls_reset => sys_reset,
		  gls_clk   => clk_sys,
		  -- Wishbone signals
		  wbs_address      => intercon_pwm0_wbm_address,
		  wbs_writedata => intercon_pwm0_wbm_writedata,
		  wbs_readdata  => intercon_pwm0_wbm_readdata,
		  wbs_strobe    => intercon_pwm0_wbm_strobe,
		  wbs_cycle     => intercon_pwm0_wbm_cycle,
		  wbs_write     => intercon_pwm0_wbm_write,
		  wbs_ack       => intercon_pwm0_wbm_ack,
		  
		  pwm_out => pmw_output
		  

);

LED <= pmw_output(1 downto 0);
PMOD4(6 downto 4) <= pmw_output;
-- logic only components

mcp3002_int0 : mcp3002_interface 
		generic map(CLK_DIV => 100,
		  SAMPLING_DIV => 1024)
port map(

		  clk => clk_sys, 
		  resetn => sys_resetn,

		  sample => mcp3002_sample,
		  dv => mcp3002_sample_valid,
		  chan => '0' ,
		
		  -- spi signals
		  DOUT => PMOD4(0),
		  DIN => PMOD4(3),
		  SCLK => PMOD4(1),
		  SSN=> PMOD4(2)

);

compute_mean0 : compute_adc_mean 
	generic map(NB_SAMPLES => 512)
	port map(
			clk => clk_sys, 
			resetn => sys_resetn,

			sample_in => mcp3002_sample,
			dv_in => mcp3002_sample_valid,

			mean_val(9 downto 2) => PMOD3,
			mean_val(1 downto 0) => open
	);


end RTL;

