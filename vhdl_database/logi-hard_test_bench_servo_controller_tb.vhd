

-- ----------------------------------------------------------------------
--LOGI-hard
--Copyright (c) 2013, Jonathan Piat, Michael Jones, All rights reserved.
--
--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 3.0 of the License, or (at your option) any later version.
--
--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
--Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public
--License along with this library.
-- ----------------------------------------------------------------------



--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:08:22 05/12/2013
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-projects/AVC2013/avc_platform/servo_controller_tb.vhd
-- Project Name:  avc_platform
-- Target Device:  
-- Tool versions: ISE 14.1  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: servo_controller
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
 
ENTITY servo_controller_tb IS
END servo_controller_tb;
 
ARCHITECTURE behavior OF servo_controller_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT servo_controller
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         servo_position : IN  std_logic_vector(0 to 7);
         servo_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal servo_position : std_logic_vector(0 to 7) := (others => '0');

 	--Outputs
   signal servo_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: servo_controller PORT MAP (
          clk => clk,
          rst => rst,
          servo_position => servo_position,
          servo_out => servo_out
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
		rst <= '1' ;
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst <= '0' ;
		servo_position <= X"80";
      wait for clk_period*10;
		
      -- insert stimulus here 

      wait;
   end process;

END;
