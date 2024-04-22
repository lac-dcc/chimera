--*********************************************
-- Listing A.5
--*********************************************
library ieee;
use ieee.std_logic_1164.all;
entity decoder1 is
   port(
      a: in std_logic_vector(1 downto 0);
      en: in std_logic;
      y1, y2: out std_logic_vector(3 downto 0)
   );
end decoder1;

architecture concurrent_arch of decoder1 is
   signal s: std_logic_vector(2 downto 0);
begin
   -- conditional signal assignment statement
   y1 <= "0000" when (en='0') else
         "0001" when (a="00") else
         "0010" when (a="01") else
         "0100" when (a="10") else
         "1000";      -- a="11"

   -- selected signal assignment statement
   s <= en & a;
   with s select
      y2 <= "0000" when "000"|"001"|"010"|"011",
            "0001" when "100",
            "0010" when "101",
            "0100" when "110",
            "1000" when others;   -- s="111"
end concurrent_arch;