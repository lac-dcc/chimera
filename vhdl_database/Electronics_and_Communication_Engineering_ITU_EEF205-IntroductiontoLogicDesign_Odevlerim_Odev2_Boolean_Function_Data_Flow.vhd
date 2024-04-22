library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Boolean_Function_Data_Flow is

    Port ( a1 : in  STD_LOGIC;
           a0 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
			  
           c2 : out STD_LOGIC;
		   c1 : out STD_LOGIC;
		   c0 : out STD_LOGIC);
			  
end Boolean_Function_Data_Flow;

architecture Behavioral of Boolean_Function_Data_Flow is	
begin
    c2 <= (a1 AND b1) OR (a0 AND b1 AND b0) OR (a1 AND a0 AND b0);
    
    c1 <= ((NOT a1) AND (NOT a0) AND b1) OR ( (NOT a1) AND b1 AND (NOT b0))
    OR (a1 AND (NOT b1) AND (NOT b0)) OR (a1 AND (NOT a0) AND (NOT b1))
    OR ( (NOT a1) AND a0 AND (NOT b1) AND b0) OR ( a1 AND a0 AND b1 AND b0);
    
    c0 <= ( (NOT a1) AND (NOT a0) AND b0) OR ( (NOT a1) AND a0 AND (NOT b0))
    OR (a1 AND a0 AND b0) OR (a1 AND (NOT a0) AND (NOT b0));
end Behavioral;