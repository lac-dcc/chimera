library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library work;
use work.video_controller_pkg.all;
use work.platform_variant_pkg.all;

package sprite_pkg is

  subtype SPRITE_N_t is std_logic_vector(11 downto 0);
  subtype SPRITE_A_t is std_logic_vector(8 downto 0);
  subtype SPRITE_D_t is std_logic_vector(7 downto 0);
  
  type from_SPRITE_REG_t is record
    n         : SPRITE_N_t;
    x         : std_logic_vector(10 downto 0);
    y         : std_logic_vector(10 downto 0);
    xflip     : std_logic;
    yflip     : std_logic;
    colour    : std_logic_vector(7 downto 0);
    pri       : std_logic;
  end record;
  
  type to_SPRITE_REG_t is record
    clk       : std_logic;
    clk_ena   : std_logic;
    wr        : std_logic;
    a         : SPRITE_A_t;
    d         : SPRITE_D_t;
  end record;

  function NULL_TO_SPRITE_REG return to_SPRITE_REG_t;

  subtype SPRITE_ROW_D_t is std_logic_vector(23 downto 0);
  subtype SPRITE_ROW_A_t is std_logic_vector(15 downto 0);

  type to_SPRITE_CTL_t is record
    ld        : std_logic;
    d         : SPRITE_ROW_D_t;
    height    : integer range 0 to 3;
  end record;

  type from_SPRITE_CTL_t is record
    a         : SPRITE_ROW_A_t;
    set       : std_logic;
    pal_a     : std_logic_vector(7 downto 0);
  end record;

  function NULL_TO_SPRITE_CTL return to_SPRITE_CTL_t;

  component sprite_array is
    generic
    (
      N_SPRITES   : integer;
      DELAY       : integer
    );
    port
    (
      reset       : in std_logic;
      hwsel       : HWSEL_t;
      hires       : in std_logic;
      sprite_prom : in prom_a(0 to 31);

      -- register interface
      reg_i       : in to_SPRITE_REG_t;

      -- video control signals
      video_ctl   : in from_VIDEO_CTL_t;

      -- extra data
      graphics_i  : in to_GRAPHICS_t;

      -- sprite data
      row_a       : out SPRITE_ROW_A_t;
      row_d       : in SPRITE_ROW_D_t;

      -- video data
      pal_a       : out std_logic_vector(7 downto 0);
      set         : out std_logic;
      spr0_set    : out std_logic
    );
  end component sprite_array;

  function flip_row
  (
    row_in      : std_logic_vector;
    flip        : std_logic
  )
  return SPRITE_ROW_D_t;

  function flip_1
  (
    d_i         : std_logic_vector;
    flip        : std_logic
  )
  return std_logic_vector;

end package sprite_pkg;
