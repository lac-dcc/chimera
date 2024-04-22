-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_major_obj.vhd,v 1.8 2007/02/05 22:08:59 arnim Exp $
--
-- Major Display Object
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
use work.i8244_pack.col_attr_t;
use work.i8244_major_pack.all;

entity i8244_major_obj is

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

end i8244_major_obj;


library ieee;
use ieee.numeric_std.all;

use work.i8244_pack.byte_t;

architecture rtl of i8244_major_obj is

  signal vactive_s,
         vactive_q  : boolean;
  signal hactive_s,
         hactive_q  : boolean;

  signal vhmatch_s  : boolean;

begin

  -----------------------------------------------------------------------------
  -- Process seq
  --
  -- Purpose:
  --   Implements the sequential elements of a major object.
  --
  seq: process (clk_i, res_i)
  begin
    if res_i then
      vactive_q       <= false;
      hactive_q       <= false;
    elsif rising_edge(clk_i) then
      if clk_en_i then
        -- default update
        vactive_q     <= vactive_s;
        hactive_q     <= hactive_s;

        if vactive_q and hactive_q then
          if vstop_i then
            -- char is finished
            vactive_q <= false;
          end if;

          if hstop_i and not vhmatch_s then
            -- current line is finished
            hactive_q <= false;
          end if;
        end if;

      end if;
    end if;
  end process seq;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process comb
  --
  -- Purpose:
  --   Implements the combinational logic of a major object:
  --     * vertical CAM comparison
  --     * horizontal CAM comparison
  --
  comb: process (hpos_i, vpos_i,
                 obj_i,
                 vactive_q, hactive_q)
    variable vactive_v,
             hactive_v  : boolean;
  begin
    -- default assignments
    vhmatch_s <= false;
    vactive_v := vactive_q;
    hactive_v := hactive_q;

    -- vertical CAM comparison ------------------------------------------------
    if vpos_i(pos_t'high downto 1) =
       unsigned(obj_i.cam_y(byte_t'high downto 1)) and
       hpos_i = 0 then
      vactive_v := true;
    end if;

    -- horizontal CAM comparison ----------------------------------------------
    if vactive_v and
       hpos_i(pos_t'high downto 1) =
       unsigned(obj_i.cam_x) then
      hactive_v := true;
      vhmatch_s <= true;
    end if;

    vactive_s <= vactive_v;
    hactive_s <= hactive_v;
  end process comb;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process output
  --
  -- Purpose:
  --   Generates the output signals.
  --   Per default, they are inactive and only when a line of this object
  --   is displayed, they carry information.
  --
  output: process (vactive_q, hactive_q,
                   vhmatch_s,
                   hstop_i,
                   obj_i)
  begin
    -- default (inactive state) assignemnts
    lss_o        <= (others => '0');
    col_attr_o   <= (others => '0');

    -- drive active data when
    --   * V/H match occurs
    --   * this object is actively displaying a line and
    --     no horizontal stop has been signalled
    if vhmatch_s or
       (vactive_q and hactive_q and not hstop_i) then
      -- stop LSS immediately to prevent overlap with next character
      -- when (pre)fetching ROM data
      lss_o    <= obj_i.attr.lss;
    end if;
    if vhmatch_s or
       (vactive_q and hactive_q) then
      col_attr_o <= obj_i.attr.col;
    end if;
  end process output;
  --
  -----------------------------------------------------------------------------

  vhmatch_o <= vhmatch_s;

end rtl;
