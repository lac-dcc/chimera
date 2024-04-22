-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- $Id: ladybug_video_unit.vhd,v 1.22 2006/02/07 00:44:35 arnim Exp $
--
-- The Video Unit of the Lady Bug Machine.
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

entity ladybug_video_unit is
  port (
    -- Clock and Reset Interface ----------------------------------------------
    clk_20mhz_i      : in  std_logic;
    por_n_i          : in  std_logic;
    res_n_i          : in  std_logic;
    clk_en_10mhz_i   : in  std_logic;
    clk_en_10mhz_n_i : in  std_logic;
    clk_en_5mhz_i    : in  std_logic;
    clk_en_5mhz_n_i  : in  std_logic;
    clk_en_4mhz_i    : in  std_logic;
    -- CPU Interface ----------------------------------------------------------
    cs7_n_i          : in  std_logic;
    cs10_n_i         : in  std_logic;
    cs13_n_i         : in  std_logic;
    a_i              : in  std_logic_vector(10 downto 0);
    rd_n_i           : in  std_logic;
    wr_n_i           : in  std_logic;
    wait_n_o         : out std_logic;
    d_from_cpu_i     : in  std_logic_vector( 7 downto 0);
    d_from_video_o   : out std_logic_vector( 7 downto 0);
    vc_o             : out std_logic;
    vbl_tick_n_o     : out std_logic;
    vbl_buf_o        : out std_logic;
    -- RGB Video Interface ----------------------------------------------------
    rgb_r_o          : out std_logic_vector( 1 downto 0);
    rgb_g_o          : out std_logic_vector( 1 downto 0);
    rgb_b_o          : out std_logic_vector( 1 downto 0);
    hsync_n_o        : out std_logic;
    vsync_n_o        : out std_logic;
    comp_sync_n_o    : out std_logic;
	 vblank_o         : out std_logic;
	 hblank_o         : out std_logic;
    -- Character ROM Interface ------------------------------------------------
    rom_char_a_o     : out std_logic_vector(11 downto 0);
    rom_char_d_i     : in  std_logic_vector(15 downto 0);
    -- Sprite ROM Interface ---------------------------------------------------
    rom_sprite_a_o   : out std_logic_vector(11 downto 0);
    rom_sprite_d_i   : in  std_logic_vector(15 downto 0)
  );

end ladybug_video_unit;

architecture struct of ladybug_video_unit is

  signal h_s,
         h_t_s         : std_logic_vector(3 downto 0);
  signal ha_d_s,
         ha_t_rise_s   : std_logic;
  signal hbl_s         : std_logic;
  signal hx_s          : std_logic;

  signal v_s,
         v_t_s         : std_logic_vector(3 downto 0);
  signal vc_d_s        : std_logic;
  signal vbl_n_s,
         vbl_d_n_s     : std_logic;

  signal blank_flont_s : std_logic;

  signal d_from_char_s : std_logic_vector(7 downto 0);

  signal blank_s       : std_logic;
  signal crg_s         : std_logic_vector(5 downto 1);

  signal sig_s         : std_logic_vector(4 downto 1);

  signal comp_sync_n   : std_logic;

