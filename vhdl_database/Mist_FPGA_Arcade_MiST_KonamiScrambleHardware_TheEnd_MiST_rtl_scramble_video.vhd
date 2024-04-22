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

entity SCRAMBLE_VIDEO is
  port (
    I_HWSEL_FROGGER       : in    boolean;
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
    I_POUT1               : in  std_logic;
    --
    O_VIDEO_R             : out std_logic_vector(2 downto 0);
    O_VIDEO_G             : out std_logic_vector(2 downto 0);
    O_VIDEO_B             : out std_logic_vector(2 downto 0);
    --
    ENA                   : in  std_logic;
    ENA_STAR              : in  std_logic;
    CLK                   : in  std_logic
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

  type array_3x5 is array (2 downto 0) of std_logic_vector(2 downto 0);
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
  signal mld_l                : std_logic;
  
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

  signal obj_rom_addr         : std_logic_vector(10 downto 0);
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
  -- missile	
  signal missile_cnt          : std_logic_vector(7 downto 0);			
  signal missile_ena          : std_logic;			
  signal missile              : std_logic;			
  signal missile_reg          : std_logic;			
  -- stars
  signal star_r               : std_logic_vector(1 downto 0);
  signal star_g               : std_logic_vector(1 downto 0);
  signal star_b               : std_logic_vector(1 downto 0);
  -- frogger blue bar
  signal frogger_blue_reg     : std_logic;
  signal frogger_blue         : std_logic;
  signal frogger_blue_out_reg : std_logic;
  -- scramble blue
  signal pout1_reg            : std_logic;


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

        if not I_HWSEL_FROGGER then
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

  p_video_addr_calc : process(I_HWSEL_FROGGER, vcnt_f, hpla)
  begin
    if not I_HWSEL_FROGGER then
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

  p_vram_xor : process(vram_addr_reg, objdata, h256)
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

  p_obj_rom_addr : process(h256, vram_addr_xor, vram_dout, objdata, I_HCNT)
  begin
    obj_rom_addr( 2 downto 0) <= vram_addr_xor(2 downto 0);
    if (h256 = '0') then
     -- a
      obj_rom_addr(10 downto 3) <= vram_dout; -- background objects
    else
      obj_rom_addr(10 downto 3) <= objdata(5 downto 0) & vram_addr_xor(3) & (objdata(6) xor I_HCNT(3)); -- sprites
    end if;
  end process;

  obj_rom0 : entity work.ROM_OBJ_0 -- 5H
    port map (CLK => CLK, ADDR => obj_rom_addr, DATA => obj_rom_0_dout);
  obj_rom1 : entity work.ROM_OBJ_1 -- 5F
    port map (CLK => CLK, ADDR => obj_rom_addr, DATA => obj_rom_1_dout);

  p_obj_rom_shift : process
    variable obj_rom_0_dout_s : std_logic_vector(7 downto 0);
  begin
    wait until rising_edge (CLK);
    if not I_HWSEL_FROGGER then
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
    mld_l <= '1';
    if (ld = '1') and (h256 = '1') and (I_HCNT(3) = '1') then --4D:Y3
      if (missile_reg_l = '0') and (I_HCNT(6 downto 3) /= "1111") then -- tweak to mimic galaxian hw !
        sld_l <= '0';
      end if;
  
      if (missile_reg_l = '0') and (I_HCNT(6 downto 3) = "1111") then  -- tweak to mimic galaxian hw !
        mld_l <= '0';
    end if;
		
    end if;

  end process;

  p_shell_reg : process
  begin
    wait until rising_edge(CLK);
    if (ENA = '1') then

      if (sld_l = '0') then
        shell_cnt <= hpla;
      elsif (cblank_l = '1') then
        shell_cnt <= shell_cnt + "1";
      else
        shell_cnt <= shell_cnt;
      end if;

      if (sld_l = '0') then
        shell_ena <= '1';
      elsif (shell_cnt = "11111110") then
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
    if (shell_cnt > x"F8") then -- minus 2 as delay wrong
      shell <= shell_ena;
    end if;
  end process;

  p_missile_reg : process
  begin
    wait until rising_edge(CLK);
    if (ENA = '1') then

      if (mld_l = '0') then
        missile_cnt <= hpla;
      elsif (cblank_l = '1') then
        missile_cnt <= missile_cnt + "1";
      else
        missile_cnt <= missile_cnt;
      end if;

      if (mld_l = '0') then
        missile_ena <= '1';
      elsif (missile_cnt = "11111110") then
        missile_ena <= '0';
      end if;
    end if;
  end process;

  p_missile_op : process(missile_cnt, missile_ena)
  begin
    -- note how T input is from QD on the bottom counter
    -- we get a rc from xF8 to XFF
    -- so the shell is set at count xFA (rc and bit 1)
    missile <= '0';
    if (missile_cnt > x"F8") then -- minus 2 as delay wrong
      missile <= missile_ena;
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

      if (cblank_l = '0') then
        -- logic around the clr workes out as a sync reset
        obj_video_out_reg <= (others => '0');
        shell_reg <= '0';
        frogger_blue_out_reg <= '0';
        pout1_reg <= '0';
      else

        obj_video_out_reg(4 downto 2) <= col(2 downto 0);
        obj_video_out_reg(1 downto 0) <= vid(1 downto 0);
        vidout_l <= not(vid(1) or vid(0));
        -- probably wider than the original, we must be a whole 6MHz clock here or the scan-doubler will loose it.
        shell_reg <= shell;
        missile_reg <= missile;
        frogger_blue_out_reg <= frogger_blue;

        pout1_reg <= I_POUT1;

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
  col_rom : entity work.ROM_LUT
    port map(
		CLK => CLK, 
      ADDR        => obj_video_out_reg(4 downto 0),
      DATA        => obj_lut_out
      );

  p_col_rom_ce : process
    variable video : array_3x5;
  begin
    wait until rising_edge(CLK);
    if (ENA = '1') then
      if (vidout_l = '0') then -- cs_l on col rom
        video(0)(2 downto 0) := obj_lut_out(7 downto 6) & '0';  -- b
        video(1)(2 downto 0) := obj_lut_out(5 downto 3); -- g
        video(2)(2 downto 0) := obj_lut_out(2 downto 0); -- r
      else
        video(0)(2 downto 0) := "000";
        video(1)(2 downto 0) := "000";
        video(2)(2 downto 0) := "000";
      end if;
      --
      -- end of direct assigns
      --
      if I_HWSEL_FROGGER then
        if (frogger_blue_out_reg = '1') and (vidout_l = '1') then
          video(0) := video(0) or "010";
        end if;
      end if;

      if not I_HWSEL_FROGGER then
			if shell_reg = '1' then
				video(0) := "110"; -- b
				video(1) := "110"; -- g
				video(2) := "110"; -- r
			elsif missile_reg = '1' then
				video(0) := "110"; -- b
				video(1) := "000"; -- g
				video(2) := "110"; -- r
			end if;
      end if;

      -- add stars, background and video
      if not I_HWSEL_FROGGER then
			video(0) := video(0) or ( star_b & '0');
			video(1) := video(1) or ( star_g & '0');
			video(2) := video(2) or ( star_r & '0');

        if (pout1_reg = '1') and (vidout_l = '1') then
          video(0) := video(0) or ("011");
        end if;
      end if;

      O_VIDEO_B <= video(0);
      O_VIDEO_G <= video(1);
      O_VIDEO_R <= video(2);
    end if;
  end process;

	stars : work.MC_STARS
	port map (
		I_CLK     => CLK,
		I_ENA     => ENA_STAR,
		I_H_FLIP  => '0',
		I_V_SYNC  => I_VSYNC,
		I_8HF     => I_HCNT(3),
		I_256HnX  => h256_l,
		I_1VF     => I_VCNT(0),
		I_2V      => I_VCNT(1),
		I_STARS_ON   => I_STARSON,
		I_STARS_OFFn => '1',

		O_R       => star_r,
		O_G       => star_g,
		O_B       => star_b
	);
  
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

end RTL;

------------------------------------------------------------------------------
-- FPGA STARS
--
-- Version : 2.00
--
-- Copyright(c) 2004 Katsumi Degawa , All rights reserved
--
-- Important !
--
-- This program is freeware for non-commercial use.
-- The author does not guarantee this program.
-- You can use this at your own risk.
--
------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity MC_STARS is
	port (
		I_CLK         : in  std_logic;
		I_ENA         : in  std_logic;
		I_H_FLIP      : in  std_logic;
		I_V_SYNC      : in  std_logic;
		I_8HF         : in  std_logic;
		I_256HnX      : in  std_logic;
		I_1VF         : in  std_logic;
		I_2V          : in  std_logic;
		I_STARS_ON    : in  std_logic;
		I_STARS_OFFn  : in  std_logic;

		O_R           : out std_logic_vector(1 downto 0);
		O_G           : out std_logic_vector(1 downto 0);
		O_B           : out std_logic_vector(1 downto 0);
		O_NOISE       : out std_logic
	);
end;

architecture RTL of MC_STARS is
	signal CLK_1C           : std_logic := '0';
	signal CLK_1Cd          : std_logic := '0';
	signal W_2D_Qn          : std_logic := '0';
	
	signal W_3B             : std_logic := '0';
	signal noise            : std_logic := '0';
	signal W_2A             : std_logic := '0';
	signal W_4P             : std_logic := '0';
	signal CLK_1AB          : std_logic := '0';
	signal CLK_1ABd         : std_logic := '0';
	signal W_1AB_Q          : std_logic_vector(15 downto 0) := (others => '0');
	signal W_1C_Q           : std_logic_vector( 1 downto 0) := (others => '0');
begin
	O_R       <= (W_1AB_Q( 9) & W_1AB_Q (8) ) when (W_2A = '0' and W_4P = '0' and I_256HnX = '1') else (others => '0');
	O_G       <= (W_1AB_Q(11) & W_1AB_Q(10) ) when (W_2A = '0' and W_4P = '0' and I_256HnX = '1') else (others => '0');
	O_B       <= (W_1AB_Q(13) & W_1AB_Q(12) ) when (W_2A = '0' and W_4P = '0' and I_256HnX = '1') else (others => '0');

	CLK_1C    <= not (I_ENA and (not I_V_SYNC) and I_256HnX);
	CLK_1AB   <= not (CLK_1C or (not (I_H_FLIP or W_1C_Q(1))));
	W_3B      <= W_2D_Qn xor W_1AB_Q(4);

	W_2A      <= '0' when (W_1AB_Q(7 downto 0) = x"ff") else '1';
	W_4P      <= not (( I_8HF xor I_1VF ) and W_2D_Qn and I_STARS_OFFn);

	O_NOISE   <= noise ;

	process(I_2V)
	begin
		if rising_edge(I_2V) then
			noise <= W_2D_Qn;
		end if;
	end process;

	process(I_CLK, I_V_SYNC)
	begin
		if(I_V_SYNC = '1') then
			W_1C_Q <= (others => '0');
		elsif rising_edge(I_CLK) then
			CLK_1Cd <= CLK_1C;
			if CLK_1Cd = '0' and CLK_1C = '1' then
				W_1C_Q <= W_1C_Q(0) & '1';
			end if;
		end if;
	end process;

	process(I_CLK, I_STARS_ON)
	begin
		if(I_STARS_ON = '0') then
			W_1AB_Q <= (others => '0');
			W_2D_Qn <= '1';
		elsif rising_edge(I_CLK) then
			CLK_1ABd <= CLK_1AB;
			if CLK_1ABd = '0' and CLK_1AB = '1' then
				W_1AB_Q <= W_1AB_Q(14 downto 0) & W_3B;
				W_2D_Qn <= not W_1AB_Q(15);
			end if;
		end if;
	end process;
end RTL;
