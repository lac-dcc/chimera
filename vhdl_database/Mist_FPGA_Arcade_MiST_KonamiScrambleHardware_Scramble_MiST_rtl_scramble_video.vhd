--
-- A simulation model of Scramble hardware
-- Copyright (c) MikeJ - Feb 2007
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
-- Email support@fpgaarcade.com
--
-- Revision list
--
-- version 001 initial release
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;
  use work.scramble_pack.all;

entity SCRAMBLE_VIDEO is
  port (
    I_HWSEL               : in  integer;
    --
    I_HCNT                : in  std_logic_vector(8 downto 0);
    I_VCNT                : in  std_logic_vector(8 downto 0);
    I_VBLANK              : in  std_logic;
    I_VSYNC               : in  std_logic;

    I_VCMA                : in  std_logic;
    I_HCMA                : in  std_logic;
    --
    I_CPU_ADDR            : in  std_logic_vector(15 downto 0);
    I_CPU_DATA            : in  std_logic_vector(7 downto 0);
    O_VRAM_DATA           : out std_logic_vector(7 downto 0);
    -- note, looks like the real hardware cannot read from object ram
    --
    I_VRAMWR_L            : in  std_logic;
    I_VRAMRD_L            : in  std_logic;
    I_OBJRAMWR_L          : in  std_logic;
    I_OBJRAMRD_L          : in  std_logic;
    I_OBJEN_L             : in  std_logic;
    --
    I_STARSON             : in  std_logic;
    I_BCB                 : in  std_logic;
    I_BCG                 : in  std_logic;
    I_BCR                 : in  std_logic;
    --
    I_GFXBANK             : in  std_logic_vector(1 downto 0);
    --
    O_VIDEO_R             : out std_logic_vector(5 downto 0);
    O_VIDEO_G             : out std_logic_vector(5 downto 0);
    O_VIDEO_B             : out std_logic_vector(5 downto 0);
    --
    ENA                   : in  std_logic;
    ENAB                  : in  std_logic;
    ENA_12                : in  std_logic;
    CLK                   : in  std_logic;

    dl_addr               : in  std_logic_vector(15 downto 0);
    dl_wr                 : in  std_logic;
    dl_data               : in  std_logic_vector(7 downto 0)
    );
end;

