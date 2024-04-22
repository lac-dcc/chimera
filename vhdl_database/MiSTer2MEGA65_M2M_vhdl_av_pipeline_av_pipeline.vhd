----------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework
--
-- Abstraction layer to simplify mega65.vhd
--
-- MiSTer2MEGA65 done by sy2002 and MJoergen in 2022 and licensed under GPL v3
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.qnice_tools.all;

library work;
use work.globals.all;
use work.types_pkg.all;
use work.video_modes_pkg.all;

library xpm;
use xpm.vcomponents.all;

entity av_pipeline is
   generic (
      G_VIDEO_MODE_VECTOR     : video_modes_vector;   -- Desired video format of HDMI output.
      G_AUDIO_CLOCK_RATE      : natural := 30_000_000;
      G_VGA_DX                : natural;              -- Actual format of video from Core (in pixels).
      G_VGA_DY                : natural;
      G_FONT_FILE             : string;
      G_FONT_DX               : natural;
      G_FONT_DY               : natural
   );
   port (
      -- From CORE
      video_clk_i             : in  std_logic;
      video_rst_i             : in  std_logic;
      video_ce_i              : in  std_logic;
      video_ce_ovl_i          : in  std_logic;
      video_red_i             : in  std_logic_vector( 7 downto 0);
      video_green_i           : in  std_logic_vector( 7 downto 0);
      video_blue_i            : in  std_logic_vector( 7 downto 0);
      video_vs_i              : in  std_logic;
      video_hs_i              : in  std_logic;
      video_hblank_i          : in  std_logic;
      video_vblank_i          : in  std_logic;
      audio_clk_i             : in  std_logic; -- 30 MHz
      audio_rst_i             : in  std_logic;
      audio_left_i            : in  std_logic_vector(15 downto 0);
      audio_right_i           : in  std_logic_vector(15 downto 0);

      -- From QNICE
      qnice_clk_i             : in  std_logic;
      qnice_rst_i             : in  std_logic;
      qnice_osm_cfg_scaling_i : in  std_logic_vector( 8 downto 0);
      qnice_osm_cfg_xy_i      : in  std_logic_vector(15 downto 0);
      qnice_osm_cfg_dxdy_i    : in  std_logic_vector(15 downto 0);
      qnice_osm_cfg_enable_i  : in  std_logic;
      qnice_retro15kHz_i      : in  std_logic;
      qnice_scandoubler_i     : in  std_logic;
      qnice_csync_i           : in  std_logic;
      qnice_zoom_crop_i       : in  std_logic;
      qnice_audio_filter_i    : in  std_logic;
      qnice_audio_mute_i      : in  std_logic;
      qnice_video_mode_i      : in  std_logic_vector( 1 downto 0);
      qnice_dvi_i             : in  std_logic;
      qnice_poly_clk_i        : in  std_logic;
      qnice_poly_dw_i         : in  std_logic_vector( 9 downto 0);
      qnice_poly_a_i          : in  std_logic_vector( 9 downto 0);
      qnice_poly_wr_i         : in  std_logic;
      qnice_ascal_mode_i      : in  std_logic_vector( 4 downto 0);

      -- To QNICE
      qnice_hdmax_o           : out std_logic_vector(11 downto 0);
      qnice_vdmax_o           : out std_logic_vector(11 downto 0);
      qnice_h_pixels_o        : out std_logic_vector(11 downto 0); -- horizontal visible display width in pixels
      qnice_v_pixels_o        : out std_logic_vector(11 downto 0); -- horizontal visible display width in pixels
      qnice_h_pulse_o         : out std_logic_vector(11 downto 0); -- horizontal sync pulse width in pixels
      qnice_h_bp_o            : out std_logic_vector(11 downto 0); -- horizontal back porch width in pixels
      qnice_h_fp_o            : out std_logic_vector(11 downto 0); -- horizontal front porch width in pixels
      qnice_v_pulse_o         : out std_logic_vector(11 downto 0); -- horizontal sync pulse width in pixels
      qnice_v_bp_o            : out std_logic_vector(11 downto 0); -- horizontal back porch width in pixels
      qnice_v_fp_o            : out std_logic_vector(11 downto 0); -- horizontal front porch width in pixels
      qnice_h_freq_o          : out std_logic_vector(15 downto 0); -- horizontal sync frequency


      -- QNICE interface for VRAM
      qnice_address_i         : in  std_logic_vector(VRAM_ADDR_WIDTH-1 downto 0);
      qnice_data_i            : in  std_logic_vector(15 downto 0);
      qnice_wren_i            : in  std_logic;
      qnice_byteenable_i      : in  std_logic_vector( 1 downto 0);
      qnice_q_o               : out std_logic_vector(15 downto 0);

      -- From SYS
      sys_clk_i               : in  std_logic;
      sys_pps_i               : in  std_logic;

      -- HyperRAM access for framebuffer
      hr_clk_i                : in  std_logic;
      hr_rst_i                : in  std_logic;
      hr_write_o              : out std_logic;
      hr_read_o               : out std_logic;
      hr_address_o            : out std_logic_vector(31 downto 0);
      hr_writedata_o          : out std_logic_vector(15 downto 0);
      hr_byteenable_o         : out std_logic_vector( 1 downto 0);
      hr_burstcount_o         : out std_logic_vector( 7 downto 0);
      hr_readdata_i           : in  std_logic_vector(15 downto 0);
      hr_readdatavalid_i      : in  std_logic;
      hr_waitrequest_i        : in  std_logic;
      hr_high_o               : out std_logic; -- Core is too fast
      hr_low_o                : out std_logic; -- Core is too slow

      -- I/O to VGA output
      VGA_RED                 : out std_logic_vector( 7 downto 0);
      VGA_GREEN               : out std_logic_vector( 7 downto 0);
      VGA_BLUE                : out std_logic_vector( 7 downto 0);
      VGA_HS                  : out std_logic;
      VGA_VS                  : out std_logic;
      vdac_clk                : out std_logic;
      vdac_sync_n             : out std_logic;
      vdac_blank_n            : out std_logic;

      -- I/O to 3.5mm analog audio jack
      pwm_l                   : out std_logic;
      pwm_r                   : out std_logic;

      -- I/O to Digital Video (HDMI)
      hdmi_clk_i              : in  std_logic;
      hdmi_rst_i              : in  std_logic;
      tmds_clk_i              : in  std_logic;
      tmds_data_p_o           : out std_logic_vector( 2 downto 0);
      tmds_data_n_o           : out std_logic_vector( 2 downto 0);
      tmds_clk_p_o            : out std_logic;
      tmds_clk_n_o            : out std_logic
   );
