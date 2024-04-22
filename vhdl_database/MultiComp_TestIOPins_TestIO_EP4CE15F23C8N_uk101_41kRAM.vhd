-- Test I/Os


library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity uk101_41kRAM is
	port(
		clk			: in std_logic;

		J7IO		 	: inout	std_logic_vector(60 downto 7);
		J8IO		 	: inout	std_logic_vector(60 downto 7)
	);
end uk101_41kRAM;

architecture struct of uk101_41kRAM is


begin

	J7IO <= "00"&x"0000000000000";
	J8IO <= "00"&x"0000000000000";

end;
