----------------------------------------------------------------------------------------------------
-- brief: This block calcualtes the mean values over n samples.
-- file: calcMean.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
--  File history:
--
--  Version | Date       | Author             | Remarks
--  ------------------------------------------------------------------------------------------------
--  0.1	    | 17.02.2020 | L. Leuenberger     | Created
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
entity calcMean is
	generic(
		g_DATA_WIDTH    : integer range 1 to 64 := 1; -- Determines the size of the data bus
		g_NO_OF_SAMPLES : integer range 1 to 64 := 1 -- Determines the number of samples: 2^g_NO_OF_SAMPLES
	);
	port(
		-- Input / Output data
		data_in  : in  std_logic_vector(g_DATA_WIDTH - 1 downto 0);
		data_out : out std_logic_vector(g_DATA_WIDTH - 1 downto 0);
		-- Clock
		clk      : in  std_logic
	);
end calcMean;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of calcMean is

	------------------------------------------------------------------------------------------------
	-- Internal types	
	------------------------------------------------------------------------------------------------
	-- Type for the RAM
	type ram_type is array (0 to 2**g_NO_OF_SAMPLES - 1) of std_logic_vector(g_DATA_WIDTH - 1 downto 0);

	------------------------------------------------------------------------------------------------
	-- Internal signals
	------------------------------------------------------------------------------------------------
	signal blockram : ram_type := (others => (others => '0')); -- Contains the block ram

	------------------------------------------------------------------------------------------------
	-- Internal signals	
	------------------------------------------------------------------------------------------------		  														
	-- Adress counter for the RAM
	signal ramCounter : unsigned(g_NO_OF_SAMPLES - 1 downto 0) := (others => '0');

	-- Contains the sum of the data
	signal currSumData : std_logic_vector(g_DATA_WIDTH - 1 + g_NO_OF_SAMPLES downto 0);

	-- Contains the difference to add to the sum
	signal diffCurrSum : std_logic_vector(g_DATA_WIDTH downto 0); -- Signed value

	-- Signals which must be added or subtracted from the sum
	signal addSum    : std_logic_vector(g_DATA_WIDTH - 1 downto 0);
	signal subSum    : std_logic_vector(g_DATA_WIDTH - 1 downto 0);
	signal addSumBuf : std_logic_vector(g_DATA_WIDTH - 1 downto 0); -- Add an explicit register after the blockram
	signal subSumBuf : std_logic_vector(g_DATA_WIDTH - 1 downto 0); -- Add an explicit register after the blockram
begin
	------------------------------------------------------------------------------------------------
	-- This process fills the data into the blockram and returns the old value
	------------------------------------------------------------------------------------------------
	ramHandler : process(clk)
	begin
		if (rising_edge(clk)) then
			-- Write the data
			blockram(to_integer(ramCounter)) <= data_in;

			-- Read the data
			subSum <= blockram(to_integer(ramCounter));

			-- Save the data which must be added
			addSum <= data_in;

			-- Increment the counter of the RAM
			ramCounter <= ramCounter + 1;
		end if;
	end process;

	------------------------------------------------------------------------------------------------
	-- This process calculates the mean value of the sum
	------------------------------------------------------------------------------------------------
	calcMean : process(clk)
	begin
		if (rising_edge(clk)) then
			-- Buffer the data
			subSumBuf <= subSum;
			addSumBuf <= addSum;

			-- Calculate the difference
			diffCurrSum <= std_logic_vector(to_signed(to_integer(unsigned(addSumBuf)) - to_integer(unsigned(subSumBuf)), diffCurrSum'length));

			-- Add and subtract data from the current sum
			currSumData <= std_logic_vector(to_unsigned(to_integer(unsigned(currSumData)) + to_integer(signed(diffCurrSum)), currSumData'length));

			-- Output the data
			data_out <= currSumData(currSumData'length - 1 downto currSumData'length - data_out'length);
		end if;
	end process;
end behavioral;
