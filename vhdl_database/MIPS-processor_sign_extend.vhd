------------------------------------------------------
-- Sign Extend component
--
-- For all your turning-16-bit-vectors-into-32-bit-
-- vectors needs.
------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sign_extend is
	port (
		x: in std_logic_vector(15 downto 0);
		y: out std_logic_vector(31 downto 0)
	);
end sign_extend;

architecture beh of sign_extend is
	begin
	y <= std_logic_vector(resize(signed(x), y'length));
end beh;
