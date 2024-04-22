------------------------------------------------------------
-- converter between data_io and memory
-- to load .z80 files to the correct address
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
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity headersave_decode is
    generic
    (
        clk_frequency   : natural := 4000000
    );
    port
    (
        clk             : in    std_logic;
        -- interface from data_io
        downloading     : in    std_logic;              -- signal indication an active download
        wr              : in    std_logic;
        addr            : in    std_logic_vector(24 downto 0);
        data            : in    std_logic_vector(7 downto 0);
        -- interface to memory
        downloading_out : out   std_logic;
        wr_out          : out   std_logic;
        addr_out        : out   std_logic_vector(15 downto 0);  -- z1013 has only 64k addressspace
        data_out        : out   std_logic_vector(7 downto 0);
        -- interface to message display
        show_message    : out   std_logic;    -- enable or disable message display
        message_en      : out   std_logic;    -- 0->1 take new message character
        message         : out   character;
        message_restart : out   std_logic;    -- restart with new message
        -- autostart support signals
        autostart_addr  : out   std_logic_vector(15 downto 0);
        autostart_en    : out   std_logic     -- start signal
    );
end entity headersave_decode;


architecture rtl of headersave_decode is
    
    -- time to show the loading message (15 seconds)
    constant display_counter_max : natural := 15 * clk_frequency - 1;

    -- helper function, convert unsigned to hex charachter
    function to_hex( val: unsigned( 3 downto 0)) return character is
        variable result : character;
    begin
        case to_integer( val) is
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


    type state_t is ( IDLE, ACTIVE, START);
    type reg_t is record
        state           : state_t;
        load_addr       : unsigned( 15 downto 0);
        end_addr        : unsigned( 15 downto 0);
        start_addr      : unsigned( 15 downto 0);
        file_type       : unsigned(  7 downto 0);
        file_name       : string( 1 to 16);
        bytecount       : natural range 0 to 65535;
        --
        downloading_out : std_logic;
        wr_out          : std_logic;
        addr_out        : std_logic_vector(15 downto 0);
        data_out        : std_logic_vector(7 downto 0);
        --
        show_message    : std_logic;    -- enable or disable message display
        message_en      : std_logic;    -- 0->1 take new message character
        message         : character;
        message_restart : std_logic;    -- restart with new message
        display_counter : natural range 0 to display_counter_max;
        --
        autostart_en    : std_logic;
    end record;

    constant default_reg : reg_t :=
    (
        state           => IDLE,
        load_addr       => ( others => '0'),
        end_addr        => ( others => '-'),
        start_addr      => ( others => '-'),
        file_type       => ( others => '-'),
        file_name       => ( others => ' '),
        bytecount       => 0,
        --
        downloading_out => '0',
        wr_out          => '0',
        addr_out        => ( others => '-'),
        data_out        => ( others => '-'),
        --
        show_message    => '1',
        message_en      => '0',
        message         => ' ',
        message_restart => '0',
        display_counter => display_counter_max,
        --
        autostart_en    => '0'
    );

    signal  r   : reg_t := default_reg;
    signal  r_in: reg_t;

