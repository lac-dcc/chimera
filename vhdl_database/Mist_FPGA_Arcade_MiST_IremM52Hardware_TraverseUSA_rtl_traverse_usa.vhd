---------------------------------------------------------------------------------
-- Traverse USA by Dar (darfpga@aol.fr) (16/03/2019)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- gen_ram.vhd & io_ps2_keyboard
-------------------------------- 
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
---------------------------------------------------------------------------------
-- T80/T80se - Version : 0247
-----------------------------
-- Z80 compatible microprocessor core
-- Copyright (c) 2001-2002 Daniel Wallner (jesus@opencores.org)
---------------------------------------------------------------------------------
-- cpu68 - Version 9th Jan 2004 0.8
-- 6800/01 compatible CPU core 
-- GNU public license - December 2002 : John E. Kent
---------------------------------------------------------------------------------
-- YM2149 (AY-3-8910)
-- Copyright (c) MikeJ - Jan 2005
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------

--  Features :
--   Video        : TV 15KHz mode only (atm)
--   Coctail mode : OK
--   Sound        : OK

--  Use with MAME roms from travusa.zip
--
--  Use make_travusa_proms.bat to build vhd file from binaries
--  (CRC list included)

--  Traverse USA (irem M52) Hardware caracteristics :
--
--  VIDEO : 1xZ80@3MHz CPU accessing its program rom, working ram,
--    sprite data ram, I/O, sound board register and trigger.
--		  32Kx8bits program rom
--
--    One char tile map 64x32 with H scrolling (32x32 visible)
--      8Kx24bits graphics rom 3bits/pixel
--      8colors per tile / 16 color sets
--      rbg palette 128 colors 8bits : 2red 3green 3blue
--
--    72 sprites / line, 16x16 with flip H/V
--    (schematics seems too allow only 24 sprites / line with bank switch
--     at mid screen. This doesn't allow showing all needed sprite)
--
--      8Kx24bits graphics rom 3bits/pixel
--      8colors per sprite / 32 color sets among 16 colors;
--      rbg palette 16 colors 8bits : 2red 3green 3blue
--
--    Working ram : 4Kx8bits
--    Sprites data ram : 256x8bits
--    Sprites line buffer rams : 1 scan line delay flip/flop 2x256x4bits
--
--  SOUND : 1x6803@3.58MHz CPU accessing its program rom, working ram, 2x-AY3-8910, 1xMSM5205
--		  4Kx8bits program rom
--      128x8bits working ram
--
--      1xAY-3-8910
-- 		I/O to MSM5205 and command/trigger from video board.
--			3 sound channels
--
--      1xAY-3-8910
--			3 sound channels
--
---------------------------------------------------------------------------------
--  Schematics remarks :
--
--		Frame is 384 x 282 (H x V) which is too much lines for standard TV set (262.5 lines)
--		This create a display artefact near end of frame since already entering composite 
--		sync egalisation pulses. Line number cannot be reduced since CPU need enough fly back
--    time to update every sprites position. (Reducing line count will result in missing sprites)
--    May be this can be achieved by increasing CPU clock speed (web site and MAME report 4Mhz)
--    My  M52-A schematic clearly shows 18.432/6.
--
--		=> I give more CPU time to access sprite ram data by allowing CPU access as soon as video
--		scanner V is outside the sprite zone i.e. outside the scroling part of screen (which
--		depends on the flip screen state).
--		
--		Moreover M52-B schematic doesn't show to allow seeking more than 24 sprites data per
--		line from :
--			- C820 to C87F for half upper screen (vertical)
--			- C8A0 to C8FF for half lower screen (vertical)
--
--		But, at beginning of the game, during starting count downto, 5 cars are diplayed +
--		moto + count down numbers. At least some sprite cars data comes not only from 
--		C820-C87F but also from C920 to C97F. Which involves at least 2 sprite data regions 
--		for the same half part of the screen (see cars numbered 0 and 3).
--
--		=> I modify the sprite data address scanner to allow 3 regions to be scanned at each line
--		(C820-C87F, C8A0-C8FF and C920-C97F). My first design was with a 12MHz master clock to
--		allow 1 read and 1 write access to sprite line buffer ram at each pixel (6Mhz). This
--		permit only one sprite data region to be scanned at each line. The master clock was 
--		increased from 12Mhz to	36Mhz and desing modified to allow 3 sprite data regions to be
--		scanned at each line.
--
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity traverse_usa is
port(
 clock_36     : in std_logic;
 clock_0p895  : in std_logic;
 reset        : in std_logic;

 palmode        : in std_logic; -- 50 Hz vfreq
 shtrider       : in std_logic; -- Shot Rider mode
-- tv15Khz_mode : in std_logic;
 video_r        : out std_logic_vector(1 downto 0);
 video_g        : out std_logic_vector(2 downto 0);
 video_b        : out std_logic_vector(2 downto 0);
 video_clk      : out std_logic;
 video_csync    : out std_logic;
 video_blankn   : out std_logic;
 video_hs       : out std_logic;
 video_vs       : out std_logic;
 audio_out      : out std_logic_vector(10 downto 0);

 dip_switch_1   : in std_logic_vector(7 downto 0); -- Coinage_B(7-4) / Cont. play(3) / Fuel consumption(2) / Fuel lost when collision (1-0)
 dip_switch_2   : in std_logic_vector(7 downto 0); -- Diag(7) / Demo(6) / Zippy(5) / Freeze (4) / M-Km(3) / Coin mode (2) / Cocktail(1) / Flip(0)
  
 start2         : in std_logic;
 start1         : in std_logic;
 coin1          : in std_logic;
 
 right1         : in std_logic;
 left1          : in std_logic;
 accel1         : in std_logic;
 brake1         : in std_logic;
 
 right2         : in std_logic;
 left2          : in std_logic; 
 accel2         : in std_logic;
 brake2         : in std_logic;
 
 cpu_rom_addr   : out std_logic_vector(14 downto 0);
 cpu_rom_do     : in  std_logic_vector( 7 downto 0);
 cpu_rom_rd     : out std_logic;
 snd_rom_addr   : out std_logic_vector(12 downto 0);
 snd_rom_do     : in  std_logic_vector( 7 downto 0);
 snd_rom_vma    : out std_logic;
 
 dl_addr        : in  std_logic_vector(16 downto 0);
 dl_data        : in  std_logic_vector( 7 downto 0);
 dl_wr          : in  std_logic;

 dbg_cpu_addr : out std_logic_vector(15 downto 0)
 );
end traverse_usa;

architecture struct of traverse_usa is

 signal reset_n: std_logic;
 signal clock_36n : std_logic;
 signal clock_cnt : std_logic_vector(3 downto 0) := "0000";

 signal hcnt    : std_logic_vector(8 downto 0) := '0'&x"00"; -- horizontal counter
 signal vcnt    : std_logic_vector(8 downto 0) := '0'&x"00"; -- vertical counter
 
 signal hcnt_flip : std_logic_vector(8 downto 0);
 signal vcnt_flip : std_logic_vector(8 downto 0);
 signal hcnt_scrolled : std_logic_vector(8 downto 0);
 signal hcnt_scrolled_flip : std_logic_vector(2 downto 0);
 
 signal pix_ena : std_logic;
 
 signal csync   : std_logic; 
 signal hsync0  : std_logic; 
 signal hsync1  : std_logic; 
 signal hsync2  : std_logic; 

 signal hblank  : std_logic; 
 signal vblank  : std_logic; 
 
 signal cpu_ena        : std_logic;

 signal cpu_addr    : std_logic_vector(15 downto 0);
 signal cpu_di      : std_logic_vector( 7 downto 0);
 signal cpu_do      : std_logic_vector( 7 downto 0);
 signal cpu_wr_n    : std_logic;
 signal cpu_mreq_n  : std_logic;
 signal cpu_ioreq_n : std_logic;
 signal cpu_irq_n   : std_logic;
 signal cpu_m1_n    : std_logic;

-- signal cpu_rom_do : std_logic_vector( 7 downto 0);
 
 signal wram_we    : std_logic;
 signal wram_do    : std_logic_vector( 7 downto 0);

 signal vflip    : std_logic;
 signal flip     : std_logic;
 signal flip_int : std_logic;
 
 signal chrram_addr: std_logic_vector(11 downto 0);
 signal chrram_we  : std_logic;
 signal chrram_do  : std_logic_vector(7 downto 0);
 signal chrram_do_to_cpu : std_logic_vector( 7 downto 0);

 signal scroll_x     : std_logic_vector(8 downto 0) := (others=>'0');
 signal apply_scroll : std_logic;
 
 signal chr_code: std_logic_vector( 7 downto 0);
 signal chr_attr: std_logic_vector( 7 downto 0);
 signal chr_code_line : std_logic_vector(12 downto 0);
 signal chr_flip_h : std_logic;
 
 signal chr_graphx1_do   : std_logic_vector(7 downto 0);
 signal chr_graphx2_do   : std_logic_vector(7 downto 0);
 signal chr_graphx3_do   : std_logic_vector(7 downto 0);
 signal chr_color        : std_logic_vector(3 downto 0);
 signal chr_palette_addr : std_logic_vector(7 downto 0);
 signal chr_palette_1_do : std_logic_vector(7 downto 0); 
 signal chr_palette_2_do : std_logic_vector(7 downto 0); 

 signal sprram_addr      : std_logic_vector(9 downto 0);
 signal sprram_we        : std_logic;
 signal sprram_do        : std_logic_vector(7 downto 0);
 
 signal cpu_has_spr_ram  : std_logic;
 
 signal spr_pix_ena           : std_logic;
 signal spr_hcnt              : std_logic_vector(10 downto 0);
 signal spr_posv, spr_posv_r  : std_logic_vector( 7 downto 0);
 signal spr_attr, spr_attr_r  : std_logic_vector( 7 downto 0);
 signal spr_code, spr_code_r  : std_logic_vector( 7 downto 0);
 signal spr_posh              : std_logic_vector( 7 downto 0);
 
 signal spr_vcnt         : std_logic_vector( 7 downto 0);
 signal spr_on_line      : std_logic;
 signal spr_on_line_r    : std_logic;
 signal spr_code_line    : std_logic_vector(12 downto 0);
 signal spr_line_cnt     : std_logic_vector( 4 downto 0);
 signal spr_graphx1_do   : std_logic_vector( 7 downto 0);
 signal spr_graphx2_do   : std_logic_vector( 7 downto 0);
 signal spr_graphx3_do   : std_logic_vector( 7 downto 0);
 signal spr_palette_addr : std_logic_vector( 7 downto 0);
 signal spr_palette_do   : std_logic_vector( 7 downto 0);
 signal spr_pixels       : std_logic_vector( 4 downto 0);
 signal spr_rgb_lut_addr : std_logic_vector( 4 downto 0);
 signal spr_rgb_lut_do   : std_logic_vector( 7 downto 0);

 signal spr_input_line_addr  : std_logic_vector(7 downto 0);
 signal spr_input_line_di    : std_logic_vector(3 downto 0);
 signal spr_input_line_do    : std_logic_vector(3 downto 0);
 signal spr_input_line_we    : std_logic;

 signal spr_output_line_addr : std_logic_vector(7 downto 0);
 signal spr_output_line_di   : std_logic_vector(3 downto 0);
 signal spr_output_line_do   : std_logic_vector(3 downto 0);
 signal spr_output_line_we   : std_logic;
 signal spr_buffer_ram1_addr : std_logic_vector(7 downto 0);
 signal spr_buffer_ram1_we   : std_logic;
 signal spr_buffer_ram1_di   : std_logic_vector(3 downto 0);
 signal spr_buffer_ram1_do   : std_logic_vector(3 downto 0);
 signal spr_buffer_ram2_addr : std_logic_vector(7 downto 0);
 signal spr_buffer_ram2_we   : std_logic;
 signal spr_buffer_ram2_di   : std_logic_vector(3 downto 0);
 signal spr_buffer_ram2_do   : std_logic_vector(3 downto 0);
 
 signal sound_cmd  : std_logic_vector( 7 downto 0);
 signal audio      : std_logic_vector(11 downto 0);

 signal input_0       : std_logic_vector(7 downto 0);
 signal input_1       : std_logic_vector(7 downto 0);
 signal input_2       : std_logic_vector(7 downto 0);

 signal char_graphics_1_we   : std_logic;
 signal char_graphics_2_we   : std_logic;
 signal char_graphics_3_we   : std_logic;
 signal sprite_graphics_1_we : std_logic;
 signal sprite_graphics_2_we : std_logic;
 signal sprite_graphics_3_we : std_logic;
 signal chr_palette_1_we     : std_logic;
 signal chr_palette_2_we     : std_logic;
 signal spr_palette_we       : std_logic;
 signal spr_lut_we           : std_logic;

begin

clock_36n <= not clock_36;
reset_n   <= not reset;

-- debug 
process (reset, clock_36, cpu_ena, cpu_mreq_n)
begin
 if rising_edge(clock_36) and cpu_ena ='1' and cpu_mreq_n ='0' then
   dbg_cpu_addr <= cpu_addr;
 end if;
end process;

-- make enables clock from 36MHz
process (clock_36, reset)
begin
	if reset='1' then
		clock_cnt <= "0000";
	else 
		if rising_edge(clock_36) then
			if clock_cnt = "1011" then
				clock_cnt <= "0000";
			else
				clock_cnt <= clock_cnt + 1;
			end if;
		end if;
	end if;   		
end process;

pix_ena <= '1' when clock_cnt = "0101" or clock_cnt = "1011" else '0'; -- (6MHz)
cpu_ena <= '1' when clock_cnt = "1011" else '0'; -- (3MHz)

-------------------
-- Video scanner --
-------------------
--  hcnt [x080..x0FF-x100..x1FF] => 128+256 = 384 pixels,  384/6.144Mhz => 1 line is 62.5us (16.000KHz)
--  vcnt [x0E6..x0FF-x100..x1FF] =>  26+256 = 282 lines, 1 frame is 260 x 62.5us = 17.625ms (56.74Hz)

process (reset, clock_36, pix_ena)
begin
	if reset='1' then
		hcnt  <= (others=>'0');
		vcnt  <= '0'&X"FC";	
	else 
		if rising_edge(clock_36) and pix_ena = '1'then
			hcnt <= hcnt + 1;
			if hcnt = '1'&x"FF" then
				hcnt <= '0'&x"80";
				vcnt <= vcnt + 1;
				if vcnt = '1'&x"FF" then
					if palmode = '0' then
						vcnt <= '0'&x"E6";  -- from M52 schematics
					else
						vcnt <= '0'&x"C8";
					end if;
				end if;
			end if;
		end if;
	end if;
end process;

flip <= flip_int xor dip_switch_2(0);
hcnt_flip <= '0'&hcnt(7 downto 0) when flip ='1' else '0' & not hcnt(7 downto 0);
vflip <= flip xor shtrider;
vcnt_flip <= vcnt when vflip ='1' else not vcnt;

--------------------
-- players inputs --
--------------------
input_0       <= "1111" & not coin1 & '1' & not start2 & not start1;
input_1       <= not brake1 & '1' & not accel1 & "111" & not left1 & not right1; 
input_2       <= not brake2 & '1' & not accel2 & "111" & not left2 & not right2;

------------------------------------------
-- cpu data input with address decoding --
------------------------------------------
cpu_di <= cpu_rom_do   		when cpu_addr(15 downto 12) < X"8" else    -- 0000-7FFF
			 chrram_do_to_cpu	when cpu_addr(15 downto 12) = X"8" else    -- 8000-8FFF
			 wram_do     		when cpu_addr(15 downto 12) = X"E" else    -- E000-EFFF
			 input_0          when cpu_addr(15 downto  0) = X"D000" else -- D000
			 input_1          when cpu_addr(15 downto  0) = X"D001" else -- D001 
			 input_2          when cpu_addr(15 downto  0) = X"D002" else -- D002
			 dip_switch_1     when cpu_addr(15 downto  0) = X"D003" else -- D003										  
			 dip_switch_2     when cpu_addr(15 downto  0) = X"D004" else -- D004		 
   		 X"FF";
			 
------------------------------------------------------------------------
-- Misc registers : interrupt, scroll, cocktail flip, sound trigger
------------------------------------------------------------------------
process (clock_36, reset)
begin
	if reset = '1' then
		sound_cmd <= x"00";
	elsif rising_edge(clock_36) then
	
		if cpu_m1_n = '0' and cpu_ioreq_n = '0' then
			cpu_irq_n <= '1';
		else	-- lauch irq and end of frame
			if ((vcnt = 230 and vflip = '0') or (vcnt = 448 and vflip = '1')) and (hcnt = '0'&X"80")  then
				cpu_irq_n <= '0';
			end if;
		end if;

		if cpu_wr_n = '0' and cpu_addr(15 downto 12) = X"9" then scroll_x(7 downto 0) <= cpu_do;    end if;
		if cpu_wr_n = '0' and cpu_addr(15 downto 12) = X"A" then scroll_x(8)          <= cpu_do(0); end if;

		if cpu_wr_n = '0' and cpu_addr(15 downto 0) = X"D000" then sound_cmd <= cpu_do;    end if;
		if cpu_wr_n = '0' and cpu_addr(15 downto 0) = X"D001" then flip_int  <= cpu_do(0); end if;

	end if;	
end process; 

------------------------------------------
-- write enable to working ram from CPU --
------------------------------------------
wram_we   <= '1' when cpu_wr_n = '0' and cpu_addr(15 downto 12) = X"E" else '0';

----------------------
--- sprite machine ---
----------------------
-- 3 regions sprite data scanner
-- 080-1FF => C820-C87F
-- 180-2FF => C8A0-C8FF
-- 280-3FF => C920-C97F
process (clock_36)
begin
	if rising_edge(clock_36) then
		spr_pix_ena <= not spr_pix_ena; -- (18MHz)

		if hcnt = '1'&x"FF" and pix_ena = '1' then -- synched with hcnt
			spr_hcnt <= "000"&x"80";
			spr_pix_ena <= '0';
		else
			if spr_pix_ena = '1' then
				if spr_hcnt( 8 downto 0) = "1"&x"FF" then
					spr_hcnt( 8 downto 0) <= '0'&x"80";
					spr_hcnt(10 downto 9) <= spr_hcnt(10 downto 9) + '1';
				else
					spr_hcnt <= spr_hcnt + '1';				
				end if;
			end if;
		end if;
	end if;
end process;	

-- CPU allowed to access sprite data ram outside scrolling zone
-- from x080 to x13F                       when not flipped (scrolling zone from x140 to x1FF)
-- from x080 to x0FF and from x1C0 to x1FF when not flipped (scrolling zone from x100 to x1BF)
-- within scrolling zone sprite data ram is accessed by sprite data scanner (spr_hcnt)

cpu_has_spr_ram <= '1' when ( vcnt < '1'&x"3F" and vflip = '0') or 
									 ((vcnt > '1'&x"C0" or vcnt < '0'&x"FF") and vflip = '1') else '0';

sprram_we <= '1' when cpu_wr_n = '0' and cpu_addr(15 downto 11) = X"C"&"1" and cpu_has_spr_ram = '1' else '0';

sprram_addr <= '0' & spr_hcnt(10 downto 4) & spr_hcnt(2 downto 1) when  cpu_has_spr_ram = '0' else
					cpu_addr(9 downto 0);

-- latch current sprite data with respect to pixel and hcnt in relation with sprite data ram addressing  
process (clock_36)
begin
	if rising_edge(clock_36) then
		if spr_pix_ena = '1' then
			if spr_hcnt(2 downto 0) = "001" then spr_posv <= sprram_do ;end if;
			if spr_hcnt(2 downto 0) = "011" then spr_attr <= sprram_do ;end if;
			if spr_hcnt(2 downto 0) = "101" then spr_code <= sprram_do ;end if;
			if spr_hcnt(2 downto 0) = "111" then
				spr_posh   <= sprram_do ;
				spr_posv_r <= spr_posv;
				spr_attr_r <= spr_attr;
				spr_code_r <= spr_code;
			end if;
		end if;
	end if;
end process;	

-- compute sprite presence and graphics rom address w.r.t vertical position and v_flip (attr(7))
-- sprite is also inhibited when outside scrolling zone (cpu_has_spr_ram)
spr_vcnt <= vcnt_flip(7 downto 0) + spr_posv_r - 1 ;
spr_on_line <= '1' when spr_vcnt(7 downto 4) = x"F" and cpu_has_spr_ram = '0' else '0';
spr_line_cnt <= spr_vcnt(4 downto 0) xor (spr_attr_r(7) & spr_attr_r(7) & spr_attr_r(7) & spr_attr_r(7) & spr_attr_r(7));
spr_code_line <= spr_code_r & (spr_attr_r(6) xor not spr_hcnt(3)) & spr_line_cnt(3 downto 0) when shtrider = '0' else
                 spr_code_r & spr_line_cnt(3) & (spr_attr_r(6) xor not spr_hcnt(3)) & spr_line_cnt(2 downto 0);

-- get and serialise sprite graphics data and w.r.t enable (attr(5)) and h_flip (attr(6))
-- and compute palette address from graphics bits and color set#
with spr_attr_r(6 downto 5) select
spr_palette_addr(0) <= 	spr_graphx1_do(to_integer(unsigned(not(spr_hcnt(2 downto 0))))) when "00",
								spr_graphx1_do(to_integer(unsigned(   (spr_hcnt(2 downto 0))))) when "10",
								'0' when others;
								
with spr_attr_r(6 downto 5) select
spr_palette_addr(1) <= 	spr_graphx2_do(to_integer(unsigned(not(spr_hcnt(2 downto 0))))) when "00",
								spr_graphx2_do(to_integer(unsigned(   (spr_hcnt(2 downto 0))))) when "10",
								'0' when others;
								
with spr_attr_r(6 downto 5) select
spr_palette_addr(2) <= 	spr_graphx3_do(to_integer(unsigned(not(spr_hcnt(2 downto 0))))) when "00",
								spr_graphx3_do(to_integer(unsigned(   (spr_hcnt(2 downto 0))))) when "10",
								'0' when others;
								
spr_palette_addr(7 downto 3) <= spr_attr_r(4 downto 0); -- color set#

----------------------------------------------------
-- manage read/write flip-flop sprite line buffer --
----------------------------------------------------

-- input buffer work at 36Mhz (read previous data before write)
-- sprite data is written to input buffer when not already written (previous data differ from 0000) 

-- buffer data is written back to 0000 (cleared) after read from output buffer
-- output buffer work at normal pixel speed (12Mhz since read previous data before clear)

-- input/output buffers are swapped (fkip-flop) each other line

process (clock_36)
begin
	if rising_edge(clock_36) then
		if spr_pix_ena = '1' then
	
			spr_on_line_r <= spr_on_line;

			spr_pixels(3 downto 0) <= spr_palette_do(3 downto 0);
			spr_pixels(4) <= spr_attr_r(4); -- not used !

			-- write input buffer at the right place
			if spr_hcnt(3 downto 0) = "1000" then
				spr_input_line_addr <= spr_posh;
			else
				spr_input_line_addr <= spr_input_line_addr+1;
			end if;
		
		end if;

		-- read output buffer w.r.t. flip screen (normal/reverse)
		if pix_ena = '1' then
			if hcnt < '1'&x"09" then
				spr_output_line_addr <= X"00";
			else
				if flip = '0' then 
					spr_output_line_addr <= spr_output_line_addr+1;
				else
					spr_output_line_addr <= spr_output_line_addr-1;
				end if;
			end if;
			
		end if;

		-- demux output buffer (flip-flop)
		if pix_ena = '0' then 	
			if vcnt(0) = '1'then 
				spr_output_line_do <= spr_buffer_ram1_do;
			else
				spr_output_line_do <= spr_buffer_ram2_do;
			end if;	
		end if;
		
	end if;
end process;	

-- read previous data from input buffer w.r.t. flip-flop
spr_input_line_do  <= spr_buffer_ram1_do when vcnt(0) = '0' else spr_buffer_ram2_do;

-- feed input buffer
spr_input_line_di <= spr_pixels(3 downto 0); 
-- keep write data if input buffer is clear
spr_input_line_we <= '1' when spr_on_line_r = '1' and spr_pix_ena = '1' and spr_input_line_do = "0000" else '0';

-- feed output buufer (clear)
spr_output_line_di <= "0000";
-- always clear just after read
spr_output_line_we <= pix_ena;

-- flip-flop input/output buffers
spr_buffer_ram1_addr <= not(spr_input_line_addr) when vcnt(0) = '0' else spr_output_line_addr;
spr_buffer_ram1_di   <= spr_input_line_di   when vcnt(0) = '0' else spr_output_line_di;
spr_buffer_ram1_we   <= spr_input_line_we   when vcnt(0) = '0' else spr_output_line_we;

spr_buffer_ram2_addr <= not(spr_input_line_addr) when vcnt(0) = '1' else spr_output_line_addr;
spr_buffer_ram2_di   <= spr_input_line_di   when vcnt(0) = '1' else spr_output_line_di;
spr_buffer_ram2_we   <= spr_input_line_we   when vcnt(0) = '1' else spr_output_line_we;

-- feed sprite color lut with sprite output buffer
spr_rgb_lut_addr <= '0' & spr_output_line_do;					

--------------------
--- char machine ---
--------------------
-- compute scrolling zone and apply to horizontal scanner 
apply_scroll <= not(vcnt_flip(6) and vcnt_flip(7));
hcnt_scrolled <= hcnt_flip + scroll_x when apply_scroll = '1' else hcnt_flip;
hcnt_scrolled_flip <= hcnt_scrolled(2 downto 0) when flip = '1' else not (hcnt_scrolled(2 downto 0)); 

-- compute ram tile address w.r.t horizontal scanner
-- address char attr at pixel # 0
-- address char code at pixel # 4
-- give access to CPU for all other pixels
with hcnt_scrolled_flip(2 downto 0) select
chrram_addr <= vcnt_flip(7 downto 3) & hcnt_scrolled(8 downto 3) & '1' when "000",
					vcnt_flip(7 downto 3) & hcnt_scrolled(8 downto 3) & '0' when "100",
					cpu_addr(11 downto 0) when others;
		
-- write enable to char tile ram from CPU
chrram_we <= '1' when cpu_wr_n = '0' and cpu_addr(15 downto 12) = X"8" and hcnt_scrolled_flip(1 downto 0) /= "00" else '0';

-- read char tile ram and manage char graphics		
process (clock_36)
begin
	if rising_edge(clock_36) then
		-- latch ram tile output w.r.t to addressing scheme (attr/code/CPU)
		if hcnt_scrolled_flip(2 downto 0) = "000" then
			chr_attr <= chrram_do;
		end if;
		if hcnt_scrolled_flip(1 downto 0) /= "00" then
			chrram_do_to_cpu <= chrram_do;
		end if;
		if hcnt_scrolled_flip(2 downto 0) = "100" then
			chr_code <= chrram_do;
		end if;

		-- compute graphics rom address and delay char flip and color 
		if hcnt_scrolled_flip(2 downto 0) = "111" and pix_ena = '1' then
			chr_code_line( 2 downto  0) <= vcnt_flip(2 downto 0) xor (chr_attr(4) & chr_attr(4) & chr_attr(4));
			chr_code_line(10 downto  3) <= chr_code;
			chr_code_line(12 downto 11) <= chr_attr(7) & chr_attr(6);
			chr_flip_h <= chr_attr(5);
			chr_color <= chr_attr(3 downto 0);
		end if;
		
		-- get and serialise char graphics data and w.r.t char flip 
		-- and compute palette address from graphics bits and color set#
		if pix_ena = '1' then
			chr_palette_addr(6 downto 3) <= chr_color;
			chr_palette_addr(7) <= '0';
			if chr_flip_h = '0' then
				chr_palette_addr(0) <= chr_graphx1_do(to_integer(unsigned(not(hcnt_scrolled(2 downto 0)))));
				chr_palette_addr(1) <= chr_graphx2_do(to_integer(unsigned(not(hcnt_scrolled(2 downto 0)))));
				chr_palette_addr(2) <= chr_graphx3_do(to_integer(unsigned(not(hcnt_scrolled(2 downto 0)))));
			else
				chr_palette_addr(0) <= chr_graphx1_do(to_integer(unsigned(hcnt_scrolled(2 downto 0))));
				chr_palette_addr(1) <= chr_graphx2_do(to_integer(unsigned(hcnt_scrolled(2 downto 0))));
				chr_palette_addr(2) <= chr_graphx3_do(to_integer(unsigned(hcnt_scrolled(2 downto 0))));
			end if;
			
		end if;
	end if;
end process;

---------------------------
-- mux char/sprite video --
---------------------------
process (clock_36)
begin
	if rising_edge(clock_36) then
	
		if pix_ena = '1' then
			-- always give priority to sprite when not 0000
			-- except for char color #6 and #7 of color set#15
			if spr_output_line_do /= "0000" and 
				 (chr_palette_addr(6 downto 0) < "1111110") then 
				video_r <= spr_rgb_lut_do(7 downto 6);
				video_g <= spr_rgb_lut_do(5 downto 3);
				video_b <= spr_rgb_lut_do(2 downto 0);
			elsif shtrider = '0' then -- 1x8 bit in Traverse USA
				video_r <= chr_palette_1_do(7 downto 6);
				video_g <= chr_palette_1_do(5 downto 3);
				video_b <= chr_palette_1_do(2 downto 0);
			else -- 2x4 bit in Shot Rider
				video_r <= chr_palette_1_do(3 downto 2);
				video_g <= chr_palette_1_do(1 downto 0) & chr_palette_2_do(3);
				video_b <= chr_palette_2_do(2 downto 0);
			end if;
		end if;

	end if;
end process;	

---------------------------------------------------------
-- Sound board is same as Moon patrol (except CPU rom) --
---------------------------------------------------------
moon_patrol_sound_board : entity work.moon_patrol_sound_board
port map(
 clock_E      => clock_0p895,
 areset       => reset,
 
 select_sound => sound_cmd, -- not(key(1)) & sw(6 downto 0),
 audio_out    => audio,

 rom_addr     => snd_rom_addr,
 rom_do       => snd_rom_do,
 rom_vma      => snd_rom_vma,

 dbg_cpu_addr => open --dbg_cpu_addr
);


audio_out <= audio(11 downto 1);

----------------------------
-- video syncs and blanks --
----------------------------

video_csync <= csync;

process(clock_36, pix_ena)
	constant hcnt_base : integer := 180;
	variable hsync_cnt : std_logic_vector(8 downto 0);
	variable vsync_cnt : std_logic_vector(3 downto 0);
begin

if rising_edge(clock_36) and pix_ena = '1' then

	if hcnt = hcnt_base then
		hsync_cnt := (others=>'0');
	else
		hsync_cnt := hsync_cnt + 1;
	end if;	 

	if    hsync_cnt = 0   then hsync0 <= '0';
	elsif hsync_cnt = 24  then hsync0 <= '1';
	end if;

	if    hsync_cnt = 0     then hsync1 <= '0';
	elsif hsync_cnt = 0+8   then hsync1 <= '1';
	elsif hsync_cnt = 192   then hsync1 <= '0';
	elsif hsync_cnt = 192+8 then hsync1 <= '1';
	end if;

	if    hsync_cnt = 0     then hsync2 <= '0';
	elsif hsync_cnt = 192-8 then hsync2 <= '1';
	elsif hsync_cnt = 192   then hsync2 <= '0';
	elsif hsync_cnt = 384-8 then hsync2 <= '1';
	end if;
  
	if hcnt = hcnt_base then 
		if vcnt = 238 then
			vsync_cnt := X"0";
		else
			if vsync_cnt < X"F" then vsync_cnt := vsync_cnt + 1; end if;
		end if;
	end if;	 

	if    vsync_cnt = 0 then csync <= hsync1;
	elsif vsync_cnt = 1 then csync <= hsync1;
	elsif vsync_cnt = 2 then csync <= hsync1;
	elsif vsync_cnt = 3 then csync <= hsync2;
	elsif vsync_cnt = 4 then csync <= hsync2;
	elsif vsync_cnt = 5 then csync <= hsync2;
	elsif vsync_cnt = 6 then csync <= hsync1;
	elsif vsync_cnt = 7 then csync <= hsync1;
	elsif vsync_cnt = 8 then csync <= hsync1;
	else                     csync <= hsync0;
	end if;

	-- hcnt : [128-511] 384 pixels
	if    hcnt = 128 then hblank <= '1'; 
	elsif hcnt = 272 then hblank <= '0';
	end if;

	-- vcnt : [230-511] 282 lines
	if    vcnt = 200 or vcnt = 230 then vblank <= '1';
	elsif vcnt = 256 then vblank <= '0';
	end if;

	-- external sync and blank outputs
	video_blankn <= not (hblank or vblank);
--
    video_hs <= hsync0;
--  
    if    vsync_cnt = 0 then video_vs <= '0';
    elsif vsync_cnt = 2 then video_vs <= '1';
    end if;
--
end if;
end process;

------------------------------
-- components & sound board --
------------------------------

-- microprocessor Z80
cpu : entity work.T80s
generic map(Mode => 0, T2Write => 1, IOWait => 1)
port map(
  RESET_n => reset_n,
  CLK     => clock_36,
  CEN     => cpu_ena,
  WAIT_n  => '1',
  INT_n   => cpu_irq_n,
  NMI_n   => '1', --cpu_nmi_n,
  BUSRQ_n => '1',
  M1_n    => cpu_m1_n,
  MREQ_n  => cpu_mreq_n,
  IORQ_n  => cpu_ioreq_n,
  RD_n    => open,
  WR_n    => cpu_wr_n,
  RFSH_n  => open,
  HALT_n  => open,
  BUSAK_n => open,
  A       => cpu_addr,
  DI      => cpu_di,
  DO      => cpu_do
);

-- cpu program ROM 0x0000-0x7FFF
--rom_cpu : entity work.travusa_cpu
--port map(
-- clk  => clock_36n,
-- addr => cpu_addr(14 downto 0),
-- data => cpu_rom_do
--);
cpu_rom_addr <= cpu_addr(14 downto 0);
cpu_rom_rd   <= '1' when cpu_mreq_n = '0' and cpu_addr(15) = '0';

-- working RAM   0xE000-0xEFFF
wram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk  => clock_36n,
 we   => wram_we,
 addr => cpu_addr(11 downto 0),
 d    => cpu_do,
 q    => wram_do
);

