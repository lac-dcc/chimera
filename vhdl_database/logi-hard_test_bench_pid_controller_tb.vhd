

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
-- Create Date:   17:36:20 05/12/2013
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-projects/AVC2013/avc_platform/pid_controller_tb.vhd
-- Project Name:  avc_platform
-- Target Device:  
-- Tool versions: ISE 14.1  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pid_controller
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
USE ieee.std_logic_signed.ALL;
USE ieee.numeric_std.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY pid_controller_tb IS
END pid_controller_tb;
 
ARCHITECTURE behavior OF pid_controller_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	 
	 
	component pid_filter is
		generic(clk_period_ns : integer := 8;
		  pid_period_ns : integer := 20000000); -- 50Hz PID for RC based ESC
		port(
		clk, resetn : in std_logic ;
		en : in std_logic ;
		K, AK : in std_logic_vector(15 downto 0);
		B : in std_logic_vector(15 downto 0);
		setpoint : in signed(15 downto 0);
		measure : in signed(15 downto 0);
		cmd : out std_logic_vector(15 downto 0);
		dir : out std_logic 
		);
	end component;

	 COMPONENT encoder_interface
	 PORT(
			clk : IN  std_logic;
			reset : IN  std_logic;
			channel_a : IN  std_logic;
			channel_b : IN  std_logic;
			period : OUT  std_logic_vector(15 downto 0);
			reset_count : IN  std_logic;
			count : OUT  std_logic_vector(15 downto 0);
			pv : OUT  std_logic
		  );
	 END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal en : std_logic := '0';
   signal reset : std_logic := '0';
   signal P : signed(15 downto 0) := (others => '0');
   signal I : signed(15 downto 0) := (others => '0');
   signal D : signed(15 downto 0) := (others => '0');
	
	signal speed_input : signed(15 downto 0);
   
		
	signal channel_a : std_logic := '0';
   signal channel_b : std_logic := '0';
   signal reset_count : std_logic := '0';
	

 	--Outputs
   signal command : std_logic_vector(15 downto 0);
	signal period : std_logic_vector(15 downto 0);
   signal count : std_logic_vector(15 downto 0);
   signal pv : std_logic;
   signal dir : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	constant enc_period_max : time := 32000 us ;
	constant enc_period_min : time := 1 us ;
 
BEGIN

		  
pif_filter0 : pid_filter
		generic map(clk_period_ns => 10,
		  pid_period_ns => 1000000)
		port map(
		clk => clk, 
		resetn => (not reset), 
		en => en, 
		K => X"0400", 
		AK => X"0000",
		--B => X"0200",
		--AK => X"0000",
		B => X"0000",
		setpoint => speed_input,
		measure => signed(period),
		cmd => command ,
		dir => dir 
		);  
		 
		  
	en <= '1' ;
	P <= SHIFT_LEFT (to_signed(10, 16), 8);
	I <= SHIFT_LEFT (to_signed(5, 16), 8);
	speed_input <= to_signed(800, 16) ;
   -- Clock process definitions
   
	
	 uut: encoder_interface PORT MAP (
          clk => clk,
          reset => reset,
          channel_a => channel_a,
          channel_b => channel_b,
          period => period,
          reset_count => '0',
          count => count,
          pv => pv
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
		variable enc_period : time := 100 us ;
   begin		
      -- hold reset state for 100 ns.
		reset <= '1' ;
		channel_a <= '0' ;
		channel_b <= '0' ;
		reset_count <= '0' ;
      wait for 100 ns;	
		reset <= '0' ;
      wait for clk_period*10;
		for i in 0 to 10_000_000 loop
			channel_a <= '1' ;
			channel_b <= '0' ;
			wait for enc_period/4;
			channel_b <= '1' ;
			wait for enc_period/4;
			channel_a <= '0' ;
			wait for enc_period/4;
			channel_b <= '0' ;
			wait for enc_period/4;
			if conv_integer(command) > 0 then
				enc_period := enc_period_min*(conv_integer(command));
			end if ;
		end loop ;
		
		for i in 0 to 10 loop
			channel_a <= '0' ;
			channel_b <= '1' ;
			wait for enc_period/4;
			channel_a <= '1' ;
			wait for enc_period/4;
			channel_b <= '0' ;
			wait for enc_period/4;
			channel_a <= '0' ;
			wait for enc_period/4;
		end loop ;

      -- insert stimulus here 

      wait;
   end process;

END;
