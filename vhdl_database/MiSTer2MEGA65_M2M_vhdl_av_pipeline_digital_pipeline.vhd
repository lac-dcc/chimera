----------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework
--
-- Complete pipeline processing of digital audio and video output
--
-- MiSTer2MEGA65 done by sy2002 and MJoergen in 2022 and licensed under GPL v3
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.types_pkg.all;
use work.video_modes_pkg.all;
use work.qnice_tools.all;

library xpm;
use xpm.vcomponents.all;

entity digital_pipeline is
   generic (
      G_VIDEO_MODE_VECTOR    : video_modes_vector;   -- Desired video format of HDMI output.
      G_VGA_DX               : natural;              -- Actual format of video from Core (in pixels).
      G_VGA_DY               : natural;
      G_FONT_FILE            : string;
      G_FONT_DX              : natural;
      G_FONT_DY              : natural
   );
   port (
      -- Input from Core (video and audio)
      video_clk_i              : in  std_logic;
      video_rst_i              : in  std_logic;
      video_ce_i               : in  std_logic;
      video_red_i              : in  std_logic_vector(7 downto 0);
      video_green_i            : in  std_logic_vector(7 downto 0);
      video_blue_i             : in  std_logic_vector(7 downto 0);
      video_hs_i               : in  std_logic;
      video_vs_i               : in  std_logic;
      video_hblank_i           : in  std_logic;
      video_vblank_i           : in  std_logic;
      audio_clk_i              : in  std_logic;  -- 30 MHz
      audio_rst_i              : in  std_logic;
      audio_left_i             : in  signed(15 downto 0); -- Signed PCM format
      audio_right_i            : in  signed(15 downto 0); -- Signed PCM format

      -- Digital output (HDMI)
      hdmi_clk_i               : in  std_logic;
      hdmi_rst_i               : in  std_logic;
      tmds_clk_i               : in  std_logic;
      tmds_data_p_o            : out std_logic_vector(2 downto 0);
      tmds_data_n_o            : out std_logic_vector(2 downto 0);
      tmds_clk_p_o             : out std_logic;
      tmds_clk_n_o             : out std_logic;

      -- Connect to QNICE and Video RAM
      hdmi_dvi_i               : in  std_logic;
      hdmi_video_mode_i        : in  natural range 0 to 3;
      hdmi_crop_mode_i         : in  std_logic;
      hdmi_osm_cfg_scaling_i   : in  natural range 0 to 8;
      hdmi_osm_cfg_enable_i    : in  std_logic;
      hdmi_osm_cfg_xy_i        : in  std_logic_vector(15 downto 0);
      hdmi_osm_cfg_dxdy_i      : in  std_logic_vector(15 downto 0);
      hdmi_osm_vram_addr_o     : out std_logic_vector(15 downto 0);
      hdmi_osm_vram_data_i     : in  std_logic_vector(15 downto 0);
      sys_info_hdmi_o          : out std_logic_vector(47 downto 0);
      video_hdmax_o            : out natural range 0 to 4095;
      video_vdmax_o            : out natural range 0 to 4095;

      -- QNICE connection to ascal's mode register
      qnice_ascal_mode_i       : in  unsigned(4 downto 0);

      -- QNICE device for interacting with the Polyphase filter coefficients
      qnice_poly_clk_i         : in  std_logic;
      qnice_poly_dw_i          : in  unsigned(9 downto 0);
      qnice_poly_a_i           : in  unsigned(6+3 downto 0);    -- FRAC+3 downto 0, if we change FRAC below, we need to change quite some code, also in the M2M Firmware
      qnice_poly_wr_i          : in  std_logic;

      -- Connect to HyperRAM controller
      hr_clk_i                 : in  std_logic;
      hr_rst_i                 : in  std_logic;
      hr_write_o               : out std_logic;
      hr_read_o                : out std_logic;
      hr_address_o             : out std_logic_vector(31 downto 0);
      hr_writedata_o           : out std_logic_vector(15 downto 0);
      hr_byteenable_o          : out std_logic_vector( 1 downto 0);
      hr_burstcount_o          : out std_logic_vector( 7 downto 0);
      hr_readdata_i            : in  std_logic_vector(15 downto 0);
      hr_readdatavalid_i       : in  std_logic;
      hr_waitrequest_i         : in  std_logic
   );
