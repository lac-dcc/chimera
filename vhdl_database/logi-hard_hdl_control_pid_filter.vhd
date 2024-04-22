

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
-- Create Date:    17:37:14 07/01/2013 
-- Design Name: 
-- Module Name:    pid_filter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.logi_utils_pack.all ;



-- inspired by http://crap.gforge.inria.fr/doc2.php
entity pid_filter is
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
end pid_filter;

architecture Behavioral of pid_filter is
constant tick_modulo : integer := (pid_period_ns/clk_period_ns)-1 ;

signal tick_count : std_logic_vector(nbit(tick_modulo)-1 downto 0);
signal cycle_count, cycle_count_old : std_logic_vector(1 downto 0);
signal en_cycle_counter : std_logic ;
signal reload : std_logic ;
signal acc, sum : signed(31 downto 0); 
signal mult_op : unsigned(31 downto 0);
signal op1, op2 : unsigned(15 downto 0);
signal mc, xn, xnn : signed(15 downto 0);

signal xn_sign, xnn_sign, mc_sign, sign, sign_latched : std_logic ;
signal latch_res : std_logic ;
begin



process(clk, resetn)
begin
	if resetn= '0' then
		tick_count <= std_logic_vector(to_unsigned(tick_modulo, nbit(tick_modulo)));
	elsif clk'event and clk='1' then
		if reload= '1' then
			tick_count <= std_logic_vector(to_unsigned(tick_modulo, nbit(tick_modulo)));
		else
			tick_count <= tick_count - 1 ;
		end if ;
	end if ;
end process ;

reload	<= '1' when tick_count = 0 else
				'0' ;

process(clk, resetn)
begin
	if resetn= '0' then
		cycle_count <=(others => '1');
		cycle_count_old <= (others => '0');
	elsif clk'event and clk='1' then
		if reload= '1' then
			cycle_count <=(others => '1');
		elsif en_cycle_counter = '1' then
			cycle_count <= cycle_count - 1 ;
		end if ;
		cycle_count_old <= cycle_count ;
	end if ;
end process ;

en_cycle_counter <= '1' when cycle_count /= 0 else
						  '0';
						
process(clk, resetn)
begin
	if resetn = '0' then
		mult_op <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if reload = '1' then
			mult_op <= (others => '0') ;
		else
			mult_op <= op1 * op2 ;
		end if ;
	end if ;
end process ;


sum <= (acc - signed(mult_op)) when sign_latched = '0' else
		 (acc + signed(mult_op)) ;
		 
process(clk, resetn)
begin
	if resetn = '0' then
		acc <= (others => '0') ;
		sign_latched <= '0' ;
	elsif clk'event and clk = '1' then
		if reload = '1' then
			acc <= (others => '0') ;
		else
			acc <=  sum;
		end if ;
		sign_latched <= sign ;
	end if ;
end process ;

-- sequence
-- 1) acc += K * xn
-- 2) acc -= AK * xn-1
-- 3) acc += B * mcn-1
-- 4) mcn = acc/1024


with cycle_count select 
op1 <= unsigned(K) when "11",
		 unsigned(AK) when "10",
		 unsigned(B) when "01",
		 (others => '0') when others;
		 
with cycle_count select 
op2 <= unsigned(abs(xn)) when "11",
		 unsigned(abs(xnn)) when "10",
		 unsigned(abs(mc)) when "01",
		 (others => '0') when others;

with cycle_count select 
sign <= xn_sign when "11",
		  (NOT xnn_sign) when "10",
		  mc_sign when "01",
		  '0' when others;

xn_sign <= '1' when xn > 0 else
			  '0' ;
xnn_sign <= '1' when xnn > 0 else
			  '0' ;
mc_sign <= '1' when mc > 0 else
			  '0' ;

process(clk, resetn)
begin
	if resetn = '0' then
		xnn <= (others => '0') ;
		xn <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if reload = '1' then
			xn <= setpoint - measure ;
			xnn <= xn ;
		end if ;
	end if ;
end process ;

latch_res <= '1' when cycle_count = 0 and cycle_count_old=1 else
				 '0' ;

process(clk, resetn)
begin
	if resetn = '0' then
		mc <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if latch_res = '1' then
			mc <= acc(25 downto 10) ;
		end if ;
	end if ;
end process ;

cmd <=  (others => '0') when en = '0' else
		  (not  std_logic_vector(mc)) when mc < 0 else
		  std_logic_vector(mc) ;
		  
dir <= '1' when mc < 0 else
		 '0' ;
		 
end Behavioral;

