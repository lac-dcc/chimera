--
-- A simulation model of Pacman hardware
-- Copyright (c) MikeJ - January 2006
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
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
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
-- You are responsible for any legal issues arising from your use of this code.
--
-- The latest version of this file can be found at: www.fpgaarcade.com
--
-- Email pacman@fpgaarcade.com
--
-- Revision list
--
-- version 003 Jan 2006 release, general tidy up
-- version 001 initial release
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

use work.pkg_pacman.all;

entity PACMAN_VIDEO is
  port (
    I_HCNT            : in    std_logic_vector(8 downto 0);
    I_VCNT            : in    std_logic_vector(8 downto 0);
    --
    I_AB              : in    std_logic_vector(11 downto 0);
    I_DB              : in    std_logic_vector( 7 downto 0);
    --
    I_HBLANK          : in    std_logic;
    I_VBLANK          : in    std_logic;
    I_FLIP            : in    std_logic;
    I_WR2_L           : in    std_logic;
    --
    O_RED             : out   std_logic_vector(2 downto 0);
    O_GREEN           : out   std_logic_vector(2 downto 0);
    O_BLUE            : out   std_logic_vector(1 downto 0);
    ENA_6             : in    std_logic;
    CLK               : in    std_logic
    );
end;

architecture RTL of PACMAN_VIDEO is

  signal sprite_xy_ram_wen  : std_logic;
  signal sprite_xy_ram_temp : std_logic_vector(7 downto 0);
  signal dr                 : std_logic_vector(7 downto 0);

  signal char_reg           : std_logic_vector(7 downto 0);
  signal char_sum_reg       : std_logic_vector(3 downto 0);
  signal char_match_reg     : std_logic;
  signal char_hblank_reg    : std_logic;
  signal char_hblank_reg_t1 : std_logic;
  signal db_reg             : std_logic_vector(7 downto 0);

  signal xflip              : std_logic;
  signal yflip              : std_logic;
  signal obj_on             : std_logic;

  signal ca                 : std_logic_vector(12 downto 0);
  signal char_rom_5ef_dout  : std_logic_vector(7 downto 0);

  signal shift_regl         : std_logic_vector(3 downto 0);
  signal shift_regu         : std_logic_vector(3 downto 0);
  signal shift_op           : std_logic_vector(1 downto 0);
  signal shift_sel          : std_logic_vector(1 downto 0);

  signal vout_obj_on        : std_logic;
  signal vout_yflip         : std_logic;
  signal vout_hblank        : std_logic;
  signal vout_db            : std_logic_vector(4 downto 0);

  signal cntr_ld            : std_logic;
  signal ra                 : std_logic_vector(7 downto 0);
  signal sprite_ram_ip      : std_logic_vector(3 downto 0);
  signal sprite_ram_op      : std_logic_vector(3 downto 0);
  signal sprite_ram_addr    : std_logic_vector(11 downto 0);
  signal sprite_ram_addr_t1 : std_logic_vector(11 downto 0);
  signal vout_obj_on_t1     : std_logic;
  signal col_rom_addr       : std_logic_vector(7 downto 0);

  signal lut_4a             : std_logic_vector(7 downto 0);
  signal lut_4a_t1          : std_logic_vector(7 downto 0);
  signal vout_hblank_t1     : std_logic;
  signal sprite_ram_reg     : std_logic_vector(3 downto 0);

  signal video_out          : std_logic_vector(7 downto 0);
  signal video_op_sel       : std_logic;
  signal final_col          : std_logic_vector(3 downto 0);
  signal lut_7f             : std_logic_vector(7 downto 0);

  -- non-xilinx ram
  --type slv_array16 is array (natural range <>) of std_logic_vector(7 downto 0);
  --shared variable sprite_ram : slv_array16(7 downto 0) := (others => (others => '0'));

