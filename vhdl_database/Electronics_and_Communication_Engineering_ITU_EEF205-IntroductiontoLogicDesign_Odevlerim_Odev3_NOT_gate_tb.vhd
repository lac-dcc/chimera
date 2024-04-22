library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT_gate_tb is
end NOT_gate_tb;

architecture Behavioral of NOT_gate_tb is

    COMPONENT NOT_gate
    PORT ( A: in STD_LOGIC;
           A_not: out STD_LOGIC);
    END COMPONENT;
    
    signal A : STD_LOGIC;
    signal A_not: STD_LOGIC;
           

BEGIN
    DUT:NOT_gate PORT MAP( A => A,
                           A_not => A_not);
    PROCESS
    BEGIN
        --0
        A <= '0';
        wait for 10ns;
        
        --1
        A <= '1';
        wait;
        
    end PROCESS;
end Behavioral;
