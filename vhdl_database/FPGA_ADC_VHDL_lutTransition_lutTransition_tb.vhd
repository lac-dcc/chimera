----------------------------------------------------------------------------------------------------
-- brief: Testbench for entity lutTransition
-- file: lutTransition_tb.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 12.05.2020 | L. Leuenberger     | Auto-Created
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
entity lutTransition_tb is
end lutTransition_tb;

-- Architecture of the Testbench
architecture tb of lutTransition_tb is
	----------------------------------------------------------------------------------------------------
	-- Components
	----------------------------------------------------------------------------------------------------
	component lutTransition is
		generic(
			g_NUM_OF_ELEMS              : integer;
			g_NUM_OF_BITS_FOR_MAX_ELEMS : integer
		);
		port(
			fallTransition_in           : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			riseTransition_in           : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			correctedTransitionMean_out : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);
			correctedTransition1_out    : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);
			correctedTransition2_out    : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);
			fallWrEn_in                 : in  std_logic;
			fallData_in                 : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);
			fallAddr_in                 : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			riseWrEn_in                 : in  std_logic;
			riseData_in                 : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS downto 0);
			riseAddr_in                 : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			clk                         : in  std_logic;
			clkSlow                     : in  std_logic
		);
	end component;

	----------------------------------------------------------------------------------------------------
	-- Internal constants
	----------------------------------------------------------------------------------------------------
	constant F_CLK_C : real := 100.0E6; -- Define the frequency of the clock
	constant T_CLK_C : time := (1.0 sec) / F_CLK_C; -- Calculate the period of a clockcycle
	constant DTS_C   : time := 2 ns;    -- Wait time before applying the stimulus 
	constant DTR_C   : time := 6 ns;    -- Wait time before reading response

	constant G_NUM_OF_ELEMS              : integer := 4; -- Constant for the generic g_NUM_OF_ELEMS
	constant G_NUM_OF_BITS_FOR_MAX_ELEMS : integer := 3; -- Constant for the generic g_NUM_OF_BITS_FOR_MAX_ELEMS

	----------------------------------------------------------------------------------------------------
	-- Internal signals
	----------------------------------------------------------------------------------------------------
	-- Input signals
	signal tb_fallTransition_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal fallTransition_in
	signal tb_riseTransition_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal riseTransition_in
	signal tb_fallWrEn_in       : std_logic; -- Internal signal for input signal fallWrEn_in
	signal tb_fallData_in       : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Internal signal for input signal fallData_in
	signal tb_fallAddr_in       : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal fallAddr_in
	signal tb_riseWrEn_in       : std_logic; -- Internal signal for input signal riseWrEn_in
	signal tb_riseData_in       : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Internal signal for input signal riseData_in
	signal tb_riseAddr_in       : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal riseAddr_in
	signal tb_clk               : std_logic; -- Internal signal for input signal clk
	signal tb_clkSlow           : std_logic; -- Internal signal for input signal clkSlow

	-- Output signals
	signal tb_correctedTransitionMean_out : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Internal signal for output signal correctedTransitionMean_out
	signal tb_correctedTransition1_out    : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Internal signal for output signal correctedTransition1_out
	signal tb_correctedTransition2_out    : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Internal signal for output signal correctedTransition2_out

	-- Expected responses signals
	signal tb_correctedTransitionMean_out_exp : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Expected response for output signal correctedTransitionMean_out
	signal tb_correctedTransition1_out_exp    : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Expected response for output signal correctedTransition1_out
	signal tb_correctedTransition2_out_exp    : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Expected response for output signal correctedTransition2_out

