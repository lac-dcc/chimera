--*********************************************
-- Listing A.7
--*********************************************
library ieee;
use ieee.std_logic_1164.all;
entity comb_proc is
   port(
      a, b: in std_logic_vector(1 downto 0);
      data_in: std_logic_vector(7 downto 0);
      xa_out, xb_out: out std_logic_vector(7 downto 0);
      ya_out, yb_out: out std_logic_vector(7 downto 0)
  );
end comb_proc;

architecture arch of comb_proc is
begin
   -- without default output signal assignment
   process(a,b,data_in)
   begin
      if a > b then
         xa_out <= data_in;
         xb_out <= (others=>'0');
      elsif a < b then
         xa_out <= (others=>'0');
         xb_out <= data_in;
      else  -- a=b
         xa_out <= (others=>'0');
         xb_out <= (others=>'0');
     end if;
   end process;
   -- with default output signal assignment
   process(a,b,data_in)
   begin
      ya_out <= (others=>'0');
      yb_out <= (others=>'0');
      if a > b then
         ya_out <= data_in;
      elsif a < b then
         yb_out <= data_in;
      end if;
   end process;
end arch;