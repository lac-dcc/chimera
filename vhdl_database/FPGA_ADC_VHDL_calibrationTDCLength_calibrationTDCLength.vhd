----------------------------------------------------------------------------------------------------
-- brief: This block calibrates the length of the delay chain, eg. the number of taps which
--        correspond to one clock period are determined.
-- file: calibrationTDCLength.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 31.01.2020 | L. Leuenberger     | Auto-Created
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
entity calibrationTDCLength is
	generic(
		g_NUMBER_OF_STEPS_CLOCK_SHIFT : integer                       := 8;
		g_DIVIDE_VALUE                : integer                       := 2;
		g_DUTY_VALUE                  : integer                       := 50000; -- Multiplied by factor 1000 -> 50% Duty Cycle
		g_ADDR_REG1                   : std_logic_vector(6 downto 0)  := "0001000";
		g_ADDR_REG2                   : std_logic_vector(6 downto 0)  := "0001001";
		g_BITMASK_REG1                : std_logic_vector(15 downto 0) := "0001000000000000";
		g_BITMASK_REG2                : std_logic_vector(15 downto 0) := "1111110000000000";
		g_NUM_OF_ELEMS                : integer                       := 512; -- number of elements in the delay chain (must be a multiple of 8 because of the carry chain block size! carry8 = 1 block of 8 carry elements)
		g_NUM_OF_BITS_FOR_MAX_ELEMS   : integer                       := 10;
		g_NO_OF_SUM_MEAN              : integer                       := 13 -- 2^g_NO_OF_SUM_MEAN
	);
	port(
		-- Start signal
		start_in                 : in  std_logic;
		-- Locked signal
		locked_in                : in  std_logic;
		reset_clk_out            : out std_logic;
		-- DRP interface
		drp_den                  : out std_logic; -- Enable (required)
		drp_daddr                : out std_logic_vector(6 downto 0); -- Address (required)
		drp_di                   : out std_logic_vector(15 downto 0); -- Data In (required)
		drp_do                   : in  std_logic_vector(15 downto 0); --  (required) -- Is not used in this design!
		drp_drdy                 : in  std_logic; --  (required)
		drp_dwe                  : out std_logic; --  (required)
		-- Sum of carry chain input
		sumOnes_in               : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		-- Detected length of carry chain
		maxLengthCarryChain_out  : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		configurationRunning_out : out std_logic;
		--  Clock
		clk                      : in  std_logic
	);
