-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- =============================================================================
--	 ____  _           ____  _                 _     _ _                          
--	|  _ \(_) ___ ___ | __ )| | __ _ _______  | |   (_) |__  _ __ __ _ _ __ _   _ 
--	| |_) | |/ __/ _ \|  _ \| |/ _` |_  / _ \ | |   | | '_ \| '__/ _` | '__| | | |
--	|  __/| | (_| (_) | |_) | | (_| |/ /  __/ | |___| | |_) | | | (_| | |  | |_| |
--	|_|   |_|\___\___/|____/|_|\__,_/___\___| |_____|_|_.__/|_|  \__,_|_|   \__, |
--	                                                                        |___/ 
-- =============================================================================
-- Authors:					Patrick Lehmann
-- 
-- Package:					PicoBlaze component declarations
--
-- Description:
-- ------------------------------------
--		For detailed documentation see below.
--
-- License:
-- ============================================================================
-- Copyright 2007-2015 Patrick Lehmann - Dresden, Germany
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--		http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- ============================================================================


library IEEE;
use			IEEE.NUMERIC_STD.all;
use			IEEE.STD_LOGIC_1164.all;
use			IEEE.STD_LOGIC_TEXTIO.all;

library PoC;
use			PoC.utils.all;


package pb_comp is
	component main_Page0 is
		port (
			Clock										: in	std_logic;
			Fetch										: in	std_logic;
			Address									: in	std_logic_vector(11 downto 0);
			Instruction							: out	std_logic_vector(17 downto 0);
			
			JTAGLoader_Clock				: in	std_logic;
			JTAGLoader_Enable				: in	std_logic;
			JTAGLoader_Address			: in	std_logic_vector(11 downto 0);
			JTAGLoader_WriteEnable	: in	std_logic;
			JTAGLoader_DataIn				: in	std_logic_vector(17 downto 0);
			JTAGLoader_DataOut			: out	std_logic_vector(17 downto 0)
		);
	end component;
	
	component main_Page1 is
		port (
			Clock										: in	std_logic;
			Fetch										: in	std_logic;
			Address									: in	std_logic_vector(11 downto 0);
			Instruction							: out	std_logic_vector(17 downto 0);
			
			JTAGLoader_Clock				: in	std_logic;
			JTAGLoader_Enable				: in	std_logic;
			JTAGLoader_Address			: in	std_logic_vector(11 downto 0);
			JTAGLoader_WriteEnable	: in	std_logic;
			JTAGLoader_DataIn				: in	std_logic_vector(17 downto 0);
			JTAGLoader_DataOut			: out	std_logic_vector(17 downto 0)
		);
	end component;
	
	component main_Page2 is
		port (
			Clock										: in	std_logic;
			Fetch										: in	std_logic;
			Address									: in	std_logic_vector(11 downto 0);
			Instruction							: out	std_logic_vector(17 downto 0);
			
			JTAGLoader_Clock				: in	std_logic;
			JTAGLoader_Enable				: in	std_logic;
			JTAGLoader_Address			: in	std_logic_vector(11 downto 0);
			JTAGLoader_WriteEnable	: in	std_logic;
			JTAGLoader_DataIn				: in	std_logic_vector(17 downto 0);
			JTAGLoader_DataOut			: out	std_logic_vector(17 downto 0)
		);
	end component;
	
	component main_Page3 is
		port (
			Clock										: in	std_logic;
			Fetch										: in	std_logic;
			Address									: in	std_logic_vector(11 downto 0);
			Instruction							: out	std_logic_vector(17 downto 0);
			
			JTAGLoader_Clock				: in	std_logic;
			JTAGLoader_Enable				: in	std_logic;
			JTAGLoader_Address			: in	std_logic_vector(11 downto 0);
			JTAGLoader_WriteEnable	: in	std_logic;
			JTAGLoader_DataIn				: in	std_logic_vector(17 downto 0);
			JTAGLoader_DataOut			: out	std_logic_vector(17 downto 0)
		);
	end component;
	
	component main_Page4 is
		port (
			Clock										: in	std_logic;
			Fetch										: in	std_logic;
			Address									: in	std_logic_vector(11 downto 0);
			Instruction							: out	std_logic_vector(17 downto 0);
			
			JTAGLoader_Clock				: in	std_logic;
			JTAGLoader_Enable				: in	std_logic;
			JTAGLoader_Address			: in	std_logic_vector(11 downto 0);
			JTAGLoader_WriteEnable	: in	std_logic;
			JTAGLoader_DataIn				: in	std_logic_vector(17 downto 0);
			JTAGLoader_DataOut			: out	std_logic_vector(17 downto 0)
		);
	end component;
	
	component main_Page5 is
		port (
			Clock										: in	std_logic;
			Fetch										: in	std_logic;
			Address									: in	std_logic_vector(11 downto 0);
			Instruction							: out	std_logic_vector(17 downto 0);
			
			JTAGLoader_Clock				: in	std_logic;
			JTAGLoader_Enable				: in	std_logic;
			JTAGLoader_Address			: in	std_logic_vector(11 downto 0);
			JTAGLoader_WriteEnable	: in	std_logic;
			JTAGLoader_DataIn				: in	std_logic_vector(17 downto 0);
			JTAGLoader_DataOut			: out	std_logic_vector(17 downto 0)
		);
	end component;
	
	component main_Page6 is
		port (
			Clock										: in	std_logic;
			Fetch										: in	std_logic;
			Address									: in	std_logic_vector(11 downto 0);
			Instruction							: out	std_logic_vector(17 downto 0);
			
			JTAGLoader_Clock				: in	std_logic;
			JTAGLoader_Enable				: in	std_logic;
			JTAGLoader_Address			: in	std_logic_vector(11 downto 0);
			JTAGLoader_WriteEnable	: in	std_logic;
			JTAGLoader_DataIn				: in	std_logic_vector(17 downto 0);
			JTAGLoader_DataOut			: out	std_logic_vector(17 downto 0)
		);
	end component;
	
	component main_Page7 is
		port (
			Clock										: in	std_logic;
			Fetch										: in	std_logic;
			Address									: in	std_logic_vector(11 downto 0);
			Instruction							: out	std_logic_vector(17 downto 0);
			
			JTAGLoader_Clock				: in	std_logic;
			JTAGLoader_Enable				: in	std_logic;
			JTAGLoader_Address			: in	std_logic_vector(11 downto 0);
			JTAGLoader_WriteEnable	: in	std_logic;
			JTAGLoader_DataIn				: in	std_logic_vector(17 downto 0);
			JTAGLoader_DataOut			: out	std_logic_vector(17 downto 0)
		);
	end component;
	
	component JTAGLoader6 is
		generic (
			C_NUM_PICOBLAZE : integer := 1;
			C_JTAG_CHAIN : INTEGER					:= 2;
			C_ADDR_WIDTH : T_INTVEC(0 to 7)	:= (others => 10)
		);
		port (
			picoblaze_reset	: out std_logic_vector(C_NUM_PICOBLAZE - 1 downto 0);
			jtag_en					: out std_logic_vector(C_NUM_PICOBLAZE - 1 downto 0);
			jtag_din				: out std_logic_vector(17 downto 0);
			jtag_addr				: out std_logic_vector(imax(C_ADDR_WIDTH) - 1 downto 0);
			jtag_clk				: out std_logic;
			jtag_we					: out std_logic;
			jtag_dout_0			: in  std_logic_vector(17 downto 0);
			jtag_dout_1			: in  std_logic_vector(17 downto 0);
			jtag_dout_2			: in  std_logic_vector(17 downto 0);
			jtag_dout_3			: in  std_logic_vector(17 downto 0);
			jtag_dout_4			: in  std_logic_vector(17 downto 0);
			jtag_dout_5			: in  std_logic_vector(17 downto 0);
			jtag_dout_6			: in  std_logic_vector(17 downto 0);
			jtag_dout_7			: in  std_logic_vector(17 downto 0)
		);
	end component;
	
	component uart_tx6 is
		port (
			clk									: in std_logic;
			en_16_x_baud				: in std_logic;
			data_in							: in std_logic_vector(7 downto 0);
			buffer_reset				: in std_logic;
			buffer_write				: in std_logic;
			buffer_data_present	: out std_logic;
			buffer_half_full		: out std_logic;
			buffer_full					: out std_logic;
			serial_out					: out std_logic
		);
  end component;
	
	component uart_tx6_unconstrained is
		port (
			clk									: in	std_logic;
			en_16_x_baud				: in	std_logic;
			data_in							: in	std_logic_vector(7 downto 0);
			buffer_reset				: in	std_logic;
			buffer_write				: in	std_logic;
			buffer_data_present	: out	std_logic;
			buffer_half_full		: out	std_logic;
			buffer_full					: out	std_logic;
			serial_out					: out	std_logic
		);
  end component;
	
	component uart_rx6 is
		port (
			clk									: in	std_logic;
			en_16_x_baud				: in	std_logic;
			serial_in						: in	std_logic;
			buffer_reset				: in	std_logic;
			buffer_read					: in	std_logic;
			buffer_data_present	: out	std_logic;
			buffer_half_full		: out	std_logic;
			buffer_full					: out	std_logic;
			data_out						: out	std_logic_vector(7 downto 0)
		);
  end component;

	component uart_rx6_unconstrained is
		port (
			clk									: in	std_logic;
			en_16_x_baud				: in	std_logic;
			serial_in						: in	std_logic;
			buffer_reset				: in	std_logic;
			buffer_read					: in	std_logic;
			buffer_data_present	: out	std_logic;
			buffer_half_full		: out	std_logic;
			buffer_full					: out	std_logic;
			data_out						: out	std_logic_vector(7 downto 0)
		);
  end component;
end package;


package body pb_comp is
	
end package body;