end entity digital_pipeline;

architecture synthesis of digital_pipeline is

   -- HDMI PCM sampling rate hardcoded to 48 kHz (should be the most compatible mode)
   -- If this should ever be switchable, don't forget that the signal "select_44100" in
   -- i_vga_to_hdmi would need to be adjusted, too
   constant HDMI_PCM_SAMPLING    : natural := 48_000;

   constant AUDIO_PCM_ACR_CNT_RANGE : integer := HDMI_PCM_SAMPLING / 1000;

   signal audio_pcm_clken           : std_logic;                     -- 48 kHz (via clock divider)
   signal audio_pcm_acr             : std_logic;                     -- HDMI ACR packet strobe (frequency = 128fs/N e.g. 1kHz)
   signal audio_pcm_n               : std_logic_vector(19 downto 0); -- HDMI ACR N value
   signal audio_pcm_cts             : std_logic_vector(19 downto 0); -- HDMI ACR CTS value
   signal audio_pcm_audio_counter   : integer := 0;
   signal audio_pcm_acr_counter     : integer range 0 to AUDIO_PCM_ACR_CNT_RANGE := 0;

   signal vs_hsync               : std_logic;
   signal vs_vsync               : std_logic;
   signal vs_hblank              : std_logic;
   signal vs_vblank              : std_logic;

   signal reset_na               : std_logic;            -- Asynchronous reset, active low

   signal hdmi_tmds              : slv_9_0_t(0 to 2);    -- parallel TMDS symbol stream x 3 channels
   signal hdmi_video_mode        : video_modes_t;

   constant C_AVM_ADDRESS_SIZE   : integer := 19;
   constant C_AVM_DATA_SIZE      : integer := 128;
   signal hdmi_htotal            : integer;
   signal hdmi_hsstart           : integer;
   signal hdmi_hsend             : integer;
   signal hdmi_hdisp             : integer;
   signal hdmi_vtotal            : integer;
   signal hdmi_vsstart           : integer;
   signal hdmi_vsend             : integer;
   signal hdmi_vdisp             : integer;
   signal hdmi_shift             : integer;

   -- Auto-calculate display dimensions based on an 4:3 aspect ratio
   signal hdmi_hmin              : integer;
   signal hdmi_hmax              : integer;
   signal hdmi_vmin              : integer;
   signal hdmi_vmax              : integer;

   -- After video_rescaler
   signal hdmi_red               : unsigned(7 downto 0);
   signal hdmi_green             : unsigned(7 downto 0);
   signal hdmi_blue              : unsigned(7 downto 0);
   signal hdmi_hs                : std_logic;
   signal hdmi_vs                : std_logic;
   signal hdmi_de                : std_logic;

   -- After OSM
   signal hdmi_osm_red           : std_logic_vector(7 downto 0);
   signal hdmi_osm_green         : std_logic_vector(7 downto 0);
   signal hdmi_osm_blue          : std_logic_vector(7 downto 0);
   signal hdmi_osm_hs            : std_logic;
   signal hdmi_osm_vs            : std_logic;
   signal hdmi_osm_de            : std_logic;

   signal hr_wide_write          : std_logic;
   signal hr_wide_read           : std_logic;
   signal hr_wide_address        : std_logic_vector(C_AVM_ADDRESS_SIZE-1 downto 0);
   signal hr_wide_writedata      : std_logic_vector(C_AVM_DATA_SIZE-1 downto 0);
   signal hr_wide_byteenable     : std_logic_vector(C_AVM_DATA_SIZE/8-1 downto 0);
   signal hr_wide_burstcount     : std_logic_vector(7 downto 0);
   signal hr_wide_readdata       : std_logic_vector(C_AVM_DATA_SIZE-1 downto 0);
   signal hr_wide_readdatavalid  : std_logic;
   signal hr_wide_waitrequest    : std_logic;

