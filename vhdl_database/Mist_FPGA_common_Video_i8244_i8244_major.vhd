-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_major.vhd,v 1.10 2007/02/05 22:08:59 arnim Exp $
--
-- Major Display System
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

entity i8244_major is

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

end i8244_major;


library ieee;
use ieee.numeric_std.all;

use work.i8244_pack.byte_t;
use work.i8244_comp_pack.i8244_major_obj;
use work.i8244_comp_pack.i8244_major_quad_obj;

architecture rtl of i8244_major is

  -- vertical/horizontal match lines from all major objects
  type     vhmatch_all_t   is array (all_major_obj_range_t) of boolean;
  signal   vhmatch_all_s   : vhmatch_all_t;
  signal   vhmatch_s       : boolean;

  -- LSS information from all major objects
  type     lss_all_t       is array (all_major_obj_range_t) of lss_t;
  signal   lss_all_s       : lss_all_t;
  signal   lss_s           : lss_t;

  -- color attribute information from all major objects
  type     col_attr_all_t  is array (all_major_obj_range_t) of col_attr_t;
  signal   col_attr_all_s  : col_attr_all_t;
  signal   col_attr_s      : col_attr_t;

  signal   vstop_s,
           hstop_s         : boolean;

  signal   rom_addr_s      : rom_addr_t;
  signal   rom_addr_low_q  : std_logic_vector(2 downto 0);

  subtype  pix_idx_t       is unsigned(3 downto 0);
  -- idle value of counter: MSB cleared
  constant pix_idx_idle_c  : pix_idx_t := "0111";
  -- start value upon activation:
  -- set MSB
  constant pix_idx_start_c : pix_idx_t := "1111";
  signal   pix_idx_q       : pix_idx_t;

begin

  -----------------------------------------------------------------------------
  -- Single major objetcs
  -----------------------------------------------------------------------------
  single_object: for idx in 0 to num_major_objects_c-1 generate
    obj_b : i8244_major_obj
      port map (
        clk_i      => clk_i,
        clk_en_i   => clk_fall_en_i,
        res_i      => res_i,
        hpos_i     => hpos_i,
        vpos_i     => vpos_i,
        vstop_i    => vstop_s,
        hstop_i    => hstop_s,
        obj_i      => major_objs_i(idx),
        vhmatch_o  => vhmatch_all_s(idx),
        lss_o      => lss_all_s(idx),
        col_attr_o => col_attr_all_s(idx)
      );
  end generate;


  -----------------------------------------------------------------------------
  -- Quad major objects
  -----------------------------------------------------------------------------
  quad_object: for idx in 0 to num_major_quad_objects_c-1 generate
    obj_b : i8244_major_quad_obj
      port map (
        clk_i      => clk_i,
        clk_en_i   => clk_fall_en_i,
        res_i      => res_i,
        hpos_i     => hpos_i,
        vpos_i     => vpos_i,
        vstop_i    => vstop_s,
        hstop_i    => hstop_s,
        quad_obj_i => major_quad_objs_i(idx),
        vhmatch_o  => vhmatch_all_s(num_major_objects_c + idx),
        lss_o      => lss_all_s(num_major_objects_c + idx),
        col_attr_o => col_attr_all_s(num_major_objects_c + idx)
      );
  end generate;


  -----------------------------------------------------------------------------
  -- Process or_trees
  --
  -- Purpose:
  --   Generates the OR trees on the outputs of all major objects
  --
  or_trees: process (vhmatch_all_s,
                     lss_all_s,
                     col_attr_all_s)
    variable vhmatch_v  : boolean;
    variable lss_v      : lss_t;
    variable col_attr_v : col_attr_t;
  begin
    vhmatch_v  := false;
    lss_v      := (others => '0');
    col_attr_v := (others => '0');

    for idx in 0 to num_all_major_objects_c-1 loop
      vhmatch_v  := vhmatch_v  or vhmatch_all_s(idx);
      lss_v      := lss_v      or lss_all_s(idx);
      col_attr_v := col_attr_v or col_attr_all_s(idx);
    end loop;

    vhmatch_s  <= vhmatch_v;
    lss_s      <= lss_v;
    col_attr_s <= col_attr_v;
  end process or_trees;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process seq
  --
  -- Purpose:
  --   Implements the various sequential elements.
  --
  seq: process (clk_i, res_i)
  begin
    if res_i then
      pix_idx_q      <= pix_idx_idle_c;
      rom_addr_low_q <= (others => '0');

    elsif rising_edge(clk_i) then
      if clk_fall_en_i then
        if    vhmatch_s then
          -- start counter
          pix_idx_q <= pix_idx_start_c;
        elsif pix_idx_q(3) = '1' then
          -- count while active
          pix_idx_q <= pix_idx_q - 1;
        end if;

        rom_addr_low_q <= rom_addr_s(2 downto 0);
      end if;
    end if;
  end process seq;
  --
  -----------------------------------------------------------------------------

  -- stop horizontal presentation of character line
  -- a) when all pixels have been drawn (counter pix_idx is at 0)
  -- b) when a new V/H match for another character occurs
  hstop_s <= clk_fall_en_i and (pix_idx_q(2 downto 0) = 0 or vhmatch_s);
  -- stop vertical presentation of character:
  --   * horizontal presentation finished
  --   * last line of character is shown
  --   * last vertical scanline is shown
  vstop_s <= hstop_s and rom_addr_low_q = "110" and vpos_i(0) = '1';

  -----------------------------------------------------------------------------
  -- Process rom_addr
  --
  -- Purpose:
  --   Implements the 9 bit adder for ROM address calculation.
  --
  rom_addr: process (vpos_i,
                     lss_s)
    variable a_v,
             b_v,
             sum_v : unsigned(8 downto 0);
  begin
    a_v   := '0' & unsigned(vpos_i(8 downto 1));
    b_v   := unsigned(lss_s);
    sum_v := a_v + b_v;

    rom_addr_s <= std_logic_vector(sum_v);
  end process rom_addr;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Output mapping
  -----------------------------------------------------------------------------
  rom_addr_o   <= rom_addr_s;
  rom_en_o     <= '1' when vhmatch_s and clk_fall_en_i else '0';
  major_pix_o  <=   rom_data_i(to_integer(pix_idx_q(2 downto 0)))
                  when pix_idx_q(3) = '1' else
                    '0';
  major_attr_o <= col_attr_s;
  -- major <-> major collision when vhmatches and pix index is in the middle
  -- of a character
  major_coll_o <= clk_fall_en_i and vhmatch_s and
                  pix_idx_q > 8;

end rtl;
