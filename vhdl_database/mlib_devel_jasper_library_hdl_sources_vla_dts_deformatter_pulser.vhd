library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

-- produces an output pulse synchronized to clock.
-- if implemented with mode '1'
--  circuit is armed if en = '1' when d is '1' at strobe rising edge.
--  q will be high during the clock cycle starting at the next rising edge.
-- if implemented with mode '0'
--  circuit is armed on rising edge of d, regardless of strobe and en.
-- defaults to mode '0'.

entity pulser is
  generic(
    mode : std_logic_vector( 0 downto 0 )
    );
  port(
    strobe  : in  std_logic := '0';
    d       : in  std_logic;
    en      : in  std_logic := '0';
    clock   : in  std_logic;
    q       : out std_logic
    );
end pulser;

architecture behavioral of pulser is
  signal a : std_logic;
  signal b : std_logic;
  signal c : std_logic;
begin

  process( strobe, c, en, d )
  begin
    if c = '1' then
      a <= '0';
    elsif mode(0) = '1' then
      if en = '1' then
        if strobe'event and strobe = '1' then
          a <= d;
        end if;
      end if;
    else
      if d'event and d = '1' then
        a <= '1';
      end if;
    end if;
  end process;

  process( clock, c )
  begin
    if c = '1' then
      b <= '0';
    elsif clock'event and clock = '1' then
      b <= a;
    end if;
  end process;

  process( clock )
  begin
    if clock'event and clock = '1' then
      c <= b;
    end if;
  end process;

  q <= b;

end behavioral;
