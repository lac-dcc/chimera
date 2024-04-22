----------------------------------------------------------------------------------------------------
-- brief: Calculates the DNL from a histogram.
-- file: dnl.vhd
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
entity dnl is
	generic(
		g_NUM_OF_BITS_FOR_MAX_ELEMS : integer := 10;
		g_NO_OF_SAMPLES_HIST        : integer := 12; -- 2** g_NO_OF_SAMPLES_HIST
		g_NO_OF_FRACTIONAL          : integer := 10
	);
	port(
		-- Start signal for dnl calculation
		start_in               : in  std_logic;
		-- Signals which are used to read the data from the histogram
		histAddr_out           : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		histData_in            : in  std_logic_vector(g_NO_OF_SAMPLES_HIST - 1 downto 0);
		-- Signals which are used to read the data from the dnl
		dnlAddr_in             : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		dnlData_out            : out std_logic_vector(g_NO_OF_SAMPLES_HIST + g_NO_OF_FRACTIONAL downto 0); -- Range -1 to 2**g_NO_OF_SAMPLES_HIST
		-- Detected length of carry chain
		minLengthCarryChain_in : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		maxLengthCarryChain_in : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		-- Signalizes that the current dnl is calculated
		dnlRunning_out         : out std_logic;
		--  Clock
		clk                    : in  std_logic
	);
end dnl;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of dnl is
	--------------------------------------------------------------------------------------------
	-- internal types
	--------------------------------------------------------------------------------------------
	-- Define the different states of the statemachine	
	type fsmState is (WAITFORSTART, STARTCALCSUM, CALCSUM, STARTDIVISIONMEAN, WAITDIVISIONMEAN, CALCDNLREAD, CALCDNLREADWAIT, CALCDNLSTARTDIVISION, CALCDNLWAITDIVISION);

	--------------------------------------------------------------------------------------------
	-- Internal signals
	--------------------------------------------------------------------------------------------
	signal fsmState_pres : fsmState := WAITFORSTART;
	signal fsmState_next : fsmState := WAITFORSTART;

	-- Ram signals
	signal ramWEn_pres   : std_logic;
	signal ramAddrR_pres : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramAddrW_pres : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramDataW_pres : std_logic_vector(g_NO_OF_SAMPLES_HIST + g_NO_OF_FRACTIONAL downto 0);
	signal ramWEn_next   : std_logic;
	signal ramAddrR_next : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramAddrW_next : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramDataW_next : std_logic_vector(g_NO_OF_SAMPLES_HIST + g_NO_OF_FRACTIONAL downto 0);

	-- Counters
	signal counterIdx_pres : integer range 0 to (2**g_NUM_OF_BITS_FOR_MAX_ELEMS) + 2;
	signal counterIdx_next : integer range 0 to (2**g_NUM_OF_BITS_FOR_MAX_ELEMS) + 2;
	signal counterDiv_pres : integer range 0 to 1;
	signal counterDiv_next : integer range 0 to 1;

	-- Sum over all bins
	signal sumBins_pres : integer range 0 to (2**g_NO_OF_SAMPLES_HIST * 2**g_NUM_OF_BITS_FOR_MAX_ELEMS);
	signal sumBins_next : integer range 0 to (2**g_NO_OF_SAMPLES_HIST * 2**g_NUM_OF_BITS_FOR_MAX_ELEMS);

	-- Register stage fot length of carry chain
	signal maxLengthCarryChainReg  : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal minLengthCarryChainReg  : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal diffLengthCarryChainReg : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);

	-- Signals for the division
	signal divStart_pres    : std_logic;
	signal divDivisor_pres  : std_logic_vector((g_NO_OF_SAMPLES_HIST + g_NUM_OF_BITS_FOR_MAX_ELEMS + 2 * g_NO_OF_FRACTIONAL) - 1 downto 0);
	signal divDividend_pres : std_logic_vector((g_NO_OF_SAMPLES_HIST + g_NUM_OF_BITS_FOR_MAX_ELEMS + 2 * g_NO_OF_FRACTIONAL) - 1 downto 0);
	signal divStart_next    : std_logic;
	signal divDivisor_next  : std_logic_vector((g_NO_OF_SAMPLES_HIST + g_NUM_OF_BITS_FOR_MAX_ELEMS + 2 * g_NO_OF_FRACTIONAL) - 1 downto 0);
	signal divDividend_next : std_logic_vector((g_NO_OF_SAMPLES_HIST + g_NUM_OF_BITS_FOR_MAX_ELEMS + 2 * g_NO_OF_FRACTIONAL) - 1 downto 0);
	signal divRunning       : std_logic;
	signal divResult        : std_logic_Vector((g_NO_OF_SAMPLES_HIST + g_NUM_OF_BITS_FOR_MAX_ELEMS + 2 * g_NO_OF_FRACTIONAL) - 1 downto 0);

	-- Mean value over all bins
	signal meanValBin_pres : std_logic_Vector((g_NO_OF_SAMPLES_HIST + g_NUM_OF_BITS_FOR_MAX_ELEMS + 2 * g_NO_OF_FRACTIONAL) - 1 downto 0);
	signal meanValBin_next : std_logic_Vector((g_NO_OF_SAMPLES_HIST + g_NUM_OF_BITS_FOR_MAX_ELEMS + 2 * g_NO_OF_FRACTIONAL) - 1 downto 0);

