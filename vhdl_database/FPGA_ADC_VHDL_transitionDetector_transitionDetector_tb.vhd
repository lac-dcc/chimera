----------------------------------------------------------------------------------------------------
-- brief: Testbench for entity transitionDetector
-- file: transitionDetector_tb.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 29.01.2020 | L. Leuenberger     | Auto-Created
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
entity transitionDetector_tb is
end transitionDetector_tb;

-- Architecture of the Testbench
architecture tb of transitionDetector_tb is
	----------------------------------------------------------------------------------------------------
	-- Components
	----------------------------------------------------------------------------------------------------
	component transitionDetector
		generic(
			g_NUM_OF_ELEMS              : integer;
			g_BLOCKSIZE_SUM             : integer range 8 to 64;
			g_NUM_OF_BITS_FOR_MAX_ELEMS : integer
		);
		port(
			carry_chain_in     : in  std_logic_vector(g_NUM_OF_ELEMS - 1 downto 0);
			fallTransition_out : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			riseTransition_out : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			sumOnes_out        : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			clk                : in  std_logic
		);
	end component transitionDetector;

	----------------------------------------------------------------------------------------------------
	-- Internal constants
	----------------------------------------------------------------------------------------------------
	constant F_CLK_C : real := 100.0E6; -- Define the frequency of the clock
	constant T_CLK_C : time := (1.0 sec) / F_CLK_C; -- Calculate the period of a clockcycle
	constant DTS_C   : time := 2 ns;    -- Wait time before applying the stimulus 
	constant DTR_C   : time := 6 ns;    -- Wait time before reading response

	constant G_NUM_OF_ELEMS              : integer               := 128; -- Constant for the generic g_NUM_OF_ELEMS
	constant G_BLOCKSIZE_SUM             : integer range 8 to 64 := 16; -- Constant for the generic g_BLOCKSIZE_SUM
	constant G_NUM_OF_BITS_FOR_MAX_ELEMS : integer               := 7; -- Constant for the generic g_NUM_OF_BITS_FOR_MAX_ELEMS

	----------------------------------------------------------------------------------------------------
	-- Internal signals
	----------------------------------------------------------------------------------------------------
	-- Input signals
	signal tb_carry_chain_in : std_logic_vector(G_NUM_OF_ELEMS - 1 downto 0); -- Internal signal for input signal carry_chain_in
	signal tb_clk            : std_logic; -- Internal signal for input signal clk

	-- Output signals
	signal tb_fallTransition_out : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for output signal fallTransition_out
	signal tb_riseTransition_out : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for output signal riseTransition_out
	signal tb_sumOnes_out        : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for output signal sumOnes_out

	-- Expected responses signals
	signal tb_fallTransition_out_exp : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Expected response for output signal fallTransition_out
	signal tb_riseTransition_out_exp : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Expected response for output signal riseTransition_out
	signal tb_sumOnes_out_exp        : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Expected response for output signal sumOnes_out

begin
	-- Make a dut and map the ports to the correct signals
	DUT : component transitionDetector
		generic map(
			g_NUM_OF_ELEMS              => G_NUM_OF_ELEMS,
			g_BLOCKSIZE_SUM             => G_BLOCKSIZE_SUM,
			g_NUM_OF_BITS_FOR_MAX_ELEMS => G_NUM_OF_BITS_FOR_MAX_ELEMS
		)
		port map(
			carry_chain_in     => tb_carry_chain_in,
			fallTransition_out => tb_fallTransition_out,
			riseTransition_out => tb_riseTransition_out,
			sumOnes_out        => tb_sumOnes_out,
			clk                => tb_clk
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
		file test_vector_file : text open read_mode is "x:\Vivado\TDC\modules\transitionDetector\transitionDetector_tb.csv";

		variable line_buffer            : line; -- Text line buffer, current line
		variable line_delim_char        : character; -- buffer for the delimitier char -- @suppress "variable line_delim_char is never read" 
		variable vector_nr              : integer := 1; -- Variable used to count the testvectors
		variable var_carry_chain_in     : std_logic_vector(G_NUM_OF_ELEMS - 1 downto 0); -- Internal variable for signal carry_chain_in
		variable var_fallTransition_out : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal fallTransition_out
		variable var_riseTransition_out : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal riseTransition_out
		variable var_sumOnes_out        : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal sumOnes_out
	begin
		wait until (rising_edge(tb_clk)); -- Wait for the first active clock edge

		-- Loop through the whole file
		while not endfile(test_vector_file) loop -- Read individual lines until the end of the file
			readline(test_vector_file, line_buffer); -- Start reading a new line with stimulus / response pair
			next when line_buffer.all(1) = '-'; -- Jump over comments

			wait for DTS_C;             -- Wait for time point of application stimuli

			read(line_buffer, line_delim_char); -- Read a delim char
			hread(line_buffer, var_carry_chain_in); -- Read input stimuli of signal carry_chain_in
			tb_carry_chain_in <= var_carry_chain_in; -- Interprete stimuli of signal carry_chain_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_fallTransition_out); -- Read expected reponse of signal fallTransition_out
			tb_fallTransition_out_exp <= var_fallTransition_out; -- Interprete expected response of signal fallTransition_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_riseTransition_out); -- Read expected reponse of signal riseTransition_out
			tb_riseTransition_out_exp <= var_riseTransition_out; -- Interprete expected response of signal riseTransition_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_sumOnes_out); -- Read expected reponse of signal sumOnes_out
			tb_sumOnes_out_exp <= var_sumOnes_out; -- Interprete expected response of signal sumOnes_out

			wait for DTR_C;             -- Wait for a valid response

			-- Compare all results with the expected results
			assert (tb_fallTransition_out_exp = tb_fallTransition_out) report "Error with fallTransition_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_riseTransition_out_exp = tb_riseTransition_out) report "Error with riseTransition_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_sumOnes_out_exp = tb_sumOnes_out) report "Error with sumOnes_out in test vector " & Integer'image(vector_nr) severity error;

			wait until (rising_edge(tb_clk)); -- Wait for the next active clock edge

			vector_nr := vector_nr + 1; -- Increment the test vector number
		end loop;

		-- Terminate the simulation
		assert false report "Simulation completed" severity failure;

		-- Wait forever
		wait;
	end process apply_testvector;
end tb;
