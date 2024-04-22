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
-- LED blinker. Blink frequency 2 Hz
--
-- -----------------------------------------------------------------------
-- clk       - system clock input
-- clk_1khz  - 1 Khz clock input
-- led_on    - if high the LED is on
-- led_blink - if high the LED is blinking
-- led       - led output (high is on) 2hz
-- led_1hz   - led output 1 hz
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon_led is
	port (
		clk : in std_logic;
		clk_1khz : in std_logic;
		
		led_on : in std_logic;
		led_blink : in std_logic;
		led : out std_logic;
		led_1hz : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon_led is
	signal count : unsigned(9 downto 0);
begin
	led <= count(8);
	led_1hz <= count(9);

	process(clk)
	begin
		if rising_edge(clk) then
			if clk_1khz = '1' then
				count <= count + 1;
			end if;
			if led_blink = '0' then
				count(8) <= led_on;
				count(9) <= led_on;
			end if;					
		end if;
	end process;
end architecture;
