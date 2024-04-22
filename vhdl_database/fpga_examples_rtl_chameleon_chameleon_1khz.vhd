-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2011 by Peter Wendrich (pwsoft@syntiac.com)
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
-- 1 Khz clock source
--
-- -----------------------------------------------------------------------
-- clk      - system clock input
-- ena_1mhz - 1 Mhz input, signal must be one cycle high each micro-second.
-- ena_1khz - 1 Khz output. Signal is one cycle '1' each 1 millisecond.
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon_1khz is
	port (
		clk : in std_logic;
		ena_1mhz : in std_logic;

		ena_1khz : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon_1khz is
	constant reset_count : integer := 1025 - 1000;
	signal cnt : unsigned(10 downto 0) := (others => '0');

	signal ena_out : std_logic := '0';
begin
	ena_1khz <= ena_out;

	process(clk)
	begin
		if rising_edge(clk) then
			ena_out <= '0';
			if ena_1mhz = '1' then
				ena_out <= cnt(cnt'high);
				if cnt(cnt'high) = '1' then
					cnt <= to_unsigned(reset_count, cnt'length);
				else
					cnt <= cnt + 1;
				end if;
			end if;
		end if;
	end process;
end architecture;
