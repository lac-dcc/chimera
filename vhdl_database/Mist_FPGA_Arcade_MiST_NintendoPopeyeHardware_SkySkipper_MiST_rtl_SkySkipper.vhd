---------------------------------------------------------------------------------
-- Sky Skipper by Dar (darfpga@aol.fr) (26/12/2019)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
--
-- release rev -- : beta release
--  (12/01/2020)
--
---------------------------------------------------------------------------------
-- gen_ram.vhd & io_ps2_keyboard
-------------------------------- 
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
---------------------------------------------------------------------------------
-- T80/T80se - Version : 304
-----------------------------
-- Z80 compatible microprocessor core
-- Copyright (c) 2001-2002 Daniel Wallner (jesus@opencores.org)
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
--   Video        : VGA 31kHz/60Hz progressive and TV 15kHz interlaced
--   Coctail mode : NO
--   Sound        : OK

--  Use with MAME roms from skyskipr.zip
--
--  Use make_sky_skipper_proms.bat to build vhd file from binaries
--  (CRC list included)

--  Sky skipper Hardware caracteristics : TODO
--
---------------------------------------------------------------------------------
--  Schematics remarks :
--
--		Display is 512x448 pixels  (video 640 pixels x 256 interlaced lines @ 10.08MHz )

--       640/10.08e6  = 63.49us per line  (15.750KHz)
--       63.49*256 = 16.254ms per frame (61.52Hz)
--        
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity SkySkipper is
port(
 clock_40     : in std_logic;
 reset        : in std_logic;
 tv15Khz_mode : in std_logic;
 video_r        : out std_logic_vector(2 downto 0);
 video_g        : out std_logic_vector(2 downto 0);
 video_b        : out std_logic_vector(1 downto 0);
 video_clk      : out std_logic;
 video_csync    : out std_logic;
 video_blankn   : out std_logic;
 video_hs       : out std_logic;
 video_vs       : buffer std_logic;
 
 audio_out      : out std_logic_vector(15 downto 0);
  
 coin1           : in std_logic;
 coin2           : in std_logic;
 start1         : in std_logic;
 start2         : in std_logic;

 right1         : in std_logic;
 left1          : in std_logic;
 up1            : in std_logic;
 down1          : in std_logic;
 fire11         : in std_logic;
 fire12         : in std_logic;
 right2         : in std_logic;
 left2          : in std_logic;
 up2            : in std_logic;
 down2          : in std_logic;
 fire21         : in std_logic;
 fire22         : in std_logic;
 sw1            : in std_logic_vector(6 downto 0);
 sw2            : in std_logic_vector(7 downto 0);

 
 service        : in std_logic;
 cpu_rom_addr   : out std_logic_vector(14 downto 0);
 cpu_rom_do     : in std_logic_vector(7 downto 0);
 dbg_cpu_addr : out std_logic_vector(15 downto 0)
 );
end SkySkipper;

architecture struct of SkySkipper is

 signal reset_n   : std_logic;
 signal clock_vid : std_logic;
 signal clock_vidn: std_logic;
 signal clock_cnt1: std_logic_vector(3 downto 0) := "0000";
 signal clock_cnt2: std_logic_vector(3 downto 0) := "0000";

 signal hcnt    : std_logic_vector(9 downto 0) := (others=>'0'); -- horizontal counter
 signal hflip   : std_logic_vector(9 downto 0) := (others=>'0'); -- horizontal counter flip
 signal vcnt    : std_logic_vector(9 downto 0) := (others=>'0'); -- vertical counter
 signal vflip   : std_logic_vector(9 downto 0) := (others=>'0'); -- vertical counter flip
  
 signal hs_cnt, vs_cnt :std_logic_vector(9 downto 0) ;
 signal hsync0, hsync1, hsync2, hsync3, hsync4 : std_logic;
 signal top_frame : std_logic := '0';

 signal pix_ena     : std_logic;
 signal cpu_ena     : std_logic;

 signal cpu_addr    : std_logic_vector(15 downto 0);
 signal cpu_di      : std_logic_vector( 7 downto 0);
 signal cpu_do      : std_logic_vector( 7 downto 0);
 signal cpu_wr_n    : std_logic;
 signal cpu_wr_n_r  : std_logic;
 signal cpu_rd_n    : std_logic;
 signal cpu_mreq_n  : std_logic;
 signal cpu_ioreq_n : std_logic;
 signal cpu_nmi_n   : std_logic;
 signal cpu_m1_n    : std_logic;
 signal cpu_rfsh_n  : std_logic;
 signal cpu_rfsh_n_r: std_logic;
 signal cpu_rom_do_swp : std_logic_vector( 7 downto 0);
 
 signal nmi_enable  : std_logic;
 signal no_nmi      : std_logic;

 
 signal wram_addr   : std_logic_vector(11 downto 0);
 signal wram_we     : std_logic;
 signal wram_do     : std_logic_vector( 7 downto 0);
 signal wram_do_r   : std_logic_vector( 7 downto 0);

