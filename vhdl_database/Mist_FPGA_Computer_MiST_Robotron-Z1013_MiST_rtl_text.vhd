----------------------------------------------------------------------------------
-- text for online help of Z1013 monitor
-- very basic commands
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

package text is

type text_t is array(natural range <>) of string( 1 to 36);
constant text_size       : natural := 29;
constant text : text_t(0 to text_size-1) := (
"MAIN COMMANDS                       ",
"-------------                       ",
"J SADR (JUMP)                       ",
"L AADR EADR (LOAD FROM CASSETTE)    ",
"S AADR EADR (SAVE TO CASSETTE)      ",
"W AAAA EEEE (WINDOW)                ",
"                                    ",
"MEMORY OPERATIONS                   ",
"-----------------                   ",
"M AADR (MODIFY)                     ",
"D AADR EADR (DUMP)                  ",
"K AADR EADR BB (KILL)               ",
"T AADR ZADR ANZ (TRANSFER)          ",
"C ADR1 ADR2 ANZ (COMPARE)           ",
"F AADR ANZ AA BB CC .. (FIND)       ",
"                                    ",
"DEBUGGING                           ",
"---------                           ",
"I (INIT)                            ",
"B HADR (BREAKPOINT)                 ",
"E SADR (EXECUTE)                    ",
"G (GO)                              ",
"N (NEXT)                            ",
"R REG/REG' (REGISTER DISPLAY/MODIFY)",
"                                    ",
"KEYBOARD MODE                       ",
"-------------                       ",
"A (ALPHANUMERIC)                    ",
"H (HEXADECIMAL)                     "
);
end package text;

