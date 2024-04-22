--
-- A simulation model of Asteroids Deluxe hardware
-- Copyright (c) MikeJ - May 2004
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
-- This code is not part of the original game.

-- Dave Wood (oldgit) Feb 2019

-- My smaller version (512 x 512 screen). This module takes the Vectors and beam intensisty and 
-- produces a double buffered raster graphics screen. The intensity was used to give a 'blue hue' as per the original game
-- to the rocks and text but produces white for the ships. 

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

--use work.pkg_asteroids.all;

entity LLANDER_DW is
  port (
    RESET            : in    std_logic;
	 clk_25           : in    std_logic;
	 clk_6            : in    std_logic;

    X_VECTOR         : in    std_logic_vector(9 downto 0);
    Y_VECTOR         : in    std_logic_vector(9 downto 0);
    Z_VECTOR         : in    std_logic_vector(3 downto 0);
    BEAM_ON          : in    std_logic;
    BEAM_ENA         : in    std_logic;

    VIDEO_R_OUT      : out   std_logic_vector(3 downto 0);
    VIDEO_G_OUT      : out   std_logic_vector(3 downto 0);
    VIDEO_B_OUT      : out   std_logic_vector(3 downto 0);
    HSYNC_OUT        : out   std_logic;
    VSYNC_OUT        : out   std_logic;
	 VID_DE				: out   std_logic;
	 VID_HBLANK			: out		std_logic;
	 VID_VBLANK			: out		std_logic
    );
end;

architecture RTL of LLANDER_DW is
  -- types & constants
  subtype  Bus12    is std_logic_vector (11 downto 0);

  constant V_FRONT_PORCH_START : Bus12 := x"1e0"; -- line 480
  constant V_SYNC_START        : Bus12 := x"1ea"; -- line 490
  constant V_BACK_PORCH_START  : Bus12 := x"1ec"; -- line 492
  constant LINE_PER_FRAME      : Bus12 := x"20d"; -- 525 lines

  constant H_FRONT_PORCH_START : Bus12 := x"280"; -- pixel 640
  constant H_SYNC_START        : Bus12 := x"290"; -- pixel 656
  constant H_BACK_PORCH_START  : Bus12 := x"2f0"; -- pixel 752
  constant PIXEL_PER_LINE      : Bus12 := x"320"; -- 800 pixels

  signal lcount               : std_logic_vector(9 downto 0);
  signal pcount               : std_logic_vector(10 downto 0);

  signal hterm                : boolean;
  signal vterm                : boolean;
  signal v_sync               : std_logic;
  signal h_sync               : std_logic;
  signal v_blank              : std_logic;
  signal h_blank              : std_logic;
  signal raster_active        : std_logic;

  --
  signal beam_ena_t           : std_logic_vector(2 downto 0);
  signal beam_load            : std_logic;
  signal video_r              : std_logic_vector(3 downto 0);
  signal video_g              : std_logic_vector(3 downto 0);
  signal video_b              : std_logic_vector(3 downto 0);
  
  signal dw_addr				  : std_logic_vector(18 downto 0);

  signal up_addr				: std_logic_vector(17 downto 0);
  signal vid_out				: std_logic_vector(3 downto 0);
  signal Y_Vid					: std_logic_vector(8 downto 0);
  signal X_Vid					: std_logic_vector(8 downto 0);
  signal Vid_data					: std_logic_vector(3 downto 0);

  signal dcount					: std_logic_vector(2 downto 0);
  signal screen					: std_logic_vector(0 downto 0);
  signal vcount					: std_logic_vector(8 downto 0);
  signal hcount					: std_logic_vector(8 downto 0);
  signal pxcount					: std_logic_vector(8 downto 0);
  signal vram_wren				: std_logic;



  

