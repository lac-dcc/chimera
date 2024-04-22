library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.sprite_pkg.all;
use work.platform_pkg.all;

entity pace_video_mixer is
  port
  (
      --bitmap_rgb    : in RGB_t;
      --bitmap_set    : in std_logic;
      bitmap_ctl_o  : in from_BITMAP_CTL_a(1 to PACE_VIDEO_NUM_BITMAPS);
      tilemap_ctl_o : in from_TILEMAP_CTL_a(1 to PACE_VIDEO_NUM_TILEMAPS);
      sprite_rgb    : in RGB_t;
      sprite_set    : in std_logic;
      sprite_pri    : in std_logic;
      
      video_ctl_i   : in from_VIDEO_CTL_t;
      graphics_i    : in to_GRAPHICS_t;
      rgb_o         : out RGB_t
  );
end entity pace_video_mixer;
  
architecture SYN of pace_video_mixer is
  signal bg_rgb : RGB_t;
begin

  GEN_BITMAPS : 
    if PACE_VIDEO_NUM_BITMAPS = 1 generate
      bg_rgb <= bitmap_ctl_o(1).rgb;
    elsif PACE_VIDEO_NUM_BITMAPS = 2 generate
      bg_rgb <= bitmap_ctl_o(1).rgb when bitmap_ctl_o(1).set = '1' else
                bitmap_ctl_o(2).rgb;
    elsif PACE_VIDEO_NUM_BITMAPS = 3 generate
      bg_rgb <= bitmap_ctl_o(1).rgb when bitmap_ctl_o(1).set = '1' else
                bitmap_ctl_o(2).rgb when bitmap_ctl_o(2).set = '1' else
                bitmap_ctl_o(3).rgb when bitmap_ctl_o(3).set = '1' else
                (others => (others => '0'));
    else generate
      bg_rgb <= (others => (others => '0'));
  end generate GEN_BITMAPS;
    
  GEN_TILEMAPS : 
    if PACE_VIDEO_NUM_TILEMAPS = 1 generate
      rgb_o <=  sprite_rgb when sprite_set = '1' and sprite_pri = '1' else
                tilemap_ctl_o(1).rgb when tilemap_ctl_o(1).set = '1' else
                sprite_rgb when sprite_set = '1' else
                bg_rgb;
    elsif PACE_VIDEO_NUM_TILEMAPS = 2 generate
      rgb_o <=  tilemap_ctl_o(2).rgb when tilemap_ctl_o(2).set = '1' else
                sprite_rgb when sprite_set = '1' and sprite_pri = '1' else
                tilemap_ctl_o(1).rgb when tilemap_ctl_o(1).set = '1' else
                sprite_rgb when sprite_set = '1' else
                bg_rgb;
    else generate
      rgb_o <=  sprite_rgb when sprite_set = '1' and sprite_pri = '1' else
                sprite_rgb when sprite_set = '1' else
                bg_rgb;
  end generate GEN_TILEMAPS;
  
end architecture SYN;
