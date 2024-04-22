-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2017 by Peter Wendrich (pwsoft@syntiac.com)
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
-- Joystick autofire logic
--
-- -----------------------------------------------------------------------
-- autofire_period - Number of micro-seconds between toggling of output.
--                   Autofire rate in Hz is 1000000/(2*autofire_period)
-- -----------------------------------------------------------------------
-- clk        - system clock input
-- ena_1mhz   - Enable must be high for one clk cycle each microsecond
-- button_n   - Fire button input from joystick (low active)
-- autofire_n - Auto-fire outout (low active)
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon_autofire is
	generic (
		autofire_period : integer := 75000
	);
	port (
		clk : in std_logic;
		ena_1mhz : in std_logic;

		button_n : in std_logic;
		autofire_n : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon_autofire is
	signal counter : integer range 0 to autofire_period;
	signal autofire_reg : std_logic := '1';
begin
	autofire_n <= autofire_reg;

	process(clk)
	begin
		if rising_edge(clk) then
			if button_n = '1' then
				counter <= 0;
				autofire_reg <= '1';
			elsif counter = 0 then
				counter <= autofire_period;
				autofire_reg <= not autofire_reg;
			elsif ena_1mhz = '1' then
				counter <= counter - 1;
			end if;
		end if;
	end process;
end architecture;

