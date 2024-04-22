--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:27:33 12/29/2019
-- Design Name:   
-- Module Name:   F:/xilinx_proy/ov7670/v05_oscop_disp/tb_debounce.vhd
-- Project Name:  v05_oscop_disp
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: debounce_1pulse
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

library work;
use work.ov7670_pkg.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_debounce IS
END tb_debounce;
 
ARCHITECTURE behavior OF tb_debounce IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT debounce_1pulse
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         sig_in : IN  std_logic;
         sig_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal sig_in : std_logic := '0';

 	--Outputs
   signal sig_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
  uut: debounce_1pulse PORT MAP (
          rst => rst,
          clk => clk,
          sig_in => sig_in,
          sig_out => sig_out
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
   rst_proc: process
   begin		
      rst <= c_on;
      wait for 105 ns;	
      rst <= c_off;
      wait for clk_period*10;
      wait;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      sig_in <= '0';
      -- hold reset state for 100 ns.
      wait for 235 ns;	
      sig_in <= '1';
      wait for clk_period;
      sig_in <= '0';
      wait for clk_period;
      sig_in <= '1';
      wait for 2 * clk_period;
      sig_in <= '0';
      wait for 2 * clk_period;
      sig_in <= '1';
      wait for 1000 * clk_period;  ---- 1
      sig_in <= '0';
      wait for 2 * clk_period;
      sig_in <= '1';
      wait for 2 * clk_period;
      sig_in <= '0';
      wait for clk_period;
      sig_in <= '1';
      wait for clk_period;
      sig_in <= '0';
      wait for 1000 * clk_period;  ---- 0
      sig_in <= '1';
      wait for clk_period;
      sig_in <= '0';
      wait for clk_period;
      sig_in <= '1';
      wait for 2 * clk_period;
      sig_in <= '0';
      wait for 2 * clk_period;
      sig_in <= '1';
      wait for 10_000_000 * clk_period;  ---- 1
      sig_in <= '0';
      wait for 2 * clk_period;
      sig_in <= '1';
      wait for 2 * clk_period;
      sig_in <= '0';
      wait for clk_period;
      sig_in <= '1';
      wait for clk_period;
      sig_in <= '0';
      wait for 1000 * clk_period;  ---- 0
      sig_in <= '1';
      wait for clk_period;
      sig_in <= '0';
      wait for clk_period;
      sig_in <= '1';
      wait for 2 * clk_period;
      sig_in <= '0';
      wait for 2 * clk_period;
      sig_in <= '1';
      wait for 40_000_000 * clk_period;  ---- 1
      sig_in <= '0';
      wait for 2 * clk_period;
      sig_in <= '1';
      wait for 2 * clk_period;
      sig_in <= '0';
      wait for clk_period;
      sig_in <= '1';
      wait for clk_period;
      sig_in <= '0';
      wait for 1000 * clk_period;  ---- 0

      wait;
   end process;

END;
