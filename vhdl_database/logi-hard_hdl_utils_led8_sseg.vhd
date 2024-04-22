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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

library work ;

entity led8_sseg is

generic(
		  clock_freq_hz : natural := 50_000_000;
		  refresh_rate_hz : natural := 800
	 );
	 port 
	 (
		  clk      : in std_logic ;
		  reset    : in std_logic ;
		  led: in std_logic_vector(7 downto 0);
		  an : out std_logic_vector(4 downto 0); 
		  sseg_out : out std_logic_vector(7 downto 0) 
		  
	 );
end led8_sseg ;

architecture Behavioral of led8_sseg is

	constant clk_divider : positive := clock_freq_hz/(refresh_rate_hz*5);
	signal sseg0, sseg1, sseg2, sseg3, sseg_clk: std_logic_vector(7 downto 0);

	signal divider_counter : std_logic_vector(31 downto 0);
	signal divider_end : std_logic ;
	signal an_r : std_logic_vector(4 downto 0) := "00001";
	
	
begin

process(clk, reset)
begin
	if reset = '1' then
		divider_counter <= std_logic_vector(to_unsigned(clk_divider, 32));
	elsif clk'event and clk = '1' then
		if divider_counter = 0 then
			divider_counter <= std_logic_vector(to_unsigned(clk_divider, 32));
		else
			divider_counter <= divider_counter - 1 ;
		end if ;
	end if ;
end process ;
divider_end <= '1' when divider_counter = 0 else
					'0' ;

process(clk, reset)
begin
	if reset = '1' then
		an_r(4 downto 1) <= (others => '0');
	elsif clk'event and clk = '1' then
		if divider_end = '1' then
			an_r(4 downto 1) <= an_r(3 downto 0);
			an_r(0) <= an_r(4);
		end if ;
	end if ;
end process ;

with an_r select
	sseg_out <= sseg0 when 	"00001",
				sseg1 when 	"00010",
				sseg2 when	"00100",
				sseg3 when 	"01000",
				sseg_clk when 	"10000",
				(others => '0') when others ;
an <= an_r ;								 
					
-- --CONVERT THE LEDS TO THE 4X SEVEN SEGMENTS LED segements
with led(1 downto 0) select
		sseg0 <= "00000100" when "01", 
				"00010000"  when "10", 
				"00010100"  when "11", 
				"00000000"  when "00"; 
			
with led(3 downto 2) select
		sseg1 <= "00000100" when "01", 
				"00010000"  when "10", 
				"00010100"  when "11", 
				"00000000"  when "00"; 
with led(5 downto 4) select
		sseg2 <= "00000100" when "01", 
				"00010000"  when "10", 
				"00010100"  when "11", 
				"00000000"  when "00"; 
with led(7 downto 6) select
		sseg3 <= "00000100" when "01", 
				"00010000"  when "10", 
				"00010100"  when "11", 
				"00000000"  when "00"; 	
								 


end Behavioral;

