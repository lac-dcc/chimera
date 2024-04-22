--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:56:46 02/19/2014
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-hard/test_bench/heart_beat_tb.vhd
-- Project Name:  logipi_ugv
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: heart_beat
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY heart_beat_tb IS
END heart_beat_tb;
 
ARCHITECTURE behavior OF heart_beat_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT heart_beat
	  generic(clk_period_ns : positive := 10; 
				beat_period_ns : positive := 1_000_000_000;
				beat_length_ns : positive := 200_000_000);
    PORT(
         gls_clk : IN  std_logic;
         gls_reset : IN  std_logic;
         beat_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal beat_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: heart_beat 
	 generic map(clk_period_ns => 10, 
				beat_period_ns => 100_000,
				beat_length_ns => 20_000)
	PORT MAP (
          gls_clk => clk,
          gls_reset => reset,
          beat_out => beat_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1';
      wait for 100 ns;	
		reset <= '0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