-- signal dbg_wram_do     : std_logic_vector( 7 downto 0);

 signal ch_ram_addr     : std_logic_vector(9 downto 0);
 signal ch_ram_txt_we   : std_logic;
 signal ch_ram_txt_do   : std_logic_vector(7 downto 0);
 signal ch_ram_color_we : std_logic;
 signal ch_ram_color_do : std_logic_vector(3 downto 0);
 
 signal ch_code      : std_logic_vector( 7 downto 0);
 signal ch_code_line : std_logic_vector(11 downto 0);
 signal ch_graphx_do : std_logic_vector( 7 downto 0);
 signal ch_vid       : std_logic;
 signal ch_color     : std_logic_vector( 4 downto 0);
 
 signal hoffset      : std_logic_vector( 8 downto 0);
 signal hshift       : std_logic_vector( 9 downto 0);
 signal voffset      : std_logic_vector( 7 downto 0);
 signal vshift       : std_logic_vector( 9 downto 0);

 signal bg_ram_addr  : std_logic_vector(12 downto 0);
 signal bg_ram_we    : std_logic;
 signal bg_ram_do    : std_logic_vector(3 downto 0);

 signal bg_graphx    : std_logic_vector(3 downto 0); 
 signal bg_color     : std_logic_vector(3 downto 0); 
  
 signal move_buf          : std_logic;
 signal read_buf          : std_logic;
 signal sp_ram_addr       : std_logic_vector(9 downto 0);
 signal sp_ram1_we        : std_logic;
 signal sp_ram1_do        : std_logic_vector(7 downto 0);
 signal sp_ram2_we        : std_logic;
 signal sp_ram2_do        : std_logic_vector(7 downto 0);
 signal sp_ram3_we        : std_logic;
 signal sp_ram3_do        : std_logic_vector(7 downto 0);
 signal sp_ram4_we        : std_logic;
 signal sp_ram4_do        : std_logic_vector(7 downto 0);

 signal sp_vcnt           : std_logic_vector(9 downto 0);
 signal sp_on_line        : std_logic;
 
 signal sp_buffer_ram1_addr : std_logic_vector( 5 downto 0);
 signal sp_buffer_ram1_we   : std_logic;
 signal sp_buffer_ram1_di   : std_logic_vector(17 downto 0);
 signal sp_buffer_ram1_do   : std_logic_vector(17 downto 0);
 
 signal sp_buffer_ram2_addr : std_logic_vector( 5 downto 0);
 signal sp_buffer_ram2_we   : std_logic;
 signal sp_buffer_ram2_di   : std_logic_vector(17 downto 0);
 signal sp_buffer_ram2_do   : std_logic_vector(17 downto 0);
 
 signal sp_buffer_sel       : std_logic;

 signal sp_graphx1_do    : std_logic_vector( 7 downto 0);
 signal sp_graphx2_do    : std_logic_vector( 7 downto 0);
 signal sp_graphx3_do    : std_logic_vector( 7 downto 0);
 signal sp_graphx4_do    : std_logic_vector( 7 downto 0);

 signal sp_graphx0    : std_logic_vector( 15 downto 0);
 signal sp_graphx_sr0 : std_logic_vector( 15 downto 0);
 signal sp_graphx1    : std_logic_vector( 15 downto 0);
 signal sp_graphx_sr1 : std_logic_vector( 15 downto 0);
 
 signal sp_code_line        : std_logic_vector(12 downto 0);
 signal sp_code_line0       : std_logic_vector(12 downto 0);
 
 signal sp_hflip            : std_logic;
 signal sp_hflip_r          : std_logic;
 signal sp_hflip_rr         : std_logic;
 signal sp_hoffset          : std_logic_vector(1 downto 0);
 signal sp_color            : std_logic_vector(2 downto 0);
 signal sp_color_r          : std_logic_vector(2 downto 0);
 signal sp_color_rr         : std_logic_vector(2 downto 0);
 signal sp_vid              : std_logic_vector(1 downto 0);
 signal sp_hcnt             : std_logic_vector(3 downto 0);
 
 signal ch_palette_addr        : std_logic_vector(4 downto 0);
 signal ch_palette_do          : std_logic_vector(7 downto 0);
 signal bg_palette_addr        : std_logic_vector(4 downto 0);
 signal bg_palette_do          : std_logic_vector(7 downto 0);
 signal sp_palette_addr        : std_logic_vector(7 downto 0);
 signal sp_palette_rg_do       : std_logic_vector(7 downto 0); -- only 4 bits used
 signal sp_palette_gb_do       : std_logic_vector(7 downto 0); -- only 4 bits used
 
 signal input_0   : std_logic_vector(7 downto 0);
 signal input_1   : std_logic_vector(7 downto 0);
 signal input_2   : std_logic_vector(7 downto 0);
  
  
 signal ay_do     : std_logic_vector(7 downto 0);
 signal ay_bdir   : std_logic;
 signal ay_bc1    : std_logic;
 signal ay_audio  : std_logic_vector(7 downto 0);
 signal ay_ena    : std_logic;
 
 signal ay_iob_do : std_logic_vector(7 downto 0);
 signal ay_ioa_di : std_logic_vector(7 downto 0);
 
 signal protection_data0 : std_logic_vector(7 downto 0);
 signal protection_data1 : std_logic_vector(7 downto 0);
 signal protection_do    : std_logic_vector(7 downto 0);
 signal protection_shift : std_logic_vector(2 downto 0);

begin

clock_vid  <= clock_40;
clock_vidn <= not clock_40;
reset_n    <= not reset;

