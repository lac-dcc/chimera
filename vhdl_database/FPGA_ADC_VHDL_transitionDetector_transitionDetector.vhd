----------------------------------------------------------------------------------------------------
-- brief: Detects up to two transitions (one rising and one falling) in the carry chain output
--        Partially based on an implementation from Dorian Amiet
-- file: transitionDetector.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 28.01.2020 | L. Leuenberger     | Auto-Created
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
entity transitionDetector is
	generic(
		g_NUM_OF_ELEMS  : integer               := 960; -- number of elements in the delay chain (must be a multiple of 8 because of the carry chain block size! carry8 = 1 block of 8 carry elements)
		g_BLOCKSIZE_SUM : integer range 8 to 64 := 16; -- No of carry elements which are summed together, must be 8, 16, 32 or 64
		g_NUM_OF_BITS_FOR_MAX_ELEMS : integer := 10
	);
	port(
		-- Input and output ports
		carry_chain_in  : in  std_logic_vector(g_NUM_OF_ELEMS - 1 downto 0); -- carry chain raw input
		fallTransition_out : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); --std_logic_vector(integer(ceil(log2(real(g_NUM_OF_ELEMS)))) - 1 downto 0);
		riseTransition_out : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); --std_logic_vector(integer(ceil(log2(real(g_NUM_OF_ELEMS)))) - 1 downto 0);
		sumOnes_out : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); 
		-- Clock port
		clk             : in  std_logic
	);
