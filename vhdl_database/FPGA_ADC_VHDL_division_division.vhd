----------------------------------------------------------------------------------------------------
-- project: This block performs a division from two values.		
-- file: division.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version 	| Date       | Author             | Remarks
-- ------------------------------------------------------------------------------------------------
-- 0.1	    | 14.03.2017 | L. Leuenberger  	  | Created
-- 0.2		| 21.03.2017 | M. Ehrler		  | Statemachine and division algorithm created
-- 0.3		| 27.03.2017 | L. Leuenberger     | Added Division_width_g
-- 0.4 		| 15.06.2017 | L. Leuenberger     | Revised
----------------------------------------------------------------------------------------------------

-- Standard library ieee	
library ieee;
-- This package defines the basic std_logic data types and a few functions.								
use ieee.std_logic_1164.all;
-- This package provides arithmetic functions for vectors.		
use ieee.numeric_std.all;

-- Entity of the error compensation division part.
entity division is
	generic(
		division_width_g : integer range 0 to 64 -- Determines the size of the three Busses from the Division.
	);
	port(
		-- Input Signals
		Start_in    : in  std_logic;    -- Starts the Divsion
		Dividend_in : in  std_logic_vector(division_width_g - 1 downto 0); -- Dividend of the Division
		Divisor_in  : in  std_logic_vector(division_width_g - 1 downto 0); -- Divisor of the Division

		-- Output Signals
		Busy_out    : out std_logic;    -- Shows that a division is currently running
		Result_out  : out std_logic_vector(division_width_g - 1 downto 0); -- Contains the result of the last division.

		-- Reset und Clock
		RESETN      : in  std_logic;    -- Synchronous Negative Reset
		CLK         : in  std_logic     -- Clock
	);
end division;

-- Architecture of the error compensation division part.
architecture behavioral of division is

	------------------------------------------------------------------------------------------------
	-- internal types
	------------------------------------------------------------------------------------------------
	-- Define the different states of the statemachine
	type fsmState is (idleState, waitForDivisionState, waitForDivisionState2);

	------------------------------------------------------------------------------------------------
	-- internal signals
	------------------------------------------------------------------------------------------------
	-- Signals for the statemachine	
	signal fsm_state_pres : fsmState := idleState; -- This signal holds the current FSM-State of the Statemachine.
	signal fsm_state_next : fsmState := idleState; -- This signal holds the next FSM-State of the Statemachine.

	-- Signals for the dividend
	signal curr_dividend_pres : unsigned(division_width_g - 1 downto 0); -- This signal contains the current dividend.
	signal curr_dividend_next : unsigned(division_width_g - 1 downto 0); -- This signal contains the current dividend.

	-- Signals for the divisor
	signal curr_divisor_pres : unsigned(division_width_g - 1 downto 0); -- This signal contains the current divisor.
	signal curr_divisor_next : unsigned(division_width_g - 1 downto 0); -- This signal contains the current divisor.

	-- Signals for the division result
	signal curr_result_pres : std_logic_vector(division_width_g - 1 downto 0); -- This signal contains the current result.
	signal curr_result_next : std_logic_vector(division_width_g - 1 downto 0); -- This signal contains the current result.

	-- Signals for the neg signal
	signal curr_neg_pres : std_logic;   -- This signal contains the current neg signal.
	signal curr_neg_next : std_logic;   -- This signal contains the current neg signal.

	-- Signals for the counter
	signal counter_pres : integer range 0 to division_width_g; -- This signal a counter for the division.
	signal counter_next : integer range 0 to division_width_g; -- This signal a counter for the division.

	-- Temp signals
	signal temp_pres : unsigned(division_width_g downto 0); -- This signal a temp signal for the division.
	signal temp_next : unsigned(division_width_g downto 0); -- This signal a temp signal for the division.

