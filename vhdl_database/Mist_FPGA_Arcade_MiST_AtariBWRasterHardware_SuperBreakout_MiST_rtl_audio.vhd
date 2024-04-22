-- Audio for Super Breakout
-- This is a very simple circuit, tones are created by gating signals from the vertical scan counter
-- Original hardware used resistors to mix the tones, here we are mixing them digitally and using a delta-sigma
-- DAC to produce audio on a single pin
-- (c) 2017 James Sweet
--
-- This is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- This is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity audio is 
port(		
			Reset_n		: in	std_logic;
			Tones_n		: in	std_logic;
			Display		: in	std_logic_vector(3 downto 0);
			VCount		: in  std_logic_vector(7 downto 0);
			Audio_PWM	: out std_logic_vector(7 downto 0));
end audio;

architecture rtl of audio is

signal reset		: std_logic;
signal V32				: std_logic;
signal V16				: std_logic;
signal V8				: std_logic;
signal V4				: std_logic;
signal tone_V4		: std_logic;
signal tone_V8 	: std_logic;
signal tone_V16	: std_logic;
signal tone_V32	: std_logic;
signal tone_reg 	: std_logic_vector(3 downto 0);

begin

reset <= (not reset_n);

V32 <= Vcount(5);
V16 <= Vcount(4);
V8 <= Vcount(3);
V4 <= Vcount(2);

C4: process(tones_n, V4, V8, V16, V32, display) is
begin
	if tones_n <= '0' then
		tone_reg <= display;
	end if;
end process;

tone_V4 <= tone_reg(0) and V4;
tone_V8 <= tone_reg(1) and V8;
tone_V16 <= tone_reg(2) and V16;
tone_V32 <= tone_reg(3) and V32;

Audio_PWM <= tone_V4 & '0' & tone_V8 & '0' & tone_V16 & '0' & tone_V32 & '0';


end rtl;