begin
	-- Make a dut and map the ports to the correct signals
	DUT : component lutTransition
		generic map(
			g_NUM_OF_ELEMS              => G_NUM_OF_ELEMS,
			g_NUM_OF_BITS_FOR_MAX_ELEMS => G_NUM_OF_BITS_FOR_MAX_ELEMS
		)
		port map(
			fallTransition_in           => tb_fallTransition_in,
			riseTransition_in           => tb_riseTransition_in,
			correctedTransitionMean_out => tb_correctedTransitionMean_out,
			correctedTransition1_out    => tb_correctedTransition1_out,
			correctedTransition2_out    => tb_correctedTransition2_out,
			fallWrEn_in                 => tb_fallWrEn_in,
			fallData_in                 => tb_fallData_in,
			fallAddr_in                 => tb_fallAddr_in,
			riseWrEn_in                 => tb_riseWrEn_in,
			riseData_in                 => tb_riseData_in,
			riseAddr_in                 => tb_riseAddr_in,
			clk                         => tb_clk,
			clkSlow                     => tb_clkSlow
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
		file test_vector_file : text open read_mode is "x:\Vivado\ADC\modules\lutTransition\lutTransition_tb.csv";

		variable line_buffer                     : line; -- Text line buffer, current line
		variable line_delim_char                 : character; -- buffer for the delimitier char -- @suppress "variable line_delim_char is never read"
		variable vector_nr                       : integer := 1; -- Variable used to count the testvectors
		variable error_counter                   : integer := 0; -- Variable used to count the number of occured errors
		variable var_fallTransition_in           : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal fallTransition_in
		variable var_riseTransition_in           : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal riseTransition_in
		variable var_correctedTransitionMean_out : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Internal variable for signal correctedTransitionMean_out
		variable var_correctedTransition1_out    : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Internal variable for signal correctedTransition1_out
		variable var_correctedTransition2_out    : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Internal variable for signal correctedTransition2_out
		variable var_fallWrEn_in                 : std_logic; -- Internal variable for signal fallWrEn_in
		variable var_fallData_in                 : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Internal variable for signal fallData_in
		variable var_fallAddr_in                 : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal fallAddr_in
		variable var_riseWrEn_in                 : std_logic; -- Internal variable for signal riseWrEn_in
		variable var_riseData_in                 : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS downto 0); -- Internal variable for signal riseData_in
		variable var_riseAddr_in                 : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal riseAddr_in
	begin
		wait until (rising_edge(tb_clk)); -- Wait for the first active clock edge

		-- Loop through the whole file
		while not endfile(test_vector_file) loop -- Read individual lines until the end of the file
			readline(test_vector_file, line_buffer); -- Start reading a new line with stimulus / response pair
			next when line_buffer.all(1) = '-'; -- Jump over comments

			wait for DTS_C;             -- Wait for time point of application stimuli

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_fallTransition_in); -- Read input stimuli of signal fallTransition_in
			tb_fallTransition_in <= var_fallTransition_in; -- Interprete stimuli of signal fallTransition_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_riseTransition_in); -- Read input stimuli of signal riseTransition_in
			tb_riseTransition_in <= var_riseTransition_in; -- Interprete stimuli of signal riseTransition_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_fallWrEn_in); -- Read input stimuli of signal fallWrEn_in
			tb_fallWrEn_in <= var_fallWrEn_in; -- Interprete stimuli of signal fallWrEn_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_fallData_in); -- Read input stimuli of signal fallData_in
			tb_fallData_in <= var_fallData_in; -- Interprete stimuli of signal fallData_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_fallAddr_in); -- Read input stimuli of signal fallAddr_in
			tb_fallAddr_in <= var_fallAddr_in; -- Interprete stimuli of signal fallAddr_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_riseWrEn_in); -- Read input stimuli of signal riseWrEn_in
			tb_riseWrEn_in <= var_riseWrEn_in; -- Interprete stimuli of signal riseWrEn_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_riseData_in); -- Read input stimuli of signal riseData_in
			tb_riseData_in <= var_riseData_in; -- Interprete stimuli of signal riseData_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_riseAddr_in); -- Read input stimuli of signal riseAddr_in
			tb_riseAddr_in <= var_riseAddr_in; -- Interprete stimuli of signal riseAddr_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_correctedTransitionMean_out); -- Read expected reponse of signal correctedTransitionMean_out
			tb_correctedTransitionMean_out_exp <= var_correctedTransitionMean_out; -- Interprete expected response of signal correctedTransitionMean_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_correctedTransition1_out); -- Read expected reponse of signal correctedTransition1_out
			tb_correctedTransition1_out_exp <= var_correctedTransition1_out; -- Interprete expected response of signal correctedTransition1_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_correctedTransition2_out); -- Read expected reponse of signal correctedTransition2_out
			tb_correctedTransition2_out_exp <= var_correctedTransition2_out; -- Interprete expected response of signal correctedTransition2_out

			wait for DTR_C;             -- Wait for a valid response

			-- Compare all results with the expected results
			assert (tb_correctedTransitionMean_out_exp = tb_correctedTransitionMean_out) report "Error with correctedTransitionMean_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_correctedTransition1_out_exp = tb_correctedTransition1_out) report "Error with correctedTransition1_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_correctedTransition2_out_exp = tb_correctedTransition2_out) report "Error with correctedTransition2_out in test vector " & Integer'image(vector_nr) severity error;

			-- Increment the error counter
			if (tb_correctedTransitionMean_out_exp /= tb_correctedTransitionMean_out) then
				error_counter := error_counter + 1;
			end if;
			if (tb_correctedTransition1_out_exp /= tb_correctedTransition1_out) then
				error_counter := error_counter + 1;
			end if;
			if (tb_correctedTransition2_out_exp /= tb_correctedTransition2_out) then
				error_counter := error_counter + 1;
			end if;

			wait until (rising_edge(tb_clk)); -- Wait for the next active clock edge

			vector_nr := vector_nr + 1; -- Increment the test vector number
		end loop;

		-- Terminate the simulation
		assert false report "Simulation completed with " & Integer'image(error_counter) & " errors." severity failure;

		-- Wait forever
		wait;
	end process apply_testvector;
end tb;
