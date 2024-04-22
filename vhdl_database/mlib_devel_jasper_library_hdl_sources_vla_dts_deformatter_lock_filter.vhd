-- </doc lock_filter.vhd

-- filters pll lock bit flickering.
-- doc/>

-- mrevnell 201112

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lock_filter is
  
  port (
    input  : in  std_logic;
    clock  : in  std_logic;
    output : out std_logic);

end lock_filter;

architecture behavioral of lock_filter is

  subtype  count_t is unsigned(15 downto 0);
  constant full_count : count_t := (others => '1');

  signal count : count_t   := (others => '0');
  signal full  : std_logic := '0';
  
begin  -- behavioral

  full   <= '1' when count = full_count else '0';
  output <= full;

  process(clock, input)
  begin
    if input = '0' then
      count <= (others => '0');
    elsif rising_edge(clock) then
      if full = '0' then
        count <= count + 1;
      end if;
    end if;
  end process;

end behavioral;
