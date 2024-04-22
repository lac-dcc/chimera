----------------------------------------------------------------------------------------------------
-- brief: Applies a configurable delay before the clock exits the FPGA through the output buffer
-- file: pulseDelay.vhd
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
-- Vivado Components library
library unisim;
-- This package contains the iobuf component.
use unisim.vcomponents.all;

------------------------------------------------------------------------------------------------
-- Entity declarations
------------------------------------------------------------------------------------------------
entity pulseDelay is
	generic(
		g_DELAY    : integer := 275;    -- Delay in ps;
		g_CLK_FREQ : integer := 200;    -- Frequency in MHz
		g_LOC      : string  := "BITSLICE_RX_TX_X1Y232"
	);
	port(
		-- Input and output ports
		data_out         : out std_logic;
		data_in          : in  std_logic;
		-- Interface to change the delay
		start_in         : in  std_logic;
		incDec_in        : in  std_logic;
		ready_out        : out std_logic;
		idelayCtrlRdy_in : in  std_logic;
		delayTaps_out    : out std_logic_vector(8 downto 0);
		-- Clock and Reset port
		clk              : in  std_logic
	);
end pulseDelay;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of pulseDelay is
	-------------------------------------------------------------------------------------------
	-- internal types
	--------------------------------------------------------------------------------------------
	-- Define the different states of the statemachine	
	type fsmState is (WAITSTARTUP, WAITFORSTART, VTCLOW, WAITVTC, ASSIGNCE, WAITLOAD, WAITRDY);

	--------------------------------------------------------------------------------------------
	-- Internal signals
	--------------------------------------------------------------------------------------------
	signal fsmState_pres : fsmState := WAITSTARTUP;
	signal fsmState_next : fsmState := WAITSTARTUP;

	-- Signals for interconnects
	signal delayVTC : std_logic;
	signal delayCE  : std_logic;

	-- Signals for the statemachine
	signal cnt_pres        : integer range 0 to 15;
	signal cnt_next        : integer range 0 to 15;
	signal incDecSave_pres : std_logic;
	signal incDecSave_next : std_logic;

	--------------------------------------------------------------------------------------------
	-- Attributes
	--------------------------------------------------------------------------------------------
	-- to manually place the delay in a particular spot (best for linearities and resolution), the LOC constraint is used
	attribute LOC : string;
	attribute LOC of inst_ODELAYE3 : label is g_LOC;
begin
	--------------------------------------------------------------------------------------------
	-- Instantiate the IDELAY3
	--------------------------------------------------------------------------------------------
	inst_ODELAYE3 : component ODELAYE3
		generic map(
			CASCADE          => "NONE",
			DELAY_FORMAT     => "TIME",
			DELAY_TYPE       => "VAR_LOAD",
			DELAY_VALUE      => g_DELAY,
			IS_CLK_INVERTED  => '0',
			IS_RST_INVERTED  => '0',
			REFCLK_FREQUENCY => Real(g_CLK_FREQ),
			SIM_DEVICE       => "ULTRASCALE_PLUS",
			SIM_VERSION      => 2.0,
			UPDATE_MODE      => "ASYNC"
		)
		port map(
			CASC_OUT    => open,
			CNTVALUEOUT => delayTaps_out,
			DATAOUT     => data_out,
			CASC_IN     => '0',
			CASC_RETURN => '0',
			CE          => delayCE,
			CLK         => clk,
			CNTVALUEIN  => (others => '0'),
			EN_VTC      => delayVTC,
			INC         => incDecSave_pres,
			LOAD        => '0',
			ODATAIN     => data_in,
			RST         => '0'
		);

	------------------------------------------------------------------------------------------------
	-- control fsm nextstatelogic process
	------------------------------------------------------------------------------------------------
	-- This process controls the next state logic of the statemachine.
	nextStateLogic : process(fsmState_pres, cnt_pres, start_in, incDecSave_pres, incDec_in, idelayCtrlRdy_in)
	begin
		-- Default assignements
		fsmState_next   <= fsmState_pres;
		cnt_next        <= cnt_pres;
		incDecSave_next <= incDecSave_pres;

		-- Default outputs
		ready_out <= '0';
		delayVTC  <= '1';
		delayCE   <= '0';

		-- Statemachine
		case fsmState_pres is
			when WAITSTARTUP =>
				-- Check if we the delay is ready 
				if (idelayCtrlRdy_in = '1') then
					-- Change the state
					fsmState_next <= WAITFORSTART;
				end if;

			when WAITFORSTART =>
				-- Signalize that we are ready
				ready_out <= '1';

				-- Save the inc / dec signal 
				incDecSave_next <= incDec_in;

				-- Wait for the start signal
				if (start_in = '1') then
					-- Change the state
					fsmState_next <= VTCLOW;
				end if;

			when VTCLOW =>
				-- Set the VTC to low
				delayVTC <= '0';

				-- Set the counter 
				cnt_next <= 0;

				-- Change the state
				fsmState_next <= WAITVTC;

			when WAITVTC =>
				-- Set the VTC to low
				delayVTC <= '0';

				-- Wait for ten clock cycles
				if (cnt_pres >= 15) then
					-- Change the state
					fsmState_next <= ASSIGNCE;
				else
					-- Increment the counter
					cnt_next <= cnt_pres + 1;
				end if;

			when ASSIGNCE =>
				-- Set the VTC to low
				delayVTC <= '0';

				-- Assign the load signal
				delayCE <= '1';

				-- Set the counter 
				cnt_next <= 0;

				-- Change the state
				fsmState_next <= WAITLOAD;

			when WAITLOAD =>
				-- Set the VTC to low
				delayVTC <= '0';

				-- Wait for ten clock cycles
				if (cnt_pres >= 15) then
					-- Change the state
					fsmState_next <= WAITRDY;
				else
					-- Increment the counter
					cnt_next <= cnt_pres + 1;
				end if;

			when WAITRDY =>
				-- Wait till the delay is ready again
				--if (idelayCtrlRdy_in = '1') then
					-- Change the state
					fsmState_next <= WAITFORSTART;
				--end if;
		end case;
	end process;

	------------------------------------------------------------------------------------------------
	-- control fsm stateregister process
	------------------------------------------------------------------------------------------------
	-- This process controls the stateregister of the statemachine.
	stateRegister : process(clk)
	begin
		-- Check for a rising edge
		if (rising_edge(clk)) then
			fsmState_pres   <= fsmState_next;
			cnt_pres        <= cnt_next;
			incDecSave_pres <= incDecSave_next;
		end if;
	end process stateRegister;

end behavioral;
