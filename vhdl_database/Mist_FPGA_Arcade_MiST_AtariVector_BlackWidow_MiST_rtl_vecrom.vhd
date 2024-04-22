--Vector rom. Warning: roma is smaller and mirrored once.

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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vecrom is
    Port ( addr : in  STD_LOGIC_VECTOR (13 downto 0);
           data : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC		  
			  );
end vecrom;

architecture Behavioral of vecrom is
	signal dataa: 		std_logic_vector(7 downto 0);
	signal datab: 		std_logic_vector(7 downto 0);
	signal datac: 		std_logic_vector(7 downto 0);
	signal datad: 		std_logic_vector(7 downto 0);

begin

--136017-107.l7	2048	24576		0110 000000000000
--blank				2048	26624		0110 100000000000
--136017-108.mn7	4096	28672		0111 000000000000
--136017-109.np7	4096	32768		1000 000000000000
--136017-110.r7	4096	36864		1001 000000000000

roma: entity work.gravitar_vec_rom1
	port map (
		clk 	=> clk,
		addr 	=> addr(10 downto 0),
		data 	=> dataa
	);
	
romb: entity work.gravitar_vec_rom2 
	port map (
		clk 	=> clk,
		addr 	=> addr(11 downto 0),
		data 	=> datab
	);
	
romc: entity work.gravitar_vec_rom3
	port map (
		clk 	=> clk,
		addr 	=> addr(11 downto 0),
		data 	=> datac
	);
	
romd: entity work.gravitar_vec_rom4
	port map (
		clk 	=> clk,
		addr 	=> addr(11 downto 0),
		data 	=> datad
	);

--Watch the weird inversion of romd and romb!
	data <=	dataa	when addr(13 downto 12)="00" else  --Mirrors once.
				datab when addr(13 downto 12)="01" else 
				datac when addr(13 downto 12)="10" else 
				datad when addr(13 downto 12)="11"
				else "00000000";
end Behavioral;

