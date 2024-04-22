--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:52:15 07/18/2012
-- Design Name:   
-- Module Name:   C:/Users/Hamster/Projects/FPGA/HDMTtest/tb_dvid_test.vhd
-- Project Name:  HDMTtest
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dvid_test
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
 
ENTITY tb_dvid_test IS
END tb_dvid_test;
 
ARCHITECTURE behavior OF tb_dvid_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dvid_test
    PORT(
         clk_50 : IN  std_logic;
         tmds   : OUT  std_logic_vector(3 downto 0);
         tmdsb  : OUT  std_logic_vector(3 downto 0)
			);
    END COMPONENT;
    

   --Inputs
   signal clk_50 : std_logic := '0';

 	--Outputs
   signal tmds  : std_logic_vector(3 downto 0);
   signal tmdsb : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20.00 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dvid_test PORT MAP (
          clk_50   => clk_50,
			 tmds  => tmds,
          tmdsb => tmdsb
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk_50 <= '0';
		wait for clk_period/2;
		clk_50 <= '1';
		wait for clk_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
