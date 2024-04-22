----------------------------------------------------------------------------------------------------
-- brief: Testbench for entity inlCorrectionControl
-- file: inlCorrectionControl_tb.vhd
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
entity inlCorrectionControl_tb is
end inlCorrectionControl_tb;

-- Architecture of the Testbench
architecture tb of inlCorrectionControl_tb is
	----------------------------------------------------------------------------------------------------
	-- Components
	----------------------------------------------------------------------------------------------------
	component inlCorrectionControl is
		port(
			start_in               : in  std_logic;
			calculationRunning_out : out std_logic;
			histStart_out          : out std_logic;
			histRunning_in         : in  std_logic;
			dnlStart_out           : out std_logic;
			dnlRunning_in          : in  std_logic;
			inlStart_out           : out std_logic;
			inlRunning_in          : in  std_logic;
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

	----------------------------------------------------------------------------------------------------
	-- Internal signals
	----------------------------------------------------------------------------------------------------
	-- Input signals
	signal tb_start_in       : std_logic; -- Internal signal for input signal start_in
	signal tb_histRunning_in : std_logic; -- Internal signal for input signal histRunning_in
	signal tb_dnlRunning_in  : std_logic; -- Internal signal for input signal dnlRunning_in
	signal tb_inlRunning_in  : std_logic; -- Internal signal for input signal inlRunning_in
	signal tb_clk            : std_logic; -- Internal signal for input signal clk

	-- Output signals
	signal tb_calculationRunning_out : std_logic; -- Internal signal for output signal calculationRunning_out
	signal tb_histStart_out          : std_logic; -- Internal signal for output signal histStart_out
	signal tb_dnlStart_out           : std_logic; -- Internal signal for output signal dnlStart_out
	signal tb_inlStart_out           : std_logic; -- Internal signal for output signal inlStart_out

	-- Expected responses signals
	signal tb_calculationRunning_out_exp : std_logic; -- Expected response for output signal calculationRunning_out
	signal tb_histStart_out_exp          : std_logic; -- Expected response for output signal histStart_out
	signal tb_dnlStart_out_exp           : std_logic; -- Expected response for output signal dnlStart_out
	signal tb_inlStart_out_exp           : std_logic; -- Expected response for output signal inlStart_out

begin
	-- Make a dut and map the ports to the correct signals
	DUT : component inlCorrectionControl
		port map(
			start_in               => tb_start_in,
			calculationRunning_out => tb_calculationRunning_out,
			histStart_out          => tb_histStart_out,
			histRunning_in         => tb_histRunning_in,
			dnlStart_out           => tb_dnlStart_out,
			dnlRunning_in          => tb_dnlRunning_in,
			inlStart_out           => tb_inlStart_out,
			inlRunning_in          => tb_inlRunning_in,
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
		file test_vector_file : text open read_mode is "X:\Vivado\ADC\modules\inlCorrection\inlCorrectionControl_tb.csv";

		variable line_buffer                : line; -- Text line buffer, current line
		variable line_delim_char            : character; -- buffer for the delimitier char -- @suppress "variable line_delim_char is never read"
		variable vector_nr                  : integer := 1; -- Variable used to count the testvectors
		variable error_counter              : integer := 0; -- Variable used to count the number of occured errors
		variable var_start_in               : std_logic; -- Internal variable for signal start_in
		variable var_calculationRunning_out : std_logic; -- Internal variable for signal calculationRunning_out
		variable var_histStart_out          : std_logic; -- Internal variable for signal histStart_out
		variable var_histRunning_in         : std_logic; -- Internal variable for signal histRunning_in
		variable var_dnlStart_out           : std_logic; -- Internal variable for signal dnlStart_out
		variable var_dnlRunning_in          : std_logic; -- Internal variable for signal dnlRunning_in
		variable var_inlStart_out           : std_logic; -- Internal variable for signal inlStart_out
		variable var_inlRunning_in          : std_logic; -- Internal variable for signal inlRunning_in
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
			read(line_buffer, var_histRunning_in); -- Read input stimuli of signal histRunning_in
			tb_histRunning_in <= var_histRunning_in; -- Interprete stimuli of signal histRunning_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_dnlRunning_in); -- Read input stimuli of signal dnlRunning_in
			tb_dnlRunning_in <= var_dnlRunning_in; -- Interprete stimuli of signal dnlRunning_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_inlRunning_in); -- Read input stimuli of signal inlRunning_in
			tb_inlRunning_in <= var_inlRunning_in; -- Interprete stimuli of signal inlRunning_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_calculationRunning_out); -- Read expected reponse of signal calculationRunning_out
			tb_calculationRunning_out_exp <= var_calculationRunning_out; -- Interprete expected response of signal calculationRunning_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_histStart_out); -- Read expected reponse of signal histStart_out
			tb_histStart_out_exp <= var_histStart_out; -- Interprete expected response of signal histStart_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_dnlStart_out); -- Read expected reponse of signal dnlStart_out
			tb_dnlStart_out_exp <= var_dnlStart_out; -- Interprete expected response of signal dnlStart_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_inlStart_out); -- Read expected reponse of signal inlStart_out
			tb_inlStart_out_exp <= var_inlStart_out; -- Interprete expected response of signal inlStart_out

			wait for DTR_C;             -- Wait for a valid response

			-- Compare all results with the expected results
			assert (tb_calculationRunning_out_exp = tb_calculationRunning_out) report "Error with calculationRunning_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_histStart_out_exp = tb_histStart_out) report "Error with histStart_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_dnlStart_out_exp = tb_dnlStart_out) report "Error with dnlStart_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_inlStart_out_exp = tb_inlStart_out) report "Error with inlStart_out in test vector " & Integer'image(vector_nr) severity error;

			-- Increment the error counter
			if (tb_calculationRunning_out_exp /= tb_calculationRunning_out) then
				error_counter := error_counter + 1;
			end if;
			if (tb_histStart_out_exp /= tb_histStart_out) then
				error_counter := error_counter + 1;
			end if;
			if (tb_dnlStart_out_exp /= tb_dnlStart_out) then
				error_counter := error_counter + 1;
			end if;
			if (tb_inlStart_out_exp /= tb_inlStart_out) then
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
