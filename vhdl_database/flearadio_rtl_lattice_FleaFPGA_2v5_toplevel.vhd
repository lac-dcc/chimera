----------------------------------------------------------------------------------
-- ********* Fleatiny-FPGA Platform example - Digital FM Radio ********
-- 
-- Top-level wrapper for linking the FM Radio example to the 
-- FleaFPGA Platform.
--
-- Creation Date: 15th May 2014
-- Author: Valentin Angelovski
--
-- Copyright (C) 2014 Valentin Angelovski
-- 
-- This source file may be used and distributed without 
-- restriction provided that this copyright statement is not 
-- removed from the file and that any derivative work contains 
-- the original copyright notice and the associated disclaimer.
-- 
-- This source file is free software; you can redistribute it 
-- and/or modify it under the terms of the GNU Lesser General 
-- Public License as published by the Free Software Foundation;
-- either version 2.1 of the License, or (at your option) any 
-- later version. 
-- 
-- This source is distributed in the hope that it will be 
-- useful, but WITHOUT ANY WARRANTY; without even the implied 
-- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
-- PURPOSE. See the GNU Lesser General Public License for more 
-- details. 
-- 
-- You should have received a copy of the GNU Lesser General 
-- Public License along with this source; if not, download it 
-- from http://www.opencores.org/lgpl.shtml 
-- 
----------------------------------------------------------------------------------/
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity FleaFPGA_2v5 is

  port(
    -- System clock and reset
	sys_clock		: in    std_logic;  -- main clock input from external clock source
	sys_reset		: in    std_logic;  -- main clock input from external RC reset circuit

    -- On-board user buttons and status LEDs
	n_pb1			: in    std_logic;  
	n_pb2			: in    std_logic;  
	n_led1			: buffer  std_logic;
	n_led2			: buffer  std_logic;
	n_led3			: buffer  std_logic;
	n_led4			: buffer  std_logic;
 
    -- USB Host (CH376T) interface
	host_reset		: out  std_logic;
	host_spi		: out  std_logic;
	host_nInt		: in  std_logic;
	host_sdi 		: buffer  std_logic;
	host_sdo		: in  std_logic;
	host_sck		: buffer  std_logic;	
	host_cs			: buffer  std_logic;
	host_tx_o 		: out  std_logic;
	host_rx_i 		: in  std_logic;
	
    -- USB Slave (FT230x) interface 
	slave_tx_o 		: out  std_logic;
	slave_rx_i 		: in  std_logic;
	
    -- User GPIO (18 I/O pins) Header
	GPIO 			: buffer std_logic_vector(18 downto 2);  -- GPIO Header pins available as one data block
	GPIO1 			: in  std_logic_vector(1 downto 1);	
	
	-- SDRAM interface (For use with 16Mx16bit or 32Mx16bit SDR DRAM, depending on version)
	Dram_Clk		: out   std_logic;     -- clock to SDRAM
	Dram_n_Ras		: out   std_logic;     -- SDRAM RAS
	Dram_n_Cas		: out   std_logic;     -- SDRAM CAS
	Dram_n_We		: out   std_logic;     -- SDRAM write-enable
	Dram_BA			: out   std_logic_vector(1 downto 0);   -- SDRAM bank-address
	Dram_Addr		: out   std_logic_vector(12 downto 0);  -- SDRAM address bus
	Dram_Data		: inout std_logic_vector(15 downto 0);  -- data bus to/from SDRAM
	Dram_n_cs		: out   std_logic; 
	Dram_dqm		: out   std_logic_vector(1 downto 0); 
	Dram_DQMH		: out   std_logic;
	Dram_DQML		: out   std_logic;	
	
	-- VGA interface (Note: 12-bit color organized as RGB = 4/4/4-bits)
	vga_vs			: out   std_logic; 
	vga_hs			: out   std_logic; 
	vga_red			: out   std_logic_vector(3 downto 0); 
	vga_green		: out   std_logic_vector(3 downto 0); 
	vga_blue		: out   std_logic_vector(3 downto 0); 
	
	-- SD/MMC Interface (Support either SPI or nibble-mode)
	mmc_dat1		: in   std_logic; 
	mmc_dat2		: in   std_logic; 
	mmc_n_cs		: out   std_logic; 
	mmc_clk			: out   std_logic; 
	mmc_mosi		: out   std_logic; 
	mmc_miso		: in   std_logic; 

	-- SPI SRAM (SPI-only for now..)
	spi_sram_cs 	: inout std_logic;
	spi_sram_hold 	: inout std_logic;
	spi_sram_clk 	: inout std_logic;
	spi_sram_miso 	: inout std_logic; 
	spi_sram_mosi 	: inout std_logic;

	-- Audio out (stereo-PWM) interface	
	Audio_l			: out   std_logic; 
	Audio_r			: out   std_logic; 
	
	-- PS2 interface (Both ports accessible via Y-splitter cable)
	PS2_clk1		: inout    std_logic;
	PS2_data1		: inout    std_logic;
	PS2_clk2		: inout     std_logic;
	PS2_data2		: inout     std_logic

    );
end FleaFPGA_2v5;


   
architecture arch of FleaFPGA_2v5 is
  signal both_audio_channels : std_logic;  	

begin
  -- Housekeeping logic for unwanted peripherals on FleaFPGA board goes here!!!
  -- (Note: comment out any of the following code lines if peripheral is required)
  host_cs <= '1'; 		-- USB host SPI interface disabled
  Dram_n_cs <= '1'; 	-- DRAM disabled 
  spi_sram_cs <= '1'; 	-- SRAM disabled
  mmc_n_cs <= '1';  	-- SD/MMC card disabled
  
--	n_led2 <=  '1'; -- Turn all other LED's off
--	n_led3 <=  '1';	
--	n_led4 <=  '1';  
Audio_l <= both_audio_channels;
Audio_r <= both_audio_channels;

  -- User HDL component entitites go here!

  -- Digital FM radio module connections are declared here:
 user_module1 : entity work.FleaFPGA_FM_Radio

    port map(
		rst => sys_reset,
		clk => sys_clock,
		LED(0) => n_led1,
		LED(1) => n_led2,
		LED(2) => n_led3,
		LED(3) => n_led4,
		PWM_Q => both_audio_channels, -- Mono Audio out
		Sampler_D => GPIO1(1),
		push_button1 => n_pb1,  
		push_button2 => n_pb2
    ); 

end architecture;




