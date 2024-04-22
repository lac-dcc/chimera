-- -----------------------------------------------------------------------
--
-- FPGA-Chess
--
-- Chess game engine for programmable logic devices
--
-- -----------------------------------------------------------------------
-- Copyright 2022-2023 by Peter Wendrich (pwsoft@syntiac.com)
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
-- Part of FPGA-Chess
-- Population count for 8 bits (counts number of bits set)
-- Doing it the naive way with an addition loop makes the logic
-- too big. Using the LUTs as lookup tables in groups of 4 bits is better.
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity fpgachess_popcnt8 is
	port (
		d : in unsigned(7 downto 0);
		q : out unsigned(3 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of fpgachess_popcnt8 is
	type lookup_t is array(0 to 15) of unsigned(2 downto 0);
	constant lookup : lookup_t := (
		"000", "001", "001", "010", "001", "010", "010", "011",
		"001", "010", "010", "011", "010", "011", "011", "100");
	signal sum74 : unsigned(2 downto 0) := (others => '0');
	signal sum30 : unsigned(2 downto 0) := (others => '0');
begin
	sum74 <= lookup(to_integer(d(7 downto 4)));
	sum30 <= lookup(to_integer(d(3 downto 0)));
	q <= ("0" & sum74) + ("0" & sum30);
end architecture;