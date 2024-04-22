----------------------------------------------------------------------------------------------------
-- brief: Testbench for entity dnl
-- file: dnl_tb.vhd
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
entity dnl_tb is
end dnl_tb;

-- Architecture of the Testbench
architecture tb of dnl_tb is
	----------------------------------------------------------------------------------------------------
	-- Components
	----------------------------------------------------------------------------------------------------
	component dnl
		generic(
			g_NUM_OF_BITS_FOR_MAX_ELEMS : integer;
			g_NO_OF_SAMPLES_HIST        : integer;
			g_NO_OF_FRACTIONAL          : integer
		);
		port(
			start_in               : in  std_logic;
			histAddr_out           : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			histData_in            : in  std_logic_vector(g_NO_OF_SAMPLES_HIST - 1 downto 0);
			dnlAddr_in             : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			dnlData_out            : out std_logic_vector(g_NO_OF_SAMPLES_HIST + g_NO_OF_FRACTIONAL downto 0);
			minLengthCarryChain_in : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			maxLengthCarryChain_in : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			dnlRunning_out         : out std_logic;
			clk                    : in  std_logic
		);
	end component dnl;

	----------------------------------------------------------------------------------------------------
	-- Internal constants
	----------------------------------------------------------------------------------------------------
	constant F_CLK_C : real := 100.0E6; -- Define the frequency of the clock
	constant T_CLK_C : time := (1.0 sec) / F_CLK_C; -- Calculate the period of a clockcycle
	constant DTS_C   : time := 2 ns;    -- Wait time before applying the stimulus 
	constant DTR_C   : time := 6 ns;    -- Wait time before reading response

	constant G_NUM_OF_BITS_FOR_MAX_ELEMS : integer := 3; -- Constant for the generic g_NUM_OF_BITS_FOR_MAX_ELEMS
	constant G_NO_OF_SAMPLES_HIST        : integer := 3; -- Constant for the generic g_NO_OF_SAMPLES_HIST
	constant G_NO_OF_FRACTIONAL          : integer := 3; -- Constant for the generic g_NO_OF_FRACTIONAL

	----------------------------------------------------------------------------------------------------
	-- Internal signals
	----------------------------------------------------------------------------------------------------
	-- Input signals
	signal tb_start_in               : std_logic; -- Internal signal for input signal start_in
	signal tb_histData_in            : std_logic_vector(G_NO_OF_SAMPLES_HIST - 1 downto 0); -- Internal signal for input signal histData_in
	signal tb_dnlAddr_in             : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal dnlAddr_in
	signal tb_minLengthCarryChain_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal minLengthCarryChain_in
	signal tb_maxLengthCarryChain_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal maxLengthCarryChain_in
	signal tb_clk                    : std_logic; -- Internal signal for input signal clk

	-- Output signals
	signal tb_histAddr_out   : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for output signal histAddr_out
	signal tb_dnlData_out    : std_logic_vector(G_NO_OF_SAMPLES_HIST + G_NO_OF_FRACTIONAL downto 0); -- Internal signal for output signal dnlData_out
	signal tb_dnlRunning_out : std_logic; -- Internal signal for output signal dnlRunning_out

	-- Expected responses signals
	signal tb_histAddr_out_exp   : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Expected response for output signal histAddr_out
	signal tb_dnlData_out_exp    : std_logic_vector(G_NO_OF_SAMPLES_HIST + G_NO_OF_FRACTIONAL downto 0); -- Expected response for output signal dnlData_out
	signal tb_dnlRunning_out_exp : std_logic; -- Expected response for output signal dnlRunning_out

begin
	-- Make a dut and map the ports to the correct signals
	DUT : component dnl
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => G_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => G_NO_OF_SAMPLES_HIST,
			g_NO_OF_FRACTIONAL          => G_NO_OF_FRACTIONAL
		)
		port map(
			start_in               => tb_start_in,
			histAddr_out           => tb_histAddr_out,
			histData_in            => tb_histData_in,
			dnlAddr_in             => tb_dnlAddr_in,
			dnlData_out            => tb_dnlData_out,
			minLengthCarryChain_in => tb_minLengthCarryChain_in,
			maxLengthCarryChain_in => tb_maxLengthCarryChain_in,
			dnlRunning_out         => tb_dnlRunning_out,
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
		file test_vector_file : text open read_mode is "x:\Vivado\ADC\modules\dnl\dnl_tb.csv";

		variable line_buffer                : line; -- Text line buffer, current line
		variable line_delim_char            : character; -- buffer for the delimitier char -- @suppress "variable line_delim_char is never read"
		variable vector_nr                  : integer := 1; -- Variable used to count the testvectors
		variable error_counter              : integer := 0; -- Variable used to count the number of occured errors
		variable var_start_in               : std_logic; -- Internal variable for signal start_in
		variable var_histAddr_out           : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal histAddr_out
		variable var_histData_in            : std_logic_vector(G_NO_OF_SAMPLES_HIST - 1 downto 0); -- Internal variable for signal histData_in
		variable var_dnlAddr_in             : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal dnlAddr_in
		variable var_dnlData_out            : std_logic_vector(G_NO_OF_SAMPLES_HIST + G_NO_OF_FRACTIONAL downto 0); -- Internal variable for signal dnlData_out
		variable var_minLengthCarryChain_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal minLengthCarryChain_in
		variable var_maxLengthCarryChain_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal maxLengthCarryChain_in
		variable var_dnlRunning_out         : std_logic; -- Internal variable for signal dnlRunning_out
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
			read(line_buffer, var_histData_in); -- Read input stimuli of signal histData_in
			tb_histData_in <= var_histData_in; -- Interprete stimuli of signal histData_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_dnlAddr_in); -- Read input stimuli of signal dnlAddr_in
			tb_dnlAddr_in <= var_dnlAddr_in; -- Interprete stimuli of signal dnlAddr_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_minLengthCarryChain_in); -- Read input stimuli of signal minLengthCarryChain_in
			tb_minLengthCarryChain_in <= var_minLengthCarryChain_in; -- Interprete stimuli of signal minLengthCarryChain_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_maxLengthCarryChain_in); -- Read input stimuli of signal maxLengthCarryChain_in
			tb_maxLengthCarryChain_in <= var_maxLengthCarryChain_in; -- Interprete stimuli of signal maxLengthCarryChain_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_histAddr_out); -- Read expected reponse of signal histAddr_out
			tb_histAddr_out_exp <= var_histAddr_out; -- Interprete expected response of signal histAddr_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_dnlData_out); -- Read expected reponse of signal dnlData_out
			tb_dnlData_out_exp <= var_dnlData_out; -- Interprete expected response of signal dnlData_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_dnlRunning_out); -- Read expected reponse of signal dnlRunning_out
			tb_dnlRunning_out_exp <= var_dnlRunning_out; -- Interprete expected response of signal dnlRunning_out

			wait for DTR_C;             -- Wait for a valid response

			-- Compare all results with the expected results
			assert (tb_histAddr_out_exp = tb_histAddr_out) report "Error with histAddr_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_dnlData_out_exp = tb_dnlData_out) report "Error with dnlData_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_dnlRunning_out_exp = tb_dnlRunning_out) report "Error with dnlRunning_out in test vector " & Integer'image(vector_nr) severity error;

			-- Increment the error counter
			if (tb_histAddr_out_exp /= tb_histAddr_out) then
				error_counter := error_counter + 1;
			end if;
			if (tb_dnlData_out_exp /= tb_dnlData_out) then
				error_counter := error_counter + 1;
			end if;
			if (tb_dnlRunning_out_exp /= tb_dnlRunning_out) then
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