begin

	pixel_cnt : process(clk_25, RESET)
	 variable vcnt_front_porch_start : boolean;
    variable hcnt_front_porch_start : boolean;
	begin
		if (RESET = '1') then
      hcount <= (others => '0');
      vcount <= (others => '0');

		elsif rising_edge(clk_25) then
		
		vcnt_front_porch_start := (vcount = 511);
		hcnt_front_porch_start := (hcount = 511);
		
      if hcnt_front_porch_start then
        hcount <= (others => '0');
      else
        hcount <= hcount + "1";
      end if;

      if hcnt_front_porch_start then
        if vcnt_front_porch_start then
          vcount <= (others => '0');

        else
          vcount <= vcount + "1";
        end if;
      end if;

    end if;
	end process;

  -- basic raster gen
  p_cnt_compare_comb : process(pcount,lcount)
  begin
    hterm <= (pcount = (PIXEL_PER_LINE(10 downto 0) - "1"));
    vterm <= (lcount = (LINE_PER_FRAME( 9 downto 0) - "1"));
  end process;

  p_display_cnt : process(clk_25, RESET)
  begin
    if (RESET = '1') then
      pcount <= (others => '0');
      lcount <= (others => '0');
		dcount <= (others => '0');		
    elsif rising_edge(clk_25) then
      if hterm then
        pcount <= (others => '0');
      else
        pcount <= pcount + "1";
      end if;
		
		if pcount > 63 then
			pxcount <= pxcount + "1";
			raster_active <= '1';
		end if;
		if pcount > 575 then
			raster_active <= '0';
			pxcount <= "111111111";
		end if;
			

      if hterm then
        if vterm then
          lcount <= (others => '0');
			 dcount <= dcount + "1" ;
        else
          lcount <= lcount + "1";
        end if;
      end if;

    end if;
  end process;

  p_vsync : process(clk_25, RESET)
    variable vcnt_eq_front_porch_start : boolean;
    variable vcnt_eq_sync_start        : boolean;
    variable vcnt_eq_back_porch_start  : boolean;
  begin
    if (RESET = '1') then
      v_sync <= '1';
      v_blank <= '0';
    elsif rising_edge(clk_25) then

      vcnt_eq_front_porch_start := (lcount = (V_FRONT_PORCH_START(9 downto 0) - "1"));
      vcnt_eq_sync_start        := (lcount = (       V_SYNC_START(9 downto 0) - "1"));
      vcnt_eq_back_porch_start  := (lcount = ( V_BACK_PORCH_START(9 downto 0) - "1"));

      if vcnt_eq_sync_start and hterm then
        v_sync <= '0';
      elsif vcnt_eq_back_porch_start and hterm then
        v_sync <= '1';
      end if;

      if vcnt_eq_front_porch_start and hterm then
        v_blank <= '1';
      elsif vterm and hterm then
        v_blank <= '0';
      end if;

    end if;
  end process;

  p_hsync : process(clk_25, RESET)
    variable hcnt_eq_front_porch_start     : boolean;
    variable hcnt_eq_sync_start            : boolean;
    variable hcnt_eq_back_porch_start      : boolean;
  begin
    if (RESET = '1') then
      h_sync <= '1';
      h_blank <= '1'; -- 0
    elsif rising_edge(clk_25) then
      hcnt_eq_front_porch_start     := (pcount = ( H_FRONT_PORCH_START(10 downto 0) - "1"));
      hcnt_eq_sync_start            := (pcount = (        H_SYNC_START(10 downto 0) - "1"));
      hcnt_eq_back_porch_start      := (pcount = (  H_BACK_PORCH_START(10 downto 0) - "1"));

      if hcnt_eq_sync_start then
        h_sync <= '0';
      elsif hcnt_eq_back_porch_start then
        h_sync <= '1';
      end if;

      if hcnt_eq_front_porch_start then
        h_blank <= '1';
      elsif hterm then
        h_blank <= '0';
      end if;

    end if;
  end process;

  p_active_video : process(h_blank, v_blank, raster_active, lcount, pxcount)
  begin
