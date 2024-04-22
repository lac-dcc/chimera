--
--  Wishbone VGA controller character RAM.
-- 
--  Copyright 2011 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity wb_char_ram_8x8 is
  port (
    a_wb_clk_i: in std_logic;
	 	a_wb_rst_i: in std_logic;
    a_wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    a_wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    a_wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    a_wb_we_i:  in std_logic;
    a_wb_cyc_i: in std_logic;
    a_wb_stb_i: in std_logic;
    a_wb_ack_o: out std_logic;
    a_wb_inta_o:out std_logic;

    b_wb_clk_i: in std_logic;
	 	b_wb_rst_i: in std_logic;
    b_wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    b_wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    b_wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    b_wb_we_i:  in std_logic;
    b_wb_cyc_i: in std_logic;
    b_wb_stb_i: in std_logic;
    b_wb_ack_o: out std_logic;
    b_wb_inta_o:out std_logic
  );
end entity wb_char_ram_8x8;

architecture behave of wb_char_ram_8x8 is

  subtype ramword is std_logic_vector(7 downto 0);

  type ramtype is array(0 to 2047) of ramword;

  shared variable charram: ramtype := (
x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"7e",x"81",x"a5",x"81",x"bd",x"99",x"81",x"7e",x"7e",x"ff",x"db",x"ff",x"c3",x"e7",x"ff",x"7e",x"6c",x"fe",x"fe",x"fe",x"7c",x"38",x"10",x"00",x"10",x"38",x"7c",x"fe",x"7c",x"38",x"10",x"00",x"38",x"7c",x"38",x"fe",x"fe",x"d6",x"10",x"38",x"10",x"38",x"7c",x"fe",x"fe",x"7c",x"10",x"38",x"00",x"00",x"18",x"3c",x"3c",x"18",x"00",x"00",x"ff",x"ff",x"e7",x"c3",x"c3",x"e7",x"ff",x"ff",x"00",x"3c",x"66",x"42",x"42",x"66",x"3c",x"00",x"ff",x"c3",x"99",x"bd",x"bd",x"99",x"c3",x"ff",x"0f",x"07",x"0f",x"7d",x"cc",x"cc",x"cc",x"78",x"3c",x"66",x"66",x"66",x"3c",x"18",x"7e",x"18",x"3f",x"33",x"3f",x"30",x"30",x"70",x"f0",x"e0",x"7f",x"63",x"7f",x"63",x"63",x"67",x"e6",x"c0",x"18",x"db",x"3c",x"e7",x"e7",x"3c",x"db",x"18",x"80",x"e0",x"f8",x"fe",x"f8",x"e0",x"80",x"00",x"02",x"0e",x"3e",x"fe",x"3e",x"0e",x"02",x"00",x"18",x"3c",x"7e",x"18",x"18",x"7e",x"3c",x"18",x"66",x"66",x"66",x"66",x"66",x"00",x"66",x"00",x"7f",x"db",x"db",x"7b",x"1b",x"1b",x"1b",x"00",x"3e",x"61",x"3c",x"66",x"66",x"3c",x"86",x"7c",x"00",x"00",x"00",x"00",x"7e",x"7e",x"7e",x"00",x"18",x"3c",x"7e",x"18",x"7e",x"3c",x"18",x"ff",x"18",x"3c",x"7e",x"18",x"18",x"18",x"18",x"00",x"18",x"18",x"18",x"18",x"7e",x"3c",x"18",x"00",x"00",x"18",x"0c",x"fe",x"0c",x"18",x"00",x"00",x"00",x"30",x"60",x"fe",x"60",x"30",x"00",x"00",x"00",x"00",x"c0",x"c0",x"c0",x"fe",x"00",x"00",x"00",x"24",x"66",x"ff",x"66",x"24",x"00",x"00",x"00",x"18",x"3c",x"7e",x"ff",x"ff",x"00",x"00",x"00",x"ff",x"ff",x"7e",x"3c",x"18",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"18",x"3c",x"3c",x"18",x"18",x"00",x"18",x"00",x"66",x"66",x"24",x"00",x"00",x"00",x"00",x"00",x"6c",x"6c",x"fe",x"6c",x"fe",x"6c",x"6c",x"00",x"18",x"3e",x"60",x"3c",x"06",x"7c",x"18",x"00",x"00",x"c6",x"cc",x"18",x"30",x"66",x"c6",x"00",x"38",x"6c",x"38",x"76",x"dc",x"cc",x"76",x"00",x"18",x"18",x"30",x"00",x"00",x"00",x"00",x"00",x"0c",x"18",x"30",x"30",x"30",x"18",x"0c",x"00",x"30",x"18",x"0c",x"0c",x"0c",x"18",x"30",x"00",x"00",x"66",x"3c",x"ff",x"3c",x"66",x"00",x"00",x"00",x"18",x"18",x"7e",x"18",x"18",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"18",x"18",x"30",x"00",x"00",x"00",x"7e",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"18",x"18",x"00",x"06",x"0c",x"18",x"30",x"60",x"c0",x"80",x"00",x"38",x"6c",x"c6",x"d6",x"c6",x"6c",x"38",x"00",x"18",x"38",x"18",x"18",x"18",x"18",x"7e",x"00",x"7c",x"c6",x"06",x"1c",x"30",x"66",x"fe",x"00",x"7c",x"c6",x"06",x"3c",x"06",x"c6",x"7c",x"00",x"1c",x"3c",x"6c",x"cc",x"fe",x"0c",x"1e",x"00",x"fe",x"c0",x"c0",x"fc",x"06",x"c6",x"7c",x"00",x"38",x"60",x"c0",x"fc",x"c6",x"c6",x"7c",x"00",x"fe",x"c6",x"0c",x"18",x"30",x"30",x"30",x"00",x"7c",x"c6",x"c6",x"7c",x"c6",x"c6",x"7c",x"00",x"7c",x"c6",x"c6",x"7e",x"06",x"0c",x"78",x"00",x"00",x"18",x"18",x"00",x"00",x"18",x"18",x"00",x"00",x"18",x"18",x"00",x"00",x"18",x"18",x"30",x"06",x"0c",x"18",x"30",x"18",x"0c",x"06",x"00",x"00",x"00",x"7e",x"00",x"00",x"7e",x"00",x"00",x"60",x"30",x"18",x"0c",x"18",x"30",x"60",x"00",x"7c",x"c6",x"0c",x"18",x"18",x"00",x"18",x"00",x"7c",x"c6",x"de",x"de",x"de",x"c0",x"78",x"00",x"38",x"6c",x"c6",x"fe",x"c6",x"c6",x"c6",x"00",x"fc",x"66",x"66",x"7c",x"66",x"66",x"fc",x"00",x"3c",x"66",x"c0",x"c0",x"c0",x"66",x"3c",x"00",x"f8",x"6c",x"66",x"66",x"66",x"6c",x"f8",x"00",x"fe",x"62",x"68",x"78",x"68",x"62",x"fe",x"00",x"fe",x"62",x"68",x"78",x"68",x"60",x"f0",x"00",x"3c",x"66",x"c0",x"c0",x"ce",x"66",x"3a",x"00",x"c6",x"c6",x"c6",x"fe",x"c6",x"c6",x"c6",x"00",x"3c",x"18",x"18",x"18",x"18",x"18",x"3c",x"00",x"1e",x"0c",x"0c",x"0c",x"cc",x"cc",x"78",x"00",x"e6",x"66",x"6c",x"78",x"6c",x"66",x"e6",x"00",x"f0",x"60",x"60",x"60",x"62",x"66",x"fe",x"00",x"c6",x"ee",x"fe",x"fe",x"d6",x"c6",x"c6",x"00",x"c6",x"e6",x"f6",x"de",x"ce",x"c6",x"c6",x"00",x"7c",x"c6",x"c6",x"c6",x"c6",x"c6",x"7c",x"00",x"fc",x"66",x"66",x"7c",x"60",x"60",x"f0",x"00",x"7c",x"c6",x"c6",x"c6",x"c6",x"ce",x"7c",x"0e",x"fc",x"66",x"66",x"7c",x"6c",x"66",x"e6",x"00",x"3c",x"66",x"30",x"18",x"0c",x"66",x"3c",x"00",x"7e",x"7e",x"5a",x"18",x"18",x"18",x"3c",x"00",x"c6",x"c6",x"c6",x"c6",x"c6",x"c6",x"7c",x"00",x"c6",x"c6",x"c6",x"c6",x"c6",x"6c",x"38",x"00",x"c6",x"c6",x"c6",x"d6",x"d6",x"fe",x"6c",x"00",x"c6",x"c6",x"6c",x"38",x"6c",x"c6",x"c6",x"00",x"66",x"66",x"66",x"3c",x"18",x"18",x"3c",x"00",x"fe",x"c6",x"8c",x"18",x"32",x"66",x"fe",x"00",x"3c",x"30",x"30",x"30",x"30",x"30",x"3c",x"00",x"c0",x"60",x"30",x"18",x"0c",x"06",x"02",x"00",x"3c",x"0c",x"0c",x"0c",x"0c",x"0c",x"3c",x"00",x"10",x"38",x"6c",x"c6",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"ff",x"30",x"18",x"0c",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"78",x"0c",x"7c",x"cc",x"76",x"00",x"e0",x"60",x"7c",x"66",x"66",x"66",x"dc",x"00",x"00",x"00",x"7c",x"c6",x"c0",x"c6",x"7c",x"00",x"1c",x"0c",x"7c",x"cc",x"cc",x"cc",x"76",x"00",x"00",x"00",x"7c",x"c6",x"fe",x"c0",x"7c",x"00",x"3c",x"66",x"60",x"f8",x"60",x"60",x"f0",x"00",x"00",x"00",x"76",x"cc",x"cc",x"7c",x"0c",x"f8",x"e0",x"60",x"6c",x"76",x"66",x"66",x"e6",x"00",x"18",x"00",x"38",x"18",x"18",x"18",x"3c",x"00",x"06",x"00",x"06",x"06",x"06",x"66",x"66",x"3c",x"e0",x"60",x"66",x"6c",x"78",x"6c",x"e6",x"00",x"38",x"18",x"18",x"18",x"18",x"18",x"3c",x"00",x"00",x"00",x"ec",x"fe",x"d6",x"d6",x"d6",x"00",x"00",x"00",x"dc",x"66",x"66",x"66",x"66",x"00",x"00",x"00",x"7c",x"c6",x"c6",x"c6",x"7c",x"00",x"00",x"00",x"dc",x"66",x"66",x"7c",x"60",x"f0",x"00",x"00",x"76",x"cc",x"cc",x"7c",x"0c",x"1e",x"00",x"00",x"dc",x"76",x"60",x"60",x"f0",x"00",x"00",x"00",x"7e",x"c0",x"7c",x"06",x"fc",x"00",x"30",x"30",x"fc",x"30",x"30",x"36",x"1c",x"00",x"00",x"00",x"cc",x"cc",x"cc",x"cc",x"76",x"00",x"00",x"00",x"c6",x"c6",x"c6",x"6c",x"38",x"00",x"00",x"00",x"c6",x"d6",x"d6",x"fe",x"6c",x"00",x"00",x"00",x"c6",x"6c",x"38",x"6c",x"c6",x"00",x"00",x"00",x"c6",x"c6",x"c6",x"7e",x"06",x"fc",x"00",x"00",x"7e",x"4c",x"18",x"32",x"7e",x"00",x"0e",x"18",x"18",x"70",x"18",x"18",x"0e",x"00",x"18",x"18",x"18",x"18",x"18",x"18",x"18",x"00",x"70",x"18",x"18",x"0e",x"18",x"18",x"70",x"00",x"76",x"dc",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"10",x"38",x"6c",x"c6",x"c6",x"fe",x"00",x"7c",x"c6",x"c0",x"c0",x"c6",x"7c",x"0c",x"78",x"cc",x"00",x"cc",x"cc",x"cc",x"cc",x"76",x"00",x"0c",x"18",x"7c",x"c6",x"fe",x"c0",x"7c",x"00",x"7c",x"82",x"78",x"0c",x"7c",x"cc",x"76",x"00",x"c6",x"00",x"78",x"0c",x"7c",x"cc",x"76",x"00",x"30",x"18",x"78",x"0c",x"7c",x"cc",x"76",x"00",x"30",x"30",x"78",x"0c",x"7c",x"cc",x"76",x"00",x"00",x"00",x"7e",x"c0",x"c0",x"7e",x"0c",x"38",x"7c",x"82",x"7c",x"c6",x"fe",x"c0",x"7c",x"00",x"c6",x"00",x"7c",x"c6",x"fe",x"c0",x"7c",x"00",x"30",x"18",x"7c",x"c6",x"fe",x"c0",x"7c",x"00",x"66",x"00",x"38",x"18",x"18",x"18",x"3c",x"00",x"7c",x"82",x"38",x"18",x"18",x"18",x"3c",x"00",x"30",x"18",x"00",x"38",x"18",x"18",x"3c",x"00",x"c6",x"38",x"6c",x"c6",x"fe",x"c6",x"c6",x"00",x"38",x"6c",x"7c",x"c6",x"fe",x"c6",x"c6",x"00",x"18",x"30",x"fe",x"c0",x"f8",x"c0",x"fe",x"00",x"00",x"00",x"7e",x"12",x"fe",x"90",x"fe",x"00",x"3e",x"6c",x"cc",x"fe",x"cc",x"cc",x"ce",x"00",x"7c",x"82",x"7c",x"c6",x"c6",x"c6",x"7c",x"00",x"c6",x"00",x"7c",x"c6",x"c6",x"c6",x"7c",x"00",x"30",x"18",x"7c",x"c6",x"c6",x"c6",x"7c",x"00",x"78",x"84",x"00",x"cc",x"cc",x"cc",x"76",x"00",x"60",x"30",x"cc",x"cc",x"cc",x"cc",x"76",x"00",x"c6",x"00",x"c6",x"c6",x"c6",x"7e",x"06",x"fc",x"c6",x"38",x"6c",x"c6",x"c6",x"6c",x"38",x"00",x"c6",x"00",x"c6",x"c6",x"c6",x"c6",x"7c",x"00",x"00",x"02",x"7c",x"ce",x"d6",x"e6",x"7c",x"80",x"38",x"6c",x"64",x"f0",x"60",x"66",x"fc",x"00",x"3a",x"6c",x"ce",x"d6",x"e6",x"6c",x"b8",x"00",x"00",x"c6",x"6c",x"38",x"6c",x"c6",x"00",x"00",x"0e",x"1b",x"18",x"3c",x"18",x"d8",x"70",x"00",x"18",x"30",x"78",x"0c",x"7c",x"cc",x"76",x"00",x"0c",x"18",x"00",x"38",x"18",x"18",x"3c",x"00",x"0c",x"18",x"7c",x"c6",x"c6",x"c6",x"7c",x"00",x"18",x"30",x"cc",x"cc",x"cc",x"cc",x"76",x"00",x"76",x"dc",x"00",x"dc",x"66",x"66",x"66",x"00",x"76",x"dc",x"00",x"e6",x"f6",x"de",x"ce",x"00",x"3c",x"6c",x"6c",x"3e",x"00",x"7e",x"00",x"00",x"38",x"6c",x"6c",x"38",x"00",x"7c",x"00",x"00",x"18",x"00",x"18",x"18",x"30",x"63",x"3e",x"00",x"7e",x"81",x"b9",x"a5",x"b9",x"a5",x"81",x"7e",x"00",x"00",x"00",x"fe",x"06",x"06",x"00",x"00",x"63",x"e6",x"6c",x"7e",x"33",x"66",x"cc",x"0f",x"63",x"e6",x"6c",x"7a",x"36",x"6a",x"df",x"06",x"18",x"00",x"18",x"18",x"3c",x"3c",x"18",x"00",x"00",x"33",x"66",x"cc",x"66",x"33",x"00",x"00",x"00",x"cc",x"66",x"33",x"66",x"cc",x"00",x"00",x"22",x"88",x"22",x"88",x"22",x"88",x"22",x"88",x"55",x"aa",x"55",x"aa",x"55",x"aa",x"55",x"aa",x"77",x"dd",x"77",x"dd",x"77",x"dd",x"77",x"dd",x"18",x"18",x"18",x"18",x"18",x"18",x"18",x"18",x"18",x"18",x"18",x"18",x"f8",x"18",x"18",x"18",x"30",x"60",x"38",x"6c",x"c6",x"fe",x"c6",x"00",x"7c",x"82",x"38",x"6c",x"c6",x"fe",x"c6",x"00",x"18",x"0c",x"38",x"6c",x"c6",x"fe",x"c6",x"00",x"7e",x"81",x"9d",x"a1",x"a1",x"9d",x"81",x"7e",x"36",x"36",x"f6",x"06",x"f6",x"36",x"36",x"36",x"36",x"36",x"36",x"36",x"36",x"36",x"36",x"36",x"00",x"00",x"fe",x"06",x"f6",x"36",x"36",x"36",x"36",x"36",x"f6",x"06",x"fe",x"00",x"00",x"00",x"18",x"18",x"7e",x"c0",x"c0",x"7e",x"18",x"18",x"66",x"66",x"3c",x"7e",x"18",x"7e",x"18",x"18",x"00",x"00",x"00",x"00",x"f8",x"18",x"18",x"18",x"18",x"18",x"18",x"18",x"1f",x"00",x"00",x"00",x"18",x"18",x"18",x"18",x"ff",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"ff",x"18",x"18",x"18",x"18",x"18",x"18",x"18",x"1f",x"18",x"18",x"18",x"00",x"00",x"00",x"00",x"ff",x"00",x"00",x"00",x"18",x"18",x"18",x"18",x"ff",x"18",x"18",x"18",x"76",x"dc",x"7c",x"06",x"7e",x"c6",x"7e",x"00",x"76",x"dc",x"38",x"6c",x"c6",x"fe",x"c6",x"00",x"36",x"36",x"37",x"30",x"3f",x"00",x"00",x"00",x"00",x"00",x"3f",x"30",x"37",x"36",x"36",x"36",x"36",x"36",x"f7",x"00",x"ff",x"00",x"00",x"00",x"00",x"00",x"ff",x"00",x"f7",x"36",x"36",x"36",x"36",x"36",x"37",x"30",x"37",x"36",x"36",x"36",x"00",x"00",x"ff",x"00",x"ff",x"00",x"00",x"00",x"36",x"36",x"f7",x"00",x"f7",x"36",x"36",x"36",x"00",x"c6",x"7c",x"c6",x"c6",x"7c",x"c6",x"00",x"30",x"7e",x"0c",x"7c",x"cc",x"cc",x"78",x"00",x"f8",x"6c",x"66",x"f6",x"66",x"6c",x"f8",x"00",x"7c",x"82",x"fe",x"c0",x"fc",x"c0",x"fe",x"00",x"c6",x"00",x"fe",x"c0",x"fc",x"c0",x"fe",x"00",x"30",x"18",x"fe",x"c0",x"fc",x"c0",x"fe",x"00",x"00",x"00",x"38",x"18",x"18",x"18",x"3c",x"00",x"0c",x"18",x"3c",x"18",x"18",x"18",x"3c",x"00",x"3c",x"42",x"3c",x"18",x"18",x"18",x"3c",x"00",x"66",x"00",x"3c",x"18",x"18",x"18",x"3c",x"00",x"18",x"18",x"18",x"18",x"f8",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"1f",x"18",x"18",x"18",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"00",x"00",x"00",x"00",x"ff",x"ff",x"ff",x"ff",x"18",x"18",x"18",x"00",x"00",x"18",x"18",x"18",x"30",x"18",x"3c",x"18",x"18",x"18",x"3c",x"00",x"ff",x"ff",x"ff",x"ff",x"00",x"00",x"00",x"00",x"30",x"60",x"38",x"6c",x"c6",x"6c",x"38",x"00",x"78",x"cc",x"cc",x"d8",x"cc",x"c6",x"cc",x"00",x"7c",x"82",x"38",x"6c",x"c6",x"6c",x"38",x"00",x"0c",x"06",x"38",x"6c",x"c6",x"6c",x"38",x"00",x"76",x"dc",x"7c",x"c6",x"c6",x"c6",x"7c",x"00",x"76",x"dc",x"38",x"6c",x"c6",x"6c",x"38",x"00",x"00",x"00",x"66",x"66",x"66",x"66",x"7c",x"c0",x"e0",x"60",x"7c",x"66",x"66",x"7c",x"60",x"f0",x"f0",x"60",x"7c",x"66",x"7c",x"60",x"f0",x"00",x"18",x"30",x"c6",x"c6",x"c6",x"c6",x"7c",x"00",x"7c",x"82",x"00",x"c6",x"c6",x"c6",x"7c",x"00",x"60",x"30",x"c6",x"c6",x"c6",x"c6",x"7c",x"00",x"18",x"30",x"c6",x"c6",x"c6",x"7e",x"06",x"fc",x"0c",x"18",x"66",x"66",x"3c",x"18",x"3c",x"00",x"ff",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"0c",x"18",x"30",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"7e",x"00",x"00",x"00",x"00",x"18",x"18",x"7e",x"18",x"18",x"00",x"7e",x"00",x"00",x"00",x"00",x"00",x"00",x"ff",x"00",x"ff",x"e1",x"32",x"e4",x"3a",x"f6",x"2a",x"5f",x"86",x"7f",x"db",x"db",x"7b",x"1b",x"1b",x"1b",x"00",x"3e",x"61",x"3c",x"66",x"66",x"3c",x"86",x"7c",x"00",x"18",x"00",x"7e",x"00",x"18",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"18",x"0c",x"38",x"38",x"6c",x"6c",x"38",x"00",x"00",x"00",x"00",x"00",x"c6",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"18",x"00",x"00",x"00",x"00",x"18",x"38",x"18",x"18",x"3c",x"00",x"00",x"00",x"78",x"0c",x"38",x"0c",x"78",x"00",x"00",x"00",x"78",x"0c",x"18",x"30",x"7c",x"00",x"00",x"00",x"00",x"00",x"3c",x"3c",x"3c",x"3c",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"
  );
  signal a_selected: std_logic;
  signal a_read_ended: std_logic;
  signal b_selected: std_logic;
  signal b_read_ended: std_logic;

