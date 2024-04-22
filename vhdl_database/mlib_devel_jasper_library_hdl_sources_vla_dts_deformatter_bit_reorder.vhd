library ieee;
use ieee.std_logic_1164.all;

-- puts bits into natural order at output.
--  undoes reorder done by demux chip
-- 
-- This is all signal renaming, no logic or clocking.

entity bit_reorder is
  port(
    input      : in  std_logic_vector( 159 downto 0 );
    output     : out std_logic_vector( 159 downto 0 )
    );
end bit_reorder;

architecture behavioral of bit_reorder is

begin
-- undo demux chip...
-- input index progresses in natural order
-- output index progresses by channel.
  g1: for channel in 0 to 15 generate
    g2:	 for bit in 0 to 9 generate
      output( bit * 16 + channel ) <= input( channel * 10 + bit );
    end generate;
  end generate;
end behavioral;