end entity av_pipeline;

architecture synthesis of av_pipeline is

---------------------------------------------------------------------------------------------
-- audio_clk
---------------------------------------------------------------------------------------------

-- signed audio from the core
-- if the core outputs unsigned audio, make sure you convert properly to prevent a loss in audio quality
signal audio_filt_left        : std_logic_vector(15 downto 0);
signal audio_filt_right       : std_logic_vector(15 downto 0);
signal audio_left             : std_logic_vector(15 downto 0);
signal audio_right            : std_logic_vector(15 downto 0);

--- control signals from QNICE
signal audio_filter           : std_logic;
signal audio_mute             : std_logic;

---------------------------------------------------------------------------------------------
-- video_clk
---------------------------------------------------------------------------------------------
signal video_retro15kHz       : std_logic;
signal video_scandoubler      : std_logic;
signal video_csync            : std_logic;
signal video_zoom_crop        : std_logic;

signal video_crop_ce          : std_logic;
signal video_crop_red         : std_logic_vector(7 downto 0);
signal video_crop_green       : std_logic_vector(7 downto 0);
signal video_crop_blue        : std_logic_vector(7 downto 0);
signal video_crop_hs          : std_logic;
signal video_crop_vs          : std_logic;
signal video_crop_hblank      : std_logic;
signal video_crop_vblank      : std_logic;

-- On-Screen-Menu (OSM) for VGA
signal video_osm_cfg_scaling  : std_logic_vector(8 downto 0);
signal video_osm_cfg_enable   : std_logic;
signal video_osm_cfg_xy       : std_logic_vector(15 downto 0);
signal video_osm_cfg_dxdy     : std_logic_vector(15 downto 0);
signal video_osm_vram_addr    : std_logic_vector(15 downto 0);
signal video_osm_vram_data    : std_logic_vector(15 downto 0);
signal video_hdmax            : natural range 0 to 4095;
signal video_vdmax            : natural range 0 to 4095;

