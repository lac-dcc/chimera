----------------------------------------------------------------------------------------------------
-- brief: Testbench for entity writeDRP
-- file: writeDRP_tb.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 31.01.2020 | L. Leuenberger     | Auto-Created
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
entity writeDRP_tb is
end writeDRP_tb;

-- Architecture of the Testbench
architecture tb of writeDRP_tb is
	----------------------------------------------------------------------------------------------------
	-- Components
	----------------------------------------------------------------------------------------------------
	component writeDRP
		port(
			addr_in       : in  std_logic_vector(6 downto 0);
			data_in       : in  std_logic_vector(15 downto 0);
			bitmask_in    : in  std_logic_vector(15 downto 0);
			start_in      : in  std_logic;
			ready_out     : out std_logic;
			reset_clk_out : out std_logic;
			drp_den       : out std_logic;
			drp_daddr     : out std_logic_vector(6 downto 0);
			drp_di        : out std_logic_vector(15 downto 0);
			drp_do        : in  std_logic_vector(15 downto 0);
			drp_drdy      : in  std_logic;
			drp_dwe       : out std_logic;
			clk           : in  std_logic
		);
	end component writeDRP;

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
	signal tb_addr_in    : std_logic_vector(6 downto 0); -- Internal signal for input signal addr_in
	signal tb_data_in    : std_logic_vector(15 downto 0); -- Internal signal for input signal data_in
	signal tb_start_in   : std_logic;   -- Internal signal for input signal start_in
	signal tb_drp_do     : std_logic_vector(15 downto 0); -- Internal signal for input signal drp_do
	signal tb_drp_drdy   : std_logic;   -- Internal signal for input signal drp_drdy
	signal tb_bitmask_in : std_logic_vector(15 downto 0); -- Internal signal for input signal bitmask_in
	signal tb_clk        : std_logic;   -- Internal signal for input signal clk

	-- Output signals
	signal tb_ready_out     : std_logic; -- Internal signal for output signal ready_out
	signal tb_drp_den       : std_logic; -- Internal signal for output signal drp_den
	signal tb_drp_daddr     : std_logic_vector(6 downto 0); -- Internal signal for output signal drp_daddr
	signal tb_drp_di        : std_logic_vector(15 downto 0); -- Internal signal for output signal drp_di
	signal tb_drp_dwe       : std_logic; -- Internal signal for output signal drp_dwe
	signal tb_reset_clk_out : std_logic; -- Internal signal for output signal reset_clk_out

	-- Expected responses signals
	signal tb_ready_out_exp     : std_logic; -- Expected response for output signal ready_out
	signal tb_drp_den_exp       : std_logic; -- Expected response for output signal drp_den
	signal tb_drp_daddr_exp     : std_logic_vector(6 downto 0); -- Expected response for output signal drp_daddr
	signal tb_drp_di_exp        : std_logic_vector(15 downto 0); -- Expected response for output signal drp_di
	signal tb_drp_dwe_exp       : std_logic; -- Expected response for output signal drp_dwe
	signal tb_reset_clk_out_exp : std_logic; -- Internal signal for output signal reset_clk_out

