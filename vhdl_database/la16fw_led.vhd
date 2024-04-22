--
-- This file is part of the la16fw project.
--
-- Copyright (C) 2014-2015 Gregor Anich
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
--

----------------------------------------------------------------------------------
--
-- makes the led blink according to the led_brightness value
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity led is
    port(
        clk        : in std_logic; -- system clock (48MHz)
        tick_1M    : in std_logic; -- 1MHz tick
        reset      : in std_logic; -- reset (sync)
        brightness : in std_logic_vector(7 downto 0); -- led pwm value
        invert     : in std_logic; -- invert output
        led        : out std_logic -- led output
    );
end led;


architecture behavioral of led is

    signal count : unsigned(7 downto 0); --pwm counter
    signal led_int : std_logic;

begin

    process(clk)
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                count <= (others=>'0'); --clear counter
                led_int <= '0'; --turn off led
            elsif (tick_1M = '1') then
                --increment counter
                count <= count + 1;
                --update led
                if (count = unsigned(brightness)) then
                    led_int <= '1';
                elsif (count = 0) then
                    led_int <= '0';
                end if;
            end if;
        end if;
    end process;
    led <= led_int xor invert;
    
end behavioral;
