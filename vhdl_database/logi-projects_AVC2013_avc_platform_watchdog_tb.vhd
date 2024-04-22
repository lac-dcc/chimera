--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:36:35 06/06/2013
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-projects/AVC2013/avc_platform/watchdog_tb.vhd
-- Project Name:  avc_platform
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: watchdog
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
 
ENTITY watchdog_tb IS
END watchdog_tb;
 
ARCHITECTURE behavior OF watchdog_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT watchdog
    PORT(
         clk : IN  std_logic;
         resetn : IN  std_logic;
         cs : IN  std_logic;
         wr : IN  std_logic;
         enable_channels : OUT  std_logic_vector(6 downto 0);
         status : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal cs : std_logic := '0';
   signal wr : std_logic := '0';

 	--Outputs
   signal enable_channels : std_logic_vector(6 downto 0);
   signal status : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: watchdog PORT MAP (
          clk => clk,
          resetn => resetn,
          cs => cs,
          wr => wr,
          enable_channels => enable_channels,
          status => status
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
		resetn <= '0' ;
      wait for 100 ns;	
		resetn <= '1' ;
		cs <= '0';
		wr <= '0';
      wait for 500 ms;
		cs <= '1';
		wr <= '1';
		wait for 4*clk_period;
		cs <= '0';
		wr <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
