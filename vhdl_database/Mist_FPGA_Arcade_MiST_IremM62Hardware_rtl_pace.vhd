library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.sprite_pkg.all;
use work.platform_pkg.all;
use work.platform_variant_pkg.all;
--use work.project_pkg.all;

entity PACE is
  port
  (
    -- clocks and resets
    clkrst_i        : in from_CLKRST_t;
    cpu_clk_en_i    : in std_logic;

    -- hardware variant
    hwsel           : in HWSEL_t;
    palmode         : in std_logic;
    hires           : in std_logic;

    -- misc I/O
    buttons_i       : in from_BUTTONS_t;
    switches_i      : in from_SWITCHES_t;
    leds_o          : out to_LEDS_t;

    -- controller inputs
    inputs_i        : in from_INPUTS_t;

    -- video
    video_i         : in from_VIDEO_t;
    video_o         : out to_VIDEO_t;
    sound_data_o    : out std_logic_vector(7 downto 0);

    -- custom i/o
    -- project_i       : in from_PROJECT_IO_t;
    -- project_o       : out to_PROJECT_IO_t;
    platform_i      : in from_PLATFORM_IO_t;
    platform_o      : out to_PLATFORM_IO_t;

    dl_addr         : in std_logic_vector(11 downto 0);
    dl_data         : in std_logic_vector(7 downto 0);
    dl_wr           : in std_logic;

    cpu_rom_addr    : out std_logic_vector(16 downto 0);
    cpu_rom_do      : in std_logic_vector(7 downto 0);
    gfx1_addr       : out std_logic_vector(17 downto 2);
    gfx1_do         : in std_logic_vector(31 downto 0);
    gfx2_addr       : out std_logic_vector(17 downto 2);
    gfx2_do         : in std_logic_vector(31 downto 0);
    gfx3_addr       : out std_logic_vector(17 downto 2);
    gfx3_do         : in std_logic_vector(31 downto 0)
  );
end entity PACE;

architecture SYN of PACE is

  alias clk_sys         : std_logic is clkrst_i.clk(0);

  signal mapped_inputs    : from_MAPPED_INPUTS_t(0 to PACE_INPUTS_NUM_BYTES-1);

  signal to_tilemap_ctl   : to_TILEMAP_CTL_a(1 to PACE_VIDEO_NUM_TILEMAPS);
  signal from_tilemap_ctl : from_TILEMAP_CTL_a(1 to PACE_VIDEO_NUM_TILEMAPS);

  signal to_bitmap_ctl    : to_BITMAP_CTL_a(1 to PACE_VIDEO_NUM_BITMAPS);
  signal from_bitmap_ctl  : from_BITMAP_CTL_a(1 to PACE_VIDEO_NUM_BITMAPS);

  signal to_sprite_reg    : to_SPRITE_REG_t;
  signal to_sprite_ctl    : to_SPRITE_CTL_t;
  signal to_sprite_ctl2   : to_SPRITE_CTL_t;
  signal from_sprite_ctl  : from_SPRITE_CTL_t;
  signal spr0_hit         : std_logic;
  signal sprite_pri       : std_logic;

  signal to_graphics      : to_GRAPHICS_t;
  signal from_graphics    : from_GRAPHICS_t;
  signal sprite_prom      : prom_a(0 to 31);
  signal sprite_no        : integer range 0 to PACE_VIDEO_NUM_SPRITES-1;
  signal sprite_rgb       : RGB_t;

begin

  inputs_inst : entity work.inputs
    generic map
    (
      NUM_DIPS        => PACE_NUM_SWITCHES,
      NUM_INPUTS      => PACE_INPUTS_NUM_BYTES
    )
    port map
    (
      clk             => clkrst_i.clk(0),
      reset           => clkrst_i.rst(0),
      jamma           => inputs_i.jamma_n,

      dips            => switches_i,
      inputs          => mapped_inputs
    );

  platform_inst : entity work.platform
    generic map
    (
      NUM_INPUT_BYTES => PACE_INPUTS_NUM_BYTES
    )
    port map
    (
      -- clocking and reset
      clkrst_i        => clkrst_i,
      cpu_clk_en_i    => cpu_clk_en_i,

      hwsel           => hwsel,

      -- misc inputs and outputs
      buttons_i       => buttons_i,
      switches_i      => switches_i,
      leds_o          => leds_o,
      sound_data_o    => sound_data_o,
      -- controller inputs
      inputs_i        => mapped_inputs,

      -- graphics
      bitmap_i        => from_bitmap_ctl,
      bitmap_o        => to_bitmap_ctl,
      
      tilemap_i       => from_tilemap_ctl,
      tilemap_o       => to_tilemap_ctl,
      
      sprite_reg_o    => to_sprite_reg,
      sprite_i        => from_sprite_ctl,
      sprite_o        => to_sprite_ctl,
      spr0_hit        => spr0_hit,
      sprite_rgb      => sprite_rgb,
      sprite_pri      => sprite_pri,
      graphics_i      => from_graphics,
      graphics_o      => to_graphics,

      -- custom i/o
--      project_i       => project_i,
--      project_o       => project_o,
      platform_i      => platform_i,
      platform_o      => platform_o,

      dl_addr         => dl_addr,
      dl_data         => dl_data,
      dl_wr           => dl_wr,

      cpu_rom_addr    => cpu_rom_addr,
      cpu_rom_do      => cpu_rom_do,
      gfx1_addr       => gfx1_addr,
      gfx1_do         => gfx1_do,
      gfx2_addr       => gfx2_addr,
      gfx2_do         => gfx2_do,
      gfx3_addr       => gfx3_addr,
      gfx3_do         => gfx3_do
    );

  graphics_inst : entity work.Graphics                                    
    Port Map
    (
      hwsel           => hwsel,
      hires           => hires,
      palmode         => palmode,
      sprite_prom     => sprite_prom,

      bitmap_ctl_i    => to_bitmap_ctl,
      bitmap_ctl_o    => from_bitmap_ctl,

      tilemap_ctl_i   => to_tilemap_ctl,
      tilemap_ctl_o   => from_tilemap_ctl,

      sprite_reg_i    => to_sprite_reg,
      sprite_ctl_i    => to_sprite_ctl,
      sprite_ctl_o    => from_sprite_ctl,
      spr0_hit        => spr0_hit,
      sprite_pri      => sprite_pri,
      sprite_rgb      => sprite_rgb,
      
      graphics_i      => to_graphics,
      graphics_o      => from_graphics,
      -- video (incl. clk)
      video_i           => video_i,
      video_o           => video_o
    );

  process(clk_sys) begin
    if rising_edge(clk_sys) then
      -- 900-91F
      if dl_wr = '1' and dl_addr(11 downto 5) = x"9"&"000" then
        sprite_prom(to_integer(unsigned(dl_addr(4 downto 0)))) <= to_integer(unsigned(dl_data(1 downto 0)));
      end if;
    end if;
  end process;
end SYN;
