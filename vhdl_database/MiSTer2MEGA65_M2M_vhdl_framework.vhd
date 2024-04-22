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

entity framework is
port (
   CLK                     : in  std_logic;                  -- 100 MHz clock

   -- MAX10 FPGA (delivers reset)
   max10_tx                : in  std_logic;
   max10_rx                : out std_logic;
   max10_clkandsync        : out std_logic;

   -- Serial communication (rxd, txd only; rts/cts are not available)
   -- 115.200 baud, 8-N-1
   UART_RXD                : in  std_logic;                  -- receive data
   UART_TXD                : out std_logic;                  -- send data

   -- VGA
   VGA_RED                 : out std_logic_vector(7 downto 0);
   VGA_GREEN               : out std_logic_vector(7 downto 0);
   VGA_BLUE                : out std_logic_vector(7 downto 0);
   VGA_HS                  : out std_logic;
   VGA_VS                  : out std_logic;

   -- VDAC
   vdac_clk                : out std_logic;
   vdac_sync_n             : out std_logic;
   vdac_blank_n            : out std_logic;

   -- Digital Video (HDMI)
   tmds_data_p             : out std_logic_vector(2 downto 0);
   tmds_data_n             : out std_logic_vector(2 downto 0);
   tmds_clk_p              : out std_logic;
   tmds_clk_n              : out std_logic;

   -- MEGA65 smart keyboard controller
   kb_io0                  : out std_logic;                 -- clock to keyboard
   kb_io1                  : out std_logic;                 -- data output to keyboard
   kb_io2                  : in  std_logic;                 -- data input from keyboard

   -- SD Card (internal on bottom)
   SD_RESET                : out std_logic;
   SD_CLK                  : out std_logic;
   SD_MOSI                 : out std_logic;
   SD_MISO                 : in  std_logic;
   SD_CD                   : in  std_logic;

   -- SD Card (external on back)
   SD2_RESET               : out std_logic;
   SD2_CLK                 : out std_logic;
   SD2_MOSI                : out std_logic;
   SD2_MISO                : in  std_logic;
   SD2_CD                  : in  std_logic;

   -- 3.5mm analog audio jack
   pwm_l                   : out std_logic;
   pwm_r                   : out std_logic;

   -- Joysticks and Paddles
   joy_1_up_n              : in  std_logic;
   joy_1_down_n            : in  std_logic;
   joy_1_left_n            : in  std_logic;
   joy_1_right_n           : in  std_logic;
   joy_1_fire_n            : in  std_logic;

   joy_2_up_n              : in  std_logic;
   joy_2_down_n            : in  std_logic;
   joy_2_left_n            : in  std_logic;
   joy_2_right_n           : in  std_logic;
   joy_2_fire_n            : in  std_logic;

   paddle                  : in  std_logic_vector(3 downto 0);
   paddle_drain            : out std_logic;

   -- Built-in HyperRAM
   hr_d                    : inout std_logic_vector(7 downto 0);    -- Data/Address
   hr_rwds                 : inout std_logic;               -- RW Data strobe
   hr_reset                : out std_logic;                 -- Active low RESET line to HyperRAM
   hr_clk_p                : out std_logic;
   hr_cs0                  : out std_logic;

   -- Connect to CORE
   qnice_clk_o             : out std_logic;
   qnice_rst_o             : out std_logic;
   reset_m2m_n_o           : out std_logic;
   main_clk_i              : in  std_logic;
   main_rst_i              : in  std_logic;
   main_qnice_reset_o      : out std_logic;
   main_qnice_pause_o      : out std_logic;
   main_reset_m2m_o        : out std_logic;
   main_reset_core_o       : out std_logic;
   main_key_num_o          : out integer range 0 to 79;
   main_key_pressed_n_o    : out std_logic;
   main_power_led_i        : in  std_logic;
   main_power_led_col_i    : in  std_logic_vector(23 downto 0);
   main_drive_led_i        : in  std_logic;
   main_drive_led_col_i    : in  std_logic_vector(23 downto 0);
   main_osm_control_m_o    : out std_logic_vector(255 downto 0);
   main_qnice_gp_reg_o     : out std_logic_vector(255 downto 0);
   main_audio_l_i          : in  signed(15 downto 0);
   main_audio_r_i          : in  signed(15 downto 0);
   video_clk_i             : in  std_logic;
   video_rst_i             : in  std_logic;
   video_ce_i              : in  std_logic;
   video_ce_ovl_i          : in  std_logic;
   video_red_i             : in  std_logic_vector(7 downto 0);
   video_green_i           : in  std_logic_vector(7 downto 0);
   video_blue_i            : in  std_logic_vector(7 downto 0);
   video_vs_i              : in  std_logic;
   video_hs_i              : in  std_logic;
   video_hblank_i          : in  std_logic;
   video_vblank_i          : in  std_logic;
   main_joy1_up_n_o        : out std_logic;
   main_joy1_down_n_o      : out std_logic;
   main_joy1_left_n_o      : out std_logic;
   main_joy1_right_n_o     : out std_logic;
   main_joy1_fire_n_o      : out std_logic;
   main_joy2_up_n_o        : out std_logic;
   main_joy2_down_n_o      : out std_logic;
   main_joy2_left_n_o      : out std_logic;
   main_joy2_right_n_o     : out std_logic;
   main_joy2_fire_n_o      : out std_logic;
   main_pot1_x_o           : out std_logic_vector(7 downto 0);
   main_pot1_y_o           : out std_logic_vector(7 downto 0);
   main_pot2_x_o           : out std_logic_vector(7 downto 0);
   main_pot2_y_o           : out std_logic_vector(7 downto 0);

   -- Provide HyperRAM to core (in HyperRAM clock domain)
   hr_clk_o                : out std_logic;
   hr_rst_o                : out std_logic;
   hr_core_write_i         : in  std_logic;
   hr_core_read_i          : in  std_logic;
   hr_core_address_i       : in  std_logic_vector(31 downto 0);
   hr_core_writedata_i     : in  std_logic_vector(15 downto 0);
   hr_core_byteenable_i    : in  std_logic_vector(1 downto 0);
   hr_core_burstcount_i    : in  std_logic_vector(7 downto 0);
   hr_core_readdata_o      : out std_logic_vector(15 downto 0);
   hr_core_readdatavalid_o : out std_logic;
   hr_core_waitrequest_o   : out std_logic;
   hr_high_o               : out std_logic; -- Core is too fast
   hr_low_o                : out std_logic; -- Core is too slow

   -- QNICE control signals
   qnice_dvi_i             : in  std_logic;
   qnice_video_mode_i      : in  natural range 0 to 3;
   qnice_osm_cfg_scaling_i : in  std_logic_vector(8 downto 0);
   qnice_retro15kHz_i      : in  std_logic;
   qnice_scandoubler_i     : in  std_logic;
   qnice_csync_i           : in  std_logic;
   qnice_audio_mute_i      : in  std_logic;
   qnice_audio_filter_i    : in  std_logic;
   qnice_zoom_crop_i       : in  std_logic;
   qnice_ascal_mode_i      : in  std_logic_vector(1 downto 0);
   qnice_ascal_polyphase_i : in  std_logic;
   qnice_ascal_triplebuf_i : in  std_logic;
   qnice_flip_joyports_i   : in  std_logic;
   qnice_osm_control_m_o   : out std_logic_vector(255 downto 0);
   qnice_gp_reg_o          : out std_logic_vector(255 downto 0);

   -- QNICE device management
   qnice_ramrom_dev_o      : out std_logic_vector(15 downto 0);
   qnice_ramrom_addr_o     : out std_logic_vector(27 downto 0);
   qnice_ramrom_data_out_o : out std_logic_vector(15 downto 0);
   qnice_ramrom_data_in_i  : in  std_logic_vector(15 downto 0);
   qnice_ramrom_ce_o       : out std_logic;
   qnice_ramrom_we_o       : out std_logic;
   qnice_ramrom_wait_i     : in  std_logic
);
end entity framework;

