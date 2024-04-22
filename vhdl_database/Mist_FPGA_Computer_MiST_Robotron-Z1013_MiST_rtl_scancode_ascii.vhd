----------------------------------------------------------------------------------
-- convert keyboard scancodes to ASCII
-- two layouts are supported: de/en
-- 
-- Copyright (c) 2017, 2018 Bert Lange
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

entity scancode_ascii is
    port
    (
        clk             : in    std_logic;
        --
        scancode        : in    std_logic_vector( 7 downto 0);
        scancode_en     : in    std_logic;
        -- switch layout
        layout_select   : in    std_logic;  -- 0 = en, 1 = de
        --
        ascii           : out   std_logic_vector( 7 downto 0);
        ascii_press     : out   std_logic;
        ascii_release   : out   std_logic
    );
end entity scancode_ascii;


architecture rtl of scancode_ascii is
    
    -- helper functions
    function to_slv( value : character) return std_logic_vector is
        variable result : std_logic_vector( 7 downto 0);
    begin
        result := std_logic_vector( to_unsigned( character'pos( value), result'length));
        return result;
    end function to_slv;

    -- definitions
    type scancode_table_t is array( natural range <>) of std_logic_vector( 7 downto 0);


    constant scancode_table_en : scancode_table_t( 0 to 255) := 
    (
        -- 0x00
        16#01# => x"f9", -- F9, hack to make function keys usable
        16#03# => x"f5", -- F5
        16#04# => x"f3", -- F3
        16#05# => x"f1", -- F1
        16#06# => x"f2", -- F2
        16#07# => x"fc", -- F12
        -- 0x08
        16#09# => x"fa", -- F10
        16#0a# => x"f8", -- F8
        16#0b# => x"f6", -- F6
        16#0c# => x"f4", -- F4
        16#0d# => x"09", -- tab
        16#0e# => to_slv( '`'), -- backtick
        -- 0x10
        16#11# => x"00", -- left alt
        16#12# => x"00", -- left shift
        16#14# => x"00", -- left control
        16#15# => to_slv( 'Q'),
        16#16# => to_slv( '1'),
        -- 0x18
        16#1a# => to_slv( 'Z'),
        16#1b# => to_slv( 'S'),
        16#1c# => to_slv( 'A'),
        16#1d# => to_slv( 'W'),
        16#1e# => to_slv( '2'),
        -- 0x20
        16#21# => to_slv( 'C'),
        16#22# => to_slv( 'X'),
        16#23# => to_slv( 'D'),
        16#24# => to_slv( 'E'),
        16#25# => to_slv( '4'),
        16#26# => to_slv( '3'),
        -- 0x28
        16#29# => to_slv( ' '),
        16#2a# => to_slv( 'V'),
        16#2b# => to_slv( 'F'),
        16#2c# => to_slv( 'T'),
        16#2d# => to_slv( 'R'),
        16#2e# => to_slv( '5'),
        -- 0x30
        16#31# => to_slv( 'N'),
        16#32# => to_slv( 'B'),
        16#33# => to_slv( 'H'),
        16#34# => to_slv( 'G'),
        16#35# => to_slv( 'Y'),
        16#36# => to_slv( '6'),
        -- 0x38
        16#3a# => to_slv( 'M'),
        16#3b# => to_slv( 'J'),
        16#3c# => to_slv( 'U'),
        16#3d# => to_slv( '7'),
        16#3e# => to_slv( '8'),
        -- 0x40
        16#41# => to_slv( ','),
        16#42# => to_slv( 'K'),
        16#43# => to_slv( 'I'),
        16#44# => to_slv( 'O'),
        16#45# => to_slv( '0'),
        16#46# => to_slv( '9'),
        -- 0x48
        16#49# => to_slv( '.'),
        16#4a# => to_slv( '/'),
        16#4b# => to_slv( 'L'),
        16#4c# => to_slv( ';'),
        16#4d# => to_slv( 'P'),
        16#4e# => to_slv( '-'),
        -- 0x50
        16#52# => to_slv( '''),
        16#54# => to_slv( '['),
        16#55# => to_slv( '='),
        -- 0x58
        16#58# => x"00",  -- caps lock
        16#59# => x"00",  -- right shift
        16#5a# => x"0d",  -- enter
        16#5b# => to_slv( ']'),
        16#5d# => to_slv( '\'),
        -- 0x60
        16#66# => x"08", -- backspace
        -- 0x68
        16#69# => to_slv( '1'), -- keypad
        16#6b# => to_slv( '4'), -- keypad
        16#6c# => to_slv( '7'), -- keypad
        -- 0x70
        16#70# => to_slv( '0'), -- keypad
        16#71# => to_slv( '.'), -- keypad
        16#72# => to_slv( '2'), -- keypad
        16#73# => to_slv( '5'), -- keypad
        16#74# => to_slv( '6'), -- keypad
        16#75# => to_slv( '8'), -- keypad
        16#76# => x"1b", -- escape
        16#77# => x"00", -- numberlock
        -- 0x78
        16#78# => x"fb", -- F11
        16#79# => to_slv( '+'), -- keypad
        16#7a# => to_slv( '3'), -- keypad
        16#7b# => to_slv( '-'), -- keypad
        16#7c# => to_slv( '*'), -- keypad
        16#7d# => to_slv( '9'), -- keypad
        16#7e# => x"00", -- scroll lock
        -- 0x80
        16#83# => x"f7", -- F7
        others => x"00"
    );



    constant scancode_table_en_smallcaps : scancode_table_t( 0 to 255) := 
    (
        -- 0x00
        16#01# => x"f9", -- F9
        16#03# => x"f5", -- F5
        16#04# => x"f3", -- F3
        16#05# => x"f1", -- F1
        16#06# => x"f2", -- F2
        16#07# => x"fc", -- F12
        -- 0x08
        16#09# => x"fa", -- F10
        16#0a# => x"f8", -- F8
        16#0b# => x"f6", -- F6
        16#0c# => x"f4", -- F4
        16#0d# => x"09", -- tab
        16#0e# => to_slv( '~'), -- quote
        -- 0x10
        16#11# => x"00", -- left alt
        16#12# => x"00", -- left shift
        16#14# => x"00", -- left control
        16#15# => to_slv( '1'),
        16#16# => to_slv( '!'),
        -- 0x18
        16#1a# => to_slv( 'z'),
        16#1b# => to_slv( 's'),
        16#1c# => to_slv( 'a'),
        16#1d# => to_slv( 'w'),
        16#1e# => to_slv( '@'),
        -- 0x20
        16#21# => to_slv( 'c'),
        16#22# => to_slv( 'x'),
        16#23# => to_slv( 'd'),
        16#24# => to_slv( 'e'),
        16#25# => to_slv( '$'),
        16#26# => to_slv( '#'),
        -- 0x28
        16#29# => to_slv( ' '),
        16#2a# => to_slv( 'v'),
        16#2b# => to_slv( 'f'),
        16#2c# => to_slv( 't'),
        16#2d# => to_slv( 'r'),
        16#2e# => to_slv( '%'),
        -- 0x30
        16#31# => to_slv( 'n'),
        16#32# => to_slv( 'b'),
        16#33# => to_slv( 'h'),
        16#34# => to_slv( 'g'),
        16#35# => to_slv( 'y'),
        16#36# => to_slv( '^'),
        -- 0x38
        16#3a# => to_slv( 'm'),
        16#3b# => to_slv( 'j'),
        16#3c# => to_slv( 'u'),
        16#3d# => to_slv( '&'),
        16#3e# => to_slv( '*'),
        -- 0x40
        16#41# => to_slv( '<'),
        16#42# => to_slv( 'k'),
        16#43# => to_slv( 'i'),
        16#44# => to_slv( 'o'),
        16#45# => to_slv( ')'),
        16#46# => to_slv( '('),
        -- 0x48
        16#49# => to_slv( '>'),
        16#4a# => to_slv( '?'),
        16#4b# => to_slv( 'l'),
        16#4c# => to_slv( ':'),
        16#4d# => to_slv( 'p'),
        16#4e# => to_slv( '_'),
        -- 0x50
        16#52# => to_slv( '"'),
        16#54# => to_slv( '{'),
        16#55# => to_slv( '+'),
        -- 0x58
        16#58# => x"00",  -- caps lock
        16#59# => x"00",  -- right shift
        16#5a# => x"0d",  -- enter
        16#5b# => to_slv( '}'),
        16#5d# => to_slv( '|'),
        -- 0x60
        16#66# => x"08", -- backspace
        -- 0x68
        16#69# => to_slv( '1'), -- keypad
        16#6b# => to_slv( '4'), -- keypad
        16#6c# => to_slv( '7'), -- keypad
        -- 0x70
        16#70# => to_slv( '0'), -- keypad
        16#71# => to_slv( '.'), -- keypad
        16#72# => to_slv( '2'), -- keypad
        16#73# => to_slv( '5'), -- keypad
        16#74# => to_slv( '6'), -- keypad
        16#75# => to_slv( '8'), -- keypad
        16#76# => x"1b", -- escape
        16#77# => x"00", -- numberlock
        -- 0x78
        16#78# => x"fb", -- F11
        16#79# => to_slv( '+'), -- keypad
        16#7a# => to_slv( '3'), -- keypad
        16#7b# => to_slv( '-'), -- keypad
        16#7c# => to_slv( '*'), -- keypad
        16#7d# => to_slv( '9'), -- keypad
        16#7e# => x"00", -- scroll lock
        -- 0x80
        16#83# => x"f7", -- F7
        others => x"00"
    );
    
    
    constant scancode_table_de : scancode_table_t( 0 to 255) := 
    (
        -- 0x00
        16#01# => x"f9", -- F9, hack to make function keys usable
        16#03# => x"f5", -- F5
        16#04# => x"f3", -- F3
        16#05# => x"f1", -- F1
        16#06# => x"f2", -- F2
        16#07# => x"fc", -- F12
        -- 0x08
        16#09# => x"fa", -- F10
        16#0a# => x"f8", -- F8
        16#0b# => x"f6", -- F6
        16#0c# => x"f4", -- F4
        16#0d# => x"09", -- tab
        16#0e# => to_slv( '^'),
        -- 0x10
        16#11# => x"00", -- left alt
        16#12# => x"00", -- left shift
        16#14# => x"00", -- left control
        16#15# => to_slv( 'Q'),
        16#16# => to_slv( '1'),
        -- 0x18
        16#1a# => to_slv( 'Y'),
        16#1b# => to_slv( 'S'),
        16#1c# => to_slv( 'A'),
        16#1d# => to_slv( 'W'),
        16#1e# => to_slv( '2'),
        -- 0x20
        16#21# => to_slv( 'C'),
        16#22# => to_slv( 'X'),
        16#23# => to_slv( 'D'),
        16#24# => to_slv( 'E'),
        16#25# => to_slv( '4'),
        16#26# => to_slv( '3'),
        -- 0x28
        16#29# => to_slv( ' '),
        16#2a# => to_slv( 'V'),
        16#2b# => to_slv( 'F'),
        16#2c# => to_slv( 'T'),
        16#2d# => to_slv( 'R'),
        16#2e# => to_slv( '5'),
        -- 0x30
        16#31# => to_slv( 'N'),
        16#32# => to_slv( 'B'),
        16#33# => to_slv( 'H'),
        16#34# => to_slv( 'G'),
        16#35# => to_slv( 'Z'),
        16#36# => to_slv( '6'),
        -- 0x38
        16#3a# => to_slv( 'M'),
        16#3b# => to_slv( 'J'),
        16#3c# => to_slv( 'U'),
        16#3d# => to_slv( '7'),
        16#3e# => to_slv( '8'),
        -- 0x40
        16#41# => to_slv( ','),
        16#42# => to_slv( 'K'),
        16#43# => to_slv( 'I'),
        16#44# => to_slv( 'O'),
        16#45# => to_slv( '0'),
        16#46# => to_slv( '9'),
        -- 0x48
        16#49# => to_slv( '.'),
        16#4a# => to_slv( '-'),
        16#4b# => to_slv( 'L'),
        16#4c# => to_slv( 'O'), -- Oe
        16#4d# => to_slv( 'P'),
        -- 0x50
        16#52# => to_slv( 'A'), -- Ae
        16#54# => to_slv( 'U'), -- Ue
        16#55# => to_slv( '''),
        -- 0x58
        16#58# => x"00",  -- caps lock
        16#59# => x"00",  -- right shift
        16#5a# => x"0d",  -- enter
        16#5b# => to_slv( '+'),
        16#5d# => to_slv( '#'),
        -- 0x60
        16#61# => to_slv( '<'),
        16#66# => x"08", -- backspace
        -- 0x68
        16#69# => to_slv( '1'), -- keypad
        16#6b# => to_slv( '4'), -- keypad
        16#6c# => to_slv( '7'), -- keypad
        -- 0x70
        16#70# => to_slv( '0'), -- keypad
        16#71# => to_slv( '.'), -- keypad
        16#72# => to_slv( '2'), -- keypad
        16#73# => to_slv( '5'), -- keypad
        16#74# => to_slv( '6'), -- keypad
        16#75# => to_slv( '8'), -- keypad
        16#76# => x"1b", -- escape
        16#77# => x"00", -- numberlock
        -- 0x78
        16#78# => x"fb", -- F11
        16#79# => to_slv( '+'), -- keypad
        16#7a# => to_slv( '3'), -- keypad
        16#7b# => to_slv( '-'), -- keypad
        16#7c# => to_slv( '*'), -- keypad
        16#7d# => to_slv( '9'), -- keypad
        16#7e# => x"00", -- scroll lock
        -- 0x80
        16#83# => x"f7", -- F7
        others => x"00"
    );


    constant scancode_table_de_smallcaps : scancode_table_t( 0 to 255) := 
    (
        -- 0x00
        16#01# => x"f9", -- F9
        16#03# => x"f5", -- F5
        16#04# => x"f3", -- F3
        16#05# => x"f1", -- F1
        16#06# => x"f2", -- F2
        16#07# => x"fc", -- F12
        -- 0x08
        16#09# => x"fa", -- F10
        16#0a# => x"f8", -- F8
        16#0b# => x"f6", -- F6
        16#0c# => x"f4", -- F4
        16#0d# => x"09", -- tab
        --16#0e# => to_slv( '°'),
        -- 0x10
        16#11# => x"00", -- left alt
        16#12# => x"00", -- left shift
        16#14# => x"00", -- left control
        16#15# => to_slv( '1'),
        16#16# => to_slv( '!'),
        -- 0x18
        16#1a# => to_slv( 'y'),
        16#1b# => to_slv( 's'),
        16#1c# => to_slv( 'a'),
        16#1d# => to_slv( 'w'),
        16#1e# => to_slv( '"'),
        -- 0x20
        16#21# => to_slv( 'c'),
        16#22# => to_slv( 'x'),
        16#23# => to_slv( 'd'),
        16#24# => to_slv( 'e'),
        16#25# => to_slv( '$'),
        --16#26# => to_slv( '§'),
        -- 0x28
        16#29# => to_slv( ' '),
        16#2a# => to_slv( 'v'),
        16#2b# => to_slv( 'f'),
        16#2c# => to_slv( 't'),
        16#2d# => to_slv( 'r'),
        16#2e# => to_slv( '%'),
        -- 0x30
        16#31# => to_slv( 'n'),
        16#32# => to_slv( 'b'),
        16#33# => to_slv( 'h'),
        16#34# => to_slv( 'g'),
        16#35# => to_slv( 'z'),
        16#36# => to_slv( '&'),
        -- 0x38
        16#3a# => to_slv( 'm'),
        16#3b# => to_slv( 'j'),
        16#3c# => to_slv( 'u'),
        16#3d# => to_slv( '/'),
        16#3e# => to_slv( '('),
        -- 0x40
        16#41# => to_slv( ';'),
        16#42# => to_slv( 'k'),
        16#43# => to_slv( 'i'),
        16#44# => to_slv( 'o'),
        16#45# => to_slv( '='),
        16#46# => to_slv( ')'),
        -- 0x48
        16#49# => to_slv( ':'),
        16#4a# => to_slv( '_'),
        16#4b# => to_slv( 'l'),
        16#4c# => to_slv( 'o'), -- oe
        16#4d# => to_slv( 'p'),
        16#4e# => to_slv( '?'),
        -- 0x50
        16#52# => to_slv( 'a'), -- ae
        16#54# => to_slv( 'u'), -- ue
        16#55# => x"60",
        -- 0x58
        16#58# => x"00",  -- caps lock
        16#59# => x"00",  -- right shift
        16#5a# => x"0d",  -- enter
        16#5b# => to_slv( '*'),
        16#5d# => to_slv( '''),
        -- 0x60
        16#61# => to_slv( '>'),
        16#66# => x"08", -- backspace
        -- 0x68
        16#69# => to_slv( '1'), -- keypad
        16#6b# => to_slv( '4'), -- keypad
        16#6c# => to_slv( '7'), -- keypad
        -- 0x70
        16#70# => to_slv( '0'), -- keypad
        16#71# => to_slv( '.'), -- keypad
        16#72# => to_slv( '2'), -- keypad
        16#73# => to_slv( '5'), -- keypad
        16#74# => to_slv( '6'), -- keypad
        16#75# => to_slv( '8'), -- keypad
        16#76# => x"1b", -- escape
        16#77# => x"00", -- numberlock
        -- 0x78
        16#78# => x"fb", -- F11
        16#79# => to_slv( '+'), -- keypad
        16#7a# => to_slv( '3'), -- keypad
        16#7b# => to_slv( '-'), -- keypad
        16#7c# => to_slv( '*'), -- keypad
        16#7d# => to_slv( '9'), -- keypad
        16#7e# => x"00", -- scroll lock
        -- 0x80
        16#83# => x"f7", -- F7
        others => x"00"
    );


    constant ALT_KEY     : std_logic_vector( 7 downto 0) := x"11";
    constant LEFT_SHIFT  : std_logic_vector( 7 downto 0) := x"12";
    constant RIGHT_SHIFT : std_logic_vector( 7 downto 0) := x"59";
    constant CAPS_LOCK   : std_logic_vector( 7 downto 0) := x"58";
    constant HOME        : std_logic_vector( 7 downto 0) := x"6c";
    constant LEFT_ARROW  : std_logic_vector( 7 downto 0) := x"6b";
    constant DOWN_ARROW  : std_logic_vector( 7 downto 0) := x"72";
    constant RIGHT_ARROW : std_logic_vector( 7 downto 0) := x"74";
    constant UP_ARROW    : std_logic_vector( 7 downto 0) := x"75";
    constant CONTROL     : std_logic_vector( 7 downto 0) := x"14";

    -- registers
    type reg_t is record
        key_off         : std_logic;
        extended        : std_logic;
        --              
        caps_active     : std_logic;
        control_active         : std_logic;
        altgr_active    : std_logic;
        --              
        read_table      : std_logic;
        result          : std_logic_vector( 7 downto 0);
        result_press    : std_logic;
        result_release  : std_logic;
    end record;
    constant default_reg_c : reg_t := 
    (
        key_off         => '0',
        extended        => '0',
        --              
        caps_active     => '0',
        control_active         => '0',
        altgr_active    => '0',
        --              
        read_table      => '0',
        result          => ( others => '-'),
        result_press    => '0',
        result_release  => '0'
    );

    signal r    : reg_t := default_reg_c;
    signal r_in : reg_t := default_reg_c;

    signal ascii_value_en              : std_logic_vector( 7 downto 0);
    signal ascii_value_en_smallcaps    : std_logic_vector( 7 downto 0);
    signal ascii_value_de              : std_logic_vector( 7 downto 0);
    signal ascii_value_de_smallcaps    : std_logic_vector( 7 downto 0);
                    
    procedure set_states( variable x : inout reg_t) is
    begin
        if x.key_off = '1' then
            x.result_release    := '1';
        else
            x.result_press      := '1';
        end if;
        x.extended  := '0';
        x.key_off   := '0';
    end procedure set_states;

