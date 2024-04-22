----------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework
--
-- A generic frame_buffer.
--
-- MiSTer2MEGA65 done by sy2002 and MJoergen in 2022 and licensed under GPL v3
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.video_modes_pkg.all;

entity frame_buffer is
   generic (
      G_ADDR_WIDTH : natural;
      G_H_LEFT     : natural;
      G_H_RIGHT    : natural;
      G_VIDEO_MODE : video_modes_t
   );
   port (
      ddram_clk_i      : in  std_logic;
      ddram_addr_i     : in  std_logic_vector(G_ADDR_WIDTH-1 downto 0);
      ddram_din_i      : in  std_logic_vector(31 downto 0); -- 0RGB
      ddram_we_i       : in  std_logic;

      -- Video output
      video_clk_i      : in  std_logic;
      video_ce_i       : in  std_logic;
      video_red_o      : out std_logic_vector(7 downto 0);
      video_green_o    : out std_logic_vector(7 downto 0);
      video_blue_o     : out std_logic_vector(7 downto 0);
      video_vs_o       : out std_logic;
      video_hs_o       : out std_logic;
      video_hblank_o   : out std_logic;
      video_vblank_o   : out std_logic
   );
end entity frame_buffer;

architecture synthesis of frame_buffer is

   signal video_hs        : std_logic;
   signal video_vs        : std_logic;
   signal video_hblank    : std_logic;
   signal video_vblank    : std_logic;
   signal video_pixel_x   : integer range 0 to G_VIDEO_MODE.H_PIXELS - 1;
   signal video_pixel_y   : integer range 0 to G_VIDEO_MODE.V_PIXELS - 1;
   signal video_addr      : std_logic_vector(G_ADDR_WIDTH-1 downto 0);

   signal video_hs_d      : std_logic;
   signal video_vs_d      : std_logic;
   signal video_hblank_d  : std_logic;
   signal video_vblank_d  : std_logic;
   signal video_pixel_x_d : integer range 0 to G_VIDEO_MODE.H_PIXELS - 1;
   signal video_pixel_y_d : integer range 0 to G_VIDEO_MODE.V_PIXELS - 1;
   signal video_data_d    : std_logic_vector(31 downto 0);

begin

   i_tdp_ram : entity work.tdp_ram
      generic map (
         ADDR_WIDTH   => G_ADDR_WIDTH,
         DATA_WIDTH   => 32,
         ROM_PRELOAD  => false,
         ROM_FILE     => "",
         ROM_FILE_HEX => false
      )
      port map (
         clock_a   => ddram_clk_i,
         clen_a    => '1',
         address_a => ddram_addr_i,
         data_a    => ddram_din_i,
         wren_a    => ddram_we_i,
         q_a       => open,

         clock_b   => video_clk_i,
         clen_b    => video_ce_i,
         address_b => video_addr,
         data_b    => (others => '0'),
         wren_b    => '0',
         q_b       => video_data_d
      ); -- i_tdp_ram

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
         clk_i     => video_clk_i,
         ce_i      => video_ce_i,
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

   video_addr <= std_logic_vector(to_unsigned(video_pixel_y * (G_H_RIGHT - G_H_LEFT) + video_pixel_x - G_H_LEFT, G_ADDR_WIDTH));

   -- Store signals for one clock cycle due to BRAM read latency
   p_read : process (video_clk_i)
   begin
      if rising_edge(video_clk_i) then
         if video_ce_i = '1' then
            video_hs_d      <= video_hs;
            video_vs_d      <= video_vs;
            video_hblank_d  <= video_hblank;
            video_vblank_d  <= video_vblank;
            video_pixel_x_d <= video_pixel_x;
            video_pixel_y_d <= video_pixel_y;
         end if;
      end if;
   end process p_read;

   p_rgb : process (video_clk_i)
   begin
      if rising_edge(video_clk_i) then
         if video_ce_i = '1' then
            video_blue_o   <= video_data_d(23 downto 16);
            video_green_o  <= video_data_d(15 downto  8);
            video_red_o    <= video_data_d( 7 downto  0);
            video_hs_o     <= video_hs_d;
            video_vs_o     <= video_vs_d;
            video_hblank_o <= video_hblank_d;
            video_vblank_o <= video_vblank_d;

            -- Screen blanking outside visible area
            if video_hblank_d = '1' or video_vblank_d = '1' or
               video_pixel_x_d < G_H_LEFT or video_pixel_x_d >= G_H_RIGHT then
               video_red_o   <= (others => '0');
               video_green_o <= (others => '0');
               video_blue_o  <= (others => '0');
            end if;
         end if;
      end if;
   end process p_rgb;

end architecture synthesis;

