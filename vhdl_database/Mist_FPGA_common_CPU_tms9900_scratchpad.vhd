----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Erik Piehl
-- 
-- Create Date:    22:18:02 09/25/2017 
-- Design Name: 
-- Module Name:    scartchpad - Behavioral 
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

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY scratchpad IS
	GENERIC
	(
		widthad_a			: natural := 7;
		width_a				: natural := 16;
		outdata_reg_a : string := "UNREGISTERED"
	);
	PORT
	(
		addr	: IN STD_LOGIC_VECTOR (widthad_a-1 DOWNTO 0);
		clk		: IN STD_LOGIC ;
		din		: IN STD_LOGIC_VECTOR (width_a-1 DOWNTO 0);
		wr		: IN STD_LOGIC ;
		dout			: OUT STD_LOGIC_VECTOR (width_a-1 DOWNTO 0)
	);
END scratchpad;


ARCHITECTURE SYN OF scratchpad IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (width_a-1 DOWNTO 0);

BEGIN
	dout    <= sub_wire0(width_a-1 DOWNTO 0);

	altsyncram_component : altsyncram
	GENERIC MAP (
		clock_enable_input_a => "BYPASS",
		clock_enable_output_a => "BYPASS",
		intended_device_family => "Cyclone III",
		lpm_hint => "ENABLE_RUNTIME_MOD=NO",
		lpm_type => "altsyncram",
		numwords_a => 2**widthad_a,
		operation_mode => "SINGLE_PORT",
		outdata_aclr_a => "NONE",
		outdata_reg_a => outdata_reg_a,
		power_up_uninitialized => "FALSE",
		read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
		widthad_a => widthad_a,
		width_a => width_a,
		width_byteena_a => 1
	)
	PORT MAP (
		wren_a => wr,
		clock0 => clk,
		address_a => addr,
		data_a => din,
		q_a => sub_wire0
	);
END SYN;