-- char RAM   0x8000-0x8FFF
chrram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk  => clock_36n,
 we   => chrram_we,
 addr => chrram_addr,
 d    => cpu_do,
 q    => chrram_do
);

-- sprite RAM  0xC800-0xCBFF
sprite_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_36n,
 we   => sprram_we,
 addr => sprram_addr,
 d    => cpu_do,
 q    => sprram_do
);

-- sprite line buffer 1
sprlinebuf1 : entity work.gen_ram
generic map( dWidth => 4, aWidth => 8)
port map(
 clk  => clock_36n,
 we   => spr_buffer_ram1_we,
 addr => spr_buffer_ram1_addr,
 d    => spr_buffer_ram1_di,
 q    => spr_buffer_ram1_do
);

-- sprite line buffer 2
sprlinebuf2 : entity work.gen_ram
generic map( dWidth => 4, aWidth => 8)
port map(
 clk  => clock_36n,
 we   => spr_buffer_ram2_we,
 addr => spr_buffer_ram2_addr,
 d    => spr_buffer_ram2_di,
 q    => spr_buffer_ram2_do
);

-- char graphics ROM 3E
char_graphics_1 : entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_36n,
 addr_a => chr_code_line,
 q_a    => chr_graphx1_do,
 clk_b  => clock_36,
 we_b   => char_graphics_1_we,
 addr_b => dl_addr(12 downto 0),
 d_b    => dl_data
);
char_graphics_1_we <= '1' when dl_addr(16 downto 13) = "0101" and dl_wr = '1' else '0'; -- 0A000-0BFFF

