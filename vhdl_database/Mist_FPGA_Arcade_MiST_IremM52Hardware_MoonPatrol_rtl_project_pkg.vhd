library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;
use work.pace_pkg.all;
use work.target_pkg.all;
use work.video_controller_pkg.all;

package project_pkg is

	--  
	-- PACE constants which *MUST* be defined
	--
	
  -- Reference clock is 24MHz
	constant PACE_HAS_PLL								      : boolean := true;
  --constant PACE_HAS_FLASH                   : boolean := false;
  --constant PACE_HAS_SRAM                    : boolean := false;
  constant PACE_HAS_SDRAM                   : boolean := false;
  constant PACE_HAS_SERIAL                  : boolean := false;
	
	constant PACE_JAMMA	                      : PACEJamma_t := PACE_JAMMA_NONE;
  
  ---- * defined in platform_pkg
	--constant PACE_VIDEO_H_SIZE				        : integer := 224;
	--constant PACE_VIDEO_V_SIZE				        : integer := 256; -- why not 240?

  constant PACE_VIDEO_CONTROLLER_TYPE       : PACEVideoController_t := PACE_VIDEO_PAL_320x288_50Hz; -- PACE_VIDEO_VGA_800x600_60Hz;
  constant PACE_CLK0_DIVIDE_BY              : natural := 27;
  constant PACE_CLK0_MULTIPLY_BY            : natural := 6;       -- 27/27*6 = 6MHz
  constant PACE_CLK1_DIVIDE_BY              : natural := 27;
  constant PACE_CLK1_MULTIPLY_BY            : natural := 6;       -- 27/27*6 = 6MHz
  constant PACE_VIDEO_H_SCALE               : integer := 1;
  constant PACE_VIDEO_V_SCALE               : integer := 1;
  constant PACE_VIDEO_H_SYNC_POLARITY       : std_logic := '1';
  constant PACE_VIDEO_V_SYNC_POLARITY       : std_logic := '1';


  constant PACE_VIDEO_BORDER_RGB            : RGB_t := RGB_BLACK;
  
  constant PACE_HAS_OSD                     : boolean := false;
  constant PACE_OSD_XPOS                    : natural := 0;
  constant PACE_OSD_YPOS                    : natural := 0;

  -- NAVICO-ROCKY-specific constants
  
  constant ROCKY_EMULATED_SRAM_WIDTH_AD     : natural := 16;
  constant ROCKY_EMULATED_SRAM_WIDTH        : natural := 8;

  constant ROCKY_EMULATED_FLASH_INIT_FILE   : string := "";
  constant ROCKY_EMULATED_FLASH_WIDTH_AD    : natural := 10;
  constant ROCKY_EMULATED_FLASH_WIDTH       : natural := 8;

	-- Moon Patrol-specific constants
			
	constant M52_USE_INTERNAL_WRAM            : boolean := true;

	-- derived - do not edit

  constant ROCKY_EMULATE_SRAM               : boolean := false;
  constant ROCKY_EMULATE_FLASH              : boolean := false;
  
  constant PACE_HAS_FLASH                   : boolean := false;
  constant PACE_HAS_SRAM                    : boolean := false;
    
  type from_PROJECT_IO_t is record
    not_used  : std_logic;
  end record;

  type to_PROJECT_IO_t is record
    not_used  : std_logic;
  end record;

end;
