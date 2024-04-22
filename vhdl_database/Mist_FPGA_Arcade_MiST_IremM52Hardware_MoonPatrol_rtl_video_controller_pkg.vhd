library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package video_controller_pkg is

  type PACEVideoController_t is
  (
    PACE_VIDEO_NONE,                      -- PACE video controller not used
    PACE_VIDEO_VGA_240x320_60Hz,          -- P3M video
    PACE_VIDEO_VGA_320x480_60Hz,          -- for 320x200 (12.588MHz)
    PACE_VIDEO_VGA_640x480_60Hz,          -- generic VGA (25.175MHz)
    PACE_VIDEO_VGA_800x600_60Hz,          -- generic VGA (40MHz)
    PACE_VIDEO_VGA_1024x768_60Hz,         -- XVGA (65MHz)
    PACE_VIDEO_VGA_1366x768_60Hz,         -- (NAVICO ROCKY) (72MHz)
    PACE_VIDEO_VGA_1280x800_60Hz,         -- Sentinel Mode 36
    PACE_VIDEO_VGA_1280x1024_60Hz,        -- SXGA (108MHz)
    PACE_VIDEO_VGA_1680x1050_60Hz,        -- WSXGA+ (147MHz)
    PACE_VIDEO_ARCADE_STD_336x240_60Hz,   -- arcade std resolution (7.16MHz)
    PACE_VIDEO_ARCADE_STD_336x240_60Hz_28M64,   -- arcade std resolution (28.64MHz)
    PACE_VIDEO_CVBS_720x288p_50Hz,        -- generic composite
    PACE_VIDEO_LCM_320x240_60Hz,          -- DE2 LCD
	 PACE_VIDEO_PAL_320x288_50Hz
  );

  type PACEVideoDisplay_t is
  (
    PACE_DISPLAY_NONE,
    PACE_DISPLAY_VGA,
    PACE_DISPLAY_CVBS,
    PACE_DISPLAY_TFT
  );

  type RGB_t is record
    r : std_logic_vector(9 downto 0);
    g : std_logic_vector(9 downto 0);
    b : std_logic_vector(9 downto 0);
  end record;

  type RGB_a is array (natural range <>) of RGB_t;
  
  function NULL_RGB return RGB_t;

  constant RGB_BLACK    : RGB_t := ((others=>'0'),(others=>'0'),(others=>'0'));
  constant RGB_RED      : RGB_t := ((others=>'1'),(others=>'0'),(others=>'0'));
  constant RGB_GREEN    : RGB_t := ((others=>'0'),(others=>'1'),(others=>'0'));
  constant RGB_YELLOW   : RGB_t := ((others=>'1'),(others=>'1'),(others=>'0'));
  constant RGB_BLUE     : RGB_t := ((others=>'0'),(others=>'0'),(others=>'1'));
  constant RGB_MAGENTA  : RGB_t := ((others=>'1'),(others=>'0'),(others=>'1'));
  constant RGB_CYAN     : RGB_t := ((others=>'0'),(others=>'1'),(others=>'1'));
  constant RGB_WHITE    : RGB_t := ((others=>'1'),(others=>'1'),(others=>'1'));
  
	type VIDEO_REG_t is record
		h_scale		: std_logic_vector(2 downto 0);
		v_scale		: std_logic_vector(2 downto 0);
	end record;

  type from_VIDEO_t is record
    clk       : std_logic;
    clk_ena   : std_logic;
    reset     : std_logic;
  end record;
  
  type to_VIDEO_t is record
    clk       : std_logic;
    rgb       : rgb_t;
    hsync     : std_logic;
    vsync     : std_logic;
    hblank    : std_logic;
    vblank    : std_logic;
    de        : std_logic;
  end record;

  type from_VIDEO_CTL_t is record
    clk       : std_logic;
    clk_ena   : std_logic;
    stb       : std_logic;
    hblank    : std_logic;
    vblank    : std_logic;
    x         : std_logic_vector(10 downto 0);
    y         : std_logic_vector(10 downto 0);
  end record;
  
  subtype BITMAP_D_t is std_logic_vector(23 downto 0);
  subtype BITMAP_A_t is std_logic_vector(15 downto 0);
  
  type to_BITMAP_CTL_t is record
    d         : BITMAP_D_t;
  end record;
  
  type to_BITMAP_CTL_a is array (natural range <>) of to_BITMAP_CTL_t;

  function NULL_TO_BITMAP_CTL return to_BITMAP_CTL_t;

  type from_BITMAP_CTL_t is record
    a         : BITMAP_A_t;
    rgb       : RGB_t;
    set       : std_logic;
  end record;

  type from_BITMAP_CTL_a is array (natural range <>) of from_BITMAP_CTL_t;

  subtype TILEMAP_D_t is std_logic_vector(15 downto 0);
  subtype TILEMAP_A_t is std_logic_vector(15 downto 0);
  subtype TILE_A_t is std_logic_vector(16 downto 0);
  subtype TILE_D_t is std_logic_vector(23 downto 0);
  subtype ATTR_A_t is std_logic_vector(15 downto 0);
  subtype ATTR_D_t is std_logic_vector(15 downto 0);
  
  type to_TILEMAP_CTL_t is record
    map_d     : TILEMAP_D_t;
    tile_d    : TILE_D_t;
    attr_d    : ATTR_D_t;
  end record;

  type to_TILEMAP_CTL_a is array (natural range <>) of to_TILEMAP_CTL_t;
  
  function NULL_TO_TILEMAP_CTL return to_TILEMAP_CTL_t;

  type from_TILEMAP_CTL_t is record
    map_a     : TILEMAP_A_t;
    tile_a    : TILE_A_t;
    attr_a    : ATTR_A_t;
    rgb       : RGB_t;
    set       : std_logic;
  end record;

  type from_TILEMAP_CTL_a is array (natural range <>) of from_TILEMAP_CTL_t;
  
  subtype PAL_ENTRY_t is std_logic_vector(15 downto 0);
  type PAL_A_t is array (natural range <>) of PAL_ENTRY_t;
  
  subtype BYTE_t is std_logic_vector(7 downto 0);
  type BYTE_A_t is array (natural range <>) of BYTE_t;
  
  subtype WORD_t is std_logic_vector(15 downto 0);
  type WORD_A_t is array (natural range <>) of WORD_t;
  
  type to_GRAPHICS_t is record
    pal       : PAL_A_t(0 to 15);
    -- for various uses
    bit8      : BYTE_A_t(0 to 7);
    bit16     : WORD_A_t(0 to 3);
    -- 'native' graphics stream
    hsync     : std_logic;
    vsync     : std_logic;
    rgb       : RGB_t;
  end record;

  function NULL_TO_GRAPHICS return to_GRAPHICS_t;

  type from_GRAPHICS_t is record
    y         : std_logic_vector(10 downto 0);
    hblank    : std_logic;
    vblank    : std_logic;
  end record;

  component pace_video_controller is
    generic
    (
      CONFIG		  : PACEVideoController_t := PACE_VIDEO_NONE;
      DELAY       : integer := 1;
      H_SIZE      : integer;
      V_SIZE      : integer;
      --H_SCALE     : integer;
      --V_SCALE     : integer;
      BORDER_RGB  : RGB_t := RGB_BLACK
    );
    port
    (
      -- clocking etc
      video_i       : in from_VIDEO_t;
      
      -- register interface
      reg_i			    : in VIDEO_REG_t;
      
      -- video input data
      rgb_i         : in RGB_t;

      -- control signals (out)
      video_ctl_o   : from_VIDEO_CTL_t;
      
      -- Outputs to video
      video_o       : out to_VIDEO_t
    );
  end component pace_video_controller;

	component tilemapCtl is          
	  generic
	  (
	    DELAY       : integer
	  );
	  port               
	  (
	    reset				: in std_logic;
	
	    -- video control signals		
	    video_ctl   : in from_VIDEO_CTL_t;
	
	    -- tilemap controller signals
	    ctl_i       : in to_TILEMAP_CTL_t;
	    ctl_o       : out from_TILEMAP_CTL_t;
	
	    graphics_i  : in to_GRAPHICS_t
	  );
	end component tilemapCtl;

  component bitmapCtl is
    generic
    (
      DELAY         : integer
    );
    port               
    (
      reset					: in std_logic;

      -- video control signals		
      video_ctl     : in from_VIDEO_CTL_t;

      -- bitmap controller signals
      ctl_i         : in to_BITMAP_CTL_t;
      ctl_o         : out from_BITMAP_CTL_t;

      graphics_i    : in to_GRAPHICS_t
    );
  end component bitmapCtl;

end package video_controller_pkg;
