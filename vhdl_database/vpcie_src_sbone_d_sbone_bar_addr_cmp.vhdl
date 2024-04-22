--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.sbone;


--
entity bar_addr_cmp is
 generic
 (
  GENERIC_BAR: natural;
  GENERIC_ADDR: natural
 );
 port
 (
  bar: in std_ulogic_vector(sbone.BAR_WIDTH - 1 downto 0);
  addr: in std_ulogic_vector(sbone.ADDR_WIDTH - 1 downto 0);
  is_eq: out std_ulogic
 );
end bar_addr_cmp;


--
architecture rtl of bar_addr_cmp is
begin
 -- combinatory logic
 process(bar, addr)
 begin
  is_eq <= '0';
  if (unsigned(bar) = GENERIC_BAR) and (unsigned(addr) = GENERIC_ADDR) then
   is_eq <= '1';
  end if;
 end process;
end rtl;
