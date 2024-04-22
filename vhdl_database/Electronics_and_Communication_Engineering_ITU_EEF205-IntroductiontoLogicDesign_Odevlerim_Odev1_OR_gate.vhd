library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_gate is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out STD_LOGIC);
end OR_gate;

architecture Behavioral of OR_gate is
begin
    Y <= A or B;    -- 2 input OR gate
end Behavioral;