-- debug 
process (reset, clock_vid)
begin
 if rising_edge(clock_vid) then -- and cpu_ena ='1' and cpu_mreq_n ='0' then
	dbg_cpu_addr<= cpu_addr;
 end if;
end process;

-- make enables clock from clock_vid
process (clock_vid, reset)
begin
	if reset='1' then
		clock_cnt1 <= (others=>'0');
		clock_cnt2 <= (others=>'0');
	else 
		if rising_edge(clock_vid) then
		
			if clock_cnt1 = "1111" then  -- divide by 16
				clock_cnt1 <= (others=>'0');
			else
				clock_cnt1 <= clock_cnt1 + 1;
			end if;
			
			if clock_cnt2 = "10011" then  -- divide by 20
				clock_cnt2 <= (others=>'0');
			else
				clock_cnt2 <= clock_cnt2 + 1;
			end if;
			
		end if;
	end if;   		
end process;
--
cpu_ena <= '1' when clock_cnt2 = "00000" or clock_cnt2 = "01010" else '0'; -- (4MHz for cpu)
						  
ay_ena  <= '1' when clock_cnt2 = "00000" else '0';                         -- (2MHz for ay-3-8910)

pix_ena <= '1' when (clock_cnt1(1 downto 0) = "11" and tv15Khz_mode = '1') or         -- (10MHz for video interleaved)
						  (clock_cnt1(0) = '1'           and tv15Khz_mode = '0') else '0';  -- (20MHz for video progressive)

-----------------------------------
-- Video scanner  640x512 @20Mhz --
--                640x256 @10Mhz --
-- display 512x448               --
-----------------------------------
process (reset, clock_vid)
begin
	if reset='1' then
		hcnt  <= (others=>'0');
		vcnt  <= (others=>'0');
		top_frame <= '0';
	else 
		if rising_edge(clock_vid) then
			if pix_ena = '1' then
		
				hcnt <= hcnt + 1;
				if hcnt = 639 then
					hcnt <= (others=>'0');
					vcnt <= vcnt + 1;
--					if (vcnt = 511 and tv15Khz_mode = '0') or (vcnt = 255 and tv15Khz_mode = '1') then
					if (vcnt = 525 and tv15Khz_mode = '0') or (vcnt = 262 and tv15Khz_mode = '1') then -- extension to classic video standard
						vcnt <= (others=>'0');
						top_frame <= not top_frame;
					end if;
				end if;
			
				if tv15Khz_mode = '0' then 
					--	progessive mode
				
					-- tune 31kHz vertical screen position here
					if vcnt = 490+8 then video_vs <= '0'; end if; -- front porch 10
					if vcnt = 492+8 then video_vs <= '1'; end if; -- sync pulse   2
																				 -- back porch  33 
					-- tune 31kHz horizontal screen position here	
					if hcnt = 512+13+12 then video_hs <= '0'; end if; -- front porch 16/25*20 = 13
					if hcnt = 512+90+12 then video_hs <= '1'; end if; -- sync pulse  96/25*20 = 77
																				       -- back porch  48/25*20 = 38
					video_blankn <= '0';
					if hcnt >= 2+16 and  hcnt < 514+16-1 and
						vcnt >= 32 and  vcnt < 480 then video_blankn <= '1';end if;
				
				else -- interlaced mode
				 
				if hcnt = 530+18 then            -- tune 15KHz horizontal screen position here
					hs_cnt <= (others => '0');
					if (vcnt = 248) then          -- tune 15KHz vertical screen position here
						vs_cnt <= (others => '0');
					else
						vs_cnt <= vs_cnt +1;
					end if;
					
					if vcnt = 260 then video_vs <= '0'; end if;
					if vcnt = 262 then video_vs <= '1'; end if;

				else 
					hs_cnt <= hs_cnt + 1;
				end if;
				
				video_blankn <= '0';				
				if hcnt >= 2+16 and  hcnt < 514+16-1 and
					vcnt >= 16   and  vcnt < 240 then video_blankn <= '1';end if;
				
				if    hs_cnt =  0 then hsync0 <= '0';
				elsif hs_cnt = 47 then hsync0 <= '1';
				end if;

				if    hs_cnt =      0  then hsync1 <= '0';
				elsif hs_cnt =     23  then hsync1 <= '1';
				elsif hs_cnt = 320+ 0  then hsync1 <= '0';
				elsif hs_cnt = 320+23  then hsync1 <= '1';
				end if;
		
				if    hs_cnt =      0  then hsync2 <= '0';
				elsif hs_cnt = 320-47  then hsync2 <= '1';
				elsif hs_cnt = 320     then hsync2 <= '0';
				elsif hs_cnt = 640-47  then hsync2 <= '1';
				end if;

				
				if    hs_cnt =      0  then hsync3 <= '0';
				elsif hs_cnt =     23  then hsync3 <= '1';
				elsif hs_cnt = 320     then hsync3 <= '0';
				elsif hs_cnt = 640-47  then hsync3 <= '1';
				end if;

				if    hs_cnt =      0  then hsync4 <= '0';
				elsif hs_cnt = 320-47  then hsync4 <= '1';
				elsif hs_cnt = 320     then hsync4 <= '0';
				elsif hs_cnt = 320+23  then hsync4 <= '1';
				end if;
				
				
				if     vs_cnt =  1 then video_csync <= hsync1;
				elsif  vs_cnt =  2 then video_csync <= hsync1;
				elsif  vs_cnt =  3 then video_csync <= hsync1;
				elsif  vs_cnt =  4 and top_frame = '1' then video_csync <= hsync3;
				elsif  vs_cnt =  4 and top_frame = '0' then video_csync <= hsync1;
				elsif  vs_cnt =  5 then video_csync <= hsync2;
				elsif  vs_cnt =  6 then video_csync <= hsync2;
				elsif  vs_cnt =  7 and  top_frame = '1' then video_csync <= hsync4;
				elsif  vs_cnt =  7 and  top_frame = '0' then video_csync <= hsync2;
				elsif  vs_cnt =  8 then video_csync <= hsync1;
				elsif  vs_cnt =  9 then video_csync <= hsync1;
				elsif  vs_cnt = 10 then video_csync <= hsync1;
				elsif  vs_cnt = 11 then video_csync <= hsync0;
				else                    video_csync <= hsync0;
				end if;				
				
				end if;

			end if;
		end if;
	end if;
