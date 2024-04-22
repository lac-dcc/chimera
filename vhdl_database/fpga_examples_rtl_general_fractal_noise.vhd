-- -----------------------------------------------------------------------
--
-- Syntiac VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2010 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com
--
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <http://www.gnu.org/licenses/>.
--
-- -----------------------------------------------------------------------
--
-- A pseudo noise generator.
--
-- The relationship of input d to output q should be fairly random.
-- More input bits (dBits) improve the randomness. This can be a counter
-- or something dependend on (random) input.
-- For the same input it always generates the same output. So it can be
-- used as building block in a texture generator (e.g. perlin noise)
--
-- -----------------------------------------------------------------------
-- d  - input
-- q  - hashed / randomized output
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity fractal_noise is
	generic (
		dBits : integer := 24;
		qBits : integer := 24;
		-- Some extra bits guarding against early round-down.
		guardBits : integer := 4
	);
	port (
		d : in unsigned(dBits-1 downto 0);
		q : out unsigned(qBits-1 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of fractal_noise is
	signal xa : unsigned(q'high+guardBits downto 0);
	signal xb : unsigned(q'high+guardBits downto 0);
	signal xc : unsigned(q'high+guardBits downto 0);
	signal xd : unsigned(q'high+guardBits downto 0);
begin
	process(d) is
		variable ta : std_logic;
		variable tb : std_logic;
		variable tc : std_logic;
		variable td : std_logic;
	begin
		-- Generate 4 scrambled xor tables
		for i in 0 to xa'high loop
			ta := '0';
			tb := '1';
			tc := '0';
			td := '1';
			for j in 0 to d'high loop
				if ((i+j) mod 3) = 0 then
					ta := ta xor d(j);
				end if;
				if ((i+j) mod 5) = 0 then
					tb := tb xor d(j);
				end if;
				if ((i+j) mod 7) = 0 then
					tc := tc xor d(j);
				end if;
				if ((i+j) mod 11) = 0 then
					td := td xor d(j);
				end if;
			end loop;
			xa(i) <= ta;
			xb(i) <= tb;
			xc(i) <= tc;
			xd(i) <= td;
		end loop;
	end process;

	process(xa, xb, xc, xd) is
		variable xt : unsigned(xa'high downto 0);
	begin
		-- Add the 4 scrambled values together to create more randomness
		xt := xa + xb + xc + xd;

		-- Assign result to output
		q <= xt(xt'high downto guardBits);
	end process;
end architecture;

