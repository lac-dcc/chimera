------------------------------------------------------
-- The Shift Left component
-- 
-- For all your left shifting needs.
-- Right shfting? We don't do that here. Get out.
------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shifter is
	generic (n1: natural:= 32; n2: natural:= 32; k: natural:= 2);
	port (
		x: in std_logic_vector(n1-1 downto 0);
		y: out std_logic_vector(n2-1 downto 0)
	);
end entity;

architecture beh of shifter is
	signal temp: std_logic_vector(n2-1 downto 0);

	begin
	temp <= std_logic_vector(resize(unsigned(x), n2)); -- This is required if you want to increase or decease the number of bits
	y <= std_logic_vector(shift_left(signed(temp), k));
end beh;