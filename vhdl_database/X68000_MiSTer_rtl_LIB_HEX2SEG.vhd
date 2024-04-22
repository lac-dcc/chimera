library IEEE;
use IEEE.std_logic_1164.all;

entity HEX2SEG is
	port(
		HEX	:in std_logic_vector(3 downto 0);
		DOT	:in std_logic;
		SEG	:out std_logic_vector(7 downto 0)
	);
end HEX2SEG;

architecture MAIN of HEX2SEG is
begin

	process(HEX)
	variable	SEG7	:std_logic_vector(6 downto 0);
	begin
		case(HEX)is
			when x"0"=>SEG7:="0111111";
			when x"1"=>SEG7:="0000110";
			when x"2"=>SEG7:="1011011";
			when x"3"=>SEG7:="1001111";
			when x"4"=>SEG7:="1100110";
			when x"5"=>SEG7:="1101101";
			when x"6"=>SEG7:="1111101";
			when x"7"=>SEG7:="0100111";
			when x"8"=>SEG7:="1111111";
			when x"9"=>SEG7:="1100111";
			when x"A"=>SEG7:="1110111";
			when x"b"=>SEG7:="1111100";
			when x"C"=>SEG7:="0111001";
			when x"d"=>SEG7:="1011110";
			when x"E"=>SEG7:="1111001";
			when x"F"=>SEG7:="1110001";
			when others=>SEG7:="XXXXXXX";
		end case;
		SEG(6 downto 0)<=SEG7;
	end process;
	SEG(7)<=DOT;
end MAIN;
