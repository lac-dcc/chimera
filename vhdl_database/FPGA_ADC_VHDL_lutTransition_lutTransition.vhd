----------------------------------------------------------------------------------------------------
-- brief: Looks up the corrected value for an input signal and calculates the output value based on 
--        this value.
-- file: lutTransition.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 13.02.2020 | L. Leuenberger     | Auto-Created
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
-- Vivado Components library
library unisim;
-- This package contains the iobuf component.
use unisim.vcomponents.all;

------------------------------------------------------------------------------------------------
-- Entity declarations
------------------------------------------------------------------------------------------------
entity lutTransition is
	generic(
		g_NUM_OF_ELEMS              : integer := 512; -- number of elements in the delay chain (must be a multiple of 8 because of the carry chain block size! carry8 = 1 block of 8 carry elements)
		g_NUM_OF_BITS_FOR_MAX_ELEMS : integer := 10
	);
	port(
		-- Input and output ports
		fallTransition_in           : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		riseTransition_in           : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		correctedTransitionMean_out : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);
		correctedTransition1_out    : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);
		correctedTransition2_out    : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);
		-- Ports to set the data in the LUT
		fallWrEn_in                 : in  std_logic;
		fallData_in                 : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Attention one bit more -- MSb signalizes if this is valid data
		fallAddr_in                 : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		riseWrEn_in                 : in  std_logic;
		riseData_in                 : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Attention one bit more -- MSb signalizes if this is valid data
		riseAddr_in                 : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		-- Clock port
		clk                         : in  std_logic;
		clkSlow                     : in  std_logic
	);
end lutTransition;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of lutTransition is
	-------------------------------------------------------------------------------------------
	-- internal types
	--------------------------------------------------------------------------------------------
	type lut_type is array (0 to (g_NUM_OF_ELEMS - 1)) of std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);

	------------------------------------------------------------------------------------------------
	-- Internal variables
	------------------------------------------------------------------------------------------------
	shared variable lutRising  : lut_type; -- Contains the LUT for the rising edge;
	shared variable lutFalling : lut_type; -- Contains the LUT for the falling edge;

	--------------------------------------------------------------------------------------------
	-- Internal signals
	--------------------------------------------------------------------------------------------
	signal fallLUT : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);
	signal riseLUT : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);

	signal meanRiseFall_stage1 : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal fallLUT_stage1      : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);
	signal riseLUT_stage1      : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);
	signal meanRiseFall_stage2 : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);
	signal fallLUT_stage2      : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);
	signal riseLUT_stage2      : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);

	--------------------------------------------------------------------------------------------
	-- Attributes
	--------------------------------------------------------------------------------------------
	attribute ram_style : string;
	attribute ram_style of lutRising : variable is "block";
	attribute ram_style of lutFalling : variable is "block";

begin
	------------------------------------------------------------------------------------------------
	-- Write ports of the two LUTs
	------------------------------------------------------------------------------------------------
	process(clkSlow)
	begin
		-- Wait till the next rising edge occures
		if (rising_edge(clkSlow)) then
			-- Check if data shall be to the falling LUT written
			if (fallWrEn_in = '1') then
				-- Write the data
				lutFalling(to_integer(unsigned(fallAddr_in))) := fallData_in;
			end if;

			-- Check if data shall be to the rising LUT written
			if (riseWrEn_in = '1') then
				-- Write the data
				lutRising(to_integer(unsigned(riseAddr_in))) := riseData_in;
			end if;
		end if;
	end process;

	------------------------------------------------------------------------------------------------
	-- Read ports of the two LUTs
	------------------------------------------------------------------------------------------------
	process(clk)
	begin
		-- Wait till the next rising edge occures
		if (rising_edge(clk)) then
			-- Look the data up in the LUT
			riseLUT <= lutRising(to_integer(unsigned(riseTransition_in)));
			fallLUT <= lutFalling(to_integer(unsigned(fallTransition_in)));
		end if;
	end process;

	------------------------------------------------------------------------------------------------
	-- Pipeline
	------------------------------------------------------------------------------------------------	
	process(clk)
	begin
		-- Wait till the next rising edge occures
		if (rising_edge(clk)) then
			-- Stage 1
			-- Calculate the mean of the two values
			meanRiseFall_stage1 <= std_logic_vector((unsigned(riseLUT(riseLUT'length - 2 downto 0)) + unsigned(fallLUT(fallLUT'length - 2 downto 0))) / 2);

			-- Keep the pure values also
			fallLUT_stage1 <= fallLUT;
			riseLUT_stage1 <= riseLUT;

			-- Stage 2 
			-- Select the correct element
			if (riseLUT_stage1(riseLUT_stage1'length - 1) = '0' and fallLUT_stage1(fallLUT_stage1'length - 1) = '0') then
				meanRiseFall_stage2 <= '0' & meanRiseFall_stage1;
			elsif (riseLUT_stage1(riseLUT_stage1'length - 1) = '1' and fallLUT_stage1(fallLUT_stage1'length - 1) = '0') then
				meanRiseFall_stage2 <= "0" & fallLUT_stage1(fallLUT_stage1'length - 2 downto 0);
			elsif (riseLUT_stage1(riseLUT_stage1'length - 1) = '0' and fallLUT_stage1(fallLUT_stage1'length - 1) = '1') then
				meanRiseFall_stage2 <= "0" & riseLUT_stage1(riseLUT_stage1'length - 2 downto 0);
			else
				meanRiseFall_stage2 <= (others => '1');
			end if;

			-- Keep the pure values also
			fallLUT_stage2 <= fallLUT_stage1;
			riseLUT_stage2 <= riseLUT_stage1;

			-- Stage 3 
			-- Output the result
			correctedTransitionMean_out <= meanRiseFall_stage2;
			correctedTransition1_out    <= fallLUT_stage2;
			correctedTransition2_out    <= riseLUT_stage2;
		end if;
	end process;

end behavioral;
