-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_comp_pack-p.vhd,v 1.21 2007/02/05 22:08:59 arnim Exp $
--
-- Copyright (c) 2007, Arnim Laeuger (arnim.laeuger@gmx.net)
--
-- All rights reserved
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.i8244_pack.pos_t;
use work.i8244_pack.byte_t;
use work.i8244_pack.col_attr_t;
use work.i8244_pack.col_attrs_t;

use work.i8244_grid_pack.grid_cfg_t;

use work.i8244_minor_pack.minor_objs_t;
use work.i8244_minor_pack.minor_patterns_t;
use work.i8244_minor_pack.minor_obj_range_t;

use work.i8244_major_pack.all;

use work.i8244_sound_pack.cpu2snd_t;

package i8244_comp_pack is

  component i8244_sync_gen
    generic (
      is_pal_g : integer := 1
    );
    port (
      clk_i         : in  std_logic;
      clk_en_i      : in  boolean;
      clk_rise_en_o : out boolean;
      clk_fall_en_o : out boolean;
      res_i         : in  boolean;
      ms_i          : in  std_logic;
      vbl_i         : in  std_logic;
      hbl_o         : out std_logic;
      hsync_o       : out std_logic;
      vsync_o       : out std_logic;
      bg_o          : out std_logic;
      vbl_o         : out std_logic;
      hpos_o        : out pos_t;
      vpos_o        : out pos_t;
      hor_int_o     : out std_logic
    );
  end component;

  component i8244_grid
    port (
      clk_i       : in  std_logic;
      clk_en_i    : in  boolean;
      res_i       : in  boolean;
      hpos_i      : in  pos_t;
      vpos_i      : in  pos_t;
      hbl_i       : in  std_logic;
      vbl_i       : in  std_logic;
      grid_cfg_i  : in  grid_cfg_t;
      grid_hpix_o : out std_logic;
      grid_vpix_o : out std_logic;
      grid_dpix_o : out std_logic
    );
  end component;

  component i8244_minor
    port (
      clk_i            : in  std_logic;
      clk_rise_en_i    : in  boolean;
      clk_fall_en_i    : in  boolean;
      res_i            : in  boolean;
      hpos_i           : in  pos_t;
      vpos_i           : in  pos_t;
      hbl_i            : in  std_logic;
      vbl_i            : in  std_logic;
      minor_objs_i     : in  minor_objs_t;
      minor_patterns_i : in  minor_patterns_t;
      minor_pix_o      : out std_logic_vector(minor_obj_range_t)
    );
  end component;

  component i8244_major_obj
    port (
      clk_i      : in  std_logic;
      clk_en_i   : in  boolean;
      res_i      : in  boolean;
      hpos_i     : in  pos_t;
      vpos_i     : in  pos_t;
      vstop_i    : in  boolean;
      hstop_i    : in  boolean;
      obj_i      : in  major_obj_t;
      vhmatch_o  : out boolean;
      lss_o      : out lss_t;
      col_attr_o : out col_attr_t
    );
  end component;

  component i8244_major_quad_obj
    port (
      clk_i      : in  std_logic;
      clk_en_i   : in  boolean;
      res_i      : in  boolean;
      hpos_i     : in  pos_t;
      vpos_i     : in  pos_t;
      vstop_i    : in  boolean;
      hstop_i    : in  boolean;
      quad_obj_i : in  major_quad_obj_t;
      vhmatch_o  : out boolean;
      lss_o      : out lss_t;
      col_attr_o : out col_attr_t
    );
  end component;

  component i8244_major
    port (
      clk_i             : in  std_logic;
      clk_fall_en_i     : in  boolean;
      res_i             : in  boolean;
      hpos_i            : in  pos_t;
      vpos_i            : in  pos_t;
      major_objs_i      : in  major_objs_t;
      major_quad_objs_i : in  major_quad_objs_t;
      rom_addr_o        : out rom_addr_t;
      rom_en_o          : out std_logic;
      rom_data_i        : in  rom_data_t;
      major_pix_o       : out std_logic;
      major_attr_o      : out col_attr_t;
      major_coll_o      : out boolean
    );
  end component;

  component i8244_cpuio
    port (
      -- Global Interface -----------------------------------------------------
      clk_i             : in  std_logic;
      clk_rise_en_i     : in  boolean;
      clk_fall_en_i     : in  boolean;
      res_i             : in  boolean;
      hpos_i            : in  pos_t;
      vpos_i            : in  pos_t;
      vbl_i             : in  std_logic;
      hor_int_i         : in  std_logic;
      stb_i             : in  std_logic;
      -- Bus Interface --------------------------------------------------------
      ale_i             : in  std_logic;
      din_i             : in  byte_t;
      dout_o            : out byte_t;
      dout_en_o         : out std_logic;
      cs_n_i            : in  std_logic;
      rd_n_i            : in  std_logic;
      wr_n_i            : in  std_logic;
      intr_n_o          : out std_logic;
      -- Display interface ----------------------------------------------------
      en_disp_o         : out std_logic;
      grid_bg_col_o     : out std_logic_vector(6 downto 0);
      cx_i              : in  std_logic;
      grid_hpix_i       : in  std_logic;
      grid_vpix_i       : in  std_logic;
      grid_dpix_i       : in  std_logic;
      major_pix_i       : in  std_logic;
      minor_pix_i       : in  std_logic_vector(minor_obj_range_t);
      major_coll_i      : in  boolean;
      -- Grid Configuration ---------------------------------------------------
      grid_cfg_o        : out grid_cfg_t;
      -- Major Objects --------------------------------------------------------
      major_objs_o      : out major_objs_t;
      major_quad_objs_o : out major_quad_objs_t;
      -- Minor Objects --------------------------------------------------------
      minor_objs_o      : out minor_objs_t;
      minor_patterns_o  : out minor_patterns_t;
      -- Sound Interface ------------------------------------------------------
      cpu2snd_o         : out cpu2snd_t;
      snd_int_i         : in  boolean
    );
  end component;

  component i8244_col_mux
    port (
      clk_i         : in  std_logic;
      clk_en_i      : in  boolean;
      res_i         : in  boolean;
      hbl_i         : in  std_logic;
      vbl_i         : in  std_logic;
      grid_bg_col_i : in  std_logic_vector(6 downto 0);
      grid_hpix_i   : in  std_logic;
      grid_vpix_i   : in  std_logic;
      grid_dpix_i   : in  std_logic;
      major_pix_i   : in  std_logic;
      major_attr_i  : in  col_attr_t;
      minor_pix_i   : in  std_logic_vector(minor_obj_range_t);
      minor_attrs_i : in  col_attrs_t(minor_obj_range_t);
      r_o           : out std_logic;
      g_o           : out std_logic;
      b_o           : out std_logic;
      l_o           : out std_logic
    );
  end component;

  component i8244_sound
    port (
      clk_i     : in  std_logic;
      clk_en_i  : in  boolean;
      res_i     : in  boolean;
      hbl_i     : in  std_logic;
      cpu2snd_i : in  cpu2snd_t;
      snd_int_o : out boolean;
      snd_o     : out std_logic;
      snd_vec_o : out std_logic_vector(3 downto 0)
    );
  end component;

end;
