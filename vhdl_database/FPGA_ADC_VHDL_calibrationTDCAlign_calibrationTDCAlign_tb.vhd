----------------------------------------------------------------------------------------------------
-- brief: Testbench for entity calibrationTDCAlign
-- file: calibrationTDCAlign_tb.vhd
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

-- Standard library ieee
library ieee;
-- This package defines the basic std_logic data types and a few functions.
use ieee.std_logic_1164.all;
-- This package provides arithmetic functions for vectors.
use ieee.numeric_std.all;
-- This package provides file specific functions.
use std.textio.all;
-- This package provides file specific functions for the std_logic types.
use ieee.std_logic_textio.all;

-- Entity of the Testbench
entity calibrationTDCAlign_tb is
end calibrationTDCAlign_tb;

-- Architecture of the Testbench
architecture tb of calibrationTDCAlign_tb is
	----------------------------------------------------------------------------------------------------
	-- Components
	----------------------------------------------------------------------------------------------------
	component calibrationTDCAlign is
		generic(
			g_NUM_OF_BITS_FOR_MAX_ELEMS : integer;
			g_NO_OF_SAMPLES_MEAN        : integer
		);
		port(
			startConfig_in           : in  std_logic;
			startSetValue_in         : in  std_logic;
			setValueDelayIn_in       : in  std_logic_vector(8 downto 0);
			setValueDelayOut_in      : in  std_logic_vector(8 downto 0);
			fallTransition_in        : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			riseTransition_in        : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			delayInStart_out         : out std_logic;
			delayInIncDec_out        : out std_logic;
			delayInReady_in          : in  std_logic;
			delayInDelayTaps_in      : in  std_logic_vector(8 downto 0);
			delayOutStart_out        : out std_logic;
			delayOutIncDec_out       : out std_logic;
			delayOutReady_in         : in  std_logic;
			delayOutDelayTaps_in     : in  std_logic_vector(8 downto 0);
			delayInDelayTaps_out     : out std_logic_vector(8 downto 0);
			delayOutDelayTaps_out    : out std_logic_vector(8 downto 0);
			maxLengthCarryChain_in   : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			configurationRunning_out : out std_logic;
			clk                      : in  std_logic;
			clkSlow                  : in  std_logic
		);
	end component;

	----------------------------------------------------------------------------------------------------
	-- Internal constants
	----------------------------------------------------------------------------------------------------
	constant F_CLK_C : real := 100.0E6; -- Define the frequency of the clock
	constant T_CLK_C : time := (1.0 sec) / F_CLK_C; -- Calculate the period of a clockcycle
	constant DTS_C   : time := 2 ns;    -- Wait time before applying the stimulus 
	constant DTR_C   : time := 6 ns;    -- Wait time before reading response

	constant G_NUM_OF_BITS_FOR_MAX_ELEMS : integer := 4; -- Constant for the generic g_NUM_OF_BITS_FOR_MAX_ELEMS
	constant G_NO_OF_SAMPLES_MEAN        : integer := 1; -- Constant for the generic g_NO_OF_SAMPLES_MEAN

	----------------------------------------------------------------------------------------------------
	-- Internal signals
	----------------------------------------------------------------------------------------------------
	-- Input signals
	signal tb_startConfig_in         : std_logic; -- Internal signal for input signal startConfig_in
	signal tb_startSetValue_in       : std_logic; -- Internal signal for input signal startSetValue_in
	signal tb_setValueDelayIn_in     : std_logic_vector(8 downto 0); -- Internal signal for input signal setValueDelayIn_in
	signal tb_setValueDelayOut_in    : std_logic_vector(8 downto 0); -- Internal signal for input signal setValueDelayOut_in
	signal tb_fallTransition_in      : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal fallTransition_in
	signal tb_riseTransition_in      : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal riseTransition_in
	signal tb_delayInReady_in        : std_logic; -- Internal signal for input signal delayInReady_in
	signal tb_delayInDelayTaps_in    : std_logic_vector(8 downto 0); -- Internal signal for input signal delayInDelayTaps_in
	signal tb_delayOutReady_in       : std_logic; -- Internal signal for input signal delayOutReady_in
	signal tb_delayOutDelayTaps_in   : std_logic_vector(8 downto 0); -- Internal signal for input signal delayOutDelayTaps_in
	signal tb_maxLengthCarryChain_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal maxLengthCarryChain_in
	signal tb_clk                    : std_logic; -- Internal signal for input signal clk
	signal tb_clkSlow                : std_logic; -- Internal signal for input signal clkSlow

	-- Output signals
	signal tb_delayInStart_out         : std_logic; -- Internal signal for output signal delayInStart_out
	signal tb_delayInIncDec_out        : std_logic; -- Internal signal for output signal delayInIncDec_out
	signal tb_delayOutStart_out        : std_logic; -- Internal signal for output signal delayOutStart_out
	signal tb_delayOutIncDec_out       : std_logic; -- Internal signal for output signal delayOutIncDec_out
	signal tb_delayInDelayTaps_out     : std_logic_vector(8 downto 0); -- Internal signal for output signal delayInDelayTaps_out
	signal tb_delayOutDelayTaps_out    : std_logic_vector(8 downto 0); -- Internal signal for output signal delayOutDelayTaps_out
	signal tb_configurationRunning_out : std_logic; -- Internal signal for output signal configurationRunning_out

	-- Expected responses signals
	signal tb_delayInStart_out_exp         : std_logic; -- Expected response for output signal delayInStart_out
	signal tb_delayInIncDec_out_exp        : std_logic; -- Expected response for output signal delayInIncDec_out
	signal tb_delayOutStart_out_exp        : std_logic; -- Expected response for output signal delayOutStart_out
	signal tb_delayOutIncDec_out_exp       : std_logic; -- Expected response for output signal delayOutIncDec_out
	signal tb_delayInDelayTaps_out_exp     : std_logic_vector(8 downto 0); -- Expected response for output signal delayInDelayTaps_out
	signal tb_delayOutDelayTaps_out_exp    : std_logic_vector(8 downto 0); -- Expected response for output signal delayOutDelayTaps_out
	signal tb_configurationRunning_out_exp : std_logic; -- Expected response for output signal configurationRunning_out

