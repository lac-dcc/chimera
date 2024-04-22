-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_core.vhd,v 1.17 2007/02/05 22:08:59 arnim Exp $
--
-- i8244 Core
--
-------------------------------------------------------------------------------
--
-- Copyright (c) 2007, Arnim Laeuger (arnim.laeuger@gmx.net)
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

entity i8244_core is

  generic (
    is_pal_g : integer := 1
  );
  port (
    -- System Interface -------------------------------------------------------
    clk_i      : in  std_logic;
    clk_en_i   : in  std_logic;
    res_n_i    : in  std_logic;
    -- ROM Interface ----------------------------------------------------------
    rom_addr_o : out std_logic_vector(8 downto 0);
    rom_en_o   : out std_logic;
    rom_data_i : in  std_logic_vector(7 downto 0);
    -- I8244 Pads Interface ---------------------------------------------------
    intr_n_o   : out std_logic;
    stb_i      : in  std_logic;
    bg_o       : out std_logic;
    hsync_o    : out std_logic;
    vsync_o    : out std_logic;
    ms_i       : in  std_logic;
    hbl_o      : out std_logic;
    vbl_i      : in  std_logic;
    vbl_o      : out std_logic;
    cx_i       : in  std_logic;
    l_o        : out std_logic;
    cs_n_i     : in  std_logic;
    wr_n_i     : in  std_logic;
    rd_n_i     : in  std_logic;
    din_i      : in  std_logic_vector(7 downto 0);
    dout_o     : out std_logic_vector(7 downto 0);
    dout_en_o  : out std_logic;
    r_o        : out std_logic;
    g_o        : out std_logic;
    b_o        : out std_logic;
    ale_i      : in  std_logic;
    snd_o      : out std_logic;
    snd_vec_o  : out std_logic_vector(3 downto 0)
  );

end i8244_core;


use work.i8244_pack.all;
--
use work.i8244_grid_pack.grid_cfg_t;
--
use work.i8244_major_pack.major_objs_t;
use work.i8244_major_pack.major_quad_objs_t;
use work.i8244_major_pack.rom_addr_t;
use work.i8244_major_pack.rom_data_t;
--
use work.i8244_minor_pack.minor_objs_t;
use work.i8244_minor_pack.minor_patterns_t;
use work.i8244_minor_pack.minor_obj_range_t;
--
use work.i8244_sound_pack.cpu2snd_t;

use work.i8244_comp_pack.i8244_sync_gen;
use work.i8244_comp_pack.i8244_grid;
use work.i8244_comp_pack.i8244_major;
use work.i8244_comp_pack.i8244_minor;
use work.i8244_comp_pack.i8244_cpuio;
use work.i8244_comp_pack.i8244_col_mux;
use work.i8244_comp_pack.i8244_sound;

architecture struct of i8244_core is

  -- active reset level
  constant res_level_c : std_logic := '0';

  -- global signals
  signal clk_en_s : boolean;
  signal res_s    : boolean;

  -- sync generator signals
  signal clk_rise_en_s,
         clk_fall_en_s  : boolean;
  signal hpos_s,
         vpos_s         : pos_t;
  signal hbl_s,
         vbl_s          : std_logic;
  signal hor_int_s      : std_logic;

  -- grid display system signals
  signal grid_cfg_s   : grid_cfg_t;
  signal grid_hpix_s,
         grid_vpix_s,
         grid_dpix_s  : std_logic;

  -- major display system signals
  signal major_objs_s      : major_objs_t;
  signal major_quad_objs_s : major_quad_objs_t;
  signal major_pix_s       : std_logic;
  signal major_attr_s      : col_attr_t;
  signal major_coll_s      : boolean;

  -- minor display system signals
  signal minor_objs_s     : minor_objs_t;
  signal minor_patterns_s : minor_patterns_t;
  signal minor_pix_s      : std_logic_vector(minor_obj_range_t);

  -- CPU I/O module signals
  signal en_disp_s     : std_logic;
  signal grid_bg_col_s : std_logic_vector(6 downto 0);

  -- color mux module signals
  signal minor_cols_s  : col_attrs_t(minor_obj_range_t);

  -- enabled pixel signals
  signal grid_hpix_en_s,
         grid_vpix_en_s,
         grid_dpix_en_s,
         major_pix_en_s  : std_logic;
  signal minor_pix_en_s  : std_logic_vector(minor_obj_range_t);

  -- sound module signals
  signal snd_int_s : boolean;
  signal cpu2snd_s : cpu2snd_t;

