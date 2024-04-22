----------------------------------------------------------------------------------------------------
--  brief: Testbench for the Division block
--  file: divison_tb.vhd
--  author: Marco Ehrler, Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
--  File history:
--
--  Version | Date       | Author             | Remarks
--  ------------------------------------------------------------------------------------------------
--  0.1	    | 14.03.2017 | M. Ehrler	      | Created
----------------------------------------------------------------------------------------------------

-- Standard library ieee	
library ieee;
-- This package defines the basic std_logic data types and a few functions.								
use ieee.std_logic_1164.all;
-- This package provides arithmetic functions for vectors.		
use ieee.numeric_std.all;
-- This package provides functions for the calcualtion with real values.
use ieee.math_real.all;
-- This package provides file specific functions.
use std.textio.all;
-- This package provides file specific functions for the std_logic types.
use ieee.std_logic_textio.all;

-- Entity of the Testbench for the Error Compensation Divison.
entity division_tb is
end division_tb;

-- Architecture of the Testbench for the Error Compensation Divison.
architecture tb of division_tb is
	-----------------------------------------------------------------------------------------------
	-- components
	------------------------------------------------------------------------------------------------
	component division is
		generic(
			Division_width_g : positive := 31 -- Determines the size of the three Busses from the Division.
		);
		port(
			-- Input Signals
			Start_in    : in  std_logic; -- Starts the Divsion
			Dividend_in : in  std_logic_vector(Division_width_g - 1 downto 0); -- Dividend of the Division
			Divisor_in  : in  std_logic_vector(Division_width_g - 1 downto 0); -- Divisor of the Division

			-- Output Signals
			Busy_out    : out std_logic; -- Shows that a division is currently running
			Result_out  : out std_logic_vector(Division_width_g - 1 downto 0); -- Contains the result of the last division.

			-- Reset und Clock
			RESETN      : in  std_logic; -- Synchronous Negative Reset
			CLK         : in  std_logic -- Clock	
		);
	end component;

	------------------------------------------------------------------------------------------------
	-- internal constants
	------------------------------------------------------------------------------------------------
	-- Define the frequency of the clock
	constant f_clk : real := 100.0E6;

	-- Calculate the period of a clockcycle
	constant t_clk : time := (1.0 sec) / f_clk;

	-- Wait time before applying the stimulus
	constant dts : time := 2 ns;

	-- Wait time before reading response
	constant dtr : time := 6 ns;

	------------------------------------------------------------------------------------------------
	-- internal signals
	------------------------------------------------------------------------------------------------
	signal tb_resetn      : std_logic;  -- Internal signal for the RESETN port.
	signal tb_clk         : std_logic;  -- Internal signal for the CLK port.
	signal tb_start_in    : std_logic;  -- Internal signal for the Start_in port.
	signal tb_dividend_in : std_logic_vector(31 downto 0); -- Internal signal for the Dividend_in port.
	signal tb_divisor_in  : std_logic_vector(31 downto 0); -- Internal signal for the Divisor_in port.
	signal tb_busy_out    : std_logic;  -- Internal signal for the Busy_out port.
	signal tb_result_out  : std_logic_vector(31 downto 0); -- Internal signal for the Result_out port.

	------------------------------------------------------------------------------------------------
	-- Signals for expected responses
	------------------------------------------------------------------------------------------------
	signal tb_busy_out_exp   : std_logic; -- Expected response for the Busy_out port.
	signal tb_result_out_exp : std_logic_vector(31 downto 0); -- Expected response for the Result_out port.

begin

	-- Make a dut and map the ports to the correct signals
	DUT : component division
		generic map(
			Division_width_g => 32
		)
		port map(
			Start_in    => tb_start_in,
			Dividend_in => tb_dividend_in,
			Divisor_in  => tb_divisor_in,
			Busy_out    => tb_busy_out,
			Result_out  => tb_result_out,
			-- Reset and Clock
			RESETN      => tb_resetn,
			CLK         => tb_clk
		);

	-- Apply a clock to the DUT
	stimuli_clk : process
	begin
		tb_clk <= '0';
		loop
			wait for (t_clk / 2.0);
			tb_clk <= not tb_clk;
		end loop;
		wait;
	end process;

	-- Apply the testvectors to the DUT
	apply_testvector : process
		-- declare and open file with test vectors
		file test_vector_file : text open read_mode is "x:\Vivado\TDC\modules\division\division_tb.csv";

		-- declare variables for the file manipulation
		variable line_buffer      : line; -- Text line buffer, current line
		variable line_delim_char  : character; -- buffer for the delimitier char -- @suppress "variable line_delim_char is never read"
		variable line_vector_31_0 : std_logic_vector(31 downto 0); -- buffer for a std_logic_vector stimuli with size 32
		variable line_logic       : std_logic; -- buffer for a std_logic stimuli
		variable vector_nr        : integer := 1; -- Variable used to count the testvectors

	begin
		tb_resetn <= '0';               -- Perform a reset
		wait until (rising_edge(tb_clk)); -- Wait for the first active clock edge
		tb_resetn <= '1';               -- Clear the reset

		-- Loop through the whole file	
		while not endfile(test_vector_file) loop -- Read individual lines until the end of the file			
			readline(test_vector_file, line_buffer); -- Start reading a new line with stimulus / response pair
			next when line_buffer.all(1) = '-'; -- Jump over comments

			wait for dts;               -- Wait for time point of application stimuli

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, line_logic); -- Read the first stimuli
			tb_start_in <= line_logic;  -- Interprete the first stimuli

			read(line_buffer, line_delim_char); -- Read a delim char
			hread(line_buffer, line_vector_31_0); -- Read the second stimuli
			tb_dividend_in <= line_vector_31_0; -- Interprete the second stimuli	

			read(line_buffer, line_delim_char); -- Read a delim char
			hread(line_buffer, line_vector_31_0); -- Read the third stimuli
			tb_divisor_in <= line_vector_31_0; -- Interprete the third stimuli	

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, line_logic); -- Read the fourth stimuli
			tb_resetn <= line_logic;    -- Interprete the fourth stimuli

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, line_logic); -- Read the first expected response
			tb_busy_out_exp <= line_logic; -- Interprete the first expected response	

			read(line_buffer, line_delim_char); -- Read a delim char
			hread(line_buffer, line_vector_31_0); -- Read the second expected response
			tb_result_out_exp <= line_vector_31_0; -- Interprete the second expected response								

			wait for dtr;               -- Wait for a valid response

			-- Compare all results with the expected results	
			assert (tb_busy_out_exp = tb_busy_out) report "Error with tb_busy_out in test vector " & integer'image(vector_nr) severity error;
			assert (tb_result_out_exp = tb_result_out) report "Error with tb_result_out in test vector " & integer'image(vector_nr) severity error;

			wait until (rising_edge(tb_clk)); -- Wait for the next active clock edge

			vector_nr := vector_nr + 1; -- Increment the test vector number			
		end loop;

		-- Terminate the simulation
		assert false report "Simulation Completed" severity failure;

		-- Wait forever
		wait;

	end process apply_testvector;
end tb;
