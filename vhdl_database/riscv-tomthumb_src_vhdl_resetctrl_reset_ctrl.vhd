library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity reset_ctrl is

	port(
		I_clk: in std_logic;
		I_reset: in std_logic; 		-- input for "active high" reset signal
		I_reset_inv: in std_logic;	-- input for "active low" reset signal
		O_reset: out std_logic		-- reset output, "active high"
	);
end reset_ctrl;


architecture Behavioral of reset_ctrl is
	signal clockcounter: integer range 0 to 15 := 15;
begin
	process(I_clk)
	begin
	
		if rising_edge(I_clk) then
		
			O_reset <= '0';
		
			if clockcounter /= 0 then
				O_reset <= '1';
				clockcounter <= clockcounter - 1;
			end if;
			
			if I_reset = '1' or I_reset_inv = '0' then
				clockcounter <= 15;
			end if;
		
		end if;
	end process;
end Behavioral;