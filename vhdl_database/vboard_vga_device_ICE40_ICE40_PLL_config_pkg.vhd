library ieee;
context ieee.ieee_std_context;

package ICE40_PLL_config is

type ICE40_PLL_config_t is record
  DIVF : natural;
  DIVQ : natural;
end record;

type ICE40_PLL_configs_t is array (natural range <>) of ICE40_PLL_config_t;

type screen_configs_t is array (natural range <>) of natural;

constant ICE40_Screen_configs : screen_configs_t(0 to 61) := (
   0 => 0,
   1 => 1,
   2 => 0,
   3 => 1,
   4 => 0,
   5 => 1,
   6 => 1,
   7 => 3,
   8 => 6,
   9 => 2,
  10 => 2,
  11 => 5,
  12 => 8,
  13 => 11,
  14 => 13,
  15 => 3,
  16 => 4,
  17 => 9,
  18 => 10,
  19 => 12,
  20 => 15,
  21 => 7,
  22 => 14,
  23 => 16,
  24 => 17,
  others => 0
--  25 => ,
--  26 => ,
--  27 => ,
--  28 => ,
--  29 => ,
--  30 => ,
--  31 => ,
--  32 => ,
--  33 => ,
--  34 => ,
--  35 => ,
--  36 => ,
--  37 => ,
--  38 => ,
--  39 => ,
--  40 => ,
--  41 => ,
--  42 => ,
--  43 => ,
--  44 => ,
--  45 => ,
--  46 => ,
--  47 => ,
--  48 => ,
--  49 => ,
--  50 => ,
--  51 => ,
--  52 => ,
--  53 => ,
--  54 => ,
--  55 => ,
--  56 => ,
--  57 => ,
--  58 => ,
--  59 => ,
--  60 => ,
--  61 =>
);

end ICE40_PLL_config;
