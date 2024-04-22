----------------------------------------------------------------------------------------------------
-- brief: Testbench for entity histogram
-- file: histogram_tb.vhd
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
entity histogram_tb is
end histogram_tb;

-- Architecture of the Testbench
architecture tb of histogram_tb is
	----------------------------------------------------------------------------------------------------
	-- Components
	----------------------------------------------------------------------------------------------------
	component histogram
		generic(
			g_NUM_OF_BITS_FOR_MAX_ELEMS : integer;
			g_NO_OF_SAMPLES_HIST        : integer
		);
		port(
			start_in             : in  std_logic;
			transition_in        : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			dataValid_in         : in  std_logic;
			histAddr_in          : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			histClk_in           : in  std_logic;
			histData_out         : out std_logic_vector(g_NO_OF_SAMPLES_HIST - 1 downto 0);
			histogramRunning_out : out std_logic;
			clk                  : in  std_logic
		);
	end component histogram;

	----------------------------------------------------------------------------------------------------
	-- Internal constants
	----------------------------------------------------------------------------------------------------
	constant F_CLK_C : real := 100.0E6; -- Define the frequency of the clock
	constant T_CLK_C : time := (1.0 sec) / F_CLK_C; -- Calculate the period of a clockcycle
	constant DTS_C   : time := 2 ns;    -- Wait time before applying the stimulus 
	constant DTR_C   : time := 6 ns;    -- Wait time before reading response

	constant G_NUM_OF_BITS_FOR_MAX_ELEMS : integer := 4; -- Constant for the generic g_NUM_OF_BITS_FOR_MAX_ELEMS
	constant G_NO_OF_SAMPLES_HIST        : integer := 4; -- Constant for the generic g_NO_OF_SAMPLES_HIST

	----------------------------------------------------------------------------------------------------
	-- Internal signals
	----------------------------------------------------------------------------------------------------
	-- Input signals
	signal tb_start_in      : std_logic; -- Internal signal for input signal start_in
	signal tb_dataValid_in  : std_logic; -- Internal signal for input signal dataValid_in
	signal tb_transition_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal transition_in
	signal tb_histAddr_in   : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal histAddr_in
	signal tb_clk           : std_logic; -- Internal signal for input signal clk

	-- Output signals
	signal tb_histData_out         : std_logic_vector(G_NO_OF_SAMPLES_HIST - 1 downto 0); -- Internal signal for output signal histData_out
	signal tb_histogramRunning_out : std_logic; -- Internal signal for output signal histogramRunning_out

	-- Expected responses signals
	signal tb_histData_out_exp         : std_logic_vector(G_NO_OF_SAMPLES_HIST - 1 downto 0); -- Expected response for output signal histData_out
	signal tb_histogramRunning_out_exp : std_logic; -- Expected response for output signal histogramRunning_out

begin
	-- Make a dut and map the ports to the correct signals
	DUT : component histogram
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => G_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => G_NO_OF_SAMPLES_HIST
		)
		port map(
			start_in             => tb_start_in,
			transition_in        => tb_transition_in,
			dataValid_in         => tb_dataValid_in,
			histAddr_in          => tb_histAddr_in,
			histClk_in           => tb_clk,
			histData_out         => tb_histData_out,
			histogramRunning_out => tb_histogramRunning_out,
			clk                  => tb_clk
		);

	-- Apply a clock to the DUT
	stimuli_clk : process
	begin
		tb_clk <= '0';
		loop
			wait for (T_CLK_C / 2.0);
			tb_clk <= not tb_clk;
		end loop;
		wait;
	end process;

	-- Apply the testvectors to the DUT
	apply_testvector : process
		-- declare and open file with test vectors
		file test_vector_file : text open read_mode is "x:\Vivado\ADC\modules\histogram\histogram_tb.csv";

		variable line_buffer              : line; -- Text line buffer, current line
		variable line_delim_char          : character; -- buffer for the delimitier char -- @suppress "variable line_delim_char is never read"
		variable vector_nr                : integer := 1; -- Variable used to count the testvectors
		variable var_start_in             : std_logic; -- Internal variable for signal start_in
		variable var_dataValid_in         : std_logic; -- Internal variable for signal dataValid_in
		variable var_transition_in        : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal transition_in
		variable var_histAddr_in          : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal histAddr_in
		variable var_histData_out         : std_logic_vector(G_NO_OF_SAMPLES_HIST - 1 downto 0); -- Internal variable for signal histData_out
		variable var_histogramRunning_out : std_logic; -- Internal variable for signal histogramRunning_out
	begin
		wait until (rising_edge(tb_clk)); -- Wait for the first active clock edge

		-- Loop through the whole file
		while not endfile(test_vector_file) loop -- Read individual lines until the end of the file
			readline(test_vector_file, line_buffer); -- Start reading a new line with stimulus / response pair
			next when line_buffer.all(1) = '-'; -- Jump over comments

			wait for DTS_C;             -- Wait for time point of application stimuli

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_start_in); -- Read input stimuli of signal start_in
			tb_start_in <= var_start_in; -- Interprete stimuli of signal start_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_dataValid_in); -- Read input stimuli of signal dataValid_in
			tb_dataValid_in <= var_dataValid_in; -- Interprete stimuli of signal dataValid_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_transition_in); -- Read input stimuli of signal transition_in
			tb_transition_in <= var_transition_in; -- Interprete stimuli of signal transition_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_histAddr_in); -- Read input stimuli of signal histAddr_in
			tb_histAddr_in <= var_histAddr_in; -- Interprete stimuli of signal histAddr_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_histData_out); -- Read expected reponse of signal histData_out
			tb_histData_out_exp <= var_histData_out; -- Interprete expected response of signal histData_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_histogramRunning_out); -- Read expected reponse of signal histogramRunning_out
			tb_histogramRunning_out_exp <= var_histogramRunning_out; -- Interprete expected response of signal histogramRunning_out

			wait for DTR_C;             -- Wait for a valid response

			-- Compare all results with the expected results
			assert (tb_histData_out_exp = tb_histData_out) report "Error with histData_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_histogramRunning_out_exp = tb_histogramRunning_out) report "Error with histogramRunning_out in test vector " & Integer'image(vector_nr) severity error;

			wait until (rising_edge(tb_clk)); -- Wait for the next active clock edge

			vector_nr := vector_nr + 1; -- Increment the test vector number
		end loop;

		-- Terminate the simulation
		assert false report "Simulation completed" severity failure;

		-- Wait forever
		wait;
	end process apply_testvector;
end tb;