signal video_pps              : std_logic;
signal video_h_pixels         : std_logic_vector(11 downto 0); -- horizontal visible display width in pixels
signal video_v_pixels         : std_logic_vector(11 downto 0); -- horizontal visible display width in pixels
signal video_h_pulse          : std_logic_vector(11 downto 0); -- horizontal sync pulse width in pixels
signal video_h_bp             : std_logic_vector(11 downto 0); -- horizontal back porch width in pixels
signal video_h_fp             : std_logic_vector(11 downto 0); -- horizontal front porch width in pixels
signal video_v_pulse          : std_logic_vector(11 downto 0); -- horizontal sync pulse width in pixels
signal video_v_bp             : std_logic_vector(11 downto 0); -- horizontal back porch width in pixels
signal video_v_fp             : std_logic_vector(11 downto 0); -- horizontal front porch width in pixels
signal video_h_freq           : std_logic_vector(15 downto 0); -- horizontal sync frequency

---------------------------------------------------------------------------------------------
-- hdmi_clk
---------------------------------------------------------------------------------------------

-- On-Screen-Menu (OSM) for HDMI
signal hdmi_osm_cfg_scaling   : std_logic_vector(8 downto 0);
signal hdmi_osm_cfg_enable    : std_logic;
signal hdmi_osm_cfg_xy        : std_logic_vector(15 downto 0);
signal hdmi_osm_cfg_dxdy      : std_logic_vector(15 downto 0);
signal hdmi_osm_vram_addr     : std_logic_vector(15 downto 0);
signal hdmi_osm_vram_data     : std_logic_vector(15 downto 0);

signal hdmi_video_mode        : std_logic_vector(1 downto 0);
signal hdmi_zoom_crop         : std_logic;

-- QNICE On Screen Menu selections
signal hdmi_osm_control_m     : std_logic_vector(255 downto 0);

---------------------------------------------------------------------------------------------
-- MiSTer audio filter
---------------------------------------------------------------------------------------------

component audio_out
   generic (
      CLK_RATE : natural
   );
   port (
      reset       : in  std_logic;
      clk         : in  std_logic;

      -- 0 - 48KHz, 1 - 96KHz
      sample_rate : in  std_logic;

      flt_rate    : in  std_logic_vector(31 downto 0);
      cx          : in  std_logic_vector(39 downto 0);
      cx0         : in  std_logic_vector( 7 downto 0);
      cx1         : in  std_logic_vector( 7 downto 0);
      cx2         : in  std_logic_vector( 7 downto 0);
      cy0         : in  std_logic_vector(23 downto 0);
      cy1         : in  std_logic_vector(23 downto 0);
      cy2         : in  std_logic_vector(23 downto 0);

      att         : in  std_logic_vector( 4 downto 0);
      mix         : in  std_logic_vector( 1 downto 0);

      is_signed   : in  std_logic;
      core_l      : in  std_logic_vector(15 downto 0);
      core_r      : in  std_logic_vector(15 downto 0);

      alsa_l      : in  std_logic_vector(15 downto 0);
      alsa_r      : in  std_logic_vector(15 downto 0);

      -- Signed output
      al          : out std_logic_vector(15 downto 0);
      ar          : out std_logic_vector(15 downto 0)
   );
end component audio_out;

