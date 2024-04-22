-- Listing 13.8
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity m100_counter is
   port(
      clk, reset: in std_logic;
      d_inc, d_clr: in std_logic;
      dig0,dig1: out std_logic_vector (3 downto 0)
   );
end m100_counter;

architecture arch of m100_counter is
   signal dig0_reg, dig1_reg: unsigned(3 downto 0);
   signal dig0_next, dig1_next: unsigned(3 downto 0);
begin
   -- registers
   process (clk,reset)
   begin
      if reset='1' then
         dig1_reg <= (others=>'0');
         dig0_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         dig1_reg <= dig1_next;
         dig0_reg <= dig0_next;
      end if;
   end process;
   -- next-state logic for the decimal counter
   process(d_clr,d_inc,dig1_reg,dig0_reg)
   begin
      dig0_next <= dig0_reg;
      dig1_next <= dig1_reg;
      if (d_clr='1') then
         dig0_next <= (others=>'0');
         dig1_next <= (others=>'0');
      elsif (d_inc='1') then
         if dig0_reg=9 then
            dig0_next <= (others=>'0');
            if dig1_reg=9 then -- 10th digit
               dig1_next <= (others=>'0');
            else
               dig1_next <= dig1_reg + 1;
            end if;
         else -- dig0 not 9
            dig0_next <= dig0_reg + 1;
         end if;
      end if;
   end process;
   dig0 <= std_logic_vector(dig0_reg);
   dig1 <= std_logic_vector(dig1_reg);
end arch;
