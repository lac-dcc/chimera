-- VHDL implementation of AES
-- Copyright (C) 2019  Hosein Hadipour

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

library ieee;
use ieee.std_logic_1164.all;

entity sbox is
	port (
		input_byte : in std_logic_vector(7 downto 0);
		output_byte : out std_logic_vector(7 downto 0)
	);
end sbox;

architecture behavioral of sbox is

begin
	lut : process (input_byte) is
	begin
		case input_byte is
			when x"00" => output_byte <= x"63";
			when x"01" => output_byte <= x"7c";
			when x"02" => output_byte <= x"77";
			when x"03" => output_byte <= x"7b";
			when x"04" => output_byte <= x"f2";
			when x"05" => output_byte <= x"6b";
			when x"06" => output_byte <= x"6f";
			when x"07" => output_byte <= x"c5";
			when x"08" => output_byte <= x"30";
			when x"09" => output_byte <= x"01";
			when x"0a" => output_byte <= x"67";
			when x"0b" => output_byte <= x"2b";
			when x"0c" => output_byte <= x"fe";
			when x"0d" => output_byte <= x"d7";
			when x"0e" => output_byte <= x"ab";
			when x"0f" => output_byte <= x"76";
			when x"10" => output_byte <= x"ca";
			when x"11" => output_byte <= x"82";
			when x"12" => output_byte <= x"c9";
			when x"13" => output_byte <= x"7d";
			when x"14" => output_byte <= x"fa";
			when x"15" => output_byte <= x"59";
			when x"16" => output_byte <= x"47";
			when x"17" => output_byte <= x"f0";
			when x"18" => output_byte <= x"ad";
			when x"19" => output_byte <= x"d4";
			when x"1a" => output_byte <= x"a2";
			when x"1b" => output_byte <= x"af";
			when x"1c" => output_byte <= x"9c";
			when x"1d" => output_byte <= x"a4";
			when x"1e" => output_byte <= x"72";
			when x"1f" => output_byte <= x"c0";
			when x"20" => output_byte <= x"b7";
			when x"21" => output_byte <= x"fd";
			when x"22" => output_byte <= x"93";
			when x"23" => output_byte <= x"26";
			when x"24" => output_byte <= x"36";
			when x"25" => output_byte <= x"3f";
			when x"26" => output_byte <= x"f7";
			when x"27" => output_byte <= x"cc";
			when x"28" => output_byte <= x"34";
			when x"29" => output_byte <= x"a5";
			when x"2a" => output_byte <= x"e5";
			when x"2b" => output_byte <= x"f1";
			when x"2c" => output_byte <= x"71";
			when x"2d" => output_byte <= x"d8";
			when x"2e" => output_byte <= x"31";
			when x"2f" => output_byte <= x"15";
			when x"30" => output_byte <= x"04";
			when x"31" => output_byte <= x"c7";
			when x"32" => output_byte <= x"23";
			when x"33" => output_byte <= x"c3";
			when x"34" => output_byte <= x"18";
			when x"35" => output_byte <= x"96";
			when x"36" => output_byte <= x"05";
			when x"37" => output_byte <= x"9a";
			when x"38" => output_byte <= x"07";
			when x"39" => output_byte <= x"12";
			when x"3a" => output_byte <= x"80";
			when x"3b" => output_byte <= x"e2";
			when x"3c" => output_byte <= x"eb";
			when x"3d" => output_byte <= x"27";
			when x"3e" => output_byte <= x"b2";
			when x"3f" => output_byte <= x"75";
			when x"40" => output_byte <= x"09";
			when x"41" => output_byte <= x"83";
			when x"42" => output_byte <= x"2c";
			when x"43" => output_byte <= x"1a";
			when x"44" => output_byte <= x"1b";
			when x"45" => output_byte <= x"6e";
			when x"46" => output_byte <= x"5a";
			when x"47" => output_byte <= x"a0";
			when x"48" => output_byte <= x"52";
			when x"49" => output_byte <= x"3b";
			when x"4a" => output_byte <= x"d6";
			when x"4b" => output_byte <= x"b3";
			when x"4c" => output_byte <= x"29";
			when x"4d" => output_byte <= x"e3";
			when x"4e" => output_byte <= x"2f";
			when x"4f" => output_byte <= x"84";
			when x"50" => output_byte <= x"53";
			when x"51" => output_byte <= x"d1";
			when x"52" => output_byte <= x"00";
			when x"53" => output_byte <= x"ed";
			when x"54" => output_byte <= x"20";
			when x"55" => output_byte <= x"fc";
			when x"56" => output_byte <= x"b1";
			when x"57" => output_byte <= x"5b";
			when x"58" => output_byte <= x"6a";
			when x"59" => output_byte <= x"cb";
			when x"5a" => output_byte <= x"be";
			when x"5b" => output_byte <= x"39";
			when x"5c" => output_byte <= x"4a";
			when x"5d" => output_byte <= x"4c";
			when x"5e" => output_byte <= x"58";
			when x"5f" => output_byte <= x"cf";
			when x"60" => output_byte <= x"d0";
			when x"61" => output_byte <= x"ef";
			when x"62" => output_byte <= x"aa";
			when x"63" => output_byte <= x"fb";
			when x"64" => output_byte <= x"43";
			when x"65" => output_byte <= x"4d";
			when x"66" => output_byte <= x"33";
			when x"67" => output_byte <= x"85";
			when x"68" => output_byte <= x"45";
			when x"69" => output_byte <= x"f9";
			when x"6a" => output_byte <= x"02";
			when x"6b" => output_byte <= x"7f";
			when x"6c" => output_byte <= x"50";
			when x"6d" => output_byte <= x"3c";
			when x"6e" => output_byte <= x"9f";
			when x"6f" => output_byte <= x"a8";
			when x"70" => output_byte <= x"51";
			when x"71" => output_byte <= x"a3";
			when x"72" => output_byte <= x"40";
			when x"73" => output_byte <= x"8f";
			when x"74" => output_byte <= x"92";
			when x"75" => output_byte <= x"9d";
			when x"76" => output_byte <= x"38";
			when x"77" => output_byte <= x"f5";
			when x"78" => output_byte <= x"bc";
			when x"79" => output_byte <= x"b6";
			when x"7a" => output_byte <= x"da";
			when x"7b" => output_byte <= x"21";
			when x"7c" => output_byte <= x"10";
			when x"7d" => output_byte <= x"ff";
			when x"7e" => output_byte <= x"f3";
			when x"7f" => output_byte <= x"d2";
			when x"80" => output_byte <= x"cd";
			when x"81" => output_byte <= x"0c";
			when x"82" => output_byte <= x"13";
			when x"83" => output_byte <= x"ec";
			when x"84" => output_byte <= x"5f";
			when x"85" => output_byte <= x"97";
			when x"86" => output_byte <= x"44";
			when x"87" => output_byte <= x"17";
			when x"88" => output_byte <= x"c4";
			when x"89" => output_byte <= x"a7";
			when x"8a" => output_byte <= x"7e";
			when x"8b" => output_byte <= x"3d";
			when x"8c" => output_byte <= x"64";
			when x"8d" => output_byte <= x"5d";
			when x"8e" => output_byte <= x"19";
			when x"8f" => output_byte <= x"73";
			when x"90" => output_byte <= x"60";
			when x"91" => output_byte <= x"81";
			when x"92" => output_byte <= x"4f";
			when x"93" => output_byte <= x"dc";
			when x"94" => output_byte <= x"22";
			when x"95" => output_byte <= x"2a";
			when x"96" => output_byte <= x"90";
			when x"97" => output_byte <= x"88";
			when x"98" => output_byte <= x"46";
			when x"99" => output_byte <= x"ee";
			when x"9a" => output_byte <= x"b8";
			when x"9b" => output_byte <= x"14";
			when x"9c" => output_byte <= x"de";
			when x"9d" => output_byte <= x"5e";
			when x"9e" => output_byte <= x"0b";
			when x"9f" => output_byte <= x"db";
			when x"a0" => output_byte <= x"e0";
			when x"a1" => output_byte <= x"32";
			when x"a2" => output_byte <= x"3a";
			when x"a3" => output_byte <= x"0a";
			when x"a4" => output_byte <= x"49";
			when x"a5" => output_byte <= x"06";
			when x"a6" => output_byte <= x"24";
			when x"a7" => output_byte <= x"5c";
			when x"a8" => output_byte <= x"c2";
			when x"a9" => output_byte <= x"d3";
			when x"aa" => output_byte <= x"ac";
			when x"ab" => output_byte <= x"62";
			when x"ac" => output_byte <= x"91";
			when x"ad" => output_byte <= x"95";
			when x"ae" => output_byte <= x"e4";
			when x"af" => output_byte <= x"79";
			when x"b0" => output_byte <= x"e7";
			when x"b1" => output_byte <= x"c8";
			when x"b2" => output_byte <= x"37";
			when x"b3" => output_byte <= x"6d";
			when x"b4" => output_byte <= x"8d";
			when x"b5" => output_byte <= x"d5";
			when x"b6" => output_byte <= x"4e";
			when x"b7" => output_byte <= x"a9";
			when x"b8" => output_byte <= x"6c";
			when x"b9" => output_byte <= x"56";
			when x"ba" => output_byte <= x"f4";
			when x"bb" => output_byte <= x"ea";
			when x"bc" => output_byte <= x"65";
			when x"bd" => output_byte <= x"7a";
			when x"be" => output_byte <= x"ae";
			when x"bf" => output_byte <= x"08";
			when x"c0" => output_byte <= x"ba";
			when x"c1" => output_byte <= x"78";
			when x"c2" => output_byte <= x"25";
			when x"c3" => output_byte <= x"2e";
			when x"c4" => output_byte <= x"1c";
			when x"c5" => output_byte <= x"a6";
			when x"c6" => output_byte <= x"b4";
			when x"c7" => output_byte <= x"c6";
			when x"c8" => output_byte <= x"e8";
			when x"c9" => output_byte <= x"dd";
			when x"ca" => output_byte <= x"74";
			when x"cb" => output_byte <= x"1f";
			when x"cc" => output_byte <= x"4b";
			when x"cd" => output_byte <= x"bd";
			when x"ce" => output_byte <= x"8b";
			when x"cf" => output_byte <= x"8a";
			when x"d0" => output_byte <= x"70";
			when x"d1" => output_byte <= x"3e";
			when x"d2" => output_byte <= x"b5";
			when x"d3" => output_byte <= x"66";
			when x"d4" => output_byte <= x"48";
			when x"d5" => output_byte <= x"03";
			when x"d6" => output_byte <= x"f6";
			when x"d7" => output_byte <= x"0e";
			when x"d8" => output_byte <= x"61";
			when x"d9" => output_byte <= x"35";
			when x"da" => output_byte <= x"57";
			when x"db" => output_byte <= x"b9";
			when x"dc" => output_byte <= x"86";
			when x"dd" => output_byte <= x"c1";
			when x"de" => output_byte <= x"1d";
			when x"df" => output_byte <= x"9e";
			when x"e0" => output_byte <= x"e1";
			when x"e1" => output_byte <= x"f8";
			when x"e2" => output_byte <= x"98";
			when x"e3" => output_byte <= x"11";
			when x"e4" => output_byte <= x"69";
			when x"e5" => output_byte <= x"d9";
			when x"e6" => output_byte <= x"8e";
			when x"e7" => output_byte <= x"94";
			when x"e8" => output_byte <= x"9b";
			when x"e9" => output_byte <= x"1e";
			when x"ea" => output_byte <= x"87";
			when x"eb" => output_byte <= x"e9";
			when x"ec" => output_byte <= x"ce";
			when x"ed" => output_byte <= x"55";
			when x"ee" => output_byte <= x"28";
			when x"ef" => output_byte <= x"df";
			when x"f0" => output_byte <= x"8c";
			when x"f1" => output_byte <= x"a1";
			when x"f2" => output_byte <= x"89";
			when x"f3" => output_byte <= x"0d";
			when x"f4" => output_byte <= x"bf";
			when x"f5" => output_byte <= x"e6";
			when x"f6" => output_byte <= x"42";
			when x"f7" => output_byte <= x"68";
			when x"f8" => output_byte <= x"41";
			when x"f9" => output_byte <= x"99";
			when x"fa" => output_byte <= x"2d";
			when x"fb" => output_byte <= x"0f";
			when x"fc" => output_byte <= x"b0";
			when x"fd" => output_byte <= x"54";
			when x"fe" => output_byte <= x"bb";
			when x"ff" => output_byte <= x"16";
			when others => null; -- GHDL complains without this statement
		end case;

	end process lut;

end architecture behavioral;
