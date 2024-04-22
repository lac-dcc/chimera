-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_minor.vhd,v 1.9 2007/02/05 22:08:59 arnim Exp $
--
-- Minor Display System
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
use work.i8244_minor_pack.all;

entity i8244_minor is

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

end i8244_minor;


library ieee;
use ieee.numeric_std.all;

use work.i8244_pack.byte_t;

architecture rtl of i8244_minor is

  -- a line counter for each object
  subtype  line_cnt_t      is unsigned(2 downto 0);
  type     line_cnts_t     is array (minor_obj_range_t) of line_cnt_t;
  signal   line_cnts_q     : line_cnts_t;
  -- and a flag that tells whether the object is active or idle
  type     objs_active_t   is array (minor_obj_range_t) of boolean;
  signal   objs_active_q   : objs_active_t;

  -- a shift register for each object
  type     shift_regs_t    is array (minor_obj_range_t) of byte_t;
  signal   shift_regs_q    : shift_regs_t;

  -- counter delay registers
  subtype del_cnt_t        is unsigned(0 downto 0);
  type    del_cnts_t       is array (minor_obj_range_t) of del_cnt_t;
  signal  del_cnts_q       : del_cnts_t;

  -- pixel delay registers
  type     del_pix_t       is array (minor_obj_range_t) of std_logic;
  signal   del_pix_q       : del_pix_t;

  signal   hbl_q           : std_logic;
  signal   hbl_rising_q    : boolean;

begin

  -----------------------------------------------------------------------------
  -- Process minor_objects
  --
  -- Purpose:
  --   Implements all minor objects.
  --
  minor_objects: process (clk_i, res_i)
    variable objs_active_v  : objs_active_t;
    variable update_shift_v : objs_active_t;
    variable del_cnt_rel_v  : del_cnt_t;
  begin
    if res_i then
      line_cnts_q   <= (others => (others => '0'));
      objs_active_q <= (others => false);
      del_cnts_q    <= (others => (others => '0'));
      shift_regs_q  <= (others => (others => '0'));
      hbl_q         <= '0';
      hbl_rising_q  <= false;

    elsif rising_edge(clk_i) then
      objs_active_v := objs_active_q;

      -- check vertical CAM match
      if vbl_i = '0' then
        for object in minor_obj_range_t loop
          -- is there a vertical CAM match?
          if unsigned(minor_objs_i(object).cam_y) = vpos_i(7 downto 0) then
            objs_active_v(object) := true;
          end if;
        end loop;
      end if;

      if clk_fall_en_i then
        -- edge detection flag
        hbl_q         <= hbl_i;
        hbl_rising_q  <= hbl_i = '1' and hbl_q = '0';

        -- commit "object active" flags
        objs_active_q <= objs_active_v;

        -- check horizontal CAM match
        update_shift_v := (others => false);
        for object in minor_obj_range_t loop
          if objs_active_v(object) then
            if unsigned(minor_objs_i(object).cam_x) = hpos_i(pos_t'high downto 1) then
              -- parallel load of shift register when horizontal position matched
              update_shift_v(object) := true;
            end if;
          end if;
        end loop;

        -- increment line counters upon rising hbl edge
        if hbl_rising_q then
          for object in minor_obj_range_t loop
            if objs_active_q(object) then
              -- increment on this line if
              --   a) object is single size (D attribute = 0) and
              --      current vertical line is the "second line"
              --   b) object is double size (D attribute = 1) and
              --      current vertical line is the "fourth line"
              if (minor_objs_i(object).d = '0' and
                  vpos_i(0) = not minor_objs_i(object).cam_y(0)) or
                 (minor_objs_i(object).d = '1' and
                  vpos_i(1 downto 0) = unsigned(minor_objs_i(object).cam_y(1 downto 0)) - 1) then
                line_cnts_q(object) <= line_cnts_q(object) + 1;
                if line_cnts_q(object) = "111" then
                  -- stop counter on overflow
                  objs_active_q(object) <= false;
                end if;
              end if;
            end if;
          end loop;
        end if;

        -- delay counter
        for object in minor_obj_range_t loop
          del_cnt_rel_v := (0 => minor_objs_i(object).d);
          if update_shift_v(object) then
            -- preset upon CAM match
            del_cnts_q(object)   <= del_cnt_rel_v;
          else
            if del_cnts_q(object) = 0 then
              del_cnts_q(object) <= del_cnt_rel_v;
            else
              del_cnts_q(object) <= del_cnts_q(object) - 1;
            end if;
          end if;
        end loop;

        -- shift register implementation
        for object in minor_obj_range_t loop
          if    update_shift_v(object) then
            -- parallel load upon CAM match
            shift_regs_q(object) <= minor_patterns_i(object)(to_integer(line_cnts_q(object)));
          elsif del_cnts_q(object) = 0 then
            -- shift one bit position to the right
            shift_regs_q(object)(byte_t'high-1 downto 0) <=
              shift_regs_q(object)(byte_t'high downto 1);
            shift_regs_q(object)(byte_t'high) <= '0';
          end if;
        end loop;

      end if;
    end if;
  end process minor_objects;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process del_pix
  --
  -- Purpose:
  --   Implements the delay for even and odd lines.
  --   Depending on attribute bit D, the delay is either
  --     D = 0 : 1 clk_i cycle  = 140 ns
  --     D = 1 : 2 clk_i cycles = 280 ns
  --
  del_pix: process (clk_i, res_i)
  begin
    if res_i then
      del_pix_q <= (others => '0');

    elsif rising_edge(clk_i) then
      for object in minor_obj_range_t loop
        if clk_fall_en_i or
           (clk_rise_en_i and minor_objs_i(object).d = '0') then
          del_pix_q(object) <= shift_regs_q(object)(0);
        end if;
      end loop;

    end if;
  end process del_pix;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process out_mux
  --
  -- Purpose:
  --   Multiplexes the direct or delayed pixel information onto the
  --   module outputs.
  --
  out_mux: process (shift_regs_q,
                    del_pix_q,
                    minor_objs_i,
                    line_cnts_q)
    variable attributes_v : std_logic_vector(1 downto 0);
  begin
    for object in minor_obj_range_t loop
      attributes_v := minor_objs_i(object).s &
                      minor_objs_i(object).x9;

      case attributes_v is
        when "01" =>
          minor_pix_o(object)   <= del_pix_q(object);
        when "10" =>
          if line_cnts_q(object)(0) = '0' then
            minor_pix_o(object) <= del_pix_q(object);
          else
            minor_pix_o(object) <= shift_regs_q(object)(0);
          end if;
        when "11" =>
          if line_cnts_q(object)(0) = '1' then
            minor_pix_o(object) <= del_pix_q(object);
          else
            minor_pix_o(object) <= shift_regs_q(object)(0);
          end if;
        when others =>
          minor_pix_o(object)   <= shift_regs_q(object)(0);
      end case;
    end loop;
  end process out_mux;
  --
  -----------------------------------------------------------------------------

end rtl;
