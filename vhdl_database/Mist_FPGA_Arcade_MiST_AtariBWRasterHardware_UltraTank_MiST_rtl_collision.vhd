-- Collision detection logic for for Kee Games Ultra Tank
-- This is called the "Tank/Shell Comparator" in the manual and works by comparing the
-- video signals representing tanks, shells and playfield objects generating 
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
			Clk6					: in	std_logic;
			Adr					: in  std_logic_vector(2 downto 0);
			Object_n				: in  std_logic_vector(4 downto 1);
			Playfield_n			: in  std_logic;
			CollisionReset_n	: in  std_logic_vector(4 downto 1);
			Slam_n				: in  std_logic; -- Slam switch is read by collision detection mux
			Collision_n			: out std_logic
			);
end collision_detect;

architecture rtl of collision_detect is

signal Col_latch_Q		: std_logic_vector(4 downto 1) := (others => '0');
signal S1_n					: std_logic_vector(4 downto 1);
signal R_n					: std_logic_vector(4 downto 1);


begin

-- Glue logic  - This can be re-written to incorporate into the latch process
R_n <= CollisionReset_n;
S1_n(1) <= Object_n(1) or Playfield_n;
S1_n(2) <= Object_n(2) or Playfield_n;
S1_n(3) <= Object_n(3) or Playfield_n;
S1_n(4) <= Object_n(4) or Playfield_n;

	
-- 74LS279 quad SR latch at L11, all inputs are active low
H6: process(Clk6, S1_n, R_n, Col_latch_Q)
begin
	if rising_edge(Clk6) then
-- Units 1 and 3 each have an extra Set element but these are not used in this game
-- Ordered from top to bottom as drawn in the schematic
		if R_n(1) = '0' then
			Col_latch_Q(1) <= '0';
		elsif S1_n(1) = '0' then 
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
		elsif S1_n(3) = '0' then 
			Col_latch_Q(3) <= '1';
		else
			Col_latch_Q(3) <= Col_latch_Q(3);
		end if;
	end if;
end process;

-- 9312 Data Selector/Multiplexer at L12
L12: process(Adr, Slam_n, Col_latch_Q)
begin
	case Adr(2 downto 0) is
		when "000" => Collision_n <= '1';
		when "001" => Collision_n <= Col_latch_Q(1);
		when "010" => Collision_n <= '1';
		when "011" => Collision_n <= Col_latch_Q(2);
		when "100" => Collision_n <= '1';
		when "101" => Collision_n <= Col_latch_Q(3);
		when "110" => Collision_n <= Slam_n;
		when "111" => Collision_n <= Col_latch_Q(4);
		when others => Collision_n <= '1';
	end case;
end process;	

end rtl;