begin
	comp_sync_n_o <= comp_sync_n and vbl_n_s;
	vbl_buf_o <= not vbl_n_s;
  -----------------------------------------------------------------------------
  -- Horizontal and Vertical Timing Generator
  -----------------------------------------------------------------------------
  timing_b : entity work.ladybug_video_timing
    port map (
      clk_20mhz_i     => clk_20mhz_i,
      por_n_i         => por_n_i,
      clk_en_5mhz_i   => clk_en_5mhz_i,
      h_o             => h_s,
      h_t_o           => h_t_s,
      hbl_o           => hbl_s,
      hx_o            => hx_s,
      ha_d_o          => ha_d_s,
      ha_t_rise_o     => ha_t_rise_s,
      v_o             => v_s,
      v_t_o           => v_t_s,
      vc_d_o          => vc_d_s,
      vbl_n_o         => vbl_n_s,
      vbl_d_n_o       => vbl_d_n_s,
      vbl_t_n_o       => vbl_tick_n_o,
      blank_flont_o   => blank_flont_s,
      hsync_n_o       => hsync_n_o,
      vsync_n_o       => vsync_n_o,
      comp_sync_n_o   => comp_sync_n
    );
  vc_o      <= v_s(2);


  -----------------------------------------------------------------------------
  -- Character Module
  -----------------------------------------------------------------------------
  char_b : entity work.ladybug_char
    port map (
      clk_20mhz_i   => clk_20mhz_i,
      por_n_i       => por_n_i,
      res_n_i       => res_n_i,
      clk_en_5mhz_i => clk_en_5mhz_i,
      clk_en_4mhz_i => clk_en_4mhz_i,
      cs10_n_i      => cs10_n_i,
      cs13_n_i      => cs13_n_i,
      a_i           => a_i,
      rd_n_i        => rd_n_i,
      wr_n_i        => wr_n_i,
      wait_n_o      => wait_n_o,
      d_from_cpu_i  => d_from_cpu_i,
      d_from_char_o => d_from_char_s,
      h_i           => h_s,
      h_t_i         => h_t_s,
      ha_t_rise_i   => ha_t_rise_s,
      hx_i          => hx_s,
      v_i           => v_s,
      v_t_i         => v_t_s,
      hbl_i         => hbl_s,
      blank_flont_i => blank_flont_s,
      blank_o       => blank_s,
	   vblank_o      => vblank_o,
	   hblank_o      => hblank_o,
      crg_o         => crg_s,
      rom_char_a_o  => rom_char_a_o,
      rom_char_d_i  => rom_char_d_i
    );


  -----------------------------------------------------------------------------
  -- Sprite Module
  -----------------------------------------------------------------------------
  sprite_b : entity work.ladybug_sprite
    port map (
      clk_20mhz_i      => clk_20mhz_i,
      por_n_i          => por_n_i,
      res_n_i          => res_n_i,
      clk_en_10mhz_i   => clk_en_10mhz_i,
      clk_en_10mhz_n_i => clk_en_10mhz_n_i,
      clk_en_5mhz_i    => clk_en_5mhz_i,
      clk_en_5mhz_n_i  => clk_en_5mhz_n_i,
      cs7_n_i          => cs7_n_i,
      a_i              => a_i(9 downto 0),
      d_from_cpu_i     => d_from_cpu_i,
      h_i              => h_s,
      h_t_i            => h_t_s,
      hx_i             => hx_s,
      ha_d_i           => ha_d_s,
      v_i              => v_s,
      v_t_i            => v_t_s,
      vbl_n_i          => vbl_n_s,
      vbl_d_n_i        => vbl_d_n_s,
      vc_d_i           => vc_d_s,
      blank_flont_i    => blank_flont_s,
      blank_i          => blank_s,
      sig_o            => sig_s,
      rom_sprite_a_o   => rom_sprite_a_o,
      rom_sprite_d_i   => rom_sprite_d_i
    );


  -----------------------------------------------------------------------------
  -- RGB Generator
  -----------------------------------------------------------------------------
  rgb_b : entity work.ladybug_rgb
    port map (
      clk_20mhz_i   => clk_20mhz_i,
      por_n_i       => por_n_i,
      clk_en_5mhz_i => clk_en_5mhz_i,
      crg_i         => crg_s,
      sig_i         => sig_s,
      rgb_r_o       => rgb_r_o,
      rgb_g_o       => rgb_g_o,
      rgb_b_o       => rgb_b_o
    );


  -----------------------------------------------------------------------------
  -- Bus Multiplexer
  -----------------------------------------------------------------------------
  d_from_video_o <=   d_from_char_s
                    when cs13_n_i = '0' else
                      (others => '1');

end struct;
