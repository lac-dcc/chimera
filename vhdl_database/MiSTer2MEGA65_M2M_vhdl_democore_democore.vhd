------------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework
--
-- Demo core that produces a test image including test sound, so that MiSTer2MEGA65
-- can be synthesized and tested stand alone even before the MiSTer core is being
-- applied. The MEGA65 "Help" menu can be used to change the behavior of the core.
--
-- MiSTer2MEGA65 done by sy2002 and MJoergen in 2021 and licensed under GPL v3
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.video_modes_pkg.all;

entity democore is
   generic (
      G_VIDEO_MODE : video_modes_t := C_PAL_720_576_50
   );
   port (
      clk_main_i           : in  std_logic;
      reset_i              : in  std_logic;
      pause_i              : in  std_logic;
      keyboard_n_i         : in  std_logic_vector(79 downto 0);
      joy_up_n_i           : in  std_logic;
      joy_down_n_i         : in  std_logic;
      joy_left_n_i         : in  std_logic;
      joy_right_n_i        : in  std_logic;
      joy_fire_n_i         : in  std_logic;

      ball_col_rgb_i       : in  std_logic_vector(23 downto 0);
      paddle_speed_i       : in  std_logic_vector(3 downto 0);

      -- Video output
      vga_ce_o             : out std_logic;
      vga_red_o            : out std_logic_vector(7 downto 0);
      vga_green_o          : out std_logic_vector(7 downto 0);
      vga_blue_o           : out std_logic_vector(7 downto 0);
      vga_vs_o             : out std_logic;
      vga_hs_o             : out std_logic;
      vga_hblank_o         : out std_logic;
      vga_vblank_o         : out std_logic;

      -- Audio output (Signed PCM)
      audio_left_o         : out signed(15 downto 0);
      audio_right_o        : out signed(15 downto 0)
   );
end entity democore;

architecture synthesis of democore is

   constant m65_space     : integer := 60;
   constant m65_horz_crsr : integer := 2;   -- means cursor right in C64 terminology
   constant m65_left_crsr : integer := 74;  -- cursor left

   signal ball_pos_x      : std_logic_vector(15 downto 0);
   signal ball_pos_y      : std_logic_vector(15 downto 0);
   signal paddle_pos_x    : std_logic_vector(15 downto 0);
   signal paddle_pos_y    : std_logic_vector(15 downto 0);
   signal update          : std_logic;
   signal score           : std_logic_vector(15 downto 0);
   signal lives           : std_logic_vector( 3 downto 0);

   signal audio_freq      : std_logic_vector(15 downto 0);
   signal audio_vol_left  : std_logic_vector(15 downto 0);
   signal audio_vol_right : std_logic_vector(15 downto 0);

begin

   i_democore_game : entity work.democore_game
      generic  map (
         G_VGA_DX => G_VIDEO_MODE.H_PIXELS,
         G_VGA_DY => G_VIDEO_MODE.V_PIXELS
      )
      port map (
         clk_i          => clk_main_i,
         rst_i          => reset_i,
         paddle_speed_i => paddle_speed_i,
         update_i       => update,
         player_start_i => not (keyboard_n_i(m65_space)     and joy_fire_n_i),
         player_left_i  => not (keyboard_n_i(m65_left_crsr) and joy_left_n_i),
         player_right_i => not (keyboard_n_i(m65_horz_crsr) and joy_right_n_i),
         ball_pos_x_o   => ball_pos_x,
         ball_pos_y_o   => ball_pos_y,
         paddle_pos_x_o => paddle_pos_x,
         paddle_pos_y_o => paddle_pos_y,
         score_o        => score,
         lives_o        => lives
      ); -- i_democore_game

   i_democore_video : entity work.democore_video
      generic map (
         G_VIDEO_MODE => G_VIDEO_MODE
      )
      port map (
         clk_main_i     => clk_main_i,
         reset_i        => reset_i,
         ball_col_rgb_i => ball_col_rgb_i,
         ball_pos_x_i   => ball_pos_x,
         ball_pos_y_i   => ball_pos_y,
         paddle_pos_x_i => paddle_pos_x,
         paddle_pos_y_i => paddle_pos_y,
         score_i        => score,
         lives_i        => lives,
         update_o       => update,
         vga_ce_o       => vga_ce_o,
         vga_red_o      => vga_red_o,
         vga_green_o    => vga_green_o,
         vga_blue_o     => vga_blue_o,
         vga_vs_o       => vga_vs_o,
         vga_hs_o       => vga_hs_o,
         vga_hblank_o   => vga_hblank_o,
         vga_vblank_o   => vga_vblank_o
      ); -- i_democore_video

   audio_freq      <= std_logic_vector(unsigned(ball_pos_y) + G_VIDEO_MODE.V_PIXELS);
   audio_vol_left  <= std_logic_vector(G_VIDEO_MODE.H_PIXELS - unsigned(ball_pos_x));
   audio_vol_right <= std_logic_vector(unsigned(ball_pos_x));

   i_democore_audio : entity work.democore_audio
      generic map (
         G_CLOCK_FREQ_HZ => G_VIDEO_MODE.CLK_KHZ * 1000
      )
      port map (
         clk_i         => clk_main_i,
         rst_i         => reset_i,
         freq_i        => audio_freq,
         vol_left_i    => audio_vol_left,
         vol_right_i   => audio_vol_right,
         audio_left_o  => audio_left_o,
         audio_right_o => audio_right_o
      ); -- i_democore_audio

end architecture synthesis;

