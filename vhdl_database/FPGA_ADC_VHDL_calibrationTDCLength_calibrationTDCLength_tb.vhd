----------------------------------------------------------------------------------------------------
-- brief: Testbench for entity calibrationTDCLength
-- file: calibrationTDCLength_tb.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 03.02.2020 | L. Leuenberger     | Auto-Created
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
entity calibrationTDCLength_tb is
end calibrationTDCLength_tb;

-- Architecture of the Testbench
architecture tb of calibrationTDCLength_tb is
	----------------------------------------------------------------------------------------------------
	-- Components
	----------------------------------------------------------------------------------------------------
	component calibrationTDCLength
		generic(
			g_NUMBER_OF_STEPS_CLOCK_SHIFT : integer;
			g_DIVIDE_VALUE                : integer;
			g_DUTY_VALUE                  : integer;
			g_ADDR_REG1                   : std_logic_vector(6 downto 0);
			g_ADDR_REG2                   : std_logic_vector(6 downto 0);
			g_BITMASK_REG1                : std_logic_vector(15 downto 0);
			g_BITMASK_REG2                : std_logic_vector(15 downto 0);
			g_NUM_OF_ELEMS                : integer;
			g_NUM_OF_BITS_FOR_MAX_ELEMS   : integer;
			g_NO_OF_SUM_MEAN              : integer
		);
		port(
			start_in                 : in  std_logic;
			locked_in                : in  std_logic;
			reset_clk_out            : out std_logic;
			drp_den                  : out std_logic;
			drp_daddr                : out std_logic_vector(6 downto 0);
			drp_di                   : out std_logic_vector(15 downto 0);
			drp_do                   : in  std_logic_vector(15 downto 0);
			drp_drdy                 : in  std_logic;
			drp_dwe                  : out std_logic;
			sumOnes_in               : in  std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			maxLengthCarryChain_out  : out std_logic_vector(g_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0);
			configurationRunning_out : out std_logic;
			clk                      : in  std_logic
		);
	end component calibrationTDCLength;

	----------------------------------------------------------------------------------------------------
	-- Internal constants
	----------------------------------------------------------------------------------------------------
	constant F_CLK_DRP_C   : real := 200.0E6; -- Define the frequency of the clock
	constant F_CLK_CARRY_C : real := 600.0E6; -- Define the frequency of the clock
	constant T_CLK_DRP_C   : time := (1.0 sec) / F_CLK_DRP_C; -- Calculate the period of a clockcycle
	constant T_CLK_CARRY_C : time := (1.0 sec) / F_CLK_CARRY_C; -- Calculate the period of a clockcycle
	constant DTS_C         : time := 333 ps; -- Wait time before applying the stimulus 
	constant DTR_C         : time := 1000 ps; -- Wait time before reading response

	constant G_NUMBER_OF_STEPS_CLOCK_SHIFT : integer                       := 10; -- Constant for the generic g_NUMBER_OF_STEPS_CLOCK_SHIFT
	constant G_DIVIDE_VALUE                : integer                       := 2; -- Constant for the generic g_DIVIDE_VALUE
	constant G_DUTY_VALUE                  : integer                       := 50000; -- Constant for the generic g_DUTY_VALUE
	constant G_ADDR_REG1                   : std_logic_vector(6 downto 0)  := "0010000"; -- Constant for the generic g_ADDR_REG1
	constant G_ADDR_REG2                   : std_logic_vector(6 downto 0)  := "0010001"; -- Constant for the generic g_ADDR_REG2
	constant G_NUM_OF_ELEMS                : integer                       := 1024; -- Constant for the generic g_NUM_OF_ELEMS
	constant G_NUM_OF_BITS_FOR_MAX_ELEMS   : integer                       := 11; -- Constant for the generic g_NUM_OF_BITS_FOR_MAX_ELEMS
	constant G_BITMASK_REG1                : std_logic_vector(15 downto 0) := "0001000000000000"; -- Constant for the generic g_BITMASK_REG1
	constant G_BITMASK_REG2                : std_logic_vector(15 downto 0) := "1111110000000000"; -- Constant for the generic g_BITMASK_REG2
	constant G_NO_OF_SUM_MEAN              : integer                       := 4; -- Constant for the generic g_NO_OF_SUM_MEAN

	----------------------------------------------------------------------------------------------------
	-- Internal signals
	----------------------------------------------------------------------------------------------------
	-- Input signals
	signal tb_start_in       : std_logic; -- Internal signal for input signal start_in
	signal tb_locked_in      : std_logic; -- Internal signal for input signal locked_in
	signal tb_drp_do         : std_logic_vector(15 downto 0); -- Internal signal for input signal drp_do
	signal tb_drp_drdy       : std_logic; -- Internal signal for input signal drp_drdy
	signal tb_carry_chain_in : std_logic_vector(G_NUM_OF_ELEMS - 1 downto 0); -- Internal signal for input signal carry_chain_in
	signal tb_clk_DRP        : std_logic; -- Internal signal for input signal clk_DRP
	signal tb_clk_Carry      : std_logic; -- Internal signal for input signal clk_Carry
	signal tb_clk            : std_logic; -- Internal signal for input signal clk
	signal tb_sumOnes_in     : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for input signal sumOnes_in

	-- Output signals
	signal tb_reset_clk_out            : std_logic; -- Internal signal for output signal reset_clk_out
	signal tb_drp_den                  : std_logic; -- Internal signal for output signal drp_den
	signal tb_drp_daddr                : std_logic_vector(6 downto 0); -- Internal signal for output signal drp_daddr
	signal tb_drp_di                   : std_logic_vector(15 downto 0); -- Internal signal for output signal drp_di
	signal tb_drp_dwe                  : std_logic; -- Internal signal for output signal drp_dwe
	signal tb_maxLengthCarryChain_out  : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal signal for output signal maxLengthCarryChain_out
	signal tb_configurationRunning_out : std_logic; -- Internal signal for output signal configurationRunning_out

	-- Expected responses signals
	signal tb_maxLengthCarryChain_out_exp  : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Expected response for output signal maxLengthCarryChain_out
	signal tb_configurationRunning_out_exp : std_logic; -- Expected response for output signal configurationRunning_out

