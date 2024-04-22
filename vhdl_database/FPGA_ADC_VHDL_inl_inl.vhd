----------------------------------------------------------------------------------------------------
-- brief: Calculates the INL from a DNL.
-- file: inl.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 09.04.2020 | L. Leuenberger     | Auto-Created
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
entity inl is
	generic(
		g_NUM_OF_BITS_FOR_MAX_ELEMS : integer := 10;
		g_NO_OF_SAMPLES_HIST        : integer := 12; -- 2** g_NO_OF_SAMPLES_HIST
		g_NO_OF_FRACTIONAL          : integer := 10
	);
	port(
		-- Start signal for dnl calculation
		start_in               : in  std_logic;
		-- Signals which are used to read the data from the dnl
		dnlAddr_out            : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		dnlData_in             : in  std_logic_vector(g_NO_OF_SAMPLES_HIST + g_NO_OF_FRACTIONAL downto 0);
		-- Signals which are used to read the data from the inl
		inlAddr_in             : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		inlData_out            : out std_logic_vector(g_NO_OF_SAMPLES_HIST downto 0); -- Range -2**g_NO_OF_SAMPLES_HIST to 2**g_NO_OF_SAMPLES_HIST
		inlClk_in              : in  std_logic;
		-- Detected length of carry chain
		minLengthCarryChain_in : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		maxLengthCarryChain_in : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		-- Signalizes that the current dnl is calculated
		inlRunning_out         : out std_logic;
		--  Clock
		clk                    : in  std_logic
	);
end inl;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of inl is
	--------------------------------------------------------------------------------------------
	-- internal function
	--------------------------------------------------------------------------------------------
	pure function roundSignedInteger(val : integer) return integer is
		variable integerDiv     : integer := 0;
		variable integerRemaind : integer := 0;
	begin
		integerDiv     := val / (2**g_NO_OF_FRACTIONAL);
		integerRemaind := abs (val - (integerDiv * (2**g_NO_OF_FRACTIONAL)));

		if ((val > 0) and (integerRemaind > (2**(g_NO_OF_FRACTIONAL - 1)))) then
			return (integerDiv + 1);
		elsif ((val > 0) and (integerRemaind <= (2**(g_NO_OF_FRACTIONAL - 1)))) then
			return (integerDiv);
		elsif ((val < 0) and (integerRemaind > (2**(g_NO_OF_FRACTIONAL - 1)))) then
			return (integerDiv - 1);
		else
			return (integerDiv);
		end if;
	end function roundSignedInteger;

	--------------------------------------------------------------------------------------------
	-- internal types
	--------------------------------------------------------------------------------------------
	-- Define the different states of the statemachine	
	type fsmState is (WAITFORSTART, STARTCALCSUM, CALCSUM);

	--------------------------------------------------------------------------------------------
	-- Internal signals
	--------------------------------------------------------------------------------------------
	signal fsmState_pres : fsmState := WAITFORSTART;
	signal fsmState_next : fsmState := WAITFORSTART;

	-- Ram signals
	signal ramWEn_pres   : std_logic;
	signal ramAddrR_pres : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramAddrW_pres : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramDataW_pres : std_logic_vector(g_NO_OF_SAMPLES_HIST downto 0);
	signal ramWEn_next   : std_logic;
	signal ramAddrR_next : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramAddrW_next : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal ramDataW_next : std_logic_vector(g_NO_OF_SAMPLES_HIST downto 0);

	-- Counters
	signal counterIdx_pres : integer range 0 to (2**g_NUM_OF_BITS_FOR_MAX_ELEMS) + 2;
	signal counterIdx_next : integer range 0 to (2**g_NUM_OF_BITS_FOR_MAX_ELEMS) + 2;

	-- Sum over all bins
	signal sumBins_pres     : integer range -(2**g_NO_OF_SAMPLES_HIST * 2**g_NUM_OF_BITS_FOR_MAX_ELEMS) to (2**g_NO_OF_SAMPLES_HIST * 2**g_NUM_OF_BITS_FOR_MAX_ELEMS);
	signal sumBins_next     : integer range -(2**g_NO_OF_SAMPLES_HIST * 2**g_NUM_OF_BITS_FOR_MAX_ELEMS) to (2**g_NO_OF_SAMPLES_HIST * 2**g_NUM_OF_BITS_FOR_MAX_ELEMS);
	signal sumBinsSave_pres : integer range -(2**g_NO_OF_SAMPLES_HIST * 2**g_NUM_OF_BITS_FOR_MAX_ELEMS) to (2**g_NO_OF_SAMPLES_HIST * 2**g_NUM_OF_BITS_FOR_MAX_ELEMS);
	signal sumBinsSave_next : integer range -(2**g_NO_OF_SAMPLES_HIST * 2**g_NUM_OF_BITS_FOR_MAX_ELEMS) to (2**g_NO_OF_SAMPLES_HIST * 2**g_NUM_OF_BITS_FOR_MAX_ELEMS);

	-- Register stage fot length of carry chain
	signal maxLengthCarryChainReg : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal minLengthCarryChainReg : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);

