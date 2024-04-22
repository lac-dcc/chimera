library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;

use work.platform_variant_pkg.all;
use work.video_controller_pkg.all;
package platform_pkg is


  constant PACE_VIDEO_NUM_BITMAPS           : natural := 0;
  constant PACE_VIDEO_NUM_TILEMAPS          : natural := 2;
  constant PACE_VIDEO_NUM_SPRITES           : natural := 64;
  constant PACE_VIDEO_PIPELINE_DELAY        : integer := 5;

  constant PACE_INPUTS_NUM_BYTES            : integer := 6;

  type from_PLATFORM_IO_t is record
    not_used  : std_logic;
  end record;

  type to_PLATFORM_IO_t is record
    not_used  : std_logic;
  end record;

end;
