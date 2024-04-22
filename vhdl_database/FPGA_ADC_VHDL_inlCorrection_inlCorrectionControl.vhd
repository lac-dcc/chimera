----------------------------------------------------------------------------------------------------
-- brief: INL Correction Control - Controls the calculation of the histogram, the DNL, and INL
-- file: inlCorrectionControl.vhd
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
entity inlCorrectionControl is
	port(
		-- Start and running signal of this block
		start_in               : in  std_logic;
		calculationRunning_out : out std_logic;
		-- Signals for start and running of the individual blocks
		histStart_out          : out std_logic;
		histRunning_in         : in  std_logic;
		dnlStart_out           : out std_logic;
		dnlRunning_in          : in  std_logic;
		inlStart_out           : out std_logic;
		inlRunning_in          : in  std_logic;
		--  Clock
		clk                    : in  std_logic
	);
end inlCorrectionControl;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of inlCorrectionControl is
	--------------------------------------------------------------------------------------------
	-- internal types
	--------------------------------------------------------------------------------------------
	-- Define the different states of the statemachine	
	type fsmState is (WAITFORSTART, STARTHIST, WAITHIST, STARTDNL, WAITDNL, STARTINL, WAITINL);

	--------------------------------------------------------------------------------------------
	-- Internal signals
	--------------------------------------------------------------------------------------------
	signal fsmState_pres : fsmState := WAITFORSTART;
	signal fsmState_next : fsmState := WAITFORSTART;

begin

	------------------------------------------------------------------------------------------------
	-- control fsm nextstatelogic process
	------------------------------------------------------------------------------------------------
	-- This process controls the next state logic of the statemachine.
	nextStateLogic : process(fsmState_pres, dnlRunning_in, histRunning_in, inlRunning_in, start_in)
	begin
		-- Default outputs
		calculationRunning_out <= '1';
		histStart_out          <= '0';
		dnlStart_out           <= '0';
		inlStart_out           <= '0';

		-- Default assignements
		fsmState_next <= fsmState_pres;

		-- Statemachine
		case fsmState_pres is
			when WAITFORSTART =>
				-- Calculation is currently not running
				calculationRunning_out <= '0';

				-- Check if the start signal is set
				if (start_in = '1') then

					-- Change the state
					fsmState_next <= STARTHIST;
				end if;

			when STARTHIST =>
				-- Start the histogram calculation
				histStart_out <= '1';

				-- Wait till it started
				if (histRunning_in = '1') then
					-- Change the state
					fsmState_next <= WAITHIST;
				end if;

			when WAITHIST =>
				-- Check if the block is finished
				if (histRunning_in = '0') then
					-- Change the state
					fsmState_next <= STARTDNL;
				end if;

			when STARTDNL =>
				-- Start the dnl calculation
				dnlStart_out <= '1';

				-- Wait till it started
				if (dnlRunning_in = '1') then
					-- Change the state
					fsmState_next <= WAITDNL;
				end if;

			when WAITDNL =>
				-- Check if the block is finished
				if (dnlRunning_in = '0') then
					-- Change the state
					fsmState_next <= STARTINL;
				end if;

			when STARTINL =>
				-- Start the inl calculation
				inlStart_out <= '1';

				-- Wait till it started
				if (inlRunning_in = '1') then
					-- Change the state
					fsmState_next <= WAITINL;
				end if;

			when WAITINL =>
				-- Check if the block is finished
				if (inlRunning_in = '0') then
					-- Change the state
					fsmState_next <= WAITFORSTART;
				end if;

		end case;
	end process nextStateLogic;

	------------------------------------------------------------------------------------------------
	-- control fsm stateregister process
	------------------------------------------------------------------------------------------------
	-- This process controls the stateregister of the statemachine.
	stateRegister : process(clk)
	begin
		-- Check for a rising edge
		if (rising_edge(clk)) then
			fsmState_pres <= fsmState_next;
		end if;
	end process stateRegister;
end behavioral;
