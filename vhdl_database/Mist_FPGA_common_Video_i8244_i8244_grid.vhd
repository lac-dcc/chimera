-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_grid.vhd,v 1.14 2007/02/05 22:08:59 arnim Exp $
--
-- Grid Generator
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

use work.i8244_pack.pos_t;
use work.i8244_grid_pack.grid_cfg_t;

entity i8244_grid is

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

end i8244_grid;


library ieee;
use ieee.numeric_std.all;

use work.i8244_pack.all;
use work.i8244_grid_pack.all;

architecture rtl of i8244_grid is

  -----------------------------------------------------------------------------
  -- Grid geometry:
  --
  -- number of horizontal grid segments
  constant grid_hnum_c    : natural := 10;
  -- left horizontal offset (3.54 MHz clocks)
  constant grid_hoffset_c : natural := 16#08#;
  -- horizontal width of vertical segments and dots (3.54 MHz clock)
  constant grid_hwidth_c  : natural := 16#02#;
  -- length/spacing of horizontal grid segments (3.54 MHz clock)
  constant grid_hspace_c  : natural := 16#10#;
  --
  -- number of vertical grid segments
  constant grid_vnum_c    : natural := 9;
  -- upper vertical offset (scanlines)
  constant grid_voffset_c : natural := 16#18#;
  -- vertical height of horizontal segments and dots (scanlines)
  constant grid_vwidth_c  : natural := 16#03#;
  -- height/spacing of vertical grid segments (scanlines)
  constant grid_vspace_c  : natural := 16#18#;
  --
  -----------------------------------------------------------------------------

  signal hgrid_q,
         vgrid_q,
         dgrid_q  : std_logic;

begin

  -----------------------------------------------------------------------------
  -- Process grid_gen
  --
  -- Purpose:
  --   Generates the grid activity signals for horizontal and vertical
  --   grid elements.
  --
  grid_gen: process (clk_i, res_i)
    variable hpos_v,
             vpos_v   : natural;
    variable upper_v,
             lower_v,
             left_v,
             right_v,
             dot_v    : natural;
  begin
    if res_i then
      hgrid_q <= '0';
      vgrid_q <= '0';
      dgrid_q <= '0';

    elsif rising_edge(clk_i) then
      -- horizontal positioning bases on 3.54 MHz pixels/clocks
      hpos_v := to_integer(hpos_i(pos_t'high downto 1));
      -- vertical positioning bases on scanlines (no scaling etc.)
      vpos_v := to_integer(vpos_i);

      if clk_en_i then
        hgrid_q <= '0';
        dgrid_q <= '0';
        vgrid_q <= '0';

        -- horizontal bars ----------------------------------------------------
        for hbar in 0 to grid_vnum_c-1 loop
          upper_v := grid_voffset_c + hbar * grid_vspace_c;
          lower_v := upper_v + grid_vwidth_c;

          -- check upper and lower bar/dot limits
          if vpos_v >= upper_v and vpos_v < lower_v then
            for idx in 0 to grid_hnum_c-2 loop
              left_v  := grid_hoffset_c + idx * grid_hspace_c;
              right_v := left_v + grid_hspace_c + grid_hwidth_c;
              dot_v   := left_v + grid_hwidth_c;

              -- check left limit
              if hpos_v >= left_v then
                -- bar: check right limit
                if hpos_v < right_v then
                  if grid_cfg_i.bars.hbars(hbar)(idx) = '1' then
                    hgrid_q <= '1';
                  end if;
                end if;
                -- dot: check right limit
                if hpos_v < dot_v then
                  dgrid_q <= '1';
                end if;
              end if;
            end loop;
          end if;
        end loop;

        -- vertical bars ------------------------------------------------------
        for vbar in 0 to grid_hnum_c-1 loop
          left_v    := grid_hoffset_c + vbar * grid_hspace_c;
          if grid_cfg_i.wide = '1' then
            -- wide grid extends over horizontal space
            right_v := left_v + grid_hspace_c;
          else
            -- normal grid
            right_v := left_v + grid_hwidth_c;
          end if;

          -- check left and right bar limits
          if hpos_v >= left_v and hpos_v < right_v then
            for idx in 0 to grid_vnum_c-2 loop
              upper_v := grid_voffset_c + idx * grid_vspace_c;
              lower_v := upper_v + grid_vspace_c;

              -- check upper and lower bar limits
              if vpos_v >= upper_v and vpos_v < lower_v then
                if grid_cfg_i.bars.vbars(vbar)(idx) = '1' then
                  vgrid_q <= '1';
                end if;
              end if;
            end loop;
          end if;
        end loop;

      end if;
    end if;
  end process grid_gen;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Output mapping
  -----------------------------------------------------------------------------
  grid_hpix_o <= hgrid_q;
  grid_vpix_o <= vgrid_q;
  grid_dpix_o <= dgrid_q;

end rtl;
