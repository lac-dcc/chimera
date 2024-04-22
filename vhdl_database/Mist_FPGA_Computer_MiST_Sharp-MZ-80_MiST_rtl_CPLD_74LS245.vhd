library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CPLD_74LS245 is
    Port ( nE  : in  STD_LOGIC;
           dir : in  STD_LOGIC;
           Bin   : in  STD_LOGIC_VECTOR (7 downto 0);
           Ain   : in  STD_LOGIC_VECTOR (7 downto 0);
			  Bout  :out  STD_LOGIC_VECTOR (7 downto 0);
           Aout  : out  STD_LOGIC_VECTOR (7 downto 0));
end CPLD_74LS245;

architecture Behavioral of CPLD_74LS245 is
begin

    -- if nE = 1 or dir = '1' then HighZ
    -- else B
    Aout <= (7 downto 0 => 'Z') when nE = '1' OR dir = '1' else Bin;
    
    -- if nE = 1 or dir = '1' then HighZ
    -- wlse A
    Bout <= (7 downto 0 => 'Z') when nE = '1' OR dir = '0' else Ain;

end Behavioral;