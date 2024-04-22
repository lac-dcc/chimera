-------------------------------------------------------------------------------
--  vga2tmds.vhd
--  Joris van Rantwijk
--
--  This entity takes VGA signals as input (in the form of 8-bit RGB words
--  and HSYNC/VSYNC signals) and produces TMDS signals as output.
--
--  The input side of this entity may be connected to SVGACTRL or APBVGA
--  components from GRLIB. The output side of this entity may be connected
--  to a TMDS transmitter for a HDMI or DVI output port.
--
--  The output operates in DVI mode: no guard bands and no data islands
--  are sent. This is actually not allowed on HDMI links, but HDMI devices
--  should just accept it in DVI-compatibility mode.
--
------------------------------------------------------------------------------
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library gaisler;
use gaisler.misc.all;
library grlib;
use grlib.stdlib.all;
library techmap;
use techmap.gencomp.all;
library unisim;
use unisim.vcomponents.ODDR2;

entity vga2tmds is

  generic (
    tech        : integer := 0
  );

  port (
    -- VGA pixel clock.
    vgaclk      : in  std_logic;

    -- Fast clock at 5 times pixel clock frequency.
    fastclk     : in  std_logic;

    -- Output signals from APBVGA or SVGACTRL.
    vgao        : in  apbvga_out_type;

    -- TMDS output signals.
    tmdsclk     : out std_logic;
    tmdsdat     : out std_logic_vector(2 downto 0)
  );

end entity;