begin

    comb: process( r, scancode, scancode_en, layout_select, ascii_value_en, ascii_value_en_smallcaps, ascii_value_de, ascii_value_de_smallcaps)
        variable v : reg_t;
    begin
        v := r;

        -- output
        ascii           <= v.result;
        ascii_press     <= v.result_press;
        ascii_release   <= v.result_release;

        -- defaults
        v.result_press      := '0';
        v.result_release    := '0';

        if v.read_table = '1' then
            if layout_select = '0' then
                v.result    := ascii_value_en;
            else
                v.result    := ascii_value_de;
            end if;
            if v.extended = '0' then
                if v.caps_active = '1' then
                    if layout_select = '0' then
                        v.result    := ascii_value_en_smallcaps;
                    else
                        v.result    := ascii_value_de_smallcaps;
                    end if;
                end if;
                if unsigned( v.result) > 0 then
                    if v.key_off = '1' then
                        v.result_release    := '1';
                    else
                        v.result_press      := '1';
                    end if;
                end if;
                if v.control_active = '1' then
                    if layout_select = '0' then
                        v.result        := ascii_value_en and x"1f";
                    else
                        v.result        := ascii_value_de and x"1f";
                    end if;
                    v.result_release    := v.key_off;
                    v.result_press      := not v.key_off;
                end if;
            end if;
            --
            v.extended  := '0';
            v.key_off   := '0';
            v.read_table := '0';
        end if;
        
        if scancode_en = '1' then
            case scancode is
                
                when x"F0" =>
                    v.key_off   := '1';

                when x"E0" =>
                    v.extended  := '1';

                when RIGHT_SHIFT |  LEFT_SHIFT =>
                    if v.key_off = '0' then
                        v.caps_active := '1';
                    else
                        v.caps_active := '0';
                    end if;
                    v.extended  := '0';
                    v.key_off   := '0';

                when CONTROL =>
                    if v.key_off = '0' then
                        v.control_active := '1';
                    else
                        v.control_active := '0';
                    end if;
                    v.extended  := '0';
                    v.key_off   := '0';

                when LEFT_ARROW =>
                    if v.extended = '1' then
                        v.result    := x"08";
                        set_states( v);
                    end if;

                when RIGHT_ARROW =>
                    if v.extended = '1' then
                        v.result    := x"09";
                        set_states( v);
                    end if;

                when DOWN_ARROW =>
                    if v.extended = '1' then
                        v.result    := x"0a";
                        set_states( v);
                    end if;

                when UP_ARROW =>
                    if v.extended = '1' then
                        v.result    := x"0b";
                        set_states( v);
                    end if;

                when HOME =>
                    if v.extended = '1' then
                        v.result    := x"0c";
                        set_states( v);
                    end if;

                when CAPS_LOCK =>
                    if v.key_off = '0' then
                        v.caps_active := not v.caps_active;
                    end if;
                    v.key_off   := '0';

                when ALT_KEY =>
                    if v.extended = '1' and layout_select = '1' then
                        if v.key_off = '0' then
                            v.altgr_active := '1';
                        else
                            v.altgr_active := '0';
                        end if;
                        v.key_off   := '0';
                    end if;

                when x"15" =>
                    if v.altgr_active = '1' then
                        v.result    := to_slv( '@');
                        set_states( v);
                    else
                        v.read_table := '1';
                    end if;

                when x"3d" =>
                    if v.altgr_active = '1' then
                        v.result    := to_slv( '{');
                        set_states( v);
                    else
                        v.read_table := '1';
                    end if;

                when x"3e" =>
                    if v.altgr_active = '1' then
                        v.result    := to_slv( '[');
                        set_states( v);
                    else
                        v.read_table := '1';
                    end if;

                when x"45" =>
                    if v.altgr_active = '1' then
                        v.result    := to_slv( '}');
                        set_states( v);
                    else
                        v.read_table := '1';
                    end if;

                when x"46" =>
                    if v.altgr_active = '1' then
                        v.result    := to_slv( ']');
                        set_states( v);
                    else
                        v.read_table := '1';
                    end if;

                when x"4e" =>
                    if v.altgr_active = '1' then
                        v.result    := to_slv( '\');
                        set_states( v);
                    else
                        v.read_table := '1';
                    end if;

                when x"5b" =>
                    if v.altgr_active = '1' then
                        v.result    := to_slv( '~');
                        set_states( v);
                    else
                        v.read_table := '1';
                    end if;

                when x"61" =>
                    if v.altgr_active = '1' then
                        v.result    := to_slv( '|');
                        set_states( v);
                    else
                        v.read_table := '1';
                    end if;

                when others =>
                    v.read_table := '1';

            end case;
        end if;

        r_in <= v;
    end process;

    -- read rom(s)
    ascii_value_en             <=  scancode_table_en(           to_integer( unsigned( scancode)));
    ascii_value_en_smallcaps   <=  scancode_table_en_smallcaps( to_integer( unsigned( scancode)));
    ascii_value_de             <=  scancode_table_de(           to_integer( unsigned( scancode)));
    ascii_value_de_smallcaps   <=  scancode_table_de_smallcaps( to_integer( unsigned( scancode)));


    seq: process
    begin
        wait until rising_edge( clk);
        r <= r_in;
    end process;

end architecture rtl;