-- char graphics ROM 3E
char_graphics_2 : entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_36n,
 addr_a => chr_code_line,
 q_a    => chr_graphx2_do,
 clk_b  => clock_36,
 we_b   => char_graphics_2_we,
 addr_b => dl_addr(12 downto 0),
 d_b    => dl_data
);
char_graphics_2_we <= '1' when dl_addr(16 downto 13) = "0110" and dl_wr = '1' else '0'; -- 0C000-0DFFF

-- char graphics ROM 3E
char_graphics_3 : entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_36n,
 addr_a => chr_code_line,
 q_a    => chr_graphx3_do,
 clk_b  => clock_36,
 we_b   => char_graphics_3_we,
 addr_b => dl_addr(12 downto 0),
 d_b    => dl_data
);
char_graphics_3_we <= '1' when dl_addr(16 downto 13) = "0111" and dl_wr = '1' else '0'; -- 0E000-0FFFF

--char palette ROM
char_palette_1 : entity work.dpram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk_a  => clock_36n,
 addr_a => chr_palette_addr,
 q_a    => chr_palette_1_do,
 clk_b  => clock_36,
 we_b   => chr_palette_1_we,
 addr_b => dl_addr(7 downto 0),
 d_b    => dl_data
);
chr_palette_1_we <= '1' when dl_addr(16 downto 8) = "101100000" and dl_wr = '1' else '0'; -- 16000-160FF