end transitionDetector;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of transitionDetector is
	------------------------------------------------------------------------------------------------
	-- Function to get the number of bits
	------------------------------------------------------------------------------------------------
	pure function getNoOfBit(input : std_logic_vector((g_BLOCKSIZE_SUM / 8) - 1 downto 0)) return integer is
		variable sum : integer range 0 to (g_BLOCKSIZE_SUM / 8) := 0;
	begin
		for i in 0 to input'length - 1 loop
			sum := sum + to_integer(unsigned(input(i downto i)));
		end loop;
		return sum;
	end function;

	------------------------------------------------------------------------------------------------
	-- Function to get nearest number which is dividable by the provided number
	------------------------------------------------------------------------------------------------
	pure function getNextNumberDividableByX(inputVal : integer; factor : integer) return integer is
	begin
		if ((inputVal mod factor) = 0) then
			return (inputVal);
		else 
			return (factor * ((inputVal / factor) + 1));
		end if;
	end function;
	
	------------------------------------------------------------------------------------------------
	-- Round a number to zero if it is negative
	------------------------------------------------------------------------------------------------
	pure function getPositiveOrZero(inputVal : integer) return integer is
	begin
		if (inputVal > 0) then
			return (inputVal);
		else 
			return (0);
		end if;
	end function;

	------------------------------------------------------------------------------------------------
	-- Constants
	------------------------------------------------------------------------------------------------
	-- Constants used for Transition Detector
	constant c_NUM_ELEMENTS_STAGE_0 : integer := g_NUM_OF_ELEMS / g_BLOCKSIZE_SUM * 8;
	constant c_NUM_ELEMENTS_STAGE_1 : integer := g_NUM_OF_ELEMS / g_BLOCKSIZE_SUM * 4;
	constant c_NUM_ELEMENTS_STAGE_2 : integer := g_NUM_OF_ELEMS / g_BLOCKSIZE_SUM * 2;
	constant c_NUM_ELEMENTS_STAGE_3 : integer := g_NUM_OF_ELEMS / g_BLOCKSIZE_SUM * 2 - 1; -- Calculating sum overlapping
	constant c_NUM_ELEMENTS_STAGE_4 : integer := c_NUM_ELEMENTS_STAGE_3; 
	constant c_NUM_ELEMENTS_STAGE_5 : integer := getNextNumberDividableByX(c_NUM_ELEMENTS_STAGE_4 - 2, 4); -- First and last sum will are discarded also this will be expanded so that it can be divided by four
	constant c_NUM_ELEMENTS_STAGE_6 : integer := getNextNumberDividableByX(c_NUM_ELEMENTS_STAGE_4 / 4, 4);
	constant c_NUM_ELEMENTS_STAGE_7 : integer := getNextNumberDividableByX(c_NUM_ELEMENTS_STAGE_6 / 4, 4);
	constant c_NUM_ELEMENTS_STAGE_8 : integer := getNextNumberDividableByX(c_NUM_ELEMENTS_STAGE_7 / 4, 4);
	
	-- Constant used for Sum calculation
	constant c_NUM_STAGES : integer := integer(ceil(log2(real(g_NUM_OF_ELEMS / g_BLOCKSIZE_SUM))));
	constant c_NUM_ELEMENTS_SUM_STAGE_3 : integer := 2**c_NUM_STAGES;
	constant c_NUM_ELEMENTS_SUM_STAGE_4 : integer := 2**(c_NUM_STAGES - 1);
	constant c_NUM_ELEMENTS_SUM_STAGE_5 : integer := 2**(c_NUM_STAGES - 2);
	constant c_NUM_ELEMENTS_SUM_STAGE_6 : integer := 2**(getPositiveOrZero(c_NUM_STAGES - 3));
	constant c_NUM_ELEMENTS_SUM_STAGE_7 : integer := 2**(getPositiveOrZero(c_NUM_STAGES - 4));
	constant c_NUM_ELEMENTS_SUM_STAGE_8 : integer := 2**(getPositiveOrZero(c_NUM_STAGES - 5));

	------------------------------------------------------------------------------------------------
	-- Types
	------------------------------------------------------------------------------------------------
	-- Types used for Transition Detector
	type sum_stage_0_type is array (0 to c_NUM_ELEMENTS_STAGE_0 - 1) of integer range 0 to (g_BLOCKSIZE_SUM / 8);
	type sum_stage_1_type is array (0 to c_NUM_ELEMENTS_STAGE_1 - 1) of integer range 0 to (g_BLOCKSIZE_SUM / 4);
	type sum_stage_2_type is array (0 to c_NUM_ELEMENTS_STAGE_2 - 1) of integer range 0 to (g_BLOCKSIZE_SUM / 2);
	type sum_stage_3_type is array (0 to c_NUM_ELEMENTS_STAGE_3 - 1) of integer range 0 to (g_BLOCKSIZE_SUM);
	type sum_stage_4_type is array (0 to c_NUM_ELEMENTS_STAGE_4 - 1) of integer range 0 to (g_BLOCKSIZE_SUM);
	type sum_stage_5_type is array (0 to c_NUM_ELEMENTS_STAGE_5 - 1) of integer range 0 to (g_BLOCKSIZE_SUM);
	type sum_stage_6_type is array (0 to c_NUM_ELEMENTS_STAGE_6 - 1) of integer range 0 to (g_BLOCKSIZE_SUM);
	type sum_stage_7_type is array (0 to c_NUM_ELEMENTS_STAGE_7 - 1) of integer range 0 to (g_BLOCKSIZE_SUM);
	type sum_stage_8_type is array (0 to c_NUM_ELEMENTS_STAGE_8 - 1) of integer range 0 to (g_BLOCKSIZE_SUM);
	type valid_stage_6_type is array (0 to c_NUM_ELEMENTS_STAGE_6 - 1) of integer range 0 to c_NUM_ELEMENTS_STAGE_5;
	type valid_stage_7_type is array (0 to c_NUM_ELEMENTS_STAGE_7 - 1) of integer range 0 to c_NUM_ELEMENTS_STAGE_5;
	type valid_stage_8_type is array (0 to c_NUM_ELEMENTS_STAGE_8 - 1) of integer range 0 to c_NUM_ELEMENTS_STAGE_5;
	
	-- Types used for Sum calculation
	type sum_calc_stage_3_type is array (0 to c_NUM_ELEMENTS_SUM_STAGE_3 - 1) of integer range 0 to (g_NUM_OF_ELEMS / c_NUM_ELEMENTS_SUM_STAGE_3);
	type sum_calc_stage_4_type is array (0 to c_NUM_ELEMENTS_SUM_STAGE_4 - 1) of integer range 0 to (g_NUM_OF_ELEMS / c_NUM_ELEMENTS_SUM_STAGE_4);
	type sum_calc_stage_5_type is array (0 to c_NUM_ELEMENTS_SUM_STAGE_5 - 1) of integer range 0 to (g_NUM_OF_ELEMS / c_NUM_ELEMENTS_SUM_STAGE_5);
	type sum_calc_stage_6_type is array (0 to c_NUM_ELEMENTS_SUM_STAGE_6 - 1) of integer range 0 to (g_NUM_OF_ELEMS / c_NUM_ELEMENTS_SUM_STAGE_6);
	type sum_calc_stage_7_type is array (0 to c_NUM_ELEMENTS_SUM_STAGE_7 - 1) of integer range 0 to (g_NUM_OF_ELEMS / c_NUM_ELEMENTS_SUM_STAGE_7);
	type sum_calc_stage_8_type is array (0 to c_NUM_ELEMENTS_SUM_STAGE_8 - 1) of integer range 0 to (g_NUM_OF_ELEMS / c_NUM_ELEMENTS_SUM_STAGE_8);
	
	------------------------------------------------------------------------------------------------
	-- Signals
	------------------------------------------------------------------------------------------------
	-- Signals for transition Detector
	signal sum_stage_0                     : sum_stage_0_type;
	signal sum_stage_1                     : sum_stage_1_type;
	signal sum_stage_2                     : sum_stage_2_type;
	signal sum_stage_3                     : sum_stage_3_type;
	signal transition_dir_stage_4          : std_logic_vector(c_NUM_ELEMENTS_STAGE_4 - 1 downto 0) := (others => '0');
	signal transition_valid_stage_4        : std_logic_vector(c_NUM_ELEMENTS_STAGE_4 - 1 downto 0) := (others => '0');
	signal sum_stage_4                     : sum_stage_4_type;
	signal transition_dir_stage_5          : std_logic_vector(c_NUM_ELEMENTS_STAGE_5 - 1 downto 0) := (others => '0');
	signal transition_valid_stage_5        : std_logic_vector(c_NUM_ELEMENTS_STAGE_5 - 1 downto 0) := (others => '0');
	signal sum_stage_5                     : sum_stage_5_type;
	signal sum_Rise_stage_6                : sum_stage_6_type;
	signal sum_Fall_stage_6                : sum_stage_6_type;
	signal transition_validRise_pos_stage_6 : valid_stage_6_type;
	signal transition_validFall_pos_stage_6 : valid_stage_6_type;
	signal sum_Rise_stage_7                : sum_stage_7_type;
	signal sum_Fall_stage_7                : sum_stage_7_type;
	signal transition_validRise_pos_stage_7 : valid_stage_7_type;
	signal transition_validFall_pos_stage_7 : valid_stage_7_type;
	signal sum_Rise_stage_8                : sum_stage_8_type;
	signal sum_Fall_stage_8                : sum_stage_8_type;
	signal transition_validRise_pos_stage_8 : valid_stage_8_type;
	signal transition_validFall_pos_stage_8 : valid_stage_8_type;
	signal sum_Rise_stage_9                : integer range 0 to g_BLOCKSIZE_SUM;
	signal sum_Fall_stage_9                : integer range 0 to g_BLOCKSIZE_SUM;
	signal transition_validRise_pos_stage_9 : integer range 0 to c_NUM_ELEMENTS_STAGE_4;
	signal transition_validFall_pos_stage_9 : integer range 0 to c_NUM_ELEMENTS_STAGE_4;
	
	-- Signals for Sum calculaiton
	signal sum_calc_stage_3                     : sum_calc_stage_3_type;
	signal sum_calc_stage_4                     : sum_calc_stage_4_type;
	signal sum_calc_stage_5                     : sum_calc_stage_5_type;
	signal sum_calc_stage_6                     : sum_calc_stage_6_type;
	signal sum_calc_stage_7                     : sum_calc_stage_7_type;
	signal sum_calc_stage_8                     : sum_calc_stage_8_type;
