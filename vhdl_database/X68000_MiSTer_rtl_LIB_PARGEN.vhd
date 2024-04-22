library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PARGEN is
generic(
	WIDTH	:integer	:=8;
	O_En	:std_logic	:='0'
);
port(
	DAT		:in std_logic_vector(0 to WIDTH-1);
	PAR		:out std_logic
);
end PARGEN;

architecture MAIN of PARGEN is
begin
	process(DAT)
	variable tmp	:std_logic;
		begin
		tmp:=O_En;
		for i in 0 to WIDTH-1 loop
			tmp:=tmp xor DAT(i);
		end loop;
		PAR<=tmp;
	end process;
end MAIN;
