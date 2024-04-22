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
 
entity FleaFPGA_2v4 is

	port(
	-- System clock and reset
	sys_clock		: in		std_logic;	-- main clock input from external clock source
	sys_reset		: in		std_logic;	-- main clock input from external RC reset circuit

	-- On-board user buttons and status LEDs
	n_pb1			: in		std_logic;	-- main clock input from external clock source
	n_pb2			: in		std_logic;	-- main clock input from external RC reset circuit
	n_led1			: buffer	std_logic;
	n_led2			: buffer	std_logic;
	n_led3			: buffer	std_logic;
	n_led4			: buffer	std_logic;

	-- USB Host (CH376T) interface
	host_reset		: buffer	std_logic;
	host_cs			: buffer	std_logic;
	host_sck		: buffer	std_logic;
	host_spi		: buffer	std_logic;
	host_tx_o 		: out		std_logic;
	host_rx_i 		: in		std_logic;

	-- USB Slave (FT230x) interface
	slave_tx_o 		: out		std_logic;
	slave_rx_i 		: in		std_logic;

	-- User GPIO (18 I/O pins) Header
	GPIO 			: inout 	std_logic_vector(18 downto 1);	-- GPIO Header pins available as one data block
	GPIO1 			: in		std_logic_vector(1 downto 1);

	-- SDRAM interface (For use with 16Mx16bit or 32Mx16bit SDR DRAM, depending on version)
	Dram_Clk		: out		std_logic;	-- clock to SDRAM
	Dram_n_Ras		: out		std_logic;	-- SDRAM RAS
	Dram_n_Cas		: out		std_logic;	-- SDRAM CAS
	Dram_n_We		: out		std_logic;	-- SDRAM write-enable
	Dram_BA			: out		std_logic_vector(1 downto 0);	-- SDRAM bank-address
	Dram_Addr		: out		std_logic_vector(12 downto 0);	-- SDRAM address bus
	Dram_Data		: inout		std_logic_vector(15 downto 0);	-- data bus to/from SDRAM
	Dram_n_cs		: out		std_logic;
	--Dram_dqm		: out		std_logic_vector(1 downto 0);
	Dram_DQMH		: out		std_logic;
	Dram_DQML		: out		std_logic;

	-- VGA interface (Note: 10-bit color organized as RGB = 3/4/3-bits)
	vga_vs			: out		std_logic;
	vga_hs			: out		std_logic;
	vga_red			: out		std_logic_vector(3 downto 0);
	vga_green		: out		std_logic_vector(3 downto 0);
	vga_blue		: out		std_logic_vector(3 downto 0);

	-- SD/MMC Interface (Support either SPI or nibble-mode)
	mmc_dat1		: in		std_logic;
	mmc_dat2		: in		std_logic;
	mmc_n_cs		: out		std_logic;
	mmc_clk			: out		std_logic;
	mmc_mosi		: out		std_logic;
	mmc_miso		: in		std_logic;

	-- Audio out (stereo-PWM) interface
	Audio_l			: out		std_logic;
	Audio_r			: out		std_logic;

	-- PS2 interface (Both ports accessible via Y-splitter cable)
	PS2_clk1		: inout		std_logic;
	PS2_data1		: inout		std_logic;
	PS2_clk2		: inout		std_logic;
	PS2_data2		: inout		std_logic
	);
end FleaFPGA_2v4;

architecture arch of FleaFPGA_2v4 is

	signal clk100	: std_logic;
	signal clk25	: std_logic;

	signal ps2k_clk_in : std_logic;
	signal ps2k_clk_out : std_logic;
	signal ps2k_dat_in : std_logic;
	signal ps2k_dat_out : std_logic;
	
begin
	-- Housekeeping logic for unwanted peripherals on FleaFPGA board goes here..
	-- (Note: comment out any of the following code lines if peripheral is required)

	mmc_n_cs	<= '1';
	host_cs		<= '1';
	
	ps2k_dat_in<=PS2_data1;
	PS2_data1 <= '0' when ps2k_dat_out='0' else 'Z';
	ps2k_clk_in<=PS2_clk1;
	PS2_clk1 <= '0' when ps2k_clk_out='0' else 'Z';	
	
	-- User HDL project modules and port mappings go here..

	u0 : entity work.Sweet32_clkgen
	port map(
		CLKI			=>	sys_clock,
		CLKOP			=>	clk100,
		CLKOS 			=> Dram_Clk
		);

	u1 : entity work.Sweet32_vgaclkgen
	port map(
		CLKI			=>	sys_clock,
		CLKOP			=>	clk25);

	u2 : entity work.Sweet32_BIU_DRAM_VGA
	generic map(
		SYS_CLOCK_HZ	=>	100_000_000,	-- master clock rate in Hz
		BAUD_RATE		=>	115_200			-- UART baud rate
	)
 
	
 	port map(
		-- System signals
		clk				=> clk100,
		reset_in		=> n_pb2,
		
		vgaclk			=> 	clk25,
		R				=>	vga_red,
		G				=>	vga_green,
		B				=>	vga_blue,
		hsync			=>	vga_hs,
		vsync			=>	vga_vs,

		-- User LEDs
		GPIO_outport(0)	=>	n_led1,
		GPIO_outport(1)	=>	n_led2,
		GPIO_outport(2)	=>	n_led3,
		GPIO_outport(3)	=>	n_led4,

		-- GPIO (16-bit bidirectional port)
		GPIO_wordport	=>	GPIO(16 downto 1),

		-- PWM
		PWM0_out		=>	Audio_l,
		PWM1_out		=>	Audio_r,

		-- ADC
		--ADC0_Q_ouput	=>	GPIO(11),
		--ADC0_D_input	=>	GPIO1(1),

		-- UART
		rxd				=>	slave_rx_i,
		txd				=>	slave_tx_o,
		
		-- SDRAM	
		Dram_n_Ras     	=> Dram_n_Ras,
		Dram_n_Cas     	=> Dram_n_Cas,
		Dram_n_We      	=> Dram_n_We,
		Dram_BA(0)    	=> Dram_BA(0),
		Dram_BA(1)    	=> Dram_BA(1),
		Dram_n_cs	    => Dram_n_cs,	
		Dram_DQMH     	=> Dram_DQMH,
		Dram_DQML    	=> Dram_DQML,  
		Dram_Addr     	=> Dram_Addr,
		Dram_Data     	=> Dram_Data,
		
		-- PS/2 Keyboard		
		ps2k_clk_in     	=> ps2k_clk_in,
		ps2k_dat_in     	=> ps2k_dat_in,
		ps2k_clk_out     	=> ps2k_clk_out,
		ps2k_dat_out     	=> ps2k_dat_out 

		
	);
end architecture;
