-- -----------------------------------------------------------------------
--
-- Syntiac VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2009 by Peter Wendrich (pwsoft@syntiac.com)
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
-- Button debounce routine with detection of short and long presses.
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_button is
	generic (
		pressed_polarity : std_logic := '1';
		short_press_ms : integer := 50;
		long_press_ms : integer := 700
	);
	port (
		clk : in std_logic;
		ena_1khz : in std_logic;

		button : in std_logic;
		keyboard : in std_logic;
		short_trig : out std_logic;
		long_trig : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_button is
	signal cnt : integer range 0 to long_press_ms;
	signal dly1 : std_logic;
	signal dly2 : std_logic;
	signal short_reg : std_logic := '0';
	signal long_reg : std_logic := '0';
begin
	assert(short_press_ms < long_press_ms);

	short_trig <= short_reg;
	long_trig <= long_reg;

	-- Syncronise button to clock (double registered for async inputs)
	process(clk)
	begin
		if rising_edge(clk) then
			dly1 <= button;
			dly2 <= dly1;
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			short_reg <= '0';
			long_reg <= '0';
			if (keyboard = '1') or (dly2 = pressed_polarity) then
				if ena_1khz = '1'then
					if cnt /= long_press_ms then
						cnt <= cnt + 1;
					end if;
				end if;
			else
				if cnt = long_press_ms then
					long_reg <= '1';
				elsif cnt >= short_press_ms then
					short_reg <= '1';
				end if;
				cnt <= 0;
			end if;
		end if;
	end process;
end architecture;