-- chars     stars   vidout?    shell/missile
--
-- 220R B    100 B   390R B     100R R
-- 470R B    150 B              100R G
-- 220R G    100 G                   blue ?
-- 470R G    150 G
--   1K G    100 R
-- 220R R    150 R
-- 470R R
--   1K R
architecture RTL of SCRAMBLE_VIDEO is

  type array_3x5 is array (2 downto 0) of std_logic_vector(4 downto 0);
  -- timing
  signal ld                   : std_logic;
  signal h256_l               : std_logic;
  signal h256                 : std_logic;
  signal cblank_s             : std_logic;
  signal hcmp1_s              : std_logic;
  signal hcmp2_s              : std_logic;
  signal hcmp1                : std_logic;
  signal hcmp2                : std_logic;
  signal cblank_l             : std_logic;
  signal h256_l_s             : std_logic;
  signal hcnt_f               : std_logic_vector(7 downto 0);
  signal vcnt_f               : std_logic_vector(7 downto 0);

  -- load strobes
  signal vpl_load             : std_logic;
  signal col_load             : std_logic;
  signal objdata_load         : std_logic;
  signal missile_load         : std_logic;
  signal missile_reg_l        : std_logic;

  signal cntr_clr             : std_logic;
  signal cntr_load            : std_logic;
  signal sld_l                : std_logic;

  -- video ram
  signal vram_addr_sum        : std_logic_vector(8 downto 0); -- extra bit for debug
  signal msld_l               : std_logic;
  signal vram_addr_reg        : std_logic_vector(7 downto 0);
  signal vram_addr_xor        : std_logic_vector(3 downto 0);
  signal vram_addr            : std_logic_vector(9 downto 0);
  signal vram_dout            : std_logic_vector(7 downto 0);
  signal ldout                : std_logic;

  -- object ram
  signal obj_addr             : std_logic_vector(7 downto 0);
  signal hpla                 : std_logic_vector(7 downto 0);
  signal objdata              : std_logic_vector(7 downto 0);

  signal obj_rom_addr         : std_logic_vector(12 downto 0);
  signal obj_rom_0_dout       : std_logic_vector(7 downto 0);
  signal obj_rom_1_dout       : std_logic_vector(7 downto 0);
  --
  signal col_reg              : std_logic_vector(2 downto 0);
  signal cd                   : std_logic_vector(2 downto 0);

  signal shift_reg_1          : std_logic_vector(7 downto 0);
  signal shift_reg_0          : std_logic_vector(7 downto 0);
  signal shift_op             : std_logic_vector(1 downto 0);
  signal shift_sel            : std_logic_vector(1 downto 0);
  signal gr                   : std_logic_vector(1 downto 0);
  signal gc                   : std_logic_vector(2 downto 0);

  signal vid                  : std_logic_vector(1 downto 0);
  signal col                  : std_logic_vector(2 downto 0);

  signal obj_video_out_reg    : std_logic_vector(4 downto 0);
  signal vidout_l             : std_logic;
  signal obj_lut_out          : std_logic_vector(7 downto 0);
  signal obj_lut_out2         : std_logic_vector(7 downto 0);

  signal cntr_addr            : std_logic_vector(7 downto 0);
  signal cntr_addr_xor        : std_logic_vector(10 downto 0);
  signal sprite_sel           : std_logic;
  signal sprite_ram_ip        : std_logic_vector(7 downto 0);
  signal sprite_ram_waddr     : std_logic_vector(10 downto 0);
  signal sprite_ram_op        : std_logic_vector(7 downto 0);
  -- shell
  signal shell_cnt            : std_logic_vector(7 downto 0);
  signal shell_ena            : std_logic;
  signal shell                : std_logic;
  signal shell_reg            : std_logic;
  -- stars
  signal star_reg_1           : std_logic;
  signal star_reg_2           : std_logic;
  signal star_cnt_div         : std_logic_vector(22 downto 0);
  signal star_cnt             : std_logic_vector(1 downto 0);
  signal star_shift           : std_logic_vector(16 downto 0);
  signal star_shift_t1        : std_logic_vector(16 downto 0);
  signal star_on              : std_logic;
  signal star_out_reg         : std_logic;
  -- frogger blue bar
  signal frogger_blue_reg     : std_logic;
  signal frogger_blue         : std_logic;
  signal frogger_blue_out_reg : std_logic;
  -- background color shade
  signal bcb_reg              : std_logic;
  signal bcg_reg              : std_logic;
  signal bcr_reg              : std_logic;

  signal obj_dl_addr          : std_logic_vector(12 downto 0);
  signal obj_rom_0_wr         : std_logic;
  signal obj_rom_1_wr         : std_logic;
  signal col_rom_wr           : std_logic;
  signal col_rom2_wr           : std_logic;

