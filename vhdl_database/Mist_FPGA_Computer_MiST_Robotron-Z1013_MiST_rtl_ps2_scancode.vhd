----------------------------------------------------------------------------------
-- PS/2 keyboard data serial to parallel converter (Z1013 mist project)
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
use ieee.numeric_std.all;

entity ps2_scancode is
    port
    (
        clk            : in    std_ulogic;
        --             
        ps2_data       : in    std_logic;
        ps2_clock      : in    std_logic;
        --
        scancode       : out   std_logic_vector( 7 downto 0);
        scancode_en    : out   std_logic
    );
end entity ps2_scancode;

-- clock   data
-- 1       1       host is ready
-- 1       0       host signals sending
-- 0       1       host is busy
-- 0       0       host does reset
--
-- ATTN! here is a no complete PS/2
-- we only receive data from keyboard
--


architecture rtl of ps2_scancode is

    -- helper functions
    function falling_edge( value: std_logic_vector) return boolean is
    begin
        if value( value'high downto value'high - 1) = "10" then
            return true;
        end if;
        return false;
    end function falling_edge;

    function rising_edge( value: std_logic_vector) return boolean is
    begin
        if value( value'high downto value'high - 1) = "01" then
            return true;
        end if;
        return false;
    end function rising_edge;

    function msb( value: std_logic_vector) return std_logic is
    begin
        return value( value'high);
    end function msb;

    -- constants
    constant watchdog_max : natural := 4095;

    -- states
    type state_t is ( IDLE, DATA, PARITY, STOP, PROCESSING);

    -- registers
    type reg_t is record
        state       : state_t;
        watchdog    : natural range 0 to watchdog_max;
        -- input synchronizer
        data_in     : std_logic_vector( 2 downto 0);
        clock_in    : std_logic_vector( 2 downto 0);
        -- data shift reg, bit counter
        value       : std_logic_vector( 7 downto 0);
        parity      : std_logic;
        count       : natural range 0 to 7;
        -- data holding register
        result      : std_logic_vector( 7 downto 0);
        result_en   : std_logic;
    end record;
    constant default_reg_c : reg_t := 
    (
        state       => IDLE,
        watchdog    => 0,
        --
        data_in     => ( others => '1'),
        clock_in    => ( others => '1'),
        --
        value       => ( others => '0'),
        parity      => '0',
        count       => 0,
        --
        result      => ( others => '0'),
        result_en   => '0'
    );

    signal r    : reg_t := default_reg_c;
    signal r_in : reg_t := default_reg_c;

begin

    comb: process( r, ps2_data, ps2_clock)
        variable v : reg_t;
    begin
        v := r;

        -- output
        scancode       <= v.result;
        scancode_en    <= v.result_en;

        -- defaults
        v.result_en := '0';

        if v.watchdog > 0 then
            v.watchdog := v.watchdog - 1;
        else
            v.state := IDLE;
        end if;

        -- FSM
        case v.state is
            when IDLE =>
                if falling_edge( v.clock_in) then
                    -- check start bit
                    if msb( v.data_in) = '0' then
                        v.state  := DATA;    
                    end if;
                end if;
                v.parity   := '0';
                v.count    := 7;
                v.watchdog := watchdog_max;

            when DATA =>
                if falling_edge( v.clock_in) then
                    v.value  := msb( v.data_in) & v.value( v.value'high downto 1); 
                    v.parity := v.parity xor msb( v.data_in);
                    if v.count > 0 then
                        v.count := v.count - 1;
                    else
                        v.state := PARITY;
                    end if;
                end if;

            when PARITY =>
                if falling_edge( v.clock_in) then
                    v.parity := v.parity xor msb( v.data_in);
                    v.state  := STOP;
                end if;
                    
            when STOP =>
                if falling_edge( v.clock_in) then
                    -- check stop bit and parity bit
                    if msb( v.data_in) = '1' and v.parity = '1' then
                        v.state := PROCESSING;
                    else
                        v.state := IDLE;
                    end if;
                end if;

            when PROCESSING =>
                v.result    := v.value;
                v.result_en := '1';
                v.state     := IDLE;

        end case;

        -- input synchronizer
        v.data_in   := v.data_in( 1 downto 0)  & ps2_data;
        v.clock_in  := v.clock_in( 1 downto 0) & ps2_clock;
        
        r_in <= v;
    end process;

    seq: process
    begin
        wait until rising_edge( clk);
        r <= r_in;
    end process;

end architecture rtl;
