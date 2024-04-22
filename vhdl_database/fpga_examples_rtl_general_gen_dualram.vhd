-- -----------------------------------------------------------------------
--
-- Syntiac's generic VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2009 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
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
-- gen_dualram.vhd
--
-- -----------------------------------------------------------------------
--
-- Full dual port ram: Two read/write ports
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_dualram is
	generic (
		dWidth : integer := 8;
		aWidth : integer := 10
	);
	port (
		clk : in std_logic;

		wePortA : in std_logic;
		aPortA : in unsigned((aWidth-1) downto 0);
		dPortA : in unsigned((dWidth-1) downto 0);
		qPortA : out unsigned((dWidth-1) downto 0);

		wePortB : in std_logic;
		aPortB : in unsigned((aWidth-1) downto 0);
		dPortB : in unsigned((dWidth-1) downto 0);
		qPortB : out unsigned((dWidth-1) downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_dualram is
	subtype addressRange is integer range 0 to ((2**aWidth)-1);
	type ramDef is array(addressRange) of unsigned((dWidth-1) downto 0);
	signal ram: ramDef;
begin
	-- PORT A
	process(clk)
	begin
		if rising_edge(clk) then
			if wePortA = '1' then
				ram(to_integer(aPortA)) <= dPortA;
			end if;
			qPortA <= ram(to_integer(aPortA));
		end if;
	end process;

	-- PORT B
	process(clk)
	begin
		if rising_edge(clk) then
			if wePortB = '1' then
				ram(to_integer(aPortB)) <= dPortB;
			end if;
			qPortB <= ram(to_integer(aPortB));
		end if;
	end process;
end architecture;
