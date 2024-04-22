------------------------------------------------------
-- General Multiplexer component
--
-- Just takes in 2 inputs and chooses between them.
------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux is 
	generic (n: natural:= 1); -- number of bits in the choices
	port (
		x,y: in std_logic_vector(n-1 downto 0);
		s: in std_logic;
		z: out std_logic_vector(n-1 downto 0)
	);
end mux;

architecture beh of mux is
	begin
	z <= x when (s='0') else y;
end beh;
