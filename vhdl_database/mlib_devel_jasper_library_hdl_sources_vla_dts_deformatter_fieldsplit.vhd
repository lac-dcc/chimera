library ieee;
use ieee.std_logic_1164.all;

-- shuffles some fields around
-- This is only signal renaming, no logic or clocking.
entity fieldsplit is
  port(
    input     : in  std_logic_vector( 159 downto 0 );
    output    : out std_logic_vector( 159 downto 0 )
    );
end fieldsplit;

architecture behavioral of fieldsplit is
begin
-- input      output
-- (on fiber) (this module)
--   0..5      0..5      lsbs of sync pattern
--  16..19     6..9      msbs of sync pattern
--      6         10     metaframe index
--   7..11    11..15     sequence count
--  12..15    16..19     lsbs of payload
--  20..143   20..143    msbs of payload
-- 144..159  144..159    checksum
  output( 159 downto 20 ) <= input( 159 downto 20 ); -- most of payload
                                                     -- and checksum
  output(  19 downto 16 ) <= input(  15 downto 12 ); -- lsbs of payload
  output(   5 downto  0 ) <= input(   5 downto  0 ); -- lsbs of sync
  output(   9 downto  6 ) <= input(  19 downto 16 ); -- msbs of sync
  output(  15 downto 11 ) <= input(  11 downto  7 ); -- frame count
  output(            10 ) <= input(             6 ); -- metaframe index
end behavioral;


