----------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework
--
-- Complete pipeline processing of analog audio and video output (VGA and 3.5 mm)
--
-- MiSTer2MEGA65 done by sy2002 and MJoergen in 2022 and licensed under GPL v3
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity analog_pipeline is
   generic (
      G_VGA_DX                : natural;                 -- Actual format of video from Core (in pixels).
      G_VGA_DY                : natural;
      G_FONT_FILE             : string;
      G_FONT_DX               : natural;
      G_FONT_DY               : natural
   );
   port (
      -- Input from Core (video and audio)
      video_clk_i             : in  std_logic;
      video_rst_i             : in  std_logic;
      video_ce_i              : in  std_logic;
      video_ce_ovl_i          : in  std_logic;           -- 2x the speed of video_ce_i
      video_red_i             : in  std_logic_vector(7 downto 0);
      video_green_i           : in  std_logic_vector(7 downto 0);
      video_blue_i            : in  std_logic_vector(7 downto 0);
      video_hs_i              : in  std_logic;
      video_vs_i              : in  std_logic;
      video_hblank_i          : in  std_logic;
      video_vblank_i          : in  std_logic;
      audio_clk_i             : in  std_logic;
      audio_rst_i             : in  std_logic;
      audio_left_i            : in  signed(15 downto 0); -- Signed PCM format
      audio_right_i           : in  signed(15 downto 0); -- Signed PCM format

      -- Configure the scandoubler : 0=off/1=on
      -- Make sure the signal is in the video_clk clock domain
      video_scandoubler_i     : in  std_logic;

      -- Composite sync : 0=off/1=on
      video_csync_i           : in  std_logic;

      -- Is the input from the core in the retro 15 kHz analog RGB mode : 0=no/1=yes
      -- (Hint : Scandoubler off does not automatically mean retro 15 kHz on.)
      video_retro15kHz_i      : in  std_logic;

      -- Video output (VGA)
      vga_red_o               : out std_logic_vector(7 downto 0);
      vga_green_o             : out std_logic_vector(7 downto 0);
      vga_blue_o              : out std_logic_vector(7 downto 0);
      vga_hs_o                : out std_logic;
      vga_vs_o                : out std_logic;
      vdac_clk_o              : out std_logic;
      vdac_syncn_o            : out std_logic;
      vdac_blankn_o           : out std_logic;

      -- Audio output (3.5 mm jack)
      pwm_l_o                 : out std_logic;
      pwm_r_o                 : out std_logic;

      -- Connect to QNICE and Video RAM
      video_osm_cfg_scaling_i : in  natural range 0 to 8;
      video_osm_cfg_enable_i  : in  std_logic;
      video_osm_cfg_xy_i      : in  std_logic_vector(15 downto 0);
      video_osm_cfg_dxdy_i    : in  std_logic_vector(15 downto 0);
      video_osm_vram_addr_o   : out std_logic_vector(15 downto 0);
      video_osm_vram_data_i   : in  std_logic_vector(15 downto 0)
   );
end entity analog_pipeline;

