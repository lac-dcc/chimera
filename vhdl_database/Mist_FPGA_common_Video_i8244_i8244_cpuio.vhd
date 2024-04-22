-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_cpuio.vhd,v 1.26 2007/02/05 22:08:59 arnim Exp $
--
-- CPU I/O Interface
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
use work.i8244_pack.byte_t;

use work.i8244_grid_pack.grid_cfg_t;
use work.i8244_major_pack.major_objs_t;
use work.i8244_major_pack.major_quad_objs_t;
use work.i8244_minor_pack.all;
use work.i8244_sound_pack.cpu2snd_t;

entity i8244_cpuio is

  port (
    -- Global Interface -------------------------------------------------------
    clk_i             : in  std_logic;
    clk_rise_en_i     : in  boolean;
    clk_fall_en_i     : in  boolean;
    res_i             : in  boolean;
    hpos_i            : in  pos_t;
    vpos_i            : in  pos_t;
    vbl_i             : in  std_logic;
    hor_int_i         : in  std_logic;
    stb_i             : in  std_logic;
    -- Bus Interface ----------------------------------------------------------
    ale_i             : in  std_logic;
    din_i             : in  byte_t;
    dout_o            : out byte_t;
    dout_en_o         : out std_logic;
    cs_n_i            : in  std_logic;
    rd_n_i            : in  std_logic;
    wr_n_i            : in  std_logic;
    intr_n_o          : out std_logic;
    -- Display interface ------------------------------------------------------
    en_disp_o         : out std_logic;
    grid_bg_col_o     : out std_logic_vector(6 downto 0);
    cx_i              : in  std_logic;
    grid_hpix_i       : in  std_logic;
    grid_vpix_i       : in  std_logic;
    grid_dpix_i       : in  std_logic;
    major_pix_i       : in  std_logic;
    minor_pix_i       : in  std_logic_vector(minor_obj_range_t);
    major_coll_i      : in  boolean;
    -- Grid Configuration -----------------------------------------------------
    grid_cfg_o        : out grid_cfg_t;
    -- Major Objects ----------------------------------------------------------
    major_objs_o      : out major_objs_t;
    major_quad_objs_o : out major_quad_objs_t;
    -- Minor Objects ----------------------------------------------------------
    minor_objs_o      : out minor_objs_t;
    minor_patterns_o  : out minor_patterns_t;
    -- Sound Interface --------------------------------------------------------
    cpu2snd_o         : out cpu2snd_t;
    snd_int_i         : in  boolean
  );

end i8244_cpuio;


library ieee;
use ieee.numeric_std.all;

use work.i8244_pack.all;
use work.i8244_grid_pack.hbars_t;
use work.i8244_grid_pack.grid_bars_t;
use work.i8244_major_pack.major_obj_range_t;
use work.i8244_major_pack.lss_t;
use work.i8244_major_pack.major_quad_obj_range_t;
use work.i8244_major_pack.major_quad_attr_range_t;
use work.i8244_sound_pack.all;

