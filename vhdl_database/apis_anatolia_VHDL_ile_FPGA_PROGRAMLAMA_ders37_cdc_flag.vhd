library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cdc_flag is
generic (
N		: integer	:= 2	-- shift register depth
);
Port ( 
clka 	: in STD_LOGIC;
flaga_i : in STD_LOGIC;
clkb 	: in STD_LOGIC;
flagb_o : out STD_LOGIC
);
end cdc_flag;

architecture Behavioral of cdc_flag is

signal flaga_toggle	: std_logic := '0';
signal shreg		: std_logic_vector (N-1 downto 0) := (others => '0');

attribute ASYNC_REG : string;
attribute ASYNC_REG of shreg : signal is "TRUE";

begin
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
P_CLKA	: process (clka) begin
if (rising_edge(clka)) then

	flaga_toggle	<= flaga_i xor flaga_toggle;

end if;
end process P_CLKA;
-------------------------------------------------------------------------------------
P_CLKB	: process (clkb) begin
if (rising_edge(clkb)) then

	shreg(0)			<= flaga_toggle;
	shreg(N-1 downto 1)	<= shreg(N-2 downto 0);
	flagb_o				<= shreg(N-1) xor shreg(N-2);

end if;
end process P_CLKB;
-------------------------------------------------------------------------------------
end Behavioral;