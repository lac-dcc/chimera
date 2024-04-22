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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vid_types.all;

entity video is
  generic(
    COLOR_BITS_R : positive;
    COLOR_BITS_G : positive;
    COLOR_BITS_B : positive;
    ADR_BITS : positive;
    NUM_LAYERS : positive;
    VIDEO_CONFIG : T_VIDEO_CONFIG
  );
  port(
    i_rst : in std_logic;
    i_clk : in std_logic;

    o_read_adr : out std_logic_vector(ADR_BITS-1 downto 0);
    i_read_dat : in std_logic_vector(31 downto 0);

    o_r : out std_logic_vector(COLOR_BITS_R-1 downto 0);
    o_g : out std_logic_vector(COLOR_BITS_G-1 downto 0);
    o_b : out std_logic_vector(COLOR_BITS_B-1 downto 0);

    o_hsync : out std_logic;
    o_vsync : out std_logic;

    o_raster_y : out std_logic_vector(15 downto 0)
  );
end video;

architecture rtl of video is
  -- Should we enable dithering or not?
  function ENABLE_DITHERING return boolean is
  begin
    if (COLOR_BITS_R < 8) and (COLOR_BITS_G < 8) and (COLOR_BITS_B < 8) then
      return true;
    else
      return false;
    end if;
  end;

  -- Number of cycles to delay the sync output signals, due to color pipeline
  -- delays.
  function SYNC_DELAY return integer is
    constant C_PIXEL_DELAY : integer := 6;
    constant C_BLEND_DELAY : integer := 5;
    constant C_DITHER_DELAY : integer := 2;
    variable v_delay : integer;
  begin
    v_delay := C_PIXEL_DELAY;
    if NUM_LAYERS >= 2 then
      v_delay := v_delay + C_BLEND_DELAY;
    end if;
    if ENABLE_DITHERING then
      v_delay := v_delay + C_DITHER_DELAY;
    end if;
    return v_delay;
  end function;

  signal s_raster_x : std_logic_vector(11 downto 0);
  signal s_raster_y : std_logic_vector(11 downto 0);
  signal s_hsync : std_logic;
  signal s_vsync : std_logic;
  signal s_restart_frame : std_logic;

  signal s_layer1_read_en : std_logic;
  signal s_layer1_read_adr : std_logic_vector(23 downto 0);
  signal s_layer1_read_ack : std_logic;
  signal s_layer1_rmode : std_logic_vector(23 downto 0);
  signal s_layer1_color : std_logic_vector(31 downto 0);

  signal s_layer2_read_en : std_logic;
  signal s_layer2_read_adr : std_logic_vector(23 downto 0);
  signal s_layer2_read_ack : std_logic;
  signal s_layer2_rmode : std_logic_vector(23 downto 0);
  signal s_layer2_color : std_logic_vector(31 downto 0);

  signal s_final_color : std_logic_vector(31 downto 0);

  signal s_r8 : std_logic_vector(7 downto 0);
  signal s_g8 : std_logic_vector(7 downto 0);
  signal s_b8 : std_logic_vector(7 downto 0);
  signal s_dither_method : std_logic_vector(1 downto 0);

  signal s_hsync_delayed : std_logic_vector(SYNC_DELAY-1 downto 0);
  signal s_vsync_delayed : std_logic_vector(SYNC_DELAY-1 downto 0);
