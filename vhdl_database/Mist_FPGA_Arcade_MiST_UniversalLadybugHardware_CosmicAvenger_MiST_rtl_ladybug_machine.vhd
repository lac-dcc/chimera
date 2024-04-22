-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- $Id: ladybug_machine.vhd,v 1.23 2006/02/07 00:44:21 arnim Exp $
--
-- Toplevel of the Lady Bug machine.
--
-------------------------------------------------------------------------------
--
-- Copyright (c) 2005, Arnim Laeuger (arnim.laeuger@gmx.net)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ladybug_machine is
  port (
    -- Clock and Reset Interface ----------------------------------------------
    ext_res_n_i       : in  std_logic;
    clk_20mhz_i       : in  std_logic;
    clk_en_10mhz_o    : out std_logic;
    clk_en_5mhz_o     : out std_logic;
    por_n_o           : out std_logic;
    -- Control Interface ------------------------------------------------------
    tilt_n_i          : in  std_logic;
    player_select_n_i : in  std_logic_vector( 1 downto 0);
    player_fire_n_i   : in  std_logic_vector( 1 downto 0);
    player_up_n_i     : in  std_logic_vector( 1 downto 0);
    player_right_n_i  : in  std_logic_vector( 1 downto 0);
    player_down_n_i   : in  std_logic_vector( 1 downto 0);
    player_left_n_i   : in  std_logic_vector( 1 downto 0);
    player_bomb_n_i   : in  std_logic_vector( 1 downto 0);
    right_chute_i     : in  std_logic;
    left_chute_i      : in  std_logic;
    -- DIP Switch Interface ---------------------------------------------------
    dip_block_1_i     : in  std_logic_vector( 7 downto 0);
    dip_block_2_i     : in  std_logic_vector( 7 downto 0);
    -- RGB Video Interface ----------------------------------------------------
    rgb_r_o           : out std_logic_vector( 1 downto 0);
    rgb_g_o           : out std_logic_vector( 1 downto 0);
    rgb_b_o           : out std_logic_vector( 1 downto 0);
    hsync_n_o         : out std_logic;
    vsync_n_o         : out std_logic;
    comp_sync_n_o     : out std_logic;
    vblank_o          : out std_logic;
    hblank_o          : out std_logic;
    -- Audio Interface --------------------------------------------------------
    audio_o           : out std_logic_vector( 8 downto 0);
    -- CPU ROM Interface ------------------------------------------------------
    rom_cpu_a_o       : out std_logic_vector(14 downto 0);
    rom_cpu_d_i       : in  std_logic_vector( 7 downto 0);
    -- Character ROM Interface ------------------------------------------------
    rom_char_a_o      : out std_logic_vector(11 downto 0);
    rom_char_d_i      : in  std_logic_vector(15 downto 0);
    -- Sprite ROM Interface ---------------------------------------------------
    rom_sprite_a_o    : out std_logic_vector(11 downto 0);
    rom_sprite_d_i    : in  std_logic_vector(15 downto 0)
  );


end ladybug_machine;

architecture struct of ladybug_machine is

  -- Clock System -------------------------------------------------------------
  signal clk_en_10mhz_s,
         clk_en_10mhz_n_s : std_logic;
  signal clk_en_5mhz_s,
         clk_en_5mhz_n_s  : std_logic;
  signal clk_en_4mhz_s    : std_logic;

  -- Reset System -------------------------------------------------------------
  signal por_n_s : std_logic;
  signal res_n_s : std_logic;

  signal sound_wait_n_s : std_logic;
  signal wait_n_s       : std_logic;
  signal a_s            : std_logic_vector(10 downto 0);
  signal d_to_cpu_s,
         d_from_cpu_s,
         d_from_video_s : std_logic_vector( 7 downto 0);
  signal rd_n_s,
         wr_n_s         : std_logic;
  signal cs7_n_s,
         cs10_n_s,
         cs11_n_s,
         cs12_n_s,
         cs13_n_s       : std_logic;
  signal vc_s,
         vbl_tick_n_s,
         vbl_buf_s      : std_logic;

  signal gpio_in0_s,
         gpio_in1_s,
         gpio_in2_s,
         gpio_in3_s,
         gpio_extra_s   : std_logic_vector( 7 downto 0);

