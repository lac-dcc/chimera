-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2023 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/chameleon.html
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
-- Testbench support routines and constants
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

package test_bench_pkg is
	function tohex(value : in unsigned) return string;
end package;

-- -----------------------------------------------------------------------

package body test_bench_pkg is
	function tohex(value : in unsigned) return string is
		constant hex_digits : string(1 to 16) := "0123456789ABCDEF";
		variable input : unsigned(value'high downto value'low);
		variable rlen : integer;
		variable output : string(1 to 32) := (others => '0');
	begin
		input := value;
		rlen := value'length / 4;
		for i in output'range loop
			if i <= rlen then
				output(i) := hex_digits(to_integer(input(input'high-(i-1)*4 downto input'high-(i*4-1))) + 1);
			end if;
		end loop;

		return output(1 to rlen);
	end function;
end package body;