end process;

--------------------
-- players inputs --
--------------------
input_0 <= fire12 & "00" & fire11 & down1 & up1 & left1 & right1;
input_1 <= fire22 & "00" & fire21 & down2 & up2 & left2 & right2;
input_2 <= coin1 & service & coin2 & '0' & start2 & start1 & "00";

------------------------------------------
-- cpu data input with address decoding --
------------------------------------------
cpu_rom_addr <= (cpu_addr(14 downto 10) & cpu_addr(8 downto 7) & cpu_addr(0) & cpu_addr(1) & cpu_addr(2) & cpu_addr(4) & cpu_addr(5) & cpu_addr(9) & cpu_addr(3) & cpu_addr(6)) xor ("000" & x"0FC");
	
	cpu_rom_do_swp <=
	cpu_rom_do(3) & cpu_rom_do(4) & cpu_rom_do(2) & cpu_rom_do(5) &
	cpu_rom_do(1) & cpu_rom_do(6) & cpu_rom_do(0) & cpu_rom_do(7);
	
	protection_do <=
	(protection_data1(7 downto 0)      ) or ( "00000000"                               )  when protection_shift = "000" else
	(protection_data1(6 downto 0) & '0' ) or ( "0000000" & protection_data0(7 downto 7))  when protection_shift = "001" else
	(protection_data1(5 downto 0) & "00" ) or ( "000000" & protection_data0(7 downto 6))  when protection_shift = "010" else
	(protection_data1(4 downto 0) & "000" ) or ( "00000" & protection_data0(7 downto 5))  when protection_shift = "011" else
	(protection_data1(3 downto 0) & "0000" ) or ( "0000" & protection_data0(7 downto 4))  when protection_shift = "100" else
	(protection_data1(2 downto 0) & "00000" ) or ( "000" & protection_data0(7 downto 3))  when protection_shift = "101" else
	(protection_data1(1 downto 0) & "000000" ) or ( "00" & protection_data0(7 downto 2))  when protection_shift = "110" else
	(protection_data1(0 downto 0) & "0000000" ) or ( '0' & protection_data0(7 downto 1)); --   protection_shift = "111"
	
cpu_di <= cpu_rom_do_swp    when cpu_mreq_n = '0' and cpu_addr(15 downto 12) < X"7" else    -- program rom 0000-6FFF |32Ko
          X"FF"             when cpu_mreq_n = '0' and cpu_addr(15 downto 12) < X"8" else    -- no rom      7000-7FFF |
          wram_do_r         when cpu_mreq_n = '0' and (cpu_addr and X"F800") = x"8000" else -- work    ram 8000-87FF  2Ko
          wram_do_r         when cpu_mreq_n = '0' and (cpu_addr and X"FC00") = x"8C00" else -- work    ram 8C00-8FFF  1Ko
			 protection_do     when cpu_mreq_n = '0' and (cpu_addr and X"FFFF") = x"E000" else -- protection E000
			 X"00"             when cpu_mreq_n = '0' and (cpu_addr and X"FFFF") = x"E001" else -- protection E001
   		 input_0           when cpu_ioreq_n = '0' and (cpu_addr(1 downto 0) = "00") else
   		 input_1           when cpu_ioreq_n = '0' and (cpu_addr(1 downto 0) = "01") else
   		 input_2           when cpu_ioreq_n = '0' and (cpu_addr(1 downto 0) = "10") else
   		 ay_do             when cpu_ioreq_n = '0' and (cpu_addr(1 downto 0) = "11") else
   		 X"00"; 
			 
--
------------------------------------------
-- write enable / ram access from CPU --
------------------------------------------
wram_addr <= cpu_addr(11 downto 0) when hcnt(0) = '0' else "11" & sp_ram_addr(9 downto 0);

