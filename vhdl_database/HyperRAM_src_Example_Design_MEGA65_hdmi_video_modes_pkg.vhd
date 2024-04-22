library ieee;
use ieee.std_logic_1164.all;

package video_modes_pkg is

   type video_modes_t is record
      CLK_KHZ   : integer;    -- Pixel clock frequency in kHz
      PIX_SIZE  : integer;    -- Number of bits in pixel coordinates
      H_PIXELS  : integer;    -- horizontal display width in pixels
      V_PIXELS  : integer;    -- vertical display width in rows
      H_PULSE   : integer;    -- horizontal sync pulse width in pixels
      H_BP      : integer;    -- horizontal back porch width in pixels
      H_FP      : integer;    -- horizontal front porch width in pixels
      V_PULSE   : integer;    -- vertical sync pulse width in rows
      V_BP      : integer;    -- vertical back porch width in rows
      V_FP      : integer;    -- vertical front porch width in rows
      H_MAX     : integer;    -- Sum of H_PIXELS, H_PULSE, H_BP, and H_FP
      V_MAX     : integer;    -- Sum of V_PIXELS, V_PULSE, V_BP, and V_FP
      H_POL     : std_logic;  -- horizontal sync pulse polarity (1 = positive, 0 = negative)
      V_POL     : std_logic;  -- vertical sync pulse polarity (1 = positive, 0 = negative)
   end record video_modes_t;

   -- Taken from this link: http://tinyvga.com/vga-timing/800x600@60Hz
   constant C_VIDEO_MODE_800_600_60 : video_modes_t := (
      CLK_KHZ   => 40000,     -- 40 MHz
      PIX_SIZE  => 11,
      H_PIXELS  => 800,       -- horizontal display width in pixels
      V_PIXELS  => 600,       -- vertical display width in rows
      H_PULSE   => 128,       -- horizontal sync pulse width in pixels
      H_BP      => 88,        -- horizontal back porch width in pixels
      H_FP      => 40,        -- horizontal front porch width in pixels
      V_PULSE   => 4,         -- vertical sync pulse width in rows
      V_BP      => 23,        -- vertical back porch width in rows
      V_FP      => 1,         -- vertical front porch width in rows
      H_MAX     => 1056,
      V_MAX     => 628,
      H_POL     => '1',       -- horizontal sync pulse polarity (1 = positive, 0 = negative)
      V_POL     => '1'        -- vertical sync pulse polarity (1 = positive, 0 = negative)
   ); -- C_VIDEO_MODE_800_600_60

   -- Taken from section 4.9 in the document CEA-861-D
   constant C_VIDEO_MODE_720_576_50 : video_modes_t := (
      CLK_KHZ   => 27000,     -- 27 MHz
      PIX_SIZE  => 10,
      H_PIXELS  => 720,       -- horizontal display width in pixels
      V_PIXELS  => 576,       -- vertical display width in rows
      H_PULSE   => 64,        -- horizontal sync pulse width in pixels
      H_BP      => 63,        -- horizontal back porch width in pixels
      H_FP      => 17,        -- horizontal front porch width in pixels
      V_PULSE   => 5,         -- vertical sync pulse width in rows
      V_BP      => 39,        -- vertical back porch width in rows
      V_FP      => 5,         -- vertical front porch width in rows
      H_MAX     => 864,
      V_MAX     => 625,
      H_POL     => '0',       -- horizontal sync pulse polarity (1 = positive, 0 = negative)
      V_POL     => '0'        -- vertical sync pulse polarity (1 = positive, 0 = negative)
   ); -- C_VIDEO_MODE_720_576_50

   -- Taken from sections 4.3 and A.4 in the document CEA-861-D
   constant C_VIDEO_MODE_1280_720_60 : video_modes_t := (
      CLK_KHZ   => 74250,     -- 74.25 MHz
      PIX_SIZE  => 11,
      H_PIXELS  => 1280,      -- horizontal display width in pixels
      V_PIXELS  =>  720,      -- vertical display width in rows
      H_FP      =>  110,      -- horizontal front porch width in pixels
      H_PULSE   =>   40,      -- horizontal sync pulse width in pixels
      H_BP      =>  220,      -- horizontal back porch width in pixels
      V_FP      =>    5,      -- vertical front porch width in rows
      V_PULSE   =>    5,      -- vertical sync pulse width in rows
      V_BP      =>   20,      -- vertical back porch width in rows
      H_MAX     => 1650,
      V_MAX     => 750,
      H_POL     => '1',       -- horizontal sync pulse polarity (1 = positive, 0 = negative)
      V_POL     => '1'        -- vertical sync pulse polarity (1 = positive, 0 = negative)
   ); -- C_VIDEO_MODE_1280_720_60

   -- Taken from sections 4.15 in the document CEA-861-D
   constant C_VIDEO_MODE_1920_1080_60 : video_modes_t := (
      CLK_KHZ   => 148500,    -- 148.50 MHz
      PIX_SIZE  =>   12,
      H_PIXELS  => 1920,      -- horizontal display width in pixels
      V_PIXELS  => 1080,      -- vertical display width in rows
      H_FP      =>   88,      -- horizontal front porch width in pixels
      H_PULSE   =>   44,      -- horizontal sync pulse width in pixels
      H_BP      =>  148,      -- horizontal back porch width in pixels
      V_FP      =>    4,      -- vertical front porch width in rows
      V_PULSE   =>    5,      -- vertical sync pulse width in rows
      V_BP      =>   36,      -- vertical back porch width in rows
      H_MAX     => 2200,
      V_MAX     => 1125,
      H_POL     => '1',       -- horizontal sync pulse polarity (1 = positive, 0 = negative)
      V_POL     => '1'        -- vertical sync pulse polarity (1 = positive, 0 = negative)
   ); -- C_VIDEO_MODE_1920_1080_60

end package video_modes_pkg;

package body video_modes_pkg is
end package body video_modes_pkg;