end calibrationTDCLength;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of calibrationTDCLength is
	--------------------------------------------------------------------------------------------
	-- Functions for PLL calculation
	--------------------------------------------------------------------------------------------
	-- FRAC_PRECISION describes the width of the fractional portion of the fixed
	--    point numbers.  These should not be modified, they are for development 
	--    only
	constant FRAC_PRECISION : integer := 10;
	-- FIXED_WIDTH describes the total size for fixed point calculations(int+frac).
	-- Warning: L.50 and below will not calculate properly with FIXED_WIDTHs 
	--    greater than 32
	constant FIXED_WIDTH    : integer := 32;

	--------------------------------------------------------------------------------------------
	-- Function round_frac
	--------------------------------------------------------------------------------------------
	-- This function takes a fixed point number and rounds it to the nearest
	--    fractional precision bit.
	function round_frac(decimal : unsigned(FIXED_WIDTH downto 1); precision : unsigned(FIXED_WIDTH downto 1)) return unsigned is
		variable round_frac_Result : unsigned(FIXED_WIDTH downto 1);
	begin
		if decimal(FRAC_PRECISION - to_integer(precision)) = '1' then
			round_frac_Result := decimal + (X"00000001" sll (FRAC_PRECISION - to_integer(precision)));
		else
			round_frac_Result := decimal;
		end if;
		return round_frac_Result;
	end function;

	--------------------------------------------------------------------------------------------
	-- Function pll_divider
	--------------------------------------------------------------------------------------------
	-- This function calculates high_time, low_time, w_edge, and no_count
	--    of a non-fractional counter based on the divide and duty cycle
	--
	-- NOTE: high_time and low_time are returned as integers between 0 and 63 
	--    inclusive.  64 should equal 6'b000000 (in other words it is okay to 
	--    ignore the overflow)
	function pll_divider(divide : unsigned(7 downto 0); duty_cycle : unsigned(31 downto 0)) return unsigned is
		variable pll_divider_Result : unsigned(13 downto 0);
		variable duty_cycle_fix     : unsigned(FIXED_WIDTH downto 1);
		variable high_time          : unsigned(6 downto 0);
		variable low_time           : unsigned(6 downto 0);
		variable no_count           : std_logic;
		variable temp               : unsigned(FIXED_WIDTH downto 1);
		variable w_edge             : std_logic;
	begin
		duty_cycle_fix     := (duty_cycle sll FRAC_PRECISION) / X"000186a0";
		if divide = X"01" then
			high_time := "0000001";
			w_edge    := '0';
			low_time  := "0000001";
			no_count  := '1';
		else
			temp      := round_frac(Resize(duty_cycle_fix * Resize(divide, FIXED_WIDTH), FIXED_WIDTH), X"00000001");
			high_time := temp(FRAC_PRECISION + 7 downto FRAC_PRECISION + 1);
			w_edge    := temp(FRAC_PRECISION);
			if high_time = "0000000" then
				high_time := "0000001";
				w_edge    := '0';
			end if;
			if Resize(high_time, 8) = divide then
				high_time := Resize(divide - X"01", 7);
				w_edge    := '1';
			end if;
			low_time  := Resize(divide - Resize(high_time, 8), 7);
			no_count  := '0';
		end if;
		pll_divider_Result := w_edge & no_count & high_time(5 downto 0) & low_time(5 downto 0);
		return pll_divider_Result;
	end function;

	--------------------------------------------------------------------------------------------
	-- Function pll_phase
	--------------------------------------------------------------------------------------------
	-- This function calculates mx, delay_time, and phase_mux 
	--  of a non-fractional counter based on the divide and phase
	--
	-- NOTE: The only valid value for the MX bits is 2'b00 to ensure the coarse mux
	--    is used.
	function pll_phase(divide : unsigned(7 downto 0); phase : signed(31 downto 0)) return unsigned is
		variable pll_phase_Result : unsigned(10 downto 0);
		variable delay_time       : unsigned(5 downto 0);
		variable mx               : unsigned(1 downto 0);
		variable phase_fixed      : unsigned(FIXED_WIDTH downto 1);
		variable phase_in_cycles  : unsigned(FIXED_WIDTH downto 1);
		variable phase_mux        : unsigned(2 downto 0);
		variable temp             : unsigned(FIXED_WIDTH downto 1);
	begin
		if phase < X"00000000" then
			phase_fixed := unsigned(((phase + X"00057e40") sll FRAC_PRECISION) / X"000003e8");
		else
			phase_fixed := unsigned((phase sll FRAC_PRECISION) / X"000003e8");
		end if;
		phase_in_cycles  := Resize((phase_fixed * Resize(divide, FIXED_WIDTH)) / X"0000000000000168", FIXED_WIDTH);
		temp             := round_frac(phase_in_cycles, X"00000003");
		mx               := "00";
		phase_mux        := temp(FRAC_PRECISION downto FRAC_PRECISION - 2);
		delay_time       := temp(FRAC_PRECISION + 6 downto FRAC_PRECISION + 1);
		pll_phase_Result := mx & phase_mux & delay_time;
		return pll_phase_Result;
	end function;

	--------------------------------------------------------------------------------------------
	-- Function pll_count_calc
	--------------------------------------------------------------------------------------------
	-- This function takes in the divide, phase, and duty cycle
	-- setting to calculate the upper and lower counter registers.
	function pll_count_calc(divide : unsigned(7 downto 0); phase : signed(31 downto 0); duty_cycle : unsigned(31 downto 0)) return unsigned is
		variable pll_count_calc_Result : unsigned(31 downto 0);
		variable div_calc              : unsigned(13 downto 0);
		variable phase_calc            : unsigned(16 downto 0);
	begin
		div_calc              := pll_divider(divide, duty_cycle);
		phase_calc            := Resize(pll_phase(divide, phase), 17);
		pll_count_calc_Result := Resize(phase_calc(10 downto 9) & div_calc(13 downto 12) & phase_calc(5 downto 0) & phase_calc(8 downto 6) & '0' & div_calc(11 downto 0), 32);
		return pll_count_calc_Result;
	end function;

	--------------------------------------------------------------------------------------------
	-- internal types
	--------------------------------------------------------------------------------------------
	-- Define the type for the rom which contains the different values for the configuration of the PLL
	type rom_type is array (0 to g_NUMBER_OF_STEPS_CLOCK_SHIFT - 1) of std_logic_vector(31 downto 0);

	-- Define the different states of the statemachine	
	type fsmState is (WAITFORSTART, SENDATA, WAITFORWRITE, WAITFORLOCKED, WAITFORSUM, CALCSUM, CALCMEAN, CALCDIFF, CHECKSUM);

	--------------------------------------------------------------------------------------------
	-- Function for the ROM initialization
	--------------------------------------------------------------------------------------------
	pure function initROM return rom_type is
		variable tempROM : rom_type;
	begin
		for i in 0 to g_NUMBER_OF_STEPS_CLOCK_SHIFT - 1 loop
			tempROM(i) := std_logic_vector(pll_count_calc(to_unsigned(g_DIVIDE_VALUE, 8), to_signed(integer(360.0 / real(g_NUMBER_OF_STEPS_CLOCK_SHIFT) * real(i) * 1000.0), 32), to_unsigned(g_DUTY_VALUE, 32)));
		end loop;
		return tempROM;
	end function;

	--------------------------------------------------------------------------------------------
	-- Generate the rom
	--------------------------------------------------------------------------------------------
	constant rom               : rom_type := initROM; -- Contains the rom;
	constant noOfCyclesWaitSum : integer  := 20; -- Some cycles more to be on the safe side
	constant noOfSumMean       : integer  := 2**g_NO_OF_SUM_MEAN; -- How many sums shall be averaged

	--------------------------------------------------------------------------------------------
	-- Internal signals
	--------------------------------------------------------------------------------------------
	signal fsmState_pres : fsmState := WAITFORSTART;
	signal fsmState_next : fsmState := WAITFORSTART;

	signal addr_drp            : std_logic_vector(6 downto 0);
	signal data_drp            : std_logic_vector(15 downto 0);
	signal bitmask_drp         : std_logic_vector(15 downto 0);
	signal ready_drp           : std_logic;
	signal start_drp           : std_logic;
	signal counterPhase_pres   : integer range 0 to g_NUMBER_OF_STEPS_CLOCK_SHIFT - 1;
	signal counterSum_pres     : integer range 0 to noOfCyclesWaitSum - 1;
	signal minDetectedSum_pres : integer range 0 to g_NUM_OF_ELEMS / 2;
	signal counterPhase_next   : integer range 0 to g_NUMBER_OF_STEPS_CLOCK_SHIFT - 1;
	signal counterSum_next     : integer range 0 to noOfCyclesWaitSum - 1;
	signal minDetectedSum_next : integer range 0 to g_NUM_OF_ELEMS / 2;
	signal diffSum_pres        : integer range -g_NUM_OF_ELEMS / 2 to g_NUM_OF_ELEMS / 2;
	signal diffSum_next        : integer range -g_NUM_OF_ELEMS / 2 to g_NUM_OF_ELEMS / 2;
	signal sumSum_pres         : integer range 0 to g_NUM_OF_ELEMS * noOfSumMean;
	signal sumSum_next         : integer range 0 to g_NUM_OF_ELEMS * noOfSumMean;
	signal sumMean_pres        : integer range 0 to g_NUM_OF_ELEMS;
	signal sumMean_next        : integer range 0 to g_NUM_OF_ELEMS;
	signal counterMean_pres    : integer range 0 to noOfSumMean;
	signal counterMean_next    : integer range 0 to noOfSumMean;
	
	signal sumOnesReg : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);

	--------------------------------------------------------------------------------------------
	-- Attributes
	--------------------------------------------------------------------------------------------
	ATTRIBUTE X_INTERFACE_INFO      : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
	ATTRIBUTE X_INTERFACE_INFO of drp_den : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DEN";
	ATTRIBUTE X_INTERFACE_INFO of drp_daddr : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DADDR";
	ATTRIBUTE X_INTERFACE_INFO of drp_di : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DI";
	ATTRIBUTE X_INTERFACE_INFO of drp_do : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DO";
	ATTRIBUTE X_INTERFACE_INFO of drp_drdy : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DRDY";
	ATTRIBUTE X_INTERFACE_INFO of drp_dwe : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DWE";
	ATTRIBUTE X_INTERFACE_INFO of reset_clk_out : SIGNAL is "xilinx.com:signal:reset:1.0 reset_clk_out RST";
	ATTRIBUTE X_INTERFACE_PARAMETER of reset_clk_out : SIGNAL is "POLARITY ACTIVE_HIGH";