wram_we         <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and (cpu_addr and x"F000") = x"8000" and hcnt(0) = '0' else '0';
ch_ram_txt_we   <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and (cpu_addr and x"EC00") = x"A000" and hcnt(0) = '0' else '0';
ch_ram_color_we <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and (cpu_addr and x"EC00") = x"A400" and hcnt(0) = '0' else '0';
bg_ram_we       <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and (cpu_addr and x"F000") = x"C000" and hcnt(0) = '0' else '0';
-----------------------------------------------------
-- Transfer sprite data from wram to sprite ram 
-- once per frame. Read sprite ram on every scanline.
-----------------------------------------------------
sp_ram1_we   <= hcnt(0) when move_buf = '1' and sp_ram_addr(1 downto 0) = "00" else '0';
sp_ram2_we   <= hcnt(0) when move_buf = '1' and sp_ram_addr(1 downto 0) = "01" else '0';
sp_ram3_we   <= hcnt(0) when move_buf = '1' and sp_ram_addr(1 downto 0) = "10" else '0';
sp_ram4_we   <= hcnt(0) when move_buf = '1' and sp_ram_addr(1 downto 0) = "11" else '0';

process (clock_vid)
begin
	if rising_edge(clock_vid) then
	
		if hcnt(0) = '0' then wram_do_r <= wram_do; end if;
	
		if move_buf = '0' and read_buf ='0' then 
			sp_ram_addr <= "00" & X"04";
			if hcnt = 1 and pix_ena = '1' then
				if (vcnt = 500 and tv15Khz_mode = '0') or	(vcnt = 250 and tv15Khz_mode = '1') then
					move_buf <= '1';
				else 
					read_buf <= '1';
				end if;
			end if;			
		end if;
		
		if move_buf = '1' and pix_ena = '1' and hcnt(0) = '1' then
			if sp_ram_addr >= 640 then 
				move_buf <= '0';
			else 
				sp_ram_addr <= sp_ram_addr + 1;
			end if;	
		end if;

		if read_buf = '1' and pix_ena = '1' and hcnt(0) = '1' then
			if sp_ram_addr >= 640 then 
				read_buf <= '0';
			else 
				sp_ram_addr <= sp_ram_addr + 4;
			end if;	
		end if;
		
	end if;
end process;

------------------------------------------------------------------------
-- Misc registers : write enable / interrupt / ay-3-8910 IF
------------------------------------------------------------------------

process (clock_vid)
begin
	if rising_edge(clock_vid) then
		cpu_wr_n_r <= cpu_wr_n;
		cpu_rfsh_n_r <= cpu_rfsh_n;
		if cpu_mreq_n = '0' and cpu_wr_n = '0' then 
			if (cpu_addr = x"8C00") then hoffset(7 downto 0) <= cpu_do; end if;
			if (cpu_addr = x"8C01") then voffset <= cpu_do; end if;
			if (cpu_addr = x"8C02") then hoffset(8) <= cpu_do(0); end if;
         if (cpu_addr = x"8C03") then
				sp_palette_addr(7 downto 5) <= cpu_do(2 downto 0);
				bg_palette_addr(4) <= cpu_do(3);
         end if;			
			if (cpu_addr = x"E000") then protection_shift <= cpu_do(2 downto 0); end if;
			if (cpu_addr = x"E001") and cpu_wr_n_r = '1' then
				protection_data0 <= protection_data1;
				protection_data1 <= cpu_do;
			end if;	
		end if;	
-- during rsfh cpu_addr(15 downto 8) contains cpu register I
-- lsb used to enable/disable nmi signal
      if cpu_rfsh_n = '0' and cpu_rfsh_n_r = '0' then
         nmi_enable <= cpu_addr(8);
      end if;
-- trick to prevent nmi to occur during call 2f93 @3043
-- otherwise game crash
-- maybe not needed when nb scanline = 511 (31kHz) or 255 (15kHz)
      if (cpu_addr = x"3043") and cpu_m1_n = '0' then
			no_nmi <= '1';
      end if;
		if (cpu_addr = x"3046") and cpu_m1_n = '0' then
         no_nmi <= '0';
      end if;
	end if;
end process;

cpu_nmi_n <= '0' when nmi_enable = '1' and no_nmi = '0' and hcnt < 20 and
                                          ((vcnt = 260 and tv15Khz_mode = '1') or (vcnt = 490 and tv15Khz_mode = '0')) else '1';

audio_out <= ay_audio & X"00";
-- 
-- bdir bc1 (bc2 = 1)
--  0    0 : Inactive
--  0    1 : Read
--  1    0 : Write
--  1    1 : Address

ay_bdir <= '1' when cpu_ioreq_n = '0' and  cpu_wr_n = '0' else '0';
ay_bc1  <= '1' when cpu_ioreq_n = '0' and (cpu_rd_n = '0' or (cpu_wr_n = '0' and cpu_addr(0) = '0')) else '0';

ay_ioa_di <= not sw2(to_integer(unsigned(ay_iob_do(3 downto 1)))) & not sw1;
------------------------------------
---------- sprite machine ----------
------------------------------------
hflip <= hcnt;       -- do not apply mirror horizontal flip
vflip <= vcnt(8 downto 0) & not top_frame when tv15Khz_mode = '1' else vcnt; -- do not apply mirror flip

sp_buffer_sel <= vflip(1) when tv15Khz_mode = '1' else vflip(0);

sp_vcnt <= vflip + (sp_ram2_do & '0') - 14 when tv15Khz_mode = '1' else -- tune v sprite position for 15KHz (interlaced)
			  vflip + (sp_ram2_do & '0') - 15;                             -- tune v sprite position for 31KHz (progressive)