begin

   -- SYS_DXDY
   sys_info_hdmi_o(15 downto 0) <=
      std_logic_vector(to_unsigned((G_VGA_DX/G_FONT_DX) * 256 + (G_VGA_DY/G_FONT_DY), 16));

   -- SHELL_M_XY
   sys_info_hdmi_o(31 downto  16) <=
      X"0000";

   -- SHELL_M_DXDY
   sys_info_hdmi_o(47 downto 32) <=
      std_logic_vector(to_unsigned((G_VGA_DX/G_FONT_DX) * 256 + (G_VGA_DY/G_FONT_DY), 16));

   hdmi_video_mode <= G_VIDEO_MODE_VECTOR(hdmi_video_mode_i);
   hdmi_htotal     <= hdmi_video_mode.H_PIXELS + hdmi_video_mode.H_FP + hdmi_video_mode.H_PULSE + hdmi_video_mode.H_BP;
   hdmi_hsstart    <= hdmi_video_mode.H_PIXELS + hdmi_video_mode.H_FP;
   hdmi_hsend      <= hdmi_video_mode.H_PIXELS + hdmi_video_mode.H_FP + hdmi_video_mode.H_PULSE;
   hdmi_hdisp      <= hdmi_video_mode.H_PIXELS;
   hdmi_vtotal     <= hdmi_video_mode.V_PIXELS + hdmi_video_mode.V_FP + hdmi_video_mode.V_PULSE + hdmi_video_mode.V_BP;
   hdmi_vsstart    <= hdmi_video_mode.V_PIXELS + hdmi_video_mode.V_FP;
   hdmi_vsend      <= hdmi_video_mode.V_PIXELS + hdmi_video_mode.V_FP + hdmi_video_mode.V_PULSE;
   hdmi_vdisp      <= hdmi_video_mode.V_PIXELS;

   assert G_VIDEO_MODE_VECTOR(0).H_PIXELS >= G_VIDEO_MODE_VECTOR(0).V_PIXELS*4/3;
   assert G_VIDEO_MODE_VECTOR(1).H_PIXELS >= G_VIDEO_MODE_VECTOR(1).V_PIXELS*4/3;
   assert G_VIDEO_MODE_VECTOR(2).H_PIXELS <= G_VIDEO_MODE_VECTOR(2).V_PIXELS*4/3;
   assert G_VIDEO_MODE_VECTOR(3).H_PIXELS <= G_VIDEO_MODE_VECTOR(3).V_PIXELS*4/3;

   -- In HDMI 4:3 mode, ignore crop (zoom-in).
   -- We are using constants here to avoid that large networks are synthesized.
   hdmi_hmin <= 0                                                                         when hdmi_crop_mode_i = '1' else
                (G_VIDEO_MODE_VECTOR(0).H_PIXELS-G_VIDEO_MODE_VECTOR(0).V_PIXELS*4/3)/2   when hdmi_video_mode_i = 0 else
                (G_VIDEO_MODE_VECTOR(1).H_PIXELS-G_VIDEO_MODE_VECTOR(1).V_PIXELS*4/3)/2   when hdmi_video_mode_i = 1 else
                0                                                                         when hdmi_video_mode_i = 2 else
                0                                                                         when hdmi_video_mode_i = 3 else
                0;

   hdmi_hmax <= hdmi_video_mode.H_PIXELS-1                                                when hdmi_crop_mode_i = '1' else
                (G_VIDEO_MODE_VECTOR(0).H_PIXELS+G_VIDEO_MODE_VECTOR(0).V_PIXELS*4/3)/2-1 when hdmi_video_mode_i = 0 else
                (G_VIDEO_MODE_VECTOR(1).H_PIXELS+G_VIDEO_MODE_VECTOR(1).V_PIXELS*4/3)/2-1 when hdmi_video_mode_i = 1 else
                hdmi_video_mode.H_PIXELS-1                                                when hdmi_video_mode_i = 2 else
                hdmi_video_mode.H_PIXELS-1                                                when hdmi_video_mode_i = 3 else
                0;

   hdmi_vmin <= 0                                                                         when hdmi_crop_mode_i = '1' else
                0                                                                         when hdmi_video_mode_i = 0 else
                0                                                                         when hdmi_video_mode_i = 1 else
                0                                                                         when hdmi_video_mode_i = 2 else
                (G_VIDEO_MODE_VECTOR(3).V_PIXELS-G_VIDEO_MODE_VECTOR(3).H_PIXELS*3/4)/2   when hdmi_video_mode_i = 3 else
                0;

   hdmi_vmax <= hdmi_video_mode.V_PIXELS-1                                                when hdmi_crop_mode_i = '1' else
                hdmi_video_mode.V_PIXELS-1                                                when hdmi_video_mode_i = 0 else
                hdmi_video_mode.V_PIXELS-1                                                when hdmi_video_mode_i = 1 else
                hdmi_video_mode.V_PIXELS-1                                                when hdmi_video_mode_i = 2 else
                (G_VIDEO_MODE_VECTOR(3).V_PIXELS+G_VIDEO_MODE_VECTOR(3).H_PIXELS*3/4)/2   when hdmi_video_mode_i = 3 else
                hdmi_video_mode.V_PIXELS-1;

   -- Deprecated. Will be removed in future release
   -- The purpose is to right-shift the position of the OSM
   -- on the HDMI output. This will be removed when the
   -- M2M framework supports two different OSM VRAMs.
   hdmi_shift <= hdmi_video_mode.H_PIXELS - integer(G_VGA_DX);

   ---------------------------------------------------------------------------------------------
   -- Digital output (HDMI) - Audio part
   ---------------------------------------------------------------------------------------------

   -- Generate PCM sample rate (48 kHz)
   i_clk_synthetic_enable : entity work.clk_synthetic_enable
      port map (
         clk_i       => audio_clk_i,
         src_speed_i => 30_000_000,
         dst_speed_i => HDMI_PCM_SAMPLING,
         enable_o    => audio_pcm_clken
      ); -- i_clk_synthetic_enable

   -- N and CTS values for HDMI Audio Clock Regeneration.
   -- depends on pixel clock and audio sample rate
   audio_pcm_n   <= std_logic_vector(to_unsigned((HDMI_PCM_SAMPLING * 128) / 1000, audio_pcm_n'length)); -- 6144 is correct according to HDMI spec.
   audio_pcm_cts <= std_logic_vector(to_unsigned(hdmi_video_mode.CLK_KHZ, audio_pcm_cts'length));

   -- ACR packet rate should be 128fs/N = 1kHz
   p_pcm_acr : process (audio_clk_i)
   begin
      if rising_edge(audio_clk_i) then
         if audio_pcm_clken = '1' then
            -- Generate 1KHz ACR pulse train from 48 kHz
            if audio_pcm_acr_counter /= (AUDIO_PCM_ACR_CNT_RANGE - 1) then
               audio_pcm_acr_counter <= audio_pcm_acr_counter + 1;
               audio_pcm_acr <= '0';
            else
               audio_pcm_acr <= '1';
               audio_pcm_acr_counter <= 0;
            end if;
         end if;
      end if;
   end process p_pcm_acr;

   ---------------------------------------------------------------------------------------------
   -- Digital output (HDMI) - Video part
   ---------------------------------------------------------------------------------------------

   reset_na <= not (video_rst_i or hdmi_rst_i or hr_rst_i);

   i_ascal : entity work.ascal
      generic map (
         MASK      => x"ff",
         RAMBASE   => (others => '0'),

         -- ascal needs an input buffer according to this formula: dx * dy * 3 bytes (RGB) per pixel and then rounded up
         -- to the next power of two
         RAMSIZE   => to_unsigned(2**f_log2(G_VGA_DX * G_VGA_DY * 3), 32),

         INTER     => false,        -- Not needed: Progressive input only
         HEADER    => false,        -- Not needed: Used on MiSTer to read the sampled image back from the ARM side to do screenshots. The header provides informations such as image size.
         DOWNSCALE => false,        -- Not needed: We use ascal only to upscale
         DOWNSCALE_NN => true,      -- Not needed: true = remove logic
         BYTESWAP  => true,
         ADAPTIVE  => true,         -- Needed for advanced scanlines emulation in polyphase mode
         PALETTE   => false,        -- Not needed: Only useful for the framebuffer mode, where the scaler is used to upscale a framebuffer in RAM, without using the scaler input.
         PALETTE2  => false,        -- Not needed: Same, for framebuffer 256 colours mode.
         FRAC      => 6,            -- 2^value subpixels; MiSTer starts to settle on FRAC => 8, but this older version of ascal does not seem to support 8 (at C64 still at 6)
         OHRES     => 2048,         -- Maximum horizontal output resolution. (There is no parameter for vertical resolution.)
         IHRES     => 1024,         -- Maximum horizontal input resolution. (Also here no parameter for vertical.)
         N_DW      => C_AVM_DATA_SIZE,
         N_AW      => C_AVM_ADDRESS_SIZE,
         N_BURST   => 256           -- 256 bytes per burst
      )
      port map (
         -- Input video
         i_r               => unsigned(video_red_i),        -- input
         i_g               => unsigned(video_green_i),      -- input
         i_b               => unsigned(video_blue_i),       -- input
         i_hs              => video_hs_i,                   -- input
         i_vs              => video_vs_i,                   -- input
         i_fl              => '0',                          -- input
         i_de              => not (video_hblank_i or video_vblank_i), -- input
         i_ce              => video_ce_i,                   -- input
         i_clk             => video_clk_i,                  -- input

         -- Output video
         o_r               => hdmi_red,                     -- output
         o_g               => hdmi_green,                   -- output
         o_b               => hdmi_blue,                    -- output
         o_hs              => hdmi_hs,                      -- output
         o_vs              => hdmi_vs,                      -- output
         o_de              => hdmi_de,                      -- output
         o_vbl             => open,                         -- output
         o_ce              => '1',                          -- input
         o_clk             => hdmi_clk_i,                   -- input

         -- Border colour R G B
         o_border          => X"000000",                    -- input

         -- Framebuffer mode
         o_fb_ena          => '0',                          -- input: do not use framebuffer mode
         o_fb_hsize        => 0,                            -- input
         o_fb_vsize        => 0,                            -- input
         o_fb_format       => "000101",                     -- input: 101=24bpp: 8-bit for R, G and B
         o_fb_base         => x"0000_0000",                 -- input
         o_fb_stride       => (others => '0'),              -- input

         -- Framebuffer palette in 8bpp mode
         pal1_clk          => '0',                          -- input
         pal1_dw           => x"000000000000",              -- input
         pal1_dr           => open,                         -- output
         pal1_a            => "0000000",                    -- input
         pal1_wr           => '0',                          -- input
         pal_n             => '0',                          -- input

         pal2_clk          => '0',                          -- input
         pal2_dw           => x"000000",                    -- input
         pal2_dr           => open,                         -- output
         pal2_a            => "00000000",                   -- input
         pal2_wr           => '0',                          -- input

         -- Low lag PLL tuning
         o_lltune          => open,                         -- output

         -- Input video parameters
         iauto             => '1',                          -- input
         himin             => 0,                            -- input
         himax             => 0,                            -- input
         vimin             => 0,                            -- input
         vimax             => 0,                            -- input

         -- Detected input image size
         i_hdmax           => video_hdmax_o,                -- output
         i_vdmax           => video_vdmax_o,                -- output

         -- Output video parameters
         run               => '1',                          -- input
         freeze            => '0',                          -- input
         mode              => qnice_ascal_mode_i,           -- input

         -- SYNC  |_________________________/"""""""""\_______|
         -- DE    |""""""""""""""""""\________________________|
         -- RGB   |    <#IMAGE#>      ^HDISP                  |
         --            ^HMIN   ^HMAX        ^HSSTART  ^HSEND  ^HTOTAL
         htotal            => hdmi_htotal,                  -- input
         hsstart           => hdmi_hsstart,                 -- input
         hsend             => hdmi_hsend,                   -- input
         hdisp             => hdmi_hdisp,                   -- input
         vtotal            => hdmi_vtotal,                  -- input
         vsstart           => hdmi_vsstart,                 -- input
         vsend             => hdmi_vsend,                   -- input
         vdisp             => hdmi_vdisp,                   -- input
         hmin              => hdmi_hmin,                    -- input
         hmax              => hdmi_hmax,                    -- input
         vmin              => hdmi_vmin,                    -- input
         vmax              => hdmi_vmax,                    -- input

         -- Scaler format. 00=16bpp 565, 01=24bpp 10=32bpp
         format            => "01",                         -- input: 24bpp

         -- Polyphase filter coefficients (not used by us)
         poly_clk          => qnice_poly_clk_i,             -- input
         poly_dw           => qnice_poly_dw_i,              -- input
         poly_a            => qnice_poly_a_i,               -- input
         poly_wr           => qnice_poly_wr_i,              -- input

         -- Avalon Memory interface
         avl_clk           => hr_clk_i,                     -- input
         avl_waitrequest   => hr_wide_waitrequest,          -- input
         avl_readdata      => hr_wide_readdata,             -- input
         avl_readdatavalid => hr_wide_readdatavalid,        -- input
         avl_burstcount    => hr_wide_burstcount,           -- output
         avl_writedata     => hr_wide_writedata,            -- output
         avl_address       => hr_wide_address,              -- output
         avl_write         => hr_wide_write,                -- output
         avl_read          => hr_wide_read,                 -- output
         avl_byteenable    => hr_wide_byteenable,           -- output

         -- Asynchronous reset, active low
         reset_na          => reset_na                      -- input
      ); -- i_ascal

   i_avm_decrease : entity work.avm_decrease
      generic map (
         G_SLAVE_ADDRESS_SIZE  => C_AVM_ADDRESS_SIZE,
         G_SLAVE_DATA_SIZE     => C_AVM_DATA_SIZE,
         G_MASTER_ADDRESS_SIZE => 22,  -- HyperRAM size is 4 MWords = 8 MBytes.
         G_MASTER_DATA_SIZE    => 16
      )
      port map (
         clk_i                 => hr_clk_i,
         rst_i                 => hr_rst_i,
         s_avm_write_i         => hr_wide_write,
         s_avm_read_i          => hr_wide_read,
         s_avm_address_i       => hr_wide_address,
         s_avm_writedata_i     => hr_wide_writedata,
         s_avm_byteenable_i    => hr_wide_byteenable,
         s_avm_burstcount_i    => hr_wide_burstcount,
         s_avm_readdata_o      => hr_wide_readdata,
         s_avm_readdatavalid_o => hr_wide_readdatavalid,
         s_avm_waitrequest_o   => hr_wide_waitrequest,
         m_avm_write_o         => hr_write_o,
         m_avm_read_o          => hr_read_o,
         m_avm_address_o       => hr_address_o(21 downto 0), -- MSB defaults to zero
         m_avm_writedata_o     => hr_writedata_o,
         m_avm_byteenable_o    => hr_byteenable_o,
         m_avm_burstcount_o    => hr_burstcount_o,
         m_avm_readdata_i      => hr_readdata_i,
         m_avm_readdatavalid_i => hr_readdatavalid_i,
         m_avm_waitrequest_i   => hr_waitrequest_i
      ); -- i_avm_decrease

   i_video_overlay : entity work.video_overlay
      generic  map (
         G_VGA_DX          => G_VGA_DX,  -- TBD
         G_VGA_DY          => G_VGA_DY,  -- TBD
         G_FONT_FILE       => G_FONT_FILE,
         G_FONT_DX         => G_FONT_DX,
         G_FONT_DY         => G_FONT_DY
      )
      port map (
         vga_clk_i         => hdmi_clk_i,
         vga_ce_i          => '1',
         vga_red_i         => std_logic_vector(hdmi_red),
         vga_green_i       => std_logic_vector(hdmi_green),
         vga_blue_i        => std_logic_vector(hdmi_blue),
         vga_hs_i          => hdmi_hs,
         vga_vs_i          => hdmi_vs,
         vga_de_i          => hdmi_de,
         vga_cfg_scaling_i => hdmi_osm_cfg_scaling_i,
         vga_cfg_shift_i   => hdmi_shift,
         vga_cfg_enable_i  => hdmi_osm_cfg_enable_i,
         vga_cfg_r15kHz_i  => '0',
         vga_cfg_xy_i      => hdmi_osm_cfg_xy_i,
         vga_cfg_dxdy_i    => hdmi_osm_cfg_dxdy_i,
         vga_vram_addr_o   => hdmi_osm_vram_addr_o,
         vga_vram_data_i   => hdmi_osm_vram_data_i,
         vga_ce_o          => open,
         vga_red_o         => hdmi_osm_red,
         vga_green_o       => hdmi_osm_green,
         vga_blue_o        => hdmi_osm_blue,
         vga_hs_o          => hdmi_osm_hs,
         vga_vs_o          => hdmi_osm_vs,
         vga_de_o          => hdmi_osm_de
      ); -- i_video_overlay

   i_vga_to_hdmi : entity work.vga_to_hdmi
      port map (
         select_44100 => '0',
         dvi          => hdmi_dvi_i,
         vic          => std_logic_vector(to_unsigned(hdmi_video_mode.CEA_CTA_VIC, 8)),
         aspect       => hdmi_video_mode.ASPECT,
         pix_rep      => hdmi_video_mode.PIXEL_REP,
         vs_pol       => hdmi_video_mode.V_POL,
         hs_pol       => hdmi_video_mode.H_POL,

         vga_rst      => hdmi_rst_i,
         vga_clk      => hdmi_clk_i,
         vga_vs       => hdmi_osm_vs,
         vga_hs       => hdmi_osm_hs,
         vga_de       => hdmi_osm_de,
         vga_r        => hdmi_osm_red,
         vga_g        => hdmi_osm_green,
         vga_b        => hdmi_osm_blue,

         -- PCM audio
         pcm_clk      => audio_clk_i,
         pcm_rst      => audio_rst_i,
         pcm_clken    => audio_pcm_clken,                           -- 1/256 = 48 kHz
         pcm_l        => std_logic_vector(audio_left_i),
         pcm_r        => std_logic_vector(audio_right_i),
         pcm_acr      => audio_pcm_acr,
         pcm_n        => audio_pcm_n,
         pcm_cts      => audio_pcm_cts,

         -- TMDS output (parallel)
         tmds         => hdmi_tmds
      ); -- i_vga_to_hdmi


   ---------------------------------------------------------------------------------------------
   -- tmds_clk (HDMI)
   ---------------------------------------------------------------------------------------------

   -- serialiser: in this design we use TMDS SelectIO outputs
   GEN_HDMI_DATA: for i in 0 to 2 generate
   begin
      I_HDMI_DATA: entity work.serialiser_10to1_selectio
      port map (
         rst     => hdmi_rst_i,
         clk     => hdmi_clk_i,
         clk_x5  => tmds_clk_i,
         d       => hdmi_tmds(i),
         out_p   => tmds_data_p_o(i),
         out_n   => tmds_data_n_o(i)
      ); -- I_HDMI_DATA: entity work.serialiser_10to1_selectio
   end generate GEN_HDMI_DATA;

   GEN_HDMI_CLK: entity work.serialiser_10to1_selectio
   port map (
         rst     => hdmi_rst_i,
         clk     => hdmi_clk_i,
         clk_x5  => tmds_clk_i,
         d       => "0000011111",
         out_p   => tmds_clk_p_o,
         out_n   => tmds_clk_n_o
      ); -- GEN_HDMI_CLK

end architecture synthesis;

