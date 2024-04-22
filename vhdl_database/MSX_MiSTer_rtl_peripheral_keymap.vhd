--
-- keymap.vhd
--   keymap ROM tables for eseps2.vhd
--   Revision 1.00
--
-- Copyright (c) 2006 Kazuhiro Tsujikawa (ESE Artists' factory)
-- All rights reserved.
--
-- Redistribution and use of this source code or any derivative works, are
-- permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice,
--    this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright
--    notice, this list of conditions and the following disclaimer in the
--    documentation and/or other materials provided with the distribution.
-- 3. Redistributions may not be sold, nor may they be used in a commercial
--    product or activity without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
-- TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-- OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-- WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
-- OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
-- 2018.07.27 modified by KdL
-- Added optional scancode $61 '\|' to the English keyboard.
--
-- 2013.08.12 modified by KdL
-- Added RWIN and LWIN usable as alternatives to the space-bar.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity keymap is
  port (
    adr : in std_logic_vector(10 downto 0);
    clk : in std_logic;
    dbi : out std_logic_vector(7 downto 0)
  );
end keymap;

architecture RTL of keymap is

type rom_101 is array (0 to 1023) of std_logic_vector(7 downto 0);
type rom_106 is array (0 to 511) of std_logic_vector(7 downto 0);

constant rom101 : rom_101 := (

-- Special keys for English 101/104 Keyboard
-- PS/2 KEYS       : MSX KEYS
-----------------------------------
-- F6  ($0B)       : [GRAPH]   ($26)
-- F7  ($83)       : [KANA]    ($46)
-- F8  ($0A)       : [SELECT]  ($67)
-- END ($E0 $69)   : [STOP]    ($47)
-- ALT R ($E0 $11) : [GRAPH]   ($26)
-- ALT L ($11)     : [GRAPH]   ($26)

-- 101 keyboard (set 2) / Shift = OFF

        X"FF", X"7F", X"7F", X"17", X"76", X"56", X"66", X"7F", -- 00
        X"7F", X"7F", X"67", X"26", X"07", X"37", X"D1", X"7F", -- 08
        X"7F", X"26", X"06", X"46", X"16", X"64", X"10", X"7F", -- 10
        X"7F", X"7F", X"75", X"05", X"62", X"45", X"20", X"7F", -- 18
        X"7F", X"03", X"55", X"13", X"23", X"40", X"30", X"7F", -- 20
        X"7F", X"08", X"35", X"33", X"15", X"74", X"50", X"7F", -- 28
        X"7F", X"34", X"72", X"53", X"43", X"65", X"60", X"7F", -- 30
        X"7F", X"7F", X"24", X"73", X"25", X"70", X"01", X"7F", -- 38
        X"7F", X"22", X"04", X"63", X"44", X"00", X"11", X"7F", -- 40
        X"7F", X"32", X"42", X"14", X"71", X"54", X"21", X"7F", -- 48
        X"7F", X"52", X"F0", X"7F", X"61", X"A1", X"7F", X"7F", -- 50
        X"36", X"06", X"77", X"12", X"7F", X"41", X"7F", X"7F", -- 58
        X"7F", X"41", X"7F", X"7F", X"1B", X"7F", X"57", X"3B", -- 60
        X"7F", X"49", X"41", X"79", X"2A", X"7F", X"7F", X"7F", -- 68
        X"39", X"7A", X"59", X"0A", X"1A", X"3A", X"27", X"6A", -- 70
        X"7F", X"19", X"69", X"5A", X"09", X"4A", X"7F", X"7F", -- 78
        X"7F", X"7F", X"7F", X"46", X"7F", X"7F", X"7F", X"7F", -- 80
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 88
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 90
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 98
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- A0
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- A8
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- B0
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- B8
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- C0
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- C8
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- D0
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- D8
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- E0
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- E8
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- F0
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- F8

        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 00
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 08
        X"7F", X"26", X"7F", X"7F", X"16", X"7F", X"7F", X"7F", -- 10
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"08", -- 18  (LWIN = $1F = SPACE)
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"08", -- 20  (RWIN = $27 = SPACE)
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 28
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 30
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 38
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 40
        X"7F", X"7F", X"29", X"7F", X"7F", X"7F", X"7F", X"7F", -- 48
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 50
        X"7F", X"7F", X"77", X"7F", X"7F", X"7F", X"7F", X"7F", -- 58
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 60
        X"7F", X"47", X"7F", X"48", X"18", X"7F", X"7F", X"7F", -- 68
        X"28", X"38", X"68", X"7F", X"78", X"58", X"7F", X"7F", -- 70
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 78
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 80
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 88
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 90
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- 98
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- A0
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- A8
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- B0
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- B8
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- C0
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- C8
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- D0
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- D8
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- E0
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- E8
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- F0
        X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", X"7F", -- F8

-- 101 keyboard (set 2) / Shift = ON

        X"FF", X"FF", X"FF", X"97", X"F6", X"D6", X"E6", X"FF", -- 00
        X"FF", X"FF", X"E7", X"E6", X"87", X"B7", X"B1", X"FF", -- 08
        X"FF", X"A6", X"86", X"C6", X"96", X"E4", X"90", X"FF", -- 10
        X"FF", X"FF", X"F5", X"85", X"E2", X"C5", X"51", X"FF", -- 18
        X"FF", X"83", X"D5", X"93", X"A3", X"C0", X"B0", X"FF", -- 20
        X"FF", X"88", X"B5", X"B3", X"95", X"F4", X"D0", X"FF", -- 28
        X"FF", X"B4", X"F2", X"D3", X"C3", X"E5", X"31", X"FF", -- 30
        X"FF", X"FF", X"A4", X"F3", X"A5", X"E0", X"82", X"FF", -- 38
        X"FF", X"A2", X"84", X"E3", X"C4", X"91", X"81", X"FF", -- 40
        X"FF", X"B2", X"C2", X"94", X"02", X"D4", X"D2", X"FF", -- 48
        X"FF", X"D2", X"A0", X"FF", X"E1", X"F1", X"FF", X"FF", -- 50
        X"B6", X"86", X"F7", X"92", X"FF", X"C1", X"FF", X"FF", -- 58
        X"FF", X"C1", X"FF", X"FF", X"9B", X"FF", X"D7", X"BB", -- 60
        X"FF", X"C9", X"C1", X"F9", X"AA", X"FF", X"FF", X"FF", -- 68
        X"B9", X"FA", X"D9", X"8A", X"9A", X"BA", X"A7", X"EA", -- 70
        X"FF", X"99", X"E9", X"DA", X"89", X"BA", X"FF", X"FF", -- 78
        X"FF", X"FF", X"FF", X"C6", X"FF", X"FF", X"FF", X"FF", -- 80
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 88
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 90
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 98
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- A0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- A8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- B0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- B8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- C0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- C8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- D0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- D8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- E0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- E8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- F0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- F8

        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 00
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 08
        X"FF", X"A6", X"FF", X"FF", X"96", X"FF", X"FF", X"FF", -- 10
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"88", -- 18  (LWIN = $1F = SHIFT + SPACE)
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"88", -- 20  (RWIN = $27 = SHIFT + SPACE)
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 28
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 30
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 38
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 40
        X"FF", X"FF", X"29", X"FF", X"FF", X"FF", X"FF", X"FF", -- 48
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 50
        X"FF", X"FF", X"77", X"FF", X"FF", X"FF", X"FF", X"FF", -- 58
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 60
        X"FF", X"C7", X"FF", X"C8", X"98", X"FF", X"FF", X"FF", -- 68
        X"A8", X"B8", X"E8", X"FF", X"F8", X"D8", X"FF", X"FF", -- 70
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 78
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 80
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 88
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 90
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 98
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- A0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- A8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- B0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- B8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- C0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- C8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- D0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- D8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- E0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- E8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- F0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF"  -- F8
);

constant rom106 : rom_106 := (

-- Special keys for Japanese 106 Keyboard
-- PS/2 KEYS       : MSX KEYS
-----------------------------------
-- F6  ($0B)         : [GRAPH]  ($26)
-- F7  ($83)         : [KANA]   ($46)
-- F8  ($0A)         : [SELECT] ($67)
-- END ($E0 $69)     : [STOP]   ($47)
-- Han/Zenkaku ($0E) : [SELECT] ($67)
-- Katakana ($13)    : [KANA]   ($46)
-- ALT R ($E0 11)    : [GRAPH]  ($26)
-- ALT L ($11)       : [GRAPH]  ($26)

-- Keymap for 106 keyboard (set 2)

        X"FF", X"FF", X"FF", X"17", X"76", X"56", X"66", X"FF", -- 00
        X"FF", X"FF", X"67", X"26", X"07", X"37", X"67", X"FF", -- 08
        X"FF", X"26", X"06", X"46", X"16", X"64", X"10", X"FF", -- 10
        X"FF", X"FF", X"75", X"05", X"62", X"45", X"20", X"FF", -- 18
        X"FF", X"03", X"55", X"13", X"23", X"40", X"30", X"FF", -- 20
        X"FF", X"08", X"35", X"33", X"15", X"74", X"50", X"FF", -- 28
        X"FF", X"34", X"72", X"53", X"43", X"65", X"60", X"FF", -- 30
        X"FF", X"FF", X"24", X"73", X"25", X"70", X"01", X"FF", -- 38
        X"FF", X"22", X"04", X"63", X"44", X"00", X"11", X"FF", -- 40
        X"FF", X"32", X"42", X"14", X"71", X"54", X"21", X"FF", -- 48
        X"FF", X"52", X"02", X"FF", X"51", X"31", X"FF", X"FF", -- 50
        X"36", X"06", X"77", X"61", X"FF", X"12", X"FF", X"FF", -- 58
        X"FF", X"FF", X"FF", X"FF", X"1B", X"FF", X"57", X"3B", -- 60
        X"FF", X"49", X"41", X"79", X"2A", X"FF", X"FF", X"FF", -- 68
        X"39", X"7A", X"59", X"0A", X"1A", X"3A", X"27", X"6A", -- 70
        X"FF", X"19", X"69", X"5A", X"09", X"4A", X"FF", X"FF", -- 78
        X"FF", X"FF", X"FF", X"46", X"FF", X"FF", X"FF", X"FF", -- 80
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 88
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 90
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 98
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- A0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- A8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- B0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- B8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- C0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- C8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- D0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- D8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- E0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- E8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- F0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- F8

        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 00
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 08
        X"FF", X"26", X"FF", X"FF", X"16", X"FF", X"FF", X"FF", -- 10
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"08", -- 18  (LWIN = $1F = SPACE)
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"08", -- 20  (RWIN = $27 = SPACE)
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 28
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 30
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 38
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 40
        X"FF", X"FF", X"29", X"FF", X"FF", X"FF", X"FF", X"FF", -- 48
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 50
        X"FF", X"FF", X"77", X"FF", X"FF", X"FF", X"FF", X"FF", -- 58
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 60
        X"FF", X"47", X"FF", X"48", X"18", X"FF", X"FF", X"FF", -- 68
        X"28", X"38", X"68", X"FF", X"78", X"58", X"FF", X"FF", -- 70
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 78
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 80
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 88
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 90
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 98
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- A0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- A8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- B0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- B8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- C0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- C8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- D0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- D8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- E0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- E8
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- F0
        X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF"  -- F8
);

  signal dbi1,dbi2 : std_logic_vector(7 downto 0);

begin

process (clk) begin
  if (clk'event and clk = '1') then
    dbi1 <= rom101(conv_integer(adr(9 downto 0)));
    dbi2 <= rom106(conv_integer(adr(8 downto 0)));
  end if;
end process;

dbi <= dbi1 when adr(10) = '0' else dbi2;

end RTL;