begin

  res_s    <= res_n_i = res_level_c;
  clk_en_s <= clk_en_i = '1';


  -----------------------------------------------------------------------------
  -- Sync generator
  -----------------------------------------------------------------------------
  sync_gen_b : i8244_sync_gen
    generic map (
      is_pal_g => is_pal_g
    )
    port map (
      clk_i         => clk_i,
      clk_en_i      => clk_en_s,
      clk_rise_en_o => clk_rise_en_s,
      clk_fall_en_o => clk_fall_en_s,
      res_i         => res_s,
      ms_i          => ms_i,
      vbl_i         => vbl_i,
      hbl_o         => hbl_s,
      hsync_o       => hsync_o,
      vsync_o       => vsync_o,
      bg_o          => bg_o,
      vbl_o         => vbl_s,
      hpos_o        => hpos_s,
      vpos_o        => vpos_s,
      hor_int_o     => hor_int_s
    );
  --
  vbl_o <= vbl_s;
  hbl_o <= hbl_s;


  -----------------------------------------------------------------------------
  -- Grid display system
  -----------------------------------------------------------------------------
  grid_b : i8244_grid
    port map (
      clk_i       => clk_i,
      clk_en_i    => clk_fall_en_s,
      res_i       => res_s,
      hpos_i      => hpos_s,
      vpos_i      => vpos_s,
      hbl_i       => hbl_s,
      vbl_i       => vbl_s,
      grid_cfg_i  => grid_cfg_s,
      grid_hpix_o => grid_hpix_s,
      grid_vpix_o => grid_vpix_s,
      grid_dpix_o => grid_dpix_s
    );


  -----------------------------------------------------------------------------
  -- Major display system
  -----------------------------------------------------------------------------
  major_b : i8244_major
    port map (
      clk_i             => clk_i,
      clk_fall_en_i     => clk_fall_en_s,
      res_i             => res_s,
      hpos_i            => hpos_s,
      vpos_i            => vpos_s,
      major_objs_i      => major_objs_s,
      major_quad_objs_i => major_quad_objs_s,
      rom_addr_o        => rom_addr_o,
      rom_en_o          => rom_en_o,
      rom_data_i        => rom_data_i,
      major_pix_o       => major_pix_s,
      major_attr_o      => major_attr_s,
      major_coll_o      => major_coll_s
    );


  -----------------------------------------------------------------------------
  -- Minor display system
  -----------------------------------------------------------------------------
  minor_b : i8244_minor
    port map (
      clk_i            => clk_i,
      clk_rise_en_i    => clk_rise_en_s,
      clk_fall_en_i    => clk_fall_en_s,
      res_i            => res_s,
      hpos_i           => hpos_s,
      vpos_i           => vpos_s,
      hbl_i            => hbl_s,
      vbl_i            => vbl_s,
      minor_objs_i     => minor_objs_s,
      minor_patterns_i => minor_patterns_s,
      minor_pix_o      => minor_pix_s
    );


  -----------------------------------------------------------------------------
  -- Process disp_en
  --
  -- Purpose:
  --   Masks the pixel signals when display is disabled
  --
  disp_en: process (en_disp_s,
                    grid_cfg_s,
                    grid_hpix_s, grid_vpix_s, grid_dpix_s,
                    major_pix_s,
                    minor_pix_s)
  begin
    -- enable major an minor pix channels
    if en_disp_s = '1' then
      major_pix_en_s <= major_pix_s;
      minor_pix_en_s <= minor_pix_s;
    else
      major_pix_en_s <= '0';
      minor_pix_en_s <= (others => '0');
    end if;

    -- enable horizontal and vertical grid channels
    if grid_cfg_s.enable = '1' then
      grid_hpix_en_s <= grid_hpix_s;
      grid_vpix_en_s <= grid_vpix_s;
    else
      grid_hpix_en_s <= '0';
      grid_vpix_en_s <= '0';
    end if;

    -- enable dot grid channel
    if grid_cfg_s.dot_en = '1' then
      grid_dpix_en_s <= grid_dpix_s;
    else
      grid_dpix_en_s <= '0';
    end if;
  end process disp_en;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- CPU I/O module
  -----------------------------------------------------------------------------
  cpuio_b : i8244_cpuio
    port map (
      clk_i             => clk_i,
      clk_rise_en_i     => clk_rise_en_s,
      clk_fall_en_i     => clk_fall_en_s,
      res_i             => res_s,
      hpos_i            => hpos_s,
      vpos_i            => vpos_s,
      vbl_i             => vbl_s,
      hor_int_i         => hor_int_s,
      stb_i             => stb_i,
      ale_i             => ale_i,
      din_i             => din_i,
      dout_o            => dout_o,
      dout_en_o         => dout_en_o,
      cs_n_i            => cs_n_i,
      rd_n_i            => rd_n_i,
      wr_n_i            => wr_n_i,
      intr_n_o          => intr_n_o,
      en_disp_o         => en_disp_s,
      grid_bg_col_o     => grid_bg_col_s,
      cx_i              => cx_i,
      grid_hpix_i       => grid_hpix_en_s,
      grid_vpix_i       => grid_vpix_en_s,
      grid_dpix_i       => grid_dpix_en_s,
      major_pix_i       => major_pix_en_s,
      minor_pix_i       => minor_pix_en_s,
      major_coll_i      => major_coll_s,
      grid_cfg_o        => grid_cfg_s,
      major_objs_o      => major_objs_s,
      major_quad_objs_o => major_quad_objs_s,
      minor_objs_o      => minor_objs_s,
      minor_patterns_o  => minor_patterns_s,
      cpu2snd_o         => cpu2snd_s,
      snd_int_i         => snd_int_s
    );


  -----------------------------------------------------------------------------
  -- Color mux module
  -----------------------------------------------------------------------------
  minor_cols: for obj in minor_obj_range_t generate
    minor_cols_s(obj) <= minor_objs_s(obj).col;
  end generate;
  --
  col_mux_b : i8244_col_mux
    port map (
      clk_i         => clk_i,
      clk_en_i      => clk_en_s,
      res_i         => res_s,
      hbl_i         => hbl_s,
      vbl_i         => vbl_s,
      grid_bg_col_i => grid_bg_col_s,
      grid_hpix_i   => grid_hpix_en_s,
      grid_vpix_i   => grid_vpix_en_s,
      grid_dpix_i   => grid_dpix_en_s,
      major_pix_i   => major_pix_en_s,
      major_attr_i  => major_attr_s,
      minor_pix_i   => minor_pix_en_s,
      minor_attrs_i => minor_cols_s,
      r_o           => r_o,
      g_o           => g_o,
      b_o           => b_o,
      l_o           => l_o
    );


  -----------------------------------------------------------------------------
  -- Sound module
  -----------------------------------------------------------------------------
  sound_b : i8244_sound
    port map (
      clk_i     => clk_i,
      clk_en_i  => clk_fall_en_s,
      res_i     => res_s,
      hbl_i     => hbl_s,
      cpu2snd_i => cpu2snd_s,
      snd_int_o => snd_int_s,
      snd_o     => snd_o,
      snd_vec_o => snd_vec_o
    );

end struct;
