library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF_RST is
   port
   (
      CLK : in std_logic;
      RSTn : in std_logic;
      D : in std_logic;
		Q : out std_logic
   );
end entity D_FF_RST;
 
architecture Behavioral of D_FF_RST is
begin
   process (CLK, RSTn) is
   begin
		if RSTn = '0' then
			Q <= '0';
		elsif rising_edge(CLK) then  
         Q <= D;
		end if;
	end process;
end architecture Behavioral;