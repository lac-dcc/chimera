library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity video_overlay is
   generic  (
      G_VGA_DX          : natural;
      G_VGA_DY          : natural;
      G_FONT_FILE       : string;
      G_FONT_DX         : natural;
      G_FONT_DY         : natural
   );
   port (
      vga_clk_i         : in  std_logic;

      -- VGA input
      vga_ce_i          : in  std_logic;
      vga_red_i         : in  std_logic_vector(7 downto 0);
      vga_green_i       : in  std_logic_vector(7 downto 0);
      vga_blue_i        : in  std_logic_vector(7 downto 0);
      vga_hs_i          : in  std_logic;
      vga_vs_i          : in  std_logic;
      vga_de_i          : in  std_logic;

      -- QNICE
      vga_cfg_scaling_i : in  natural range 0 to 8;
      vga_cfg_shift_i   : in  natural;
      vga_cfg_enable_i  : in  std_logic;
      vga_cfg_r15kHz_i  : in  std_logic;
      vga_cfg_xy_i      : in  std_logic_vector(15 downto 0);
      vga_cfg_dxdy_i    : in  std_logic_vector(15 downto 0);
      vga_vram_addr_o   : out std_logic_vector(15 downto 0);
      vga_vram_data_i   : in  std_logic_vector(15 downto 0);

      -- VGA output
      vga_ce_o          : out std_logic;
      vga_red_o         : out std_logic_vector(7 downto 0);
      vga_green_o       : out std_logic_vector(7 downto 0);
      vga_blue_o        : out std_logic_vector(7 downto 0);
      vga_hs_o          : out std_logic;
      vga_vs_o          : out std_logic;
      vga_de_o          : out std_logic
   );
end entity video_overlay;

architecture synthesis of video_overlay is

   type stage_t is record
      vga_ce      : std_logic;
      vga_pix_x   : std_logic_vector(10 downto 0);
      vga_pix_y   : std_logic_vector(10 downto 0);
      vga_red     : std_logic_vector( 7 downto 0);
      vga_green   : std_logic_vector( 7 downto 0);
      vga_blue    : std_logic_vector( 7 downto 0);
      vga_hs      : std_logic;
      vga_vs      : std_logic;
      vga_de      : std_logic;
      vga_col     : integer range 0 to 2047;
      vga_row     : integer range 0 to 2047;
   end record stage_t;

   signal stage1 : stage_t;
   signal stage2 : stage_t;
   signal stage3 : stage_t;
   signal stage4 : stage_t;
   signal stage5 : stage_t;
   signal stage6 : stage_t;

   signal stage5_vga_osm_on  : std_logic;
   signal stage5_vga_osm_rgb : std_logic_vector(23 downto 0);   -- 23..0 = RGB, 8 bits each

begin

   -----------------------------------------------
   -- Stage 1 : Recover pixel counters
   -----------------------------------------------

   i_vga_recover_counters : entity work.vga_recover_counters
      port map (
         vga_clk_i   => vga_clk_i,
         vga_ce_i    => vga_ce_i,
         vga_red_i   => vga_red_i,
         vga_green_i => vga_green_i,
         vga_blue_i  => vga_blue_i,
         vga_hs_i    => vga_hs_i,
         vga_vs_i    => vga_vs_i,
         vga_de_i    => vga_de_i,
         vga_ce_o    => stage1.vga_ce,
         vga_pix_x_o => stage1.vga_pix_x,
         vga_pix_y_o => stage1.vga_pix_y,
         vga_red_o   => stage1.vga_red,
         vga_green_o => stage1.vga_green,
         vga_blue_o  => stage1.vga_blue,
         vga_hs_o    => stage1.vga_hs,
         vga_vs_o    => stage1.vga_vs,
         vga_de_o    => stage1.vga_de
      ); -- i_vga_recover_counters

   stage1.vga_col <= to_integer(stage1.vga_pix_x) - vga_cfg_shift_i;
   stage1.vga_row <= to_integer(stage1.vga_pix_y) when vga_cfg_r15kHz_i = '0' else
                     to_integer(stage1.vga_pix_y)*2;


   -----------------------------------------------
   -- Instantiate On-Screen-Menu generator
   -----------------------------------------------

   i_vga_osm : entity work.vga_osm
      generic map (
         G_VGA_DX              => G_VGA_DX,
         G_VGA_DY              => G_VGA_DY,
         G_FONT_FILE           => G_FONT_FILE,
         G_FONT_DX             => G_FONT_DX,
         G_FONT_DY             => G_FONT_DY
      )
      port map (
         clk_i                 => vga_clk_i,
         vga_col_i             => stage1.vga_col,
         vga_row_i             => stage1.vga_row,
         vga_osm_cfg_scaling_i => vga_cfg_scaling_i,
         vga_osm_cfg_xy_i      => vga_cfg_xy_i,
         vga_osm_cfg_dxdy_i    => vga_cfg_dxdy_i,
         vga_osm_cfg_enable_i  => vga_cfg_enable_i,
         vga_osm_vram_addr_o   => vga_vram_addr_o,              -- Stage 2
         vga_osm_vram_data_i   => vga_vram_data_i( 7 downto 0), -- Stage 3
         vga_osm_vram_attr_i   => vga_vram_data_i(15 downto 8), -- Stage 3
         vga_osm_on_o          => stage5_vga_osm_on,
         vga_osm_rgb_o         => stage5_vga_osm_rgb
      ); -- i_vga_osm


   -- Clear video output outside visible screen.
   p_stage2 : process (vga_clk_i)
   begin
      if rising_edge(vga_clk_i) then
         stage2 <= stage1;
         if not stage1.vga_de then
            stage2.vga_red   <= (others => '0');
            stage2.vga_blue  <= (others => '0');
            stage2.vga_green <= (others => '0');
         end if;
      end if;
   end process p_stage2;

   -- Delay the video stream to bring it in sync with the OSM overlay.
   p_stage3 : process (vga_clk_i)
   begin
      if rising_edge(vga_clk_i) then
         stage3 <= stage2;
      end if;
   end process p_stage3;

   p_stage4 : process (vga_clk_i)
   begin
      if rising_edge(vga_clk_i) then
         stage4 <= stage3;
      end if;
   end process p_stage4;

   p_stage5 : process (vga_clk_i)
   begin
      if rising_edge(vga_clk_i) then
         stage5 <= stage4;
      end if;
   end process p_stage5;

   p_stage6 : process (vga_clk_i)
   begin
      if rising_edge(vga_clk_i) then
         stage6 <= stage5;

         -- On-Screen Menu overlay
         if stage5_vga_osm_on = '1' then
            stage6.vga_red   <= stage5_vga_osm_rgb(23 downto 16);
            stage6.vga_green <= stage5_vga_osm_rgb(15 downto  8);
            stage6.vga_blue  <= stage5_vga_osm_rgb( 7 downto  0);
         end if;

      end if;
   end process p_stage6;

   vga_hs_o    <= stage6.vga_hs;
   vga_vs_o    <= stage6.vga_vs;
   vga_de_o    <= stage6.vga_de;
   vga_ce_o    <= stage6.vga_ce;
   vga_red_o   <= stage6.vga_red;
   vga_green_o <= stage6.vga_green;
   vga_blue_o  <= stage6.vga_blue;

end architecture synthesis;

