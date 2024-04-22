library ieee;
use ieee.std_logic_1164.all; 

entity ls245 is 
port
(
	dir, n_oe	: in std_logic;
	a, b			: inout std_logic_vector(7 downto 0)
);
end ls245;

architecture arch of ls245 is
begin
	a <= (others => 'Z');
	b <= (others => 'Z');
	process(dir, n_oe, a, b) begin
		if(n_oe = '0' and dir = '1') then
			a <= (others => 'Z');
			b <= a;
		elsif(n_oe = '0' and dir = '0') then
			b <= (others => 'Z');
			a <= b;
		end if;
	end process;
end arch;