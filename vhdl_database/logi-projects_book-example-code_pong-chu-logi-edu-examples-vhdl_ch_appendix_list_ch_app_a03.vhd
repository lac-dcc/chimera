--*********************************************
-- Listing A.3
--*********************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity arith_demo is
   port(
      a, b: in std_logic_vector(7 downto 0);
      diff, inc: out std_logic_vector(7 downto 0)
   );
end arith_demo;

architecture arch of arith_demo is
   signal au, bu, diffu: unsigned(7 downto 0);
begin
   -- convert inputs to unigned/sgined internally and
   -- then convert the result back
   au <= unsigned(a);
   bu <= unsigned(b);
   diffu <= au - bu when (au > bu) else
            bu - au;
   diff <= std_logic_vector(diffu);
   -- convert multiple times in a statement
   inc <= std_logic_vector(unsigned(a) + 1);
end arch;

