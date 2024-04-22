----------------------------------------------------------------------------------------------------
-- brief: INL Correction - Contains all block which are needed to correct the TDC with the INL
-- file: inlCorrection.vhd
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
entity inlCorrection is
	generic(
		g_NUM_OF_BITS_FOR_MAX_ELEMS : integer := 10;
		g_NO_OF_SAMPLES_HIST        : integer := 12; -- 2** g_NO_OF_SAMPLES_HIST
		g_NO_OF_FRACTIONAL          : integer := 10
	);
	port(
		-- Start and running signal of this block
		start_in               : in  std_logic;
		calculationRunning_out : out std_logic;
		-- Detected length of carry chain
		maxLengthCarryChain_in : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		-- Transition in and out
		fallTransition_in      : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		riseTransition_in      : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		fallTransition_out     : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		riseTransition_out     : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
		--  Clock
		clk                    : in  std_logic;
		clkSlow                : in  std_logic
	);
end inlCorrection;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of inlCorrection is

	--------------------------------------------------------------------------------------------
	-- Internal signals
	--------------------------------------------------------------------------------------------
	-- Connection signals
	signal histStart_F   : std_logic;
	signal histAddr_F    : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal histData_F    : std_logic_vector(g_NO_OF_SAMPLES_HIST - 1 downto 0);
	signal histRunning_F : std_logic;
	signal histStart_R   : std_logic;
	signal histAddr_R    : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal histData_R    : std_logic_vector(g_NO_OF_SAMPLES_HIST - 1 downto 0);
	signal histRunning_R : std_logic;
	signal dnlAddr_F     : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal dnlData_F     : std_logic_vector(g_NO_OF_SAMPLES_HIST + g_NO_OF_FRACTIONAL downto 0);
	signal dnlStart_F    : std_logic;
	signal dnlRunning_F  : std_logic;
	signal dnlAddr_R     : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal dnlData_R     : std_logic_vector(g_NO_OF_SAMPLES_HIST + g_NO_OF_FRACTIONAL downto 0);
	signal dnlStart_R    : std_logic;
	signal dnlRunning_R  : std_logic;
	signal inlAddr_F     : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal inlData_F     : std_logic_vector(g_NO_OF_SAMPLES_HIST downto 0);
	signal inlStart_F    : std_logic;
	signal inlRunning_F  : std_logic;
	signal inlAddr_R     : std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
	signal inlData_R     : std_logic_vector(g_NO_OF_SAMPLES_HIST downto 0);
	signal inlStart_R    : std_logic;
	signal inlRunning_R  : std_logic;
	signal calcRunning_F : std_logic;
	signal calcRunning_R : std_logic;

	signal histRunningReg_F : std_logic;
	signal histRunningReg_R : std_logic;

