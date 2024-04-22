------------------------------------------------------------
-- emulate keypresses to start program after loading
-- 
-- Copyright (c) 2018 by Bert Lange
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
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity auto_start is
    generic
    (
        clk_frequency   : natural := 4000000
    );
    port
    (
        clk             : in    std_logic;
        enable          : in    std_logic;
        --
        autostart_addr  : in    std_logic_vector(15 downto 0);
        autostart_en    : in    std_logic;    -- start signal
        -- emulated keypresses
        active          : out   std_logic;
        ascii           : out   std_logic_vector( 7 downto 0);
        ascii_press     : out   std_logic;
        ascii_release   : out   std_logic
    );
end entity auto_start;


architecture rtl of auto_start is

    -- time for keypress (in ms) and break
    constant key_counter_max   : natural := 50 * clk_frequency / 1000 - 1;
    constant break_counter_max : natural := 50 * clk_frequency / 1000 - 1;

    -- helper function, convert unsigned to hex character
    function to_hex( val: std_logic_vector( 3 downto 0)) return character is
        variable result : character;
    begin
        case to_integer( unsigned( val)) is
            when  0 => result := '0';
            when  1 => result := '1';
            when  2 => result := '2';
            when  3 => result := '3';
            when  4 => result := '4';
            when  5 => result := '5';
            when  6 => result := '6';
            when  7 => result := '7';
            when  8 => result := '8';
            when  9 => result := '9';
            when 10 => result := 'A';
            when 11 => result := 'B';
            when 12 => result := 'C';
            when 13 => result := 'D';
            when 14 => result := 'E';
            when 15 => result := 'F';
            when others => result := '#';
        end case;
        return result;
    end function to_hex;

    type state_t is ( IDLE, JUMP, SPACE, ADDR_NIBBLE_3, ADDR_NIBBLE_2, ADDR_NIBBLE_1, ADDR_NIBBLE_0, ENTER, READY);
    type reg_t is record
        state           : state_t;
        active          : std_logic;
        key             : character;
        key_press       : std_logic;
        key_release     : std_logic;
        key_counter     : natural range 0 to key_counter_max;
        break_counter   : natural range 0 to break_counter_max;
        nextkey         : std_logic;
    end record;

    constant default_reg : reg_t :=
    (
        state           => IDLE,
        active          => '0',
        key             => NUL,
        key_press       => '0',
        key_release     => '0',
        key_counter     => 0,
        break_counter   => 0,
        nextkey         => '0'
    );

    signal  r   : reg_t := default_reg;
    signal  r_in: reg_t;


begin

    comb: process( r, enable, autostart_en, autostart_addr)
        variable v: reg_t;
    begin
        v := r;

        -- outputs
        active          <= v.active;
        ascii           <= std_logic_vector( to_unsigned( character'pos( v.key), ascii'length));
        ascii_press     <= v.key_press;
        ascii_release   <= v.key_release;

        -- defaults
        v.key_release   := '0';
        v.nextkey       := '0';


        -- maintain break counter
        if v.break_counter = 1 then
            v.nextkey       := '1';
        end if;
        if v.break_counter > 0 then
            v.break_counter := v.break_counter - 1;
        end if;


        -- maintain key counter
        if v.key_counter = 1 then
            v.key_release   := '1';
            v.break_counter := break_counter_max;
        end if;
        if v.key_counter > 0 then
            v.key_counter   := v.key_counter - 1;
        end if;

        -- start timer
        if v.key_press = '1' then
            v.key_press     := '0';
            v.key_counter   := key_counter_max;
        end if;

        case v.state is

            when IDLE => 
                if enable = '1' and autostart_en = '1' then
                    v.active        := '1';
                    v.break_counter := break_counter_max;
                    v.state         := JUMP;
                end if;

            when JUMP =>
                if v.nextkey = '1' then
                    v.key       := 'J';
                    v.key_press := '1';
                    v.state     := SPACE;
                end if;

            when SPACE =>
                if v.nextkey = '1' then
                    v.key       := ' ';
                    v.key_press := '1';
                    v.state     := ADDR_NIBBLE_3;
                end if;

            when ADDR_NIBBLE_3 =>
                if v.nextkey = '1' then
                    v.key       := to_hex( autostart_addr( 15 downto 12));
                    v.key_press := '1';
                    v.state     := ADDR_NIBBLE_2;
                end if;

            when ADDR_NIBBLE_2 =>
                if v.nextkey = '1' then
                    v.key       := to_hex( autostart_addr( 11 downto  8));
                    v.key_press := '1';
                    v.state     := ADDR_NIBBLE_1;
                end if;

            when ADDR_NIBBLE_1 =>
                if v.nextkey = '1' then
                    v.key       := to_hex( autostart_addr(  7 downto  4));
                    v.key_press := '1';
                    v.state     := ADDR_NIBBLE_0;
                end if;

            when ADDR_NIBBLE_0 =>
                if v.nextkey = '1' then
                    v.key       := to_hex( autostart_addr(  3 downto  0));
                    v.key_press := '1';
                    v.state     := ENTER;
                end if;

            when ENTER =>
                if v.nextkey = '1' then
                    v.key       := CR;
                    v.key_press := '1';
                    v.state     := READY;
                end if;

            when READY =>
                if v.nextkey = '1' then
                    v.active    := '0';
                    v.state     := IDLE;
                end if;

        end case;

        r_in <= v;
    end process;


    seq: process
    begin
        wait until rising_edge( clk);
        r <= r_in;
    end process;


end architecture rtl;