begin

  p_sprite_ram_comb : process(I_HBLANK, I_HCNT, I_WR2_L, sprite_xy_ram_temp)
  begin
    -- ram enable is low when HBLANK_L is 0 (for sprite access) or
    -- 2H is low (for cpu writes)
    -- we can simplify this

    sprite_xy_ram_wen <= '0';
    if (I_WR2_L = '0') and (ENA_6 = '1') then
      sprite_xy_ram_wen <= '1';
    end if;

    if (I_HBLANK = '1') then
      dr <= not sprite_xy_ram_temp;
    else
      dr <= "11111111"; -- pull ups on board
    end if;
  end process;

  sprite_xy_ram : for i in 0 to 7 generate
  -- should be a latch, but we are using a clock
  -- ops are disabled when ME_L is high or WE_L is low
  begin
    inst: RAM16X1D
      port map (
        a0    => I_AB(0),
        a1    => I_AB(1),
        a2    => I_AB(2),
        a3    => I_AB(3),
        dpra0 => I_AB(0),
        dpra1 => I_AB(1),
        dpra2 => I_AB(2),
        dpra3 => I_AB(3),
        wclk  => CLK,
        we    => sprite_xy_ram_wen,
        d     => I_DB(i),
        dpo   => sprite_xy_ram_temp(i)
        );
  end generate;

  -- NON XILINX SPRITE RAM
  --p_ram_w : process
    --variable ram_addr : integer := 0;
  --begin
    --wait until rising_edge(CLK_6);
    --if (sprite_xy_ram_wen = '1') then
      --ram_addr := to_integer(unsigned(I_AB(3 downto 0)));
      --sprite_ram(ram_addr) := I_DB(7 downto 0);
    --end if;
  --end process;

  --p_ram_r : process(CLK_6, I_AB)
    --variable ram_addr : integer := 0;
  --begin
    --ram_addr := to_integer(unsigned(I_AB(3 downto 0)));
    --sprite_xy_ram_temp <= sprite_ram(ram_addr);
  --end process;
  -- END OF NON XILINX RAM

  p_char_regs : process
    variable inc : std_logic;
    variable sum : std_logic_vector(8 downto 0);
    variable match : std_logic;
  begin
    wait until rising_edge (CLK);
    if (I_HCNT(2 downto 0) = "011") and (ENA_6 = '1') then  -- rising 4h
      inc := (not I_HBLANK);
      -- 1f, 2f
      sum := (I_VCNT(7 downto 0) & '1') + (dr & inc);
      -- 3e
      match := '0';
      if (sum(8 downto 5) = "1111") then
        match := '1';
      end if;
      -- 1h
      char_sum_reg     <= sum(4 downto 1);
      char_match_reg   <= match;
      char_hblank_reg  <= I_HBLANK;
      -- 4d
      db_reg <= I_DB; -- character reg
    end if;
  end process;

  p_flip_comb : process(char_hblank_reg, I_FLIP, db_reg)
  begin
    if (char_hblank_reg = '0') then
      xflip     <= I_FLIP;
      yflip     <= I_FLIP;
    else
      xflip     <= db_reg(1);
      yflip     <= db_reg(0);
    end if;
  end process;

  p_char_addr_comb : process(db_reg, I_HCNT,
                             char_match_reg, char_sum_reg, char_hblank_reg,
                             xflip, yflip)
  begin
    -- 2h, 4e
    obj_on <= char_match_reg or I_HCNT(8); -- 256h not 256h_l

    ca(12) <= char_hblank_reg;
    ca(11 downto 6) <= db_reg(7 downto 2);

    if (char_hblank_reg = '0') then
      ca(5)     <= db_reg(1);
      ca(4)     <= db_reg(0);
    else
      ca(5)     <= char_sum_reg(3) xor xflip;
      ca(4)     <= I_HCNT(3);
    end if;

    ca(3) <= I_HCNT(2)       xor yflip;
    ca(2) <= char_sum_reg(2) xor xflip;
    ca(1) <= char_sum_reg(1) xor xflip;
    ca(0) <= char_sum_reg(0) xor xflip;
  end process;

  -- char roms
  char_rom_5ef : entity work.GFX1
    port map (
      CLK         => CLK,
      ENA         => ENA_6,
      ADDR        => ca,
      DATA        => char_rom_5ef_dout
      );

  p_char_shift : process
  begin
    -- 4 bit shift req
    wait until rising_edge (CLK);
    if (ENA_6 = '1') then
      case shift_sel is
        when "00" => null;

        when "01" => shift_regu <= '0' & shift_regu(3 downto 1);
                     shift_regl <= '0' & shift_regl(3 downto 1);

        when "10" => shift_regu <= shift_regu(2 downto 0) & '0';
                     shift_regl <= shift_regl(2 downto 0) & '0';

        when "11" => shift_regu <= char_rom_5ef_dout(7 downto 4); -- load
                     shift_regl <= char_rom_5ef_dout(3 downto 0);
        when others => null;
      end case;
    end if;
  end process;

  p_char_shift_comb : process(I_HCNT, vout_yflip, shift_regu, shift_regl)
    variable ip : std_logic;
  begin
    ip := I_HCNT(0) and I_HCNT(1);
    if (vout_yflip = '0') then

      shift_sel(0) <= ip;
      shift_sel(1) <= '1';
      shift_op(0) <= shift_regl(3);
      shift_op(1) <= shift_regu(3);
    else

      shift_sel(0) <= '1';
      shift_sel(1) <= ip;
      shift_op(0) <= shift_regl(0);
      shift_op(1) <= shift_regu(0);
    end if;
  end process;

  p_video_out_reg : process
  begin
    wait until rising_edge (CLK);
    if (ENA_6 = '1') then
      if (I_HCNT(2 downto 0) = "111") then
        vout_obj_on   <= obj_on;
        vout_yflip    <= yflip;
        vout_hblank   <= I_HBLANK;
        vout_db(4 downto 0) <= I_DB(4 downto 0); -- colour reg
      end if;
    end if;
  end process;

  p_lut_4a_comb : process(vout_db, shift_op)
  begin
    col_rom_addr <= '0' & vout_db(4 downto 0) & shift_op(1 downto 0);
  end process;

  col_rom_4a : entity work.PROM4_DST
    port map (
      CLK         => CLK,
      ENA         => ENA_6,	 
      ADDR        => col_rom_addr,
      DATA        => lut_4a
      );

  p_cntr_ld : process(I_HCNT, vout_obj_on, vout_hblank)
    variable ena : std_ulogic;
  begin
    ena := '0';
    if (I_HCNT(3 downto 0) = "0111") then
      ena := '1';
    end if;
    cntr_ld <= ena and (vout_hblank or not vout_obj_on);
  end process;

  p_ra_cnt : process
  begin
    wait until rising_edge (CLK);
    if (ENA_6 = '1') then
      if (cntr_ld = '1') then
        ra <= dr;
      else
        ra <= ra + "1";
      end if;
    end if;
  end process;

  sprite_ram_addr <= "0000" & ra;

  u_sprite_ram : RAMB16_S4_S4
    port map (
      -- write side, 1 clk later than original
      DOA   => open,
      DIA   => sprite_ram_ip,
      ADDRA => sprite_ram_addr_t1,
      WEA   => vout_obj_on_t1,
      ENA   => ENA_6,
      SSRA  => '0',
      CLKA  => CLK,
      -- read side
      DOB   => sprite_ram_op,
      DIB   => "0000",
      ADDRB => sprite_ram_addr,
      WEB   => '0',
      ENB   => ENA_6,
      SSRB  => '0',
      CLKB  => CLK
      );

  p_sprite_ram_op_comb : process(sprite_ram_op, vout_obj_on_t1)
  begin
    if vout_obj_on_t1 = '1' then
      sprite_ram_reg <= sprite_ram_op;
    else
      sprite_ram_reg <= "0000";
    end if;
  end process;

  p_video_op_sel_comb : process(sprite_ram_reg)
  begin
    video_op_sel <= '0'; -- no sprite
    if not (sprite_ram_reg = "0000") then
      video_op_sel <= '1';
    end if;
  end process;

  p_sprite_ram_ip_reg : process
  begin
    wait until rising_edge (CLK);
    if (ENA_6 = '1') then
      sprite_ram_addr_t1 <= sprite_ram_addr;
      vout_obj_on_t1 <= vout_obj_on;
      vout_hblank_t1 <= vout_hblank;
      lut_4a_t1 <= lut_4a;
    end if;
  end process;

  p_sprite_ram_ip_comb : process(vout_hblank_t1, video_op_sel, sprite_ram_reg, lut_4a_t1)
  begin
  -- 3a
    if (vout_hblank_t1 = '0') then
      sprite_ram_ip <= (others => '0');
    else
      if (video_op_sel = '1') then
        sprite_ram_ip <= sprite_ram_reg;
      else
        sprite_ram_ip <= lut_4a_t1(3 downto 0);
      end if;
    end if;
  end process;

  p_video_op_comb : process(vout_hblank, I_VBLANK, video_op_sel, sprite_ram_reg, lut_4a)
  begin
      -- 3b
    if (vout_hblank = '1') or (I_VBLANK = '1') then
      final_col <= (others => '0');
    else
      if (video_op_sel = '1') then
        final_col <= sprite_ram_reg; -- sprite
      else
        final_col <= lut_4a(3 downto 0);
      end if;
    end if;
  end process;

  col_rom_7f : entity work.PROM7_DST
    port map (
      CLK         => CLK,
      ENA         => ENA_6,	 
      ADDR        => final_col,
      DATA        => lut_7f
      );

  p_final_reg : process
  begin
    wait until rising_edge (CLK);
    -- not really registered
    if (ENA_6 = '1') then
      video_out <= lut_7f;
    end if;
  end process;

  --  assign outputs
  O_BLUE (1 downto 0) <= video_out(7 downto 6);
  O_GREEN(2 downto 0) <= video_out(5 downto 3);
  O_RED  (2 downto 0) <= video_out(2 downto 0);

end architecture RTL;