architecture rtl of vga2tmds is

  -- registers in video coding pipeline
  type video_coder_regs is record
    q0_dat  : std_logic_vector(8 downto 0); -- stage 0: partial XOR
    q1_dat  : std_logic_vector(8 downto 0); -- stage 1: transition minimized
    q2_dat  : std_logic_vector(8 downto 0); -- stage 2: transition minimized
    q2_nd   : signed(3 downto 0);           -- stage 2: (N1 - N0) / 2
    q3_dat  : std_logic_vector(9 downto 0); -- stage 3: final output
    q3_cnt  : signed(3 downto 0);           -- stage 3: DC counter
  end record;

  -- registers in pixel clock domain
  type pregs_type is record
    blank   : std_logic_vector(3 downto 0);     -- pipeline for blanking signal
    vcode0  : video_coder_regs;                 -- coding pipeline for ch0
    vcode1  : video_coder_regs;                 -- coding pipeline for ch1
    vcode2  : video_coder_regs;                 -- coding pipeline for ch2
    bufptr  : std_ulogic;                       -- current buffer slot
    dbuf0   : std_logic_vector(29 downto 0);    -- 2-slot output buffer
    dbuf1   : std_logic_vector(29 downto 0);
  end record;

  -- registers in fast clock domain
  type fregs_type is record
    bufptr          : std_logic_vector(1 downto 0); -- resynced bufptr
    shiftstate      : std_logic_vector(3 downto 0); -- one-hot state
    tm0shift        : std_logic_vector(9 downto 0); -- output shift registers
    tm1shift        : std_logic_vector(9 downto 0);
    tm2shift        : std_logic_vector(9 downto 0);
    tm0out          : std_logic_vector(1 downto 0); -- DDR output registers
    tm1out          : std_logic_vector(1 downto 0);
    tm2out          : std_logic_vector(1 downto 0);
    tmcout          : std_logic_vector(1 downto 0);
  end record;

  -- reset values
  constant video_coder_regs_reset: video_coder_regs := (
    q0_dat => (others => '0'),
    q1_dat => (others => '0'),
    q2_dat => (others => '0'),
    q2_nd  => (others => '0'),
    q3_dat => (others => '0'),
    q3_cnt => (others => '0') );
  constant pregs_reset: pregs_type := (
    blank  => (others => '0'),
    vcode0 => video_coder_regs_reset,
    vcode1 => video_coder_regs_reset,
    vcode2 => video_coder_regs_reset,
    bufptr => '0',
    dbuf0  => (others => '0'),
    dbuf1  => (others => '0') );

  -- registers in pixel clock domain
  signal pr   : pregs_type := pregs_reset;
  signal prin : pregs_type;

  -- registers in fast clock domain
  signal fr, frin : fregs_type;

  signal vcc, gnd: std_ulogic;
  signal fastclk_n: std_ulogic;

  -- Control Period Coding
  constant tmds_ctrl_code_00: std_logic_vector(9 downto 0) := "1101010100";
  constant tmds_ctrl_code_01: std_logic_vector(9 downto 0) := "0010101011";
  constant tmds_ctrl_code_10: std_logic_vector(9 downto 0) := "0101010100";
  constant tmds_ctrl_code_11: std_logic_vector(9 downto 0) := "1010101011";

  -----------------------------------------------------------------------------
  -- Video Coding pipeline
  -----------------------------------------------------------------------------
  function count_bits(d: in std_logic_vector; n: in integer)
    return unsigned is
    variable y: unsigned(n-1 downto 0);
  begin
    y := to_unsigned(0, n);
    for i in d'range loop
      if d(i) = '1' then
        y := y + 1;
      end if;
    end loop;
    return y;
  end function;

  procedure tmds_video_coder(din:   in  std_logic_vector(7 downto 0);
                             clrn:  in  std_ulogic;
                             regs:  in  video_coder_regs;
                             vregs: out video_coder_regs ) is
    variable v_cnt_din:  unsigned(2 downto 0);
  begin

    -- stage 1: XOR first 5 bits and choose between XOR/XNOR coding
    vregs.q0_dat(0) := din(0);
    vregs.q0_dat(1) := din(0) xor din(1);
    vregs.q0_dat(2) := din(0) xor din(1) xor din(2);
    vregs.q0_dat(3) := din(0) xor din(1) xor din(2) xor din(3);
    vregs.q0_dat(4) := din(0) xor din(1) xor din(2) xor din(3) xor din(4);
    vregs.q0_dat(7 downto 5) := din(7 downto 5);
    v_cnt_din := count_bits(din(7 downto 1), 3);
    if v_cnt_din > 3 then
      vregs.q0_dat(8) := '0';
    else
      vregs.q0_dat(8) := '1';
    end if;

    -- stage 2: XOR last 3 bits and apply XNOR if needed
    vregs.q1_dat(0) := regs.q0_dat(0);
    vregs.q1_dat(1) := regs.q0_dat(1) xor regs.q0_dat(8) xor '1';
    vregs.q1_dat(2) := regs.q0_dat(2);
    vregs.q1_dat(3) := regs.q0_dat(3) xor regs.q0_dat(0) xor '1';
    vregs.q1_dat(4) := regs.q0_dat(4);
    vregs.q1_dat(5) := regs.q0_dat(4) xor regs.q0_dat(5) xor regs.q0_dat(8) xor '1';
    vregs.q1_dat(6) := regs.q0_dat(4) xor regs.q0_dat(5) xor regs.q0_dat(6);
    vregs.q1_dat(7) := regs.q0_dat(4) xor regs.q0_dat(5) xor regs.q0_dat(6) xor regs.q0_dat(7) xor regs.q0_dat(8) xor '1';
    vregs.q1_dat(8) := regs.q0_dat(8);

    -- stage 3: count difference between nr of 1 and 0 bits (divided by 2)
    vregs.q2_dat := regs.q1_dat;
    vregs.q2_nd  := signed(count_bits(regs.q1_dat(7 downto 0), 4)) - 4;

    -- stage 4: DC balance
    if (regs.q3_cnt < 0 and regs.q2_nd < 0) or
       ((regs.q3_cnt = 0 or regs.q2_nd = 0) and (regs.q2_dat(8) = '0')) then
      -- flip bits
      vregs.q3_dat(7 downto 0) := not regs.q2_dat(7 downto 0);
      vregs.q3_dat(8) := regs.q2_dat(8);
      vregs.q3_dat(9) := '1';
      if regs.q2_dat(8) = '1' then
        vregs.q3_cnt := regs.q3_cnt - regs.q2_nd + 1;
      else
        vregs.q3_cnt := regs.q3_cnt - regs.q2_nd;
      end if;
    else
      -- keep bits
      vregs.q3_dat(7 downto 0) := regs.q2_dat(7 downto 0);
      vregs.q3_dat(8) := regs.q2_dat(8);
      vregs.q3_dat(9) := '0';
      if regs.q2_dat(8) = '1' then
        vregs.q3_cnt := regs.q3_cnt + regs.q2_nd;
      else
        vregs.q3_cnt := regs.q3_cnt + regs.q2_nd - 1;
      end if;
    end if;

    -- reset DC counter
    if clrn = '0' then
      vregs.q3_cnt := "0000";
    end if;
  end procedure;

