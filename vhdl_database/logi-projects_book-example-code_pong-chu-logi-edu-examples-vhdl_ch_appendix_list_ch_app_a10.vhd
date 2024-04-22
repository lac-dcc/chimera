--*********************************************
-- Listing A.10
--*********************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity bin_counter is
   generic(N: integer := 8);
   port(
      clk, reset: in std_logic;
      load, en, syn_clr: in std_logic;
      d: in std_logic_vector(N-1 downto 0);
      max_tick: out std_logic;
      q: out std_logic_vector(N-1 downto 0)
   );
end bin_counter;

architecture demo_arch of bin_counter is
   constant MAX: integer := (2**N-1);
   signal r_reg: unsigned(N-1 downto 0);
   signal r_next: unsigned(N-1 downto 0);
begin
   -- register
   process(clk,reset)
   begin
      if (reset='1') then
         r_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         r_reg <= r_next;
      end if;
   end process;
   -- next-state logic
   r_next <= (others=>'0') when syn_clr='1' else
             unsigned(d)   when load='1' else
             r_reg + 1     when en ='1'  else
             r_reg;
   -- output logic
   q <= std_logic_vector(r_reg);
   max_tick <= '1' when r_reg=MAX else '0';
end demo_arch;