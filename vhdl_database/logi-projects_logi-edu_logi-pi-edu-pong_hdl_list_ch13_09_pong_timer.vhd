-- Listing 13.9
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity timer is
   port(
      clk, reset: in std_logic;
      timer_start, timer_tick: in std_logic;
      timer_up: out std_logic
   );
end timer;

architecture arch of timer is
   signal timer_reg, timer_next: unsigned(6 downto 0);
begin
   -- registers
   process (clk, reset)
   begin
      if reset='1' then
         timer_reg <= (others=>'1');
      elsif (clk'event and clk='1') then
         timer_reg <= timer_next;
      end if;
   end process;
	
   -- next-state logic
   process(timer_start,timer_reg,timer_tick)
   begin
      if (timer_start='1') then
         timer_next <= (others=>'1');
      elsif timer_tick='1' and timer_reg/=0 then
         timer_next <= timer_reg - 1;
      else
         timer_next <= timer_reg;
      end if;
   end process;
   timer_up <='1' when timer_reg=0 else '0';
end arch;