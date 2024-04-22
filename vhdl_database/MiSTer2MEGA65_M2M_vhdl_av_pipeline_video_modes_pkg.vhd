library ieee;
use ieee.std_logic_1164.all;

package video_modes_pkg is

   type video_modes_t is record
      CLK_KHZ     : integer;                       -- Pixel clock frequency in kHz      
      CEA_CTA_VIC : integer;                       -- CEA/CTA VIC
      ASPECT      : std_logic_vector(1 downto 0);  -- aspect ratio: 01=4:3, 10=16:9
      PIXEL_REP   : std_logic;                     -- 0=no pixel repetition; 1=pixel repetition      
      H_PIXELS    : integer;                       -- horizontal display width in pixels
      V_PIXELS    : integer;                       -- vertical display width in rows
      H_PULSE     : integer;                       -- horizontal sync pulse width in pixels
      H_BP        : integer;                       -- horizontal back porch width in pixels
      H_FP        : integer;                       -- horizontal front porch width in pixels
      V_PULSE     : integer;                       -- vertical sync pulse width in rows
      V_BP        : integer;                       -- vertical back porch width in rows
      V_FP        : integer;                       -- vertical front porch width in rows
      H_POL       : std_logic;                     -- horizontal sync pulse polarity (1 = positive, 0 = negative)
      V_POL       : std_logic;                     -- vertical sync pulse polarity (1 = positive, 0 = negative)
   end record video_modes_t;

   -- SVGA 800x600 @ 60 Hz
   -- Taken from this link: http://tinyvga.com/vga-timing/800x600@60Hz
   -- CAUTION: CTA/CTV VIC does not officially support SVGA 800x600; there are some monitors, where it works, though
   constant C_SVGA_800_600_60 : video_modes_t := (
      CLK_KHZ     => 40000,      -- 40 MHz
      CEA_CTA_VIC => 65,         -- SVGA is not an official mode; "65" taken from here: https://www.raspberrypi.org/documentation/configuration/config-txt/video.md
      ASPECT      => "01",       -- aspect ratio: 01=4:3, 10=16:9: "01" for SVGA
      PIXEL_REP   => '0',        -- no pixel repetition
      H_PIXELS    => 800,        -- horizontal display width in pixels
      V_PIXELS    => 600,        -- vertical display width in rows
      H_PULSE     => 128,        -- horizontal sync pulse width in pixels
      H_BP        => 88,         -- horizontal back porch width in pixels
      H_FP        => 40,         -- horizontal front porch width in pixels
      V_PULSE     => 4,          -- vertical sync pulse width in rows
      V_BP        => 23,         -- vertical back porch width in rows
      V_FP        => 1,          -- vertical front porch width in rows
      H_POL       => '1',        -- horizontal sync pulse polarity (1 = positive, 0 = negative)
      V_POL       => '1'         -- vertical sync pulse polarity (1 = positive, 0 = negative)
   );

   -- PAL 720x576 @ 50 Hz
   -- Taken from section 4.9 in the document CEA-861-D
   constant C_PAL_720_576_50 : video_modes_t := (
      CLK_KHZ     => 27000,      -- 27 MHz
      CEA_CTA_VIC => 17,         -- CEA/CTA VIC 17=PAL 720x576 @ 50 Hz
      ASPECT      => "01",       -- aspect ratio: 01=4:3, 10=16:9: "01" for PAL
      PIXEL_REP   => '0',        -- no pixel repetition
      H_PIXELS    => 720,        -- horizontal display width in pixels
      V_PIXELS    => 576,        -- vertical display width in rows
      H_PULSE     => 64,         -- horizontal sync pulse width in pixels
      H_BP        => 63,         -- horizontal back porch width in pixels
      H_FP        => 17,         -- horizontal front porch width in pixels
      V_PULSE     => 5,          -- vertical sync pulse width in rows
      V_BP        => 39,         -- vertical back porch width in rows
      V_FP        => 5,          -- vertical front porch width in rows
      H_POL       => '0',        -- horizontal sync pulse polarity (1 = positive, 0 = negative)
      V_POL       => '0'         -- vertical sync pulse polarity (1 = positive, 0 = negative)
   );

   -- HDMI 720p @ 60 Hz (1280x720)
   -- Taken from section 4.3 in the document CEA-861-D
   constant C_HDMI_720p_60 : video_modes_t := (
      CLK_KHZ     => 74250,      -- 74.25 MHz
      CEA_CTA_VIC => 4,          -- CEA/CTA VIC: 1280x720p, 60 Hz, 16:9
      ASPECT      => "10",       -- apsect ratio: 01=4:3, 10=16:9
      PIXEL_REP   => '0',        -- no pixel repetition
      H_PIXELS    => 1280,       -- horizontal display width in pixels
      V_PIXELS    => 720,        -- vertical display width in rows
      H_FP        => 110,        -- horizontal front porch width in pixels
      H_PULSE     => 40,         -- horizontal sync pulse width in pixels
      H_BP        => 220,        -- horizontal back porch width in pixels
      V_FP        => 5,          -- vertical front porch width in rows
      V_PULSE     => 5,          -- vertical sync pulse width in rows
      V_BP        => 20,         -- vertical back porch width in rows
      H_POL       => '0',        -- horizontal sync pulse polarity (1 = positive, 0 = negative)
      V_POL       => '0'         -- vertical sync pulse polarity (1 = positive, 0 = negative)
   );

   -- HDMI 720p @ 50 Hz (1280x720)
   -- Taken from section 4.7 in the document CEA-861-D
   constant C_HDMI_720p_50 : video_modes_t := (
      CLK_KHZ     => 74250,      -- 74.25 MHz
      CEA_CTA_VIC => 19,         -- CEA/CTA VIC: 1280x720p, 50 Hz, 16:9
      ASPECT      => "10",       -- apsect ratio: 01=4:3, 10=16:9
      PIXEL_REP   => '0',        -- no pixel repetition
      H_PIXELS    => 1280,       -- horizontal display width in pixels
      V_PIXELS    => 720,        -- vertical display width in rows
      H_FP        => 440,        -- horizontal front porch width in pixels
      H_PULSE     => 40,         -- horizontal sync pulse width in pixels
      H_BP        => 220,        -- horizontal back porch width in pixels
      V_FP        => 5,          -- vertical front porch width in rows
      V_PULSE     => 5,          -- vertical sync pulse width in rows
      V_BP        => 20,         -- vertical back porch width in rows
      H_POL       => '1',        -- horizontal sync pulse polarity (1 = positive, 0 = negative)
      V_POL       => '1'         -- vertical sync pulse polarity (1 = positive, 0 = negative)
   );

   -- HDMI 576p @ 50 Hz (720x576)
   -- Taken from section 4.9 in the document CEA-861-D
   constant C_HDMI_576p_50 : video_modes_t := (
      CLK_KHZ     => 27000,      -- 27.00 MHz
      CEA_CTA_VIC => 17,         -- CEA/CTA VIC: 720x576p, 50 Hz, 4:3
      ASPECT      => "01",       -- apsect ratio: 01=4:3, 10=16:9
      PIXEL_REP   => '0',        -- no pixel repetition
      H_PIXELS    => 720,        -- horizontal display width in pixels
      V_PIXELS    => 576,        -- vertical display width in rows
      H_FP        => 12,         -- horizontal front porch width in pixels
      H_PULSE     => 64,         -- horizontal sync pulse width in pixels
      H_BP        => 68,         -- horizontal back porch width in pixels
      V_FP        => 5,          -- vertical front porch width in rows
      V_PULSE     => 5,          -- vertical sync pulse width in rows
      V_BP        => 39,         -- vertical back porch width in rows
      H_POL       => '1',        -- horizontal sync pulse polarity (1 = positive, 0 = negative)
      V_POL       => '1'         -- vertical sync pulse polarity (1 = positive, 0 = negative)
   );

   type video_modes_vector is array(natural range<>) of video_modes_t;

end package video_modes_pkg;

package body video_modes_pkg is
end package body video_modes_pkg;