begin
	------------------------------------------------------------------------------------------------
	-- control fsm nextstatelogic process
	------------------------------------------------------------------------------------------------
	-- This process controls the next state logic of the statemachine.
	nextStateLogic : process(fsm_state_pres, Start_in, Dividend_in, Divisor_in, curr_dividend_pres, curr_divisor_pres, curr_result_pres, curr_neg_pres, counter_pres, temp_pres)
	begin
		-- Default assignements
		fsm_state_next     <= fsm_state_pres;
		curr_dividend_next <= curr_dividend_pres;
		curr_divisor_next  <= curr_divisor_pres;
		curr_result_next   <= curr_result_pres;
		curr_neg_next      <= curr_neg_pres;
		counter_next       <= counter_pres;
		temp_next          <= temp_pres;

		-- Set all outputs to their default state	
		Busy_out   <= '0';
		Result_out <= curr_result_pres;

		-- Conditional assignements		
		case fsm_state_pres is
			----------------------------------------------------------------------------------------
			when idleState =>
				----------------------------------------------------------------------------------------
				-- Check if the Start port is set
				if Start_in = '1' then
					-- Check if the Dividend or the Divisor = 0
					if signed(Dividend_in) = 0 or signed(Divisor_in) = 0 then
						-- Set the result to zero
						curr_result_next <= (others => '0');

					-- Check if the Dividend and the Divisor > 0
					elsif signed(Dividend_in) > 0 and signed(Divisor_in) > 0 then
						-- Store the Dividend port to curr_dividend
						curr_dividend_next <= unsigned(Dividend_in);
						-- Store the Divisor port to curr_divisor
						curr_divisor_next  <= unsigned(Divisor_in);
						-- Reset curr_neg
						curr_neg_next      <= '0';
						-- Change the state
						fsm_state_next     <= waitForDivisionState;

					-- Check if the Dividend > 0 and the Divisor < 0	
					elsif signed(Dividend_in) > 0 and signed(Divisor_in) < 0 then
						-- Store the Dividend port to curr_dividend
						curr_dividend_next <= unsigned(Dividend_in);
						-- Store the Divisor port to curr_dividend
						curr_divisor_next  <= resize(unsigned(signed(Divisor_in) * (-1)), curr_divisor_next'length);
						-- Set curr_neg
						curr_neg_next      <= '1';
						-- Change the state
						fsm_state_next     <= waitForDivisionState;

					-- Check if the Dividend < 0 and the Divisor > 0	
					elsif signed(Dividend_in) < 0 and signed(Divisor_in) > 0 then
						-- Store the Dividend port to curr_dividend
						curr_dividend_next <= resize(unsigned(signed(Dividend_in) * (-1)), curr_dividend_next'length);
						-- Store the Divisor port to curr_divisor
						curr_divisor_next  <= unsigned(Divisor_in);
						-- Set curr_neg
						curr_neg_next      <= '1';
						-- Change the state
						fsm_state_next     <= waitForDivisionState;

					-- Check if the Dividend and the Divisor < 0
					elsif signed(Dividend_in) < 0 and signed(Divisor_in) < 0 then
						-- Store the Dividend port to curr_dividend
						curr_dividend_next <= resize(unsigned(signed(Dividend_in) * (-1)), curr_dividend_next'length);
						-- Store the Divisor port to curr_dividend
						curr_divisor_next  <= resize(unsigned(signed(Divisor_in) * (-1)), curr_divisor_next'length);
						-- Reset curr_neg
						curr_neg_next      <= '0';
						-- Change the state
						fsm_state_next     <= waitForDivisionState;

					end if;

					-- Reset the counter
					counter_next <= 0;

					-- Reset temp
					temp_next <= (others => '0');
				end if;

			----------------------------------------------------------------------------------------
			when waitForDivisionState =>
				----------------------------------------------------------------------------------------
				-- Set Busy port
				Busy_out <= '1';

				-- Check if the counter > (Division_width_g - 1)
				if counter_pres > (division_width_g - 1) then
					-- Check if neg is reset
					if curr_neg_pres = '0' then
						curr_result_next <= std_logic_vector(curr_dividend_pres);
					-- neg is reset
					else
						curr_result_next <= std_logic_vector(resize(signed(curr_dividend_pres) * (-1), curr_result_pres'length));
					end if;
					-- Change the state
					fsm_state_next <= idleState;

				-- counter <= (Division_width_g - 1)
				else
					temp_next      <= (temp_pres(division_width_g - 1 downto 0) & curr_dividend_pres(division_width_g - 1)) - curr_divisor_pres;
					-- Change the state
					fsm_state_next <= waitForDivisionState2;
				end if;

			----------------------------------------------------------------------------------------
			when waitForDivisionState2 =>
				----------------------------------------------------------------------------------------			
				-- Set Busy port
				Busy_out <= '1';

				-- Check if temp(division_width_g - 1) is set
				if temp_pres(division_width_g - 1) = '1' then
					curr_dividend_next <= curr_dividend_pres(division_width_g - 2 downto 0) & '0';
					temp_next          <= temp_pres + curr_divisor_pres;
				-- temp(division_width_g - 1) is reset
				else
					curr_dividend_next <= curr_dividend_pres(division_width_g - 2 downto 0) & '1';
				end if;

				-- Increment the counter
				counter_next <= counter_pres + 1;

				-- Change the state
				fsm_state_next <= waitForDivisionState;

		end case;
	end process nextStateLogic;

	------------------------------------------------------------------------------------------------
	-- control fsm stateregister process
	------------------------------------------------------------------------------------------------
	-- This process controls the stateregister of the statemachine.
	stateRegister : process(CLK)
	begin
		if rising_edge(CLK) then
			if RESETN = '0' then
				fsm_state_pres     <= idleState;
				curr_dividend_pres <= (others => '0');
				curr_divisor_pres  <= (others => '0');
				curr_result_pres   <= (others => '0');
				curr_neg_pres      <= '0';
				counter_pres       <= 0;
				temp_pres          <= (others => '0');
			else
				fsm_state_pres     <= fsm_state_next;
				curr_dividend_pres <= curr_dividend_next;
				curr_divisor_pres  <= curr_divisor_next;
				curr_result_pres   <= curr_result_next;
				curr_neg_pres      <= curr_neg_next;
				counter_pres       <= counter_next;
				temp_pres          <= temp_next;
			end if;
		end if;
	end process stateRegister;

end behavioral;

