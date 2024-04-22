----------------------------------------------------------------------------------------------------
-- brief: This block calculates a histogram.
-- file: hitsogram.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 08.04.2020 | L. Leuenberger     | Auto-Created
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
entity histogram is
	generic(
		g_NUM_OF_BITS_FOR_MAX_ELEMS : integer := 10;
		g_NO_OF_SAMPLES_HIST        : integer := 12 -- 2** g_NO_OF_SAMPLES_HIST
	);
	port(
		-- Start signal for histogram calculation
		start_in             : in  std_logic;
		-- Signal which contains the measured edge
		transition_in        : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		dataValid_in         : in  std_logic;
		-- Signals which are used to read the data from the histogram
		histAddr_in          : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		histClk_in           : in  std_logic;
		histData_out         : out std_logic_vector(g_NO_OF_SAMPLES_HIST - 1 downto 0);
		-- Signalizes that the current histogram is captured
		histogramRunning_out : out std_logic;
		--  Clock
		clk                  : in  std_logic
	);
end histogram;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of histogram is
	--------------------------------------------------------------------------------------------
	-- internal types
	--------------------------------------------------------------------------------------------
	-- Define the different states of the statemachine	
	type fsmState is (WAITFORSTART, RESETRAM, CAPTUREHIST);

	--------------------------------------------------------------------------------------------
	-- Internal signals
	--------------------------------------------------------------------------------------------
	signal fsmState_pres : fsmState := WAITFORSTART;
	signal fsmState_next : fsmState := WAITFORSTART;

	-- Ram signals
	signal ramWEn_pres   : std_logic;
	signal ramAddrR_pres : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramAddrW_pres : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramDataR      : std_logic_vector(g_NO_OF_SAMPLES_HIST - 1 downto 0);
	signal ramDataW_pres : std_logic_vector(g_NO_OF_SAMPLES_HIST - 1 downto 0);
	signal ramWEn_next   : std_logic;
	signal ramAddrR_next : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramAddrW_next : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramDataW_next : std_logic_vector(g_NO_OF_SAMPLES_HIST - 1 downto 0);

	-- Registered signals --> Resolve tight timing issues by introducing a second register stage
	signal ramDataRReg : std_logic_vector(g_NO_OF_SAMPLES_HIST - 1 downto 0);

	-- Counters
	signal counterIdxReset_pres : integer range 0 to (2**g_NUM_OF_BITS_FOR_MAX_ELEMS) - 1;
	signal counterIdxReset_next : integer range 0 to (2**g_NUM_OF_BITS_FOR_MAX_ELEMS) - 1;

	-- Saved ram read address
	signal ramAddSave_pres  : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramAddSave_next  : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramAddSave2_pres : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramAddSave2_next : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramAddSave3_pres : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramAddSave3_next : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);

	signal startReg : std_logic;

	-- Delay valid signal
	signal dataValid_pres : std_logic_vector(2 downto 0);
	signal dataValid_next : std_logic_vector(2 downto 0);

	--------------------------------------------------------------------------------------------
	-- Attributes
	--------------------------------------------------------------------------------------------
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER of histClk_in : SIGNAL is "xilinx.com:signal:clock:1.0 histClk_in CLK";

