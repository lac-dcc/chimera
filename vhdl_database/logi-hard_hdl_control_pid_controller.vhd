

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



----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    16:24:43 05/12/2013 
-- Design Name: 
-- Module Name:    pid_controller - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 6 Spartan 6 
-- Tool versions: ISE 14.1 ISE 14.1 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.utils_pack.all ;


-- gain are fixed point values 8 bit integer part, 8 bit fractionnal part
entity pid_controller is
	generic(CLK_PERIOD_NS : positive := 10; 
			  CTRL_PERIOD_NS : positive := 1000000; 
			  CMD_WIDTH : positive := 8;
			  CMD_OFFSET : positive := 127);
	port(clk, resetn : in std_logic ;
	     en, reset : in std_logic ;
		  speed_input : in signed(15 downto 0);
		  P, I, D : in signed(15 downto 0);
		  ENC_A : in std_logic ;
		  ENC_B : in std_logic ;
		  encoder_count : out signed(15 downto 0);
		  command : out std_logic_vector(CMD_WIDTH-1 downto 0)
	);

end pid_controller;

architecture Behavioral of pid_controller is
constant clk_tick_per_period : integer := CTRL_PERIOD_NS/CLK_PERIOD_NS;
constant command_max : integer := (2**command'length)-1 ;


signal clk_tick_counter : std_logic_vector(nbit(clk_tick_per_period) downto 0);
signal speed_input_latched, encoder_value, encoder_value_latched : signed(15 downto 0) ;
signal error, error_grad, error_sum, last_error : signed(15 downto 0) ;
signal error_sum_enlarged : signed(31 downto 0) ;
signal std_encoder_value : std_logic_vector(15 downto 0) ;
signal command_temp, command_offset : signed(31 downto 0);
signal P_contrib, I_contrib, D_contrib : signed(31 downto 0);
signal reset_encoder : std_logic ;
signal ENC_A_OLD, ENC_A_RE : std_logic ;
signal error_32, error_sum_32 : signed(31 downto 0);
begin
	process(clk, resetn)
	begin
		if resetn = '0' then
			ENC_A_OLD <= '0';
		elsif clk'event and clk = '1' then
			ENC_A_OLD <= ENC_A ;
		end if ;
	end process ;
	ENC_A_RE <= (ENC_A and (NOT ENC_A_OLD)) and  en;	
	
	encoder_chan0 : up_down_counter
	 generic map(NBIT => 16)
	 port map( clk => clk,
				  resetn => resetn,
				  sraz => reset_encoder,
				  en => ENC_A_RE ,  -- must detect rising edge
				  load => '0',
				  up_downn => ENC_B,
				  E => (others => '0'),
				  Q => std_encoder_value
				  );
	 encoder_value <= signed(std_encoder_value) ;
	 
	process(clk, resetn)
	begin
		if resetn = '0' then
			clk_tick_counter <= (others => '0');
		elsif clk'event and clk = '1' then
			if clk_tick_counter = clk_tick_per_period then
				clk_tick_counter <= (others => '0');
			else
				clk_tick_counter <= clk_tick_counter + 1 ;
			end if ;
		end if ;
	end process ;
	
	process(clk, resetn)
	begin
		if resetn = '0' then
			encoder_value_latched <= (others => '0');
			speed_input_latched <= (others => '0');
			last_error <= (others => '0');
		elsif clk'event and clk = '1' then
			if clk_tick_counter = clk_tick_per_period then
				encoder_value_latched <= encoder_value ;
				speed_input_latched <= speed_input ;
				last_error <= error ;
			end if ;
		end if ;
	end process ;
	reset_encoder <= '1' when clk_tick_counter = clk_tick_per_period else
						  '0' ;
						  
						  
	 error <= speed_input_latched - encoder_value_latched ;
	 -- derivative term
	 error_grad <= error - last_error ;
	 
	 error_32 <= RESIZE(error, 32) ;
	 error_sum_32 <= RESIZE(error_sum, 32) ;
	 
	 error_sum_enlarged <= error_sum_32 + error_32 ;
	 
	integral_term_latch:process(clk, resetn)
	begin
		if resetn = '0' then
			error_sum <= (others => '0');
		elsif clk'event and clk = '1' then
			if clk_tick_counter = 0 then
				if error_sum_enlarged > (2**15 - 1) then -- handling saturation
					error_sum <= X"7FFF" ; 
				elsif error_sum_enlarged < (-(2**15)) then
					error_sum <= X"8000" ; 
				else
					error_sum <= error_sum + error ; 
				end if ;
			end if ;
		end if ;
	end process ;
	
	contrib_latch :process(clk, resetn)
	begin
		if resetn = '0' then
			P_contrib <= (others => '0');
			I_contrib <= (others => '0');
			D_contrib <= (others => '0');
		elsif clk'event and clk = '1' then
			P_contrib <= P*error ;
			I_contrib <= I*error_sum ;
			D_contrib <= D*error_grad ;
		end if ;
	end process ;
	
	command_temp <= P_contrib + I_contrib + D_contrib ; -- need adder tree
	command_offset <= command_temp + to_signed((CMD_OFFSET*(2**16)), 32) ;
	command <= 	(others => '1') when command_offset(31 downto 16) > command_max else
					(others => '0') when command_offset(31 downto 16) < 0 else
					std_logic_vector(command_offset((15+CMD_WIDTH) downto 16));
	

end Behavioral;

