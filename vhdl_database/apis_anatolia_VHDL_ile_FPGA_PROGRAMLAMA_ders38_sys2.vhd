library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sys2 is
port ( 
clkb 		: in std_logic;
flagb_i 	: in std_logic;
number1_i 	: in std_logic_vector (7 downto 0);
number2_i 	: in std_logic_vector (7 downto 0);
sum_o 		: out std_logic_vector (7 downto 0);
flagb_o 	: out std_logic
);
end sys2;

architecture Behavioral of sys2 is

begin

process (clkb) begin
if (rising_edge(clkb)) then

	flagb_o	<= '0';
	if (flagb_i = '1') then
		sum_o	<= number1_i + number2_i;
		flagb_o	<= '1';
	end if;

end if;
end process;


end Behavioral;