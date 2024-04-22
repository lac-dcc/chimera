-- -----------------------------------------------------------------------
--
-- Syntiac's generic VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2012 by Peter Wendrich (pwsoft@syntiac.com)
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
-- gen_bin2gray.vhd
--
-- -----------------------------------------------------------------------
--
-- Convert binary to gray-code
--
-- -----------------------------------------------------------------------
-- d     - binary input
-- q     - gray-code output
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_bin2gray is
	generic (
		bits : integer := 4
	);
	port (
		d : in unsigned(bits-1 downto 0) := (others => '0');
		q : out unsigned(bits-1 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_bin2gray is
begin
	process(d)
	begin
		for i in 0 to bits-1 loop
			if i = (bits-1) then
				q(i) <= d(i);
			else
				q(i) <= d(i) xor d(i+1);
			end if;
		end loop;
	end process;
end architecture;

