----------------------------------------------------------------------------------------------------
-- brief: This block calibrates the aligning of the delay chain with the slope.
-- file: calibrationTDCAlign.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 17.02.2020 | L. Leuenberger     | Auto-Created
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
entity calibrationTDCAlign is
	generic(
		g_NUM_OF_BITS_FOR_MAX_ELEMS : integer := 10;
		g_NO_OF_SAMPLES_MEAN        : integer := 13
	);
	port(
		-- Start signal for configuration
		startConfig_in           : in  std_logic;
		-- Signals to set the delay to a specific value
		startSetValue_in         : in  std_logic;
		setValueDelayIn_in       : in  std_logic_vector(8 downto 0);
		setValueDelayOut_in      : in  std_logic_vector(8 downto 0);
		-- Edge detection signals
		fallTransition_in        : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		riseTransition_in        : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		-- Interface to the input delay
		delayInStart_out         : out std_logic;
		delayInIncDec_out        : out std_logic;
		delayInReady_in          : in  std_logic;
		delayInDelayTaps_in      : in  std_logic_vector(8 downto 0);
		-- Interface to the output delay
		delayOutStart_out        : out std_logic;
		delayOutIncDec_out       : out std_logic;
		delayOutReady_in         : in  std_logic;
		delayOutDelayTaps_in     : in  std_logic_vector(8 downto 0);
		-- Detected delay values out
		delayInDelayTaps_out     : out std_logic_vector(8 downto 0);
		delayOutDelayTaps_out    : out std_logic_vector(8 downto 0);
		-- Detected length of carry chain
		maxLengthCarryChain_in   : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		-- Signalizes that configuration or set value is running
		configurationRunning_out : out std_logic;
		--  Clock
		clk                      : in  std_logic;
		clkSlow                  : in  std_logic
	);
end calibrationTDCAlign;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of calibrationTDCAlign is

	--------------------------------------------------------------------------------------------
	-- internal types
	--------------------------------------------------------------------------------------------
	-- Define the different states of the statemachine	
	type fsmState is (WAITFORSTART, WAITFORMEAN, CALCDIFFPRE, CALCDIFF, ADJUSTDELAYSTART, ADJUSTDELAYWAITSTART, ADJUSTDELAYWAITEND, SETVALUESTART, SETVALUEWAITSTART, SETVALUEWAITEND);

	--------------------------------------------------------------------------------------------
	-- Internal signals
	--------------------------------------------------------------------------------------------
	signal fsmState_pres : fsmState := WAITFORSTART;
	signal fsmState_next : fsmState := WAITFORSTART;

	-- Calculated mean Values
	signal meanRise    : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal meanFall    : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal meanRiseReg : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal meanFallReg : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);

	-- Signals used in the statemachine
	signal counterMean_pres : integer range 0 to 2**(g_NO_OF_SAMPLES_MEAN) - 1;
	signal counterMean_next : integer range 0 to 2**(g_NO_OF_SAMPLES_MEAN) - 1;

	signal diffSum_pres    : integer range -2 * 2**(g_NUM_OF_BITS_FOR_MAX_ELEMS) to 2 * 2**(g_NUM_OF_BITS_FOR_MAX_ELEMS); -- Add one decimal place
	signal diffSum_next    : integer range -2 * 2**(g_NUM_OF_BITS_FOR_MAX_ELEMS) to 2 * 2**(g_NUM_OF_BITS_FOR_MAX_ELEMS);
	signal diffSumPre_pres : integer range -2 * 2**(g_NUM_OF_BITS_FOR_MAX_ELEMS) to 2 * 2**(g_NUM_OF_BITS_FOR_MAX_ELEMS); -- Add one decimal place
	signal diffSumPre_next : integer range -2 * 2**(g_NUM_OF_BITS_FOR_MAX_ELEMS) to 2 * 2**(g_NUM_OF_BITS_FOR_MAX_ELEMS);

	signal inOutDelay_pres : std_logic := '0'; -- Signalizes which delay is adjusted next
	signal inOutDelay_next : std_logic := '0';

	signal setValueDelayIn_pres  : std_logic_vector(8 downto 0);
	signal setValueDelayIn_next  : std_logic_vector(8 downto 0);
	signal setValueDelayOut_pres : std_logic_vector(8 downto 0);
	signal setValueDelayOut_next : std_logic_vector(8 downto 0);

	--------------------------------------------------------------------------------------------
	-- Attributes
	--------------------------------------------------------------------------------------------
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER of clkSlow : SIGNAL is "xilinx.com:signal:clock:1.0 clkSlow CLK";