begin

  a_selected <= '1' when a_wb_cyc_i='1' and a_wb_stb_i='1' else '0';
  b_selected <= '1' when b_wb_cyc_i='1' and b_wb_stb_i='1' else '0';
  a_wb_inta_o <= '0';
  b_wb_inta_o <= '0';

  process(a_wb_clk_i)
  begin
    if rising_edge(a_wb_clk_i) then
      if a_wb_rst_i='1' then
        a_read_ended<='0';
      else
        a_read_ended<=a_selected and not a_wb_we_i;
      end if;
    end if;
  end process;

  process(b_wb_clk_i)
  begin
    if rising_edge(b_wb_clk_i) then
      if b_wb_rst_i='1' then
        b_read_ended<='0';
      else
        b_read_ended<=b_selected and not b_wb_we_i;
      end if;
    end if;
  end process;

  a_wb_ack_o <= a_selected and (a_read_ended or a_wb_we_i);
  b_wb_ack_o <= b_selected and (b_read_ended or b_wb_we_i);

  a_wb_dat_o(31 downto 8) <= (others => '0');
  b_wb_dat_o(31 downto 8) <= (others => '0');

  process(a_wb_clk_i)
  begin
    if rising_edge(a_wb_clk_i) then
      if a_selected='1' then
        if a_wb_we_i='1' then
          charram(conv_integer(a_wb_adr_i(12 downto 2))):=a_wb_dat_i(7 downto 0);
        end if;
        a_wb_dat_o(7 downto 0) <= charram(conv_integer(a_wb_adr_i(12 downto 2)));
      end if;
    end if;
  end process;

  process(b_wb_clk_i)
  begin
    if rising_edge(b_wb_clk_i) then
      if b_selected='1' then
        if b_wb_we_i='1' then
          charram(conv_integer(b_wb_adr_i(12 downto 2))):=b_wb_dat_i(7 downto 0);
        end if;
        b_wb_dat_o(7 downto 0) <= charram(conv_integer(b_wb_adr_i(12 downto 2)));
      end if;
    end if;
  end process;

end behave;