begin
	-- Make a dut and map the ports to the correct signals
	DUT : component calibrationTDCAlign
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => G_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_MEAN        => G_NO_OF_SAMPLES_MEAN
		)
		port map(
			startConfig_in           => tb_startConfig_in,
			startSetValue_in         => tb_startSetValue_in,
			setValueDelayIn_in       => tb_setValueDelayIn_in,
			setValueDelayOut_in      => tb_setValueDelayOut_in,
			fallTransition_in        => tb_fallTransition_in,
			riseTransition_in        => tb_riseTransition_in,
			delayInStart_out         => tb_delayInStart_out,
			delayInIncDec_out        => tb_delayInIncDec_out,
			delayInReady_in          => tb_delayInReady_in,
			delayInDelayTaps_in      => tb_delayInDelayTaps_in,
			delayOutStart_out        => tb_delayOutStart_out,
			delayOutIncDec_out       => tb_delayOutIncDec_out,
			delayOutReady_in         => tb_delayOutReady_in,
			delayOutDelayTaps_in     => tb_delayOutDelayTaps_in,
			delayInDelayTaps_out     => tb_delayInDelayTaps_out,
			delayOutDelayTaps_out    => tb_delayOutDelayTaps_out,
			maxLengthCarryChain_in   => tb_maxLengthCarryChain_in,
			configurationRunning_out => tb_configurationRunning_out,
			clk                      => tb_clk,
			clkSlow                  => tb_clkSlow
		);

	-- Apply a clock to the DUT
	stimuli_clk : process
	begin
		tb_clk     <= '0';
		tb_clkSlow <= '0';
		loop
			wait for (T_CLK_C / 2.0);
			tb_clk     <= not tb_clk;
			tb_clkSlow <= not tb_clkSlow;
		end loop;
		wait;
	end process;

	-- Apply the testvectors to the DUT
	apply_testvector : process
		-- declare and open file with test vectors
		file test_vector_file : text open read_mode is "x:\Vivado\ADC\modules\calibrationTDCAlign\calibrationTDCAlign_tb.csv";

		variable line_buffer                  : line; -- Text line buffer, current line
		variable line_delim_char              : character; -- buffer for the delimitier char -- @suppress "variable line_delim_char is never read"
		variable vector_nr                    : integer := 1; -- Variable used to count the testvectors
		variable var_startConfig_in           : std_logic; -- Internal variable for signal startConfig_in
		variable var_startSetValue_in         : std_logic; -- Internal variable for signal startSetValue_in
		variable var_setValueDelayIn_in       : std_logic_vector(8 downto 0); -- Internal variable for signal setValueDelayIn_in
		variable var_setValueDelayOut_in      : std_logic_vector(8 downto 0); -- Internal variable for signal setValueDelayOut_in
		variable var_fallTransition_in        : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal fallTransition_in
		variable var_riseTransition_in        : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal riseTransition_in
		variable var_delayInStart_out         : std_logic; -- Internal variable for signal delayInStart_out
		variable var_delayInIncDec_out        : std_logic; -- Internal variable for signal delayInIncDec_out
		variable var_delayInReady_in          : std_logic; -- Internal variable for signal delayInReady_in
		variable var_delayInDelayTaps_in      : std_logic_vector(8 downto 0); -- Internal variable for signal delayInDelayTaps_in
		variable var_delayOutStart_out        : std_logic; -- Internal variable for signal delayOutStart_out
		variable var_delayOutIncDec_out       : std_logic; -- Internal variable for signal delayOutIncDec_out
		variable var_delayOutReady_in         : std_logic; -- Internal variable for signal delayOutReady_in
		variable var_delayOutDelayTaps_in     : std_logic_vector(8 downto 0); -- Internal variable for signal delayOutDelayTaps_in
		variable var_delayInDelayTaps_out     : std_logic_vector(8 downto 0); -- Internal variable for signal delayInDelayTaps_out
		variable var_delayOutDelayTaps_out    : std_logic_vector(8 downto 0); -- Internal variable for signal delayOutDelayTaps_out
		variable var_maxLengthCarryChain_in   : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal maxLengthCarryChain_in
		variable var_configurationRunning_out : std_logic; -- Internal variable for signal configurationRunning_out
	begin
		wait until (rising_edge(tb_clk)); -- Wait for the first active clock edge

		-- Loop through the whole file
		while not endfile(test_vector_file) loop -- Read individual lines until the end of the file
			readline(test_vector_file, line_buffer); -- Start reading a new line with stimulus / response pair
			next when line_buffer.all(1) = '-'; -- Jump over comments

			wait for DTS_C;             -- Wait for time point of application stimuli

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_startConfig_in); -- Read input stimuli of signal startConfig_in
			tb_startConfig_in <= var_startConfig_in; -- Interprete stimuli of signal startConfig_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_startSetValue_in); -- Read input stimuli of signal startSetValue_in
			tb_startSetValue_in <= var_startSetValue_in; -- Interprete stimuli of signal startSetValue_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_setValueDelayIn_in); -- Read input stimuli of signal setValueDelayIn_in
			tb_setValueDelayIn_in <= var_setValueDelayIn_in; -- Interprete stimuli of signal setValueDelayIn_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_setValueDelayOut_in); -- Read input stimuli of signal setValueDelayOut_in
			tb_setValueDelayOut_in <= var_setValueDelayOut_in; -- Interprete stimuli of signal setValueDelayOut_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_fallTransition_in); -- Read input stimuli of signal fallTransition_in
			tb_fallTransition_in <= var_fallTransition_in; -- Interprete stimuli of signal fallTransition_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_riseTransition_in); -- Read input stimuli of signal riseTransition_in
			tb_riseTransition_in <= var_riseTransition_in; -- Interprete stimuli of signal riseTransition_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_delayInReady_in); -- Read input stimuli of signal delayInReady_in
			tb_delayInReady_in <= var_delayInReady_in; -- Interprete stimuli of signal delayInReady_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_delayInDelayTaps_in); -- Read input stimuli of signal delayInDelayTaps_in
			tb_delayInDelayTaps_in <= var_delayInDelayTaps_in; -- Interprete stimuli of signal delayInDelayTaps_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_delayOutReady_in); -- Read input stimuli of signal delayOutReady_in
			tb_delayOutReady_in <= var_delayOutReady_in; -- Interprete stimuli of signal delayOutReady_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_delayOutDelayTaps_in); -- Read input stimuli of signal delayOutDelayTaps_in
			tb_delayOutDelayTaps_in <= var_delayOutDelayTaps_in; -- Interprete stimuli of signal delayOutDelayTaps_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_maxLengthCarryChain_in); -- Read input stimuli of signal maxLengthCarryChain_in
			tb_maxLengthCarryChain_in <= var_maxLengthCarryChain_in; -- Interprete stimuli of signal maxLengthCarryChain_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_delayInStart_out); -- Read expected reponse of signal delayInStart_out
			tb_delayInStart_out_exp <= var_delayInStart_out; -- Interprete expected response of signal delayInStart_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_delayInIncDec_out); -- Read expected reponse of signal delayInIncDec_out
			tb_delayInIncDec_out_exp <= var_delayInIncDec_out; -- Interprete expected response of signal delayInIncDec_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_delayOutStart_out); -- Read expected reponse of signal delayOutStart_out
			tb_delayOutStart_out_exp <= var_delayOutStart_out; -- Interprete expected response of signal delayOutStart_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_delayOutIncDec_out); -- Read expected reponse of signal delayOutIncDec_out
			tb_delayOutIncDec_out_exp <= var_delayOutIncDec_out; -- Interprete expected response of signal delayOutIncDec_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_delayInDelayTaps_out); -- Read expected reponse of signal delayInDelayTaps_out
			tb_delayInDelayTaps_out_exp <= var_delayInDelayTaps_out; -- Interprete expected response of signal delayInDelayTaps_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_delayOutDelayTaps_out); -- Read expected reponse of signal delayOutDelayTaps_out
			tb_delayOutDelayTaps_out_exp <= var_delayOutDelayTaps_out; -- Interprete expected response of signal delayOutDelayTaps_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_configurationRunning_out); -- Read expected reponse of signal configurationRunning_out
			tb_configurationRunning_out_exp <= var_configurationRunning_out; -- Interprete expected response of signal configurationRunning_out

			wait for DTR_C;             -- Wait for a valid response

			-- Compare all results with the expected results
			assert (tb_delayInStart_out_exp = tb_delayInStart_out) report "Error with delayInStart_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_delayInIncDec_out_exp = tb_delayInIncDec_out) report "Error with delayInIncDec_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_delayOutStart_out_exp = tb_delayOutStart_out) report "Error with delayOutStart_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_delayOutIncDec_out_exp = tb_delayOutIncDec_out) report "Error with delayOutIncDec_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_delayInDelayTaps_out_exp = tb_delayInDelayTaps_out) report "Error with delayInDelayTaps_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_delayOutDelayTaps_out_exp = tb_delayOutDelayTaps_out) report "Error with delayOutDelayTaps_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_configurationRunning_out_exp = tb_configurationRunning_out) report "Error with configurationRunning_out in test vector " & Integer'image(vector_nr) severity error;

			wait until (rising_edge(tb_clk)); -- Wait for the next active clock edge

			vector_nr := vector_nr + 1; -- Increment the test vector number
		end loop;

		-- Terminate the simulation
		assert false report "Simulation completed" severity failure;

		-- Wait forever
		wait;
	end process apply_testvector;
end tb;
