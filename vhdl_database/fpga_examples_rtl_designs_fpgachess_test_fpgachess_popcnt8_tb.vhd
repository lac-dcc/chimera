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
-- Test for popcnt8
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity fpgachess_popcnt8_tb is
end entity;

-- -----------------------------------------------------------------------

architecture tb of fpgachess_popcnt8_tb is
	signal data : unsigned(7 downto 0);
	signal dut_popcnt : unsigned(3 downto 0);
	signal loop_popcnt : unsigned(3 downto 0);
begin
	dut_inst : entity work.fpgachess_popcnt8
		port map (
			d => data,
			q => dut_popcnt
		);

	process(data)
		variable sum : unsigned(3 downto 0);
	begin
		sum := (others => '0');
		for i in 0 to 7 loop
			if data(i) = '1' then
				sum := sum + 1;
			end if;
		end loop;
		loop_popcnt <= sum;
	end process;

	process
	begin
		for i in 0 to 255 loop
			data <= to_unsigned(i,8);
			assert(dut_popcnt = loop_popcnt);
			wait for 1ns;
		end loop;
		wait;
	end process;

end architecture;