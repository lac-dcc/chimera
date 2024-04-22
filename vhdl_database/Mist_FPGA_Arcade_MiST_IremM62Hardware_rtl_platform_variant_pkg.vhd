library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;

use work.platform_pkg.all;

package platform_variant_pkg is


  constant HW_LDRUN    : integer := 0;
  constant HW_LDRUN2   : integer := 1;
  constant HW_LDRUN3   : integer := 2;
  constant HW_LDRUN4   : integer := 3;
  constant HW_KUNGFUM  : integer := 4;
  constant HW_HORIZON  : integer := 5;
  constant HW_BATTROAD : integer := 6;
  constant HW_KIDNIKI  : integer := 7;
  constant HW_LOTLOT   : integer := 8;
  constant HW_SPELUNKR : integer := 9;
  constant HW_SPELUNK2 : integer := 10;
  constant HW_YOUJYUDN : integer := 11;

  subtype HWSEL_t is integer range 0 to 11;

  type rom_a is array (natural range <>) of string;

  type pal_rgb_t is array (0 to 2) of std_logic_vector(7 downto 0);
  type pal_a is array (natural range <>) of pal_rgb_t;

  -- table of sprite heights
  type prom_a is array (natural range <>) of integer range 0 to 3;

end package platform_variant_pkg;
