library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity opsis is
  Port ( switch : in  STD_LOGIC;
         LED : out  STD_LOGIC);
end opsis;

architecture Behavioral of opsis is
begin
  LED <= switch;
end Behavioral;
