-- Draws vectors. Gets relative x and y directions and scale, and use these
-- to draw a vector from the starting point. It's supposed to be a workalike
-- for the Atari AVGs analog stuff plus timers plus normalizer, but this 
-- implementation differs from it quite a bit. If anything it means the timing
-- probably is way off... hope the software doesn't mind.

-- ToDo: implement something that's a bit closer to reality...
-- ToDo: blank when not actively moving


-- Black Widow arcade hardware implemented in an FPGA
-- (C) 2012 Jeroen Domburg (jeroen AT spritesmods.com)
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--use ieee_proposed.math_utility_pkg.all;
--use ieee_proposed.fixed_pkg.all;


entity vector_drawer is
    Port ( clk : in  STD_LOGIC;
			  clk_ena: in STD_LOGIC;
           scale : in  STD_LOGIC_VECTOR (12 downto 0);
           rel_x : in  STD_LOGIC_VECTOR (12 downto 0);
           rel_y : in  STD_LOGIC_VECTOR (12 downto 0);
			  zero: in STD_LOGIC;
           draw : in  STD_LOGIC;
			  done : out STD_LOGIC;
           xout : out  STD_LOGIC_VECTOR (9 downto 0);
           yout : out  STD_LOGIC_VECTOR (9 downto 0)
	 );
end vector_drawer;

architecture Behavioral of vector_drawer is
	signal xpos: STD_LOGIC_VECTOR(25 downto 0);
	signal ypos: STD_LOGIC_VECTOR(25 downto 0);
	signal normrel_x : STD_LOGIC_VECTOR (12 downto 0);
   signal normrel_y : STD_LOGIC_VECTOR (12 downto 0);
	signal normscale : STD_LOGIC_VECTOR (12 downto 0);
	signal itsdone: std_logic;
	signal normsteps: STD_LOGIC_VECTOR(3 downto 0);
	signal timer: STD_LOGIC_VECTOR(16 downto 0);
begin
	process(clk)
	begin
		if clk'event and clk='1' then
			if zero='1' then
				xpos<=(others=>'0');
				ypos<=(others=>'0');
--				itsdone<='1';
				--Remain at (0,0) for a while to give the beam a chance to actually zero out.
				--Implemented by drawing a line with dx=dy=0.
				normsteps<="0000";
				normrel_x<=(others=>'0');
				normrel_y<=(others=>'0');
				timer<=(others=>'0');
				normscale<="0000010000000";
				itsdone<='0';
			elsif itsdone='1' then
				if draw='1' then 
					--restart drawing the vector
					itsdone<='0';
					normsteps<="1111";
					normrel_x<=rel_x;
					normrel_y<=rel_y;
					normscale<=scale;
					timer<=(others=>'0');
				end if;
			elsif normsteps/="0000" then
				--Normalize.
				if normrel_x(12)=normrel_x(11) and normrel_y(12)=normrel_y(11) then --and normscale(0)='0' then
					normsteps<=normsteps-"0001";
					normrel_x(12 downto 1)<=normrel_x(11 downto 0);
					normrel_x(0)<='0';
					normrel_y(12 downto 1)<=normrel_y(11 downto 0);
					normrel_y(0)<='0';
					normscale(11 downto 0)<=normscale(12 downto 1);
					normscale(12)<='0';
				else
					normsteps<="0000";
				end if;
			else 
				if timer(16 downto 4)>=normscale then
					itsdone<='1';
				else
					xpos<=xpos+sxt(normrel_x, xpos'length);
					ypos<=ypos+sxt(normrel_y, ypos'length);
					--timer<=timer+"00000000000000001";
					--timer<=timer+"00000000000000010";
					timer<=timer+"00000000000000100";
				end if;
			end if;
		end if;
	end process;
	done <= itsdone;
--	xout <= xpos(23 downto 14);
--	yout <= ypos(23 downto 14);
	xout <= xpos(22 downto 13);
	yout <= ypos(22 downto 13);
end Behavioral;