begin
  p_hcnt_decode : process(I_HCNT)
  begin
    ld <= '0';
    if (I_HCNT(2 downto 0) = "111") then
      ld <= '1';
    end if;
    h256_l  <= I_HCNT(8);
    h256    <= not I_HCNT(8);

  end process;

  p_timing_decode : process(h256, h256_l, I_HCMA, I_VBLANK)
  begin
    cblank_s    <= not (I_VBLANK or h256); -- active low
    hcmp1_s     <= h256_l and I_HCMA;
  end process;

  p_reg : process
  begin
    wait until rising_edge(CLK);

    if (ENA = '1') then
      if (ld = '1') then
        hcmp1    <= hcmp1_s;
        hcmp2    <= hcmp2_s;
        cblank_l <= cblank_s;
        h256_l_s <= h256_l;

        if I_HWSEL /= I_HWSEL_FROGGER then
          cd     <= col_reg;
        else
          cd     <= col_reg(0) & col_reg(2 downto 1);
        end if;
      end if;
    end if;
  end process;

  p_load_decode : process(ld, I_HCNT, h256)
    variable obj_load : std_logic;
  begin
    vpl_load         <= '0';
    obj_load         := '0';
    col_load         <= '0';

    if (I_HCNT(2 downto 0) = "001") then vpl_load <= '1'; end if; -- 1 clock later
    if (I_HCNT(2 downto 0) = "011") then obj_load := '1'; end if; -- 1 later
    if (I_HCNT(2 downto 0) = "101") then col_load <= '1'; end if; -- 1 later

    objdata_load <= obj_load and h256 and (not I_HCNT(3));
    missile_load <= obj_load and h256 and (    I_HCNT(3));

    cntr_clr  <= ld and (not h256) and (not I_HCNT(3));
    cntr_load <= ld and (    h256) and (not I_HCNT(3));

  end process;

  p_hv_flip : process(I_HCNT, I_VCNT, I_VCMA, hcmp1_s)
  begin
    for i in 0 to 7 loop
      vcnt_f(i) <= I_VCNT(i) xor I_VCMA;
      hcnt_f(i) <= I_HCNT(i) xor hcmp1_s;
    end loop;
  end process;

  p_video_addr_calc : process(I_HWSEL, vcnt_f, hpla)
  begin
    if I_HWSEL /= I_HWSEL_FROGGER then
      vram_addr_sum <= ('0' & vcnt_f(7 downto 0)) + ('0' & hpla(7 downto 0));
    else
      vram_addr_sum <= ('0' & vcnt_f(7 downto 0)) + ('0' & hpla(3 downto 0) & hpla(7 downto 4));
    end if;
  end process;

  p_msld : process(vram_addr_sum)
  begin
    msld_l <= '1';
    if (vram_addr_sum(7 downto 0) = "11111111") then
      msld_l <= '0';
    end if;
  end process;

  p_video_addr_reg : process
  begin
    wait until rising_edge(CLK);
    if (ENA = '1') then
      if (I_VBLANK = '1') then -- was async
        vram_addr_reg <= x"00";
      elsif (vpl_load = '1') then -- vpl_l
        vram_addr_reg <= vram_addr_sum(7 downto 0);
      end if;
    end if;
  end process;

  p_vram_xor : process(vram_addr_reg, objdata, h256, I_HWSEL)
    variable flip : std_logic;
  begin
    flip := objdata(7) and h256;

    for i in 0 to 3 loop
      vram_addr_xor(i) <= vram_addr_reg(i) xor flip;
    end loop;
  end process;

  p_vram_addr : process(vram_addr_reg, cblank_s, ld, I_CPU_ADDR, vram_addr_xor, hcnt_f)
    variable match : std_logic;
  begin
     match := '0';
     if (vram_addr_reg(7 downto 4) = "1111") then
       match := '1';
     end if;

     if (cblank_s = '0') then
       ldout <= match and ld; -- blanking, sprites
     else
       ldout <= ld;
     end if;

     if (cblank_s = '0') then -- blanking, sprites
       --vram_cs   <= (not I_VRAMWR_L) or (not I_VRAMRD_L);
       vram_addr <= I_CPU_ADDR(9 downto 0); -- let the cpu in
     else
       --vram_cs   <= '1';
       vram_addr <= vram_addr_reg(7 downto 4) & vram_addr_xor(3) & hcnt_f(7 downto 3);
     end if;
  end process;

	u_vram : work.dpram generic map (10,8)
	port map
	(
		clk_a_i  => clk,
		en_a_i   => ena,
		we_i     => not I_VRAMWR_L,

      addr_a_i => vram_addr,
		data_a_i => I_CPU_DATA,  -- only cpu can write

		clk_b_i  => clk,
      addr_b_i => vram_addr,
		data_b_o => vram_dout
	);
  O_VRAM_DATA <= vram_dout;
  
  p_object_ram_addr : process(h256, I_HCMA, objdata, I_HCNT, hcnt_f, I_CPU_ADDR, I_OBJEN_L)
  begin
    -- I believe the object ram can only be written during vblank

    if (h256 = '0') then
      hcmp2_s <= I_HCMA;
    else
      hcmp2_s <= objdata(6);
    end if;

    if (I_OBJEN_L = '0') then
      obj_addr <= I_CPU_ADDR(7 downto 0);
    else
      obj_addr(7) <= '0';
      obj_addr(6) <= h256;

      -- A
      if (h256 = '0') then -- normal
        obj_addr(5) <= hcnt_f(7); --128h';
      else                 -- sprite
        obj_addr(5) <= hcnt_f(3) and I_HCNT(1);-- 8h' and 2h;
      end if;

      obj_addr(4 downto 2) <= hcnt_f(6 downto 4);

      if (h256 = '0') then -- normal
        obj_addr(1) <= hcnt_f(3); --8h'
        obj_addr(0) <= I_HCNT(2); --4h
      else
        obj_addr(1) <= I_HCNT(2); --4h
        obj_addr(0) <= I_HCNT(1); --2h
      end if;

    end if;
  end process;

	u_object_ram : work.dpram generic map (8,8)
	port map
	(
		clk_a_i  => clk,
		en_a_i   => ena,
		we_i     => not I_OBJRAMWR_L,

      addr_a_i => obj_addr,
		data_a_i => I_CPU_DATA,  -- only cpu can write

		clk_b_i  => clk,
      addr_b_i => obj_addr,
		data_b_o => hpla
	);

  p_objdata_regs : process
  begin
    wait until rising_edge(CLK);
    if (ENA = '1') then
      if (col_load = '1') then -- colour load
        col_reg <= hpla(2 downto 0);
      end if;

      if (objdata_load = '1') then -- sprite load
        objdata <= hpla;
      end if;

      if (I_VBLANK = '1') then -- was async
        missile_reg_l <= '1';
      elsif (missile_load = '1') then
        missile_reg_l <= msld_l;
      end if;
    end if;
  end process;

  p_obj_rom_addr : process(h256, vram_addr_xor, vram_dout, objdata, I_HCNT, I_GFXBANK, I_HWSEL)
  variable obj_rom_addr_base : std_logic_vector(12 downto 0);
  begin
    obj_rom_addr_base( 2 downto 0) := vram_addr_xor(2 downto 0);
    if (h256 = '0') then
      obj_rom_addr_base(12 downto 3) := I_GFXBANK & vram_dout; -- background objects
    else
      obj_rom_addr_base(12 downto 11) := I_GFXBANK;
      if I_HWSEL = I_HWSEL_CALIPSO then
        obj_rom_addr_base(12 downto 11) := objdata(7 downto 6);
      end if;
      obj_rom_addr_base(10 downto 3) := objdata(5 downto 0) & vram_addr_xor(3) & (objdata(6) xor I_HCNT(3)); -- sprites
    end if;

    if I_HWSEL = I_HWSEL_ANTEATER then
      obj_rom_addr <= "00" & not(obj_rom_addr_base(0) xor obj_rom_addr_base(6)) & 
                      (obj_rom_addr_base(2) xor obj_rom_addr_base(10)) &
                      obj_rom_addr_base(8 downto 7) &
                      (obj_rom_addr_base(4) xor obj_rom_addr_base(9) xor (obj_rom_addr_base(2) and obj_rom_addr_base(10))) &
                      obj_rom_addr_base(5 downto 0);
    elsif I_HWSEL = I_HWSEL_LOSTTOMB then
      obj_rom_addr <= "00" & ((obj_rom_addr_base(1) and obj_rom_addr_base(7)) or (not obj_rom_addr_base(1) and obj_rom_addr_base(8))) & 
                      obj_rom_addr_base(9) &
                      (obj_rom_addr_base(7) xor (obj_rom_addr_base(1) and (obj_rom_addr_base(7) xor obj_rom_addr_base(10)))) &
                      ((obj_rom_addr_base(1) and obj_rom_addr_base(8)) or (not obj_rom_addr_base(1) and obj_rom_addr_base(10))) &
                      obj_rom_addr_base(6 downto 0);
    elsif I_HWSEL = I_HWSEL_MINEFLD then
      obj_rom_addr <= "00" & obj_rom_addr_base(10) & 
                      (obj_rom_addr_base(0) xor obj_rom_addr_base(5) xor (obj_rom_addr_base(3) and obj_rom_addr_base(7))) &
                      obj_rom_addr_base(8) &
                      (obj_rom_addr_base(2) xor obj_rom_addr_base(9) xor (obj_rom_addr_base(0) and obj_rom_addr_base(5)) xor
                      (obj_rom_addr_base(3) and obj_rom_addr_base(7) and (obj_rom_addr_base(0) xor obj_rom_addr_base(5)))) &
                      obj_rom_addr_base(6) &
                      (obj_rom_addr_base(3) xor obj_rom_addr_base(7)) &
                      obj_rom_addr_base(4 downto 0);
    elsif I_HWSEL = I_HWSEL_RESCUE then
      obj_rom_addr <= "00" & (obj_rom_addr_base(0) xor obj_rom_addr_base(8)) & 
                      obj_rom_addr_base(9) &
                      (obj_rom_addr_base(1) xor obj_rom_addr_base(7)) &
                      (obj_rom_addr_base(3) xor obj_rom_addr_base(10)) &
                      obj_rom_addr_base(6 downto 0);
    else
      obj_rom_addr <= obj_rom_addr_base;
    end if;

  end process;

  obj_dl_addr <= dl_addr(12 downto 0) when I_HWSEL = I_HWSEL_CALIPSO or I_HWSEL = I_HWSEL_MIMONKEY else "00"&dl_addr(10 downto 0);

  obj_rom0 : work.dpram generic map (13,8) --5H
  port map
  (
      clk_a_i  => clk,
      en_a_i   => '1',
      we_i     => obj_rom_0_wr,

      addr_a_i => obj_dl_addr,
      data_a_i => dl_data,

      clk_b_i  => clk,
      addr_b_i => obj_rom_addr,
      data_b_o => obj_rom_0_dout
  );
  obj_rom_0_wr <= '1' when dl_wr = '1' and 
    ((I_HWSEL /= I_HWSEL_CALIPSO and I_HWSEL /= I_HWSEL_MIMONKEY  and dl_addr(15 downto 11) = "10100") or -- A000-A7FF
    ((I_HWSEL  = I_HWSEL_CALIPSO or  I_HWSEL  = I_HWSEL_MIMONKEY) and dl_addr(15 downto 13) = "101"))     -- A000-BFFF
    else '0'; 

  obj_rom1 : work.dpram generic map (13,8) --5F
  port map
  (
      clk_a_i  => clk,
      en_a_i   => '1',
      we_i     => obj_rom_1_wr,

      addr_a_i => obj_dl_addr,
      data_a_i => dl_data,

      clk_b_i  => clk,
      addr_b_i => obj_rom_addr,
      data_b_o => obj_rom_1_dout
  );
  obj_rom_1_wr <= '1' when dl_wr = '1' and
    ((I_HWSEL /= I_HWSEL_CALIPSO and I_HWSEL /= I_HWSEL_MIMONKEY  and dl_addr(15 downto 11) = "10101") or -- A800-AFFF
    ((I_HWSEL  = I_HWSEL_CALIPSO or  I_HWSEL  = I_HWSEL_MIMONKEY) and dl_addr(15 downto 13) = "110"))     -- C000-DFFF
    else '0'; 

