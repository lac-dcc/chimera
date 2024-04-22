

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
-- Create Date:   09:21:19 08/19/2013
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-hard/test_bench/max7219_tb.vhd
-- Project Name:  logipi_face
-- Target Device:  
-- Tool versions: ISE 14.1  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: max7219
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
 
ENTITY max7219_tb IS
END max7219_tb;
 
ARCHITECTURE behavior OF max7219_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT wishbone_max7219
    PORT(
         gls_reset : IN  std_logic;
         gls_clk : IN  std_logic;
         wbs_address : IN  std_logic_vector(15 downto 0);
         wbs_writedata : IN  std_logic_vector(15 downto 0);
         wbs_readdata : OUT  std_logic_vector(15 downto 0);
         wbs_strobe : IN  std_logic;
         wbs_cycle : IN  std_logic;
         wbs_write : IN  std_logic;
         wbs_ack : OUT  std_logic;
         DOUT : OUT  std_logic;
         SCLK : OUT  std_logic;
         LOAD : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal gls_reset : std_logic := '0';
   signal gls_clk : std_logic := '0';
   signal wbs_address : std_logic_vector(15 downto 0) := (others => '0');
   signal wbs_writedata : std_logic_vector(15 downto 0) := (others => '0');
   signal wbs_strobe : std_logic := '0';
   signal wbs_cycle : std_logic := '0';
   signal wbs_write : std_logic := '0';

 	--Outputs
   signal wbs_readdata : std_logic_vector(15 downto 0);
   signal wbs_ack : std_logic;
   signal DOUT : std_logic;
   signal SCLK : std_logic;
   signal LOAD : std_logic;

   -- Clock period definitions
   constant gls_clk_period : time := 10 ns;
   constant SCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wishbone_max7219
		  PORT MAP (
          gls_reset => gls_reset,
          gls_clk => gls_clk,
          wbs_address => wbs_address,
          wbs_writedata => wbs_writedata,
          wbs_readdata => wbs_readdata,
          wbs_strobe => wbs_strobe,
          wbs_cycle => wbs_cycle,
          wbs_write => wbs_write,
          wbs_ack => wbs_ack,
          DOUT => DOUT,
          SCLK => SCLK,
          LOAD => LOAD
        );

   -- Clock process definitions
   gls_clk_process :process
   begin
		gls_clk <= '0';
		wait for gls_clk_period/2;
		gls_clk <= '1';
		wait for gls_clk_period/2;
   end process;
 
	
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		gls_reset <= '1' ;
		wbs_strobe <= '0';
		wbs_cycle <= '0' ; 
		wbs_write <= '0' ;
      wait for 100 ns;	
	   gls_reset <= '0' ;
      wait for gls_clk_period*10;
		wbs_address <= X"0000";
	   wbs_writedata <= X"AA55" ;
		wbs_strobe <= '1';
		wbs_cycle <= '1' ; 
		wbs_write <= '1' ;
		wait for gls_clk_period*10;
		wbs_strobe <= '0';
		wbs_cycle <= '0' ; 
		wbs_write <= '0' ;
		wait for gls_clk_period*10;
		wbs_address <= X"0001";
		wbs_writedata <= X"55AA" ;
		wbs_strobe <= '1';
		wbs_cycle <= '1' ; 
		wbs_write <= '1' ;
		wait for gls_clk_period*10;
		wbs_strobe <= '0';
		wbs_cycle <= '0' ; 
		wbs_write <= '0' ;
      -- insert stimulus here 

      wait;
   end process;

END;
