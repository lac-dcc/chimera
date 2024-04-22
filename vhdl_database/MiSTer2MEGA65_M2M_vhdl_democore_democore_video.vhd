library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.video_modes_pkg.all;

entity democore_video is
   generic (
      G_VIDEO_MODE : video_modes_t
   );
   port (
      clk_main_i     : in  std_logic;
      reset_i        : in  std_logic;

      -- Ball's RGB color value
      ball_col_rgb_i : in  std_logic_vector(23 downto 0);

      -- Game input
      ball_pos_x_i   : in  std_logic_vector(15 downto 0);
      ball_pos_y_i   : in  std_logic_vector(15 downto 0);
      paddle_pos_x_i : in  std_logic_vector(15 downto 0);
      paddle_pos_y_i : in  std_logic_vector(15 downto 0);
      score_i        : in  std_logic_vector(15 downto 0);
      lives_i        : in  std_logic_vector(3 downto 0);

      update_o       : out std_logic;

      -- Video output
      vga_ce_o       : out std_logic;
      vga_red_o      : out std_logic_vector(7 downto 0);
      vga_green_o    : out std_logic_vector(7 downto 0);
      vga_blue_o     : out std_logic_vector(7 downto 0);
      vga_vs_o       : out std_logic;
      vga_hs_o       : out std_logic;
      vga_hblank_o   : out std_logic;
      vga_vblank_o   : out std_logic
   );
end entity democore_video;

architecture synthesis of democore_video is

   constant C_BORDER         : integer :=   4; -- Number of pixels
   constant C_SIZE_BALL      : integer :=  20; -- Number of pixels
   constant C_SIZE_PADDLE    : integer := 100; -- Number of pixels
   constant C_COL_LIGHT      : std_logic_vector(23 downto 0) := X"88CCAA";
   constant C_COL_DARK       : std_logic_vector(23 downto 0) := X"557766";
   constant C_COL_BORDER     : std_logic_vector(23 downto 0) := X"FFFFFF";
   constant C_COL_PADDLE     : std_logic_vector(23 downto 0) := X"40EE20";
   constant C_COL_LIVES      : std_logic_vector(23 downto 0) := X"EE40C0";
   constant C_COL_BLANK      : std_logic_vector(23 downto 0) := X"000000";
   constant C_POS_LIVES_X    : natural := 100;
   constant C_POS_LIVES_Y    : natural := 100;

   type bitmap_vector_t is array (natural range <>) of std_logic_vector(63 downto 0);

   constant bitmaps : bitmap_vector_t := (
      -- Space
      "00000000" &
      "00000000" &
      "00000000" &
      "00000000" &
      "00000000" &
      "00000000" &
      "00000000" &
      "00000000",

      -- Heart
      "01101100" &
      "11101110" &
      "11111110" &
      "01111100" &
      "00111000" &
      "00111000" &
      "00010000" &
      "00000000",

      -- Digit 0
      "01111100" &
      "11000110" &
      "11001110" &
      "11011110" &
      "11110110" &
      "11100110" &
      "01111100" &
      "00000000",

      -- Digit 1
      "00110000" &
      "01110000" &
      "00110000" &
      "00110000" &
      "00110000" &
      "00110000" &
      "11111100" &
      "00000000");

   signal offset         : integer range 0 to 63;  -- Checkerboard horizontal offset

   signal lives_offset_x : integer range 0 to G_VIDEO_MODE.H_PIXELS - 1;
   signal lives_offset_y : integer range 0 to G_VIDEO_MODE.V_PIXELS - 1;
   signal lives_bitmap   : std_logic_vector(63 downto 0);
   signal lives_index    : integer range 0 to 63;
   signal lives_pix      : std_logic;

   signal video_ce       : std_logic;
   signal video_hs       : std_logic;
   signal video_vs       : std_logic;
   signal video_hblank   : std_logic;
   signal video_vblank   : std_logic;
   signal video_pixel_x  : integer range 0 to G_VIDEO_MODE.H_PIXELS - 1;
   signal video_pixel_y  : integer range 0 to G_VIDEO_MODE.V_PIXELS - 1;
   signal video_rgb      : std_logic_vector(23 downto 0);

