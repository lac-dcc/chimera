library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Boolean_Function_Case_Statement is

    Port ( a1 : in  STD_LOGIC;
           a0 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
			  
           c2 : out STD_LOGIC;
		   c1 : out STD_LOGIC;
		   c0 : out STD_LOGIC);
			  
end Boolean_Function_Case_Statement;

architecture Behavioral of Boolean_Function_Case_Statement is	

begin
	process (a1, a0, b1, b0)
    variable input : std_logic_vector(3 downto 0);
    
        begin
        input := a1 & a0 & b1 & b0;
            case input is
                	
                when "0000" =>
                
                  c2 <= '0';
                  c1 <= '0';
                  c0 <= '0';
                
                when "0001" =>
                
                c2 <= '0';
                c1 <= '0';
                c0 <= '1';
                
                when "0010" =>
                
                c2 <= '0';
                c1 <= '1';
                c0 <= '0';
                
                when "0011" =>
                
                c2 <= '0';
                c1 <= '1';
                c0 <= '1';
                
                when "0100" =>
                
                c2 <= '0';
                c1 <= '0';
                c0 <= '1';
                
                when "0101" =>
                
                c2 <= '0';
                c1 <= '1';
                c0 <= '0';
                
                when "0110" =>
                
                c2 <= '0';
                c1 <= '1';
                c0 <= '1';
                
                when "0111" =>
                
                c2 <= '1';
                c1 <= '0';
                c0 <= '0';
                
                when "1000" =>
                
                c2 <= '0';
                c1 <= '1';
                c0 <= '0';
                
                when "1001" =>
                
                c2 <= '0';
                c1 <= '1';
                c0 <= '1';
                
                when "1010" =>
                
                c2 <= '1';
                  c1 <= '0';
                  c0 <= '0';
                
                when "1011" =>
                
                c2 <= '1';
                c1 <= '0';
                c0 <= '1';
                
                when "1100" =>
                
                c2 <= '0';
                c1 <= '1';
                c0 <= '1';
                
                when "1101" =>
                
                c2 <= '1';
                c1 <= '0';
                c0 <= '0';
                
                when "1110" =>
                
                c2 <= '1';
                c1 <= '0';
                c0 <= '1';
                
                when "1111" =>
                
                c2 <= '1';
                c1 <= '1';
                c0 <= '0';
                  
                when others =>
                c2 <= 'U';
                c1 <= 'U';
                c0 <= 'U';
            end case;
	end process;
	
	
end Behavioral;