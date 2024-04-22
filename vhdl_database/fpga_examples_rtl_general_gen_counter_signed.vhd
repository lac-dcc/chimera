-- -----------------------------------------------------------------------
--
-- Syntiac's generic VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2010 by Peter Wendrich (pwsoft@syntiac.com)
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
-- gen_counter.vhd
--
-- -----------------------------------------------------------------------
--
-- Loadable Up/Down Counter
--
-- -----------------------------------------------------------------------
-- clk   - clock input
-- reset - reset counter to 0
-- load  - Load counter from d input
-- up    - Count up
-- down  - Count down
-- d     - input for load
-- q     - counter output
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_counter_signed is
	generic (
		width : integer := 8
	);
	port (
		clk : in std_logic;
		reset : in std_logic := '0';
		load : in std_logic := '0';
		up : in std_logic := '0';
		down : in std_logic := '0';

		d : in signed(width-1 downto 0) := (others => '0');
		q : out signed(width-1 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_counter_signed is
	signal qReg : signed(d'range) := (others => '0');
begin
	q <= qReg;

	process(clk) is
	begin
		if rising_edge(clk) then
			if reset = '1' then
				qReg <= (others => '0');
			elsif load = '1' then
				qReg <= d;
			elsif (up = '1') and (down = '0') then
				qReg <= qReg + 1;
			elsif (up = '0') and (down = '1') then
				qReg <= qReg - 1;
			end if;			
		end if;
	end process;
end architecture;




