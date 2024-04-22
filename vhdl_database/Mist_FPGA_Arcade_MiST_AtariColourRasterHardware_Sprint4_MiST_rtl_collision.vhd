-- Collision detection logic for for Atari Sprint 4
-- This works by comparing the video signals representing cars and playfield objects generating 
-- collision signals when multiple objects appear at the same time (location) in the video.  
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

entity collision_detect is 
port(		
			Clk6						: in	std_logic;
			Car_n						: in  std_logic_vector(4 downto 1);
			Playfield_n				: in  std_logic;
			CollisionReset_n		: in  std_logic_vector(4 downto 1);
			Collision_n				: buffer std_logic_vector(4 downto 1)
			);
end collision_detect;

architecture rtl of collision_detect is

begin
	
-- 74LS279 quad SR latch at L11, all inputs are active low
H6: process(Clk6, Car_n, Playfield_n, CollisionReset_n, Collision_n)
begin
	if rising_edge(Clk6) then
-- Units 1 and 3 each have an extra Set element but these are not used in this game
-- Ordered from top to bottom as drawn in the schematic
		if CollisionReset_n(1) = '0' then
			Collision_n(1) <= '0';
		elsif (Car_n(1) or Playfield_n) = '0' then 
			Collision_n(1) <= '1';
		else
			Collision_n(1) <= Collision_n(1);
		end if;
		if CollisionReset_n(2) = '0' then
			Collision_n(2) <= '0';
		elsif (Car_n(2) or Playfield_n) = '0' then 
			Collision_n(2) <= '1';
		else
			Collision_n(2) <= Collision_n(2);
		end if;
		if CollisionReset_n(4) = '0' then
			Collision_n(4) <= '0';
		elsif (Car_n(4) or Playfield_n) = '0' then 
			Collision_n(4) <= '1';
		else
			Collision_n(4) <= Collision_n(4);
		end if;
		if CollisionReset_n(3) = '0' then
			Collision_n(3) <= '0';
		elsif (Car_n(3) or Playfield_n) = '0' then 
			Collision_n(3) <= '1';
		else
			Collision_n(3) <= Collision_n(3);
		end if;
	end if;
end process;

end rtl;