--  obj_rom0 : entity work.ROM_OBJ_0 -- 5H
--    port map (CLK => CLK, ADDR => obj_rom_addr, DATA => obj_rom_0_dout);
--  obj_rom1 : entity work.ROM_OBJ_1 -- 5F
--    port map (CLK => CLK, ADDR => obj_rom_addr, DATA => obj_rom_1_dout);

  p_obj_rom_shift : process
    variable obj_rom_0_dout_s : std_logic_vector(7 downto 0);
  begin
    wait until rising_edge (CLK);
    if I_HWSEL /= I_HWSEL_FROGGER then
      obj_rom_0_dout_s := obj_rom_0_dout;
    else -- swap bits 0 and 1
      obj_rom_0_dout_s := obj_rom_0_dout(7 downto 2) & obj_rom_0_dout(0) & obj_rom_0_dout(1);
   end if;

    if (ENA = '1') then
      case shift_sel is
        when "00" => null; -- do nothing

        when "01" => shift_reg_1 <= '0' & shift_reg_1(7 downto 1); -- right
                     shift_reg_0 <= '0' & shift_reg_0(7 downto 1);

        when "10" => shift_reg_1 <= shift_reg_1(6 downto 0) & '0'; -- left
                     shift_reg_0 <= shift_reg_0(6 downto 0) & '0';

        when "11" => shift_reg_1 <= obj_rom_1_dout  (7 downto 0); -- load
                     shift_reg_0 <= obj_rom_0_dout_s(7 downto 0);
        when others => null;
      end case;
    end if;
  end process;

  p_obj_rom_shift_sel : process(hcmp2, ldout, shift_reg_1, shift_reg_0)
  begin
    if (hcmp2 = '0') then

      shift_sel(1) <= '1';
      shift_sel(0) <= ldout;
      shift_op(1)  <= shift_reg_1(7);
      shift_op(0)  <= shift_reg_0(7);
    else

      shift_sel(1) <= ldout;
      shift_sel(0) <= '1';
      shift_op(1)  <= shift_reg_1(0);
      shift_op(0)  <= shift_reg_0(0);
    end if;
  end process;

  p_video_out_logic : process(shift_op, cd, gr, gc)
    variable vidon : std_logic;
  begin
    vidon := shift_op(0) or shift_op(1);

    if (gr(1 downto 0) = "00") then
      vid(1 downto 0) <= shift_op(1 downto 0);
    else
      vid(1 downto 0) <= gr(1 downto 0);
    end if;

    if (gc(2 downto 0) = "000") and (vidon = '1') then
      col(2 downto 0) <= cd(2 downto 0);
    else
      col(2 downto 0) <= gc(2 downto 0);
    end if;
  end process;

  p_shell_ld : process(ld, h256, I_HCNT, missile_reg_l)
  begin
    sld_l <= '1';
    if (ld = '1') and (h256 = '1') and (I_HCNT(3) = '1') then
      if (missile_reg_l = '0') and (I_HCNT(6 downto 4) /= "111") then
        sld_l <= '0';
      end if;
    end if;

  end process;

  p_shell_reg : process
  begin
    wait until rising_edge(CLK);
    if (ENA = '1') then

      if (sld_l = '0') then
        if I_HWSEL = I_HWSEL_DARKPLNT then
          shell_cnt <= 240 - hpla;
        else
          shell_cnt <= hpla;
        end if;
      elsif (cblank_l = '1') then
        shell_cnt <= shell_cnt + "1";
      else
        shell_cnt <= shell_cnt;
      end if;

      if (sld_l = '0') then
        shell_ena <= '1';
      elsif (shell = '1') then
        shell_ena <= '0';
      end if;
    end if;
  end process;

  p_shell_op : process(shell_cnt, shell_ena)
  begin
    -- note how T input is from QD on the bottom counter
    -- we get a rc from xF8 to XFF
    -- so the shell is set at count xFA (rc and bit 1)
    shell <= '0';
    if (shell_cnt = x"F8") then -- minus 2 as delay wrong
      shell <= shell_ena;
    end if;
  end process;

  p_cntr_cnt : process
  begin
    wait until rising_edge(CLK);
    if (ENA = '1') then
      if (cntr_clr = '1') and (h256_l_s = '0') then -- async
        cntr_addr <= (others => '0');
      elsif (cntr_load = '1') then
        cntr_addr <= hpla(7 downto 0);
      else
        cntr_addr <= cntr_addr + "1";
      end if;
    end if;
  end process;

  p_cntr_addr : process(cntr_addr, hcmp1)
  begin
    cntr_addr_xor(10 downto 8) <= (others => '0');
    for i in 0 to 7 loop
      cntr_addr_xor(i) <= cntr_addr(i) xor hcmp1;
    end loop;
  end process;

  p_sprite_sel : process(h256_l_s, cntr_addr_xor)
  begin
    sprite_sel <= '0';
    if (h256_l_s = '0') and (cntr_addr_xor(7 downto 4) /= "0000") then
      sprite_sel <= '1';
    end if;
  end process;

  p_sprite_write : process
  begin
    wait until rising_edge(CLK);
    if (ENA = '1') then
      -- delay 1 clock
      sprite_ram_ip <= (others => '0');
      if (sprite_sel = '1') then
        sprite_ram_ip(4 downto 2) <= col(2 downto 0);
        sprite_ram_ip(1 downto 0) <= vid(1 downto 0);
      end if;

      sprite_ram_waddr <= cntr_addr_xor;
    end if;
  end process;

	u_sprite_ram : work.dpram generic map (11,8)
	port map
	(
		clk_a_i  => clk,
		en_a_i   => ena,
		we_i     => '1',

      addr_a_i => sprite_ram_waddr,
		data_a_i => sprite_ram_ip,

		clk_b_i  => clk,
      addr_b_i => cntr_addr_xor,
		data_b_o => sprite_ram_op
	);

  gc(2 downto 0) <= sprite_ram_op(4 downto 2);
  gr(1 downto 0) <= sprite_ram_op(1 downto 0);

  p_video_out_reg : process
    variable vidout_l_int : std_logic;
  begin
    wait until rising_edge(CLK);
    -- register all objects to match increased video delay
    if (ENA = '1') then
      star_shift_t1 <= star_shift;

      if (cblank_l = '0') then
        -- logic around the clr workes out as a sync reset
        obj_video_out_reg <= (others => '0');
        shell_reg <= '0';
        frogger_blue_out_reg <= '0';
        star_out_reg <= '0';
        bcb_reg <= '0';
        bcg_reg <= '0';
        bcr_reg <= '0';
      else

        obj_video_out_reg(4 downto 2) <= col(2 downto 0);
        obj_video_out_reg(1 downto 0) <= vid(1 downto 0);
        vidout_l <= not(vid(1) or vid(0));
        -- probably wider than the original, we must be a whole 6MHz clock here or the scan-doubler will loose it.
        shell_reg <= shell;
        frogger_blue_out_reg <= frogger_blue;

        star_out_reg <= '0';
        if (star_shift(7 downto 0) = x"FF") and (star_on = '1') then
          star_out_reg <= (vcnt_f(0) xor hcnt_f(3)) and (not star_shift(16));
        end if;

        bcb_reg <= I_BCB;
        bcg_reg <= I_BCG;
        bcr_reg <= I_BCR;

      end if;
    end if;
  end process;

