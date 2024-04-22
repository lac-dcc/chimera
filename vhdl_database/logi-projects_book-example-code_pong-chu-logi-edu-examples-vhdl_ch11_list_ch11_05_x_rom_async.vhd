-- Listing 11.5
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity rom_template is
   port(
      addr: in std_logic_vector(3 downto 0);
      data: out std_logic_vector(6 downto 0)
   );
end rom_template;

architecture arch of rom_template is
   constant ADDR_WIDTH: integer:=4;
   constant DATA_WIDTH: integer:=7;
   type rom_type is array (0 to 2**ADDR_WIDTH-1)
        of std_logic_vector(DATA_WIDTH-1 downto 0);
   -- ROM definition
   constant HEX2LED_ROM: rom_type:=(  -- 2^4-by-7
      "0000001",  -- addr 00
      "1001111",  -- addr 01
      "0010010",  -- addr 02
      "0000110",  -- addr 03
      "1001100",  -- addr 04
      "0100100",  -- addr 05
      "0100000",  -- addr 06
      "0001111",  -- addr 07
      "0000000",  -- addr 08
      "0000100",  -- addr 09
      "0001000",  -- addr 10
      "1100000",  -- addr 11
      "0110001",  -- addr 12
      "1000010",  -- addr 13
      "0110000",  -- addr 14
      "0111000"   -- addr 15
   );
begin
   data <= HEX2LED_ROM(to_integer(unsigned(addr)));
end arch;