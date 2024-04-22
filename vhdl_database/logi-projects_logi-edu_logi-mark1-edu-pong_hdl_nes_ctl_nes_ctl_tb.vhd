--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:52:56 05/23/2013
-- Design Name:   
-- Module Name:   D:/Dropbox/Prj/Valent/LOGI-FAMILY/1logi-github/private/Logi-projects/book-example-code/pong-chu/vhdl/nes_ctl_3/tb.vhd
-- Project Name:  nes_ctl_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: nes_ctl
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
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nes_ctl
    PORT(
         clk : IN  std_logic;
         n_reset : IN  std_logic;
         nes_dat : IN  std_logic;
         nes_lat : OUT  std_logic;
         nes_clk : OUT  std_logic;
         nes_a : OUT  std_logic;
         nes_b : OUT  std_logic;
         nes_sel : OUT  std_logic;
         nes_start : OUT  std_logic;
         nes_up : OUT  std_logic;
         nes_down : OUT  std_logic;
         nes_left : OUT  std_logic;
         nes_right : OUT  std_logic;
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal n_reset : std_logic := '0';
   signal nes_dat : std_logic := '0';

 	--Outputs
   signal nes_lat : std_logic := '0';
   signal nes_clk : std_logic := '0';
   signal nes_a : std_logic;
   signal nes_b : std_logic;
   signal nes_sel : std_logic;
   signal nes_start : std_logic;
   signal nes_up : std_logic;
   signal nes_down : std_logic;
   signal nes_left : std_logic;
   signal nes_right : std_logic;
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant nes_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nes_ctl PORT MAP (
          clk => clk,
          n_reset => n_reset,
          nes_dat => nes_dat,
          nes_lat => nes_lat,
          nes_clk => nes_clk,
          nes_a => nes_a,
          nes_b => nes_b,
          nes_sel => nes_sel,
          nes_start => nes_start,
          nes_up => nes_up,
          nes_down => nes_down,
          nes_left => nes_left,
          nes_right => nes_right,
          led => led
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
		n_reset <= '0';
      wait for 100 ns;	
		n_reset <= '1';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
