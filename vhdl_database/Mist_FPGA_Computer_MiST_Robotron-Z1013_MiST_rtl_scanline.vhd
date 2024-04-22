----------------------------------------------------------------------------------
-- add scanline effect
-- 
-- Copyright (c) 2017 by Bert Lange
-- https://github.com/boert/Z1013-mist
-- 
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity scanline is
    port
    (
        active      : in  std_logic;
        pixel_clock : in  std_logic;
        -- input signals
        red         : in  std_logic_vector( 5 downto 0);
        green       : in  std_logic_vector( 5 downto 0);
        blue        : in  std_logic_vector( 5 downto 0);
        hsync       : in  std_logic;
        vsync       : in  std_logic;
        -- output signals
        red_out     : out std_logic_vector( 5 downto 0);
        green_out   : out std_logic_vector( 5 downto 0);
        blue_out    : out std_logic_vector( 5 downto 0);
        hsync_out   : out std_logic;
        vsync_out   : out std_logic
    );
end entity scanline;


architecture rtl of scanline is

    signal toggle  : std_logic;
    signal hsync_1 : std_logic;

begin

    process
    begin
        wait until rising_edge( pixel_clock);
        if active = '1' then
            if vsync = '0' then
                toggle <= '0';
            else
                if hsync_1 = '0' and hsync = '1' then
                    toggle <= not toggle;
                end if;
            end if;
            if toggle = '1' then
                -- shift left
                red_out     <= '0' & red(   red'high   downto 1);
                green_out   <= '0' & green( green'high downto 1);
                blue_out    <= '0' & blue(  blue'high  downto 1);
            else
                -- pass thru
                red_out     <= red;
                green_out   <= green;
                blue_out    <= blue;
            end if;
        else
            -- pass thru
            red_out     <= red;
            green_out   <= green;
            blue_out    <= blue;
        end if;
        hsync_1     <= hsync;

        -- don't modify sync signals
        hsync_out   <= hsync;
        vsync_out   <= vsync;

    end process;

end architecture rtl;
