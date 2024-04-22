library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PARITYG is
generic(
	WIDTH	:integer	:=8
);
port(
	DAT		:in std_logic_vector(0 to WIDTH-1);
	O_En	:in std_logic;
	
	PAR		:out std_logic
);
end PARITYG;

architecture rtl of PARITYG is
begin
	process(DAT,O_En)
	variable tmp	:std_logic;
		begin
		tmp:=O_En;
		for i in 0 to WIDTH-1 loop
			tmp:=tmp xor DAT(i);
		end loop;
		PAR<=tmp;
	end process;
end rtl;
