-- Listing 3.12
library ieee;
use ieee.std_logic_1164.all;
entity hex_to_sseg is
   port(
      hex: in std_logic_vector(3 downto 0);
      dp: in std_logic;
      sseg: out std_logic_vector(7 downto 0)
   );
end hex_to_sseg;


architecture arch of hex_to_sseg is
begin
   with hex select
	--reverse the bit order to make compatible with new sseg mark1 EDU board
      sseg(6 downto 0) <=
	 "0111111"		 when "0000",--0
	 "0000110"    	 when "0001",--1
	 "1011011"   	 when "0010",--2
	 "1001111"   	 when "0011",--3
	 "1100110"   	 when "0100",--4
	 "1101101"   	 when "0101",--5
	 "1111101"   	 when "0110",--6
	 "0000111"   	 when "0111",--7
	 "1111111"   	 when "1000",--8
	 "1101111"   	 when "1001",--9
	 "1110111"      when "1010", --a
	 "1111100"   	 when "1011", --b
	 "0111001"   	 when "1100", --c
	 "1011110"   	 when "1101", --d
	 "1111001"   	 when "1110", --e
	 "1110001" 	 	when others; --f
	 
	sseg(7) <= dp;
end arch;