begin

  vcc <= '1'; gnd <= '0';
  fastclk_n <= not fastclk;

  -----------------------------------------------------------------------------
  -- DDR output registers
  -----------------------------------------------------------------------------

  -- It would of course be nicer to do this with ddr_oreg from techmap,
  -- but it can not handle the rising -> falling data path fast enough.

  ddr0: ODDR2
    generic map ( DDR_ALIGNMENT => "C0", SRTYPE => "ASYNC" )
    port map ( Q => tmdsdat(0), C0 => fastclk, C1 => fastclk_n, CE => vcc,
               D0 => fr.tm0out(0), D1 => fr.tm0out(1), R => gnd, S => gnd );

  ddr1: ODDR2
    generic map ( DDR_ALIGNMENT => "C0", SRTYPE => "ASYNC" )
    port map ( Q => tmdsdat(1), C0 => fastclk, C1 => fastclk_n, CE => vcc,
               D0 => fr.tm1out(0), D1 => fr.tm1out(1), R => gnd, S => gnd );

  ddr2: ODDR2
    generic map ( DDR_ALIGNMENT => "C0", SRTYPE => "ASYNC" )
    port map ( Q => tmdsdat(2), C0 => fastclk, C1 => fastclk_n, CE => vcc,
               D0 => fr.tm2out(0), D1 => fr.tm2out(1), R => gnd, S => gnd );

  ddrc: ODDR2
    generic map ( DDR_ALIGNMENT => "C0", SRTYPE => "ASYNC" )
    port map ( Q => tmdsclk, C0 => fastclk, C1 => fastclk_n, CE => vcc,
               D0 => fr.tmcout(0), D1 => fr.tmcout(1), R => gnd, S => gnd );

  -----------------------------------------------------------------------------
  -- Combinatorial process for slow signals (TMDS encoder)
  -----------------------------------------------------------------------------
  pcomb: process (pr, vgao) is
    variable v: pregs_type;
    variable vtm0: std_logic_vector(9 downto 0);
    variable vtm1: std_logic_vector(9 downto 0);
    variable vtm2: std_logic_vector(9 downto 0);
  begin
    v := pr;

    -- Video Data Coding pipeline.
    v.blank := pr.blank(2 downto 0) & vgao.blank;
    tmds_video_coder(vgao.video_out_b, pr.blank(2), pr.vcode0, v.vcode0);
    tmds_video_coder(vgao.video_out_g, pr.blank(2), pr.vcode1, v.vcode1);
    tmds_video_coder(vgao.video_out_r, pr.blank(2), pr.vcode2, v.vcode2);

    if pr.blank(3) = '0' then
      -- Display blanking; use Control Period Coding.

      -- Send D0=HSYNC and D1=VSYNC via channel 0.
      if vgao.vsync = '0' and vgao.hsync = '0' then
        vtm0 := tmds_ctrl_code_00;
      elsif vgao.vsync = '0' and vgao.hsync = '1' then
        vtm0 := tmds_ctrl_code_01;
      elsif vgao.vsync = '1' and vgao.hsync = '0' then
        vtm0 := tmds_ctrl_code_10;
      else
        vtm0 := tmds_ctrl_code_11;
      end if;

      -- Send Video Data Preamble via channels 1 and 2.
      vtm1 := tmds_ctrl_code_01;
      vtm2 := tmds_ctrl_code_00;

    else
      -- Send Video Data; use 24-bit RGB pixel encoding.

      vtm0 := pr.vcode0.q3_dat;
      vtm1 := pr.vcode1.q3_dat;
      vtm2 := pr.vcode2.q3_dat;

    end if;

    -- Store output in buffer.
    v.bufptr := not pr.bufptr;
    if pr.bufptr = '1' then
      v.dbuf0 := vtm2 & vtm1 & vtm0;
    else
      v.dbuf1 := vtm2 & vtm1 & vtm0;
    end if;

    prin <= v;
  end process;

  -----------------------------------------------------------------------------
  -- Combinatorial process for fast signals (TMDS serializer)
  -----------------------------------------------------------------------------
  fcomb: process (pr, fr) is
    variable v: fregs_type;
  begin
    v := fr;

    -- Resynchronize buffer pointer in fast clock domain.
    v.bufptr := pr.bufptr & fr.bufptr(1 downto 1);

    -- Update shift state.
    if fr.shiftstate(0) = '1' then
      v.shiftstate := (others => '0');
    else
      v.shiftstate := "1" & fr.shiftstate(fr.shiftstate'high downto 1);
    end if;

    -- Update data shift registers.
    if fr.shiftstate(0) = '1' then
      -- Pick up a new set of 10-bit words once per 5 clock cycles.
      if pr.bufptr = '0' then
        v.tm0shift := pr.dbuf0(9 downto 0);
        v.tm1shift := pr.dbuf0(19 downto 10);
        v.tm2shift := pr.dbuf0(29 downto 20);
      else
        v.tm0shift := pr.dbuf1(9 downto 0);
        v.tm1shift := pr.dbuf1(19 downto 10);
        v.tm2shift := pr.dbuf1(29 downto 20);
      end if;
    else
      v.tm0shift := "00" & fr.tm0shift(9 downto 2);
      v.tm1shift := "00" & fr.tm1shift(9 downto 2);
      v.tm2shift := "00" & fr.tm2shift(9 downto 2);
    end if;

    -- Select 2 output bits per channel per clock cycle.
    v.tm0out := fr.tm0shift(1 downto 0);
    v.tm1out := fr.tm1shift(1 downto 0);
    v.tm2out := fr.tm2shift(1 downto 0);
    v.tmcout := fr.shiftstate(2 downto 1);

    frin <= v;
  end process;

  -----------------------------------------------------------------------------
  -- Synchronous process in pixel clock domain
  -----------------------------------------------------------------------------
  pregs: process (vgaclk) is
  begin
    if rising_edge(vgaclk) then
      pr <= prin;
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Synchronous process in fast clock domain
  -----------------------------------------------------------------------------
  fregs: process (fastclk) is
  begin
    if rising_edge(fastclk) then
      fr <= frin;
    end if;
  end process;

end architecture;

