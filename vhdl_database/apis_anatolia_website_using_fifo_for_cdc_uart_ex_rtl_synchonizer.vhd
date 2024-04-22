library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity synchonizer is
generic (
c_ff_number	: integer := 3;
c_init_val	: std_logic := '1'
);
Port ( 
clk 	: in STD_LOGIC;
data_i 	: in STD_LOGIC;
data_o 	: out STD_LOGIC
);
end synchonizer;

architecture Behavioral of synchonizer is

signal sync_ff	: std_logic_vector (c_ff_number-1 downto 0) := (others => c_init_val);
attribute ASYNC_REG : string;
attribute ASYNC_REG of sync_ff : signal is "TRUE";

begin

process (clk) begin
if (rising_edge(clk)) then

	sync_ff	<= sync_ff(sync_ff'left-1 downto 0) & data_i;
	
end if;
end process;

data_o	<= sync_ff(sync_ff'left);

end Behavioral;