begin

  -----------------------------------------------------------------------------
  -- Clock Generator
  -----------------------------------------------------------------------------
  clk_b : entity work.ladybug_clk
    port map (
      clk_20mhz_i      => clk_20mhz_i,
      por_n_i          => por_n_s,
      clk_en_10mhz_o   => clk_en_10mhz_s,
      clk_en_10mhz_n_o => clk_en_10mhz_n_s,
      clk_en_5mhz_o    => clk_en_5mhz_s,
      clk_en_5mhz_n_o  => clk_en_5mhz_n_s,
      clk_en_4mhz_o    => clk_en_4mhz_s
    );
  --
  clk_en_5mhz_o   <= clk_en_5mhz_s;
  clk_en_10mhz_o  <= clk_en_10mhz_s;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Reset Generator
  -----------------------------------------------------------------------------
  res_b : entity work.ladybug_res
    port map (
      clk_20mhz_i => clk_20mhz_i,
      ext_res_n_i => ext_res_n_i,
      res_n_o     => res_n_s,
      por_n_o     => por_n_s
    );
  --
  por_n_o <= por_n_s;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Joystick and DIP Switch Mapping
  -----------------------------------------------------------------------------
  gpio_in0_s   <= tilt_n_i             &
                  player_select_n_i(1) &
                  player_select_n_i(0) &
                  player_fire_n_i(0)   &
                  player_up_n_i(0)     &
                  player_right_n_i(0)  &
                  player_down_n_i(0)   &
                  player_left_n_i(0);
  gpio_in1_s   <= vbl_buf_s            &
                  vbl_tick_n_s         &
                  vc_s                 &
                  player_fire_n_i(1)   &
                  player_up_n_i(1)     &
                  player_right_n_i(1)  &
                  player_down_n_i(1)   &
                  player_left_n_i(1);
  gpio_in2_s   <= dip_block_1_i;
  gpio_in3_s   <= dip_block_2_i;
  gpio_extra_s <= player_bomb_n_i(1)   &
                  '1'                  &
                  '1'                  &
                  '1'                  &
                  player_bomb_n_i(0)   &
                  '1'                  &
                  '1'                  &
                  '1';


  -----------------------------------------------------------------------------
  -- CPU Unit
  -----------------------------------------------------------------------------
  cpu_b : entity work.ladybug_cpu_unit
    port map (
      clk_20mhz_i    => clk_20mhz_i,
      clk_en_4mhz_i  => clk_en_4mhz_s,
      res_n_i        => res_n_s,
      rom_cpu_a_o    => rom_cpu_a_o,
      rom_cpu_d_i    => rom_cpu_d_i,

      sound_wait_n_i => sound_wait_n_s,
      wait_n_i       => wait_n_s,
      right_chute_i  => right_chute_i,
      left_chute_i   => left_chute_i,
      gpio_in0_i     => gpio_in0_s,
      gpio_in1_i     => gpio_in1_s,
      gpio_in2_i     => gpio_in2_s,
      gpio_in3_i     => gpio_in3_s,
      gpio_extra_i   => gpio_extra_s,
      a_o            => a_s,
      d_to_cpu_i     => d_to_cpu_s,
      d_from_cpu_o   => d_from_cpu_s,
      rd_n_o         => rd_n_s,
      wr_n_o         => wr_n_s,
      cs7_n_o        => cs7_n_s,
      cs10_n_o       => cs10_n_s,
      cs11_n_o       => cs11_n_s,
      cs12_n_o       => cs12_n_s,
      cs13_n_o       => cs13_n_s
    );

  -----------------------------------------------------------------------------
  -- Bus Multiplexer
  -----------------------------------------------------------------------------
  d_to_cpu_s <= d_from_video_s when (cs7_n_s and cs13_n_s) = '0' else (others => '1');

  -----------------------------------------------------------------------------
  -- Video Unit
  -----------------------------------------------------------------------------
  video_b : entity work.ladybug_video_unit
    port map (
      clk_20mhz_i      => clk_20mhz_i,
      por_n_i          => por_n_s,
      res_n_i          => res_n_s,
      clk_en_10mhz_i   => clk_en_10mhz_s,
      clk_en_10mhz_n_i => clk_en_10mhz_n_s,
      clk_en_5mhz_i    => clk_en_5mhz_s,
      clk_en_5mhz_n_i  => clk_en_5mhz_n_s,
      clk_en_4mhz_i    => clk_en_4mhz_s,
      cs7_n_i          => cs7_n_s,
      cs10_n_i         => cs10_n_s,
      cs13_n_i         => cs13_n_s,
      a_i              => a_s,
      rd_n_i           => rd_n_s,
      wr_n_i           => wr_n_s,
      wait_n_o         => wait_n_s,
      d_from_cpu_i     => d_from_cpu_s,
      d_from_video_o   => d_from_video_s,
      vc_o             => vc_s,
      vbl_tick_n_o     => vbl_tick_n_s,
      vbl_buf_o        => vbl_buf_s,
      rgb_r_o          => rgb_r_o,
      rgb_g_o          => rgb_g_o,
      rgb_b_o          => rgb_b_o,
      hsync_n_o        => hsync_n_o,
      vsync_n_o        => vsync_n_o,
      comp_sync_n_o    => comp_sync_n_o,
	   vblank_o         => vblank_o,
	   hblank_o         => hblank_o,
      rom_char_a_o     => rom_char_a_o,
      rom_char_d_i     => rom_char_d_i,
      rom_sprite_a_o   => rom_sprite_a_o,
      rom_sprite_d_i   => rom_sprite_d_i
    );

  -----------------------------------------------------------------------------
  -- Sound Unit
  -----------------------------------------------------------------------------
  sound_b : entity work.ladybug_sound_unit
    port map (
      clk_20mhz_i    => clk_20mhz_i,
      clk_en_4mhz_i  => clk_en_4mhz_s,
      por_n_i        => por_n_s,
      cs11_n_i       => cs11_n_s,
      cs12_n_i       => cs12_n_s,
      wr_n_i         => wr_n_s,
      d_from_cpu_i   => d_from_cpu_s,
      sound_wait_n_o => sound_wait_n_s,
      audio_o        => audio_o
    );

end struct;