begin
	------------------------------------------------------------------------------------------------
	-- FF Stage
	------------------------------------------------------------------------------------------------
	ffStage : process(clk)
	begin
		-- Check for a rising edge
		if (rising_edge(clk)) then
			sumOnesReg <= sumOnes_in;
		end if;
	end process ffStage;
	
	------------------------------------------------------------------------------------------------
	-- control fsm nextstatelogic process
	------------------------------------------------------------------------------------------------
	-- This process controls the next state logic of the statemachine.
	nextStateLogic : process(counterPhase_pres, counterSum_pres, fsmState_pres, locked_in, minDetectedSum_pres, ready_drp, start_in, sumOnesReg, diffSum_pres, counterMean_pres, sumMean_pres, sumSum_pres)
	begin
		-- Default assignements
		configurationRunning_out <= '1';
		maxLengthCarryChain_out  <= std_logic_vector(to_unsigned(minDetectedSum_pres * 2, maxLengthCarryChain_out'length));
		addr_drp                 <= (others => '0');
		data_drp                 <= (others => '0');
		start_drp                <= '0';
		fsmState_next            <= fsmState_pres;
		counterPhase_next        <= counterPhase_pres;
		counterSum_next          <= counterSum_pres;
		minDetectedSum_next      <= minDetectedSum_pres;
		diffSum_next             <= diffSum_pres;
		sumSum_next              <= sumSum_pres;
		sumMean_next             <= sumMean_pres;
		counterMean_next         <= counterMean_pres;
		bitmask_drp 			 <= (others => '0');

		-- Statemachine
		case fsmState_pres is
			when WAITFORSTART =>
				-- Configuration is currently not running
				configurationRunning_out <= '0';

				-- Check if the start signal is set
				if (start_in = '1') then
					-- Reset the counter 
					counterPhase_next <= 0;

					-- Reset the minimum Sum
					minDetectedSum_next <= g_NUM_OF_ELEMS / 2;

					-- Change the state
					fsmState_next <= SENDATA;
				end if;

			when SENDATA =>
				-- Check if the DRP block is ready so that we can send the first packet of data
				if (ready_drp = '1') then
					-- Set the address and the data
					addr_drp    <= g_ADDR_REG1;
					data_drp    <= rom(counterPhase_pres)(15 downto 0);
					bitmask_drp <= g_BITMASK_REG1;
					start_drp   <= '1';

					-- Change the state
					fsmState_next <= WAITFORWRITE;
				end if;

			when WAITFORWRITE =>
				-- Check if the DRP block is ready so that we can send the second packet of data
				if (ready_drp = '1') then
					-- Set the address and the data
					addr_drp    <= g_ADDR_REG2;
					data_drp    <= rom(counterPhase_pres)(31 downto 16);
					bitmask_drp <= g_BITMASK_REG2;
					start_drp   <= '1';

					-- Change the state
					fsmState_next <= WAITFORLOCKED;
				end if;

			when WAITFORLOCKED =>
				-- Wait for the locked signal of the PLL
				if (locked_in = '1') then
					-- Reset the counter
					counterSum_next <= 0;

					-- Change the state
					fsmState_next <= WAITFORSUM;
				end if;

			when WAITFORSUM =>
				-- Check if we waited long enough
				if (counterSum_pres = noOfCyclesWaitSum - 1) then
					-- Clear the counter 
					counterMean_next <= 0;

					-- Reset the sum
					sumSum_next <= 0;

					-- Change the state
					fsmState_next <= CALCSUM;
				else
					-- Increment the counter
					counterSum_next <= counterSum_pres + 1;
				end if;

			when CALCSUM =>
				-- Add the new sum to the total
				sumSum_next <= sumSum_pres + to_integer(unsigned(sumOnesReg));

				-- Check if we have enough sums
				if (counterMean_pres = noOfSumMean - 1) then

					-- Change the state
					fsmState_next <= CALCMEAN;
				else
					-- Increment the counter
					counterMean_next <= counterMean_pres + 1;
				end if;

			when CALCMEAN =>
				-- Calculate the mean value
				sumMean_next <= sumSum_pres / noOfSumMean;

				-- Change the state
				fsmState_next <= CALCDIFF;

			when CALCDIFF =>
				-- Calculate the sum -- Stage is needed because of timing issues
				diffSum_next <= minDetectedSum_pres - sumMean_pres;

				-- Change the state
				fsmState_next <= CHECKSUM;

			when CHECKSUM =>
				-- Check if the current sum is smaller than current saved one
				if (diffSum_pres > 0) then
					minDetectedSum_next <= to_integer(unsigned(sumOnesReg));
				end if;

				-- Check if we are finished
				if (counterPhase_pres = g_NUMBER_OF_STEPS_CLOCK_SHIFT - 1) then
					-- Change the state
					fsmState_next <= WAITFORSTART;
				else
					-- Increment the counter
					counterPhase_next <= counterPhase_pres + 1;

					-- Change the state
					fsmState_next <= SENDATA;
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
			fsmState_pres       <= fsmState_next;
			counterPhase_pres   <= counterPhase_next;
			counterSum_pres     <= counterSum_next;
			minDetectedSum_pres <= minDetectedSum_next;
			diffSum_pres        <= diffSum_next;
			sumSum_pres         <= sumSum_next;
			sumMean_pres        <= sumMean_next;
			counterMean_pres    <= counterMean_next;
		end if;
	end process stateRegister;

	--------------------------------------------------------------------------------------------
	-- Instantiate the DRP block to write to the PLL
	--------------------------------------------------------------------------------------------
	inst_writeDRP : entity work.writeDRP
		port map(
			addr_in       => addr_drp,
			data_in       => data_drp,
			bitmask_in    => bitmask_drp,
			start_in      => start_drp,
			ready_out     => ready_drp,
			reset_clk_out => reset_clk_out,
			drp_den       => drp_den,
			drp_daddr     => drp_daddr,
			drp_di        => drp_di,
			drp_do        => drp_do,
			drp_drdy      => drp_drdy,
			drp_dwe       => drp_dwe,
			clk           => clk
		);

end behavioral;