begin
	------------------------------------------------------------------------------------------------
	-- FF Stage
	------------------------------------------------------------------------------------------------

	ffStage : process(clk)
	begin
		-- Check for a rising edge
		if (rising_edge(clk)) then
			maxLengthCarryChainReg  <= maxLengthCarryChain_in;
			minLengthCarryChainReg  <= minLengthCarryChain_in;
			diffLengthCarryChainReg <= std_logic_vector(to_unsigned(to_integer(unsigned(maxLengthCarryChainReg)) - to_integer(unsigned(minLengthCarryChainReg)), g_NUM_OF_BITS_FOR_MAX_ELEMS));
		end if;
	end process ffStage;

	------------------------------------------------------------------------------------------------
	-- control fsm nextstatelogic process
	------------------------------------------------------------------------------------------------
	-- This process controls the next state logic of the statemachine.
	nextStateLogic : process(counterIdx_pres, fsmState_pres, histData_in, maxLengthCarryChainReg, ramAddrR_pres, ramAddrW_pres, ramDataW_pres, start_in, sumBins_pres, divDividend_pres, divDivisor_pres, divResult, divRunning, divStart_pres, meanValBin_pres, counterDiv_pres, minLengthCarryChainReg, diffLengthCarryChainReg)
	begin
		-- Default outputs
		dnlRunning_out <= '1';
		histAddr_out   <= ramAddrR_pres;

		-- Default assignements
		fsmState_next    <= fsmState_pres;
		ramWEn_next      <= '0';
		ramAddrR_next    <= ramAddrR_pres;
		ramAddrW_next    <= ramAddrW_pres;
		ramDataW_next    <= ramDataW_pres;
		counterIdx_next  <= counterIdx_pres;
		sumBins_next     <= sumBins_pres;
		divStart_next    <= divStart_pres;
		divDivisor_next  <= divDivisor_pres;
		divDividend_next <= divDividend_pres;
		meanValBin_next  <= meanValBin_pres;
		counterDiv_next  <= counterDiv_pres;

		-- Statemachine
		case fsmState_pres is
			when WAITFORSTART =>
				-- DNL is currently not running
				dnlRunning_out <= '0';

				-- Check if the start signal is set
				if (start_in = '1') then

					-- Change the state
					fsmState_next <= STARTCALCSUM;
				end if;

			when STARTCALCSUM =>
				-- Reset the counter
				counterIdx_next <= to_integer(unsigned(minLengthCarryChainReg)) + 1;

				-- Reset the sum
				sumBins_next <= 0;

				-- Read the first data from the histogram block

				ramAddrR_next <= minLengthCarryChainReg;

				-- Change the state
				fsmState_next <= CALCSUM;

			when CALCSUM =>
				-- Read the data out of the histogram
				ramAddrR_next <= std_logic_vector(to_unsigned(counterIdx_pres, g_NUM_OF_BITS_FOR_MAX_ELEMS));

				-- Add the read data to the sum
				if (counterIdx_pres >= (to_integer(unsigned(minLengthCarryChainReg)) + 2)) then
					sumBins_next <= sumBins_pres + to_integer(unsigned(histData_in));
				end if;

				-- Check if we waited long enough
				if (counterIdx_pres = (to_integer(unsigned(maxLengthCarryChainReg)) + 2)) then
					-- Reset counter
					counterDiv_next <= 0;

					-- Change the state
					fsmState_next <= STARTDIVISIONMEAN;
				else
					-- Increment the counter
					counterIdx_next <= counterIdx_pres + 1;
				end if;

			when STARTDIVISIONMEAN =>
				-- Set the division values and start the division
				divDivisor_next                                                                                                           <= (others => '0');
				divDividend_next                                                                                                          <= (others => '0');
				divDividend_next((g_NO_OF_SAMPLES_HIST + g_NUM_OF_BITS_FOR_MAX_ELEMS + g_NO_OF_FRACTIONAL) - 1 downto g_NO_OF_FRACTIONAL) <= std_logic_vector(to_unsigned(sumBins_pres, (g_NO_OF_SAMPLES_HIST + g_NUM_OF_BITS_FOR_MAX_ELEMS)));
				divDivisor_next((g_NUM_OF_BITS_FOR_MAX_ELEMS) - 1 downto 0)                                                               <= diffLengthCarryChainReg; -- No fractional bits for divisor as fractional will be fDividend - fDivisor
				divStart_next                                                                                                             <= '1';

				-- Wait till the divsion started
				if (counterDiv_pres = 1) then
					-- Change the state
					fsmState_next <= WAITDIVISIONMEAN;
				else
					counterDiv_next <= counterDiv_pres + 1;
				end if;

			when WAITDIVISIONMEAN =>
				-- Do not start the division again
				divStart_next <= '0';

				-- Check if the division is finished
				if (divRunning = '0') then
					-- Save the result
					meanValBin_next <= divResult;

					-- Reset the counter
					counterIdx_next <= 1;

					-- Change the state
					fsmState_next <= CALCDNLREAD;
				end if;

			when CALCDNLREAD =>
				-- Read the dnl value out
				ramAddrR_next <= std_logic_vector(to_unsigned(counterIdx_pres, g_NUM_OF_BITS_FOR_MAX_ELEMS));

				-- Reset counter
				counterDiv_next <= 0;

				-- Change the state
				fsmState_next <= CALCDNLREADWAIT;

			when CALCDNLREADWAIT =>
				-- Wait one cycle till the data from the BRAM is ready

				-- Read the dnl value out
				ramAddrR_next <= std_logic_vector(to_unsigned(counterIdx_pres, g_NUM_OF_BITS_FOR_MAX_ELEMS));

				-- Change the state
				fsmState_next <= CALCDNLSTARTDIVISION;

			when CALCDNLSTARTDIVISION =>
				-- Set the division values and start the division
				divDividend_next                                                                                    <= (others => '0');
				divDividend_next((g_NO_OF_SAMPLES_HIST + 2 * g_NO_OF_FRACTIONAL) - 1 downto 2 * g_NO_OF_FRACTIONAL) <= histData_in; -- Double the numer of fractionals, as it will be reduced by g_NO_OF_FRACTIONAL because the divisor also has fractionals
				divDivisor_next                                                                                     <= meanValBin_pres;
				divStart_next                                                                                       <= '1';

				-- Wait till the divsion started
				if (counterDiv_pres = 1) then
					-- Change the state
					fsmState_next <= CALCDNLWAITDIVISION;
				else
					counterDiv_next <= counterDiv_pres + 1;
				end if;

			when CALCDNLWAITDIVISION =>
				-- Do not start the division again
				divStart_next <= '0';

				-- Check if the division is finished
				if (divRunning = '0') then
					-- Save the result
					ramWEn_next   <= '1';
					ramAddrW_next <= std_logic_vector(to_unsigned(counterIdx_pres, g_NUM_OF_BITS_FOR_MAX_ELEMS));
					ramDataW_next <= std_logic_vector(to_signed(to_integer(unsigned(divResult)) - (1 * 2**g_NO_OF_FRACTIONAL), g_NO_OF_SAMPLES_HIST + 1 + g_NO_OF_FRACTIONAL));

					-- Check if we waited long enough
					if (counterIdx_pres = to_integer(unsigned(maxLengthCarryChainReg))) then

						-- Change the state
						fsmState_next <= WAITFORSTART;

					else
						-- Increment the counter
						counterIdx_next <= counterIdx_pres + 1;

						-- Change the state
						fsmState_next <= CALCDNLREAD;
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
			fsmState_pres    <= fsmState_next;
			ramWEn_pres      <= ramWEn_next;
			ramAddrR_pres    <= ramAddrR_next;
			ramAddrW_pres    <= ramAddrW_next;
			ramDataW_pres    <= ramDataW_next;
			counterIdx_pres  <= counterIdx_next;
			sumBins_pres     <= sumBins_next;
			divStart_pres    <= divStart_next;
			divDivisor_pres  <= divDivisor_next;
			divDividend_pres <= divDividend_next;
			meanValBin_pres  <= meanValBin_next;
			counterDiv_pres  <= counterDiv_next;
		end if;
	end process stateRegister;

	--------------------------------------------------------------------------------------------
	-- Instantiate one blockram for the DNL
	--------------------------------------------------------------------------------------------
	inst_ramDNL : entity work.tdpRAM
		generic map(
			addr_width_g => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			data_width_g => g_NO_OF_SAMPLES_HIST + 1 + g_NO_OF_FRACTIONAL
		)
		port map(
			a_clk      => clk,
			a_wr_en_in => ramWEn_pres,
			a_addr_in  => ramAddrW_pres,
			a_data_in  => ramDataW_pres,
			a_data_out => open,
			b_clk      => clk,
			b_wr_en_in => '0',
			b_addr_in  => dnlAddr_in,
			b_data_in  => (others => '0'),
			b_data_out => dnlData_out
		);

	--------------------------------------------------------------------------------------------
	-- Instantiate the divison
	--------------------------------------------------------------------------------------------
	inst_divGen : entity work.division
		generic map(
			division_width_g => g_NO_OF_SAMPLES_HIST + g_NUM_OF_BITS_FOR_MAX_ELEMS + 2 * g_NO_OF_FRACTIONAL
		)
		port map(
			Start_in    => divStart_pres,
			Dividend_in => divDividend_pres,
			Divisor_in  => divDivisor_pres,
			Busy_out    => divRunning,
			Result_out  => divResult,
			RESETN      => '1',
			CLK         => clk
		);

end behavioral;
