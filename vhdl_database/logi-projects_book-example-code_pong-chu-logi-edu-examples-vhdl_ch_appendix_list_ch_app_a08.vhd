--*********************************************
-- Listing A.8
--*********************************************
library ieee;
use ieee.std_logic_1164.all;
entity reg_template is
   port(
      clk, reset: in std_logic;
      en: in std_logic;
      q1_next, q2_next, q3_next: in
             std_logic_vector(7 downto 0);
      q1_reg, q2_reg, q3_reg: out
             std_logic_vector(7 downto 0)
   );
end reg_template;

architecture arch of reg_template is
begin
   -- register without reset
   process(clk)
   begin
      if (clk'event and clk='1') then
         q1_reg <= q1_next;
      end if;
   end process;

   -- register with asynchronous reset
   process(clk,reset)
   begin
      if (reset='1') then
         q2_reg <=(others=>'0');
      elsif (clk'event and clk='1') then
         q2_reg <= q2_next;
      end if;
   end process;

   -- register with enable and asynchronous reset
   process(clk,reset)
   begin
      if (reset='1') then
         q3_reg <=(others=>'0');
      elsif (clk'event and clk='1') then
         if (en='1') then
            q3_reg <= q3_next;
         end if;
      end if;
   end process;
end arch;