library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity RSFlipFlop is	
	port (
		R: in std_logic;		
		S: in std_logic;		
		Q: out std_logic
	);	
end entity;


architecture immediate of RSFlipFlop is
begin
	process (R,S)
	begin
		if R='0' then
			Q <= '0';
		elsif S='0' then
			Q <= '1';
		end if;
	end process;
end immediate;
