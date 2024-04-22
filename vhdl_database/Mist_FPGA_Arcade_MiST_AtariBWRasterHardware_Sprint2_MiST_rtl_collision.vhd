-- Collision detection logic for for Kee Games Sprint 2
-- This is called the "Car/Playfield Comparator" in the manual and works by comparing the
-- video signals representing player and computer cars, track boundaries and oil slicks generating 
-- collision signals when multiple objects appear at the same time (location) in the video. 
-- Car 1 and Car 2 are human players, Car 3 and Car 4 are computer controlled. 
--
-- NOTE: There is an error in the original schematic, F8 pin 5 should go to CAR1 (not inverted) and 
-- F8 pin 9 to CAR2 (not inverted) while the schematic shows them connecting to the inverted signals
-- 
-- Tests for the following conditions:
-- Car 1 equals Car 2
-- Car 1 equals Car 3 or 4
-- Car 2 equals Car 3 or 4
-- Car 1 equals Black Playfield (Oil slick)
-- Car 2 equals Black Playfield (Oil slick)
-- Car 1 equals White Playfield (Track boundary)
-- Car 2 equals White Playfield (Track boundary)
--
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity collision_detect is 
port(		
			Clk6					: in	std_logic;
			Car1					: in  std_logic;
			Car1_n				: in  std_logic;
			Car2					: in	std_logic;
			Car2_n				: in	std_logic;
			Car3_4_n				: in	std_logic;
			WhitePF_n			: in  std_logic;
			BlackPF_n			: in	std_logic;
			CollRst1_n			: in  std_logic;
			CollRst2_n			: in  std_logic;
			Collisions1			: out std_logic_vector(1 downto 0);
			Collisions2			: out std_logic_vector(1 downto 0)
			);
end collision_detect;

architecture rtl of collision_detect is

signal Col_latch_Q		: std_logic_vector(4 downto 1) := (others => '0');
signal S1_n					: std_logic_vector(4 downto 1);
signal S2_n					: std_logic_vector(4 downto 1);
signal R_n					: std_logic_vector(4 downto 1);


begin

-- Tristate buffers at E5 and E6 route collision signals to data bus 7-6
Collisions1 <= Col_latch_Q(2 downto 1);
Collisions2 <= Col_latch_Q(4 downto 3);
	
-- 74LS279 quad SR latch at H6, all inputs are active low
-- These should probably be written as synchronous latches
H6: process(Clk6, S1_n, S2_n, R_n, Col_latch_Q)
begin
	if rising_edge(Clk6) then
-- Units 1 and 3 each have an extra Set element
-- Ordered from top to bottom as drawn in the schematic
		if R_n(1) = '0' then
			Col_latch_Q(1) <= '0';
		elsif (S1_n(1) and S2_n(1)) = '0' then 
			Col_latch_Q(1) <= '1';
		else
			Col_latch_Q(1) <= Col_latch_Q(1);
		end if;
		if R_n(2) = '0' then
			Col_latch_Q(2) <= '0';
		elsif S1_n(2) = '0' then 
			Col_latch_Q(2) <= '1';
		else
			Col_latch_Q(2) <= Col_latch_Q(2);
		end if;
		if R_n(4) = '0' then
			Col_latch_Q(4) <= '0';
		elsif S1_n(4) = '0' then 
			Col_latch_Q(4) <= '1';
		else
			Col_latch_Q(4) <= Col_latch_Q(4);
		end if;
		if R_n(3) = '0' then
			Col_latch_Q(3) <= '0';
		elsif (S1_n(3) and S2_n(3)) = '0' then 
			Col_latch_Q(3) <= '1';
		else
			Col_latch_Q(3) <= Col_latch_Q(3);
		end if;
	end if;
end process;	

-- Glue logic	
S2_n(1) <= BlackPF_n or Car1_n;
S1_n(1) <= Car1 nand (Car2_n nand Car3_4_n);
R_n(1) <= CollRst1_n; 

R_n(2) <= CollRst1_n; 
S1_n(2) <= Car1_n or WhitePF_n;

R_n(4) <= CollRst2_n;
S1_n(4) <= Car2_n or WhitePF_n; 

S2_n(3) <= BlackPF_n or Car2_n;
S1_n(3) <= Car2 nand (Car1_n nand Car3_4_n);
R_n(3) <= CollRst2_n; 

end rtl;