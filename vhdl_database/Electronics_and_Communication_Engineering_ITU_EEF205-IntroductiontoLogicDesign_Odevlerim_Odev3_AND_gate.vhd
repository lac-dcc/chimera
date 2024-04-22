library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_gate is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Y : out STD_LOGIC);
end AND_gate;

architecture Behavioral of AND_gate is
begin
    Y <= A AND B; 
end Behavioral;