sp_on_line <= '1' when (sp_vcnt(8 downto 4) = (x"F"&'1')) and (read_buf = '1') else '0';

-- feed and read line buffers
						
sp_buffer_ram1_di   <= sp_ram4_do(4 downto 0) & sp_ram1_do(1 downto 0) & sp_ram3_do & sp_vcnt(3 downto 1) when sp_buffer_sel = '1' else "00"&x"0000";
sp_buffer_ram1_addr <= sp_ram1_do(7 downto 2)                                                             when sp_buffer_sel = '1' else hflip(8 downto 3);
sp_buffer_ram1_we   <= pix_ena and hcnt(0) and sp_on_line                                                 when sp_buffer_sel = '1' else pix_ena and hcnt(2) and hcnt(1) and hcnt(0);

sp_buffer_ram2_di   <= sp_ram4_do(4 downto 0) & sp_ram1_do(1 downto 0) & sp_ram3_do & sp_vcnt(3 downto 1) when sp_buffer_sel = '0' else "00"&x"0000";
sp_buffer_ram2_addr <= sp_ram1_do(7 downto 2)                                                             when sp_buffer_sel = '0' else hflip(8 downto 3);
sp_buffer_ram2_we   <= pix_ena and hcnt(0) and sp_on_line                                                 when sp_buffer_sel = '0' else pix_ena and hcnt(2) and hcnt(1) and hcnt(0);

sp_code_line0 <= 
 (sp_buffer_ram1_do(15) & sp_buffer_ram1_do(17) & sp_buffer_ram1_do(9 downto 0) & sp_vcnt(0)) xor ('0' & x"00F") when sp_buffer_sel = '0' and sp_buffer_ram1_do(16) = '1' else
 (sp_buffer_ram1_do(15) & sp_buffer_ram1_do(17) & sp_buffer_ram1_do(9 downto 0) & sp_vcnt(0)) xor ('0' & x"000") when sp_buffer_sel = '0' and sp_buffer_ram1_do(16) = '0' else
 (sp_buffer_ram2_do(15) & sp_buffer_ram2_do(17) & sp_buffer_ram2_do(9 downto 0) & sp_vcnt(0)) xor ('0' & x"00F") when sp_buffer_sel = '1' and sp_buffer_ram2_do(16) = '1' else
 (sp_buffer_ram2_do(15) & sp_buffer_ram2_do(17) & sp_buffer_ram2_do(9 downto 0) & sp_vcnt(0)) xor ('0' & x"000");
				  
sp_code_line <= sp_code_line0 xor ('1' & x"FFF") when tv15Khz_mode = '1' else -- ok for 15 KHz
                sp_code_line0 xor ('1' & x"FFE");                             -- ok for 31 KHz
sp_hflip     <= sp_buffer_ram1_do(10)           when sp_buffer_sel = '0' else sp_buffer_ram2_do(10);
sp_hoffset   <= sp_buffer_ram1_do(12 downto 11) when sp_buffer_sel = '0' else sp_buffer_ram2_do(12 downto 11);
sp_color     <= sp_buffer_ram1_do(15 downto 13) when sp_buffer_sel = '0' else sp_buffer_ram2_do(15 downto 13);

process (clock_vid)
begin
	if rising_edge(clock_vid) then
			
		if pix_ena = '1' then 
		
			if hcnt(2 downto 0) = "111"  then 
		
				sp_graphx0 <= sp_graphx1_do & sp_graphx2_do;
				sp_graphx1 <= sp_graphx3_do & sp_graphx4_do;
				sp_color_r <= sp_color;
				sp_hflip_r <= sp_hflip;
					
				if sp_color = "000" then 
					sp_hcnt <= "01" & not sp_hoffset;
				else
					sp_hcnt <= "11" & not sp_hoffset;			
				end if;
			
			else		
				if hcnt(0)='1' then sp_hcnt <= sp_hcnt + 1; end if;			
			end if;
		
			if hcnt(0) = '0' and sp_hcnt = x"F" then 
				sp_graphx_sr0 <= sp_graphx0;
				sp_graphx_sr1 <= sp_graphx1;
				sp_color_rr   <= sp_color_r;
				sp_hflip_rr   <= sp_hflip_r;
			else
				if sp_hflip_rr = '0' then 
					sp_graphx_sr0 <= '0' & sp_graphx_sr0(15 downto 1);
					sp_graphx_sr1 <= '0' & sp_graphx_sr1(15 downto 1);
				else
					sp_graphx_sr0 <= sp_graphx_sr0(14 downto 0) & '0';
					sp_graphx_sr1 <= sp_graphx_sr1(14 downto 0) & '0';
				end if;
			end if;
							
		end if;
	end if;
end process;

sp_palette_addr(1 downto 0) <= sp_graphx_sr0(0) & sp_graphx_sr1(0) when sp_hflip_rr = '0' else sp_graphx_sr0(15) & sp_graphx_sr1(15);
sp_palette_addr(4 downto 2) <= sp_color_rr;

----------------------------
------- char machine -------
----------------------------
ch_ram_addr <= cpu_addr(9 downto 0) when hcnt(0) = '0' else vflip(8 downto 4) & hflip(8 downto 4);

