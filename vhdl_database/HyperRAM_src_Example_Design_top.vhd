-- This is the top-level file for the MEGA65 platform (revision 3).
--
-- Created by Michael Jørgensen in 2022 (mjoergen.github.io/HyperRAM).

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
   port (
      sys_clk_i   : in    std_logic;                  -- 100 MHz clock
      sys_rstn_i  : in    std_logic;                  -- CPU reset button (active low)

      -- HyperRAM device interface
      hr_resetn   : out   std_logic;
      hr_csn      : out   std_logic;
      hr_ck       : out   std_logic;
      hr_rwds     : inout std_logic;
      hr_dq       : inout std_logic_vector(7 downto 0);

      -- MEGA65 keyboard
      kb_io0      : out   std_logic;
      kb_io1      : out   std_logic;
      kb_io2      : in    std_logic;

      -- UART
      uart_rx_i   : in    std_logic;
      uart_tx_o   : out   std_logic;

      -- MEGA65 Digital Video (HDMI)
      hdmi_data_p : out   std_logic_vector(2 downto 0);
      hdmi_data_n : out   std_logic_vector(2 downto 0);
      hdmi_clk_p  : out   std_logic;
      hdmi_clk_n  : out   std_logic
   );
end entity top;

architecture synthesis of top is

   constant C_SYS_ADDRESS_SIZE : integer := 19;
   constant C_ADDRESS_SIZE     : integer := 22;
   constant C_DATA_SIZE        : integer := 16;

   -- HyperRAM clocks and reset
   signal hr_clk               : std_logic; -- HyperRAM clock
   signal hr_clk_del           : std_logic; -- HyperRAM clock, phase shifted 90 degrees
   signal delay_refclk         : std_logic; -- 200 MHz, for IDELAYCTRL
   signal hr_rst               : std_logic;

   -- Control and Status for trafic generator
   signal sys_up               : std_logic;
   signal sys_left             : std_logic;
   signal sys_up_d             : std_logic;
   signal sys_left_d           : std_logic;
   signal sys_start            : std_logic;
   signal sys_valid            : std_logic;
   signal sys_active           : std_logic;
   signal sys_error            : std_logic;
   signal sys_address          : std_logic_vector(31 downto 0);
   signal sys_data_exp         : std_logic_vector(31 downto 0);
   signal sys_data_read        : std_logic_vector(31 downto 0);
   signal sys_count_long       : unsigned(31 downto 0);
   signal sys_count_short      : unsigned(31 downto 0);
   signal sys_count_error      : unsigned(31 downto 0);

   -- Interface to MEGA65 video
   signal sys_digits           : std_logic_vector(191 downto 0);

begin

   --------------------------------------------------------
   -- Generate clocks for HyperRAM controller
   --------------------------------------------------------

   i_clk : entity work.clk
      port map
      (
         sys_clk_i      => sys_clk_i,
         sys_rstn_i     => sys_rstn_i,
         clk_o          => hr_clk,
         clk_del_o      => hr_clk_del,
         delay_refclk_o => delay_refclk,
         rst_o          => hr_rst
      ); -- i_clk


   --------------------------------------------------------
   -- Instantiate core test generator
   --------------------------------------------------------

   i_core : entity work.core
      generic map (
         G_SYS_ADDRESS_SIZE => C_SYS_ADDRESS_SIZE,
         G_ADDRESS_SIZE     => C_ADDRESS_SIZE,
         G_DATA_SIZE        => C_DATA_SIZE
      )
      port map (
         clk_i          => hr_clk,
         clk_del_i      => hr_clk_del,
         delay_refclk_i => delay_refclk,
         rst_i          => hr_rst,
         start_i        => sys_start,
         active_o       => sys_active,
         address_o      => sys_address,
         data_exp_o     => sys_data_exp,
         data_read_o    => sys_data_read,
         count_long_o   => sys_count_long,
         count_short_o  => sys_count_short,
         count_error_o  => sys_count_error,
         hr_resetn_o    => hr_resetn,
         hr_csn_o       => hr_csn,
         hr_ck_o        => hr_ck,
         hr_rwds_io     => hr_rwds,
         hr_dq_io       => hr_dq
      ); -- i_core


   ----------------------------------
   -- Generate debug output for video
   ----------------------------------

   sys_digits( 31 downto   0) <= sys_data_read;
   sys_digits( 47 downto  32) <= sys_address(15 downto 0);
   sys_digits( 63 downto  48) <= X"00" & "000" & sys_address(20 downto 16);
   sys_digits( 95 downto  64) <= sys_data_exp;
   sys_digits(127 downto  96) <= std_logic_vector(sys_count_long);
   sys_digits(159 downto 128) <= std_logic_vector(sys_count_short);
   sys_digits(191 downto 160) <= std_logic_vector(sys_count_error);

   sys_error <= or(std_logic_vector(sys_count_error));


   ----------------------------------
   -- Instantiate MEGA65 platform interface
   ----------------------------------

   i_mega65 : entity work.mega65
      generic map (
         G_DIGITS_SIZE => sys_digits'length
      )
      port map (
         sys_clk_i    => sys_clk_i,
         sys_rstn_i   => sys_rstn_i,
         sys_up_o     => sys_up,
         sys_left_o   => sys_left,
         sys_start_o  => sys_start,
         sys_active_i => sys_active,
         sys_error_i  => sys_error,
         sys_digits_i => sys_digits,
         uart_rx_i    => uart_rx_i,
         uart_tx_o    => uart_tx_o,
         kb_io0       => kb_io0,
         kb_io1       => kb_io1,
         kb_io2       => kb_io2,
         hdmi_data_p  => hdmi_data_p,
         hdmi_data_n  => hdmi_data_n,
         hdmi_clk_p   => hdmi_clk_p,
         hdmi_clk_n   => hdmi_clk_n
      ); -- i_mega65

end architecture synthesis;