begin
	------------------------------------------------------------------------------------------------
	-- control fsm nextstatelogic process
	------------------------------------------------------------------------------------------------
	-- This process controls the next state logic of the statemachine.
	nextStateLogic : process(counterMean_pres, delayInReady_in, delayOutDelayTaps_in, delayOutReady_in, diffSum_pres, fsmState_pres, inOutDelay_pres, maxLengthCarryChain_in, meanFallReg, meanRiseReg, startConfig_in, delayInDelayTaps_in, setValueDelayIn_in, setValueDelayIn_pres, setValueDelayOut_in, setValueDelayOut_pres, startSetValue_in, diffSumPre_pres)
	begin
		-- Default outputs
		configurationRunning_out <= '1';
		delayOutStart_out        <= '0';
		delayInStart_out         <= '0';
		delayOutIncDec_out       <= '0';
		delayInIncDec_out        <= '0';
		delayOutDelayTaps_out    <= delayOutDelayTaps_in;
		delayInDelayTaps_out     <= delayInDelayTaps_in;

		-- Default assignements
		fsmState_next         <= fsmState_pres;
		counterMean_next      <= counterMean_pres;
		diffSum_next          <= diffSum_pres;
		inOutDelay_next       <= inOutDelay_pres;
		setValueDelayOut_next <= setValueDelayOut_pres;
		setValueDelayIn_next  <= setValueDelayIn_pres;
		diffSumPre_next       <= diffSumPre_pres;

		-- Statemachine
		case fsmState_pres is
			when WAITFORSTART =>
				-- Configuration is currently not running
				configurationRunning_out <= '0';

				-- Check if the start signal is set
				if (startConfig_in = '1') then
					-- Reset the counter
					counterMean_next <= 0;

					-- Change the state
					fsmState_next <= WAITFORMEAN;

				-- Check if the set signal is set
				elsif (startSetValue_in = '1') then
					-- Save the values
					setValueDelayIn_next  <= setValueDelayIn_in;
					setValueDelayOut_next <= setValueDelayOut_in;

					-- Change the state
					fsmState_next <= SETVALUESTART;
				end if;

			when WAITFORMEAN =>
				-- Check if we waited long enough
				if (counterMean_pres = (2**(g_NO_OF_SAMPLES_MEAN) - 1)) then
					-- Clear the counter 
					counterMean_next <= 0;

					-- Change the state
					fsmState_next <= CALCDIFFPRE;
				else
					-- Increment the counter
					counterMean_next <= counterMean_pres + 1;
				end if;

			when CALCDIFFPRE =>
				-- Precalculate something --> Reduce timing issues
				diffSumPre_next <= (-to_integer(unsigned(meanFallReg))) * 2 - abs (to_integer(unsigned(meanRiseReg)) - to_integer(unsigned(meanFallReg)));

				-- Change the state
				fsmState_next <= CALCDIFF;

			when CALCDIFF =>
				if (to_integer(unsigned(meanFallReg)) < to_integer(unsigned(meanRiseReg))) then
					diffSum_next <= to_integer(unsigned(maxLengthCarryChain_in)) + diffSumPre_pres;
				else
					diffSum_next <= diffSumPre_pres;
				end if;
				--diffSum_next <= to_integer(unsigned(maxLengthCarryChain_in)) - abs (to_integer(unsigned(meanRiseReg)) - to_integer(unsigned(meanFallReg))) - factorSub(to_integer(unsigned(meanFallReg)), to_integer(unsigned(meanRiseReg)), to_integer(unsigned(maxLengthCarryChain_in)) / 2) * 2;

				-- Change the state
				fsmState_next <= ADJUSTDELAYSTART;

			when ADJUSTDELAYSTART =>
				-- Check if we are near enough
				if (abs (diffSum_pres) < 2) then
					-- Change the state
					fsmState_next <= WAITFORSTART;
				elsif (diffSum_pres > 0) then
					-- Decrement the delay
					delayOutIncDec_out <= '0';
					delayInIncDec_out  <= '0';

					-- Start the change
					delayOutStart_out <= inOutDelay_pres;
					delayInStart_out  <= not inOutDelay_pres;

					-- Change the delay
					inOutDelay_next <= not inOutDelay_pres;

					-- Change the state
					fsmState_next <= ADJUSTDELAYWAITSTART;
				else
					-- Increment the delay
					delayOutIncDec_out <= '1';
					delayInIncDec_out  <= '1';

					-- Start the change
					delayOutStart_out <= inOutDelay_pres;
					delayInStart_out  <= not inOutDelay_pres;

					-- Change the delay
					inOutDelay_next <= not inOutDelay_pres;

					-- Change the state
					fsmState_next <= ADJUSTDELAYWAITSTART;
				end if;

			when ADJUSTDELAYWAITSTART =>
				-- Wait for the delay to start adjusting
				if (delayInReady_in = '0' or delayOutReady_in = '0') then
					-- Change the state
					fsmState_next <= ADJUSTDELAYWAITEND;
				end if;

			when ADJUSTDELAYWAITEND =>
				-- Wait for both delays to be ready
				if (delayInReady_in = '1' and delayOutReady_in = '1') then
					-- Change the state
					fsmState_next <= WAITFORMEAN;
				end if;

			when SETVALUESTART =>
				-- Check if both input values are equal
				if ((setValueDelayIn_pres = delayInDelayTaps_in) and (setValueDelayOut_pres = delayOutDelayTaps_in)) then
					-- Change the state
					fsmState_next <= WAITFORSTART;

				else
					-- Adjust the two delays
					if (setValueDelayIn_pres > delayInDelayTaps_in) then
						delayInIncDec_out <= '1';
						delayInStart_out  <= '1';
					elsif (setValueDelayIn_pres < delayInDelayTaps_in) then
						delayInIncDec_out <= '0';
						delayInStart_out  <= '1';
					end if;

					if (setValueDelayOut_pres > delayOutDelayTaps_in) then
						delayOutIncDec_out <= '1';
						delayOutStart_out  <= '1';
					elsif (setValueDelayOut_pres < delayOutDelayTaps_in) then
						delayOutIncDec_out <= '0';
						delayOutStart_out  <= '1';
					end if;

					-- Change the state
					fsmState_next <= SETVALUEWAITSTART;
				end if;

			when SETVALUEWAITSTART =>
				-- Wait for the delay to start adjusting
				if (delayInReady_in = '0' or delayOutReady_in = '0') then
					-- Change the state
					fsmState_next <= SETVALUEWAITEND;
				end if;

			when SETVALUEWAITEND =>
				-- Wait for both delays to be ready
				if (delayInReady_in = '1' and delayOutReady_in = '1') then
					-- Change the state
					fsmState_next <= SETVALUESTART;
				end if;
		end case;
	end process nextStateLogic;

	------------------------------------------------------------------------------------------------
	-- control fsm stateregister process
	------------------------------------------------------------------------------------------------
	-- This process controls the stateregister of the statemachine.
	stateRegister : process(clkSlow)
	begin
		-- Check for a rising edge
		if (rising_edge(clkSlow)) then
			fsmState_pres         <= fsmState_next;
			counterMean_pres      <= counterMean_next;
			diffSum_pres          <= diffSum_next;
			inOutDelay_pres       <= inOutDelay_next;
			setValueDelayOut_pres <= setValueDelayOut_next;
			setValueDelayIn_pres  <= setValueDelayIn_next;
			diffSumPre_pres       <= diffSumPre_next;
		end if;
	end process stateRegister;

	------------------------------------------------------------------------------------------------
	-- Flip Flop Stage
	------------------------------------------------------------------------------------------------
	ffStage : process(clkSlow)
	begin
		-- Check for a rising edge
		if (rising_edge(clkSlow)) then
			meanRiseReg <= meanRise;
			meanFallReg <= meanFall;
		end if;
	end process ffStage;

	--------------------------------------------------------------------------------------------
	-- Instantiate the two blocks to calculate the mean value of the falling and rising edge
	--------------------------------------------------------------------------------------------
	inst_calcMeanRising : entity work.calcMean
		generic map(
			g_DATA_WIDTH    => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES => g_NO_OF_SAMPLES_MEAN
		)
		port map(
			data_in  => riseTransition_in,
			data_out => meanRise,
			clk      => clk
		);

	inst_calcMeanFalling : entity work.calcMean
		generic map(
			g_DATA_WIDTH    => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES => g_NO_OF_SAMPLES_MEAN
		)
		port map(
			data_in  => fallTransition_in,
			data_out => meanFall,
			clk      => clk
		);

end behavioral;
