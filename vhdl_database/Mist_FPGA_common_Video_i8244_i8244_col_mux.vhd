-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_col_mux.vhd,v 1.8 2007/02/05 22:08:59 arnim Exp $
--
-- Color multiplexer
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

use work.i8244_pack.col_attr_t;
use work.i8244_pack.col_attrs_t;
use work.i8244_minor_pack.minor_obj_range_t;

entity i8244_col_mux is

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

end i8244_col_mux;


architecture rtl of i8244_col_mux is

begin

  -----------------------------------------------------------------------------
  -- Process col_mux
  --
  -- Purpose:
  --   Implements the priority color multiplexor.
  --
  col_mux: process (clk_i, res_i)
    variable col_v : col_attr_t;
    variable lum_v : std_logic;
  begin
    if res_i then
      r_o <= '0';
      g_o <= '0';
      b_o <= '0';
      l_o <= '0';

    elsif rising_edge(clk_i) then
      -- background color
      col_v := grid_bg_col_i(5 downto 3);
      lum_v := '0';

      -- next pane: grid
      if (grid_hpix_i or grid_vpix_i or grid_dpix_i) = '1' then
        col_v := grid_bg_col_i(2 downto 0);
        lum_v := grid_bg_col_i(6);
      end if;

      -- next pane: major objects
      if major_pix_i = '1' then
        for pos in 2 downto 0 loop
          col_v(pos) := major_attr_i(2 - pos);
        end loop;
        lum_v := '1';
      end if;

      -- next pane: minor objects
      -- minor 0 has highest priority
      for obj in minor_obj_range_t'high downto 0 loop
        if minor_pix_i(obj) = '1' then
          for pos in 2 downto 0 loop
            col_v(pos) := minor_attrs_i(obj)(2 - pos);
          end loop;
          lum_v := '1';
        end if;
      end loop;

      if clk_en_i then
        if (hbl_i or vbl_i) = '0' then
          -- assign RGB and luminance outputs
          r_o <= col_v(2);
          g_o <= col_v(1);
          b_o <= col_v(0);
          l_o <= lum_v;
        else
          r_o <= '0';
          g_o <= '0';
          b_o <= '0';
          l_o <= '0';
        end if;
      end if;
    end if;
  end process col_mux;
  --
  -----------------------------------------------------------------------------

end rtl;