ch_code_line <= '1' & ch_code & vflip(3 downto 1);

process (clock_vid)
begin
	if rising_edge(clock_vid) then
	
		if pix_ena = '1' then
		
			if hcnt(0) = '1' then
				if hcnt(3 downto 1) = "111" then
					ch_code <= ch_ram_txt_do;
					ch_color <= ch_ram_color_do(3) & ch_ram_color_do;
				end if;
			end if;	
			
			ch_palette_addr <= ch_color;
			ch_vid <= ch_graphx_do(to_integer(unsigned(hflip(3 downto 1))));
			
		end if;

	end if;
end process;


----------------------------
---- background machine ----
----------------------------
--bg_ram_addr <= cpu_addr(11 downto 0) when hcnt(0) = '0' else vshift(7 downto 2) & hshift(8 downto 3);
bg_ram_addr <= cpu_addr(11 downto 6) & cpu_do(7) & cpu_addr(5 downto 0) when hcnt(0) = '0' else vshift(8 downto 3) & hshift(9 downto 3);

process (clock_vid)
begin
	if rising_edge(clock_vid) then

		if pix_ena = '1' then
		
			if hcnt = 540 then -- tune background h pos w.r.t char (use odd value to keep hshift(0) = hcnt(0))
				hshift <= hoffset & '0';
			else
				hshift <= hshift + 1 ;
			end if;		
			if hcnt = 540 then 
				if tv15Khz_mode = '0' then
					vshift <= ('0' & voffset & '0') + vflip + ("00" & x"01"); -- tune background v pos w.r.t char
				else
               vshift <= ('0' & voffset & '0') + vflip + ("00" & x"02"); -- tune background v pos w.r.t char
            end if;
          end if;
			 if hcnt(0) = '1' then
				if hcnt(1) = '1' then
					if vshift(9) = '1' then
                  bg_color <= bg_ram_do;
               else
                  bg_color <= (others => '0');
					end if;	
				end if;
			end if;	
			bg_palette_addr(3 downto 0) <= bg_color;
		end if;
	end if;
end process;
	
---------------------------
-- mux char/sprite video --
---------------------------
process (clock_vid)
begin
	if rising_edge(clock_vid) then
	
		if voffset = x"00" then	
			video_r <= "000";
			video_g <= "000";
			video_b <= "00";
		else
			video_r <= not bg_palette_do(2 downto 0);
			video_g <= not bg_palette_do(5 downto 3);
			video_b <= not bg_palette_do(7 downto 6);
		end if;

		if sp_palette_addr(1 downto 0) /= "00" then
			video_r <= not (sp_palette_rg_do(2 downto 0));
			video_g <= not (sp_palette_gb_do(1 downto 0) & sp_palette_rg_do(3));
			video_b <= not (sp_palette_gb_do(3 downto 2));
		end if;
				
		if ch_vid = '1' then
			video_r <= not ch_palette_do(2 downto 0);
			video_g <= not ch_palette_do(5 downto 3);
			video_b <= not ch_palette_do(7 downto 6);
		end if;
		
	end if;
end process;		
		
------------------------------
-- components & sound board --
------------------------------

-- microprocessor Z80
cpu : entity work.T80se
generic map(Mode => 0, T2Write => 1, IOWait => 1)
port map(
  RESET_n => reset_n,
  CLK_n   => clock_vid,
  CLKEN   => cpu_ena,
  WAIT_n  => '1',
  INT_n   => '1', -- cpu_irq_n,
  NMI_n   => cpu_nmi_n,
  BUSRQ_n => '1',
  M1_n    => cpu_m1_n,
  MREQ_n  => cpu_mreq_n,
  IORQ_n  => cpu_ioreq_n,
  RD_n    => cpu_rd_n,
  WR_n    => cpu_wr_n,
  RFSH_n  => cpu_rfsh_n,
  HALT_n  => open,
  BUSAK_n => open,
  A       => cpu_addr,
  DI      => cpu_di,
  DO      => cpu_do
);

-- cpu program ROM 0x0000-0xDFFF
--rom_cpu : entity work.popeye_cpu
--port map(
-- clk  => clock_vidn,
-- addr => cpu_rom_addr,
-- data => cpu_rom_do
--);

-- working RAM   8000-87FF/8800-8FFF  2Ko
wram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk  => clock_vidn,
 we   => wram_we,
 addr => wram_addr,
 d    => cpu_do,
 q    => wram_do
);

-- char RAM (text)  A000-A3FF  1Ko + mirroring 1000
char_ram_txt : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_vidn,
 we   => ch_ram_txt_we,
 addr => ch_ram_addr,
 d    => cpu_do,
 q    => ch_ram_txt_do
);

-- char RAM (color)  A400-A7FF  1Ko + mirroring 1000
char_ram_color : entity work.gen_ram
generic map( dWidth => 4, aWidth => 10)
port map(
 clk  => clock_vidn,
 we   => ch_ram_color_we,
 addr => ch_ram_addr,
 d    => cpu_do(3 downto 0),
 q    => ch_ram_color_do
);

-- video RAM   C000-CFFF  4K x 4bits 
video_ram : entity work.gen_ram
generic map( dWidth => 4, aWidth => 13)
port map(
 clk  => clock_vidn,
 we   => bg_ram_we,
 addr => bg_ram_addr,
 d    => cpu_do(3 downto 0),
 q    => bg_ram_do
);

