----------------------------------------------------------------------------------
-- YOUR-PROJECT-NAME (GITHUB-REPO-SHORTNAME)
--
-- MEGA65 R3 main file that contains the whole machine
--
-- done by YOURNAME in YEAR and licensed under GPL v3
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CORE_R3 is
port (
   CLK            : in  std_logic;                 -- 100 MHz clock

   -- MAX10 FPGA (delivers reset)
   max10_tx          : in std_logic;
   max10_rx          : out std_logic;
   max10_clkandsync  : out std_logic;

   -- serial communication (rxd, txd only; rts/cts are not available)
   -- 115.200 baud, 8-N-1
   UART_RXD       : in  std_logic;                 -- receive data
   UART_TXD       : out std_logic;                 -- send data

   -- VGA and VDAC
   VGA_RED        : out std_logic_vector(7 downto 0);
   VGA_GREEN      : out std_logic_vector(7 downto 0);
   VGA_BLUE       : out std_logic_vector(7 downto 0);
   VGA_HS         : out std_logic;
   VGA_VS         : out std_logic;

   vdac_clk       : out std_logic;
   vdac_sync_n    : out std_logic;
   vdac_blank_n   : out std_logic;

   -- Digital Video (HDMI)
   tmds_data_p    : out std_logic_vector(2 downto 0);
   tmds_data_n    : out std_logic_vector(2 downto 0);
   tmds_clk_p     : out std_logic;
   tmds_clk_n     : out std_logic;
   ct_hpd         : out std_logic := '1';          -- Needed for HDMI compliancy: Assert +5V according to section 4.2.7 of the specification version 1.4b

   -- MEGA65 smart keyboard controller
   kb_io0         : out std_logic;                 -- clock to keyboard
   kb_io1         : out std_logic;                 -- data output to keyboard
   kb_io2         : in  std_logic;                 -- data input from keyboard

   -- SD Card (internal on bottom)
   SD_RESET       : out std_logic;
   SD_CLK         : out std_logic;
   SD_MOSI        : out std_logic;
   SD_MISO        : in  std_logic;
   SD_CD          : in  std_logic;

   -- SD Card (external on back)
   SD2_RESET      : out std_logic;
   SD2_CLK        : out std_logic;
   SD2_MOSI       : out std_logic;
   SD2_MISO       : in  std_logic;
   SD2_CD         : in  std_logic;

   -- 3.5mm analog audio jack
   pwm_l          : out std_logic;
   pwm_r          : out std_logic;

   -- Joysticks and Paddles
   joy_1_up_n     : in  std_logic;
   joy_1_down_n   : in  std_logic;
   joy_1_left_n   : in  std_logic;
   joy_1_right_n  : in  std_logic;
   joy_1_fire_n   : in  std_logic;

   joy_2_up_n     : in  std_logic;
   joy_2_down_n   : in  std_logic;
   joy_2_left_n   : in  std_logic;
   joy_2_right_n  : in  std_logic;
   joy_2_fire_n   : in  std_logic;
   
   paddle         : in std_logic_vector(3 downto 0);
   paddle_drain   : out std_logic;

   -- Built-in HyperRAM
   hr_d           : inout std_logic_vector(7 downto 0);    -- Data/Address
   hr_rwds        : inout std_logic;               -- RW Data strobe
   hr_reset       : out std_logic;                 -- Active low RESET line to HyperRAM
   hr_clk_p       : out std_logic;
   hr_cs0         : out std_logic

   -- Optional additional HyperRAM in trap-door slot
--   hr2_d          : inout unsigned(7 downto 0);    -- Data/Address
--   hr2_rwds       : inout std_logic;               -- RW Data strobe
--   hr2_reset      : out std_logic;                 -- Active low RESET line to HyperRAM
--   hr2_clk_p      : out std_logic;
--   hr_cs1         : out std_logic
);
end entity CORE_R3;

architecture synthesis of CORE_R3 is

begin

   M2M : entity work.m2m
      port map
      (
         CLK               => CLK,
         max10_tx          => max10_tx,
         max10_rx          => max10_rx,
         max10_clkandsync  => max10_clkandsync,
         
         -- serial communication (rxd, txd only; rts/cts are not available)
         -- 115.200 baud, 8-N-1
         UART_RXD       => UART_RXD,
         UART_TXD       => UART_TXD,

         -- VGA and VDAC
         VGA_RED        => VGA_RED,
         VGA_GREEN      => VGA_GREEN,
         VGA_BLUE       => VGA_BLUE,
         VGA_HS         => VGA_HS,
         VGA_VS         => VGA_VS,

         vdac_clk       => vdac_clk,
         vdac_sync_n    => vdac_sync_n,
         vdac_blank_n   => vdac_blank_n,

         -- Digital Video (HDMI)
         tmds_data_p    => tmds_data_p,
         tmds_data_n    => tmds_data_n,
         tmds_clk_p     => tmds_clk_p,
         tmds_clk_n     => tmds_clk_n,

         -- MEGA65 smart keyboard controller
         kb_io0         => kb_io0,
         kb_io1         => kb_io1,
         kb_io2         => kb_io2,

         -- SD Card (internal on bottom)
         SD_RESET       => SD_RESET,
         SD_CLK         => SD_CLK,
         SD_MOSI        => SD_MOSI,
         SD_MISO        => SD_MISO,
         SD_CD          => SD_CD,

         -- SD Card (external on back)
         SD2_RESET      => SD2_RESET,
         SD2_CLK        => SD2_CLK,
         SD2_MOSI       => SD2_MOSI,
         SD2_MISO       => SD2_MISO,
         SD2_CD         => SD2_CD,

         -- 3.5mm analog audio jack
         pwm_l          => pwm_l,
         pwm_r          => pwm_r,
       
         -- Joysticks and Paddles
         joy_1_up_n     => joy_1_up_n,
         joy_1_down_n   => joy_1_down_n,
         joy_1_left_n   => joy_1_left_n,
         joy_1_right_n  => joy_1_right_n,
         joy_1_fire_n   => joy_1_fire_n,
      
         joy_2_up_n     => joy_2_up_n,
         joy_2_down_n   => joy_2_down_n,
         joy_2_left_n   => joy_2_left_n,
         joy_2_right_n  => joy_2_right_n,
         joy_2_fire_n   => joy_2_fire_n,
         
         paddle         => paddle,
         paddle_drain   => paddle_drain,

         -- Built-in HyperRAM
         hr_d           => hr_d,
         hr_rwds        => hr_rwds,
         hr_reset       => hr_reset,
         hr_clk_p       => hr_clk_p,
         hr_cs0         => hr_cs0
      ); -- i_m2m

end architecture synthesis;

