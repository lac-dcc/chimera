----------------------------------------------------------------------------------
-- ********* Fleatiny-FPGA Platform top-level module ***********
-- This is basically a wrapper allows connection of user projects to
-- Fleatiny-FPGA's on-board hardware
--
-- Creation Date: 4th August 2013
-- Author: Valentin Angelovski
--
-- ©2013 - Valentin Angelovski
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.numeric_std.ALL;
--use work.zpu_config.all;
--use work.zpupkg.ALL;

entity FleaFPGA_Uno_E1 is

	port(
	-- System clock and reset
	sys_clock		: in		std_logic;	-- main clock input from 25MHz clock source
	--sys_reset		: in		std_logic;	-- 
	Shield_reset	: inout		std_logic;  -- Buffered reset signal out to GPIO header
	
	-- On-board user buttons and status LEDs
	LVDS_Red		: out		std_logic;	-- main clock input from external clock source
	LVDS_Green		: out		std_logic;	-- main clock input from external RC reset circuit
	LVDS_Blue		: out		std_logic;
	LVDS_ck			: out		std_logic;
	
	User_LED1		: out		std_logic;
	User_LED2		: out		std_logic;
	GPIO_wordport	: inout 	std_logic_vector(15 downto 0);
	GPIO_pullup		: out 	std_logic_vector(15 downto 0);

	User_PB1		: in		std_logic;
	
	ADC0_Comp_in	: inout		std_logic;
	ADC0_Error_out	: inout		std_logic;
	ADC1_Comp_in	: inout		std_logic;
	ADC1_Error_out	: inout		std_logic;
	ADC2_Comp_in	: inout		std_logic;
	ADC2_Error_out	: inout		std_logic;
	ADC3_Comp_in	: inout		std_logic;
	ADC3_Error_out	: inout		std_logic;	
	ADC4_Comp_in	: inout		std_logic; 
	ADC4_Error_out	: inout		std_logic;
	ADC5_Comp_in	: inout		std_logic;
	ADC5_Error_out	: inout		std_logic;

	SRAM_Addr		: out		std_logic_vector(18 downto 0);	-- SRAM address bus
	SRAM_Data		: inout		std_logic_vector(7 downto 0);	-- data bus to/from SRAM
	SRAM_n_cs		: out		std_logic;
	SRAM_n_oe		: out		std_logic;
	SRAM_n_we		: out		std_logic;
			
	Audio_l			: out		std_logic;
	Audio_r			: out		std_logic; 
		-- SPI1 to Flash ROM
	spi1_miso		: in 		std_logic;
	spi1_mosi		: out 		std_logic;
	spi1_clk		: out 		std_logic;
	spi1_cs			: out 		std_logic;
	
	-- PS2 interface
	PS2_clk1		: inout		std_logic;
	PS2_data1		: inout		std_logic;	

	-- UART interface
	slave_rx_i		: in		std_logic;
	slave_tx_o		: out		std_logic  
	
	);  
end FleaFPGA_Uno_E1;

architecture arch of FleaFPGA_Uno_E1 is

   signal clk_dvi  : std_logic := '0';
   signal clk_dvin : std_logic := '0';
   signal clk_vga  : std_logic := '0';
   signal clk100   : std_logic := '0';
	signal ps2k_clk_in : std_logic;
	signal ps2k_clk_out : std_logic;
	signal ps2k_dat_in : std_logic;
	signal ps2k_dat_out : std_logic;
   
begin
	-- Housekeeping logic for unwanted peripherals on FleaFPGA board goes here..
	-- (Note: comment out any of the following code lines if peripheral is required)

--User_LED1 <= '0';
--User_LED2 <= '0'; 

	ps2k_dat_in<=PS2_data1;
	PS2_data1 <= '0' when ps2k_dat_out='0' else 'Z';
	ps2k_clk_in<=PS2_clk1;
	PS2_clk1 <= '0' when ps2k_clk_out='0' else 'Z';	

	-- User HDL project modules and port mappings go here..

	u0 : entity work.Sweet32_Uno_clkgen
	port map(
		CLKI			=>	sys_clock,
		CLKOP			=>	clk_dvi,
		CLKOS 			=>  clk_dvin,
		CLKOS2 			=>  clk_vga,
		CLKOS3 			=>  clk100		
		);  


	u2 : entity work.Sweet32_BIU_SRAM8_DVI
	generic map(
		SYS_CLOCK_HZ	=>	50_000_000,	-- master clock rate in Hz
		BAUD_RATE		=>	115_200			-- UART baud rate
	)
 
	
 	port map(
		-- System signals
		reset_in		=> User_PB1,		
		Shield_reset	=> Shield_reset,
		
		clk				=> clk100,
		clk_dvi			=> clk_dvi,
		clk_dvin		=> clk_dvin,  
		vgaclk			=> clk_vga,

		-- PWM 
		PWM0_out		=>	Audio_l,
		PWM1_out		=>	Audio_r,

		-- ADC
		ADC0_Q_ouput	=>	ADC0_Error_out, 
		ADC0_D_input	=>	ADC0_Comp_in,
		ADC1_Q_ouput	=>	ADC1_Error_out, 
		ADC1_D_input	=>	ADC1_Comp_in,
		ADC2_Q_ouput	=>	ADC2_Error_out, 
		ADC2_D_input	=>	ADC2_Comp_in,
		ADC3_Q_ouput	=>	ADC3_Error_out, 
		ADC3_D_input	=>	ADC3_Comp_in,
		ADC4_Q_ouput	=>	ADC4_Error_out, 
		ADC4_D_input	=>	ADC4_Comp_in,
		ADC5_Q_ouput	=>	ADC5_Error_out,  
		ADC5_D_input	=>	ADC5_Comp_in,
		 
		-- GPIO
		GPIO_wordport	=>	GPIO_wordport,
		GPIO_pullup 	=>	GPIO_pullup,
		
		-- UART
		rxd				=>	slave_rx_i,
		txd				=>	slave_tx_o,
		
		-- SRAM
		SRAM_Addr		=> 	SRAM_Addr, -- SRAM address bus
		SRAM_Data		=>	SRAM_Data,-- data bus to/from SRAM
		SRAM_n_cs		=>	SRAM_n_cs,
		SRAM_n_oe		=>	SRAM_n_oe,
		SRAM_n_we		=>	SRAM_n_we,

		-- User LEDs 
		USER_LED_outport(0) => User_LED1,
		USER_LED_outport(1) => User_LED2,	
		
		-- SPI 
		spi1_miso		=> 	spi1_miso,
		spi1_mosi		=> 	spi1_mosi,
		spi1_clk		=> 	spi1_clk,
		spi1_cs			=>	spi1_cs,
		-- PS/2 Keyboard		
		ps2k_clk_in     	=> ps2k_clk_in,
		ps2k_dat_in     	=> ps2k_dat_in,
		ps2k_clk_out     	=> ps2k_clk_out,
		ps2k_dat_out     	=> ps2k_dat_out,

		-- Digital Video out
		LVDS_Red		=> LVDS_Red,
		LVDS_Green 		=> LVDS_Green,
		LVDS_Blue		=> LVDS_Blue,
		LVDS_ck			=> LVDS_ck 
		 
	);


end architecture;
