--*********************************************
-- Listing A.6
--*********************************************
library ieee;
use ieee.std_logic_1164.all;
entity decoder2 is
   port(
      a: in std_logic_vector(1 downto 0);
      en: in std_logic;
      y1, y2: out std_logic_vector(3 downto 0)
   );
end decoder2;

architecture seq_arch of decoder2 is
   signal s: std_logic_vector(2 downto 0);
begin
   process(en,a)
   begin
      -- if statement
      if (en='0') then
         y1 <= "0000";
      elsif (a="00") then
         y1 <= "0001";
      elsif (a="01")then
         y1 <= "0010";
      elsif (a="10")then
         y1 <= "0100";
      else
         y1 <= "1000";
      end if;
   end process;

   s <= en & a;
   process(s)
   begin
      -- case statement
      case s is
         when "000"|"001"|"010"|"011" =>
            y2 <= "0001";
         when "100" =>
            y2 <= "0001";
         when "101" =>
            y2 <= "0010";
         when "110" =>
            y2 <= "0100";
         when others =>
            y2 <= "1000";
      end case;
   end process;
end seq_arch;