

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
-- Create Date:   10:09:00 08/26/2013
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-hard/test_bench/mcp_3002_tb.vhd
-- Project Name:  logipi_face
-- Target Device:  
-- Tool versions: ISE 14.1  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mcp3002_interface
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
 
ENTITY mcp_3002_tb IS
END mcp_3002_tb;
 
ARCHITECTURE behavior OF mcp_3002_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mcp3002_interface
    PORT(
         sample : OUT  std_logic_vector(9 downto 0);
         dv : OUT  std_logic;
         chan : IN  std_logic;
         DOUT : OUT  std_logic;
         DIN : IN  std_logic;
         SCLK : OUT  std_logic;
         SSN : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal chan : std_logic := '0';
   signal DIN : std_logic := '0';

 	--Outputs
   signal sample : std_logic_vector(9 downto 0);
   signal dv : std_logic;
   signal DOUT : std_logic;
   signal SCLK : std_logic;
   signal SSN : std_logic;

   -- Clock period definitions
   constant SCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mcp3002_interface PORT MAP (
          sample => sample,
          dv => dv,
          chan => chan,
          DOUT => DOUT,
          DIN => DIN,
          SCLK => SCLK,
          SSN => SSN
        );

   -- Clock process definitions
   SCLK_process :process
   begin
		SCLK <= '0';
		wait for SCLK_period/2;
		SCLK <= '1';
		wait for SCLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for SCLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