begin
	------------------------------------------------------------------------------------------------
	-- Create the sum and calculate the transitions
	------------------------------------------------------------------------------------------------
	proc_sumAndTransition : process(clk) is
	begin
		if rising_edge(clk) then
			-- Stage 0 -  Create sum of an eight of the block size
			for i in 0 to c_NUM_ELEMENTS_STAGE_0 - 1 loop
				sum_stage_0(i) <= getNoOfBit(carry_chain_in(((i + 1) * (g_BLOCKSIZE_SUM / 8)) - 1 downto (i * (g_BLOCKSIZE_SUM / 8))));
			end loop;

			-- Stage 1 -  Create sum of a fourth of the block size
			for i in 0 to c_NUM_ELEMENTS_STAGE_1 - 1 loop
				sum_stage_1(i) <= sum_stage_0((i * 2) + 1) + sum_stage_0((i * 2));
			end loop;

			-- Stage 2 -  Create sum of a half of the block size
			for i in 0 to c_NUM_ELEMENTS_STAGE_2 - 1 loop
				sum_stage_2(i) <= sum_stage_1((i * 2) + 1) + sum_stage_1((i * 2));
			end loop;

			-- Stage 3 -  Create sum of the block size (Overlapping to filter out noise)
			for i in 0 to c_NUM_ELEMENTS_STAGE_3 - 1 loop
				sum_stage_3(i) <= sum_stage_2(i + 1) + sum_stage_2(i);
			end loop;

			-- Stage 4 - Detect transitions
			for i in 1 to c_NUM_ELEMENTS_STAGE_3 - 2 loop
				-- detect transission in the local sum
				if (sum_stage_3(i) /= 0) and (sum_stage_3(i) /= g_BLOCKSIZE_SUM) then

					-- ones after (in timing before! transition)
					if sum_stage_3(i + 1) > g_BLOCKSIZE_SUM / 2 then

						-- falling transition
						transition_dir_stage_4(i) <= '0';

						-- zeroes before (in timing after! transition)
						if sum_stage_3(i - 1) < g_BLOCKSIZE_SUM / 2 then
							transition_valid_stage_4(i) <= '1'; -- Valid transition
						else
							transition_valid_stage_4(i) <= '0'; -- Invalid transition
						end if;

					-- zeroes after (in timing before! transition)	
					elsif sum_stage_3(i + 1) < g_BLOCKSIZE_SUM / 2 then -- TODO: What is when equal number of ones and zeros?

						-- rising transition
						transition_dir_stage_4(i) <= '1';

						-- ones before (in timing after! transition)
						if sum_stage_3(i - 1) > g_BLOCKSIZE_SUM / 2 then
							transition_valid_stage_4(i) <= '1'; -- Valid transition
						else
							transition_valid_stage_4(i) <= '0'; -- Invalid transition
						end if;
					end if;
				else
					-- No transition found
					transition_valid_stage_4(i) <= '0';
					transition_dir_stage_4(i)   <= '-'; --Don't care
				end if;

				-- Keep also the sum
				sum_stage_4(i) <= sum_stage_3(i); 
			end loop;
			
			-- Stage 5 - Filter out overlapping transitions
			for i in 1 to c_NUM_ELEMENTS_STAGE_4 - 2 loop
				if (transition_valid_stage_4(i) = '1') then
					-- Check if there is a larger transition on the right side
					if (transition_valid_stage_4(i + 1) = '1' and transition_dir_stage_4(i) = transition_dir_stage_4(i + 1) and sum_stage_4(i) <= sum_stage_4(i + 1)) then
						-- Invalidate this stage
						transition_valid_stage_5(i - 1) <= '0';
						transition_dir_stage_5(i - 1)   <= '-'; --Don't care
						sum_stage_5(i - 1) <= sum_stage_4(i); 
												
					else
						-- Just keep the old values
						transition_valid_stage_5(i - 1) <= transition_valid_stage_4(i);
						transition_dir_stage_5(i - 1)   <= transition_dir_stage_4(i);
						sum_stage_5(i - 1) <= sum_stage_4(i); 
					end if;
				else
					transition_valid_stage_5(i - 1) <= '0'; 
					transition_dir_stage_5(i - 1)   <= '-'; --Don't care
					sum_stage_5(i - 1) <= sum_stage_4(i); 
				end if;
			end loop;

			-- Stage 6 - Keep only the first falling and rising transition, search local over four sums
			for i in 0 to c_NUM_ELEMENTS_STAGE_5 / 4 - 1 loop
				-- Reset everything
				transition_validRise_pos_stage_6(i) <= 0;
				transition_validFall_pos_stage_6(i) <= 0;
				sum_Rise_stage_6(i)                <= 0;
				sum_Fall_stage_6(i)                <= 0;
					
				-- Search for transitions
				if (transition_valid_stage_5(i * 4) = '1') then
					if (transition_dir_stage_5(i * 4) = '1') then
						transition_validRise_pos_stage_6(i) <= i * 4 + 1;
						sum_Rise_stage_6(i)                <= sum_stage_5(i * 4);
					else
						transition_validFall_pos_stage_6(i) <= i * 4 + 1;
						sum_Fall_stage_6(i)                <= sum_stage_5(i * 4);
					end if;
				elsif (transition_valid_stage_5(i * 4 + 1) = '1') then
					if (transition_dir_stage_5(i * 4 + 1) = '1') then
						transition_validRise_pos_stage_6(i) <= i * 4 + 2;
						sum_Rise_stage_6(i)                <= sum_stage_5(i * 4 + 1);
					else
						transition_validFall_pos_stage_6(i) <= i * 4 + 2;
						sum_Fall_stage_6(i)                <= sum_stage_5(i * 4 + 1);
					end if;
				elsif (transition_valid_stage_5(i * 4 + 2) = '1') then
					if (transition_dir_stage_5(i * 4 + 2) = '1') then
						transition_validRise_pos_stage_6(i) <= i * 4 + 3;
						sum_Rise_stage_6(i)                <= sum_stage_5(i * 4 + 2);
					else
						transition_validFall_pos_stage_6(i) <= i * 4 + 3;
						sum_Fall_stage_6(i)                <= sum_stage_5(i * 4 + 2);
					end if;
				elsif (transition_valid_stage_5(i * 4 + 3) = '1') then
					if (transition_dir_stage_5(i * 4 + 3) = '1') then
						transition_validRise_pos_stage_6(i) <= i * 4 + 4;
						sum_Rise_stage_6(i)                <= sum_stage_5(i * 4 + 3);
					else
						transition_validFall_pos_stage_6(i) <= i * 4 + 4;
						sum_Fall_stage_6(i)                <= sum_stage_5(i * 4 + 3);
					end if;
				end if;
			end loop;

			-- Stage 7 - Keep only the first falling and rising transition, search over next four sums
			for i in 0 to c_NUM_ELEMENTS_STAGE_6 / 4 - 1 loop
				-- Rising transition
				if (transition_validRise_pos_stage_6(i * 4) > 0) then
					transition_validRise_pos_stage_7(i) <= transition_validRise_pos_stage_6(i * 4);
					sum_Rise_stage_7(i)                <= sum_Rise_stage_6(i * 4);
				elsif (transition_validRise_pos_stage_6(i * 4 + 1) > 0) then
					transition_validRise_pos_stage_7(i) <= transition_validRise_pos_stage_6(i * 4 + 1);
					sum_Rise_stage_7(i)                <= sum_Rise_stage_6(i * 4 + 1);
				elsif (transition_validRise_pos_stage_6(i * 4 + 2) > 0) then
					transition_validRise_pos_stage_7(i) <= transition_validRise_pos_stage_6(i * 4 + 2);
					sum_Rise_stage_7(i)                <= sum_Rise_stage_6(i * 4 + 2);
				elsif (transition_validRise_pos_stage_6(i * 4 + 3) > 0) then
					transition_validRise_pos_stage_7(i) <= transition_validRise_pos_stage_6(i * 4 + 3);
					sum_Rise_stage_7(i)                <= sum_Rise_stage_6(i * 4 + 3);
				else
					sum_Rise_stage_7(i)                <= 0;
					transition_validRise_pos_stage_7(i) <= 0;
				end if;

				-- Falling transition
				if (transition_validFall_pos_stage_6(i * 4) > 0) then
					transition_validFall_pos_stage_7(i) <= transition_validFall_pos_stage_6(i * 4);
					sum_Fall_stage_7(i)                <= sum_Fall_stage_6(i * 4);
				elsif (transition_validFall_pos_stage_6(i * 4 + 1) > 0) then
					transition_validFall_pos_stage_7(i) <= transition_validFall_pos_stage_6(i * 4 + 1);
					sum_Fall_stage_7(i)                <= sum_Fall_stage_6(i * 4 + 1);
				elsif (transition_validFall_pos_stage_6(i * 4 + 2) > 0) then
					transition_validFall_pos_stage_7(i) <= transition_validFall_pos_stage_6(i * 4 + 2);
					sum_Fall_stage_7(i)                <= sum_Fall_stage_6(i * 4 + 2);
				elsif (transition_validFall_pos_stage_6(i * 4 + 3) > 0) then
					transition_validFall_pos_stage_7(i) <= transition_validFall_pos_stage_6(i * 4 + 3);
					sum_Fall_stage_7(i)                <= sum_Fall_stage_6(i * 4 + 3);
				else
					sum_Fall_stage_7(i)                <= 0;
					transition_validFall_pos_stage_7(i) <= 0;
				end if;
			end loop;

			-- Stage 8 - Keep only the first falling and rising transition, search over next four sums
			for i in 0 to c_NUM_ELEMENTS_STAGE_7 / 4 - 1 loop
				-- Rising transition
				if (transition_validRise_pos_stage_7(i * 4) > 0) then
					sum_Rise_stage_8(i)                <= sum_Rise_stage_7(i * 4);
					transition_validRise_pos_stage_8(i) <= transition_validRise_pos_stage_7(i * 4);
				elsif (transition_validRise_pos_stage_7(i * 4 + 1) > 0) then
					sum_Rise_stage_8(i)                <= sum_Rise_stage_7(i * 4 + 1);
					transition_validRise_pos_stage_8(i) <= transition_validRise_pos_stage_7(i * 4 + 1);
				elsif (transition_validRise_pos_stage_7(i * 4 + 2) > 0) then
					sum_Rise_stage_8(i)                <= sum_Rise_stage_7(i * 4 + 2);
					transition_validRise_pos_stage_8(i) <= transition_validRise_pos_stage_7(i * 4 + 2);
				elsif (transition_validRise_pos_stage_7(i * 4 + 3) > 0) then
					sum_Rise_stage_8(i)                <= sum_Rise_stage_7(i * 4 + 3);
					transition_validRise_pos_stage_8(i) <= transition_validRise_pos_stage_7(i * 4 + 3);
				else
					sum_Rise_stage_8(i)                <= 0;
					transition_validRise_pos_stage_8(i) <= 0;
				end if;

				-- Falling transition
				if (transition_validFall_pos_stage_7(i * 4) > 0) then
					sum_Fall_stage_8(i)                <= sum_Fall_stage_7(i * 4);
					transition_validFall_pos_stage_8(i) <= transition_validFall_pos_stage_7(i * 4);
				elsif (transition_validFall_pos_stage_7(i * 4 + 1) > 0) then
					sum_Fall_stage_8(i)                <= sum_Fall_stage_7(i * 4 + 1);
					transition_validFall_pos_stage_8(i) <= transition_validFall_pos_stage_7(i * 4 + 1);
				elsif (transition_validFall_pos_stage_7(i * 4 + 2) > 0) then
					sum_Fall_stage_8(i)                <= sum_Fall_stage_7(i * 4 + 2);
					transition_validFall_pos_stage_8(i) <= transition_validFall_pos_stage_7(i * 4 + 2);
				elsif (transition_validFall_pos_stage_7(i * 4 + 3) > 0) then
					sum_Fall_stage_8(i)                <= sum_Fall_stage_7(i * 4 + 3);
					transition_validFall_pos_stage_8(i) <= transition_validFall_pos_stage_7(i * 4 + 3);
				else
					sum_Fall_stage_8(i)                <= 0;
					transition_validFall_pos_stage_8(i) <= 0;
				end if;
			end loop;

			-- Stage 9 - Now there should be only four values left, independent of the block size
			-- Rising transition
			if (transition_validRise_pos_stage_8(0) > 0) then
				sum_Rise_stage_9                <= sum_Rise_stage_8(0);
				transition_validRise_pos_stage_9 <= transition_validRise_pos_stage_8(0);
			elsif (transition_validRise_pos_stage_8(1) > 0) then
				sum_Rise_stage_9                <= sum_Rise_stage_8(1);
				transition_validRise_pos_stage_9 <= transition_validRise_pos_stage_8(1);
			elsif (transition_validRise_pos_stage_8(2) > 0) then
				sum_Rise_stage_9                <= sum_Rise_stage_8(2);
				transition_validRise_pos_stage_9 <= transition_validRise_pos_stage_8(2);
			elsif (transition_validRise_pos_stage_8(3) > 0) then
				sum_Rise_stage_9                <= sum_Rise_stage_8(3);
				transition_validRise_pos_stage_9 <= transition_validRise_pos_stage_8(3);
			else
				sum_Rise_stage_9                <= 0;
				transition_validRise_pos_stage_9 <= 0;
			end if;

			-- Falling transition
			if (transition_validFall_pos_stage_8(0) > 0) then
				sum_Fall_stage_9                <= sum_Fall_stage_8(0);
				transition_validFall_pos_stage_9 <= transition_validFall_pos_stage_8(0);
			elsif (transition_validFall_pos_stage_8(1) > 0) then
				sum_Fall_stage_9                <= sum_Fall_stage_8(1);
				transition_validFall_pos_stage_9 <= transition_validFall_pos_stage_8(1);
			elsif (transition_validFall_pos_stage_8(2) > 0) then
				sum_Fall_stage_9                <= sum_Fall_stage_8(2);
				transition_validFall_pos_stage_9 <= transition_validFall_pos_stage_8(2);
			elsif (transition_validFall_pos_stage_8(3) > 0) then
				sum_Fall_stage_9                <= sum_Fall_stage_8(3);
				transition_validFall_pos_stage_9 <= transition_validFall_pos_stage_8(3);
			else
				sum_Fall_stage_9                <= 0;
				transition_validFall_pos_stage_9 <= 0;
			end if;
			
			-- Stage 10 - Calculate the values of the rising and falling edge and output the data
			if transition_validFall_pos_stage_9 > 0 then
				fallTransition_out <= std_logic_vector(to_unsigned(g_BLOCKSIZE_SUM / 2 * transition_validFall_pos_stage_9 + g_BLOCKSIZE_SUM - sum_Fall_stage_9, fallTransition_out'length)); -- Transitions in the first g_BLOCKSIZE_SUM / 2 are not detected
			else
				fallTransition_out <= std_logic_vector(to_unsigned(0, fallTransition_out'length)); 
			end if;
			if transition_validRise_pos_stage_9 > 0 then
				riseTransition_out <= std_logic_vector(to_unsigned(g_BLOCKSIZE_SUM / 2 * transition_validRise_pos_stage_9 + sum_Rise_stage_9, fallTransition_out'length)); -- Transitions in the first g_BLOCKSIZE_SUM / 2 are not detected
			else
				riseTransition_out <= std_logic_vector(to_unsigned(0, fallTransition_out'length)); 
			end if;
			
			-- Sum calculation
			-- Stage 3
			for i in 0 to c_NUM_ELEMENTS_SUM_STAGE_3 - 1 loop
				if (i >= (g_NUM_OF_ELEMS / g_BLOCKSIZE_SUM)) then
					sum_calc_stage_3(i) <= 0;
				else
					sum_calc_stage_3(i) <= sum_stage_2((i * 2) + 1) + sum_stage_2((i * 2));
				end if;
			end loop;
			
			-- Stage 4
			for i in 0 to c_NUM_ELEMENTS_SUM_STAGE_4 - 1 loop
				sum_calc_stage_4(i) <= sum_calc_stage_3((i * 2) + 1) + sum_calc_stage_3((i * 2));
			end loop;
			
			-- Stage 5
			for i in 0 to c_NUM_ELEMENTS_SUM_STAGE_5 - 1 loop
				sum_calc_stage_5(i) <= sum_calc_stage_4((i * 2) + 1) + sum_calc_stage_4((i * 2));
			end loop;
			
			-- Stage 6 depends on the block size -- should be optimized away when not used
			if c_NUM_STAGES > 3 then
				for i in 0 to c_NUM_ELEMENTS_SUM_STAGE_6 - 1 loop
					sum_calc_stage_6(i) <= sum_calc_stage_5((i * 2) + 1) + sum_calc_stage_5((i * 2));
				end loop;
			else
				sumOnes_out <= std_logic_vector(to_unsigned(sum_calc_stage_5(0) + sum_calc_stage_5(1), sumOnes_out'length));	
			end if;
			
			-- Stage 7 depends on the block size -- should be optimized away when not used
			if c_NUM_STAGES > 4 then
				for i in 0 to c_NUM_ELEMENTS_SUM_STAGE_7 - 1 loop
					sum_calc_stage_7(i) <= sum_calc_stage_6((i * 2) + 1) + sum_calc_stage_6((i * 2));
				end loop;
			elsif c_NUM_STAGES = 4 then
				sumOnes_out <= std_logic_vector(to_unsigned(sum_calc_stage_6(0) + sum_calc_stage_6(1), sumOnes_out'length));	
			end if;
			
			-- Stage 8 depends on the block size -- should be optimized away when not used
			if c_NUM_STAGES > 5 then
				for i in 0 to c_NUM_ELEMENTS_SUM_STAGE_8 - 1 loop
					sum_calc_stage_8(i) <= sum_calc_stage_7((i * 2) + 1) + sum_calc_stage_7((i * 2));
				end loop;
			elsif c_NUM_STAGES = 5 then
				sumOnes_out <= std_logic_vector(to_unsigned(sum_calc_stage_7(0) + sum_calc_stage_7(1), sumOnes_out'length));	
			end if;
			
			-- Stage 9 depends on the block size -- should be optimized away when not used
			if c_NUM_STAGES = 6 then				
				sumOnes_out <= std_logic_vector(to_unsigned(sum_calc_stage_8(0) + sum_calc_stage_8(1), sumOnes_out'length));	
			end if;

		end if;
	end process proc_sumAndTransition;

end behavioral;