char_palette_2 : entity work.dpram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk_a  => clock_36n,
 addr_a => chr_palette_addr,
 q_a    => chr_palette_2_do,
 clk_b  => clock_36,
 we_b   => chr_palette_2_we,
 addr_b => dl_addr(7 downto 0),
 d_b    => dl_data
);
chr_palette_2_we <= '1' when dl_addr(16 downto 8) = "101100001" and dl_wr = '1' else '0'; -- 16100-161FF

-- sprite graphics ROM 3N
sprite_graphics_1 : entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_36n,
 addr_a => spr_code_line,
 q_a    => spr_graphx1_do,
 clk_b  => clock_36,
 we_b   => sprite_graphics_1_we,
 addr_b => dl_addr(12 downto 0),
 d_b    => dl_data
);
sprite_graphics_1_we <= '1' when dl_addr(16 downto 13) = "1000" and dl_wr = '1' else '0'; -- 10000-11FFF

-- sprite graphics ROM 3L or 3M
sprite_graphics_2 : entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_36n,
 addr_a => spr_code_line,
 q_a    => spr_graphx2_do,
 clk_b  => clock_36,
 we_b   => sprite_graphics_2_we,
 addr_b => dl_addr(12 downto 0),
 d_b    => dl_data
);
sprite_graphics_2_we <= '1' when dl_addr(16 downto 13) = "1001" and dl_wr = '1' else '0'; -- 12000-13FFF

