----------------------------------------------------------------------------------
-- add online help as overlay
-- show additional text message on top of screen
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

use work.chars.all;
use work.text.all;

entity online_help is
    generic
    (
        init_message    : string := "Z1013.01"
    );
    port
    (
        active          : in  std_logic;
        pixel_clock     : in  std_logic;
        -- input signals
        red             : in  std_logic_vector( 5 downto 0);
        green           : in  std_logic_vector( 5 downto 0);
        blue            : in  std_logic_vector( 5 downto 0);
        hsync           : in  std_logic;
        vsync           : in  std_logic;
        -- message stuff
        show_message    : in  std_logic;    -- enable or disable message display
        message_en      : in  std_logic;    -- 0->1 take new message character
        message         : in  character;
        message_restart : in  std_logic;    -- restart with new message
        -- output signals
        red_out         : out std_logic_vector( 5 downto 0);
        green_out       : out std_logic_vector( 5 downto 0);
        blue_out        : out std_logic_vector( 5 downto 0);
        hsync_out       : out std_logic;
        vsync_out       : out std_logic
    );
end entity online_help;


architecture rtl of online_help is

    constant overlay_startx : natural  := 810;
    constant overlay_starty : natural  := 140;
    --                                 
    constant message_startx : natural  := 379;
    constant message_starty : natural  :=  65;
    --
    constant char_count     : natural  := 64;
    constant char_width     : natural  :=  5;
    constant char_height    : natural  :=  8;
    --
    constant text_width     : natural  := 36;
    constant text_heigth    : natural  := 30;
    --
    constant message_length : natural  := 37;

    
    type char_rom_t is array( 0 to ( char_count * char_width * char_height) - 1 ) of std_logic; 
    type text_rom_t is array( 0 to ( text_width * text_heigth) - 1) of character;
    type message_ram_t is array( 0 to message_length - 1) of character;


    impure function init_char_rom
        return char_rom_t is
        variable tmp : char_rom_t := (others => '0');
        variable value : unsigned( 0 downto 0);
    begin
        for index in tmp'range loop
            value := to_unsigned( chars( index), value'length);
            tmp(index) := value(0);
        end loop;
        return tmp;
    end init_char_rom;


    impure function init_text_rom_test
        return text_rom_t is
        variable tmp   : text_rom_t := (others => ' ');
    begin
        for index in tmp'range loop
            if index < 96 then
                tmp( index) := character'val( index + 32);
            end if;
        end loop;
        return tmp;
    end init_text_rom_test;


    impure function init_text_rom
        return text_rom_t is
        variable tmp        : text_rom_t := (others => ' ');
        variable text_line  : string( 1 to text_width);
    begin
        for row in text'range loop
            text_line := text( row);
            for col in text_line'range loop
                tmp( row * text_width + ( col - 1)) := text_line( col);
            end loop;
        end loop;
        return tmp;
    end init_text_rom;


    impure function init_message_ram( init_message : string)
        return message_ram_t is
        variable tmp        : message_ram_t := (others => ' ');
    begin
        for c in init_message'range loop
            tmp( c - 1) := init_message( c);
        end loop;
        return tmp;
    end init_message_ram;


    signal char_rom     : char_rom_t     := init_char_rom; 
    signal text_rom     : text_rom_t     := init_text_rom; 
    signal message_ram  : message_ram_t  := init_message_ram( init_message);
                        
    signal show_text    : std_logic;
    signal vsync_1      : std_logic;
    signal hsync_1      : std_logic;
    signal vposition    : unsigned( 10 downto 0) := ( others => '0');
    signal hposition    : unsigned( 10 downto 0) := ( others => '0');
    signal text_pos     : natural range 0 to text_width * text_heigth - 1;
    signal message_pos  : natural range 0 to message_length - 1;
    signal linepos      : natural range 0 to text_width * text_heigth - 1;
    signal pixelpos     : natural range 0 to 4; 
    signal charpos      : natural range 0 to 7; 
    --
    signal message_en_1 : std_logic;
    signal write_pos    : natural range 0 to message_length - 1;


begin

    process
        variable overlay_bit   : std_logic;
    begin
        wait until rising_edge( pixel_clock);

        -- default: pass thru
        red_out     <= red;
        green_out   <= green;
        blue_out    <= blue;

        hposition <= hposition + 1;
        -- new frame
        if vsync_1 = '1' and vsync = '0' then
            vposition <= ( others => '0');
            text_pos  <= 0;
            linepos   <= 0;
            pixelpos  <= 0;
            charpos   <= 0;
            show_text <= active;
         
        else
            -- new line
            if hsync_1 = '1' and hsync = '0' then
                vposition <= vposition + 1;
                hposition <= ( others => '0');
            end if;

            if show_text = '1' then
                overlay_bit := char_rom( char_width * charpos + pixelpos + char_width * char_height * ( character'pos( text_rom( text_pos)) - 32));
                -- in range
                if vposition >= overlay_starty and vposition < overlay_starty + text_heigth * char_height then

                    -- check hsync
                    if hsync_1 = '1' and hsync = '0' then
                        text_pos  <= linepos;
                        if charpos < 7 then
                            charpos <= charpos + 1;
                        else
                            if linepos < ( text_width * text_heigth - 1) then
                                linepos     <= linepos + text_width;
                                text_pos    <= linepos + text_width;
                            end if;
                            charpos <= 0;
                        end if;
                    end if;
                    
                    if hposition >= overlay_startx and hposition < overlay_startx + text_width * char_width then
                        if overlay_bit = '1' then
                            red_out   <= ( others => '1');
                            green_out <= ( others => '1');
                            blue_out  <= ( others => '1');
                        else
                            red_out     <= "00" & red(   red'high-2   downto 0);
                            green_out   <= "00" & green( green'high-2 downto 0);
                            blue_out    <= "00" & blue(  blue'high-2  downto 0);
                        end if;
                        if pixelpos < 4 then
                            pixelpos  <= pixelpos + 1;
                        else
                            pixelpos  <= 0;
                            text_pos  <= text_pos + 1;
                        end if;
                    end if;
                end if;

            end if;

            if show_message = '1' then
                overlay_bit := char_rom( char_width * charpos + pixelpos + char_width * char_height * ( character'pos( message_ram( message_pos)) - 32));
                -- in range
                if vposition >= message_starty and vposition < message_starty + char_height then

                    -- check hsync
                    if hsync_1 = '1' and hsync = '0' then
                        message_pos  <= 0;
                        if charpos < 7 then
                            charpos <= charpos + 1;
                        else
                            charpos <= 0;
                        end if;
                    end if;
                    
                    if hposition >= message_startx and hposition < message_startx + message_length * char_width then
                        if overlay_bit = '0' then
                            red_out   <= ( others => '1');
                            green_out <= ( others => '1');
                            blue_out  <= ( others => '1');
                        else
                            red_out     <= "00" & red(   red'high-2   downto 0);
                            green_out   <= "00" & green( green'high-2 downto 0);
                            blue_out    <= "00" & blue(  blue'high-2  downto 0);
                        end if;
                        if pixelpos < 4 then
                            pixelpos  <= pixelpos + 1;
                        else
                            pixelpos    <= 0;
                            if message_pos < message_length - 1 then
                                message_pos <= message_pos + 1;
                            end if;
                        end if;
                    end if;
                end if;

            end if;
        
            -- update message
            if message_en = '1' and message_en_1 = '0' then
                message_ram( write_pos) <= character'val( character'pos( message));
                if write_pos < message_length - 1 then
                    write_pos           <= write_pos + 1;
                end if;
            end if;
            if message_restart = '1' then
                write_pos <= 0;
            end if;
        end if;
        vsync_1         <= vsync;
        hsync_1         <= hsync;
        message_en_1    <= message_en;

        -- don't modify sync signals
        hsync_out   <= hsync;
        vsync_out   <= vsync;

    end process;

end architecture rtl;
