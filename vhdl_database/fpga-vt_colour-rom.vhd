
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity COLOUR_ROM is
  port(
    A : in  std_logic_vector(3 downto 0);
    D : out std_logic_vector(5 downto 0)
    );
end COLOUR_ROM;

-- VGA palette taken from http://cpansearch.perl.org/src/BRICAS/Image-TextMode-0.25/lib/Image/TextMode/Palette/VGA.pm

-- generate a 2-bit per channel RGB value from a VGA colour number

architecture rtl of COLOUR_ROM is
  subtype ROM_WORD is std_logic_vector(5 downto 0);
  type ROM_TABLE is array(0 to 15) of ROM_WORD;
  constant ROM : ROM_TABLE := ROM_TABLE'(
    "000000",
    "000010",
    "001000",
    "001010",
    "100000",
    "100010",
    "100100",
    "101010",
    "010101",
    "010111",
    "011101",
    "011111",
    "110101",
    "110111",
    "111101",
    "111111"
    );                                  -- 0x0FFF
begin
  D <= ROM(to_integer(unsigned(A)));
end;
