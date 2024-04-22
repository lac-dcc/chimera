----------------------------------------------------------------------------------------------------
-- brief: Testbench for entity calcMean
-- file: calcMean_tb.vhd
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
entity calcMean_tb is
end calcMean_tb;

-- Architecture of the Testbench
architecture tb of calcMean_tb is
	----------------------------------------------------------------------------------------------------
	-- Components
	----------------------------------------------------------------------------------------------------
	component calcMean
		generic(
			g_DATA_WIDTH    : integer range 1 to 64;
			g_NO_OF_SAMPLES : integer range 1 to 64
		);
		port(
			data_in  : in  std_logic_vector(g_DATA_WIDTH - 1 downto 0);
			data_out : out std_logic_vector(g_DATA_WIDTH - 1 downto 0);
			clk      : in  std_logic
		);
	end component calcMean;

	----------------------------------------------------------------------------------------------------
	-- Internal constants
	----------------------------------------------------------------------------------------------------
	constant F_CLK_C : real := 100.0E6; -- Define the frequency of the clock
	constant T_CLK_C : time := (1.0 sec) / F_CLK_C; -- Calculate the period of a clockcycle
	constant DTS_C   : time := 2 ns;    -- Wait time before applying the stimulus 
	constant DTR_C   : time := 6 ns;    -- Wait time before reading response

	constant G_DATA_WIDTH    : integer range 1 to 64 := 2; -- Constant for the generic g_DATA_WIDTH
	constant G_NO_OF_SAMPLES : integer range 1 to 64 := 2; -- Constant for the generic g_NO_OF_SAMPLES

	----------------------------------------------------------------------------------------------------
	-- Internal signals
	----------------------------------------------------------------------------------------------------
	-- Input signals
	signal tb_data_in : std_logic_vector(G_DATA_WIDTH - 1 downto 0); -- Internal signal for input signal data_in
	signal tb_clk     : std_logic;      -- Internal signal for input signal clk

	-- Output signals
	signal tb_data_out : std_logic_vector(G_DATA_WIDTH - 1 downto 0); -- Internal signal for output signal data_out

	-- Expected responses signals
	signal tb_data_out_exp : std_logic_vector(G_DATA_WIDTH - 1 downto 0); -- Expected response for output signal data_out

begin
	-- Make a dut and map the ports to the correct signals
	DUT : component calcMean
		generic map(
			g_DATA_WIDTH    => G_DATA_WIDTH,
			g_NO_OF_SAMPLES => G_NO_OF_SAMPLES
		)
		port map(
			data_in  => tb_data_in,
			data_out => tb_data_out,
			clk      => tb_clk
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
		file test_vector_file : text open read_mode is "x:\Vivado\ADC\modules\calcMean\calcMean_tb.csv";

		variable line_buffer     : line; -- Text line buffer, current line
		variable line_delim_char : character; -- buffer for the delimitier char -- @suppress "variable line_delim_char is never read"
		variable vector_nr       : integer := 1; -- Variable used to count the testvectors
		variable var_data_in     : std_logic_vector(G_DATA_WIDTH - 1 downto 0); -- Internal variable for signal data_in
		variable var_data_out    : std_logic_vector(G_DATA_WIDTH - 1 downto 0); -- Internal variable for signal data_out
	begin
		wait until (rising_edge(tb_clk)); -- Wait for the first active clock edge

		-- Loop through the whole file
		while not endfile(test_vector_file) loop -- Read individual lines until the end of the file
			readline(test_vector_file, line_buffer); -- Start reading a new line with stimulus / response pair
			next when line_buffer.all(1) = '-'; -- Jump over comments

			wait for DTS_C;             -- Wait for time point of application stimuli

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_data_in); -- Read input stimuli of signal data_in
			tb_data_in <= var_data_in;  -- Interprete stimuli of signal data_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_data_out); -- Read expected reponse of signal data_out
			tb_data_out_exp <= var_data_out; -- Interprete expected response of signal data_out 

			wait for DTR_C;             -- Wait for a valid response

			-- Compare all results with the expected results
			assert (tb_data_out_exp = tb_data_out) report "Error with data_out in test vector " & Integer'image(vector_nr) severity error;

			wait until (rising_edge(tb_clk)); -- Wait for the next active clock edge

			vector_nr := vector_nr + 1; -- Increment the test vector number
		end loop;

		-- Terminate the simulation
		assert false report "Simulation completed" severity failure;

		-- Wait forever
		wait;
	end process apply_testvector;
end tb;
