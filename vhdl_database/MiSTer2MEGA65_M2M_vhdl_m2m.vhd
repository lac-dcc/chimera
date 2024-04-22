----------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework
--
-- Abstraction layer to simplify mega65.vhd
--
-- MiSTer2MEGA65 done by sy2002 and MJoergen in 2023 and licensed under GPL v3
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity m2m is
port (
   CLK              : in  std_logic;                  -- 100 MHz clock

   -- MAX10 FPGA (delivers reset)
   max10_tx         : in  std_logic;
   max10_rx         : out std_logic;
   max10_clkandsync : out std_logic;

   -- Serial communication (rxd, txd only; rts/cts are not available)
   -- 115.200 baud, 8-N-1
   UART_RXD         : in  std_logic;                  -- receive data
   UART_TXD         : out std_logic;                  -- send data

   -- VGA
   VGA_RED          : out std_logic_vector(7 downto 0);
   VGA_GREEN        : out std_logic_vector(7 downto 0);
   VGA_BLUE         : out std_logic_vector(7 downto 0);
   VGA_HS           : out std_logic;
   VGA_VS           : out std_logic;

   -- VDAC
   vdac_clk         : out std_logic;
   vdac_sync_n      : out std_logic;
   vdac_blank_n     : out std_logic;

   -- Digital Video (HDMI)
   tmds_data_p      : out std_logic_vector(2 downto 0);
   tmds_data_n      : out std_logic_vector(2 downto 0);
   tmds_clk_p       : out std_logic;
   tmds_clk_n       : out std_logic;

   -- MEGA65 smart keyboard controller
   kb_io0           : out std_logic;                 -- clock to keyboard
   kb_io1           : out std_logic;                 -- data output to keyboard
   kb_io2           : in  std_logic;                 -- data input from keyboard

   -- SD Card (internal on bottom)
   SD_RESET         : out std_logic;
   SD_CLK           : out std_logic;
   SD_MOSI          : out std_logic;
   SD_MISO          : in  std_logic;
   SD_CD            : in  std_logic;

   -- SD Card (external on back)
   SD2_RESET        : out std_logic;
   SD2_CLK          : out std_logic;
   SD2_MOSI         : out std_logic;
   SD2_MISO         : in  std_logic;
   SD2_CD           : in  std_logic;

   -- 3.5mm analog audio jack
   pwm_l            : out std_logic;
   pwm_r            : out std_logic;

   -- Joysticks and Paddles
   joy_1_up_n       : in  std_logic;
   joy_1_down_n     : in  std_logic;
   joy_1_left_n     : in  std_logic;
   joy_1_right_n    : in  std_logic;
   joy_1_fire_n     : in  std_logic;

   joy_2_up_n       : in  std_logic;
   joy_2_down_n     : in  std_logic;
   joy_2_left_n     : in  std_logic;
   joy_2_right_n    : in  std_logic;
   joy_2_fire_n     : in  std_logic;

   paddle           : in  std_logic_vector(3 downto 0);
   paddle_drain     : out std_logic;

   -- Built-in HyperRAM
   hr_d             : inout std_logic_vector(7 downto 0);    -- Data/Address
   hr_rwds          : inout std_logic;               -- RW Data strobe
   hr_reset         : out std_logic;                 -- Active low RESET line to HyperRAM
   hr_clk_p         : out std_logic;
   hr_cs0           : out std_logic
);
end entity m2m;

architecture synthesis of m2m is

signal main_clk    : std_logic;
signal main_rst    : std_logic;
signal reset_m2m_n : std_logic;
signal qnice_clk   : std_logic;
signal qnice_rst   : std_logic;

