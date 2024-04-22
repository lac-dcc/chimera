----------------------------------------------------------------------------------------------------
-- Copyright (c) 2019 Marcus Geelnard
--
-- This software is provided 'as-is', without any express or implied warranty. In no event will the
-- authors be held liable for any damages arising from the use of this software.
--
-- Permission is granted to anyone to use this software for any purpose, including commercial
-- applications, and to alter it and redistribute it freely, subject to the following restrictions:
--
--  1. The origin of this software must not be misrepresented; you must not claim that you wrote
--     the original software. If you use this software in a product, an acknowledgment in the
--     product documentation would be appreciated but is not required.
--
--  2. Altered source versions must be plainly marked as such, and must not be misrepresented as
--     being the original software.
--
--  3. This notice may not be removed or altered from any source distribution.
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- This file contains common types for the video logic.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package vid_types is
  --------------------------------------------------------------------------------------------------
  -- Video control registers.
  --------------------------------------------------------------------------------------------------
  type T_VID_REGS is record
    ADDR : std_logic_vector(23 downto 0);
    XOFFS : std_logic_vector(23 downto 0);
    XINCR : std_logic_vector(23 downto 0);
    HSTRT : std_logic_vector(23 downto 0);
    HSTOP : std_logic_vector(23 downto 0);
    CMODE : std_logic_vector(23 downto 0);
    RMODE : std_logic_vector(23 downto 0);
  end record T_VID_REGS;


  ------------------------------------------------------------------------------------------------
  -- Supported video resolution configurations.
  ------------------------------------------------------------------------------------------------
  type T_VIDEO_CONFIG is record
    width : positive;
    height : positive;
    front_porch_h : positive;
    sync_width_h : positive;
    back_porch_h : positive;
    front_porch_v : positive;
    sync_width_v : positive;
    back_porch_v : positive;
    polarity_h : std_logic;
    polarity_v : std_logic;
  end record T_VIDEO_CONFIG;

  -- 1920 x 1080 @ 60 Hz, pixel clock = 148.5 MHz
  constant C_1920_1080 : T_VIDEO_CONFIG := (
    width => 1920,
    height => 1080,
    front_porch_h => 88,
    sync_width_h => 44,
    back_porch_h => 148,
    front_porch_v => 4,
    sync_width_v => 5,
    back_porch_v => 36,
    polarity_h => '1',
    polarity_v => '1'
  );

  -- 1280 x 720 @ 60 Hz, pixel clock = 74.25 MHz
  constant C_1280_720 : T_VIDEO_CONFIG := (
    width => 1280,
    height => 720,
    front_porch_h => 110,
    sync_width_h => 40,
    back_porch_h => 220,
    front_porch_v => 5,
    sync_width_v => 5,
    back_porch_v => 20,
    polarity_h => '1',
    polarity_v => '1'
  );

  -- 800 x 600 @ 60 Hz, pixel clock = 40.0 MHz
  constant C_800_600 : T_VIDEO_CONFIG := (
    width => 800,
    height => 600,
    front_porch_h => 40,
    sync_width_h => 128,
    back_porch_h => 88,
    front_porch_v => 1,
    sync_width_v => 4,
    back_porch_v => 23,
    polarity_h => '1',
    polarity_v => '1'
  );

  -- 640 x 480 @ 60 Hz, pixel clock = 25.175 MHz
  constant C_640_480 : T_VIDEO_CONFIG := (
    width => 640,
    height => 480,
    front_porch_h => 16,
    sync_width_h => 96,
    back_porch_h => 48,
    front_porch_v => 10,
    sync_width_v => 2,
    back_porch_v => 33,
    polarity_h => '0',
    polarity_v => '0'
  );
end package;
