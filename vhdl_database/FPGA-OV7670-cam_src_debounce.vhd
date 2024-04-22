
----------------------------------------------------------------------------------
-- Purpose:
-- Activate reset button on transition of 0 to 1 letgo
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity debounce is
    Port ( clk : in  STD_LOGIC;
           i : in  STD_LOGIC;
           o : out  STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
   signal i2 : std_logic;
begin
   process(clk)
   begin
      if rising_edge(clk) then
         if i = '0' then
	    i2 <= '1';
            o <= '0';
         else	
	    if i2 = '1' then
               o <= '1';
            else
               o <= '0';
            end if;
	    i2 <= '0';
         end if;
      end if;
   end process;
end Behavioral;
