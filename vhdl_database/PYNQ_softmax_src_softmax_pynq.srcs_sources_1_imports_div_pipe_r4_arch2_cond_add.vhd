----------------------------------------
--  Conditional adder
--  op_a + op_b or only op_a depending on sel
--  
----------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.mypackage.all;

entity cond_adder is
    port (
        op_a: in STD_LOGIC_VECTOR (YBITS-1 downto 0);
        op_b: in STD_LOGIC_VECTOR (YBITS-1 downto 0);
        sel: in STD_LOGIC;
        outp: out STD_LOGIC_VECTOR (YBITS-1 downto 0)
     );
end cond_adder;

architecture simple_arch of cond_adder is

begin
  anAdder: process (sel,op_a,op_b)
  begin
     if sel = '1' then
        outp <= op_a + op_b;
     else
        outp <= op_a;
     end if; 
  end process;
end simple_arch;