-- sprite RAMs (no cpu access)
sprite_ram1 : entity work.gen_ram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_vidn,
 we   => sp_ram1_we,
 addr => sp_ram_addr(9 downto 2),
 d    => wram_do,
-- d    => dbg_wram_do,
 q    => sp_ram1_do
);

sprite_ram2 : entity work.gen_ram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_vidn,
 we   => sp_ram2_we,
 addr => sp_ram_addr(9 downto 2),
 d    => wram_do,
-- d    => dbg_wram_do,
 q    => sp_ram2_do
);

sprite_ram3 : entity work.gen_ram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_vidn,
 we   => sp_ram3_we,
 addr => sp_ram_addr(9 downto 2),
 d    => wram_do,
-- d    => dbg_wram_do,
 q    => sp_ram3_do
);

sprite_ram4 : entity work.gen_ram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_vidn,
 we   => sp_ram4_we,
 addr => sp_ram_addr(9 downto 2),
 d    => wram_do,
-- d    => dbg_wram_do,
 q    => sp_ram4_do
);

-- sprite line buffer 1
sprlinebuf1a : entity work.gen_ram
generic map( dWidth => 18, aWidth => 6)
port map(
 clk  => clock_vidn,
 we   => sp_buffer_ram1_we,
 addr => sp_buffer_ram1_addr,
 d    => sp_buffer_ram1_di,
 q    => sp_buffer_ram1_do
);

-- sprite line buffer 2
sprlinebuf2 : entity work.gen_ram
generic map( dWidth => 18, aWidth => 6)
port map(
 clk  => clock_vidn,
 we   => sp_buffer_ram2_we,
 addr => sp_buffer_ram2_addr,
 d    => sp_buffer_ram2_di,
 q    => sp_buffer_ram2_do
);

-- char graphics ROM 5N
ch_graphics : entity work.skyskip_ch_bits
port map(
 clk  => clock_vidn,
 addr => ch_code_line(10 downto 0),
 data => ch_graphx_do
);

-- sprite graphics ROM 1E
sprite_graphics1 : entity work.skyskip_sp_bits_1
port map(
 clk  => clock_vidn,
 addr => sp_code_line(11 downto 0), 
 data => sp_graphx1_do
);

-- sprite graphics ROM 1F
sprite_graphics2 : entity work.skyskip_sp_bits_2
port map(
 clk  => clock_vidn,
 addr => sp_code_line(11 downto 0), 
 data => sp_graphx2_do
);

-- sprite graphics ROM 1J
sprite_graphics3 : entity work.skyskip_sp_bits_3
port map(
 clk  => clock_vidn,
 addr => sp_code_line(11 downto 0), 
 data => sp_graphx3_do
);

-- sprite graphics ROM 1k
sprite_graphics4 : entity work.skyskip_sp_bits_4
port map(
 clk  => clock_vidn,
 addr => sp_code_line(11 downto 0), 
 data => sp_graphx4_do
);

-- char palette
ch_palette : entity work.skyskip_ch_palette_rgb
port map(
 clk  => clock_vidn,
 addr => ch_palette_addr,
 data => ch_palette_do
);
 
-- background palette
bg_palette : entity work.skyskip_bg_palette_rgb
port map(
 clk  => clock_vidn,
 addr => bg_palette_addr,
 data => bg_palette_do
);

-- sprites palettes
sp_palette_rg : entity work.skyskip_palette_rg
port map(
 clk  => clock_vidn,
 addr => sp_palette_addr,
 data => sp_palette_rg_do
);

sp_palette_gb : entity work.skyskip_palette_gb
port map(
 clk  => clock_vidn,
 addr => sp_palette_addr,
 data => sp_palette_gb_do
);

ym2149 : entity work.ym2149
port map (
-- data bus
	I_DA            => cpu_do,       --: in  std_logic_vector(7 downto 0);
	O_DA            => ay_do,        --: out std_logic_vector(7 downto 0);
	O_DA_OE_L       => open,         --: out std_logic;
-- control
	I_A9_L          => '0',          --: in  std_logic;
	I_A8            => '1',          --: in  std_logic;
	I_BDIR          => ay_bdir,      --: in  std_logic;
	I_BC2           => '1',          --: in  std_logic;
	I_BC1           => ay_bc1,       --: in  std_logic;
	I_SEL_L         => '1',          --: in  std_logic;
-- audio
	O_AUDIO         => ay_audio,     --: out std_logic_vector(7 downto 0);
-- port a
	I_IOA           => ay_ioa_di,    --: in  std_logic_vector(7 downto 0);
	O_IOA           => open,         --: out std_logic_vector(7 downto 0);
	O_IOA_OE_L      => open,         --: out std_logic;
-- port b
	I_IOB           => "11111111",   --: in  std_logic_vector(7 downto 0);
	O_IOB           => ay_iob_do,    --: out std_logic_vector(7 downto 0);
	O_IOB_OE_L      => open,         --: out std_logic;

	ENA             => ay_ena,       --: in  std_logic; -- clock enable for higher speed operation
	RESET_L         => '1',          --: in  std_logic;
	CLK             => clock_vid     --: in  std_logic  -- note 6 Mhz!
);

end;
