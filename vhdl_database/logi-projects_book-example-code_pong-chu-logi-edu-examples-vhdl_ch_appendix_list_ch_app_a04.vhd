--*********************************************
-- Listing A.4
--*********************************************
library ieee;
use ieee.std_logic_1164.all;
entity fixed_shift_demo is
   port(
      a: in std_logic_vector(7 downto 0);
      sh1, sh2, sh3, rot, swap: out
           std_logic_vector(7 downto 0)
   );
end fixed_shift_demo;

architecture arch of fixed_shift_demo is
begin
   -- shift left 3 positions
   sh1 <= a(4 downto 0) & "000" ;
   -- shift right 3 positions (logical shift)
   sh2 <= "000" & a(7 downto 3);
   -- shift right 3 positions and shifting in sign bit
   -- (arithematic shift)
   sh3 <= a(7) & a(7) & a(7)& a(7 downto 3);
   -- rotate right 3 positions
   rot <= a(2 downto 0) & a(7 downto 3);
   -- swap two nibbles
   swap <= a(3 downto 0) & a(7 downto 4);
end arch;