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
-- gen_filter.vhd
--
-- -----------------------------------------------------------------------
--
-- Signal filter to detect stable digital signal.
-- Output only changes when the input signal is stable for specified steps.
--
-- -----------------------------------------------------------------------
-- steps - filter steps
-- -----------------------------------------------------------------------
-- clk   - clock input
-- d     - signal input
-- q     - signal output
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_filter is
	generic (
		steps : integer := 4
	);
	port (
		clk : in std_logic;

		d : in std_logic;
		q : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_filter is
	signal shift_reg : unsigned(steps-1 downto 0) := (others => '0');
	signal q_reg : std_logic := '0';
begin
	q <= q_reg;

	process(clk)
	begin
		if rising_edge(clk) then
			shift_reg <= shift_reg(shift_reg'high-1 downto 0) & d;
			if shift_reg = 0 then
				q_reg <= '0';
			elsif (not shift_reg) = 0 then
				q_reg <= '1';
			end if;
		end if;
	end process;
end architecture;