architecture rtl of i8244_cpuio is

  -- ranges and constant values for address decoding
  constant addr_minor_ctrl_s_c    : natural := 16#00#;
  constant addr_minor_ctrl_e_c    : natural := 16#0f#;
  constant addr_major_obj_s_c     : natural := 16#10#;
  constant addr_major_obj_e_c     : natural := 16#3f#;
  constant addr_major_quad_s_c    : natural := 16#40#;
  constant addr_major_quad_e_c    : natural := 16#7f#;
  constant addr_minor_pattern_s_c : natural := 16#80#;
  constant addr_minor_pattern_e_c : natural := 16#9f#;
  constant addr_ctrl_c            : natural := 16#a0#;
  constant addr_ctrl_stat_c       : natural := 16#a1#;
  constant addr_overlap_c         : natural := 16#a2#;
  constant addr_color_c           : natural := 16#a3#;
  constant addr_ypos_c            : natural := 16#a4#;
  constant addr_xpos_c            : natural := 16#a5#;
  constant addr_snd0_c            : natural := 16#a7#;
  constant addr_snd1_c            : natural := 16#a8#;
  constant addr_snd2_c            : natural := 16#a9#;
  constant addr_snd_stat_c        : natural := 16#aa#;
  constant addr_grid_cx_s_c       : natural := 16#c0#;
  constant addr_grid_cx_e_c       : natural := 16#c8#;
  constant addr_grid_dx_s_c       : natural := 16#d0#;
  constant addr_grid_dx_e_c       : natural := 16#d8#;
  constant addr_grid_ex_s_c       : natural := 16#e0#;
  constant addr_grid_ex_e_c       : natural := 16#e9#;

  -- register bits of CONTROL
  constant bit_ctrl_wide_c           : natural := 7;
  constant bit_ctrl_dot_en_c         : natural := 6;
  constant bit_ctrl_en_display_c     : natural := 5;
  constant bit_ctrl_en_ext_overlap_c : natural := 4;
  constant bit_ctrl_en_grid_c        : natural := 3;
  constant bit_ctrl_en_sound_int_c   : natural := 2;
  constant bit_ctrl_fps_c            : natural := 1;
  constant bit_ctrl_en_hor_int_c     : natural := 0;

  -- register bits of ENABLE OVERLAP / OVERLAP STATUS
  constant bit_over_major_c          : natural := 7;
  constant bit_over_ext_c            : natural := 6;
  constant bit_over_hdgrid_c         : natural := 5;
  constant bit_over_vgrid_c          : natural := 4;
  constant bit_over_minor3_c         : natural := 3;
  constant bit_over_minor2_c         : natural := 2;
  constant bit_over_minor1_c         : natural := 1;
  constant bit_over_minor0_c         : natural := 0;

  -- register bits of SOUND CONTROL
  constant bit_snd_en_c              : natural := 7;
  constant bit_snd_freq_c            : natural := 5;
  constant bit_snd_noise_c           : natural := 4;
  constant bit_snd_vol_h_c           : natural := 3;
  constant bit_snd_vol_l_c           : natural := 0;

  signal din_q      : byte_t;

  signal addr_q     : unsigned(byte_t'range);

  signal ale_q,
         rd_n_q,
         wr_n_q,
         cs_n_q     : std_logic;

  signal sel_minor_ctrl_s,
         sel_major_obj_s,
         sel_major_quad_s,
         sel_minor_pattern_s,
         sel_ctrl_s,
         sel_overlap_s,
         sel_color_s,
         sel_sound_s,
         sel_grid_cx_s,
         sel_grid_dx_s,
         sel_grid_ex_s       : boolean;
  signal sel_objsub0_s,
         sel_objsub1_s,
         sel_objsub2_s,
         sel_objsub3_s       : boolean;

  signal reg_minor_objs_q      : minor_objs_t;
  signal reg_major_objs_q      : major_objs_t;
  signal reg_major_quad_objs_q : major_quad_objs_t;
  signal reg_minor_patterns_q  : minor_patterns_t;
  signal reg_ctrl_q,
         reg_enoverlap_q,
         reg_overlap_q,
         reg_y_q,
         reg_x_q,
         reg_sound_q           : byte_t;
  signal reg_color_q           : std_logic_vector(6 downto 0);
  signal reg_grid_bars_q       : grid_bars_t;

  signal pos_strobe_s : std_logic;

  signal vbl_q        : std_logic;
  signal sound_int_q,
         ext_int_q    : boolean;
  signal intr_q       : boolean;
  signal major_coll_q : boolean;

  signal sound_reg_sel_s : sound_reg_sel_t;

  signal min_num_s  : natural range 0 to  3;
  signal maj_num_s  : natural range 0 to 11;
  signal quad_num_s : natural range 0 to  3;
  signal hbar_num_s : natural range 0 to  8;
  signal vbar_num_s : natural range 0 to  9;

  signal ale_pulse_s,
         rd_pulse_s,
         wr_pulse_s   : boolean;

begin

  -----------------------------------------------------------------------------
  -- Process cpu_acc
  --
  -- Purpose:
  --   Generates the central control signals for detecting and executing
  --   accesses from the CPU.
  --
  cpu_acc: process (ale_i, ale_q,
                    rd_n_i, rd_n_q,
                    wr_n_i, wr_n_q,
                    cs_n_i, cs_n_q)
  variable ale_inact_v,
           rd_inact_v,
           wr_inact_v,
           cs_inact_v   : boolean;
  begin
    -- edge detection flags
    ale_inact_v := ale_i  = '0' and ale_q  = '1';
    rd_inact_v  := rd_n_i = '1' and rd_n_q = '0';
    wr_inact_v  := wr_n_i = '1' and wr_n_q = '0';
    cs_inact_v  := cs_n_i = '1' and cs_n_q = '0';

    -- ALE pulse
    ale_pulse_s <= ale_inact_v and cs_n_q = '0';
    -- read pulse
    rd_pulse_s  <= (rd_inact_v and cs_n_q = '0') or
                   (cs_inact_v and rd_n_q = '0');
    -- write pulse
    wr_pulse_s  <= (wr_inact_v and cs_n_q = '0') or
                   (cs_inact_v and wr_n_q = '0');
  end process cpu_acc;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process seq
  --
  -- Purpose:
  --   Implements the sequential elements:
  --     * input data latch
  --     * address latch
  --     * delay flags for ALE, RD#, WR# and CS#
  --     * dedicated storage elements for grid, major and minor object data
  --     * control registers
  --     * overlap collision flags
  --     * interrupt flags
  --     * major <-> major collision flag
  --
  seq: process (clk_i, res_i)
    variable pix_vec_v     : byte_t;

    function tag_overlap_f(pix  : in std_logic_vector;
                           mask : in std_logic_vector;
                           idx  : in natural) return boolean is
      variable pix_or_v, mask_or_v   : std_logic;
      variable pix_res_v, mask_res_v : boolean;
    begin
      pix_or_v  := '0';
      mask_or_v := '0';

      for pos in pix'range loop
        -- OR all pix / masked pix except for the given index
        if pos /= idx then
          pix_or_v  := pix_or_v or pix(pos);
          mask_or_v := mask_or_v or (pix(pos) and mask(pos));
        end if;
      end loop;

      -- 1) overlap bit for idx has to be set when
      --    this channel overlaps with other enabled pix channels
      pix_res_v  := pix(idx) = '1' and mask_or_v = '1';
      -- 2) overlap bit for idx has to be set when
      --    mask enables this bit and other pix channels collide
      mask_res_v := (pix(idx) and mask(idx)) = '1' and
                    pix_or_v = '1';

      return pix_res_v or mask_res_v;
    end;

  begin
    if res_i then
      din_q        <= (others => '0');
      addr_q       <= (others => '0');
      ale_q        <= '0';
      rd_n_q       <= '1';
      wr_n_q       <= '1';
      cs_n_q       <= '1';
      vbl_q        <= '0';
      sound_int_q  <= false;
      ext_int_q    <= false;
      intr_q       <= false;
      major_coll_q <= false;

      for hbar in hbars_t'range loop
        reg_grid_bars_q.hbars(hbar) <= (others => '0');
      end loop;
      reg_grid_bars_q.vbars <= (others => (others => '0'));

