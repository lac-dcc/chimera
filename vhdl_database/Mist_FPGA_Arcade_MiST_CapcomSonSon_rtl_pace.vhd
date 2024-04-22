library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.sprite_pkg.all;
use work.platform_pkg.all;

entity PACE is
  port
  (
  	-- clocks and resets
    clkrst_i        : in from_CLKRST_t;

    -- controller inputs
    inputs_p1			: in std_logic_vector(7 downto 0);
    inputs_p2			: in std_logic_vector(7 downto 0);
    inputs_sys			: in std_logic_vector(7 downto 0);
    inputs_dip1		: in std_logic_vector(7 downto 0);
    inputs_dip2		: in std_logic_vector(7 downto 0);
    -- video
    video_i         : in from_VIDEO_t;
    video_o         : out to_VIDEO_t;

    -- audio
    audio_i         : in from_AUDIO_t;
    audio_o         : out to_AUDIO_t;
    platform_i      : in from_PLATFORM_IO_t;
    platform_o      : out to_PLATFORM_IO_t;
    cpu_rom_addr		: out std_logic_vector(15 downto 0);
    cpu_rom_do			: in std_logic_vector(7 downto 0);
    tile_rom_addr		: out std_logic_vector(12 downto 0);
    tile_rom_do		: in std_logic_vector(15 downto 0);
    snd_rom_addr : out std_logic_vector(12 downto 0);
    snd_rom_do   : in std_logic_vector(7 downto 0)
  );
end entity PACE;

architecture SYN of PACE is

  signal to_tilemap_ctl   : to_TILEMAP_CTL_a(1 to PACE_VIDEO_NUM_TILEMAPS);
  signal from_tilemap_ctl : from_TILEMAP_CTL_a(1 to PACE_VIDEO_NUM_TILEMAPS);

  signal to_bitmap_ctl    : to_BITMAP_CTL_a(1 to PACE_VIDEO_NUM_BITMAPS);
  signal from_bitmap_ctl  : from_BITMAP_CTL_a(1 to PACE_VIDEO_NUM_BITMAPS);

  signal to_sprite_reg    : to_SPRITE_REG_t;
  signal to_sprite_ctl    : to_SPRITE_CTL_t;
  signal from_sprite_ctl  : from_SPRITE_CTL_t;
  signal spr0_hit					: std_logic;

  signal to_graphics      : to_GRAPHICS_t;
  signal from_graphics    : from_GRAPHICS_t;

  signal snd_irq          : std_logic;
  signal snd_data         : std_logic_vector(7 downto 0);

  signal video_out        : to_VIDEO_t;

begin

  video_o <= video_out;

  platform_inst : entity work.platform
    port map
    (
      -- clocking and reset
      clkrst_i        => clkrst_i,
      -- controller inputs
      inputs_p1       => inputs_p1, 
      inputs_p2       => inputs_p2, 
      inputs_sys      => inputs_sys,
      inputs_dip1     => inputs_dip1, 
      inputs_dip2     => inputs_dip2, 

      -- graphics
      bitmap_i        => from_bitmap_ctl,
      bitmap_o        => to_bitmap_ctl,

      tilemap_i       => from_tilemap_ctl,
      tilemap_o       => to_tilemap_ctl,

      sprite_reg_o    => to_sprite_reg,
      sprite_i        => from_sprite_ctl,
      sprite_o        => to_sprite_ctl,
      spr0_hit        => spr0_hit,

      graphics_i      => from_graphics,
      graphics_o      => to_graphics,

      -- sound
      snd_irq         => snd_irq,
      snd_data        => snd_data,

      platform_i      => platform_i,
      platform_o      => platform_o,
      cpu_rom_addr    => cpu_rom_addr,
      cpu_rom_do      => cpu_rom_do,
      tile_rom_addr   => tile_rom_addr,
      tile_rom_do     => tile_rom_do
    );

  graphics_inst : entity work.Graphics                                    
    Port Map
    (
      bitmap_ctl_i    => to_bitmap_ctl,
      bitmap_ctl_o    => from_bitmap_ctl,

      tilemap_ctl_i   => to_tilemap_ctl,
      tilemap_ctl_o   => from_tilemap_ctl,

      sprite_reg_i    => to_sprite_reg,
      sprite_ctl_i    => to_sprite_ctl,
      sprite_ctl_o    => from_sprite_ctl,
      spr0_hit				=> spr0_hit,

      graphics_i      => to_graphics,
      graphics_o      => from_graphics,

			-- video (incl. clk)
      video_i         => video_i,
      video_o         => video_out
    );

    sound_inst : entity work.sonson_soundboard
      port map
      (
      -- clocking and reset
      clkrst_i        => clkrst_i,

      sound_irq       => snd_irq,
      sound_data      => snd_data,

      audio_out_l     => audio_o.ldata(9 downto 0),
      audio_out_r     => audio_o.rdata(9 downto 0),

      snd_rom_addr    => snd_rom_addr,
      snd_rom_do      => snd_rom_do
    );

end SYN;