-- Returns the bit-position of the right-most nonzero bit.
-- E.g. the vector "01100" returns 2.
-- If all bits are zero, return the size of the vector.
-- E.g. the vector "000" returns 3.
pure function first_nonzero_bit(arg : std_logic_vector) return natural is
   -- This ensures the RHS index of a vector is zero.
   variable tmp : std_logic_vector(arg'length-1 downto 0) := arg;
begin
   for i in 0 to tmp'left loop
      if tmp(i) = '1' then
         return i;
      end if;
   end loop;
   return tmp'length;
end function first_nonzero_bit;

begin

   ---------------------------------------------------------------------------------------------
   -- Analog pipeline (VGA + audio out)
   ---------------------------------------------------------------------------------------------

   -- Clock domain crossing: QNICE to VIDEO
   i_qnice2video: xpm_cdc_array_single
      generic map (
         WIDTH => 46
      )
      port map (
         src_clk                => qnice_clk_i,
         src_in(15 downto 0)    => qnice_osm_cfg_xy_i,
         src_in(31 downto 16)   => qnice_osm_cfg_dxdy_i,
         src_in(32)             => qnice_osm_cfg_enable_i,
         src_in(33)             => qnice_retro15kHz_i,
         src_in(34)             => qnice_scandoubler_i,
         src_in(35)             => qnice_csync_i,
         src_in(36)             => qnice_zoom_crop_i,
         src_in(45 downto 37)   => qnice_osm_cfg_scaling_i,
         dest_clk               => video_clk_i,
         dest_out(15 downto 0)  => video_osm_cfg_xy,
         dest_out(31 downto 16) => video_osm_cfg_dxdy,
         dest_out(32)           => video_osm_cfg_enable,
         dest_out(33)           => video_retro15kHz,
         dest_out(34)           => video_scandoubler,
         dest_out(35)           => video_csync,
         dest_out(36)           => video_zoom_crop,
         dest_out(45 downto 37) => video_osm_cfg_scaling
      ); -- i_qnice2video

   -- Clock domain crossing: QNICE to AUDIO
   i_qnice2audio: xpm_cdc_array_single
      generic map (
         WIDTH => 2
      )
      port map (
         src_clk     => qnice_clk_i,
         src_in(0)   => qnice_audio_mute_i,
         src_in(1)   => qnice_audio_filter_i,
         dest_clk    => audio_clk_i,
         dest_out(0) => audio_mute,
         dest_out(1) => audio_filter
      ); -- i_qnice2audio


   i_audio_out : audio_out
      generic map (
         CLK_RATE => G_AUDIO_CLOCK_RATE
      )
      port map (
         reset       => audio_rst_i,
         clk         => audio_clk_i,

         sample_rate => '0', -- 0 - 48KHz, 1 - 96KHz

         flt_rate    => audio_flt_rate,
         cx          => audio_cx,
         cx0         => audio_cx0,
         cx1         => audio_cx1,
         cx2         => audio_cx2,
         cy0         => audio_cy0,
         cy1         => audio_cy1,
         cy2         => audio_cy2,
         att         => audio_att,
         mix         => audio_mix,

         is_signed   => '1',
         core_l      => audio_left_i,
         core_r      => audio_right_i,

         alsa_l      => (others => '0'),
         alsa_r      => (others => '0'),

         -- Signed output
         al          => audio_filt_left,
         ar          => audio_filt_right
      ); -- i_audio_out

   select_or_mute_audio : process(all)
   begin
      if audio_mute = '1' then
         audio_left  <= (others => '0');
         audio_right <= (others => '0');
      else
         if audio_filter = '0' then
            audio_left  <= audio_left_i;
            audio_right <= audio_right_i;
         else
            audio_left  <= audio_filt_left;
            audio_right <= audio_filt_right;
         end if;
      end if;
   end process select_or_mute_audio;

   -- Clock domain crossing: Board clock domain (CLK) to video (video_clk_i)
   i_sys2video : entity work.cdc_pulse
      port map (
         src_clk_i   => sys_clk_i,
         src_pulse_i => sys_pps_i,
         dst_clk_i   => video_clk_i,
         dst_pulse_o => video_pps
      ); -- i_sys2video

   i_video_counters : entity work.video_counters
      port map (
         clk_i      => video_clk_i,
         rst_i      => video_rst_i,
         ce_i       => video_ce_i,
         vs_i       => video_vs_i,
         hs_i       => video_hs_i,
         hblank_i   => video_hblank_i,
         vblank_i   => video_vblank_i,
         pps_i      => video_pps,
         h_pixels_o => video_h_pixels,
         v_pixels_o => video_v_pixels,
         h_pulse_o  => video_h_pulse,
         h_bp_o     => video_h_bp,
         h_fp_o     => video_h_fp,
         v_pulse_o  => video_v_pulse,
         v_bp_o     => video_v_bp,
         v_fp_o     => video_v_fp,
         h_freq_o   => video_h_freq
      ); -- i_video_counters

   i_analog_pipeline : entity work.analog_pipeline
      generic map (
         G_VGA_DX                => G_VGA_DX,
         G_VGA_DY                => G_VGA_DY,
         G_FONT_FILE             => G_FONT_FILE,
         G_FONT_DX               => G_FONT_DX,
         G_FONT_DY               => G_FONT_DY
      )
      port map (
         -- Input from Core (video and audio)
         video_clk_i             => video_clk_i,
         video_rst_i             => video_rst_i,
         video_ce_i              => video_ce_i,
         video_ce_ovl_i          => video_ce_ovl_i,
         video_red_i             => video_red_i,
         video_green_i           => video_green_i,
         video_blue_i            => video_blue_i,
         video_hs_i              => video_hs_i,
         video_vs_i              => video_vs_i,
         video_hblank_i          => video_hblank_i,
         video_vblank_i          => video_vblank_i,
         audio_clk_i             => audio_clk_i,
         audio_rst_i             => audio_rst_i,
         audio_left_i            => signed(audio_left),
         audio_right_i           => signed(audio_right),

         -- Configure the scandoubler: 0 =off/1=on
         video_scandoubler_i     => video_scandoubler,

         -- Configure composite sync: 0 =off/1=on
         video_csync_i           => video_csync,

         -- Configure 15 kHz mode: 0 =off/1=on
         video_retro15kHz_i      => video_retro15kHz,

         -- Analog output (VGA and audio jack)
         vga_red_o               => vga_red,
         vga_green_o             => vga_green,
         vga_blue_o              => vga_blue,
         vga_hs_o                => vga_hs,
         vga_vs_o                => vga_vs,
         vdac_clk_o              => vdac_clk,
         vdac_syncn_o            => vdac_sync_n,
         vdac_blankn_o           => vdac_blank_n,
         pwm_l_o                 => pwm_l,
         pwm_r_o                 => pwm_r,

         -- Connect to QNICE and Video RAM
         video_osm_cfg_scaling_i => first_nonzero_bit(video_osm_cfg_scaling),
         video_osm_cfg_enable_i  => video_osm_cfg_enable,
         video_osm_cfg_xy_i      => video_osm_cfg_xy,
         video_osm_cfg_dxdy_i    => video_osm_cfg_dxdy,
         video_osm_vram_addr_o   => video_osm_vram_addr,
         video_osm_vram_data_i   => video_osm_vram_data
      ); -- i_analog_pipeline

   -- Clock domain crossing: VIDEO to QNICE
   i_video2qnice: xpm_cdc_array_single
      generic map (
         WIDTH => 136
      )
      port map (
         src_clk                  => video_clk_i,
         src_in( 11 downto   0)   => video_h_pixels,
         src_in( 23 downto  12)   => video_v_pixels,
         src_in( 35 downto  24)   => video_h_pulse,
         src_in( 47 downto  36)   => video_h_bp,
         src_in( 59 downto  48)   => video_h_fp,
         src_in( 71 downto  60)   => video_v_pulse,
         src_in( 83 downto  72)   => video_v_bp,
         src_in( 95 downto  84)   => video_v_fp,
         src_in(111 downto  96)   => video_h_freq,
         src_in(123 downto 112)   => std_logic_vector(to_unsigned(video_hdmax+1, 12)),
         src_in(135 downto 124)   => std_logic_vector(to_unsigned(video_vdmax+1, 12)),
         dest_clk                 => qnice_clk_i,
         dest_out( 11 downto   0) => qnice_h_pixels_o,
         dest_out( 23 downto  12) => qnice_v_pixels_o,
         dest_out( 35 downto  24) => qnice_h_pulse_o,
         dest_out( 47 downto  36) => qnice_h_bp_o,
         dest_out( 59 downto  48) => qnice_h_fp_o,
         dest_out( 71 downto  60) => qnice_v_pulse_o,
         dest_out( 83 downto  72) => qnice_v_bp_o,
         dest_out( 95 downto  84) => qnice_v_fp_o,
         dest_out(111 downto  96) => qnice_h_freq_o,
         dest_out(123 downto 112) => qnice_hdmax_o,
         dest_out(135 downto 124) => qnice_vdmax_o
      ); -- i_video2qnice


   ---------------------------------------------------------------------------------------------
   -- Digital pipeline (HDMI)
   ---------------------------------------------------------------------------------------------

   -- Clock domain crossing: QNICE to HDMI
   i_qnice2hdmi: xpm_cdc_array_single
      generic map (
         WIDTH => 45
      )
      port map (
         src_clk                => qnice_clk_i,
         src_in(15 downto 0)    => qnice_osm_cfg_xy_i,
         src_in(31 downto 16)   => qnice_osm_cfg_dxdy_i,
         src_in(32)             => qnice_osm_cfg_enable_i,
         src_in(34 downto 33)   => qnice_video_mode_i,
         src_in(35)             => qnice_zoom_crop_i,
         src_in(44 downto 36)   => qnice_osm_cfg_scaling_i,
         dest_clk               => hdmi_clk_i,
         dest_out(15 downto 0)  => hdmi_osm_cfg_xy,
         dest_out(31 downto 16) => hdmi_osm_cfg_dxdy,
         dest_out(32)           => hdmi_osm_cfg_enable,
         dest_out(34 downto 33) => hdmi_video_mode,
         dest_out(35)           => hdmi_zoom_crop,
         dest_out(44 downto 36) => hdmi_osm_cfg_scaling
      ); -- i_qnice2hdmi


   i_crop : entity work.crop
      port map (
         video_clk_i       => video_clk_i,
         video_rst_i       => video_rst_i,
         video_ce_i        => video_ce_i,
         video_red_i       => video_red_i,
         video_green_i     => video_green_i,
         video_blue_i      => video_blue_i,
         video_hs_i        => video_hs_i,
         video_vs_i        => video_vs_i,
         video_hblank_i    => video_hblank_i,
         video_vblank_i    => video_vblank_i,
         video_crop_mode_i => video_zoom_crop,
         video_ce_o        => video_crop_ce,
         video_red_o       => video_crop_red,
         video_green_o     => video_crop_green,
         video_blue_o      => video_crop_blue,
         video_hs_o        => video_crop_hs,
         video_vs_o        => video_crop_vs,
         video_hblank_o    => video_crop_hblank,
         video_vblank_o    => video_crop_vblank
      ); -- i_crop

   i_digital_pipeline : entity work.digital_pipeline
      generic map (
         G_VIDEO_MODE_VECTOR => G_VIDEO_MODE_VECTOR,
         G_VGA_DX            => G_VGA_DX,
         G_VGA_DY            => G_VGA_DY,
         G_FONT_FILE         => G_FONT_FILE,
         G_FONT_DX           => G_FONT_DX,
         G_FONT_DY           => G_FONT_DY
      )
      port map (
         -- Input from Core (video and audio)
         video_clk_i              => video_clk_i,
         video_rst_i              => video_rst_i,
         video_ce_i               => video_crop_ce,
         video_red_i              => video_crop_red,
         video_green_i            => video_crop_green,
         video_blue_i             => video_crop_blue,
         video_hs_i               => video_crop_hs,
         video_vs_i               => video_crop_vs,
         video_hblank_i           => video_crop_hblank,
         video_vblank_i           => video_crop_vblank,
         video_hdmax_o            => video_hdmax,
         video_vdmax_o            => video_vdmax,
         audio_clk_i              => audio_clk_i,
         audio_rst_i              => audio_rst_i,
         audio_left_i             => signed(audio_left_i),
         audio_right_i            => signed(audio_right_i),

         -- Digital output (HDMI)
         hdmi_clk_i               => hdmi_clk_i,
         hdmi_rst_i               => hdmi_rst_i,
         tmds_clk_i               => tmds_clk_i,
         tmds_data_p_o            => tmds_data_p_o,
         tmds_data_n_o            => tmds_data_n_o,
         tmds_clk_p_o             => tmds_clk_p_o,
         tmds_clk_n_o             => tmds_clk_n_o,

         -- Connect to QNICE and Video RAM
         hdmi_dvi_i               => qnice_dvi_i, -- proper clock domain crossing for this very signal happens inside vga_to_hdmi.vhd
         hdmi_video_mode_i        => to_integer(unsigned(hdmi_video_mode)),
         hdmi_crop_mode_i         => hdmi_zoom_crop,
         hdmi_osm_cfg_scaling_i   => first_nonzero_bit(hdmi_osm_cfg_scaling),
         hdmi_osm_cfg_enable_i    => hdmi_osm_cfg_enable,
         hdmi_osm_cfg_xy_i        => hdmi_osm_cfg_xy,
         hdmi_osm_cfg_dxdy_i      => hdmi_osm_cfg_dxdy,
         hdmi_osm_vram_addr_o     => hdmi_osm_vram_addr,
         hdmi_osm_vram_data_i     => hdmi_osm_vram_data,

         -- QNICE connection to ascal's mode register
         qnice_ascal_mode_i       => unsigned(qnice_ascal_mode_i),

         -- QNICE device for interacting with the Polyphase filter coefficients
         qnice_poly_clk_i         => qnice_clk_i,
         qnice_poly_dw_i          => unsigned(qnice_poly_dw_i),
         qnice_poly_a_i           => unsigned(qnice_poly_a_i),
         qnice_poly_wr_i          => qnice_poly_wr_i,

         -- Connect to HyperRAM controller
         hr_clk_i                 => hr_clk_i,
         hr_rst_i                 => hr_rst_i,
         hr_write_o               => hr_write_o,
         hr_read_o                => hr_read_o,
         hr_address_o             => hr_address_o,
         hr_writedata_o           => hr_writedata_o,
         hr_byteenable_o          => hr_byteenable_o,
         hr_burstcount_o          => hr_burstcount_o,
         hr_readdata_i            => hr_readdata_i,
         hr_readdatavalid_i       => hr_readdatavalid_i,
         hr_waitrequest_i         => hr_waitrequest_i
      ); -- i_digital_pipeline

   -- Monitor the read and write accesses to the HyperRAM by the ascaler.
   i_hdmi_flicker_free : entity work.hdmi_flicker_free
      generic map (
         G_THRESHOLD_LOW  => X"0000_1000",  -- @TODO: Optimize these threshold values
         G_THRESHOLD_HIGH => X"0000_2000"
      )
      port map (
         hr_clk_i       => hr_clk_i,
         hr_write_i     => hr_write_o,
         hr_read_i      => hr_read_o,
         hr_address_i   => hr_address_o,
         high_o         => hr_high_o,       -- Core is too fast
         low_o          => hr_low_o         -- Core is too slow
      ); -- i_hdmi_flicker_free

   ---------------------------------------------------------------------------------------------------------------
   -- On-Screen-Menu video and attribute RAM: Dual-clock QNICE and VIDEO
   ---------------------------------------------------------------------------------------------------------------

   i_osm_vram_vga : entity work.dualport_2clk_ram_byteenable
      generic map (
         G_ADDR_WIDTH   => VRAM_ADDR_WIDTH,
         G_DATA_WIDTH   => 16,
         G_FALLING_A    => true  -- QNICE expects read/write to happen at the falling clock edge
      )
      port map
      (
         a_clk_i        => qnice_clk_i,
         a_address_i    => qnice_address_i,
         a_data_i       => qnice_data_i,
         a_wren_i       => qnice_wren_i,
         a_byteenable_i => qnice_byteenable_i,
         a_q_o          => qnice_q_o,

         b_clk_i        => video_clk_i,
         b_address_i    => video_osm_vram_addr(VRAM_ADDR_WIDTH-1 downto 0),
         b_q_o          => video_osm_vram_data
      ); -- i_osm_vram_vga


   ---------------------------------------------------------------------------------------------------------------
   -- On-Screen-Menu video and attribute RAM: Dual-clock QNICE and HDMI
   ---------------------------------------------------------------------------------------------------------------

   i_osm_vram_hdmi : entity work.dualport_2clk_ram_byteenable
      generic map (
         G_ADDR_WIDTH   => VRAM_ADDR_WIDTH,
         G_DATA_WIDTH   => 16,
         G_FALLING_A    => true  -- QNICE expects read/write to happen at the falling clock edge
      )
      port map
      (
         a_clk_i        => qnice_clk_i,
         a_address_i    => qnice_address_i,
         a_data_i       => qnice_data_i,
         a_wren_i       => qnice_wren_i,
         a_byteenable_i => qnice_byteenable_i,
         a_q_o          => open, -- TBD

         b_clk_i        => hdmi_clk_i,
         b_address_i    => hdmi_osm_vram_addr(VRAM_ADDR_WIDTH-1 downto 0),
         b_q_o          => hdmi_osm_vram_data
      ); -- i_osm_vram_hdmi


end architecture synthesis;

