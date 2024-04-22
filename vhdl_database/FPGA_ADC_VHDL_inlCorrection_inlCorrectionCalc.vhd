----------------------------------------------------------------------------------------------------
-- brief: INL Correction Calc - Correct a TDC value with the INL value
-- file: inlCorrectionCalc.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 10.04.2020 | L. Leuenberger     | Auto-Created
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
-- Entity declarations
------------------------------------------------------------------------------------------------
entity inlCorrectionCalc is
	generic(
		g_NUM_OF_BITS_FOR_MAX_ELEMS : integer := 10;
		g_NO_OF_SAMPLES_HIST        : integer := 12 -- 2** g_NO_OF_SAMPLES_HIST
	);
	port(
		-- Signals which are used to read the data from the inl
		inlAddr_out            : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		inlData_in             : in  std_logic_vector(g_NO_OF_SAMPLES_HIST downto 0); -- Range -2**g_NO_OF_SAMPLES_HIST to 2**g_NO_OF_SAMPLES_HIST
		-- Detected length of carry chain
		minLengthCarryChain_in : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		maxLengthCarryChain_in : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		-- Transition in and out
		transition_in          : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		transition_out         : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		dataValid_in           : in  std_logic;
		dataValid_out          : out std_logic;
		--  Clock
		clk                    : in  std_logic
	);
end inlCorrectionCalc;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of inlCorrectionCalc is

	--------------------------------------------------------------------------------------------
	-- Internal signals
	--------------------------------------------------------------------------------------------
	-- Stage 1 to 3
	signal inlAddr_stage0      : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal transition_stage0   : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal transition_stage1   : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal transition_stage2   : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal transition_stage3   : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal transition_stage5   : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal inlData_stage3      : std_logic_vector(g_NO_OF_SAMPLES_HIST downto 0);
	signal calcDiff            : integer range -(2**g_NO_OF_SAMPLES_HIST * 2**g_NUM_OF_BITS_FOR_MAX_ELEMS) to (2**g_NO_OF_SAMPLES_HIST * 2**g_NUM_OF_BITS_FOR_MAX_ELEMS);
	signal maxLengthCarryChain : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal minLengthCarryChain : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal dataValid_stage0    : std_logic;
	signal dataValid_stage1    : std_logic;
	signal dataValid_stage2    : std_logic;
	signal dataValid_stage3    : std_logic;
	signal dataValid_stage4    : std_logic;
	signal dataValid_stage5    : std_logic;

begin
	------------------------------------------------------------------------------------------------
	-- Correction Pipeline
	------------------------------------------------------------------------------------------------
	-- This process corrects the input value
	corrPipe : process(clk)
	begin
		-- Check for a rising edge
		if (rising_edge(clk)) then
			-- Register the length 
			maxLengthCarryChain <= maxLengthCarryChain_in;
			minLengthCarryChain <= minLengthCarryChain_in;

			-- Stage 0
			inlAddr_stage0    <= std_logic_vector(to_unsigned(to_integer(unsigned(transition_in)), g_NUM_OF_BITS_FOR_MAX_ELEMS));
			transition_stage0 <= transition_in;
			dataValid_stage0  <= dataValid_in;

			-- Stage 1 -- Read the data from the BRAM
			inlAddr_out       <= inlAddr_stage0;
			transition_stage1 <= transition_stage0;
			dataValid_stage1  <= dataValid_stage0;

			-- Stage 2: Wait for data
			transition_stage2 <= transition_stage1;
			dataValid_stage2  <= dataValid_stage1;

			-- Stage 3: Register data --> Timing issue
			inlData_stage3    <= inlData_in;
			transition_stage3 <= transition_stage2;
			dataValid_stage3  <= dataValid_stage2;

			-- Stage 4: Calculate the new value
			calcDiff         <= to_integer(unsigned(transition_stage3)) + to_integer(signed(inlData_stage3) / 2); -- Performs better if divided by two
			dataValid_stage4 <= dataValid_stage3;

			-- Stage 5: Check if the result is smaller than the minimum of the delay chain or larger than the carry chain
			if (calcDiff < to_integer(unsigned(minLengthCarryChain))) or (calcDiff > to_integer(unsigned(maxLengthCarryChain))) then
				-- Return zero
				transition_stage5 <= (others => '0');
				dataValid_stage5  <= '0';
			else
				-- Return the calcualted value
				transition_stage5 <= std_logic_vector(to_unsigned(calcDiff, g_NUM_OF_BITS_FOR_MAX_ELEMS));
				dataValid_stage5  <= dataValid_stage4;
			end if;

			-- Stage 6: Output the calculated value
			transition_out <= transition_stage5;
			dataValid_out  <= dataValid_stage5;

		end if;
	end process corrPipe;

end behavioral;
