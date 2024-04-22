
-- Black Widow arcade hardware implemented in an FPGA
-- (C) 2012 Jeroen Domburg (jeroen AT spritesmods.com)
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.


--The program ROM.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pgmrom is
    Port ( addr : in  STD_LOGIC_VECTOR (14 downto 0);
           data : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC
			  );
end pgmrom;

architecture Behavioral of pgmrom is
	signal dataa: 		std_logic_vector(7 downto 0);
	signal datab: 		std_logic_vector(7 downto 0);
	signal datac: 		std_logic_vector(7 downto 0);
	signal datad: 		std_logic_vector(7 downto 0);
	signal datae: 		std_logic_vector(7 downto 0);
	signal dataf: 		std_logic_vector(7 downto 0);

begin

--136017-101.d1	4096	0			0000 000000000000
--136017-102.ef1	4096	4096		0001 000000000000
--136017-103.h1	4096	8192		0010 000000000000
--136017-104.j1	4096	12288		0011 000000000000
--136017-105.kl1	4096	16384		0100 000000000000
--136017-106.m1	4096	20480		0101 000000000000



roma: entity work.gravitar_pgm_rom1
	port map (
		clk 		=> clk,
		addr 		=> addr(11 downto 0),
		data 		=> dataa
	);
	
romb: entity work.gravitar_pgm_rom2
	port map (
		clk 		=> clk,
		addr 		=> addr(11 downto 0),
		data 		=> datab
	);
romc: entity work.gravitar_pgm_rom3
	port map (
		clk 		=> clk,
		addr 		=> addr(11 downto 0),
		data 		=> datac
	);
	
romd: entity work.gravitar_pgm_rom4
	port map (
		clk 		=> clk,
		addr 		=> addr(11 downto 0),
		data 		=> datad
	);
	
rome: entity work.gravitar_pgm_rom5
	port map (
		clk 		=> clk,
		addr 		=> addr(11 downto 0),
		data		=> datae
	);
	
romf: entity work.gravitar_pgm_rom6
	port map (
		clk 		=> clk,
		addr 		=> addr(11 downto 0),
		data		=> dataf
	);

	data <=	dataa when addr(14 downto 12)="001" else 
				datab when addr(14 downto 12)="010" else 
				datac when addr(14 downto 12)="011" else 
				datad when addr(14 downto 12)="100" else 
				datae when addr(14 downto 12)="101" else 
				dataf when addr(14 downto 12)="110" else 
				dataf when addr(14 downto 12)="111" --last rom is mirrored once
				else "00000000";
end Behavioral;

