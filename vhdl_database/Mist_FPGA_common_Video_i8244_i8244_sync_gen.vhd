-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_sync_gen.vhd,v 1.15 2007/02/05 22:08:59 arnim Exp $
--
-- Sync Generator
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

entity i8244_sync_gen is

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

end i8244_sync_gen;


library ieee;
use ieee.numeric_std.all;

use work.i8244_pack.all;

architecture rtl of i8244_sync_gen is

  type limits_t is array (natural range 0 to 1) of pos_t;

  -- last horizontal blank defines horizontal interval:
  --   (228 * 2) - 1 = 455
  constant last_hpos_c       : pos_t := to_pos_f(454);
  constant last_hblank_c     : pos_t := last_hpos_c - to_pos_f(0);
  constant first_hblank_c    : pos_t := last_hblank_c - to_pos_f(87);
  constant first_hsync_c     : pos_t := first_hblank_c + to_pos_f(10);
  constant last_hsync_c      : pos_t := first_hsync_c + to_pos_f(34-1);
  constant first_bg_c        : pos_t := first_hblank_c + to_pos_f(48);
  constant last_bg_c         : pos_t := first_bg_c + to_pos_f(18-1);
  -- horizontal interrupt starts 20 us before hblank
  constant first_hor_int_c   : pos_t := first_hblank_c - to_pos_f(142);
  -- and ends 5 us before end of hblank
  constant last_hor_int_c    : pos_t := last_hblank_c - to_pos_f(37);

  constant last_vis_line_c   : pos_t := to_pos_f(239);
  constant last_frame_line_c : limits_t := (
    is_ntsc_c => to_pos_f(261),
    is_pal_c  => to_pos_f(311));
  constant first_vblank_c    : pos_t := last_vis_line_c + to_pos_f(0);
  constant last_vblank_c     : limits_t := (
    is_ntsc_c => to_pos_f(0),
    is_pal_c  => to_pos_f(0));
  constant first_vsync_c     : pos_t := first_vblank_c + to_pos_f(16);
  constant last_vsync_c      : pos_t := first_vsync_c + to_pos_f(5);

  signal hpos_q        : pos_t;
  signal vpos_q        : pos_t;

  signal vbl_slave_q   : std_logic;

  signal hbl_q         : std_logic;
  signal hsync_q       : std_logic;
  signal vsync_q       : std_logic;
  signal bg_q          : std_logic;
  signal vbl_q         : std_logic;
  signal hor_int_q     : std_logic;

begin

  -----------------------------------------------------------------------------
  -- Process pos_count
  --
  -- Purpose:
  --   Implements the hpos and vpos counters.
  --   The vpos counter depends on the NTSC/PAL setting and can be
  --   synchronized from an external vbl signal in slave mode.
  --
  --   Furthermore, the flags for generating hbl, hsync, bg and vbl
  --   are managed here.
  --
  pos_count: process (clk_i, res_i)
    variable last_frame_line_v : pos_t;
    variable last_vblank_v     : pos_t;
    variable vbl_sync_v        : boolean;
    variable vinc_v            : boolean;
  begin
    if res_i then
      hpos_q        <= to_pos_f(0);
      vpos_q        <= to_pos_f(0);
      vbl_slave_q   <= '0';
      --
      hbl_q        <= '0';
      hsync_q      <= '0';
      vsync_q      <= '0';
      bg_q         <= '0';
      vbl_q        <= '0';
      hor_int_q    <= '0';

    elsif rising_edge(clk_i) then
      last_frame_line_v := last_frame_line_c(is_pal_g);
      last_vblank_v     := last_vblank_c(is_pal_g);

      if clk_en_i then
        -- sync to rising edge of external vbl in slave mode ------------------
        vbl_slave_q <= vbl_i;
        if ms_i = '0' and
           vbl_slave_q = '0' and vbl_i = '1' then
          vbl_sync_v := true;
        else
          vbl_sync_v := false;
        end if;

        -- horizontal position counter ----------------------------------------
        vinc_v   := false;
        if    vbl_sync_v then
          -- sync to pixel 1 in new line
          hpos_q <= to_pos_f(1);
        else
          if hpos_q = last_hpos_c then
            hpos_q <= to_pos_f(0);
            vinc_v := true;
          else
            hpos_q <= hpos_q + 1;
          end if;
        end if;

        -- vertical position counter ------------------------------------------
        if    vbl_sync_v then
          -- sync to first line of VBLANK
          vpos_q <= first_vblank_c + to_pos_f(1);
        elsif vinc_v then
          if vpos_q = last_frame_line_v then
            vpos_q <= to_pos_f(0);
          else
            vpos_q <= vpos_q + 1;
          end if;
        end if;

        -- timing flags -------------------------------------------------------
        if vbl_sync_v then
          hbl_q     <= '0';
          hsync_q   <= '0';
          vsync_q   <= '0';
          bg_q      <= '0';
          vbl_q     <= '1';
        else
          -- hbl
          if    hpos_q = first_hblank_c - 1 then
            hbl_q   <= '1';
          elsif hpos_q = last_hblank_c then
            hbl_q   <= '0';
          end if;

          -- hsync
          if    hpos_q = first_hsync_c - 1 then
            hsync_q <= '1';
          elsif hpos_q = last_hsync_c then
            hsync_q <= '0';
          end if;

          -- vsync
          if    vpos_q = first_vsync_c - 1 then
            vsync_q <= '1';
          elsif vpos_q = last_vsync_c then
            vsync_q <= '0';
          end if;

          -- bg
          if    hpos_q = first_bg_c - 1 then
            bg_q    <= '1';
          elsif hpos_q = last_bg_c then
            bg_q    <= '0';
          end if;

          -- vbl
          if vinc_v then
            if    vpos_q = first_vblank_c then
              vbl_q <= '1';
            elsif vpos_q = last_vblank_v then
              vbl_q <= '0';
            end if;
          end if;

          -- horizontal interrupt
          if    hpos_q = first_hor_int_c - 1 then
            hor_int_q <= '1';
          elsif hpos_q = last_hsync_c then
            hor_int_q <= '0';
          end if;

        end if;

      end if;
    end if;
  end process pos_count;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Output mapping
  -----------------------------------------------------------------------------
  clk_rise_en_o <= clk_en_i and hpos_q(0) = '1';
  clk_fall_en_o <= clk_en_i and hpos_q(0) = '0';
  hbl_o         <= hbl_q;
  hsync_o       <= hsync_q;
  vsync_o       <= vsync_q;
  bg_o          <= bg_q;
  vbl_o         <= vbl_q;
  hpos_o        <= hpos_q;
  vpos_o        <= vpos_q;
  hor_int_o     <= hor_int_q;

end rtl;
