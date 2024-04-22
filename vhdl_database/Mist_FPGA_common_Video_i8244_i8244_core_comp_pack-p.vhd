-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_core_comp_pack-p.vhd,v 1.6 2007/02/05 22:08:59 arnim Exp $
--
-- Copyright (c) 2007, Arnim Laeuger (arnim.laeuger@gmx.net)
--
-- All rights reserved
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package i8244_core_comp_pack is

  component i8244_charset_rom
    port (
      clk_i      : in  std_logic;
      rom_addr_i : in  std_logic_vector(8 downto 0);
      rom_en_i   : in  std_logic;
      rom_data_o : out std_logic_vector(7 downto 0)
    );
  end component;

  component i8244_core
    generic (
      is_pal_g : integer := 1
    );
    port (
      -- System Interface -----------------------------------------------------
      clk_i      : in  std_logic;
      clk_en_i   : in  std_logic;
      res_n_i    : in  std_logic;
      -- ROM Interface --------------------------------------------------------
      rom_addr_o : out std_logic_vector(8 downto 0);
      rom_en_o   : out std_logic;
      rom_data_i : in  std_logic_vector(7 downto 0);
      -- I8244 Pads Interface -------------------------------------------------
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
  end component;

  component i8244_top_sync
    generic (
      is_pal_g : integer := 1
    );
    port (
      -- System Interface -----------------------------------------------------
      clk_i      : in  std_logic;
      clk_en_i   : in  std_logic;
      res_n_i    : in  std_logic;
      -- I8244 Pads Interface -------------------------------------------------
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
  end component;

end;
