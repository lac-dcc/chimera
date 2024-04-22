library IEEE;
use IEEE.std_logic_1164.all;

entity ls17 is
port
(
	a1, a2, a3, a4, a5, a6	: in std_logic;
	y1, y2, y3, y4, y5, y6	: out std_logic
);
end ls17;

architecture arch of ls17 is
begin
	y1 <= a1;
	y2 <= a2;
	y3 <= a3;
	y4 <= a4;
	y5 <= a5;
	y6 <= a6;
end arch;