begin
	------------------------------------------------------------------------------------------------
	-- Flip Flop Stage to help reduce timing issues
	------------------------------------------------------------------------------------------------
	ffStage : process(clkSlow)
	begin
		-- Check for a rising edge
		if (rising_edge(clkSlow)) then
			histRunningReg_F <= histRunning_F;
			histRunningReg_R <= histRunning_R;
		end if;
	end process ffStage;

	--------------------------------------------------------------------------------------------
	-- Control blocks
	--------------------------------------------------------------------------------------------
	inst_controlFalling : entity work.inlCorrectionControl
		port map(
			start_in               => start_in,
			calculationRunning_out => calcRunning_F,
			histStart_out          => histStart_F,
			histRunning_in         => histRunningReg_F,
			dnlStart_out           => dnlStart_F,
			dnlRunning_in          => dnlRunning_F,
			inlStart_out           => inlStart_F,
			inlRunning_in          => inlRunning_F,
			clk                    => clkSlow
		);

	inst_controlRising : entity work.inlCorrectionControl
		port map(
			start_in               => start_in,
			calculationRunning_out => calcRunning_R,
			histStart_out          => histStart_R,
			histRunning_in         => histRunningReg_R,
			dnlStart_out           => dnlStart_R,
			dnlRunning_in          => dnlRunning_R,
			inlStart_out           => inlStart_R,
			inlRunning_in          => inlRunning_R,
			clk                    => clkSlow
		);

	-- Set running signal
	calculationRunning_out <= calcRunning_R or calcRunning_F;

	--------------------------------------------------------------------------------------------
	-- Histogram blocks
	--------------------------------------------------------------------------------------------
	inst_histFalling : entity work.histogram
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => g_NO_OF_SAMPLES_HIST
		)
		port map(
			start_in             => histStart_F,
			transition_in        => fallTransition_in,
			dataValid_in         => '1',
			histAddr_in          => histAddr_F,
			histClk_in           => clkSlow,
			histData_out         => histData_F,
			histogramRunning_out => histRunning_F,
			clk                  => clk
		);

	inst_histRising : entity work.histogram
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => g_NO_OF_SAMPLES_HIST
		)
		port map(
			start_in             => histStart_R,
			transition_in        => riseTransition_in,
			dataValid_in         => '1',
			histAddr_in          => histAddr_R,
			histClk_in           => clkSlow,
			histData_out         => histData_R,
			histogramRunning_out => histRunning_R,
			clk                  => clk
		);

	--------------------------------------------------------------------------------------------
	-- DNL blocks
	--------------------------------------------------------------------------------------------
	inst_dnlFalling : entity work.dnl
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => g_NO_OF_SAMPLES_HIST,
			g_NO_OF_FRACTIONAL          => g_NO_OF_FRACTIONAL
		)
		port map(
			start_in               => dnlStart_F,
			histAddr_out           => histAddr_F,
			histData_in            => histData_F,
			dnlAddr_in             => dnlAddr_F,
			dnlData_out            => dnlData_F,
			minLengthCarryChain_in => std_logic_vector(to_unsigned(1, g_NUM_OF_BITS_FOR_MAX_ELEMS)),
			maxLengthCarryChain_in => maxLengthCarryChain_in,
			dnlRunning_out         => dnlRunning_F,
			clk                    => clkSlow
		);

	inst_dnlRising : entity work.dnl
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => g_NO_OF_SAMPLES_HIST,
			g_NO_OF_FRACTIONAL          => g_NO_OF_FRACTIONAL
		)
		port map(
			start_in               => dnlStart_R,
			histAddr_out           => histAddr_R,
			histData_in            => histData_R,
			dnlAddr_in             => dnlAddr_R,
			dnlData_out            => dnlData_R,
			minLengthCarryChain_in => std_logic_vector(to_unsigned(1, g_NUM_OF_BITS_FOR_MAX_ELEMS)),
			maxLengthCarryChain_in => maxLengthCarryChain_in,
			dnlRunning_out         => dnlRunning_R,
			clk                    => clkSlow
		);

	--------------------------------------------------------------------------------------------
	-- INL blocks
	--------------------------------------------------------------------------------------------
	inst_inlFalling : entity work.inl
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => g_NO_OF_SAMPLES_HIST,
			g_NO_OF_FRACTIONAL          => g_NO_OF_FRACTIONAL
		)
		port map(
			start_in               => inlStart_F,
			dnlAddr_out            => dnlAddr_F,
			dnlData_in             => dnlData_F,
			inlAddr_in             => inlAddr_F,
			inlData_out            => inlData_F,
			inlClk_in              => clk,
			minLengthCarryChain_in => std_logic_vector(to_unsigned(1, g_NUM_OF_BITS_FOR_MAX_ELEMS)),
			maxLengthCarryChain_in => maxLengthCarryChain_in,
			inlRunning_out         => inlRunning_F,
			clk                    => clkSlow
		);

	inst_inlRising : entity work.inl
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => g_NO_OF_SAMPLES_HIST,
			g_NO_OF_FRACTIONAL          => g_NO_OF_FRACTIONAL
		)
		port map(
			start_in               => inlStart_R,
			dnlAddr_out            => dnlAddr_R,
			dnlData_in             => dnlData_R,
			inlAddr_in             => inlAddr_R,
			inlData_out            => inlData_R,
			inlClk_in              => clk,
			minLengthCarryChain_in => std_logic_vector(to_unsigned(1, g_NUM_OF_BITS_FOR_MAX_ELEMS)),
			maxLengthCarryChain_in => maxLengthCarryChain_in,
			inlRunning_out         => inlRunning_R,
			clk                    => clkSlow
		);

	--------------------------------------------------------------------------------------------
	-- Correction blocks
	--------------------------------------------------------------------------------------------
	inst_corrFalling : entity work.inlCorrectionCalc
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => g_NO_OF_SAMPLES_HIST
		)
		port map(
			inlAddr_out            => inlAddr_F,
			inlData_in             => inlData_F,
			minLengthCarryChain_in => std_logic_vector(to_unsigned(1, g_NUM_OF_BITS_FOR_MAX_ELEMS)),
			maxLengthCarryChain_in => maxLengthCarryChain_in,
			transition_in          => fallTransition_in,
			transition_out         => fallTransition_out,
			dataValid_in           => '1',
			dataValid_out          => open,
			clk                    => clk
		);

	inst_corrRising : entity work.inlCorrectionCalc
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => g_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => g_NO_OF_SAMPLES_HIST
		)
		port map(
			inlAddr_out            => inlAddr_R,
			inlData_in             => inlData_R,
			minLengthCarryChain_in => std_logic_vector(to_unsigned(1, g_NUM_OF_BITS_FOR_MAX_ELEMS)),
			maxLengthCarryChain_in => maxLengthCarryChain_in,
			transition_in          => riseTransition_in,
			transition_out         => riseTransition_out,
			dataValid_in           => '1',
			dataValid_out          => open,
			clk                    => clk
		);

end behavioral;