begin
	------------------------------------------------------------------------------------------------
	-- control fsm nextstatelogic process
	------------------------------------------------------------------------------------------------
	-- This process controls the next state logic of the statemachine.
	nextStateLogic : process(counterIdxReset_pres, fsmState_pres, ramAddrR_pres, ramAddrW_pres, ramDataW_pres, ramWEn_pres, startReg, ramAddSave2_pres, ramAddSave_pres, transition_in, ramAddSave3_pres, ramDataRReg, dataValid_pres, dataValid_in)
	begin
		-- Default outputs
		histogramRunning_out <= '1';

		-- Default assignements
		fsmState_next        <= fsmState_pres;
		ramWEn_next          <= ramWEn_pres;
		ramAddrR_next        <= transition_in;
		ramAddrW_next        <= ramAddrW_pres;
		ramDataW_next        <= ramDataW_pres;
		counterIdxReset_next <= counterIdxReset_pres;
		ramAddSave_next      <= ramAddSave_pres;
		ramAddSave2_next     <= ramAddSave2_pres;
		ramAddSave3_next     <= ramAddSave3_pres;
		dataValid_next       <= dataValid_pres(dataValid_pres'length - 2 downto 0) & dataValid_in;

		-- Statemachine
		case fsmState_pres is
			when WAITFORSTART =>
				-- Histogram is currently not running
				histogramRunning_out <= '0';

				-- Do not write any data
				ramWEn_next <= '0';

				-- Check if the start signal is set
				if (startReg = '1') then
					-- Reset the counter
					counterIdxReset_next <= 0;

					-- Change the state
					fsmState_next <= RESETRAM;
				end if;

			when RESETRAM =>
				-- Reset all data back to zero
				ramDataW_next <= (others => '0');
				ramAddrW_next <= std_logic_vector(to_unsigned(counterIdxReset_pres, g_NUM_OF_BITS_FOR_MAX_ELEMS));
				ramWEn_next   <= '1';

				-- Check if we waited long enough
				if (counterIdxReset_pres = (2**(g_NUM_OF_BITS_FOR_MAX_ELEMS) - 1)) then
					-- Change the state
					fsmState_next <= CAPTUREHIST;
				else
					-- Increment the counter
					counterIdxReset_next <= counterIdxReset_pres + 1;
				end if;

			when CAPTUREHIST =>
				-- Save the address of the read value
				ramAddSave_next  <= ramAddrR_pres;
				ramAddSave2_next <= ramAddSave_pres; -- Used because of timing issues (additional register between read BRAM and calculation)
				ramAddSave3_next <= ramAddSave2_pres; -- Used to detect collisions

				-- Set write address
				ramAddrW_next <= ramAddSave2_pres;

				-- Disable writing
				ramWEn_next <= '0';

				-- Check if we captured enough data
				if (to_integer(unsigned(ramDataW_pres)) = (2**(g_NO_OF_SAMPLES_HIST) - 1)) then
					-- Change the state
					fsmState_next <= WAITFORSTART;

				-- Check if the current data is valid
				elsif (dataValid_pres(dataValid_pres'length - 1) = '1') then
					-- Increment the read value and write it back to the RAM
					ramWEn_next <= '1';
					if ((ramAddSave2_pres = ramAddSave3_pres)) then -- Collision detection
						ramDataW_next <= std_logic_vector(to_unsigned(to_integer(unsigned(ramDataW_pres)) + 1, g_NO_OF_SAMPLES_HIST));
					else
						ramDataW_next <= std_logic_vector(to_unsigned(to_integer(unsigned(ramDataRReg)) + 1, g_NO_OF_SAMPLES_HIST));
					end if;
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
			fsmState_pres        <= fsmState_next;
			ramWEn_pres          <= ramWEn_next;
			ramAddrR_pres        <= ramAddrR_next;
			ramAddrW_pres        <= ramAddrW_next;
			ramDataW_pres        <= ramDataW_next;
			counterIdxReset_pres <= counterIdxReset_next;
			ramAddSave_pres      <= ramAddSave_next;
			ramAddSave2_pres     <= ramAddSave2_next;
			ramAddSave3_pres     <= ramAddSave3_next;
			dataValid_pres       <= dataValid_next;
		end if;
	end process stateRegister;

	------------------------------------------------------------------------------------------------
	-- FF Stage
	------------------------------------------------------------------------------------------------
	ffStage : process(clk)
	begin
		-- Check for a rising edge
		if (rising_edge(clk)) then
			ramDataRReg <= ramDataR;
			startReg    <= start_in;
		end if;
	end process ffStage;

	--------------------------------------------------------------------------------------------
	-- Instantiate two ram blocks for the histogram
	--------------------------------------------------------------------------------------------
	inst_ramHistInt : entity work.tdpRAM
		generic map(
			addr_width_g => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			data_width_g => g_NO_OF_SAMPLES_HIST
		)
		port map(
			a_clk      => clk,
			a_wr_en_in => ramWEn_pres,
			a_addr_in  => ramAddrW_pres,
			a_data_in  => ramDataW_pres,
			a_data_out => open,
			b_clk      => clk,
			b_wr_en_in => '0',
			b_addr_in  => ramAddrR_pres,
			b_data_in  => (others => '0'),
			b_data_out => ramDataR
		);

	inst_ramHistOut : entity work.tdpRAM
		generic map(
			addr_width_g => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			data_width_g => g_NO_OF_SAMPLES_HIST
		)
		port map(
			a_clk      => clk,
			a_wr_en_in => ramWEn_pres,
			a_addr_in  => ramAddrW_pres,
			a_data_in  => ramDataW_pres,
			a_data_out => open,
			b_clk      => histClk_in,
			b_wr_en_in => '0',
			b_addr_in  => histAddr_in,
			b_data_in  => (others => '0'),
			b_data_out => histData_out
		);

end behavioral;