begin
  -- Instantiate the raster control unit.
  rcu_1: entity work.vid_raster
    generic map (
      VIDEO_CONFIG => VIDEO_CONFIG,
      X_COORD_BITS => s_raster_x'length,
      Y_COORD_BITS => s_raster_y'length
    )
    port map(
      i_rst => i_rst,
      i_clk => i_clk,
      o_x_pos => s_raster_x,
      o_y_pos => s_raster_y,
      o_hsync => s_hsync,
      o_vsync => s_vsync,
      o_restart_frame => s_restart_frame
    );

  -- Instantiate video layer #1 (bottom layer).
  video_layer_1: entity work.video_layer
    generic map (
      X_COORD_BITS => s_raster_x'length,
      Y_COORD_BITS => s_raster_y'length,
      VCP_START_ADDRESS => 24x"000004",
      ENABLE_PIXEL_PREFETCH => (NUM_LAYERS >= 2)
    )
    port map (
      i_rst => i_rst,
      i_clk => i_clk,
      i_restart_frame => s_restart_frame,
      i_raster_x => s_raster_x,
      i_raster_y => s_raster_y,
      o_read_en => s_layer1_read_en,
      o_read_adr => s_layer1_read_adr,
      i_read_ack => s_layer1_read_ack,
      i_read_dat  => i_read_dat,
      o_rmode => s_layer1_rmode,
      o_color => s_layer1_color
    );

  Layer2Gen: if NUM_LAYERS >= 2 generate
  begin
    -- Instantiate video layer #2 (top layer).
    video_layer_2: entity work.video_layer
      generic map (
        X_COORD_BITS => s_raster_x'length,
        Y_COORD_BITS => s_raster_y'length,
        VCP_START_ADDRESS => 24x"000008",
        ENABLE_PIXEL_PREFETCH => false
      )
      port map (
        i_rst => i_rst,
        i_clk => i_clk,
        i_restart_frame => s_restart_frame,
        i_raster_x => s_raster_x,
        i_raster_y => s_raster_y,
        o_read_en => s_layer2_read_en,
        o_read_adr => s_layer2_read_adr,
        i_read_ack => s_layer2_read_ack,
        i_read_dat  => i_read_dat,
        o_rmode => s_layer2_rmode,
        o_color => s_layer2_color
      );

    -- Instantiate the layer blending logic.
    blend1: entity work.vid_blend
      port map (
        i_rst => i_rst,
        i_clk => i_clk,
        i_method => s_layer2_rmode(7 downto 0),
        i_color_1 => s_layer1_color,
        i_color_2 => s_layer2_color,
        o_color => s_final_color
      );
  else generate
    s_layer2_read_en <= '0';
    s_layer2_read_adr <= (others => '0');
    s_final_color <= s_layer1_color;
  end generate;


  --------------------------------------------------------------------------------------------------
  -- VRAM read logic - only one entity may access VRAM during each clock cycle.
  --------------------------------------------------------------------------------------------------

  -- Select the read address (layer 2 has priority over layer 1).
  o_read_adr <= s_layer2_read_adr(ADR_BITS-1 downto 0) when s_layer2_read_en = '1' else
                s_layer1_read_adr(ADR_BITS-1 downto 0);

  -- Respond with an ack to the serviced layer (one cycle after the request).
  process(i_clk, i_rst)
  begin
    if i_rst = '1' then
      s_layer1_read_ack <= '0';
      s_layer2_read_ack <= '0';
    elsif rising_edge(i_clk) then
      s_layer1_read_ack <= s_layer1_read_en and not s_layer2_read_en;
      s_layer2_read_ack <= s_layer2_read_en;
    end if;
  end process;


  --------------------------------------------------------------------------------------------------
  -- Video signal output logic.
  --------------------------------------------------------------------------------------------------

  -- Extract the R, G and B channels from the pixel pipeline output.
  -- The internal color format is ABGR32 (little endian):
  --   |AAAAAAAA|BBBBBBBB|GGGGGGGG|RRRRRRRR|
  s_r8 <= s_final_color(7 downto 0);
  s_g8 <= s_final_color(15 downto 8);
  s_b8 <= s_final_color(23 downto 16);

  -- Use dithering (or not) to generate the final RGB signals.
  DitherGen: if ENABLE_DITHERING generate
  begin
    -- The dither method is controlled via the layer 1 RMODE VCR.
    s_dither_method <= s_layer1_rmode(9 downto 8);

    dither1: entity work.dither
      generic map(
        BITS_R => COLOR_BITS_R,
        BITS_G => COLOR_BITS_G,
        BITS_B => COLOR_BITS_B
      )
      port map (
        i_rst => i_rst,
        i_clk => i_clk,
        i_method => s_dither_method,
        i_r => s_r8,
        i_g => s_g8,
        i_b => s_b8,
        o_r => o_r,
        o_g => o_g,
        o_b => o_b
      );
  else generate
    -- TODO(m): Allow dithering of 1 or 2 components (should not be too common though).
    o_r <= s_r8(7 downto (8-COLOR_BITS_R));
    o_g <= s_g8(7 downto (8-COLOR_BITS_G));
    o_b <= s_b8(7 downto (8-COLOR_BITS_B));
  end generate;

  -- Horizontal and vertical sync signal outputs.
  -- These need to be cycle-delayed in order to be in sync with the color outputs.
  process(i_clk, i_rst)
  begin
    if i_rst = '1' then
      s_hsync_delayed <= (others => '0');
      s_vsync_delayed <= (others => '0');
    elsif rising_edge(i_clk) then
      s_hsync_delayed(0) <= s_hsync;
      s_vsync_delayed(0) <= s_vsync;
      for k in 1 to SYNC_DELAY-1 loop
        s_hsync_delayed(k) <= s_hsync_delayed(k-1);
        s_vsync_delayed(k) <= s_vsync_delayed(k-1);
      end loop;
    end if;
  end process;
  o_hsync <= s_hsync_delayed(SYNC_DELAY-1);
  o_vsync <= s_vsync_delayed(SYNC_DELAY-1);

  -- Extra output signals used for MMIO registers.
  o_raster_y(s_raster_x'left downto 0) <= s_raster_y;
  o_raster_y(15 downto s_raster_y'length) <= (others => s_raster_y(s_raster_y'left));
end rtl;
