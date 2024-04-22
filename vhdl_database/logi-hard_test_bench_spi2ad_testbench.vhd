

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
-- Create Date:   11:12:06 04/09/2013
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-hard/test_bench/spi2ad_testbench.vhd
-- Project Name:  logibone_mining
-- Target Device:  
-- Tool versions: ISE 14.1  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: spi2ad_bus
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
 
ENTITY spi2ad_testbench IS
END spi2ad_testbench;
 
ARCHITECTURE behavior OF spi2ad_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT spi2ad_bus
    PORT(
         clk : IN  std_logic;
         resetn : IN  std_logic;
         mosi : IN  std_logic;
         ss : IN  std_logic;
         sck : IN  std_logic;
         miso : OUT  std_logic;
         data_bus_out : OUT  std_logic_vector(15 downto 0);
         data_bus_in : IN  std_logic_vector(15 downto 0);
         addr_bus : OUT  std_logic_vector(15 downto 0);
         wr : OUT  std_logic;
         rd : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal mosi : std_logic := '0';
   signal ss : std_logic := '0';
   signal sck : std_logic := '0';
   signal data_bus_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal miso : std_logic;
   signal data_bus_out : std_logic_vector(15 downto 0);
   signal addr_bus : std_logic_vector(15 downto 0);
   signal wr : std_logic;
   signal rd : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	constant sck_period : time := 100 ns;
	constant wr_conf : std_logic_vector(15 downto 0) := X"AA50";
	constant data_wr : std_logic_vector(15 downto 0) := X"BB57";
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: spi2ad_bus PORT MAP (
          clk => clk,
          resetn => resetn,
          mosi => mosi,
          ss => ss,
          sck => sck,
          miso => miso,
          data_bus_out => data_bus_out,
          data_bus_in => data_bus_in,
          addr_bus => addr_bus,
          wr => wr,
          rd => rd
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
		ss <= '1' ;
		sck <= '0' ;
		data_bus_in <= X"FF32" ;
      wait for 100 ns;	
		resetn <= '1' ;
      wait for clk_period*10;
		ss <= '0' ;
		loop1: FOR a IN 0 TO 15 LOOP -- la variable de boucle est a de 1 à 10
			sck <= '0' ;
			mosi <= wr_conf(15 - a) ;
			WAIT FOR sck_period/2; -- attend la valeur de pulse_time
			sck <= '1' ; -- complémente clk1
			WAIT FOR sck_period/2;
		END LOOP loop1;
     
		loop2: FOR a IN 0 TO 15 LOOP -- la variable de boucle est a de 1 à 10
			sck <= '0' ;
			mosi <= data_wr(15 - a) ;
			WAIT FOR sck_period/2; -- attend la valeur de pulse_time
			sck <= '1' ; -- complémente clk1
			WAIT FOR sck_period/2;
		END LOOP loop2;
		
		
		loop3: FOR a IN 0 TO 15 LOOP -- la variable de boucle est a de 1 à 10
			sck <= '0' ;
			mosi <= data_wr(15 - a) ;
			WAIT FOR sck_period/2; -- attend la valeur de pulse_time
			sck <= '1' ; -- complémente clk1
			WAIT FOR sck_period/2;
		END LOOP loop3;
		
		mosi <= '0' ;
		sck <= '0' ;
		WAIT FOR sck_period/2;
		ss <= '1' ;
	  

      wait;
   end process;

END;