begin
	-- Make a dut and map the ports to the correct signals
	DUT : component writeDRP
		port map(
			addr_in       => tb_addr_in,
			data_in       => tb_data_in,
			bitmask_in    => tb_bitmask_in,
			start_in      => tb_start_in,
			ready_out     => tb_ready_out,
			reset_clk_out => tb_reset_clk_out,
			drp_den       => tb_drp_den,
			drp_daddr     => tb_drp_daddr,
			drp_di        => tb_drp_di,
			drp_do        => tb_drp_do,
			drp_drdy      => tb_drp_drdy,
			drp_dwe       => tb_drp_dwe,
			clk           => tb_clk
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
		file test_vector_file : text open read_mode is "x:\Vivado\ADC\modules\writeDRP\writeDRP_tb.csv";

		variable line_buffer       : line; -- Text line buffer, current line
		variable line_delim_char   : character; -- buffer for the delimitier char -- @suppress "variable line_delim_char is never read"
		variable vector_nr         : integer := 1; -- Variable used to count the testvectors
		variable var_addr_in       : std_logic_vector(6 downto 0); -- Internal variable for signal addr_in
		variable var_data_in       : std_logic_vector(15 downto 0); -- Internal variable for signal data_in
		variable var_start_in      : std_logic; -- Internal variable for signal start_in
		variable var_ready_out     : std_logic; -- Internal variable for signal ready_out
		variable var_bitmask_in    : std_logic_vector(15 downto 0); -- Internal variable for signal bitmask_in
		variable var_drp_den       : std_logic; -- Internal variable for signal drp_den
		variable var_drp_daddr     : std_logic_vector(6 downto 0); -- Internal variable for signal drp_daddr
		variable var_drp_di        : std_logic_vector(15 downto 0); -- Internal variable for signal drp_di
		variable var_drp_do        : std_logic_vector(15 downto 0); -- Internal variable for signal drp_do
		variable var_drp_drdy      : std_logic; -- Internal variable for signal drp_drdy
		variable var_drp_dwe       : std_logic; -- Internal variable for signal drp_dwe
		variable var_reset_clk_out : std_logic; -- Internal variable for signal reset_clk_out
	begin
		wait until (rising_edge(tb_clk)); -- Wait for the first active clock edge

		-- Loop through the whole file
		while not endfile(test_vector_file) loop -- Read individual lines until the end of the file
			readline(test_vector_file, line_buffer); -- Start reading a new line with stimulus / response pair
			next when line_buffer.all(1) = '-'; -- Jump over comments

			wait for DTS_C;             -- Wait for time point of application stimuli

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_addr_in); -- Read input stimuli of signal addr_in
			tb_addr_in <= var_addr_in;  -- Interprete stimuli of signal addr_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_data_in); -- Read input stimuli of signal data_in
			tb_data_in <= var_data_in;  -- Interprete stimuli of signal data_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_start_in); -- Read input stimuli of signal start_in
			tb_start_in <= var_start_in; -- Interprete stimuli of signal start_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_drp_do); -- Read input stimuli of signal drp_do
			tb_drp_do <= var_drp_do;    -- Interprete stimuli of signal drp_do

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_drp_drdy); -- Read input stimuli of signal drp_drdy
			tb_drp_drdy <= var_drp_drdy; -- Interprete stimuli of signal drp_drdy

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_bitmask_in); -- Read input stimuli of signal bitmask_in
			tb_bitmask_in <= var_bitmask_in; -- Interprete stimuli of signal bitmask_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_ready_out); -- Read expected reponse of signal ready_out
			tb_ready_out_exp <= var_ready_out; -- Interprete expected response of signal ready_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_drp_den); -- Read expected reponse of signal drp_den
			tb_drp_den_exp <= var_drp_den; -- Interprete expected response of signal drp_den

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_drp_daddr); -- Read expected reponse of signal drp_daddr
			tb_drp_daddr_exp <= var_drp_daddr; -- Interprete expected response of signal drp_daddr

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_drp_di); -- Read expected reponse of signal drp_di
			tb_drp_di_exp <= var_drp_di; -- Interprete expected response of signal drp_di

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_drp_dwe); -- Read expected reponse of signal drp_dwe
			tb_drp_dwe_exp <= var_drp_dwe; -- Interprete expected response of signal drp_dwe

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_reset_clk_out); -- Read expected reponse of signal drp_dwe
			tb_reset_clk_out_exp <= var_reset_clk_out; -- Interprete expected response of signal reset_clk_out

			wait for DTR_C;             -- Wait for a valid response

			-- Compare all results with the expected results
			assert (tb_ready_out_exp = tb_ready_out) report "Error with ready_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_drp_den_exp = tb_drp_den) report "Error with drp_den in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_drp_daddr_exp = tb_drp_daddr) report "Error with drp_daddr in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_drp_di_exp = tb_drp_di) report "Error with drp_di in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_drp_dwe_exp = tb_drp_dwe) report "Error with drp_dwe in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_reset_clk_out_exp = tb_reset_clk_out) report "Error with reset_clk_out in test vector " & Integer'image(vector_nr) severity error;

			wait until (rising_edge(tb_clk)); -- Wait for the next active clock edge

			vector_nr := vector_nr + 1; -- Increment the test vector number
		end loop;

		-- Terminate the simulation
		assert false report "Simulation completed" severity failure;

		-- Wait forever
		wait;
	end process apply_testvector;
end tb;
