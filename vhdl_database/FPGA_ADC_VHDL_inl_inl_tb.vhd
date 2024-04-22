----------------------------------------------------------------------------------------------------
-- brief: Testbench for entity inl
-- file: inl_tb.vhd
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
entity inl_tb is
end inl_tb;

-- Architecture of the Testbench
architecture tb of inl_tb is
	----------------------------------------------------------------------------------------------------
	-- Components
	----------------------------------------------------------------------------------------------------
	component inl
		generic(
			g_NUM_OF_BITS_FOR_MAX_ELEMS : integer;
			g_NO_OF_SAMPLES_HIST        : integer;
			g_NO_OF_FRACTIONAL          : integer
		);
		port(
			start_in               : in  std_logic;
			dnlAddr_out            : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			dnlData_in             : in  std_logic_vector(g_NO_OF_SAMPLES_HIST + g_NO_OF_FRACTIONAL downto 0);
			inlAddr_in             : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			inlData_out            : out std_logic_vector(g_NO_OF_SAMPLES_HIST downto 0);
			inlClk_in              : in  std_logic;
			minLengthCarryChain_in : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			maxLengthCarryChain_in : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			inlRunning_out         : out std_logic;
			clk                    : in  std_logic
		);
	end component inl;

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
	signal tb_dnlData_in             : std_logic_vector(G_NO_OF_SAMPLES_HIST + G_NO_OF_FRACTIONAL downto 0); -- Internal signal for input signal dnlData_in
	signal tb_inlAddr_in             : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal inlAddr_in
	signal tb_minLengthCarryChain_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal minLengthCarryChain_in
	signal tb_maxLengthCarryChain_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal maxLengthCarryChain_in
	signal tb_clk                    : std_logic; -- Internal signal for input signal clk

	-- Output signals
	signal tb_dnlAddr_out    : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for output signal dnlAddr_out
	signal tb_inlData_out    : std_logic_vector(G_NO_OF_SAMPLES_HIST downto 0); -- Internal signal for output signal inlData_out
	signal tb_inlRunning_out : std_logic; -- Internal signal for output signal inlRunning_out

	-- Expected responses signals
	signal tb_dnlAddr_out_exp    : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Expected response for output signal dnlAddr_out
	signal tb_inlData_out_exp    : std_logic_vector(G_NO_OF_SAMPLES_HIST downto 0); -- Expected response for output signal inlData_out
	signal tb_inlRunning_out_exp : std_logic; -- Expected response for output signal inlRunning_out

begin
	-- Make a dut and map the ports to the correct signals
	DUT : component inl
		generic map(
			g_NUM_OF_BITS_FOR_MAX_ELEMS => G_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SAMPLES_HIST        => G_NO_OF_SAMPLES_HIST,
			g_NO_OF_FRACTIONAL          => G_NO_OF_FRACTIONAL
		)
		port map(
			start_in               => tb_start_in,
			dnlAddr_out            => tb_dnlAddr_out,
			dnlData_in             => tb_dnlData_in,
			inlAddr_in             => tb_inlAddr_in,
			inlData_out            => tb_inlData_out,
			inlClk_in              => tb_clk,
			minLengthCarryChain_in => tb_minLengthCarryChain_in,
			maxLengthCarryChain_in => tb_maxLengthCarryChain_in,
			inlRunning_out         => tb_inlRunning_out,
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
		file test_vector_file : text open read_mode is "x:\Vivado\ADC\modules\inl\inl_tb.csv";

		variable line_buffer                : line; -- Text line buffer, current line
		variable line_delim_char            : character; -- buffer for the delimitier char -- @suppress "variable line_delim_char is never read"
		variable vector_nr                  : integer := 1; -- Variable used to count the testvectors
		variable error_counter              : integer := 0; -- Variable used to count the number of occured errors
		variable var_start_in               : std_logic; -- Internal variable for signal start_in
		variable var_dnlAddr_out            : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal dnlAddr_out
		variable var_dnlData_in             : std_logic_vector(G_NO_OF_SAMPLES_HIST + G_NO_OF_FRACTIONAL downto 0); -- Internal variable for signal dnlData_in
		variable var_inlAddr_in             : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal inlAddr_in
		variable var_inlData_out            : std_logic_vector(G_NO_OF_SAMPLES_HIST downto 0); -- Internal variable for signal inlData_out
		variable var_minLengthCarryChain_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal minLengthCarryChain_in
		variable var_maxLengthCarryChain_in : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal maxLengthCarryChain_in
		variable var_inlRunning_out         : std_logic; -- Internal variable for signal inlRunning_out
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
			read(line_buffer, var_dnlData_in); -- Read input stimuli of signal dnlData_in
			tb_dnlData_in <= var_dnlData_in; -- Interprete stimuli of signal dnlData_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_inlAddr_in); -- Read input stimuli of signal inlAddr_in
			tb_inlAddr_in <= var_inlAddr_in; -- Interprete stimuli of signal inlAddr_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_minLengthCarryChain_in); -- Read input stimuli of signal minLengthCarryChain_in
			tb_minLengthCarryChain_in <= var_minLengthCarryChain_in; -- Interprete stimuli of signal minLengthCarryChain_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_maxLengthCarryChain_in); -- Read input stimuli of signal maxLengthCarryChain_in
			tb_maxLengthCarryChain_in <= var_maxLengthCarryChain_in; -- Interprete stimuli of signal maxLengthCarryChain_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_dnlAddr_out); -- Read expected reponse of signal dnlAddr_out
			tb_dnlAddr_out_exp <= var_dnlAddr_out; -- Interprete expected response of signal dnlAddr_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_inlData_out); -- Read expected reponse of signal inlData_out
			tb_inlData_out_exp <= var_inlData_out; -- Interprete expected response of signal inlData_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_inlRunning_out); -- Read expected reponse of signal inlRunning_out
			tb_inlRunning_out_exp <= var_inlRunning_out; -- Interprete expected response of signal inlRunning_out

			wait for DTR_C;             -- Wait for a valid response

			-- Compare all results with the expected results
			assert (tb_dnlAddr_out_exp = tb_dnlAddr_out) report "Error with dnlAddr_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_inlData_out_exp = tb_inlData_out) report "Error with inlData_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_inlRunning_out_exp = tb_inlRunning_out) report "Error with inlRunning_out in test vector " & Integer'image(vector_nr) severity error;

			-- Increment the error counter
			if (tb_dnlAddr_out_exp /= tb_dnlAddr_out) then
				error_counter := error_counter + 1;
			end if;
			if (tb_inlData_out_exp /= tb_inlData_out) then
				error_counter := error_counter + 1;
			end if;
			if (tb_inlRunning_out_exp /= tb_inlRunning_out) then
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