architecture synthesis of framework is

---------------------------------------------------------------------------------------------
-- Constants
---------------------------------------------------------------------------------------------

-- HDMI 1280x720 @ 50 Hz resolution = mode 0, 1280x720 @ 60 Hz resolution = mode 1, PAL 576p in 4:3 and 5:4 are modes 2 and 3
constant VIDEO_MODE_VECTOR    : video_modes_vector(0 to 3) := (C_HDMI_720p_50, C_HDMI_720p_60, C_HDMI_576p_50, C_HDMI_576p_50);

-- Devices: MiSTer2MEGA framework
constant C_DEV_VRAM_DATA      : std_logic_vector(15 downto 0) := x"0000";
constant C_DEV_VRAM_ATTR      : std_logic_vector(15 downto 0) := x"0001";
constant C_DEV_OSM_CONFIG     : std_logic_vector(15 downto 0) := x"0002";
constant C_DEV_ASCAL_PPHASE   : std_logic_vector(15 downto 0) := x"0003";
constant C_DEV_HYPERRAM       : std_logic_vector(15 downto 0) := x"0004";
constant C_DEV_SYS_INFO       : std_logic_vector(15 downto 0) := x"00FF";

-- SysInfo record numbers
constant C_SYS_DRIVES         : std_logic_vector(15 downto 0) := x"0000";
constant C_SYS_VGA            : std_logic_vector(15 downto 0) := x"0010";
constant C_SYS_HDMI           : std_logic_vector(15 downto 0) := x"0011";
constant C_SYS_CRTSANDROMS    : std_logic_vector(15 downto 0) := x"0020";
constant C_SYS_CORE           : std_logic_vector(15 downto 0) := x"0030";

---------------------------------------------------------------------------------------------
-- Clocks and active high reset signals for each clock domain
---------------------------------------------------------------------------------------------

signal qnice_clk              : std_logic;               -- QNICE main clock @ 50 MHz
signal hr_clk_x1              : std_logic;               -- HyperRAM @ 100 MHz
signal hr_clk_x2              : std_logic;               -- HyperRAM @ 200 MHz
signal hr_clk_x2_del          : std_logic;               -- HyperRAM @ 200 MHz phase delayed
signal audio_clk              : std_logic;               -- Audio clock @ 60 MHz
signal tmds_clk               : std_logic;               -- HDMI pixel clock at 5x speed for TMDS @ 371.25 MHz
signal hdmi_clk               : std_logic;               -- HDMI pixel clock at normal speed @ 74.25 MHz
signal sys_pps                : std_logic;               -- One pulse per second

signal qnice_rst              : std_logic;
signal hr_rst                 : std_logic;
signal audio_rst              : std_logic;
signal hdmi_rst               : std_logic;

---------------------------------------------------------------------------------------------
-- Reset Control
---------------------------------------------------------------------------------------------

signal reset_n                : std_logic;
signal reset_n_dbnce          : std_logic;
signal reset_core_n           : std_logic;

