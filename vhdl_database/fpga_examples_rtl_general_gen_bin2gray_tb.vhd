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
-- gen_bin2gray_tb.vhd
--
-- -----------------------------------------------------------------------
--
-- Testbench for binary to gray-code converter
--
-- -----------------------------------------------------------------------

library IEEE;
use STD.textio.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_bin2gray_tb is
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_bin2gray_tb is
	signal d : unsigned(3 downto 0);
	signal q : unsigned(3 downto 0);

begin
	myBin2Gray : entity work.gen_bin2gray
		port map (
			d => d,
			q => q
		);

	process
	begin
		d <= "0000";
		wait for 1 ns;
		assert(q = "0000");
		
		d <= "0001";
		wait for 1 ns;
		assert(q = "0001");

		d <= "0010";
		wait for 1 ns;
		assert(q = "0011");

		d <= "0011";
		wait for 1 ns;
		assert(q = "0010");

		d <= "0110";
		wait for 1 ns;
		assert(q = "0101");

		d <= "1100";
		wait for 1 ns;
--		write(output, integer'image(to_integer(q)));
		assert(q = "1010");
		wait;
	end process;

end architecture;


