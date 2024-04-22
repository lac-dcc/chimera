library ieee;
use ieee.std_logic_1164.all;

-- produces an output pulse synchronized to clock.
-- circuit is armed when d is '1' at strobe rising edge.
-- q will be high during the clock cycle starting at the next rising edge.

entity pulser2 is
  port(
    strobe  : in  std_logic;
    d       : in  std_logic;
    en      : in  std_logic;
    clock   : in  std_logic;
    q       : out std_logic
    );
end pulser2;

architecture behavioral of pulser2 is
  signal a : std_logic;
  signal b : std_logic;
  signal c : std_logic;
begin

  process( strobe, c, en )
  begin
    if c = '1' then
      a <= '0';
    elsif en = '1' then
      if strobe'event and strobe = '1' then
        a <= d;
      end if;
    end if;
  end process;

  process( clock, c )
  begin
    if c = '1' then
      b <= '0';
    elsif clock'event and clock = '0' then
      b <= a;
    end if;
  end process;

  process( clock )
  begin
    if clock'event and clock = '0' then
      c <= b;
    end if;
  end process;

  q <= a;

end behavioral;
