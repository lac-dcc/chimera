library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sys1 is
port ( 
clka 		: in std_logic;
en_i 		: in std_logic;
flaga_i 	: in std_logic;
number1_i 	: in std_logic_vector (7 downto 0);
number2_i 	: in std_logic_vector (7 downto 0);
sum_i 		: in std_logic_vector (7 downto 0);
rdy_o 		: out std_logic;
number1_o 	: out std_logic_vector (7 downto 0);
number2_o 	: out std_logic_vector (7 downto 0);
sum_o 		: out std_logic_vector (7 downto 0);
flaga_o 	: out std_logic
);
end sys1;

architecture Behavioral of sys1 is

begin

process (clka) begin
if (rising_edge(clka)) then

	-- sent data to sys2 and give flag assert
	flaga_o		<= '0';	
	if (en_i = '1') then
		number1_o	<= number1_i;
		number2_o	<= number2_i;
		flaga_o		<= '1';
	end if;
	
	-- receive data from sys2 and assert rdy signal
	rdy_o	<= '0';
	if (flaga_i = '1') then
		sum_o	<= sum_i;
		rdy_o	<= '1';
	end if;

end if;
end process;

end Behavioral;