begin
	------------------------------------------------------------------------------------------------
	-- FF Stage
	------------------------------------------------------------------------------------------------
	ffStage : process(clk)
	begin
		-- Check for a rising edge
		if (rising_edge(clk)) then
			maxLengthCarryChainReg <= maxLengthCarryChain_in;
			minLengthCarryChainReg <= minLengthCarryChain_in;
		end if;
	end process ffStage;

	------------------------------------------------------------------------------------------------
	-- control fsm nextstatelogic process
	------------------------------------------------------------------------------------------------
	-- This process controls the next state logic of the statemachine.
	nextStateLogic : process(counterIdx_pres, fsmState_pres, dnlData_in, maxLengthCarryChainReg, ramAddrR_pres, ramAddrW_pres, ramDataW_pres, start_in, sumBins_pres, sumBinsSave_pres, minLengthCarryChainReg)
	begin
		-- Default outputs
		inlRunning_out <= '1';
		dnlAddr_out    <= ramAddrR_pres;

		-- Default assignements
		fsmState_next    <= fsmState_pres;
		ramWEn_next      <= '0';
		ramAddrR_next    <= ramAddrR_pres;
		ramAddrW_next    <= ramAddrW_pres;
		ramDataW_next    <= ramDataW_pres;
		counterIdx_next  <= counterIdx_pres;
		sumBins_next     <= sumBins_pres;
		sumBinsSave_next <= sumBinsSave_pres;

		-- Statemachine
		case fsmState_pres is
			when WAITFORSTART =>
				-- DNL is currently not running
				inlRunning_out <= '0';

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

				-- Read the first data from the dnl block
				ramAddrR_next <= minLengthCarryChainReg;

				-- Change the state
				fsmState_next <= CALCSUM;

			when CALCSUM =>
				-- Read the data out of the next dnl
				ramAddrR_next <= std_logic_vector(to_unsigned(counterIdx_pres, g_NUM_OF_BITS_FOR_MAX_ELEMS));

				-- Add the read data to the sum
				if (counterIdx_pres >= (to_integer(unsigned(minLengthCarryChainReg)) + 3)) then
					sumBins_next     <= sumBins_pres + to_integer(signed(dnlData_in));
					sumBinsSave_next <= sumBins_pres + to_integer(signed(dnlData_in)) / 2; -- Center of bin is used

					-- Save the data into the RAM
					ramWEn_next   <= '1';
					ramAddrW_next <= std_logic_vector(to_unsigned(counterIdx_pres - 3, g_NUM_OF_BITS_FOR_MAX_ELEMS));
					ramDataW_next <= std_logic_vector(to_signed(roundSignedInteger(sumBinsSave_pres), g_NO_OF_SAMPLES_HIST + 1));
				end if;

				-- Check if we waited long enough
				if (counterIdx_pres = (to_integer(unsigned(maxLengthCarryChainReg)) + 3)) then

					-- Change the state
					fsmState_next <= WAITFORSTART;
				else
					-- Increment the counter
					counterIdx_next <= counterIdx_pres + 1;
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
			sumBinsSave_pres <= sumBinsSave_next;
		end if;
	end process stateRegister;

	--------------------------------------------------------------------------------------------
	-- Instantiate one blockram for the DNL
	--------------------------------------------------------------------------------------------
	inst_ramINL : entity work.tdpRAM
		generic map(
			addr_width_g => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			data_width_g => g_NO_OF_SAMPLES_HIST + 1
		)
		port map(
			a_clk      => clk,
			a_wr_en_in => ramWEn_pres,
			a_addr_in  => ramAddrW_pres,
			a_data_in  => ramDataW_pres,
			a_data_out => open,
			b_clk      => inlClk_in,
			b_wr_en_in => '0',
			b_addr_in  => inlAddr_in,
			b_data_in  => (others => '0'),
			b_data_out => inlData_out
		);

end behavioral;
