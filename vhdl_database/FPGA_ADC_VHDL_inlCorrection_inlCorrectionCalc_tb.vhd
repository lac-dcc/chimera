----------------------------------------------------------------------------------------------------
-- brief: Testbench for entity inlCorrectionCalc
-- file: inlCorrectionCalc_tb.vhd
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
entity inlCorrectionCalc_tb is
end inlCorrectionCalc_tb;

-- Architecture of the Testbench
architecture tb of inlCorrectionCalc_tb is
	----------------------------------------------------------------------------------------------------
	-- Components
	----------------------------------------------------------------------------------------------------
	component inlCorrectionCalc is
		generic(
			g_NUM_OF_BITS_FOR_MAX_ELEMS : integer;
			g_NO_OF_SAMPLES_HIST        : integer
		);
		port(
			inlAddr_out            : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			inlData_in             : in  std_logic_vector(g_NO_OF_SAMPLES_HIST downto 0);
			minLengthCarryChain_in : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			maxLengthCarryChain_in : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			transition_in          : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			transition_out         : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			dataValid_in           : in  std_logic;
			dataValid_out          : out std_logic;
			clk                    : in  std_logic
		);
	end component;

	----------------------------------------------------------------------------------------------------
	-- Internal constants
	----------------------------------------------------------------------------------------------------
	constant F_CLK_C : real := 100.0E6; -- Define the frequency of the clock
	constant T_CLK_C : time := (1.0 sec) / F_CLK_C; -- Calculate the period of a clockcycle
	constant DTS_C   : time := 2 ns;    -- Wait time before applying the stimulus 
	constant DTR_C   : time := 6 ns;    -- Wait time before reading response

	constant G_NUM_OF_BITS_FOR_MAX_ELEMS : integer := 3; -- Constant for the generic g_NUM_OF_BITS_FOR_MAX_ELEMS
	constant G_NO_OF_SAMPLES_HIST        : integer := 3; -- Constant for the generic g_NO_OF_SAMPLES_HIST

	----------------------------------------------------------------------------------------------------
	-- Internal signals
	----------------------------------------------------------------------------------------------------
	-- Input signals
	signal tb_inlData_in             : std_logic_vector(G_NO_OF_SAMPLES_HIST downto 0); -- Internal signal for input signal inlData_in
	signal tb_minLengthCarryChain_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal minLengthCarryChain_in
	signal tb_maxLengthCarryChain_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal maxLengthCarryChain_in
	signal tb_transition_in          : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal transition_in
	signal tb_dataValid_in           : std_logic; -- Internal signal for input signal dataValid_in
	signal tb_clk                    : std_logic; -- Internal signal for input signal clk

	-- Output signals
	signal tb_inlAddr_out    : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for output signal inlAddr_out
	signal tb_transition_out : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for output signal transition_out
	signal tb_dataValid_out  : std_logic; -- Internal signal for output signal dataValid_out

	-- Expected responses signals
	signal tb_inlAddr_out_exp    : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Expected response for output signal inlAddr_out
	signal tb_transition_out_exp : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Expected response for output signal transition_out
	signal tb_dataValid_out_exp  : std_logic; -- Expected response for output signal dataValid_out

begin
	-- Make a dut and map the ports to the correct signals
	DUT : component inlCorrectionCalc
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => G_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => G_NO_OF_SAMPLES_HIST
		)
		port map(
			inlAddr_out            => tb_inlAddr_out,
			inlData_in             => tb_inlData_in,
			minLengthCarryChain_in => tb_minLengthCarryChain_in,
			maxLengthCarryChain_in => tb_maxLengthCarryChain_in,
			transition_in          => tb_transition_in,
			transition_out         => tb_transition_out,
			dataValid_in           => tb_dataValid_in,
			dataValid_out          => tb_dataValid_out,
			clk                    => tb_clk
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
		file test_vector_file : text open read_mode is "x:\Vivado\ADC\modules\inlCorrection\inlCorrectionCalc_tb.csv";

		variable line_buffer                : line; -- Text line buffer, current line
		variable line_delim_char            : character; -- buffer for the delimitier char -- @suppress "variable line_delim_char is never read"
		variable vector_nr                  : integer := 1; -- Variable used to count the testvectors
		variable error_counter              : integer := 0; -- Variable used to count the number of occured errors
		variable var_inlAddr_out            : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal inlAddr_out
		variable var_inlData_in             : std_logic_vector(G_NO_OF_SAMPLES_HIST downto 0); -- Internal variable for signal inlData_in
		variable var_minLengthCarryChain_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal minLengthCarryChain_in
		variable var_maxLengthCarryChain_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal maxLengthCarryChain_in
		variable var_transition_in          : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal transition_in
		variable var_transition_out         : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal transition_out
		variable var_dataValid_in           : std_logic; -- Internal variable for signal dataValid_in
		variable var_dataValid_out          : std_logic; -- Internal variable for signal dataValid_out
	begin
		wait until (rising_edge(tb_clk)); -- Wait for the first active clock edge

		-- Loop through the whole file
		while not endfile(test_vector_file) loop -- Read individual lines until the end of the file
			readline(test_vector_file, line_buffer); -- Start reading a new line with stimulus / response pair
			next when line_buffer.all(1) = '-'; -- Jump over comments

			wait for DTS_C;             -- Wait for time point of application stimuli

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_inlData_in); -- Read input stimuli of signal inlData_in
			tb_inlData_in <= var_inlData_in; -- Interprete stimuli of signal inlData_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_minLengthCarryChain_in); -- Read input stimuli of signal minLengthCarryChain_in
			tb_minLengthCarryChain_in <= var_minLengthCarryChain_in; -- Interprete stimuli of signal minLengthCarryChain_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_maxLengthCarryChain_in); -- Read input stimuli of signal maxLengthCarryChain_in
			tb_maxLengthCarryChain_in <= var_maxLengthCarryChain_in; -- Interprete stimuli of signal maxLengthCarryChain_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_transition_in); -- Read input stimuli of signal transition_in
			tb_transition_in <= var_transition_in; -- Interprete stimuli of signal transition_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_dataValid_in); -- Read input stimuli of signal dataValid_in
			tb_dataValid_in <= var_dataValid_in; -- Interprete stimuli of signal dataValid_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_inlAddr_out); -- Read expected reponse of signal inlAddr_out
			tb_inlAddr_out_exp <= var_inlAddr_out; -- Interprete expected response of signal inlAddr_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_transition_out); -- Read expected reponse of signal transition_out
			tb_transition_out_exp <= var_transition_out; -- Interprete expected response of signal transition_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_dataValid_out); -- Read expected reponse of signal dataValid_out
			tb_dataValid_out_exp <= var_dataValid_out; -- Interprete expected response of signal dataValid_out

			wait for DTR_C;             -- Wait for a valid response

			-- Compare all results with the expected results
			assert (tb_inlAddr_out_exp = tb_inlAddr_out) report "Error with inlAddr_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_transition_out_exp = tb_transition_out) report "Error with transition_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_dataValid_out_exp = tb_dataValid_out) report "Error with dataValid_out in test vector " & Integer'image(vector_nr) severity error;

			-- Increment the error counter
			if (tb_inlAddr_out_exp /= tb_inlAddr_out) then
				error_counter := error_counter + 1;
			end if;
			if (tb_transition_out_exp /= tb_transition_out) then
				error_counter := error_counter + 1;
			end if;
			if (tb_dataValid_out_exp /= tb_dataValid_out) then
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