--      reg_minor_objs_q <= (others => (cam_y => (others => '1'),
--                                      cam_x => (others => '1'),
--                                      col   => (others => '0'),
--                                      x9    => '0',
--                                      s     => '0',
--                                      d     => '0'));
      for obj in minor_obj_range_t loop
        reg_minor_objs_q(obj).cam_y <= (others => '1');
        reg_minor_objs_q(obj).cam_x <= (others => '1');
        reg_minor_objs_q(obj).col   <= (others => '0');
        reg_minor_objs_q(obj).x9    <= '0';
        reg_minor_objs_q(obj).s     <= '0';
        reg_minor_objs_q(obj).d     <= '0';
      end loop;
--      reg_major_objs_q <= (others => (cam_y => (others => '1'),
--                                      cam_x => (others => '1'),
--                                      attr  => (lss => (others => '0'),
--                                                col => (others => '0'))));
      for obj in major_obj_range_t loop
        reg_major_objs_q(obj).cam_y    <= (others => '1');
        reg_major_objs_q(obj).cam_x    <= (others => '1');
        reg_major_objs_q(obj).attr.lss <= (others => '0');
        reg_major_objs_q(obj).attr.col <= (others => '0');
      end loop;
--      reg_major_quad_objs_q <= (others => (cam_y => (others => '1'),
--                                           cam_x => (others => '1'),
--                                           attrs => (others => (lss => (others => '0'),
--                                                                col => (others => '0')))));
      for obj in major_quad_obj_range_t loop
        reg_major_quad_objs_q(obj).cam_y <= (others => '1');
        reg_major_quad_objs_q(obj).cam_x <= (others => '1');
        for attr in major_quad_attr_range_t loop
          reg_major_quad_objs_q(obj).attrs(attr).lss <= (others => '0');
          reg_major_quad_objs_q(obj).attrs(attr).col <= (others => '0');
        end loop;
      end loop;
      -- dedicated registers
      reg_ctrl_q      <= (others => '0');
      reg_enoverlap_q <= (others => '0');
      reg_overlap_q   <= (others => '0');
      reg_color_q     <= (others => '0');
      reg_sound_q     <= (others => '0');

    elsif rising_edge(clk_i) then
      -- save din_i value for later processing
      din_q  <= din_i;
      -- save control inputs for edge detection
      ale_q  <= ale_i;
      rd_n_q <= rd_n_i;
      wr_n_q <= wr_n_i;
      cs_n_q <= cs_n_i;

      -- latch address upon falling ALE ---------------------------------------
      if ale_pulse_s then
        addr_q <= unsigned(din_q);
      end if;

      -- write to registers ---------------------------------------------------
      if wr_pulse_s then
        -- write to minor control
        if sel_minor_ctrl_s then
          if sel_objsub0_s then
            reg_minor_objs_q(min_num_s).cam_y <= din_q;
          end if;
          if sel_objsub1_s then
            reg_minor_objs_q(min_num_s).cam_x <= din_q;
          end if;
          if sel_objsub2_s then
            reg_minor_objs_q(min_num_s).x9  <= din_q(minor_attr_x9_c);
            reg_minor_objs_q(min_num_s).s   <= din_q(minor_attr_s_c);
            reg_minor_objs_q(min_num_s).d   <= din_q(minor_attr_d_c);
            reg_minor_objs_q(min_num_s).col <= din_q(5 downto 3);
          end if;
        end if;

        -- write to major single objects
        if sel_major_obj_s then
          if sel_objsub0_s then
            reg_major_objs_q(maj_num_s).cam_y <= din_q;
          end if;
          if sel_objsub1_s then
            reg_major_objs_q(maj_num_s).cam_x <= din_q;
          end if;
          if sel_objsub2_s then
            reg_major_objs_q(maj_num_s).attr.lss(byte_t'range) <= din_q;
          end if;
          if sel_objsub3_s then
            reg_major_objs_q(maj_num_s).attr.lss(lss_t'high) <= din_q(0);
            reg_major_objs_q(maj_num_s).attr.col(0) <= din_q(1);
            reg_major_objs_q(maj_num_s).attr.col(1) <= din_q(2);
            reg_major_objs_q(maj_num_s).attr.col(2) <= din_q(3);
          end if;
        end if;

        -- write to major quad objects
        if sel_major_quad_s then
          if sel_objsub0_s then
            reg_major_quad_objs_q(quad_num_s).cam_y <= din_q;
          end if;
          if sel_objsub1_s then
            reg_major_quad_objs_q(quad_num_s).cam_x <= din_q;
          end if;
          if sel_objsub2_s then
            reg_major_quad_objs_q(quad_num_s).attrs(min_num_s).lss(byte_t'range) <= din_q;
          end if;
          if sel_objsub3_s then
            reg_major_quad_objs_q(quad_num_s).attrs(min_num_s).lss(lss_t'high) <= din_q(0);
            reg_major_quad_objs_q(quad_num_s).attrs(min_num_s).col(0) <= din_q(1);
            reg_major_quad_objs_q(quad_num_s).attrs(min_num_s).col(1) <= din_q(2);
            reg_major_quad_objs_q(quad_num_s).attrs(min_num_s).col(2) <= din_q(3);
          end if;
        end if;

        -- write to minor patterns
        if sel_minor_pattern_s then
          reg_minor_patterns_q(to_integer(addr_q(4 downto 3)))
                              (to_integer(addr_q(2 downto 0))) <= din_q;
        end if;

        -- write to CONTROL register
        if sel_ctrl_s then
          reg_ctrl_q <= din_q;
        end if;

        -- write to ENABLE OVERLAP register
        if sel_overlap_s then
          reg_enoverlap_q <= din_q;
        end if;

        -- write to COLOR register
        if sel_color_s then
          reg_color_q <= din_q(6 downto 0);
        end if;

        -- write to SOUND CONTROL register
        if sel_sound_s then
          reg_sound_q <= din_q;
        end if;

        -- write to grid bar configuration
        if sel_grid_cx_s then
          for hbar in byte_t'range loop
            reg_grid_bars_q.hbars(hbar)(hbar_num_s) <= din_q(hbar);
          end loop;
        end if;
        if sel_grid_dx_s then
          reg_grid_bars_q.hbars(8)(hbar_num_s) <= din_q(0);
        end if;
        if sel_grid_ex_s then
          reg_grid_bars_q.vbars(vbar_num_s) <= din_q;
        end if;
      end if;

      -- position strobe ------------------------------------------------------
      if clk_fall_en_i then
        if pos_strobe_s = '1' then
          reg_y_q <= std_logic_vector(vpos_i(pos_t'high-1 downto 0));
          reg_x_q <= std_logic_vector(hpos_i(pos_t'high downto 1));
        end if;
      end if;

      -- detect overlap -------------------------------------------------------
      pix_vec_v := (bit_over_major_c  => major_pix_i,
                    bit_over_ext_c    => cx_i,
                    bit_over_hdgrid_c => grid_hpix_i or grid_dpix_i,
                    bit_over_vgrid_c  => grid_vpix_i,
                    bit_over_minor3_c => minor_pix_i(3),
                    bit_over_minor2_c => minor_pix_i(2),
                    bit_over_minor1_c => minor_pix_i(1),
                    bit_over_minor0_c => minor_pix_i(0));
      if clk_rise_en_i or clk_fall_en_i then
        for idx in byte_t'range loop
          if tag_overlap_f(pix  => pix_vec_v,
                           mask => reg_enoverlap_q,
                           idx  => idx) then
            reg_overlap_q(idx) <= '1';
          end if;
        end loop;
      end if;
      -- clear OVERLAP register upon read
      if rd_pulse_s and addr_q = addr_overlap_c then
        reg_overlap_q <= (others => '0');
      end if;

      -- interrupts -----------------------------------------------------------
      if clk_rise_en_i or clk_fall_en_i then
        -- rising edge detection on vbl_i
        vbl_q <= vbl_i;

        if (cx_i and (major_pix_i or
                      grid_hpix_i or grid_dpix_i or grid_vpix_i or
                      minor_pix_i(3) or minor_pix_i(2) or minor_pix_i(1) or
                      minor_pix_i(0))) = '1' then
          ext_int_q <= true;
        end if;
        if snd_int_i then
          sound_int_q <= true;
        end if;

        if (ext_int_q and reg_ctrl_q(bit_ctrl_en_ext_overlap_c) = '1') or
           (sound_int_q and reg_ctrl_q(bit_ctrl_en_sound_int_c) = '1') or
           (hor_int_i and reg_ctrl_q(bit_ctrl_en_hor_int_c)) = '1'     or
           (vbl_i = '1' and vbl_q = '0') then
          intr_q <= true;
        end if;
      end if;
      -- clear interrupts upon CONTROL STATUS read
      if rd_pulse_s and addr_q = addr_ctrl_stat_c then
        ext_int_q   <= false;
        sound_int_q <= false;
        intr_q      <= false;
      end if;

      -- major <-> major collision flag ---------------------------------------
      if clk_fall_en_i then
        if major_coll_i then
          major_coll_q <= true;
        end if;
      end if;
      -- clear flag upon CONTROL STATUS read
      if rd_pulse_s and addr_q = addr_ctrl_stat_c then
        major_coll_q <= false;
      end if;
    end if;
  end process seq;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process obj_num
  --
  -- Purpose:
  --   Precalculates index numbers for various objects.
  --   They are referenced at several places.
  --
  obj_num: process (addr_q)
  begin
    -- minor object and quad attribute number indicator
    min_num_s  <= to_integer(addr_q(3 downto 2));
    -- major object number
    case addr_q(5 downto 2) is
      when "0100" => maj_num_s <=  0;
      when "0101" => maj_num_s <=  1;
      when "0110" => maj_num_s <=  2;
      when "0111" => maj_num_s <=  3;
      when "1000" => maj_num_s <=  4;
      when "1001" => maj_num_s <=  5;
      when "1010" => maj_num_s <=  6;
      when "1011" => maj_num_s <=  7;
      when "1100" => maj_num_s <=  8;
      when "1101" => maj_num_s <=  9;
      when "1110" => maj_num_s <= 10;
      when "1111" => maj_num_s <= 11;
      when others => maj_num_s <=  0;
    end case;
    -- quad object number indicator
    quad_num_s <= to_integer(addr_q(5 downto 4));
    -- horizontal/vertical grid bar number
    hbar_num_s <= 0;
    vbar_num_s <= 0;
    case addr_q(3 downto 0) is
      when "0001" =>
        hbar_num_s <= 1;
        vbar_num_s <= 1;
      when "0010" =>
        hbar_num_s <= 2;
        vbar_num_s <= 2;
      when "0011" =>
        hbar_num_s <= 3;
        vbar_num_s <= 3;
      when "0100" =>
        hbar_num_s <= 4;
        vbar_num_s <= 4;
      when "0101" =>
        hbar_num_s <= 5;
        vbar_num_s <= 5;
      when "0110" =>
        hbar_num_s <= 6;
        vbar_num_s <= 6;
      when "0111" =>
        hbar_num_s <= 7;
        vbar_num_s <= 7;
      when "1000" =>
        hbar_num_s <= 8;
        vbar_num_s <= 8;
      when "1001" =>
        vbar_num_s <= 9;
      when others =>
        null;
    end case;
  end process obj_num;
  --
  -----------------------------------------------------------------------------

  -- position strobe enable
  pos_strobe_s <= stb_i or reg_ctrl_q(bit_ctrl_fps_c);


  -----------------------------------------------------------------------------
  -- Process read_mux
  --
  -- Purpose:
  --   Implements the data read multiplexor that provides the readable
  --   elements of the CPU I/O interface.
  --
  read_mux: process (addr_q,
                     wr_pulse_s,
                     reg_minor_objs_q,
                     reg_major_objs_q,
                     reg_major_quad_objs_q,
                     reg_minor_patterns_q,
                     reg_ctrl_q,
                     reg_overlap_q,
                     reg_y_q, reg_x_q,
                     reg_sound_q,
                     reg_grid_bars_q,
                     vbl_i,
                     pos_strobe_s,
                     ext_int_q, sound_int_q, hor_int_i,
                     major_coll_q,
                     min_num_s, maj_num_s, quad_num_s,
                     hbar_num_s, vbar_num_s)
  begin
    -- default assignements
    dout_o              <= (others => '-');
    sel_minor_ctrl_s    <= false;
    sel_major_obj_s     <= false;
    sel_major_quad_s    <= false;
    sel_minor_pattern_s <= false;
    sel_ctrl_s          <= false;
    sel_overlap_s       <= false;
    sel_color_s         <= false;
    sel_sound_s         <= false;
    sel_grid_cx_s       <= false;
    sel_grid_dx_s       <= false;
    sel_grid_ex_s       <= false;
    sel_objsub0_s       <= addr_q(1 downto 0) = 0;
    sel_objsub1_s       <= addr_q(1 downto 0) = 1;
    sel_objsub2_s       <= addr_q(1 downto 0) = 2;
    sel_objsub3_s       <= addr_q(1 downto 0) = 3;
    sound_reg_sel_s     <= SND_REG_NONE;

    case to_integer(addr_q) is
      -- minor CAM
      when addr_minor_ctrl_s_c to addr_minor_ctrl_e_c =>
        sel_minor_ctrl_s <= true;
        case addr_q(1 downto 0) is
          when "00" =>
            dout_o <= reg_minor_objs_q(min_num_s).cam_y;
          when "01" =>
            dout_o <= reg_minor_objs_q(min_num_s).cam_x;
          when others =>
            null;
        end case;

      -- major single objects
      when addr_major_obj_s_c to addr_major_obj_e_c =>
        sel_major_obj_s <= true;
        case addr_q(1 downto 0) is
          when "00" =>
            dout_o <= reg_major_objs_q(maj_num_s).cam_y;
          when "01" =>
            dout_o <= reg_major_objs_q(maj_num_s).cam_x;
          when "10" =>
            dout_o <= reg_major_objs_q(maj_num_s).attr.lss(byte_t'range);
          when "11" =>
            dout_o(0) <= reg_major_objs_q(maj_num_s).attr.lss(lss_t'high);
            dout_o(1) <= reg_major_objs_q(maj_num_s).attr.col(0);
            dout_o(2) <= reg_major_objs_q(maj_num_s).attr.col(1);
            dout_o(3) <= reg_major_objs_q(maj_num_s).attr.col(2);
          when others =>
            null;
        end case;

      -- major quad objects
      when addr_major_quad_s_c to addr_major_quad_e_c =>
        sel_major_quad_s <= true;
        case addr_q(1 downto 0) is
          when "00" =>
            dout_o <= reg_major_quad_objs_q(quad_num_s).cam_y;
          when "01" =>
            dout_o <= reg_major_quad_objs_q(quad_num_s).cam_x;
          when "10" =>
            dout_o <= reg_major_quad_objs_q(quad_num_s).attrs(min_num_s).lss(byte_t'range);
          when "11" =>
            dout_o(0) <= reg_major_quad_objs_q(quad_num_s).attrs(min_num_s).lss(lss_t'high);
            dout_o(1) <= reg_major_quad_objs_q(quad_num_s).attrs(min_num_s).col(0);
            dout_o(2) <= reg_major_quad_objs_q(quad_num_s).attrs(min_num_s).col(1);
            dout_o(3) <= reg_major_quad_objs_q(quad_num_s).attrs(min_num_s).col(2);
          when others =>
            null;
        end case;

      -- minor pattern RAM
      when addr_minor_pattern_s_c to addr_minor_pattern_e_c =>
        sel_minor_pattern_s <= true;
        dout_o <= reg_minor_patterns_q(to_integer(addr_q(4 downto 3)))
                                      (to_integer(addr_q(2 downto 0)));

      -- CONTROL register
      when addr_ctrl_c =>
        sel_ctrl_s <= true;
        dout_o <= reg_ctrl_q;

      -- CONTROL STATUS register
      when addr_ctrl_stat_c =>
        dout_o <= (0 => not hor_int_i,
                   1 => pos_strobe_s,
                   2 => to_stdlogic(sound_int_q),
                   3 => vbl_i,
                   6 => to_stdlogic(ext_int_q),
                   7 => to_stdlogic(major_coll_q),
                   others => '0');

      -- OVERLAP STATUS register
      when addr_overlap_c =>
        sel_overlap_s <= true;
        dout_o <= reg_overlap_q;

      -- COLOR register
      when addr_color_c =>
        sel_color_s <= true;

      -- Y register
      when addr_ypos_c =>
        dout_o <= reg_y_q;

      -- X register
      when addr_xpos_c =>
        dout_o <= reg_x_q;

      -- SOUND registers
      when addr_snd0_c =>
        if wr_pulse_s then
          sound_reg_sel_s <= SND_REG_0;
        end if;
      when addr_snd1_c =>
        if wr_pulse_s then
          sound_reg_sel_s <= SND_REG_1;
        end if;
      when addr_snd2_c =>
        if wr_pulse_s then
          sound_reg_sel_s <= SND_REG_2;
        end if;

      -- SOUND STATUS register
      when addr_snd_stat_c =>
        sel_sound_s <= true;
        dout_o <= reg_sound_q;

      -- GRID configuration
      when addr_grid_cx_s_c to addr_grid_cx_e_c =>
        sel_grid_cx_s <= true;
        for hbar in byte_t'range loop
          dout_o(hbar) <= reg_grid_bars_q.hbars(hbar)(hbar_num_s);
        end loop;
      when addr_grid_dx_s_c to addr_grid_dx_e_c =>
        sel_grid_dx_s <= true;
        dout_o(0) <= reg_grid_bars_q.hbars(8)(hbar_num_s);
      when addr_grid_ex_s_c to addr_grid_ex_e_c =>
        sel_grid_ex_s <= true;
        dout_o <= reg_grid_bars_q.vbars(vbar_num_s);

      when others =>
        null;
    end case;
  end process read_mux;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Output mapping
  -----------------------------------------------------------------------------
  dout_en_o         <= not cs_n_i and not rd_n_i;
  en_disp_o         <= reg_ctrl_q(bit_ctrl_en_display_c);
  grid_bg_col_o     <= reg_color_q;
  intr_n_o          <= '0' when intr_q else '1';
  --
  minor_objs_o      <= reg_minor_objs_q;
  major_objs_o      <= reg_major_objs_q;
  major_quad_objs_o <= reg_major_quad_objs_q;
  minor_patterns_o  <= reg_minor_patterns_q;

-- the following is not working due to a problem in GHDL 0.25
--  grid_cfg_o        <= (enable => reg_ctrl_q(bit_ctrl_en_grid_c),
--                        wide   => reg_ctrl_q(bit_ctrl_wide_c),
--                        dot_en => reg_ctrl_q(bit_ctrl_dot_en_c),
--                        bars   => reg_grid_bars_q);
  grid_cfg_o.enable <= reg_ctrl_q(bit_ctrl_en_grid_c);
  grid_cfg_o.wide   <= reg_ctrl_q(bit_ctrl_wide_c);
  grid_cfg_o.dot_en <= reg_ctrl_q(bit_ctrl_dot_en_c);
  grid_cfg_o.bars   <= reg_grid_bars_q;

  cpu2snd_o.enable  <= reg_sound_q(bit_snd_en_c) = '1';
  cpu2snd_o.freq    <=   SND_FREQ_HIGH
                       when reg_sound_q(bit_snd_freq_c) = '1' else
                         SND_FREQ_LOW;
  cpu2snd_o.noise   <= reg_sound_q(bit_snd_noise_c) = '1';
  cpu2snd_o.volume  <= reg_sound_q(bit_snd_vol_h_c downto bit_snd_vol_l_c);
  cpu2snd_o.reg_sel <= sound_reg_sel_s;
  cpu2snd_o.din     <= din_q;

end rtl;