architecture synthesis of analog_pipeline is

   -- MiSTer video pipeline signals
   signal vs_hsync           : std_logic;
   signal vs_vsync           : std_logic;
   signal vs_hblank          : std_logic;
   signal vs_vblank          : std_logic;
   signal mix_r              : std_logic_vector(7 downto 0);
   signal mix_g              : std_logic_vector(7 downto 0);
   signal mix_b              : std_logic_vector(7 downto 0);
   signal mix_vga_de         : std_logic;

   signal vga_red            : std_logic_vector(7 downto 0);
   signal vga_green          : std_logic_vector(7 downto 0);
   signal vga_blue           : std_logic_vector(7 downto 0);
   signal vga_hs             : std_logic;
   signal vga_vs             : std_logic;

   -- registers used to implement the phase-shifting of the VGA output signals
   signal vga_red_ps         : std_logic_vector(7 downto 0);
   signal vga_green_ps       : std_logic_vector(7 downto 0);
   signal vga_blue_ps        : std_logic_vector(7 downto 0);
   signal vga_hs_ps          : std_logic;
   signal vga_vs_ps          : std_logic;
   signal vga_cs_ps          : std_logic;

   component video_mixer is
      port (
         CLK_VIDEO   : in  std_logic;
         CE_PIXEL    : out std_logic;
         ce_pix      : in  std_logic;
         scandoubler : in  std_logic;
         hq2x        : in  std_logic;
         gamma_bus   : inout std_logic_vector(21 downto 0);
         R           : in  unsigned(7 downto 0);
         G           : in  unsigned(7 downto 0);
         B           : in  unsigned(7 downto 0);
         HSync       : in  std_logic;
         VSync       : in  std_logic;
         HBlank      : in  std_logic;
         VBlank      : in  std_logic;
         HDMI_FREEZE : in  std_logic;
         freeze_sync : out std_logic;
         VGA_R       : out std_logic_vector(7 downto 0);
         VGA_G       : out std_logic_vector(7 downto 0);
         VGA_B       : out std_logic_vector(7 downto 0);
         VGA_VS      : out std_logic;
         VGA_HS      : out std_logic;
         VGA_DE      : out std_logic
      );
   end component video_mixer;