--------------------------------------------------------------------------------------------
-- main_clk (MiSTer core's clock)
---------------------------------------------------------------------------------------------

-- QNICE control and status register
signal main_qnice_reset       : std_logic;
signal main_qnice_pause       : std_logic;

signal main_reset_m2m         : std_logic;
signal main_reset_core        : std_logic;

-- keyboard handling (incl. drive led)
signal main_key_num           : integer range 0 to 79;
signal main_key_pressed_n     : std_logic;
signal main_power_led         : std_logic;
signal main_power_led_col     : std_logic_vector(23 downto 0);
signal main_drive_led         : std_logic;
signal main_drive_led_col     : std_logic_vector(23 downto 0);

-- QNICE On Screen Menu selections
signal main_osm_control_m     : std_logic_vector(255 downto 0);

-- QNICE general purpose register
signal main_qnice_gp_reg      : std_logic_vector(255 downto 0);

-- signed audio from the core
-- if the core outputs unsigned audio, make sure you convert properly to prevent a loss in audio quality
signal main_audio_l           : signed(15 downto 0);
signal main_audio_r           : signed(15 downto 0);

-- Video output from Core
signal video_clk              : std_logic;
signal video_rst              : std_logic;
signal video_ce               : std_logic;
signal video_ce_ovl           : std_logic;
signal video_red              : std_logic_vector(7 downto 0);
signal video_green            : std_logic_vector(7 downto 0);
signal video_blue             : std_logic_vector(7 downto 0);
signal video_vs               : std_logic;
signal video_hs               : std_logic;
signal video_hblank           : std_logic;
signal video_vblank           : std_logic;

-- Joysticks and Paddles
signal main_joy1_up_n         : std_logic;
signal main_joy1_down_n       : std_logic;
signal main_joy1_left_n       : std_logic;
signal main_joy1_right_n      : std_logic;
signal main_joy1_fire_n       : std_logic;

signal main_joy2_up_n         : std_logic;
signal main_joy2_down_n       : std_logic;
signal main_joy2_left_n       : std_logic;
signal main_joy2_right_n      : std_logic;
signal main_joy2_fire_n       : std_logic;

signal main_pot1_x            : std_logic_vector(7 downto 0);
signal main_pot1_y            : std_logic_vector(7 downto 0);
signal main_pot2_x            : std_logic_vector(7 downto 0);
signal main_pot2_y            : std_logic_vector(7 downto 0);

---------------------------------------------------------------------------------------------
-- HyperRAM clock domain
---------------------------------------------------------------------------------------------

signal hr_clk                 : std_logic;
signal hr_rst                 : std_logic;
signal hr_core_write          : std_logic;
signal hr_core_read           : std_logic;
signal hr_core_address        : std_logic_vector(31 downto 0);
signal hr_core_writedata      : std_logic_vector(15 downto 0);
signal hr_core_byteenable     : std_logic_vector(1 downto 0);
signal hr_core_burstcount     : std_logic_vector(7 downto 0);
signal hr_core_readdata       : std_logic_vector(15 downto 0);
signal hr_core_readdatavalid  : std_logic;
signal hr_core_waitrequest    : std_logic;
signal hr_low                 : std_logic;
signal hr_high                : std_logic;

---------------------------------------------------------------------------------------------
-- qnice_clk
---------------------------------------------------------------------------------------------

-- Video and audio mode control
signal qnice_dvi              : std_logic;
signal qnice_video_mode       : natural range 0 to 3;
signal qnice_scandoubler      : std_logic;
signal qnice_csync            : std_logic;
signal qnice_audio_mute       : std_logic;
signal qnice_audio_filter     : std_logic;
signal qnice_zoom_crop        : std_logic;
signal qnice_ascal_mode       : std_logic_vector(1 downto 0);
signal qnice_ascal_polyphase  : std_logic;
signal qnice_ascal_triplebuf  : std_logic;
signal qnice_retro15kHz       : std_logic;
signal qnice_osm_cfg_scaling  : std_logic_vector(8 downto 0);

-- flip joystick ports
signal qnice_flip_joyports    : std_logic;

-- QNICE On Screen Menu selections
signal qnice_osm_control_m    : std_logic_vector(255 downto 0);

-- QNICE general purpose register
signal qnice_gp_reg           : std_logic_vector(255 downto 0);

-- QNICE MMIO 4k-segmented access to RAMs, ROMs and similarily behaving devices
-- ramrom_addr is 28-bit because we have a 16-bit window selector and a 4k window: 65536*4096 = 268.435.456 = 2^28
signal qnice_ramrom_dev       : std_logic_vector(15 downto 0);
signal qnice_ramrom_addr      : std_logic_vector(27 downto 0);
signal qnice_ramrom_data_o    : std_logic_vector(15 downto 0);
signal qnice_ramrom_data_i    : std_logic_vector(15 downto 0);
signal qnice_ramrom_ce        : std_logic;
signal qnice_ramrom_we        : std_logic;
signal qnice_ramrom_wait      : std_logic;

begin

   i_framework : entity work.framework
   port map (
      -- Connect to I/O ports
      CLK                     => CLK,
      max10_tx                => max10_tx,
      max10_rx                => max10_rx,
      max10_clkandsync        => max10_clkandsync,
      UART_RXD                => UART_RXD,
      UART_TXD                => UART_TXD,
      VGA_RED                 => VGA_RED,
      VGA_GREEN               => VGA_GREEN,
      VGA_BLUE                => VGA_BLUE,
      VGA_HS                  => VGA_HS,
      VGA_VS                  => VGA_VS,
      vdac_clk                => vdac_clk,
      vdac_sync_n             => vdac_sync_n,
      vdac_blank_n            => vdac_blank_n,
      tmds_data_p             => tmds_data_p,
      tmds_data_n             => tmds_data_n,
      tmds_clk_p              => tmds_clk_p,
      tmds_clk_n              => tmds_clk_n,
      kb_io0                  => kb_io0,
      kb_io1                  => kb_io1,
      kb_io2                  => kb_io2,
      SD_RESET                => SD_RESET,
      SD_CLK                  => SD_CLK,
      SD_MOSI                 => SD_MOSI,
      SD_MISO                 => SD_MISO,
      SD_CD                   => SD_CD,
      SD2_RESET               => SD2_RESET,
      SD2_CLK                 => SD2_CLK,
      SD2_MOSI                => SD2_MOSI,
      SD2_MISO                => SD2_MISO,
      SD2_CD                  => SD2_CD,
      pwm_l                   => pwm_l,
      pwm_r                   => pwm_r,
      joy_1_up_n              => joy_1_up_n,
      joy_1_down_n            => joy_1_down_n,
      joy_1_left_n            => joy_1_left_n,
      joy_1_right_n           => joy_1_right_n,
      joy_1_fire_n            => joy_1_fire_n,
      joy_2_up_n              => joy_2_up_n,
      joy_2_down_n            => joy_2_down_n,
      joy_2_left_n            => joy_2_left_n,
      joy_2_right_n           => joy_2_right_n,
      joy_2_fire_n            => joy_2_fire_n,
      paddle                  => paddle,
      paddle_drain            => paddle_drain,
      hr_d                    => hr_d,
      hr_rwds                 => hr_rwds,
      hr_reset                => hr_reset,
      hr_clk_p                => hr_clk_p,
      hr_cs0                  => hr_cs0,

      -- Connect to CORE
      qnice_clk_o             => qnice_clk,
      qnice_rst_o             => qnice_rst,
      reset_m2m_n_o           => reset_m2m_n,
      main_clk_i              => main_clk,
      main_rst_i              => main_rst,
      main_qnice_reset_o      => main_qnice_reset,
      main_qnice_pause_o      => main_qnice_pause,
      main_reset_m2m_o        => main_reset_m2m,
      main_reset_core_o       => main_reset_core,
      main_key_num_o          => main_key_num,
      main_key_pressed_n_o    => main_key_pressed_n,
      main_power_led_i        => main_power_led,
      main_power_led_col_i    => main_power_led_col,
      main_drive_led_i        => main_drive_led,
      main_drive_led_col_i    => main_drive_led_col,
      main_osm_control_m_o    => main_osm_control_m,
      main_qnice_gp_reg_o     => main_qnice_gp_reg,
      main_audio_l_i          => main_audio_l,
      main_audio_r_i          => main_audio_r,
      video_clk_i             => video_clk,
      video_rst_i             => video_rst,
      video_ce_i              => video_ce,
      video_ce_ovl_i          => video_ce_ovl,
      video_red_i             => video_red,
      video_green_i           => video_green,
      video_blue_i            => video_blue,
      video_vs_i              => video_vs,
      video_hs_i              => video_hs,
      video_hblank_i          => video_hblank,
      video_vblank_i          => video_vblank,
      main_joy1_up_n_o        => main_joy1_up_n,
      main_joy1_down_n_o      => main_joy1_down_n,
      main_joy1_left_n_o      => main_joy1_left_n,
      main_joy1_right_n_o     => main_joy1_right_n,
      main_joy1_fire_n_o      => main_joy1_fire_n,
      main_joy2_up_n_o        => main_joy2_up_n,
      main_joy2_down_n_o      => main_joy2_down_n,
      main_joy2_left_n_o      => main_joy2_left_n,
      main_joy2_right_n_o     => main_joy2_right_n,
      main_joy2_fire_n_o      => main_joy2_fire_n,
      main_pot1_x_o           => main_pot1_x,
      main_pot1_y_o           => main_pot1_y,
      main_pot2_x_o           => main_pot2_x,
      main_pot2_y_o           => main_pot2_y,

      -- Provide HyperRAM to core (in HyperRAM clock domain)
      hr_clk_o                => hr_clk,
      hr_rst_o                => hr_rst,
      hr_core_write_i         => hr_core_write,
      hr_core_read_i          => hr_core_read,
      hr_core_address_i       => hr_core_address,
      hr_core_writedata_i     => hr_core_writedata,
      hr_core_byteenable_i    => hr_core_byteenable,
      hr_core_burstcount_i    => hr_core_burstcount,
      hr_core_readdata_o      => hr_core_readdata,
      hr_core_readdatavalid_o => hr_core_readdatavalid,
      hr_core_waitrequest_o   => hr_core_waitrequest,
      hr_high_o               => hr_high,
      hr_low_o                => hr_low,

      -- Connect to QNICE
      qnice_dvi_i             => qnice_dvi,
      qnice_video_mode_i      => qnice_video_mode,
      qnice_scandoubler_i     => qnice_scandoubler,
      qnice_csync_i           => qnice_csync,
      qnice_audio_mute_i      => qnice_audio_mute,
      qnice_audio_filter_i    => qnice_audio_filter,
      qnice_zoom_crop_i       => qnice_zoom_crop,
      qnice_osm_cfg_scaling_i => qnice_osm_cfg_scaling,
      qnice_retro15kHz_i      => qnice_retro15kHz,
      qnice_ascal_mode_i      => qnice_ascal_mode,
      qnice_ascal_polyphase_i => qnice_ascal_polyphase,
      qnice_ascal_triplebuf_i => qnice_ascal_triplebuf,
      qnice_flip_joyports_i   => qnice_flip_joyports,
      qnice_osm_control_m_o   => qnice_osm_control_m,
      qnice_gp_reg_o          => qnice_gp_reg,
      qnice_ramrom_dev_o      => qnice_ramrom_dev,
      qnice_ramrom_addr_o     => qnice_ramrom_addr,
      qnice_ramrom_data_out_o => qnice_ramrom_data_o,
      qnice_ramrom_data_in_i  => qnice_ramrom_data_i,
      qnice_ramrom_ce_o       => qnice_ramrom_ce,
      qnice_ramrom_we_o       => qnice_ramrom_we,
      qnice_ramrom_wait_i     => qnice_ramrom_wait
   ); -- i_framework


   ---------------------------------------------------------------------------------------------------------------
   -- MEGA65 Core including the MiSTer core: Multiple clock domains
   ---------------------------------------------------------------------------------------------------------------

   CORE : entity work.MEGA65_Core
      port map (
         CLK                     => CLK,
         RESET_M2M_N             => reset_m2m_n,

         -- Share clock and reset with the framework
         main_clk_o              => main_clk,            -- CORE's 54 MHz clock
         main_rst_o              => main_rst,            -- CORE's reset, synchronized

         --------------------------------------------------------------------------------------------------------
         -- QNICE Clock Domain
         --------------------------------------------------------------------------------------------------------

         -- Provide QNICE clock to the core: for the vdrives as well as for RAMs and ROMs
         qnice_clk_i             => qnice_clk,
         qnice_rst_i             => qnice_rst,

         -- Video and audio mode control
         qnice_dvi_o             => qnice_dvi,
         qnice_video_mode_o      => qnice_video_mode,
         qnice_scandoubler_o     => qnice_scandoubler,
         qnice_csync_o           => qnice_csync,
         qnice_audio_mute_o      => qnice_audio_mute,
         qnice_audio_filter_o    => qnice_audio_filter,
         qnice_zoom_crop_o       => qnice_zoom_crop,
         qnice_ascal_mode_o      => qnice_ascal_mode,
         qnice_ascal_polyphase_o => qnice_ascal_polyphase,
         qnice_ascal_triplebuf_o => qnice_ascal_triplebuf,
         qnice_retro15kHz_o      => qnice_retro15kHz,
         qnice_osm_cfg_scaling_o => qnice_osm_cfg_scaling,

         -- Flip joystick ports
         qnice_flip_joyports_o   => qnice_flip_joyports,

         -- On-Screen-Menu selections (in QNICE clock domain)
         qnice_osm_control_i     => qnice_osm_control_m,

         -- QNICE general purpose register
         qnice_gp_reg_i          => qnice_gp_reg,

         -- Core-specific devices
         qnice_dev_id_i          => qnice_ramrom_dev,
         qnice_dev_addr_i        => qnice_ramrom_addr,
         qnice_dev_data_i        => qnice_ramrom_data_o,
         qnice_dev_data_o        => qnice_ramrom_data_i,
         qnice_dev_ce_i          => qnice_ramrom_ce,
         qnice_dev_we_i          => qnice_ramrom_we,
         qnice_dev_wait_o        => qnice_ramrom_wait,

         --------------------------------------------------------------------------------------------------------
         -- Core Clock Domain
         --------------------------------------------------------------------------------------------------------

         -- M2M's reset manager provides 2 signals:
         --    m2m:   Reset the whole machine: Core and Framework
         --    core:  Only reset the core
         main_reset_m2m_i        => main_reset_m2m  or main_qnice_reset or main_rst,
         main_reset_core_i       => main_reset_core or main_qnice_reset,
         main_pause_core_i       => main_qnice_pause,

         -- On-Screen-Menu selections (in main clock domain)
         main_osm_control_i      => main_osm_control_m,

         -- QNICE general purpose register (in main clock domain)
         main_qnice_gp_reg_i     => main_qnice_gp_reg,

         -- Video output
         video_clk_o             => video_clk,
         video_rst_o             => video_rst,
         video_ce_o              => video_ce,
         video_ce_ovl_o          => video_ce_ovl,
         video_red_o             => video_red,
         video_green_o           => video_green,
         video_blue_o            => video_blue,
         video_vs_o              => video_vs,
         video_hs_o              => video_hs,
         video_hblank_o          => video_hblank,
         video_vblank_o          => video_vblank,

         -- Audio output (Signed PCM)
         main_audio_left_o       => main_audio_l,
         main_audio_right_o      => main_audio_r,

         -- M2M Keyboard interface
         main_kb_key_num_i       => main_key_num,
         main_kb_key_pressed_n_i => main_key_pressed_n,
         main_power_led_o        => main_power_led,
         main_power_led_col_o    => main_power_led_col,         
         main_drive_led_o        => main_drive_led,
         main_drive_led_col_o    => main_drive_led_col,

         -- Joysticks input
         main_joy_1_up_n_i       => main_joy1_up_n,
         main_joy_1_down_n_i     => main_joy1_down_n,
         main_joy_1_left_n_i     => main_joy1_left_n,
         main_joy_1_right_n_i    => main_joy1_right_n,
         main_joy_1_fire_n_i     => main_joy1_fire_n,

         main_joy_2_up_n_i       => main_joy2_up_n,
         main_joy_2_down_n_i     => main_joy2_down_n,
         main_joy_2_left_n_i     => main_joy2_left_n,
         main_joy_2_right_n_i    => main_joy2_right_n,
         main_joy_2_fire_n_i     => main_joy2_fire_n,

         main_pot1_x_i           => main_pot1_x,
         main_pot1_y_i           => main_pot1_y,
         main_pot2_x_i           => main_pot2_x,
         main_pot2_y_i           => main_pot2_y,

         --------------------------------------------------------------------------------------------------------
         -- Provide support for external memory (Avalon Memory Map)
         --------------------------------------------------------------------------------------------------------

         hr_clk_i                => hr_clk,
         hr_rst_i                => hr_rst,
         hr_core_write_o         => hr_core_write,
         hr_core_read_o          => hr_core_read,
         hr_core_address_o       => hr_core_address,
         hr_core_writedata_o     => hr_core_writedata,
         hr_core_byteenable_o    => hr_core_byteenable,
         hr_core_burstcount_o    => hr_core_burstcount,
         hr_core_readdata_i      => hr_core_readdata,
         hr_core_readdatavalid_i => hr_core_readdatavalid,
         hr_core_waitrequest_i   => hr_core_waitrequest,
         hr_high_i               => hr_high,
         hr_low_i                => hr_low
      ); -- CORE

end architecture synthesis;

