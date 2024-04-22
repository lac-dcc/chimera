library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

library xpm;
use xpm.vcomponents.all;

entity clk_mega65 is
   port (
      sys_clk_i    : in  std_logic;   -- expects 100 MHz
      sys_rstn_i   : in  std_logic;   -- Asynchronous, asserted low
      kbd_clk_o    : out std_logic;   -- 40 MHz
      pixel_clk_o  : out std_logic;   -- 74.25 MHz pixelclock for 720p @ 60 Hz
      pixel_rst_o  : out std_logic;   -- pixelclock reset, synchronized
      pixel_clk5_o : out std_logic    -- pixelclock (74.25 MHz x 5 = 371.25 MHz) for HDMI
   );
end entity clk_mega65;

architecture synthesis of clk_mega65 is

   signal clkfb           : std_logic;
   signal clkfb_mmcm      : std_logic;
   signal kbd_clk_mmcm    : std_logic;
   signal pixel_clk_mmcm  : std_logic;
   signal pixel_clk5_mmcm : std_logic;
   signal locked          : std_logic;

begin

   -- generate 74.25 MHz for 720p @ 60 Hz and 5x74.25 MHz = 371.25 MHz for HDMI
   -- VCO frequency range for Artix 7 speed grade -1 : 600 MHz - 1200 MHz
   -- f_VCO = f_CLKIN * CLKFBOUT_MULT_F / DIVCLK_DIVIDE   
   i_clk_mega65 : MMCME2_ADV
      generic map (
         BANDWIDTH            => "OPTIMIZED",
         CLKOUT4_CASCADE      => FALSE,
         COMPENSATION         => "ZHOLD",
         STARTUP_WAIT         => FALSE,
         CLKIN1_PERIOD        => 10.0,       -- INPUT @ 100 MHz
         REF_JITTER1          => 0.010,
         DIVCLK_DIVIDE        => 5,
         CLKFBOUT_MULT_F      => 37.125,     -- f_VCO = (100 MHz / 5) x 37.125 = 742.5 MHz
         CLKFBOUT_PHASE       => 0.000,
         CLKFBOUT_USE_FINE_PS => FALSE,
         CLKOUT0_DIVIDE_F     => 18.500,     -- 40.135 MHz
         CLKOUT0_PHASE        => 0.000,
         CLKOUT0_DUTY_CYCLE   => 0.500,
         CLKOUT0_USE_FINE_PS  => FALSE,
         CLKOUT1_DIVIDE       => 10,         -- 74.25 MHz
         CLKOUT1_PHASE        => 0.000,
         CLKOUT1_DUTY_CYCLE   => 0.500,
         CLKOUT1_USE_FINE_PS  => FALSE,
         CLKOUT2_DIVIDE       => 2,          -- 371.25 MHz
         CLKOUT2_PHASE        => 0.000,
         CLKOUT2_DUTY_CYCLE   => 0.500,
         CLKOUT2_USE_FINE_PS  => FALSE
      )
      port map (
         -- Output clocks
         CLKFBOUT            => clkfb_mmcm,
         CLKOUT0             => kbd_clk_mmcm,
         CLKOUT1             => pixel_clk_mmcm,
         CLKOUT2             => pixel_clk5_mmcm,
         -- Input clock control
         CLKFBIN             => clkfb,
         CLKIN1              => sys_clk_i,
         CLKIN2              => '0',
         -- Tied to always select the primary input clock
         CLKINSEL            => '1',
         -- Ports for dynamic reconfiguration
         DADDR               => (others => '0'),
         DCLK                => '0',
         DEN                 => '0',
         DI                  => (others => '0'),
         DO                  => open,
         DRDY                => open,
         DWE                 => '0',
         -- Ports for dynamic phase shift
         PSCLK               => '0',
         PSEN                => '0',
         PSINCDEC            => '0',
         PSDONE              => open,
         -- Other control and status signals
         LOCKED              => locked,
         CLKINSTOPPED        => open,
         CLKFBSTOPPED        => open,
         PWRDWN              => '0',
         RST                 => not sys_rstn_i
      ); -- i_clk_mega65


   -------------------------------------
   -- Output buffering
   -------------------------------------

   i_bufg_clkfb : BUFG
      port map (
         I => clkfb_mmcm,
         O => clkfb
      ); -- i_bufg_clkfb

   i_bufg_kbd_clk : BUFG
      port map (
         I => kbd_clk_mmcm,
         O => kbd_clk_o
      ); -- i_bufg_kbd_clk

   i_bufg_pixel_clk : BUFG
      port map (
         I => pixel_clk_mmcm,
         O => pixel_clk_o
      ); -- i_bufg_pixel_clk

   i_bufg_pixel_clk5 : BUFG
      port map (
         I => pixel_clk5_mmcm,
         O => pixel_clk5_o
      ); -- i_bufg_pixel_clk5


   -------------------------------------
   -- Reset generation
   -------------------------------------

   i_xpm_cdc_sync_rst_pixel : xpm_cdc_sync_rst
      generic map (
         INIT_SYNC_FF => 1  -- Enable simulation init values
      )
      port map (
         src_rst  => not (sys_rstn_i and locked),  -- 1-bit input: Source reset signal.
         dest_clk => pixel_clk_o,                  -- 1-bit input: Destination clock.
         dest_rst => pixel_rst_o                   -- 1-bit output: src_rst synchronized to the destination clock domain.
                                                   -- This output is registered.
      ); -- i_xpm_cdc_sync_rst_pixel

end architecture synthesis;