begin

   ---------------------------------------------------------------------------------------------
   -- Audio output (3.5 mm jack)
   ---------------------------------------------------------------------------------------------

   -- Convert the C64's PCM output to pulse density modulation
   i_pcm2pdm : entity work.pcm_to_pdm
      port map
      (
         cpuclock         => audio_clk_i,
         pcm_left         => audio_left_i,
         pcm_right        => audio_right_i,
         -- Pulse Density Modulation (PDM is supposed to sound better than PWM on MEGA65)
         pdm_left         => pwm_l_o,
         pdm_right        => pwm_r_o,
         audio_mode       => '0'         -- 0=PDM, 1=PWM
      ); -- i_pcm2pdm

   ---------------------------------------------------------------------------------------------
   -- Video output (VGA)
   ---------------------------------------------------------------------------------------------

   --------------------------------------------------------------------------------------------------
   -- MiSTer video signal processing pipeline
   --
   -- @TODO: Evaluate the capabilities, including outputting an old composite signal instead of VGA
   --------------------------------------------------------------------------------------------------

   i_video_mixer : video_mixer
      port map (
         CLK_VIDEO   => video_clk_i,
         CE_PIXEL    => open,
         ce_pix      => video_ce_i,
         scandoubler => video_scandoubler_i,
         hq2x        => '0',
         gamma_bus   => open,
         R           => unsigned(video_red_i),
         G           => unsigned(video_green_i),
         B           => unsigned(video_blue_i),
         HSync       => video_hs_i,
         VSync       => video_vs_i,
         HBlank      => video_hblank_i,
         VBlank      => video_vblank_i,
         HDMI_FREEZE => '0',
         freeze_sync => open,
         VGA_R       => mix_r,
         VGA_G       => mix_g,
         VGA_B       => mix_b,
         VGA_VS      => vga_vs,
         VGA_HS      => vga_hs,
         VGA_DE      => mix_vga_de
      ); -- i_video_mixer

   -- The MEGA65 VDAC (ADV7125BCPZ170) does not like non-zero color values outside the visible window.
   -- This is why we explicitly set R, G, B to zero outside of "data enable".
   vga_data_enable : process(mix_r, mix_g, mix_b, mix_vga_de)
   begin
      if mix_vga_de = '1' then
         vga_red   <= mix_r;
         vga_green <= mix_g;
         vga_blue  <= mix_b;
      else
         vga_red   <= (others => '0');
         vga_green <= (others => '0');
         vga_blue  <= (others => '0');
      end if;
   end process vga_data_enable;

   i_video_overlay : entity work.video_overlay
      generic  map (
         G_VGA_DX          => G_VGA_DX,
         G_VGA_DY          => G_VGA_DY,
         G_FONT_FILE       => G_FONT_FILE,
         G_FONT_DX         => G_FONT_DX,
         G_FONT_DY         => G_FONT_DY
      )
      port map (
         vga_clk_i         => video_clk_i,
         vga_ce_i          => video_ce_ovl_i,
         vga_red_i         => vga_red,
         vga_green_i       => vga_green,
         vga_blue_i        => vga_blue,
         vga_hs_i          => vga_hs,
         vga_vs_i          => vga_vs,
         vga_de_i          => mix_vga_de,
         vga_cfg_scaling_i => video_osm_cfg_scaling_i,
         vga_cfg_shift_i   => 0,
         vga_cfg_enable_i  => video_osm_cfg_enable_i,
         vga_cfg_r15kHz_i  => video_retro15kHz_i,
         vga_cfg_xy_i      => video_osm_cfg_xy_i,
         vga_cfg_dxdy_i    => video_osm_cfg_dxdy_i,
         vga_vram_addr_o   => video_osm_vram_addr_o,
         vga_vram_data_i   => video_osm_vram_data_i,
         vga_ce_o          => open,
         vga_red_o         => vga_red_ps,
         vga_green_o       => vga_green_ps,
         vga_blue_o        => vga_blue_ps,
         vga_hs_o          => vga_hs_ps,
         vga_vs_o          => vga_vs_ps,
         vga_de_o          => open
      ); -- i_video_overlay_video

   i_csync : entity work.csync
      port map (
         clk   => video_clk_i,
         hsync => vga_hs_ps,
         vsync => vga_vs_ps,
         csync => vga_cs_ps
      ); -- i_csync

   -- We need to phase-shift the output signal so that the VDAC can sample a nice and steady signal.
   -- We also need to make sure that not only the RGB signals are phase-shifted, but also the
   -- HS and VS signals, otherwise on real analog VGA screens there might be undesired effects.
   -- Last but not least for guaranteeing a minimum of routing delays, we are putting these registers
   -- in a VHDL block so that we can use a PBLOCK in the XDC file to tack the registers near to the
   -- FPGAs VGA output pins.
   VGA_OUT_PHASE_SHIFTED : block
   begin
      phase_shift_vga_signals : process(video_clk_i)
      begin
         if falling_edge(video_clk_i) then -- phase shifting by using the negative edge of the video clock
            vga_red_o   <= vga_red_ps;
            vga_green_o <= vga_green_ps;
            vga_blue_o  <= vga_blue_ps;

            -- Standard VGA outputs horizontal sync on pin 13 and vertical sync on pin 14 of the VGA
            -- connector, see: https://en.wikipedia.org/wiki/VGA_connector
            -- Composite sync output that is compatible with the MiSTer VGA to SCART adaptor needs
            -- the composite sync signal on pin 13 and HIGH on pin 14, see: https://misterfpga.org/viewtopic.php?t=1811
            vga_hs_o    <= vga_hs_ps when not video_csync_i else not vga_cs_ps;
            vga_vs_o    <= vga_vs_ps when not video_csync_i else '1';
         end if;
      end process;
   end block VGA_OUT_PHASE_SHIFTED;

   -- Make the MEGA65 VDAC (ADV7125BCPZ170) output the image:
   --
   -- Excerpts taken from the data sheet Rev D, page 8, table 6:
   --    "sync":  If sync information is not required on the green channel, the SYNC input should be tied to Logic 0.
   --    "blank": A Logic 0 on this control input drives the analog outputs [...] to the blanking level.
   -- So as we do not do any "sync on green", we set sync to 0 and since we do not want to use the VDAC to
   -- blank the screen (i.e. set the analog R, G and B to 0), we hard-wire blank to 1.
   vdac_syncn_o  <= '0';
   vdac_blankn_o <= '1';
   vdac_clk_o    <= video_clk_i;

end architecture synthesis;

