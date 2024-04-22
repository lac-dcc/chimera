-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_major_quad_obj.vhd,v 1.7 2007/02/05 22:08:59 arnim Exp $
--
-- Major Display Quad Object
---
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
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.i8244_pack.pos_t;
use work.i8244_pack.col_attr_t;
use work.i8244_major_pack.all;

entity i8244_major_quad_obj is

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

end i8244_major_quad_obj;


library ieee;
use ieee.numeric_std.all;

use work.i8244_comp_pack.i8244_major_obj;

architecture rtl of i8244_major_quad_obj is

  signal vhmatch_s   : boolean;
  signal vstop_s     : boolean;
  signal obj_s       : major_obj_t;

  signal match_cnt_q : unsigned(1 downto 0);

begin

  -----------------------------------------------------------------------------
  -- One core major object
  -----------------------------------------------------------------------------
  obj_b : i8244_major_obj
    port map (
      clk_i      => clk_i,
      clk_en_i   => clk_en_i,
      res_i      => res_i,
      hpos_i     => hpos_i,
      vpos_i     => vpos_i,
      vstop_i    => vstop_s,
      hstop_i    => hstop_i,
      obj_i      => obj_s,
      vhmatch_o  => vhmatch_s,
      lss_o      => lss_o,
      col_attr_o => col_attr_o
    );


  -----------------------------------------------------------------------------
  -- Process cnt
  --
  -- Purpose:
  --   Implements the counter for tracking horizontal matches.
  --   It is used to determine when the fourth character inside this quad
  --   element has been displayed.
  --   It also adds an offset to the horizontal CAM value as it increments.
  --
  cnt: process (clk_i, res_i)
  begin
    if res_i then
      match_cnt_q <= (others => '0');
    elsif rising_edge(clk_i) then
      if clk_en_i then
        if vhmatch_s then
          match_cnt_q <= match_cnt_q + 1;
        end if;
      end if;
    end if;
  end process cnt;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process ctrl
  --
  -- Purpose:
  --   Controls the embedded major object.
  --   According to the current state of the match counter, it
  --     * calculates the next horizontal CAM value
  --     * provides the lss and attr parts of the four quad elements
  --     * suppresses the vstop input until the fourth element is
  --       displayed
  --
  ctrl: process (match_cnt_q,
                 quad_obj_i,
                 vstop_i)
    variable next_cam_x_v : unsigned(7 downto 0);
  begin
    -- default assignments
    vstop_s      <= false;
    obj_s.cam_y  <= quad_obj_i.cam_y;

    -- add content of match counter times 16 to the horizontal CAM value
    next_cam_x_v := unsigned(quad_obj_i.cam_x);
    next_cam_x_v(7 downto 4) := next_cam_x_v(7 downto 4) + match_cnt_q;
    obj_s.cam_x  <= std_logic_vector(next_cam_x_v);

    -- note: match_cnt_q points to the NEXT displayed object
    --       thus lss is taken from the next (pointed to) object while
    --       the color attributes are taken from the current (previous pointed
    --       to) object
    case match_cnt_q is
      when "00" =>
        obj_s.attr.lss <= quad_obj_i.attrs(0).lss;
        obj_s.attr.col <= quad_obj_i.attrs(3).col;
        -- enable vstop trigger
        vstop_s         <= vstop_i;
      when "01" =>
        obj_s.attr.lss <= quad_obj_i.attrs(1).lss;
        obj_s.attr.col <= quad_obj_i.attrs(0).col;
      when "10" =>
        obj_s.attr.lss <= quad_obj_i.attrs(2).lss;
        obj_s.attr.col <= quad_obj_i.attrs(1).col;
      when others =>
        obj_s.attr.lss <= quad_obj_i.attrs(3).lss;
        obj_s.attr.col <= quad_obj_i.attrs(2).col;
    end case;

  end process ctrl;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Output mapping
  -----------------------------------------------------------------------------
  vhmatch_o <= vhmatch_s;

end rtl;
