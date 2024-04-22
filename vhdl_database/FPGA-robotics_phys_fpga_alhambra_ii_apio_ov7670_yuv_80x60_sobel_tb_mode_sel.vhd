--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:03:38 10/21/2020
-- Design Name:   
-- Module Name:   F:/urjc/proyectos/jderobot/fpga-robot/Projects/ComputerVision/apio/ov7670_yuv_80x60_sobel/tb_mode_sel.vhd
-- Project Name:  mode_sel
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mode_sel
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
 
ENTITY tb_mode_sel IS
END tb_mode_sel;
 
ARCHITECTURE behavior OF tb_mode_sel IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mode_sel
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         btn_in : IN  std_logic;
         filter_on : OUT  std_logic;
         vfilter : OUT  std_logic;
         test_mode : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal btn_in : std_logic := '0';

 	--Outputs
   signal filter_on : std_logic;
   signal vfilter : std_logic;
   signal test_mode : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
   signal fin : std_logic := '0';
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mode_sel PORT MAP (
          rst => rst,
          clk => clk,
          btn_in => btn_in,
          filter_on => filter_on,
          vfilter => vfilter,
          test_mode => test_mode
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		if fin = '1' then
		   wait;
		end if;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1';
      wait for 14 ns;	
      rst <='0';
      wait for clk_period*100;
      btn_in <= '1';
		wait for clk_period*10_000_000;
      btn_in <= '0';
		wait for clk_period*1_000;
      btn_in <= '1';
		wait for clk_period*1_000_000;
      btn_in <= '0';
		wait for clk_period*1_000;
      btn_in <= '1';
		wait for clk_period*1_000_000;
      btn_in <= '0';
		wait for clk_period*1_000;
      btn_in <= '1';
		wait for clk_period*300_000_000;
      btn_in <= '0';
		wait for clk_period*1_000;
      fin <= '1';
		wait;
   end process;

END;