begin


    comb: process( r, downloading, wr, addr, data)
        variable v: reg_t;
    begin
        v := r;

        -- outputs
        downloading_out <= v.downloading_out;
        wr_out          <= v.wr_out;
        addr_out        <= v.addr_out;
        data_out        <= v.data_out;
        --
        show_message    <= v.show_message;
        message_en      <= v.message_en;
        message         <= v.message;
        message_restart <= v.message_restart;
        --
        autostart_addr  <= std_logic_vector( v.start_addr);
        autostart_en    <= v.autostart_en;

        -- defaults
        v.addr_out        := std_logic_vector( v.load_addr);
        v.data_out        := data;
        v.message_restart := '0';
        v.message_en      := '0';
        v.autostart_en    := '0';

        -- message display time limit
        if v.display_counter > 0 then
            v.display_counter   := v.display_counter - 1;
        else
            v.show_message      := '0';
        end if;

        case v.state is

            when IDLE => 
                if downloading = '1' then
                    v.state             := ACTIVE;
                    v.message_restart   := '1';
                    v.show_message      := '1';
                    v.display_counter   := display_counter_max;
                end if;

            when ACTIVE =>
                if v.bytecount > 31 then
                    v.downloading_out := '1';
                    v.wr_out          := wr;
                    if wr = '1' then
                        v.load_addr   := v.load_addr + 1;
                    end if;
                end if;

                if wr = '1' then
                    -- decode header
                    case v.bytecount is
                        when 0 => v.load_addr( 7 downto 0)  := unsigned( data);
                        when 1 => v.load_addr(15 downto 8)  := unsigned( data);
                        when 2 => v.end_addr( 7 downto 0)   := unsigned( data);
                        when 3 => v.end_addr(15 downto 8)   := unsigned( data);
                        when 4 => v.start_addr( 7 downto 0) := unsigned( data);
                        when 5 => v.start_addr(15 downto 8) := unsigned( data);
                        when 12 => v.file_type              := unsigned( data);
                        when 16 => v.file_name(  1)         := character'val( to_integer( unsigned( data)));
                        when 17 => v.file_name(  2)         := character'val( to_integer( unsigned( data)));
                        when 18 => v.file_name(  3)         := character'val( to_integer( unsigned( data)));
                        when 19 => v.file_name(  4)         := character'val( to_integer( unsigned( data)));
                        when 20 => v.file_name(  5)         := character'val( to_integer( unsigned( data)));
                        when 21 => v.file_name(  6)         := character'val( to_integer( unsigned( data)));
                        when 22 => v.file_name(  7)         := character'val( to_integer( unsigned( data)));
                        when 23 => v.file_name(  8)         := character'val( to_integer( unsigned( data)));
                        when 24 => v.file_name(  9)         := character'val( to_integer( unsigned( data)));
                        when 25 => v.file_name( 10)         := character'val( to_integer( unsigned( data)));
                        when 26 => v.file_name( 11)         := character'val( to_integer( unsigned( data)));
                        when 27 => v.file_name( 12)         := character'val( to_integer( unsigned( data)));
                        when 28 => v.file_name( 13)         := character'val( to_integer( unsigned( data)));
                        when 29 => v.file_name( 14)         := character'val( to_integer( unsigned( data)));
                        when 30 => v.file_name( 15)         := character'val( to_integer( unsigned( data)));
                        when 31 => v.file_name( 16)         := character'val( to_integer( unsigned( data)));
                        when others => null;
                    end case;
                    -- set message
                    case v.bytecount is
                        when  2 => v.message := to_hex( v.load_addr( 15 downto 12));    v.message_en := '1';
                        when  3 => v.message := to_hex( v.load_addr( 11 downto  8));    v.message_en := '1';
                        when  4 => v.message := to_hex( v.load_addr(  7 downto  4));    v.message_en := '1';
                        when  5 => v.message := to_hex( v.load_addr(  3 downto  0));    v.message_en := '1';
                        when  6 => v.message := ' ';                                    v.message_en := '1';
                        when  7 => v.message := to_hex( v.end_addr( 15 downto 12));     v.message_en := '1';
                        when  8 => v.message := to_hex( v.end_addr( 11 downto  8));     v.message_en := '1';
                        when  9 => v.message := to_hex( v.end_addr(  7 downto  4));     v.message_en := '1';
                        when 10 => v.message := to_hex( v.end_addr(  3 downto  0));     v.message_en := '1';
                        when 11 => v.message := ' ';                                    v.message_en := '1';
                        when 12 => v.message := to_hex( v.start_addr( 15 downto 12));   v.message_en := '1';
                        when 13 => v.message := to_hex( v.start_addr( 11 downto  8));   v.message_en := '1';
                        when 14 => v.message := to_hex( v.start_addr(  7 downto  4));   v.message_en := '1';
                        when 15 => v.message := to_hex( v.start_addr(  3 downto  0));   v.message_en := '1';
                        when 16 => v.message := ' ';                                    v.message_en := '1';
                        when 17 => v.message := 'T';                                    v.message_en := '1';
                        when 18 => v.message := 'Y';                                    v.message_en := '1';
                        when 19 => v.message := 'P';                                    v.message_en := '1';
                        when 20 => v.message := ':';                                    v.message_en := '1';
                        when 21 => v.message := character'val( to_integer( v.file_type)); v.message_en := '1';
                        when 22 => v.message := ' ';                                    v.message_en := '1';
                        when 23 => v.message := v.file_name(  1); v.message_en := '1';
                        when 24 => v.message := v.file_name(  2); v.message_en := '1';
                        when 25 => v.message := v.file_name(  3); v.message_en := '1';
                        when 26 => v.message := v.file_name(  4); v.message_en := '1';
                        when 27 => v.message := v.file_name(  5); v.message_en := '1';
                        when 28 => v.message := v.file_name(  6); v.message_en := '1';
                        when 29 => v.message := v.file_name(  7); v.message_en := '1';
                        when 30 => v.message := v.file_name(  8); v.message_en := '1';
                        when 31 => v.message := v.file_name(  9); v.message_en := '1';
                        when 32 => v.message := v.file_name( 10); v.message_en := '1';
                        when 33 => v.message := v.file_name( 11); v.message_en := '1';
                        when 34 => v.message := v.file_name( 12); v.message_en := '1';
                        when 35 => v.message := v.file_name( 13); v.message_en := '1';
                        when 36 => v.message := v.file_name( 14); v.message_en := '1';
                        when 37 => v.message := v.file_name( 15); v.message_en := '1';
                        when 38 => v.message := v.file_name( 16); v.message_en := '1';
                        when others => null;
                    end case;
                    v.bytecount := v.bytecount + 1;
                end if;

                if downloading = '0' then
                    v.state             := START;
                    v.downloading_out   := '0';
                    v.wr_out            := '0';
                    v.bytecount         := 0;
                end if;


            when START =>
                if v.start_addr /= x"0000" then
                    v.autostart_en      := '1';
                end if;
                v.state := IDLE;

        end case;

        r_in <= v;
    end process;


    seq: process
    begin
        wait until rising_edge( clk);
        r <= r_in;
    end process;


end architecture rtl;
