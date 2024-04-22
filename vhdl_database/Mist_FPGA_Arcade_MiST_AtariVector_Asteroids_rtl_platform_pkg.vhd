library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;
use work.project_pkg.all;

package platform_pkg is

	--  
	-- PACE constants which *MUST* be defined
	--

  constant PACE_PLATFORM_NAME           : string := "Asteroids";

	constant PACE_VIDEO_NUM_BITMAPS 	    : natural := 1;
	constant PACE_VIDEO_NUM_TILEMAPS 	    : natural := 0;
	constant PACE_VIDEO_NUM_SPRITES 	    : natural := 0;
  -- define in project_pkg
	--constant PACE_VIDEO_H_SIZE				    : integer := 1024/2;
	--constant PACE_VIDEO_V_SIZE				    : integer := 1024/2; --768/2;
  constant PACE_VIDEO_L_CROP            : natural := 0;
  constant PACE_VIDEO_R_CROP            : natural := 0;
  constant PACE_VIDEO_PIPELINE_DELAY    : integer := 3;
	
  constant PACE_INPUTS_NUM_BYTES        : integer := 2;
	
	--
	-- Platform-specific constants (optional)
	--

  type from_PLATFORM_IO_t is record
    not_used  : std_logic;
  end record;

  type to_PLATFORM_IO_t is record
    not_used  : std_logic;
  end record;

end;
