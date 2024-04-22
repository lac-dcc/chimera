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
-- 1 Mhz clock source
--
-- -----------------------------------------------------------------------
-- clk      - system clock input
-- ena_1mhz - 1 Mhz output. Signal is one cycle '1' each micro-second.
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon_1mhz is
	generic (
		-- Timer calibration. Clock speed in Mhz.
		clk_ticks_per_usec : integer
	);
	port (
		clk : in std_logic;

		ena_1mhz : out std_logic;
		ena_1mhz_2 : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon_1mhz is
	constant maxcount : integer := clk_ticks_per_usec-1;
	signal cnt : integer range 0 to maxcount := maxcount;
	signal ena_out : std_logic := '0';
	signal ena2_out : std_logic := '0';
begin
	ena_1mhz <= ena_out;
	ena_1mhz_2 <= ena2_out;

	process(clk)
	begin
		if rising_edge(clk) then
			ena_out <= '0';
			if cnt = 0 then
				cnt <= maxcount;
				ena_out <= '1';
			else
				cnt <= cnt - 1;
			end if;
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			ena2_out <= '0';
			if cnt = (maxcount / 2) then
				ena2_out <= '1';
			end if;
		end if;
	end process;
end architecture;
