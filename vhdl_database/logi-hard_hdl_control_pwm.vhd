

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
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:57:26 04/20/2013 
-- Design Name: 
-- Module Name:    pwm - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 6 
-- Tool versions: ISE 14.1 
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


library work ;
use work.control_pack.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm is
generic(NB_CHANNEL : positive := 3);
port(
	clk, resetn : in std_logic ;
	divider : in std_logic_vector(15 downto 0);
	period : in std_logic_vector(15 downto 0);
	pulse_width : in slv16_array(0 to NB_CHANNEL-1) ;
	pwm : out std_logic_vector(0 to NB_CHANNEL-1) 
);
end pwm;

architecture Behavioral of pwm is
 signal end_div : std_logic ;
 signal divider_counter, period_counter: std_logic_vector(15 downto 0);
 signal period_q : std_logic_vector(15 downto 0);
 signal pulse_width_q : slv16_array(0 to NB_CHANNEL-1);
 signal en_period_count : std_logic ;
 signal pwm_d : std_logic_vector(0 to NB_CHANNEL-1) ;
begin

process(clk, resetn)
begin
	if resetn = '0' then	
		divider_counter <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if divider_counter = 0 then
			divider_counter <= divider ;
		else
			divider_counter <= divider_counter - 1 ;
		end if ;
	end if ;
end process ;

en_period_count <= '1' when divider_counter = 0 else
						 '0' ;

process(clk, resetn)
begin
	if resetn = '0' then	
		period_q <= (others => '0');
		pulse_width_q <= (others => (others => '0'));
	elsif clk'event and clk = '1' then
		if period_counter = 0 then
			period_q <= period ;
			pulse_width_q <= pulse_width ;
		end if ;
	end if ;
end process ;

process(clk, resetn)
begin
	if resetn = '0' then	
		period_counter <= (others => '0');
	elsif clk'event and clk = '1' then
		if en_period_count = '1' then
			if period_counter = period_q then
				period_counter <= (others => '0');
			else
				period_counter <= period_counter + 1 ;
			end if ;
		end if ;
	end if ;
end process ;

gen_outs : for i in 0 to NB_CHANNEL-1 generate
	pwm_d(i) <= '1' when period_counter < pulse_width_q(i) else
				   '0' ;
	process(clk, resetn)
	begin
		if resetn = '0' then	
			pwm(i) <= '0';
		elsif clk'event and clk = '1' then
			pwm(i) <= pwm_d(i) ;
		end if ;
	end process ;
end generate ;


end Behavioral;