-- sprite graphics ROM 3K
sprite_graphics_3 : entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_36n,
 addr_a => spr_code_line,
 q_a    => spr_graphx3_do,
 clk_b  => clock_36,
 we_b   => sprite_graphics_3_we,
 addr_b => dl_addr(12 downto 0),
 d_b    => dl_data
);
sprite_graphics_3_we <= '1' when dl_addr(16 downto 13) = "1010" and dl_wr = '1' else '0'; -- 14000-15FFF

-- sprite palette ROM 2H
spr_palette : entity work.dpram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk_a  => clock_36n,
 addr_a => spr_palette_addr,
 q_a    => spr_palette_do,
 clk_b  => clock_36,
 we_b   => spr_palette_we,
 addr_b => dl_addr(7 downto 0),
 d_b    => dl_data
);
spr_palette_we <= '1' when dl_addr(16 downto 8) = "101100010" and dl_wr = '1' else '0'; -- 16200-162FF

-- sprite rgb lut ROM 1F
spr_rgb_lut : entity work.dpram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk_a  => clock_36n,
 addr_a => "000"&spr_rgb_lut_addr, -- extended to 8 bit, prevents segfault of Quartus
 q_a    => spr_rgb_lut_do,
 clk_b  => clock_36,
 we_b   => spr_lut_we,
 addr_b => "000"&dl_addr(4 downto 0),
 d_b    => dl_data,
 q_b    => open
);
spr_lut_we <= '1' when dl_addr(16 downto 5) = "101100011000" and dl_wr = '1' else '0'; -- 16300-1631F

end struct;