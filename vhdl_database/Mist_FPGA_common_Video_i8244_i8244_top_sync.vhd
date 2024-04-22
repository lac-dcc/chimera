-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_top_sync.vhd,v 1.5 2007/02/05 22:08:59 arnim Exp $
--
-- i8244 Synchronous Toplevel
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

entity i8244_top_sync is

  generic (
    is_pal_g : integer := 1
  );
  port (
    -- System Interface -------------------------------------------------------
    clk_i      : in  std_logic;
    clk_en_i   : in  std_logic;
    res_n_i    : in  std_logic;
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

end i8244_top_sync;


use work.i8244_core_comp_pack.i8244_core;
use work.i8244_core_comp_pack.i8244_charset_rom;

architecture struct of i8244_top_sync is

  signal rom_addr_s : std_logic_vector(8 downto 0);
  signal rom_en_s   : std_logic;
  signal rom_data_s : std_logic_vector(7 downto 0);

begin

  -----------------------------------------------------------------------------
  -- I8244 Core
  -----------------------------------------------------------------------------
  core_b : i8244_core
    generic map (
      is_pal_g => is_pal_g
    )
    port map (
      clk_i      => clk_i,
      clk_en_i   => clk_en_i,
      res_n_i    => res_n_i,
      rom_addr_o => rom_addr_s,
      rom_en_o   => rom_en_s,
      rom_data_i => rom_data_s,
      intr_n_o   => intr_n_o,
      stb_i      => stb_i,
      bg_o       => bg_o,
      hsync_o    => hsync_o,
      vsync_o    => vsync_o,
      ms_i       => ms_i,
      hbl_o      => hbl_o,
      vbl_i      => vbl_i,
      vbl_o      => vbl_o,
      cx_i       => cx_i,
      l_o        => l_o,
      cs_n_i     => cs_n_i,
      wr_n_i     => wr_n_i,
      rd_n_i     => rd_n_i,
      din_i      => din_i,
      dout_o     => dout_o,
      dout_en_o  => dout_en_o,
      r_o        => r_o,
      g_o        => g_o,
      b_o        => b_o,
      ale_i      => ale_i,
      snd_o      => snd_o,
      snd_vec_o  => snd_vec_o
    );


  -----------------------------------------------------------------------------
  -- Character set ROM
  -----------------------------------------------------------------------------
  charset_rom_b : i8244_charset_rom
    port map (
      clk_i      => clk_i,
      rom_addr_i => rom_addr_s,
      rom_en_i   => rom_en_s,
      rom_data_o => rom_data_s
    );

end struct;