begin

   p_ce : process (clk_main_i)
   begin
      if rising_edge(clk_main_i) then
         video_ce <= not video_ce;
      end if;
   end process p_ce;

   i_vga_controller : entity work.vga_controller
      port map (
         h_pulse   => G_VIDEO_MODE.H_PULSE,
         h_bp      => G_VIDEO_MODE.H_BP,
         h_pixels  => G_VIDEO_MODE.H_PIXELS,
         h_fp      => G_VIDEO_MODE.H_FP,
         h_pol     => '1',
         v_pulse   => G_VIDEO_MODE.V_PULSE,
         v_bp      => G_VIDEO_MODE.V_BP,
         v_pixels  => G_VIDEO_MODE.V_PIXELS,
         v_fp      => G_VIDEO_MODE.V_FP,
         v_pol     => '1',
         clk_i     => clk_main_i,
         ce_i      => video_ce,
         reset_n   => '1',
         h_sync    => video_hs,
         v_sync    => video_vs,
         h_blank   => video_hblank,
         v_blank   => video_vblank,
         column    => video_pixel_x,
         row       => video_pixel_y,
         n_blank   => open,
         n_sync    => open
      ); -- i_vga_controller

   lives_offset_x <= video_pixel_x - C_POS_LIVES_X;
   lives_offset_y <= video_pixel_y - C_POS_LIVES_Y;
   lives_bitmap   <= bitmaps(1) when lives_i(3-lives_offset_x/16) = '1' else bitmaps(0);
   lives_index    <= (7-lives_offset_y/2)*8 + 7-(lives_offset_x/2 mod 8);
   lives_pix      <= lives_bitmap(lives_index);

   p_rgb : process (clk_main_i)
   begin
      if rising_edge(clk_main_i) then
         if update_o = '1' then
            offset <= offset - 1;
         end if;

         -- Render moving checkerboard background
         if (((video_pixel_x+offset)/32) mod 2) = ((video_pixel_y/32) mod 2) then
            video_rgb <= C_COL_LIGHT;
         else
            video_rgb <= C_COL_DARK;
         end if;

         -- Render white border
         if video_pixel_x < C_BORDER or video_pixel_x + C_BORDER >= G_VIDEO_MODE.H_PIXELS or
            video_pixel_y < C_BORDER or video_pixel_y + C_BORDER >= G_VIDEO_MODE.V_PIXELS then
               video_rgb <= C_COL_BORDER;
         end if;

         -- Render red-ish square
         if video_pixel_x >= to_integer(unsigned(ball_pos_x_i)) and video_pixel_x < to_integer(unsigned(ball_pos_x_i)) + C_SIZE_BALL and
            video_pixel_y >= to_integer(unsigned(ball_pos_y_i)) and video_pixel_y < to_integer(unsigned(ball_pos_y_i)) + C_SIZE_BALL then
               video_rgb <= ball_col_rgb_i;
         end if;

         -- Render green-ish paddle
         if video_pixel_x >= to_integer(unsigned(paddle_pos_x_i)) and video_pixel_x < to_integer(unsigned(paddle_pos_x_i)) + C_SIZE_PADDLE and
            video_pixel_y >= to_integer(unsigned(paddle_pos_y_i)) and video_pixel_y < to_integer(unsigned(paddle_pos_y_i)) + C_SIZE_BALL then
               video_rgb <= C_COL_PADDLE;
         end if;

         -- Render lives purple-ish
         if video_pixel_x >= C_POS_LIVES_X and video_pixel_x < C_POS_LIVES_X+4*16 and
            video_pixel_y >= C_POS_LIVES_Y and video_pixel_y < C_POS_LIVES_Y+16 and
            lives_pix = '1' then
               video_rgb <= C_COL_LIVES;
         end if;

         -- Screen blanking outside visible area
         if video_hblank = '1' or video_vblank = '1' then
            video_rgb <= C_COL_BLANK;
         end if;

         vga_hs_o <= video_hs;
         vga_vs_o <= video_vs;
         vga_hblank_o <= video_hblank;
         vga_vblank_o <= video_vblank;
      end if;
   end process p_rgb;

   vga_ce_o    <= video_ce;
   vga_red_o   <= video_rgb(23 downto 16);
   vga_green_o <= video_rgb(15 downto  8);
   vga_blue_o  <= video_rgb( 7 downto  0);

   update_o <= video_ce when video_pixel_x = 0 and video_pixel_y = 0 else '0';

end architecture synthesis;

