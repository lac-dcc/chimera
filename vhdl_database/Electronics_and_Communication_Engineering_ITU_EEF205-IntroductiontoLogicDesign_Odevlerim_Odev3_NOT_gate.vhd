library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY NOT_gate IS
    PORT ( A : in STD_LOGIC;
           A_not : out STD_LOGIC);
end NOT_gate;

ARCHITECTURE Behavioral OF NOT_gate IS
BEGIN
    A_not <= NOT(A);
END Behavioral;
