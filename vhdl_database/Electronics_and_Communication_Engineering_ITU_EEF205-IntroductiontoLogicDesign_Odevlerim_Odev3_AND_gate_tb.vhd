library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity AND_gate_tb is
end AND_gate_tb;

architecture Behavioral of AND_gate_tb is

    COMPONENT AND_gate
    PORT ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Y : out STD_LOGIC
           );
    END COMPONENT;
    
    signal A : STD_LOGIC;
    signal B : STD_LOGIC;
    
    signal Y : STD_LOGIC;

BEGIN
    DUT:AND_gate PORT MAP(A => A,
                          B => B,
                          Y => Y);

    PROCESS
    BEGIN
	-- 00
		A <= '0';
		B <= '0';
		wait for 10ns;
	-- 01
		A <= '0';
		B <= '1';
		wait for 10ns;
	-- 11
		A <= '1';
		B <= '0';
		wait for 10ns;
	-- 10
		A <= '1';
		B <= '1';
        wait;
		
   end process;       
END Behavioral;