--    raster_active <= not(h_blank or v_blank);
	if raster_active = '1' then
		Y_Vid <= not (lcount(8 downto 0) and lcount(8 downto 0)) ;
	else
		Y_Vid <= "111111111";
	end if;
	if raster_active = '1' then
		X_Vid <= pxcount(8 downto 0);
	else
		X_Vid <= "111111111";
	end if;
	
  end process;

  p_video_out : process
  begin
    wait until rising_edge(clk_25);
    if raster_active = '1' then
		case vid_out is
      when "0000" => video_r <= "0000";video_g <= "0000";video_b <= "0000";
      when "0001" => video_r <= "0001";video_g <= "0001";video_b <= "0001";
      when "0010" => video_r <= "0011";video_g <= "0011";video_b <= "0011";
      when "0011" => video_r <= "0011";video_g <= "0011";video_b <= "0011";
      when "0100" => video_r <= "0011";video_g <= "0011";video_b <= "0111";
      when "0101" => video_r <= "0011";video_g <= "0011";video_b <= "0111";
      when "0110" => video_r <= "0011";video_g <= "0011";video_b <= "0111";
      when "0111" => video_r <= "0011";video_g <= "0011";video_b <= "0111";
      -- when "1000" => video_r <= "0111";video_g <= "0111";video_b <= "0111";
      when "1000" => video_r <= "0011";video_g <= "0011";video_b <= "0111";
      --when "1001" => video_r <= "0111";video_g <= "0111";video_b <= "0111";
      when "1001" => video_r <= "0011";video_g <= "0011";video_b <= "0111";
		when "1010" => video_r <= "0111";video_g <= "0111";video_b <= "0111";
		when "1011" => video_r <= "0111";video_g <= "0111";video_b <= "0111";
		when "1100" => video_r <= "1111";video_g <= "1111";video_b <= "1111";
		when "1101" => video_r <= "1111";video_g <= "1111";video_b <= "1111";
		when "1110" => video_r <= "1111";video_g <= "1111";video_b <= "1111";
      when others => video_r <= "1111";video_g <= "1111";video_b <= "1111";
    end case;
      VIDEO_R_OUT <= video_r;
      VIDEO_G_OUT <= video_g;
      VIDEO_B_OUT <= video_b;
    else -- blank
      VIDEO_R_OUT <= "0000";
      VIDEO_G_OUT <= "0000";
      VIDEO_B_OUT <= "0000";
    end if;
	 VID_DE <= not(v_blank or h_blank);
    VSYNC_OUT <= v_sync;
    HSYNC_OUT <= h_sync;
	 VID_HBLANK <= h_blank;
	 VID_VBLANK	<= v_blank;

  end process;

  up_addr <= (Y_Vid(8 downto 0) & X_Vid(8 downto 0));
  
  clear_ram : process(clk_25, RESET)
	variable state 				: integer range 0 to 4;
	variable beam_ena_r 	: std_logic := '0';
  
  begin
		if RESET = '1' then
			beam_ena_r := '0';

		elsif rising_edge(clk_25) then
		vram_wren <= '0' after 2 ns;
		
		if dcount = "000"  then
			screen <= "0";
			dw_addr <= "0" & ((Y_VECTOR(9 downto 1)  ) & X_VECTOR(9 downto 1));
			if BEAM_ON = '1' and beam_ena_r = '0' and BEAM_ENA = '1' then
				if Z_VECTOR(3 downto 0) = "0000" then
					vid_data <= "0000";
					vram_wren <= '0';
				else
					vid_data <= Z_VECTOR(3 downto 0);
					vram_wren <= '1';
				end if;
			end if;
		end if;
		if dcount = "001"  then
			screen <= "0";
			dw_addr <= "1" & (vcount ) & hcount;
			vid_data <= "0000";
			vram_wren <= '1';
		end if;
		if dcount = "010"  then
			screen <= "0";
			dw_addr <= "0" & ((Y_VECTOR(9 downto 1) ) & X_VECTOR(9 downto 1));
			if BEAM_ON = '1' and beam_ena_r = '0' and BEAM_ENA = '1' then
				if Z_VECTOR(3 downto 0) = "0000" then
					vid_data <= "0000";
					vram_wren <= '0';
				else
					vid_data <= Z_VECTOR(3 downto 0);
					vram_wren <= '1';
				end if;
			end if;
		end if;
		if dcount = "011"  then
			screen <= "0";
			dw_addr <= "1" & ((Y_VECTOR(9 downto 1)  ) & X_VECTOR(9 downto 1));
			if BEAM_ON = '1' and beam_ena_r = '0' and BEAM_ENA = '1' then
				if Z_VECTOR(3 downto 0) = "0000" then
					vid_data <= "0000";
					vram_wren <= '0';
				else
					vid_data <= Z_VECTOR(3 downto 0);
					vram_wren <= '1';
				end if;
			end if;
		end if;
		if dcount = "100"  then
			screen <= "1";
			dw_addr <= "1" & ((Y_VECTOR(9 downto 1)  ) & X_VECTOR(9 downto 1));
			if BEAM_ON = '1' and beam_ena_r = '0' and BEAM_ENA = '1' then
				if Z_VECTOR(3 downto 0) = "0000" then
					vid_data <= "0000";
					vram_wren <= '0';
				else
					vid_data <= Z_VECTOR(3 downto 0);
					vram_wren <= '1';
				end if;
			end if;
		end if;
		if dcount = "101"  then
			screen <= "1";
			dw_addr <= "0" & (vcount ) & hcount;
			vid_data <= "0000";
			vram_wren <= '1';
		end if;
		if dcount = "110"  then
			screen <= "1";
			dw_addr <= "1" & ((Y_VECTOR(9 downto 1)  ) & X_VECTOR(9 downto 1));
			if BEAM_ON = '1' and beam_ena_r = '0' and BEAM_ENA = '1' then
				if Z_VECTOR(3 downto 0) = "0000" then
					vid_data <= "0000";
					vram_wren <= '0';
				else
					vid_data <= Z_VECTOR(3 downto 0);
					vram_wren <= '1';
				end if;
			end if;
		end if;
		if dcount = "111"  then
			screen <= "1";
			dw_addr <= "0" & ((Y_VECTOR(9 downto 1)  ) & X_VECTOR(9 downto 1));
			if BEAM_ON = '1' and beam_ena_r = '0' and BEAM_ENA = '1' then
				if Z_VECTOR(3 downto 0) = "0000" then
					vid_data <= "0000";
					vram_wren <= '0';
				else
					vid_data <= Z_VECTOR(3 downto 0);
					vram_wren <= '1';
				end if;
			end if;
		end if;
		beam_ena_r := beam_ena;
		end if;
  end process;


video_rgb : work.dpram generic map (19,4)
port map
(
	clock_a   => clk_25,
	wren_a    => vram_wren,
	address_a => dw_addr,
	data_a    => vid_data,

	clock_b   => clk_25,
	address_b => screen & up_addr,
	q_b       => vid_out
);	

  -- job done !
end architecture RTL;