--------------------------------------------------------------------------------------------
-- main_clk_i (MiSTer core's clock)
---------------------------------------------------------------------------------------------

-- QNICE control and status register
signal main_csr_keyboard_on   : std_logic;
signal main_csr_joy1_on       : std_logic;
signal main_csr_joy2_on       : std_logic;

-- keyboard handling
signal main_qnice_keys_n      : std_logic_vector(15 downto 0);

--- control signals from QNICE in main's clock domain
signal main_flip_joyports     : std_logic;

---------------------------------------------------------------------------------------------
-- audio_clk
---------------------------------------------------------------------------------------------

signal audio_left             : std_logic_vector(15 downto 0);
signal audio_right            : std_logic_vector(15 downto 0);

---------------------------------------------------------------------------------------------
-- qnice_clk
---------------------------------------------------------------------------------------------

-- Device management
signal qnice_ramrom_data_in          : std_logic_vector(15 downto 0);
signal qnice_ramrom_data_in_hyperram : std_logic_vector(15 downto 0);
signal qnice_ramrom_wait             : std_logic;
signal qnice_ramrom_wait_hyperram    : std_logic;
signal qnice_ramrom_ce_hyperram      : std_logic;
signal qnice_ramrom_address          : std_logic_vector(31 downto 0);

-- Control and status register that QNICE uses to control the Core
signal qnice_csr_reset        : std_logic;
signal qnice_csr_pause        : std_logic;
signal qnice_csr_keyboard_on  : std_logic;
signal qnice_csr_joy1_on      : std_logic;
signal qnice_csr_joy2_on      : std_logic;

-- ascal.vhd mode register and polyphase filter handling
signal qnice_ascal_mode       : std_logic_vector(4 downto 0);  -- name qnice_ascal_mode is already taken
signal qnice_poly_wr          : std_logic;

-- VRAM
signal qnice_vram_data        : std_logic_vector(15 downto 0);
signal qnice_vram_we          : std_logic;   -- Writing to bits 7-0
signal qnice_vram_attr_we     : std_logic;   -- Writing to bits 15-8

-- On-Screen-Menu (OSM)
signal qnice_osm_cfg_enable   : std_logic;
signal qnice_osm_cfg_xy       : std_logic_vector(15 downto 0);
signal qnice_osm_cfg_dxdy     : std_logic_vector(15 downto 0);
signal qnice_hdmax            : std_logic_vector(11 downto 0);
signal qnice_vdmax            : std_logic_vector(11 downto 0);
signal qnice_clk_sel          : std_logic;

signal qnice_h_pixels         : std_logic_vector(11 downto 0); -- horizontal visible display width in pixels
signal qnice_v_pixels         : std_logic_vector(11 downto 0); -- horizontal visible display width in pixels
signal qnice_h_pulse          : std_logic_vector(11 downto 0); -- horizontal sync pulse width in pixels
signal qnice_h_bp             : std_logic_vector(11 downto 0); -- horizontal back porch width in pixels
signal qnice_h_fp             : std_logic_vector(11 downto 0); -- horizontal front porch width in pixels
signal qnice_v_pulse          : std_logic_vector(11 downto 0); -- horizontal sync pulse width in pixels
signal qnice_v_bp             : std_logic_vector(11 downto 0); -- horizontal back porch width in pixels
signal qnice_v_fp             : std_logic_vector(11 downto 0); -- horizontal front porch width in pixels
signal qnice_h_freq           : std_logic_vector(15 downto 0); -- horizontal sync frequency

-- m2m_keyb output for the firmware and the Shell; see also sysdef.asm
signal qnice_qnice_keys_n     : std_logic_vector(15 downto 0);

-- Shell configuration (config.vhd)
signal qnice_config_data      : std_logic_vector(15 downto 0);

-- Paddles in 50 MHz clock domain which happens to be QNICE's
signal qnice_pot1_x           : unsigned(7 downto 0);
signal qnice_pot1_y           : unsigned(7 downto 0);
signal qnice_pot2_x           : unsigned(7 downto 0);
signal qnice_pot2_y           : unsigned(7 downto 0);

signal qnice_pot1_x_n         : unsigned(7 downto 0);
signal qnice_pot1_y_n         : unsigned(7 downto 0);
signal qnice_pot2_x_n         : unsigned(7 downto 0);
signal qnice_pot2_y_n         : unsigned(7 downto 0);

signal qnice_avm_write         : std_logic;
signal qnice_avm_read          : std_logic;
signal qnice_avm_address       : std_logic_vector(31 downto 0);
signal qnice_avm_writedata     : std_logic_vector(15 downto 0);
signal qnice_avm_byteenable    : std_logic_vector(1 downto 0);
signal qnice_avm_burstcount    : std_logic_vector(7 downto 0);
signal qnice_avm_readdata      : std_logic_vector(15 downto 0);
signal qnice_avm_readdatavalid : std_logic;
signal qnice_avm_waitrequest   : std_logic;

---------------------------------------------------------------------------------------------
-- HyperRAM
---------------------------------------------------------------------------------------------

-- Digital pipeline's signals to the HyperRAM arbiter
signal hr_dig_write           : std_logic;
signal hr_dig_read            : std_logic;
signal hr_dig_address         : std_logic_vector(31 downto 0) := (others => '0');
signal hr_dig_writedata       : std_logic_vector(15 downto 0);
signal hr_dig_byteenable      : std_logic_vector(1 downto 0);
signal hr_dig_burstcount      : std_logic_vector(7 downto 0);
signal hr_dig_readdata        : std_logic_vector(15 downto 0);
signal hr_dig_readdatavalid   : std_logic;
signal hr_dig_waitrequest     : std_logic;

signal hr_qnice_write         : std_logic;
signal hr_qnice_read          : std_logic;
signal hr_qnice_address       : std_logic_vector(31 downto 0) := (others => '0');
signal hr_qnice_writedata     : std_logic_vector(15 downto 0);
signal hr_qnice_byteenable    : std_logic_vector(1 downto 0);
signal hr_qnice_burstcount    : std_logic_vector(7 downto 0);
signal hr_qnice_readdata      : std_logic_vector(15 downto 0);
signal hr_qnice_readdatavalid : std_logic;
signal hr_qnice_waitrequest   : std_logic;

-- HyperRAM controller
signal hr_write               : std_logic;
signal hr_read                : std_logic;
signal hr_address             : std_logic_vector(31 downto 0) := (others => '0');
signal hr_writedata           : std_logic_vector(15 downto 0);
signal hr_byteenable          : std_logic_vector(1 downto 0);
signal hr_burstcount          : std_logic_vector(7 downto 0);
signal hr_readdata            : std_logic_vector(15 downto 0);
signal hr_readdatavalid       : std_logic;
signal hr_waitrequest         : std_logic;

-- Physical layer
signal hr_rwds_in             : std_logic;
signal hr_rwds_out            : std_logic;
signal hr_rwds_oe             : std_logic;   -- Output enable for RWDS
signal hr_dq_in               : std_logic_vector(7 downto 0);
signal hr_dq_out              : std_logic_vector(7 downto 0);
signal hr_dq_oe               : std_logic;   -- Output enable for DQ

begin

   hr_clk_o    <= hr_clk_x1;
   hr_rst_o    <= hr_rst;

   qnice_clk_o <= qnice_clk;
   qnice_rst_o <= qnice_rst;

   -----------------------------------------------------------------------------------------
   -- MAX10 FPGA handling: extract reset signal
   -----------------------------------------------------------------------------------------

   MAX10 : entity work.max10
      port map (
         pixelclock        => CLK,
         cpuclock          => CLK,
         led               => open,

         max10_rx          => max10_rx,
         max10_tx          => max10_tx,
         max10_clkandsync  => max10_clkandsync,

         max10_fpga_commit => open,
         max10_fpga_date   => open,
         reset_button      => reset_n,
         dipsw             => open,
         j21in             => open,
         j21ddr            => (others => '0'),
         j21out            => (others => '0')
      );

   -- 20 ms stable time for the reset button
   i_reset_debouncer : entity work.debounce
      generic map(initial => '1', clk_freq => BOARD_CLK_SPEED, stable_time => 20)
      port map (clk => CLK, reset_n => '1', button => reset_n, result => reset_n_dbnce);

   ---------------------------------------------------------------------------------------------------------------
   -- Generate clocks and reset signals
   ---------------------------------------------------------------------------------------------------------------

   -- video modes 0 and 1 needs hdmi_clk_sel_i to be '0', 2 and 3 to be '1'
   qnice_clk_sel <= '1' when qnice_video_mode_i >= 2 else '0';

   i_clk_m2m : entity work.clk_m2m
      port map (
         sys_clk_i       => CLK,
         sys_rstn_i      => reset_m2m_n_o,      -- reset everything
         core_rstn_i     => reset_core_n,       -- reset only the core (means the HyperRAM needs to be reset, too)
         qnice_clk_o     => qnice_clk,
         qnice_rst_o     => qnice_rst,
         hr_clk_x1_o     => hr_clk_x1,
         hr_clk_x2_o     => hr_clk_x2,
         hr_clk_x2_del_o => hr_clk_x2_del,
         hr_rst_o        => hr_rst,
         hdmi_clk_sel_i  => qnice_clk_sel,
         tmds_clk_o      => tmds_clk,
         hdmi_clk_o      => hdmi_clk,
         hdmi_rst_o      => hdmi_rst,
         audio_clk_o     => audio_clk,
         audio_rst_o     => audio_rst,
         sys_pps_o       => sys_pps
      ); -- i_clk_m2m

   ---------------------------------------------------------------------------------------------------------------
   -- Board Clock Domain: CLK
   ---------------------------------------------------------------------------------------------------------------

   i_reset_manager : entity work.reset_manager
      generic map (
         BOARD_CLK_SPEED => BOARD_CLK_SPEED
      )
      port map (
         CLK            => CLK,
         RESET_N        => reset_n_dbnce,
         reset_m2m_n_o  => reset_m2m_n_o,
         reset_core_n_o => reset_core_n
      ); -- i_reset_manager

   ---------------------------------------------------------------------------------------------------------------
   -- Core Clock Domain: main_clk_i
   ---------------------------------------------------------------------------------------------------------------

   i_joy_debouncer : entity work.debouncer
      generic map (
         CLK_FREQ             => CORE_CLK_SPEED
      )
      port map (
         clk                  => main_clk_i,
         reset_n              => not main_rst_i,

         flip_joys_i          => main_flip_joyports,
         joy_1_on             => main_csr_joy1_on,
         joy_2_on             => main_csr_joy2_on,

         joy_1_up_n           => joy_1_up_n,
         joy_1_down_n         => joy_1_down_n,
         joy_1_left_n         => joy_1_left_n,
         joy_1_right_n        => joy_1_right_n,
         joy_1_fire_n         => joy_1_fire_n,

         dbnce_joy1_up_n      => main_joy1_up_n_o,
         dbnce_joy1_down_n    => main_joy1_down_n_o,
         dbnce_joy1_left_n    => main_joy1_left_n_o,
         dbnce_joy1_right_n   => main_joy1_right_n_o,
         dbnce_joy1_fire_n    => main_joy1_fire_n_o,

         joy_2_up_n           => joy_2_up_n,
         joy_2_down_n         => joy_2_down_n,
         joy_2_left_n         => joy_2_left_n,
         joy_2_right_n        => joy_2_right_n,
         joy_2_fire_n         => joy_2_fire_n,

         dbnce_joy2_up_n      => main_joy2_up_n_o,
         dbnce_joy2_down_n    => main_joy2_down_n_o,
         dbnce_joy2_left_n    => main_joy2_left_n_o,
         dbnce_joy2_right_n   => main_joy2_right_n_o,
         dbnce_joy2_fire_n    => main_joy2_fire_n_o
      ); -- i_joy_debouncer

   -- M2M keyboard driver that outputs two distinct keyboard states: key_* for being used by the core and qnice_* for the firmware/Shell
   i_m2m_keyb : entity work.m2m_keyb
      port map (
         clk_main_i           => main_clk_i,
         clk_main_speed_i     => CORE_CLK_SPEED,

         -- interface to the MEGA65 keyboard controller
         kio8_o               => kb_io0,
         kio9_o               => kb_io1,
         kio10_i              => kb_io2,

         -- interface to the core
         enable_core_i        => main_csr_keyboard_on,
         key_num_o            => main_key_num_o,
         key_pressed_n_o      => main_key_pressed_n_o,

         -- control the drive led on the MEGA65 keyboard
         power_led_i          => main_power_led_i,
         power_led_col_i      => main_power_led_col_i,
         drive_led_i          => main_drive_led_i,
         drive_led_col_i      => main_drive_led_col_i,

         -- interface to QNICE: used by the firmware and the Shell
         qnice_keys_n_o       => main_qnice_keys_n
      ); -- i_m2m_keyb

   ---------------------------------------------------------------------------------------------------------------
   -- QNICE Clock Domain: qnice_clk
   ---------------------------------------------------------------------------------------------------------------

   -- QNICE Co-Processor (System-on-a-Chip) for On-Screen-Menu, Disk mounting/virtual drives, ROM loading, etc.
   QNICE_SOC : entity work.QNICE
      generic map (
         G_FIRMWARE              => QNICE_FIRMWARE,
         G_VGA_DX                => VGA_DX,
         G_VGA_DY                => VGA_DY,
         G_FONT_DX               => FONT_DX,
         G_FONT_DY               => FONT_DY
      )
      port map (
         clk50_i                 => qnice_clk,
         reset_n_i               => not qnice_rst,

         -- serial communication (rxd, txd only; rts/cts are not available)
         -- 115.200 baud, 8-N-1
         uart_rxd_i              => UART_RXD,
         uart_txd_o              => UART_TXD,

         -- SD Card (internal on bottom)
         sd_reset_o              => SD_RESET,
         sd_clk_o                => SD_CLK,
         sd_mosi_o               => SD_MOSI,
         sd_miso_i               => SD_MISO,
         sd_cd_i                 => SD_CD,

         -- SD Card (external on back)
         sd2_reset_o             => SD2_RESET,
         sd2_clk_o               => SD2_CLK,
         sd2_mosi_o              => SD2_MOSI,
         sd2_miso_i              => SD2_MISO,
         sd2_cd_i                => SD2_CD,

         -- QNICE public registers
         csr_reset_o             => qnice_csr_reset,
         csr_pause_o             => qnice_csr_pause,
         csr_osm_o               => qnice_osm_cfg_enable,
         csr_keyboard_o          => qnice_csr_keyboard_on,
         csr_joy1_o              => qnice_csr_joy1_on,
         csr_joy2_o              => qnice_csr_joy2_on,
         osm_xy_o                => qnice_osm_cfg_xy,
         osm_dxdy_o              => qnice_osm_cfg_dxdy,

         ascal_mode_i            => "0" & qnice_ascal_triplebuf_i & qnice_ascal_polyphase_i & qnice_ascal_mode_i,
         ascal_mode_o            => qnice_ascal_mode,

         -- Keyboard input for the firmware and Shell (see sysdef.asm)
         keys_n_i                => qnice_qnice_keys_n,

         -- 256-bit General purpose control flags
         -- "d" = directly controled by the firmware
         -- "m" = indirectly controled by the menu system
         control_d_o             => qnice_gp_reg_o,
         control_m_o             => qnice_osm_control_m_o,

         -- 16-bit special-purpose and 16-bit general-purpose input flags
         -- Special-purpose flags are having a given semantic when the "Shell" firmware is running,
         -- but right now they are reserved and not used, yet.
         special_i               => (others => '0'),
         general_i               => (others => '0'),

         -- QNICE MMIO 4k-segmented access to RAMs, ROMs and similarily behaving devices
         -- ramrom_dev_o: 0 = VRAM data, 1 = VRAM attributes, > 256 = free to be used for any "RAM like" device
         -- ramrom_addr_o is 28-bit because we have a 16-bit window selector and a 4k window: 65536*4096 = 268.435.456 = 2^28
         ramrom_dev_o            => qnice_ramrom_dev_o,
         ramrom_addr_o           => qnice_ramrom_addr_o,
         ramrom_data_o           => qnice_ramrom_data_out_o,
         ramrom_data_i           => qnice_ramrom_data_in,
         ramrom_ce_o             => qnice_ramrom_ce_o,
         ramrom_wait_i           => qnice_ramrom_wait,
         ramrom_we_o             => qnice_ramrom_we_o
      ); -- QNICE_SOC

   -- Shell configuration file config.vhd
   shell_cfg : entity work.config
      port map (
         clk_i                   => qnice_clk,
         -- bits 27 .. 12:    select configuration data block; called "Selector" hereafter
         -- bits 11 downto 0: address the up to 4k the configuration data
         address_i               => qnice_ramrom_addr_o,

         -- config data
         data_o                  => qnice_config_data
      ); -- shell_cfg

   -- QNICE devices selected via qnice_ramrom_dev
   --    Devices with IDs < x"0100" are framework devices
   --    All others are user specific / core specific devices
   -- (refer to M2M/rom/sysdef.asm for a memory map and more details)
   qnice_ramrom_devices : process(all)
      variable strpos      : natural;
      variable current_chr : std_logic_vector(15 downto 0);
   begin
      qnice_ramrom_ce_hyperram <= '0';
      qnice_ramrom_data_in     <= x"EEEE";
      qnice_ramrom_wait        <= '0';
      qnice_vram_we            <= '0';
      qnice_vram_attr_we       <= '0';
      qnice_poly_wr            <= '0';

      -----------------------------------
      -- Framework devices
      -----------------------------------
      if qnice_ramrom_dev_o < x"0100" then
         case qnice_ramrom_dev_o is

            -- On-Screen-Menu (OSM) video ram data and attributes
            when C_DEV_VRAM_DATA =>
               qnice_vram_we              <= qnice_ramrom_we_o;
               qnice_ramrom_data_in       <= x"00" & qnice_vram_data(7 downto 0);
            when C_DEV_VRAM_ATTR =>
               qnice_vram_attr_we         <= qnice_ramrom_we_o;
               qnice_ramrom_data_in       <= x"00" & qnice_vram_data(15 downto 8);

            -- Shell configuration data (config.vhd)
            when C_DEV_OSM_CONFIG =>
               qnice_ramrom_data_in       <= qnice_config_data;

            -- ascal.vhd's polyphase handling
            when C_DEV_ASCAL_PPHASE =>
               qnice_ramrom_data_in       <= x"EEEE"; -- write-only
               qnice_poly_wr              <= qnice_ramrom_we_o;

            -- HyperRAM access
            when C_DEV_HYPERRAM =>
               qnice_ramrom_ce_hyperram   <= qnice_ramrom_ce_o;
               qnice_ramrom_data_in       <= qnice_ramrom_data_in_hyperram;
               qnice_ramrom_wait          <= qnice_ramrom_wait_hyperram;

            -- Read-only System Info (constants are defined in sysdef.asm)
            when C_DEV_SYS_INFO =>
               case qnice_ramrom_addr_o(27 downto 12) is

                  -- Virtual drives
                  when C_SYS_DRIVES =>
                     case qnice_ramrom_addr_o(11 downto 0) is
                        when x"000" => qnice_ramrom_data_in <= std_logic_vector(to_unsigned(C_VDNUM, 16));
                        when x"001" => qnice_ramrom_data_in <= C_VD_DEVICE;

                        when others =>
                           if qnice_ramrom_addr_o(11 downto 4) = x"10" then
                              qnice_ramrom_data_in <= C_VD_BUFFER(to_integer(unsigned(qnice_ramrom_addr_o(3 downto 0))));
                           end if;
                     end case;

                  -- Simulated cartridges and ROMs
                  when C_SYS_CRTSANDROMS =>
                     if qnice_ramrom_addr_o(11 downto 0) = x"000" then
                        qnice_ramrom_data_in <= std_logic_vector(to_unsigned(C_CRTROMS_MAN_NUM, 16));
                     elsif qnice_ramrom_addr_o(11 downto 0) = x"001" then
                        qnice_ramrom_data_in <= std_logic_vector(to_unsigned(C_CRTROMS_AUTO_NUM, 16));
                     elsif qnice_ramrom_addr_o(11 downto 8) = x"1" then
                        qnice_ramrom_data_in <= C_CRTROMS_MAN(to_integer(unsigned(qnice_ramrom_addr_o(7 downto 0))));
                     elsif qnice_ramrom_addr_o(11 downto 8) = x"2" then
                        qnice_ramrom_data_in <= C_CRTROMS_AUTO(to_integer(unsigned(qnice_ramrom_addr_o(7 downto 0))));
                     elsif qnice_ramrom_addr_o(11 downto 8) >= x"3" then
                        strpos := to_integer(unsigned(qnice_ramrom_addr_o(15 downto 0))) - 16#7300# + 1;
                        qnice_ramrom_data_in <= std_logic_vector(to_unsigned(character'pos(C_CRTROMS_AUTO_NAMES(strpos)), 16));
                     end if;

                  -- Graphics card VGA
                  when C_SYS_VGA =>
                     case qnice_ramrom_addr_o(11 downto 0) is
                        -- SYS_DXDY
                        when X"000" => qnice_ramrom_data_in <= std_logic_vector(to_unsigned((VGA_DX/FONT_DX) * 256 + (VGA_DY/FONT_DY), 16));

                        -- SHELL_M_XY: Always start at the top/left corner
                        when X"001" => qnice_ramrom_data_in <= x"0000";

                        -- SHELL_M_DXDY: Use full screen
                        when X"002" => qnice_ramrom_data_in <= std_logic_vector(to_unsigned((VGA_DX/FONT_DX) * 256 + (VGA_DY/FONT_DY), 16));

                        when others => null;
                     end case;

                  -- Graphics card HDMI
                  when C_SYS_HDMI =>
                     case qnice_ramrom_addr_o(11 downto 0) is
                        -- SYS_DXDY
                        when X"000" => qnice_ramrom_data_in <= std_logic_vector(to_unsigned((VGA_DX/FONT_DX) * 256 + (VGA_DY/FONT_DY), 16));

                        -- SHELL_M_XY: Always start at the top/left corner
                        when X"001" => qnice_ramrom_data_in <= x"0000";

                        -- SHELL_M_DXDY: Use full screen
                        when X"002" => qnice_ramrom_data_in <= std_logic_vector(to_unsigned((VGA_DX/FONT_DX) * 256 + (VGA_DY/FONT_DY), 16));

                        when others => null;
                     end case;

                  -- Info about the core
                  when C_SYS_CORE =>
                     case qnice_ramrom_addr_o(11 downto 0) is
                        -- CORE_X: Horizontal size of core display
                        when X"000" => qnice_ramrom_data_in <= "0000" & qnice_hdmax;

                        -- CORE_Y: Vertical size of core display
                        when X"001" => qnice_ramrom_data_in <= "0000" & qnice_vdmax;

                        -- CORE_H_PIXELS:
                        when X"002" => qnice_ramrom_data_in <= "0000" & qnice_h_pixels;

                        -- CORE_V_PIXELS:
                        when X"003" => qnice_ramrom_data_in <= "0000" & qnice_v_pixels;

                        -- CORE_H_PULSE:
                        when X"004" => qnice_ramrom_data_in <= "0000" & qnice_h_pulse;

                        -- CORE_H_BP:
                        when X"005" => qnice_ramrom_data_in <= "0000" & qnice_h_bp;

                        -- CORE_H_FP:
                        when X"006" => qnice_ramrom_data_in <= "0000" & qnice_h_fp;

                        -- CORE_V_PULSE:
                        when X"007" => qnice_ramrom_data_in <= "0000" & qnice_v_pulse;

                        -- CORE_V_BP:
                        when X"008" => qnice_ramrom_data_in <= "0000" & qnice_v_bp;

                        -- CORE_V_FP:
                        when X"009" => qnice_ramrom_data_in <= "0000" & qnice_v_fp;

                        -- CORE_H_FREQ:
                        when X"00A" => qnice_ramrom_data_in <= qnice_h_freq;

                        when others => null;
                     end case;

                  when others => null;
               end case;
            when others => null;
         end case;

      -----------------------------------
      -- User/core specific devices
      -----------------------------------
      else
         qnice_ramrom_data_in <= qnice_ramrom_data_in_i;
         qnice_ramrom_wait    <= qnice_ramrom_wait_i;
      end if;
   end process qnice_ramrom_devices;

   qnice_ramrom_address <= "10000" & qnice_ramrom_addr_o(26 downto 0) when qnice_ramrom_addr_o(27) = '1'
                      else "000000000" & qnice_ramrom_addr_o(22 downto 0);

   i_qnice2hyperram : entity work.qnice2hyperram
      port map (
         clk_i                 => qnice_clk,
         rst_i                 => qnice_rst,
         s_qnice_wait_o        => qnice_ramrom_wait_hyperram,
         s_qnice_address_i     => qnice_ramrom_address,
         s_qnice_cs_i          => qnice_ramrom_ce_hyperram,
         s_qnice_write_i       => qnice_ramrom_we_o,
         s_qnice_writedata_i   => qnice_ramrom_data_out_o,
         s_qnice_byteenable_i  => "11",
         s_qnice_readdata_o    => qnice_ramrom_data_in_hyperram,
         m_avm_write_o         => qnice_avm_write,
         m_avm_read_o          => qnice_avm_read,
         m_avm_address_o       => qnice_avm_address,
         m_avm_writedata_o     => qnice_avm_writedata,
         m_avm_byteenable_o    => qnice_avm_byteenable,
         m_avm_burstcount_o    => qnice_avm_burstcount,
         m_avm_readdata_i      => qnice_avm_readdata,
         m_avm_readdatavalid_i => qnice_avm_readdatavalid,
         m_avm_waitrequest_i   => qnice_avm_waitrequest
      ); -- i_qnice2hyperram

   -- Generate the paddle readings (mouse not supported, yet)
   -- Works with 50 MHz, which happens to be the QNICE clock domain
   i_mouse_paddles: entity work.mouse_input
      port map (
         clk                     => qnice_clk,

         mouse_debug             => open,
         amiga_mouse_enable_a    => '0',
         amiga_mouse_enable_b    => '0',
         amiga_mouse_assume_a    => '0',
         amiga_mouse_assume_b    => '0',

         -- These are the 1351 mouse / C64 paddle inputs and drain control
         fa_potx                 => paddle(0),
         fa_poty                 => paddle(1),
         fb_potx                 => paddle(2),
         fb_poty                 => paddle(3),
         pot_drain               => paddle_drain,

         -- To allow auto-detection of Amiga mouses, we need to know what the
         -- rest of the joystick pins are doing
         fa_fire                 => '1',
         fa_left                 => '1',
         fa_right                => '1',
         fa_up                   => '1',
         fa_down                 => '1',
         fb_fire                 => '1',
         fb_left                 => '1',
         fb_right                => '1',
         fb_up                   => '1',
         fb_down                 => '1',

         fa_up_out               => open,
         fa_down_out             => open,
         fa_left_out             => open,
         fa_right_out            => open,

         fb_up_out               => open,
         fb_down_out             => open,
         fb_left_out             => open,
         fb_right_out            => open,

         -- We output the four sampled pot values
         pota_x                  => qnice_pot1_x,
         pota_y                  => qnice_pot1_y,
         potb_x                  => qnice_pot2_x,
         potb_y                  => qnice_pot2_y
      ); -- i_mouse_paddles

    -- We need to invert the values that we get from i_mouse_paddles
   correct_and_flip_paddles : process(all)
   begin
      if qnice_flip_joyports_i = '0' then
         qnice_pot1_x_n <= x"FF" - qnice_pot1_x;
         qnice_pot1_y_n <= x"FF" - qnice_pot1_y;
         qnice_pot2_x_n <= x"FF" - qnice_pot2_x;
         qnice_pot2_y_n <= x"FF" - qnice_pot2_y;
      else
         qnice_pot2_x_n <= x"FF" - qnice_pot1_x;
         qnice_pot2_y_n <= x"FF" - qnice_pot1_y;
         qnice_pot1_x_n <= x"FF" - qnice_pot2_x;
         qnice_pot1_y_n <= x"FF" - qnice_pot2_y;
      end if;
   end process correct_and_flip_paddles;

   ---------------------------------------------------------------------------------------------------------------
   -- Clock Domain Crossing
   ---------------------------------------------------------------------------------------------------------------

   -- Clock domain crossing: QNICE to CORE
   i_qnice2main: xpm_cdc_array_single
      generic map (
         WIDTH => 555
      )
      port map (
         src_clk                    => qnice_clk,
         src_in(0)                  => qnice_csr_reset,
         src_in(1)                  => qnice_csr_pause,
         src_in(2)                  => qnice_csr_keyboard_on,
         src_in(3)                  => qnice_csr_joy1_on,
         src_in(4)                  => qnice_csr_joy2_on,
         src_in(5)                  => qnice_flip_joyports_i,
         src_in(6)                  => '0',
         src_in(7)                  => '0',
         src_in(8)                  => '0',
         src_in(264 downto 9)       => qnice_osm_control_m_o,
         src_in(520 downto 265)     => qnice_gp_reg_o,
         src_in(521)                => '0',
         src_in(522)                => '0',
         src_in(530 downto 523)     => std_logic_vector(qnice_pot1_x_n),
         src_in(538 downto 531)     => std_logic_vector(qnice_pot1_y_n),
         src_in(546 downto 539)     => std_logic_vector(qnice_pot2_x_n),
         src_in(554 downto 547)     => std_logic_vector(qnice_pot2_y_n),
         dest_clk                   => main_clk_i,
         dest_out(0)                => main_qnice_reset_o,
         dest_out(1)                => main_qnice_pause_o,
         dest_out(2)                => main_csr_keyboard_on,
         dest_out(3)                => main_csr_joy1_on,
         dest_out(4)                => main_csr_joy2_on,
         dest_out(5)                => main_flip_joyports,
         dest_out(6)                => open,
         dest_out(7)                => open,
         dest_out(8)                => open,
         dest_out(264 downto 9)     => main_osm_control_m_o,
         dest_out(520 downto 265)   => main_qnice_gp_reg_o,
         dest_out(521)              => open,
         dest_out(522)              => open,
         dest_out(530 downto 523)   => main_pot1_x_o,
         dest_out(538 downto 531)   => main_pot1_y_o,
         dest_out(546 downto 539)   => main_pot2_x_o,
         dest_out(554 downto 547)   => main_pot2_y_o
      ); -- i_qnice2main

   -- Clock domain crossing: CORE to QNICE
   i_main2qnice: xpm_cdc_array_single
      generic map (
         WIDTH => 16
      )
      port map (
         src_clk                => main_clk_i,
         src_in(15 downto  0)   => main_qnice_keys_n,
         dest_clk               => qnice_clk,
         dest_out(15 downto  0) => qnice_qnice_keys_n
      ); -- i_main2qnice

   -- Clock domain crossing: Board clock domain (CLK) to core (main_clk_i)
   i_board2main: xpm_cdc_array_single
      generic map (
         WIDTH => 2
      )
      port map (
         src_clk                 => CLK,
         src_in(0)               => not reset_m2m_n_o,
         src_in(1)               => not reset_core_n,
         dest_clk                => main_clk_i,
         dest_out(0)             => main_reset_m2m_o,
         dest_out(1)             => main_reset_core_o
      ); -- i_board2main

   -- Clock domain crossing: CORE to AUDIO
   i_main2audio: entity work.cdc_stable
      generic map (
         G_DATA_SIZE => 32
      )
      port map (
         src_clk_i                => main_clk_i,
         src_data_i(15 downto  0) => std_logic_vector(main_audio_l_i),
         src_data_i(31 downto 16) => std_logic_vector(main_audio_r_i),
         dst_clk_i                => audio_clk,
         dst_data_o(15 downto  0) => audio_left,
         dst_data_o(31 downto 16) => audio_right
      ); -- i_main2audio


   ---------------------------------------------------------------------------------------------------------------
   -- Audio and video processing pipeline: Multiple clock domains
   ---------------------------------------------------------------------------------------------------------------

   i_av_pipeline : entity work.av_pipeline
      generic map (
         G_VIDEO_MODE_VECTOR     => VIDEO_MODE_VECTOR,
         G_AUDIO_CLOCK_RATE      => 30_000_000,
         G_VGA_DX                => VGA_DX,
         G_VGA_DY                => VGA_DY,
         G_FONT_FILE             => FONT_FILE,
         G_FONT_DX               => FONT_DX,
         G_FONT_DY               => FONT_DY
      )
      port map (
         video_clk_i             => video_clk_i,
         video_rst_i             => video_rst_i,
         video_ce_i              => video_ce_i,
         video_ce_ovl_i          => video_ce_ovl_i,
         video_red_i             => video_red_i,
         video_green_i           => video_green_i,
         video_blue_i            => video_blue_i,
         video_vs_i              => video_vs_i,
         video_hs_i              => video_hs_i,
         video_hblank_i          => video_hblank_i,
         video_vblank_i          => video_vblank_i,
         audio_clk_i             => audio_clk,
         audio_rst_i             => audio_rst,
         audio_left_i            => audio_left,
         audio_right_i           => audio_right,
         qnice_clk_i             => qnice_clk,
         qnice_rst_i             => qnice_rst,
         qnice_osm_cfg_scaling_i => qnice_osm_cfg_scaling_i,
         qnice_osm_cfg_xy_i      => qnice_osm_cfg_xy,
         qnice_osm_cfg_dxdy_i    => qnice_osm_cfg_dxdy,
         qnice_osm_cfg_enable_i  => qnice_osm_cfg_enable,
         qnice_retro15kHz_i      => qnice_retro15kHz_i,
         qnice_scandoubler_i     => qnice_scandoubler_i,
         qnice_csync_i           => qnice_csync_i,
         qnice_zoom_crop_i       => qnice_zoom_crop_i,
         qnice_audio_filter_i    => qnice_audio_filter_i,
         qnice_audio_mute_i      => qnice_audio_mute_i,
         qnice_video_mode_i      => std_logic_vector(to_unsigned(qnice_video_mode_i, 2)),
         qnice_dvi_i             => qnice_dvi_i,
         qnice_poly_clk_i        => qnice_clk,
         qnice_poly_dw_i         => qnice_ramrom_data_out_o(9 downto 0),
         qnice_poly_a_i          => qnice_ramrom_addr_o(6+3 downto 0),
         qnice_poly_wr_i         => qnice_poly_wr,
         qnice_ascal_mode_i      => qnice_ascal_mode,
         qnice_hdmax_o           => qnice_hdmax,
         qnice_vdmax_o           => qnice_vdmax,
         qnice_h_pixels_o        => qnice_h_pixels,
         qnice_v_pixels_o        => qnice_v_pixels,
         qnice_h_pulse_o         => qnice_h_pulse,
         qnice_h_bp_o            => qnice_h_bp,
         qnice_h_fp_o            => qnice_h_fp,
         qnice_v_pulse_o         => qnice_v_pulse,
         qnice_v_bp_o            => qnice_v_bp,
         qnice_v_fp_o            => qnice_v_fp,
         qnice_h_freq_o          => qnice_h_freq,
         qnice_address_i         => qnice_ramrom_addr_o(VRAM_ADDR_WIDTH-1 downto 0),
         qnice_data_i            => qnice_ramrom_data_out_o(7 downto 0) & qnice_ramrom_data_out_o(7 downto 0),   -- 2 copies of the same data
         qnice_wren_i            => qnice_vram_attr_we or qnice_vram_we,
         qnice_byteenable_i      => qnice_vram_attr_we & qnice_vram_we,
         qnice_q_o               => qnice_vram_data,
         sys_clk_i               => CLK,
         sys_pps_i               => sys_pps,
         hr_clk_i                => hr_clk_x1,
         hr_rst_i                => hr_rst,
         hr_write_o              => hr_dig_write,
         hr_read_o               => hr_dig_read,
         hr_address_o            => hr_dig_address,
         hr_writedata_o          => hr_dig_writedata,
         hr_byteenable_o         => hr_dig_byteenable,
         hr_burstcount_o         => hr_dig_burstcount,
         hr_readdata_i           => hr_dig_readdata,
         hr_readdatavalid_i      => hr_dig_readdatavalid,
         hr_waitrequest_i        => hr_dig_waitrequest,
         hr_high_o               => hr_high_o,
         hr_low_o                => hr_low_o,
         VGA_RED                 => VGA_RED,
         VGA_GREEN               => VGA_GREEN,
         VGA_BLUE                => VGA_BLUE,
         VGA_HS                  => VGA_HS,
         VGA_VS                  => VGA_VS,
         vdac_clk                => vdac_clk,
         vdac_sync_n             => vdac_sync_n,
         vdac_blank_n            => vdac_blank_n,
         pwm_l                   => pwm_l,
         pwm_r                   => pwm_r,
         hdmi_clk_i              => hdmi_clk,
         hdmi_rst_i              => hdmi_rst,
         tmds_clk_i              => tmds_clk,
         tmds_data_p_o           => tmds_data_p,
         tmds_data_n_o           => tmds_data_n,
         tmds_clk_p_o            => tmds_clk_p,
         tmds_clk_n_o            => tmds_clk_n
      ); -- i_av_pipeline


   i_avm_fifo_qnice : entity work.avm_fifo
      generic map (
         G_WR_DEPTH     => 16,
         G_RD_DEPTH     => 16,
         G_FILL_SIZE    => 1,
         G_ADDRESS_SIZE => 32,
         G_DATA_SIZE    => 16
      )
      port map (
         s_clk_i               => qnice_clk,
         s_rst_i               => qnice_rst,
         s_avm_waitrequest_o   => qnice_avm_waitrequest,
         s_avm_write_i         => qnice_avm_write,
         s_avm_read_i          => qnice_avm_read,
         s_avm_address_i       => qnice_avm_address,
         s_avm_writedata_i     => qnice_avm_writedata,
         s_avm_byteenable_i    => qnice_avm_byteenable,
         s_avm_burstcount_i    => qnice_avm_burstcount,
         s_avm_readdata_o      => qnice_avm_readdata,
         s_avm_readdatavalid_o => qnice_avm_readdatavalid,
         m_clk_i               => hr_clk_x1,
         m_rst_i               => hr_rst,
         m_avm_waitrequest_i   => hr_qnice_waitrequest,
         m_avm_write_o         => hr_qnice_write,
         m_avm_read_o          => hr_qnice_read,
         m_avm_address_o       => hr_qnice_address,
         m_avm_writedata_o     => hr_qnice_writedata,
         m_avm_byteenable_o    => hr_qnice_byteenable,
         m_avm_burstcount_o    => hr_qnice_burstcount,
         m_avm_readdata_i      => hr_qnice_readdata,
         m_avm_readdatavalid_i => hr_qnice_readdatavalid
      ); -- i_avm_fifo_qnice

   --------------------------------------------------------
   -- Instantiate HyperRAM arbiter
   --------------------------------------------------------

   i_avm_arbit_general : entity work.avm_arbit_general
      generic map (
         G_NUM_SLAVES   => 3,
         G_FREQ_HZ      => BOARD_CLK_SPEED,
         G_ADDRESS_SIZE => 32,
         G_DATA_SIZE    => 16
      )
      port map (
         clk_i                 => hr_clk_x1,
         rst_i                 => hr_rst,
         s_avm_write_i         => hr_dig_write         & hr_core_write_i         & hr_qnice_write,
         s_avm_read_i          => hr_dig_read          & hr_core_read_i          & hr_qnice_read,
         s_avm_address_i       => hr_dig_address       & hr_core_address_i       & hr_qnice_address,
         s_avm_writedata_i     => hr_dig_writedata     & hr_core_writedata_i     & hr_qnice_writedata,
         s_avm_byteenable_i    => hr_dig_byteenable    & hr_core_byteenable_i    & hr_qnice_byteenable,
         s_avm_burstcount_i    => hr_dig_burstcount    & hr_core_burstcount_i    & hr_qnice_burstcount,
         s_avm_readdata_o(3*16-1 downto 2*16) => hr_dig_readdata,
         s_avm_readdata_o(2*16-1 downto 1*16) => hr_core_readdata_o,
         s_avm_readdata_o(1*16-1 downto 0*16) => hr_qnice_readdata,
         s_avm_readdatavalid_o(2) => hr_dig_readdatavalid,
         s_avm_readdatavalid_o(1) => hr_core_readdatavalid_o,
         s_avm_readdatavalid_o(0) => hr_qnice_readdatavalid,
         s_avm_waitrequest_o(2)   => hr_dig_waitrequest,
         s_avm_waitrequest_o(1)   => hr_core_waitrequest_o,
         s_avm_waitrequest_o(0)   => hr_qnice_waitrequest,
         m_avm_write_o         => hr_write,
         m_avm_read_o          => hr_read,
         m_avm_address_o       => hr_address,
         m_avm_writedata_o     => hr_writedata,
         m_avm_byteenable_o    => hr_byteenable,
         m_avm_burstcount_o    => hr_burstcount,
         m_avm_readdata_i      => hr_readdata,
         m_avm_readdatavalid_i => hr_readdatavalid,
         m_avm_waitrequest_i   => hr_waitrequest
      ); -- i_avm_arbit_general

   ---------------------------------------------------------------------------------------------------------------
   -- HyperRAM controller
   ---------------------------------------------------------------------------------------------------------------

   i_hyperram : entity work.hyperram
      port map (
         clk_x1_i            => hr_clk_x1,
         clk_x2_i            => hr_clk_x2,
         clk_x2_del_i        => hr_clk_x2_del,
         rst_i               => hr_rst,
         avm_write_i         => hr_write,
         avm_read_i          => hr_read,
         avm_address_i       => hr_address,
         avm_writedata_i     => hr_writedata,
         avm_byteenable_i    => hr_byteenable,
         avm_burstcount_i    => hr_burstcount,
         avm_readdata_o      => hr_readdata,
         avm_readdatavalid_o => hr_readdatavalid,
         avm_waitrequest_o   => hr_waitrequest,
         hr_resetn_o         => hr_reset,
         hr_csn_o            => hr_cs0,
         hr_ck_o             => hr_clk_p,
         hr_rwds_in_i        => hr_rwds_in,
         hr_rwds_out_o       => hr_rwds_out,
         hr_rwds_oe_o        => hr_rwds_oe,
         hr_dq_in_i          => hr_dq_in,
         hr_dq_out_o         => hr_dq_out,
         hr_dq_oe_o          => hr_dq_oe
      ); -- i_hyperram

   -- Tri-state buffers for HyperRAM
   hr_rwds    <= hr_rwds_out when hr_rwds_oe = '1' else 'Z';
   hr_d       <= hr_dq_out   when hr_dq_oe   = '1' else (others => 'Z');
   hr_rwds_in <= hr_rwds;
   hr_dq_in   <= hr_d;

end architecture synthesis;