begin
	-- Instantiate the clock wizard
	clkWiz : entity work.TDC_clk_wiz_1_0
		port map(
			clk_600MHz_CalibrationShift => tb_clk_Carry,
			daddr                       => tb_drp_daddr,
			dclk                        => tb_clk_DRP,
			den                         => tb_drp_den,
			din                         => tb_drp_di,
			dout                        => tb_drp_do,
			drdy                        => tb_drp_drdy,
			dwe                         => tb_drp_dwe,
			reset                       => tb_reset_clk_out,
			locked                      => tb_locked_in,
			clk_in1                     => tb_clk
		);

	-- Instantiate the carry chain 
	carryChain : entity work.carryChain
		generic map(
			g_NUM_OF_ELEMS   => G_NUM_OF_ELEMS,
			g_X_POS          => 66,
			g_Y_POS          => 240,
			g_RTL_SIMULATION => true,
			g_SORT_DELAY_STA => false
		)
		port map(
			clk              => tb_clk,
			carry_chain_in   => tb_clk_Carry,
			carry_chain2_in  => tb_clk_Carry,
			carry_chain3_in  => '0',
			carry_chain_out  => tb_carry_chain_in,
			carry_mux_sel_in => (others => '0')
		);

	-- Instantiate the transitioNDetector
	transitionDetector : entity work.transitionDetector
		generic map(
			g_NUM_OF_ELEMS              => G_NUM_OF_ELEMS,
			g_BLOCKSIZE_SUM             => 64,
			g_NUM_OF_BITS_FOR_MAX_ELEMS => G_NUM_OF_BITS_FOR_MAX_ELEMS
		)
		port map(
			carry_chain_in     => tb_carry_chain_in,
			fallTransition_out => open,
			riseTransition_out => open,
			sumOnes_out        => tb_sumOnes_in,
			clk                => tb_clk
		);

	-- Make a dut and map the ports to the correct signals
	DUT : component calibrationTDCLength
		generic map(
			g_NUMBER_OF_STEPS_CLOCK_SHIFT => G_NUMBER_OF_STEPS_CLOCK_SHIFT,
			g_DIVIDE_VALUE                => G_DIVIDE_VALUE,
			g_DUTY_VALUE                  => G_DUTY_VALUE,
			g_ADDR_REG1                   => G_ADDR_REG1,
			g_ADDR_REG2                   => G_ADDR_REG2,
			g_BITMASK_REG1                => G_BITMASK_REG1,
			g_BITMASK_REG2                => G_BITMASK_REG2,
			g_NUM_OF_ELEMS                => G_NUM_OF_ELEMS,
			g_NUM_OF_BITS_FOR_MAX_ELEMS   => G_NUM_OF_BITS_FOR_MAX_ELEMS,
			g_NO_OF_SUM_MEAN              => G_NO_OF_SUM_MEAN
		)
		port map(
			start_in                 => tb_start_in,
			locked_in                => tb_locked_in,
			reset_clk_out            => tb_reset_clk_out,
			drp_den                  => tb_drp_den,
			drp_daddr                => tb_drp_daddr,
			drp_di                   => tb_drp_di,
			drp_do                   => tb_drp_do,
			drp_drdy                 => tb_drp_drdy,
			drp_dwe                  => tb_drp_dwe,
			sumOnes_in               => tb_sumOnes_in,
			maxLengthCarryChain_out  => tb_maxLengthCarryChain_out,
			configurationRunning_out => tb_configurationRunning_out,
			clk                      => tb_clk_DRP
		);

	-- Apply a clock to the DUT
	stimuli_clk : process
	begin
		tb_clk_DRP <= '0';
		loop
			wait for (T_CLK_DRP_C / 2.0);
			tb_clk_DRP <= not tb_clk_DRP;
		end loop;
		wait;
	end process;

	stimuli_clk2 : process
	begin
		tb_clk <= '0';
		loop
			wait for (T_CLK_CARRY_C / 2.0);
			tb_clk <= not tb_clk;
		end loop;
		wait;
	end process;

	-- Apply the testvectors to the DUT
	apply_testvector : process
		-- declare and open file with test vectors
		file test_vector_file : text open read_mode is "x:\Vivado\ADC\modules\calibrationTDCLength\calibrationTDCLength_tb.csv";
		--is "/home/lukas/MT_FS20_Leuenberger/Vivado/TDC/modules/calibrationTDCLength/calibrationTDCLength_tb.csv"; 

		variable line_buffer                  : line; -- Text line buffer, current line
		variable line_delim_char              : character; -- buffer for the delimitier char -- @suppress "variable line_delim_char is never read"
		variable vector_nr                    : integer := 1; -- Variable used to count the testvectors
		variable var_start_in                 : std_logic; -- Internal variable for signal start_in
		variable var_maxLengthCarryChain_out  : std_logic_vector(G_NUM_OF_BITS_FOR_MAX_ELEMS - 1 downto 0); -- Internal variable for signal maxLengthCarryChain_out
		variable var_configurationRunning_out : std_logic; -- Internal variable for signal configurationRunning_out
	begin
		-- Loop through the whole file
		while not endfile(test_vector_file) loop -- Read individual lines until the end of the file
			readline(test_vector_file, line_buffer); -- Start reading a new line with stimulus / response pair
			next when line_buffer.all(1) = '-'; -- Jump over comments

			wait for DTS_C;             -- Wait for time point of application stimuli

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_start_in); -- Read input stimuli of signal start_in
			tb_start_in <= var_start_in; -- Interprete stimuli of signal start_in

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_maxLengthCarryChain_out); -- Read expected reponse of signal maxLengthCarryChain_out
			tb_maxLengthCarryChain_out_exp <= var_maxLengthCarryChain_out; -- Interprete expected response of signal maxLengthCarryChain_out

			read(line_buffer, line_delim_char); -- Read a delim char
			read(line_buffer, var_configurationRunning_out); -- Read expected reponse of signal configurationRunning_out
			tb_configurationRunning_out_exp <= var_configurationRunning_out; -- Interprete expected response of signal configurationRunning_out

			wait for DTR_C;             -- Wait for a valid response

			-- Compare all results with the expected results
			assert (tb_maxLengthCarryChain_out_exp = tb_maxLengthCarryChain_out) report "Error with maxLengthCarryChain_out in test vector " & Integer'image(vector_nr) severity error;
			assert (tb_configurationRunning_out_exp = tb_configurationRunning_out) report "Error with configurationRunning_out in test vector " & Integer'image(vector_nr) severity error;

			wait until (rising_edge(tb_clk_DRP)); -- Wait for the next active clock edge

			vector_nr := vector_nr + 1; -- Increment the test vector number
		end loop;

		-- Terminate the simulation
		assert false report "Simulation completed" severity failure;

		-- Wait forever
		wait;
	end process apply_testvector;
end tb;
