library ieee;
use ieee.std_logic_1164.all;

entity TagLatch is
  
  port (
    clk, reset : in  std_logic;
    r, a       : in  std_logic;
    tag_in     : in  std_logic_vector;
    tag_out    : out std_logic_vector);

end TagLatch;

architecture behave of TagLatch is
  constant tagzero : std_logic_vector(tag_in'range) := (others => '0');
begin  -- behave

  assert tag_in'length = tag_out'length report "dff: input and output sizes don't match" severity error;

  process (clk, reset)
  begin  -- process
    if clk'event and clk = '1' then     -- rising clock edge
      if reset = '1' then
        tag_out <= tagzero;
      else
        if r = '1' and a = '1' then
          tag_out <= tag_in;
        end if;
      end if;
    end if;
  end process;

end behave;