-- Non BRAM (LUT) Version
--  col_rom : entity work.ROM_LUT
--    port map(
--      ADDR        => obj_video_out_reg(4 downto 0),
--      DATA        => obj_lut_out
--      );

-- BRAM Version
  col_rom : work.dpram generic map (5,8)
  port map
  (
      clk_a_i  => clk,
      en_a_i   => '1',
      we_i     => col_rom_wr,

      addr_a_i => dl_addr(4 downto 0),
      data_a_i => dl_data,

      clk_b_i  => clk,
      addr_b_i => obj_video_out_reg(4 downto 0),
      data_b_o => obj_lut_out
	);
  col_rom_wr <= '1' when dl_wr = '1' and 
	((I_HWSEL /= I_HWSEL_CALIPSO and I_HWSEL /= I_HWSEL_MIMONKEY  and dl_addr(15 downto 5) = x"B0"&"000") or -- B000-B01F
	((I_HWSEL  = I_HWSEL_CALIPSO or  I_HWSEL  = I_HWSEL_MIMONKEY) and dl_addr(15 downto 5) = x"E0"&"000"))   -- E000-E01F
	else '0'; 

--  col_rom : entity work.ROM_LUT
--    port map(
--      CLK => CLK, 
--      ADDR        => obj_video_out_reg(4 downto 0),
--      DATA        => obj_lut_out
--      );

  -- 10K
  col_rom2 : work.dpram generic map (5,8)
  port map
  (
      clk_a_i  => clk,
      en_a_i   => '1',
      we_i     => col_rom2_wr,

      addr_a_i => dl_addr(4 downto 0),
      data_a_i => dl_data,

      clk_b_i  => clk,
      addr_b_i => cntr_addr_xor(7 downto 3),
      data_b_o => obj_lut_out2
	);
  col_rom2_wr <= '1' when dl_wr = '1' and 
	(I_HWSEL /= I_HWSEL_CALIPSO and I_HWSEL /= I_HWSEL_MIMONKEY and dl_addr(15 downto 5) = x"B0"&"001") -- B020-B03F
	else '0'; 

  p_col_rom_ce : process
    variable video : array_3x5;
    variable bgc_dis: std_logic_vector(2 downto 0);
    variable i_hcnt_adj: std_logic_vector(8 downto 0);
  begin
    wait until rising_edge(CLK);
    if (ENA = '1') then
      video(0)(4) := '0';
      video(1)(4) := '0';
      video(2)(4) := '0';
      video(0)(3) := '0'; -- b
      video(1)(3) := '0'; -- g
      video(2)(3) := '0'; -- r

      if (vidout_l = '0') then -- cs_l on col rom
        if I_HWSEL = I_HWSEL_DARKPLNT then
          video(0) := "00" & obj_lut_out(5 downto 3);
          video(2) := "00" & obj_lut_out(2 downto 0);
        else
          video(0)(2 downto 0) := obj_lut_out(7 downto 6) & '0';
          video(1)(2 downto 0) := obj_lut_out(5 downto 3);
          video(2)(2 downto 0) := obj_lut_out(2 downto 0);
        end if;
      else
        video(0)(2 downto 0) := "000";
        video(1)(2 downto 0) := "000";
        video(2)(2 downto 0) := "000";
      end if;
      --
      -- end of direct assigns
      --
      if I_HWSEL = I_HWSEL_FROGGER then
        if (frogger_blue_out_reg = '1') and (vidout_l = '1') then
          video(0) := video(0) + "00010";
        end if;
      end if;

      if I_HWSEL /= I_HWSEL_FROGGER then
        video(1) := video(1) + ("00" & shell_reg & "00");
        video(2) := video(2) + ("00" & shell_reg & "00");
      end if;

      -- add stars, background and video
      if I_HWSEL /= I_HWSEL_FROGGER then
        if (star_out_reg = '1') and (vidout_l = '1') then
          video(0) := video(0) + ( '0' & star_shift_t1(13 downto 12) & "00");
          video(1) := video(1) + ( '0' & star_shift_t1(11 downto 10) & "00");
          video(2) := video(2) + ( '0' & star_shift_t1( 9 downto  8) & "00");
        end if;
      end if;

      if I_HWSEL = I_HWSEL_STRATGYX then
        -- bit 1 and 0 from the second LUT ROM disables bcX_regs
        bgc_dis := obj_lut_out2(1) & obj_lut_out2(1 downto 0);
      elsif I_HWSEL = I_HWSEL_MINEFLD or I_HWSEL = I_HWSEL_RESCUE or I_HWSEL = I_HWSEL_FROGGER then
        -- these are handling the bg registers differently
        bgc_dis := "111";
      else
        bgc_dis := "000";
      end if;

      if (bcb_reg = '1') and (vidout_l = '1') and (bgc_dis(0) = '0') then
        video(0) := video(0) + ("00011");
      end if;
      if (bcg_reg = '1') and (vidout_l = '1') and (bgc_dis(1) = '0') then
        video(1) := video(1) + ("00011");
      end if;
      if (bcr_reg = '1') and (vidout_l = '1') and (bgc_dis(2) = '0') then
        video(2) := video(2) + ("00011");
      end if;

      -- check for clip
      for i in 0 to 2 loop
        if video(i)(4) = '1' or video(i)(3) = '1' then
          video(i)(2 downto 0) := (others => '1');
        end if;
      end loop;

      i_hcnt_adj := I_HCNT - "1001";
      if (I_HWSEL = I_HWSEL_RESCUE or (I_HWSEL = I_HWSEL_MINEFLD and i_hcnt_adj(7) = '0')) and 
         bcb_reg = '1' and I_HCNT(8) = '1' and
         video(0) = "0000" and video(1) = "0000" and video(2) = "0000"
      then
        -- Rescue and Minefield blue graduated background, no schematics, just guessing
        O_VIDEO_B <= i_hcnt_adj(6 downto 1);
        O_VIDEO_G <= '0' & i_hcnt_adj(6 downto 2);
        O_VIDEO_R <= (others => '0');
      elsif I_HWSEL = I_HWSEL_MINEFLD and i_hcnt_adj(7) = '1' and
         bcb_reg = '1' and I_HCNT(8) = '1' and
         video(0) = "0000" and video(1) = "0000" and video(2) = "0000"
      then
        -- Minefield brown graduated background
        O_VIDEO_B <= (others => '0');
        O_VIDEO_G <= '0' & i_hcnt_adj(6 downto 2);
        O_VIDEO_R <= i_hcnt_adj(6 downto 1);
      else
        O_VIDEO_B <= video(0)(2 downto 0) & video(0)(2 downto 0);
        O_VIDEO_G <= video(1)(2 downto 0) & video(1)(2 downto 0);
        O_VIDEO_R <= video(2)(2 downto 0) & video(2)(2 downto 0);
      end if;
    end if;
  end process;

  p_frogger_blue_reg : process
  begin
    wait until rising_edge(CLK);
    if (ENA = '1') then
      if    (I_HCNT(7 downto 0) = x"87") then
        frogger_blue_reg <= '1';
      elsif (I_HCNT(7 downto 0) = x"07") then
        frogger_blue_reg <= '0';
      end if;
    end if;
  end process;
  frogger_blue <= not (frogger_blue_reg xor I_HCMA);

  p_stars_timer : process
  begin
    wait until rising_edge(CLK);
    -- 555 period 0.8316 seconds
    -- ~ 4DF 666
    if (ENA = '1') then
      if (star_cnt_div(22 downto 17) = "100111") then
        star_cnt_div <= (others => '0');
        star_cnt     <= star_cnt + "1";
      else
        star_cnt_div <= star_cnt_div + "1";
      end if;
    end if;
  end process;

  p_stars_demux : process(star_cnt, I_VCNT, star_shift)
  begin
    case star_cnt is
      when "00" => star_on <= star_shift(8);
      when "01" => star_on <= star_shift(10);
      when "10" => star_on <= I_VCNT(1);
      when "11" => star_on <= '1';
      when others => null;
    end case;
  end process;

  p_stars : process
    variable star_ena : std_logic;
    variable star_shift_ena : std_logic;
    variable fb : std_logic;
    variable star_clear : std_logic;
  begin
    wait until rising_edge(CLK);
    -- stars clocked off 12 MHz clock
    star_ena := ENA_12 and (not I_VSYNC) and h256_l_s;

    if (ENA = '1') and (I_VSYNC = '1') then
      star_reg_1 <= '0';
      star_reg_2 <= '0';
    elsif (star_ena = '1') then
      star_reg_1 <= '1';
      star_reg_2 <= star_reg_1;
    end if;

    star_shift_ena := (star_reg_2 or I_HCMA) and star_ena;

    star_clear := I_STARSON and (not I_VBLANK);

    fb := (not star_shift(16)) xor star_shift(4);
    if    (star_clear = '0') then
      star_shift <= (others => '0');
    elsif (star_shift_ena = '1') then
      star_shift(16 downto 0) <= star_shift(15 downto 0) & fb;
    end if;
  end process;

end RTL;
