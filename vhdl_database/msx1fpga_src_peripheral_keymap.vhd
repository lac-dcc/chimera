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
-- 2013.08.12 modified by KdL
-- Added RWIN and LWIN usable as alternatives to the space-bar.
--
-- 2015.05.20	- Brazilian ABNT2 keymap by Fabio Belavenuto
-- 2016.11		- Implemented Keymap change via software (SWIOPORTS)
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keymap is
	port (
		clock_i		: in  std_logic;
		we_n_i		: in  std_logic;
		addr_wr_i	: in  std_logic_vector(8 downto 0);
		data_i		: in  std_logic_vector(7 downto 0);
		addr_rd_i	: in  std_logic_vector(8 downto 0);
		data_o		: out std_logic_vector(7 downto 0)
	);
end entity;

architecture RTL of keymap is

	signal read_addr_q : unsigned(8 downto 0);
	type ram_t is array (0 to 511) of std_logic_vector(7 downto 0);
	signal ram_q : ram_t := (

	--
	--  bit    7 F   6 E   5 D   4 C   3 B   2 A   1 9   0 8
	--       +-----+-----+-----+-----+-----+-----+-----+-----+
	-- ROW 0 | 7 & | 6 ^ | 5 % | 4 $ | 3 # | 2 @ | 1 ! | 0 ) |  0
	--       +-----+-----+-----+-----+-----+-----+-----+-----+
	-- ROW 1 | ; : | ] } | [ { | \ | | = + | - _ | 9 ( | 8 * |  1
	--       +-----+-----+-----+-----+-----+-----+-----+-----+
	-- ROW 2 |  B  |  A  |DEAD | / ? | . > | , < | ` ~ | ' " |  2
	--       +-----+-----+-----+-----+-----+-----+-----+-----+
	-- ROW 3 |  J  |  I  |  H  |  G  |  F  |  E  |  D  |  C  |  3
	--       +-----+-----+-----+-----+-----+-----+-----+-----+
	-- ROW 4 |  R  |  Q  |  P  |  O  |  N  |  M  |  L  |  K  |  4
	--       +-----+-----+-----+-----+-----+-----+-----+-----+
	-- ROW 5 |  Z  |  Y  |  X  |  W  |  V  |  U  |  T  |  S  |  5
	--       +-----+-----+-----+-----+-----+-----+-----+-----+
	-- ROW 6 | F3  | F2  | F1  | Code|CapsL|Graph| Ctrl|Shift|  6
	--       +-----+-----+-----+-----+-----+-----+-----+-----+
	-- ROW 7 |Enter|Selec| BS  | Stop| Tab | Esc | F5  | F4  |  7
	--       +-----+-----+-----+-----+-----+-----+-----+-----+
	-- ROW 8 |Right| Down| Up  | Left| Del | Ins | Home|Space|  8
	--       +-----+-----+-----+-----+-----+-----+-----+-----+
	-- ROW 9 | [4] | [3] | [2] | [1] | [0] | [/] | [+] | [*] |  9
	--       +-----+-----+-----+-----+-----+-----+-----+-----+
	-- ROW 10| [.] | [,] | [-] | [9] | [8] | [7] | [6] | [5] |  A
	--       +-----+-----+-----+-----+-----+-----+-----+-----+
	-- bit     7 F   6 E   5 D   4 C   3 B   2 A   1 9   0 8

	--------------------------------------------
	-- 108 Keys Brazilian keyboard: Scancode  --
	--------------------------------------------
--              F9            F5     F3     F1     F2     F12
		X"FF", X"FF", X"FF", X"17", X"76", X"56", X"66", X"FF", -- 00..07
--              F10    F8     F6     F4     Tab    '/"
		X"FF", X"FF", X"FF", X"FF", X"07", X"37", X"02", X"FF", -- 08..0F
--              LAlt  LShft         LCtrl   Q      1/!
		X"FF", X"26", X"06", X"FF", X"16", X"64", X"10", X"FF", -- 10..17
--                     Z      S      A      W      2/@
		X"FF", X"FF", X"75", X"05", X"62", X"45", X"20", X"FF", -- 18..1F
--              C      X      D      E      4/$    3/#
		X"FF", X"03", X"55", X"13", X"23", X"40", X"30", X"FF", -- 20..27
--             Space   V      F      T      R      5/%
		X"FF", X"08", X"35", X"33", X"15", X"74", X"50", X"FF", -- 28..2F
--              N      B      H      G      Y      6/¨
		X"FF", X"34", X"72", X"53", X"43", X"65", X"60", X"FF", -- 30..37
--                     M      J      U      7/&    8/*
		X"FF", X"FF", X"24", X"73", X"25", X"70", X"01", X"FF", -- 38..3F
--              ,/<    K      I      O      0/)    9/(
		X"FF", X"22", X"04", X"63", X"44", X"00", X"11", X"FF", -- 40..47
--              ./>    ;/:    L      Ç      P      -/_
		X"FF", X"32", X"71", X"14", X"FF", X"54", X"21", X"FF", -- 48..4F
--              //?    ~/^           ´/`    =/+
		X"FF", X"42", X"12", X"FF", X"52", X"31", X"FF", X"FF", -- 50..57
--      CapLk  RShft  Enter   [/{           ]/}
		X"36", X"06", X"77", X"51", X"FF", X"61", X"FF", X"FF", -- 58..5F
--              \/|                                BS
		X"FF", X"41", X"FF", X"FF", X"FF", X"FF", X"57", X"FF", -- 60..67
--              [1]           [4]    [7]    [.]
		X"FF", X"49", X"FF", X"79", X"2A", X"7A", X"FF", X"FF", -- 68..6F
--       [0]    [,]    [2]    [5]    [6]    [8]    Esc   NLock
		X"39", X"6A", X"59", X"0A", X"1A", X"3A", X"27", X"FF", -- 70..77
--       F11    [+]    [3]    [-]    [*]    [9]   ScrLk
		X"FF", X"19", X"69", X"5A", X"09", X"4A", X"FF", X"FF", -- 78..7F
--                            F7
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 80..87
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 88..8F
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 90..97
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 98..9F
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- A0..A7
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- A8..AF
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- B0..B7
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- B8..BF
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- C0..C7
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- C8..CF
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- D0..D7
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- D8..DF
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- E0..E7
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- E8..EF
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- F0..F7
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- F8..FF

	-------------------------------------------------
	-- 108 Keys Brazilian keyboard: E0 + Scan Code --
	-------------------------------------------------

--
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 00..07
--
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 08..0F
--             RAlt   PrtSc         RCtrl
		X"FF", X"26", X"FF", X"FF", X"16", X"FF", X"FF", X"FF", -- 10..17
--                                                        LWin
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"08", -- 18..1F  (LWIN = $1F = SPACE)
--                                                        RWin
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"08", -- 20..27  (RWIN = $27 = SPACE)
--                                                        Menu
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 28..2F	(MENU = $2F = 'M' key)
--                                                       Power
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 30..37
--                                                       Sleep
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 38..3F
--
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 40..47
--                     [/]
		X"FF", X"FF", X"29", X"FF", X"FF", X"FF", X"FF", X"FF", -- 48..4F
--
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 50..57
--                    [Enter]                      Wake
		X"FF", X"FF", X"77", X"FF", X"FF", X"FF", X"FF", X"FF", -- 58..5F
--
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 60..67
--              End           Left   Home
		X"FF", X"47", X"FF", X"48", X"18", X"FF", X"FF", X"FF", -- 68..6F
--       Ins    Supr   Down         Right   Up
		X"28", X"38", X"68", X"FF", X"78", X"58", X"FF", X"FF", -- 70..77
--                    PDown                 PUp
		X"FF", X"FF", X"46", X"FF", X"FF", X"67", X"FF", X"FF", -- 78..7F
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 80..87
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 88..8F
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 90..97
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- 98..9F
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- A0..A7
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- A8..AF
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- B0..B7
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- B8..BF
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- C0..C7
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- C8..CF
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- D0..D7
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- D8..DF
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- E0..E7
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- E8..EF
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", -- F0..F7
		X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF", X"FF"  -- F8..FF
	);
begin

	process (clock_i)
	begin
		if rising_edge(clock_i) then
			if we_n_i = '0' then
				ram_q(to_integer(unsigned(addr_wr_i))) <= data_i;
			end if;
			read_addr_q <= unsigned(addr_rd_i);
		end if;
	end process;

	data_o <= ram_q(to_integer(read_addr_q));

end RTL;
