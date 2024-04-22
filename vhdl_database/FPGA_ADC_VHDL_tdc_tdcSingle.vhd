----------------------------------------------------------------------------------------------------
-- brief: Implements a single channel TDC
-- file: tdcSingle.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 23.04.2020 | L. Leuenberger     | Auto-Created
----------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- Library declarations
------------------------------------------------------------------------------------------------
library ieee;
-- This package defines the basic std_logic data types and a few functions.
use ieee.std_logic_1164.all;
-- This package provides arithmetic functions for vectors.	
use ieee.numeric_std.all;
-- This package provides functions for the calcualtion with real values.
use ieee.math_real.all;
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- Entity declarations
------------------------------------------------------------------------------------------------
entity tdcSingle is
	generic(
		g_NUM_OF_ELEMS              : integer                := 960; -- number of elements in the delay chain (must be a multiple of 8 and blocksize of transition detektor because of the carry chain block size! carry8 = 1 block of 8 carry elements)
		g_X_POS_CARRY               : integer                := 66; -- defines the X position of the carry chain on the FPGA
		g_Y_POS_CARRY               : integer                := 240; -- defines the starting Y position of the carry chain on the FPGA
		g_SORT_DELAY_STA            : boolean                := true; -- Sorts the carry outputs according to the delay from the STA
		g_BLOCKSIZE_SUM             : integer range 16 to 64 := 16; -- No of carry elements which are summed together, must be 16, 32 or 64
		g_NUM_OF_BITS_FOR_MAX_ELEMS : integer                := 10
	);
	port(
		-- Input signal from comparator
		comparator_in          : in  std_logic;
		-- Measured transition out
		fallTransition_out     : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		riseTransition_out     : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		-- Detected length of carry chain
		sumOnes_out            : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		-- Configuration signals
		runLength_in           : in  std_logic;
		runINL_in              : in  std_logic;
		-- Clocks
		clk_600MHz             : in  std_logic;
		clk_600MHz_Calibration : in  std_logic;
		clk_571Mhz             : in  std_logic
	);
end entity tdcSingle;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of tdcSingle is
	------------------------------------------------------------------------------------------------
	-- Internal signals
	------------------------------------------------------------------------------------------------
	signal carryChain : std_logic_vector(g_NUM_OF_ELEMS - 1 downto 0); -- carry chain output raw

	------------------------------------------------------------------------------------------------
	-- Attributes
	------------------------------------------------------------------------------------------------
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER of clk_600MHz : SIGNAL is "xilinx.com:signal:clock:1.0 clk_600MHz CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk_600MHz_Calibration : SIGNAL is "xilinx.com:signal:clock:1.0 clk_600MHz_Calibration CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk_571Mhz : SIGNAL is "xilinx.com:signal:clock:1.0 clk_571Mhz CLK";
begin
	------------------------------------------------------------------------------------------------
	-- Instantitate the carry chain
	------------------------------------------------------------------------------------------------
	inst_carryChain : entity work.carryChain
		generic map(
			g_NUM_OF_ELEMS   => g_NUM_OF_ELEMS,
			g_X_POS          => g_X_POS_CARRY,
			g_Y_POS          => g_Y_POS_CARRY,
			g_RTL_SIMULATION => false,
			g_SORT_DELAY_STA => g_SORT_DELAY_STA
		)
		port map(
			clk              => clk_600MHz,
			carry_chain_in   => comparator_in,
			carry_chain2_in  => clk_600MHz_Calibration,
			carry_chain3_in  => clk_571Mhz,
			carry_chain_out  => carryChain,
			carry_mux_sel_in => runINL_in & runLength_in
		);

	------------------------------------------------------------------------------------------------
	-- Instantiate the transition detection
	------------------------------------------------------------------------------------------------
	inst_transDet : entity work.transitionDetector
		generic map(
			g_NUM_OF_ELEMS              => g_NUM_OF_ELEMS,
			g_BLOCKSIZE_SUM             => g_BLOCKSIZE_SUM,
			g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS
		)
		port map(
			carry_chain_in     => carryChain,
			fallTransition_out => fallTransition_out,
			riseTransition_out => riseTransition_out,
			sumOnes_out        => sumOnes_out,
			clk                => clk_600MHz
		);

end architecture behavioral;
