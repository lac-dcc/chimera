---------------------------------------------------------------------------------
-- Congo Bongo by Dar (darfpga@aol.fr) (12/11/2022)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
--
-- release rev 00 : initial release
--  (12/11/2022)
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
-- Synthesizable model of TI's SN76489AN
-- Copyright (c) 2005, 2006, Arnim Laeuger (arnim.laeuger@gmx.net)
---------------------------------------------------------------------------------
--
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------

--  Features :
--   Video        : TV 15kHz
--   Coctail mode : Yes
--   Sound        : OK

--  Use with MAME roms from congo.zip
--
--  Use make_congo_proms.bat to build vhd file from binaries
--  (CRC list included)

--  Congo Bongo (Gremlin/SEGA) : Congo Bongo is mainly identical to Zaxxon except
--  those :
--      
--    Use a DMA to transfert sprite data from wram to sprite ram
--	   Use a color ram instead of color rom
--    CPU has more rom
--    Map data is half size 
--    Sprite graphics is twice size
--    Registers/Inputs use mostly different addresses
--    Sound board uses analog circuit + 2xSN76486
--
--  See Zaxxon.vhd for more details 
--
---------------------------------------------------------------------------------
--     Global screen flip is fully managed at hardware level. This allow to 
--     easily add an external flip screen feature.
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity congo_bongo is
port(
 clock_24       : in std_logic;
 reset          : in std_logic;
 pause          : in std_logic;
-- tv15Khz_mode   : in std_logic;
 video_r        : out std_logic_vector(2 downto 0);
 video_g        : out std_logic_vector(2 downto 0);
 video_b        : out std_logic_vector(1 downto 0);
 video_clk      : out std_logic;
 video_csync    : out std_logic;
 video_hblank   : out std_logic;
 video_vblank   : out std_logic;
 video_hs       : out std_logic;
 video_vs       : out std_logic;
 video_ce       : out std_logic;
 
 audio_out_l    : out std_logic_vector(15 downto 0);
 audio_out_r    : out std_logic_vector(15 downto 0);
  
 coin1          : in std_logic;
 coin2          : in std_logic;
 start1         : in std_logic; 
 start2         : in std_logic; 
 
 left           : in std_logic; 
 right          : in std_logic; 
 up             : in std_logic;
 down           : in std_logic;
 fire           : in std_logic;
 
 left_c         : in std_logic; 
 right_c        : in std_logic; 
 up_c           : in std_logic;
 down_c         : in std_logic;
 fire_c         : in std_logic;

 sw1_input      : in  std_logic_vector( 7 downto 0);
 sw2_input      : in  std_logic_vector( 7 downto 0);
 
 service        : in std_logic;
 flip_screen    : in std_logic;

 cpu_rom_addr   : out std_logic_vector(14 downto 0);
 cpu_rom_do     : in std_logic_vector(7 downto 0);
 bg_graphics_addr : out std_logic_vector(12 downto 0);
 bg_graphics_do : in std_logic_vector(31 downto 0);
 sp_graphics_addr : out std_logic_vector(13 downto 0);
 sp_graphics_do : in std_logic_vector(31 downto 0);

 dl_addr        : in  std_logic_vector(17 downto 0);
 dl_wr          : in  std_logic;
 dl_data        : in  std_logic_vector( 7 downto 0); 
  
 dbg_cpu_addr : out std_logic_vector(15 downto 0)
 );
end congo_bongo;

architecture struct of congo_bongo is

 signal reset_n   : std_logic;
 signal clock_vid : std_logic;
 signal clock_vidn: std_logic;
 signal clock_cnt : std_logic_vector(3 downto 0) := "0000";

 signal hcnt    : std_logic_vector(8 downto 0) := (others=>'0'); -- horizontal counter
 signal vcnt    : std_logic_vector(8 downto 0) := (others=>'0'); -- vertical counter
 signal hflip   : std_logic_vector(8 downto 0) := (others=>'0'); -- horizontal counter flip
 signal vflip   : std_logic_vector(8 downto 0) := (others=>'0'); -- vertical counter flip

 signal hs_cnt, vs_cnt :std_logic_vector(9 downto 0) ;
 signal hsync0, hsync1, hsync2, hsync3, hsync4 : std_logic;
 signal top_frame : std_logic := '0';
 
 signal pix_ena     : std_logic;
 signal cpu_ena     : std_logic;

 signal cpu_addr    : std_logic_vector(15 downto 0);
 signal cpu_di      : std_logic_vector( 7 downto 0);
 signal cpu_do      : std_logic_vector( 7 downto 0);
 signal cpu_wr_n    : std_logic;
-- signal cpu_rd_n    : std_logic;
 signal cpu_mreq_n  : std_logic;
-- signal cpu_ioreq_n : std_logic;
 signal cpu_irq_n   : std_logic;
 signal cpu_m1_n    : std_logic;
  
-- signal cpu_rom_do : std_logic_vector(7 downto 0);
  
 signal wram_addr  : std_logic_vector(11 downto 0);
 signal wram_we    : std_logic;
 signal wram_do    : std_logic_vector(7 downto 0);
 signal wram_do_to_cpu: std_logic_vector(7 downto 0); -- registred ram data for cpu

 signal dma_src_addr : std_logic_vector(11 downto 0);
 signal dma_dst_addr : std_logic_vector( 7 downto 0);
 signal dma_started  : std_logic;
 signal dma_cnt      : std_logic_vector( 7 downto 0);
 signal dma_step     : std_logic_vector( 3 downto 0);
 
 signal ch_ram_addr: std_logic_vector(9 downto 0);
 signal ch_ram_we  : std_logic;
 signal ch_ram_do  : std_logic_vector(7 downto 0);
 signal ch_ram_do_to_cpu: std_logic_vector(7 downto 0); -- registred ram data for cpu

 signal color_ram_we  : std_logic;
 signal color_ram_do  : std_logic_vector(7 downto 0);

 signal ch_code         : std_logic_vector(7 downto 0); 
 signal ch_color        : std_logic_vector(3 downto 0); 
 signal ch_color_r      : std_logic_vector(3 downto 0); 
 
 signal ch_code_line_1  : std_logic_vector(11 downto 0);
 signal ch_code_line_2  : std_logic_vector(11 downto 0);
 signal ch_bit_nb       : integer range 0 to 7;
 signal ch_graphx1_do   : std_logic_vector( 7 downto 0);
 signal ch_graphx1_do_r : std_logic_vector( 7 downto 0);
 signal ch_graphx2_do   : std_logic_vector( 7 downto 0);
 signal ch_graphx2_do_r : std_logic_vector( 7 downto 0);
 signal ch_vid          : std_logic_vector( 1 downto 0);
 
 signal palette_addr    : std_logic_vector(7 downto 0);
 signal palette_do      : std_logic_vector(7 downto 0);
 
 signal map_offset_h     : std_logic_vector(11 downto 0);
 signal map_offset_l1    : std_logic_vector( 7 downto 0); 
 signal map_offset_l2    : std_logic_vector( 7 downto 0); 
 
 signal map_addr         : std_logic_vector(12 downto 0);
 signal map1_do          : std_logic_vector( 7 downto 0);
 signal map2_do          : std_logic_vector( 7 downto 0);
 
-- signal bg_graphics_addr : std_logic_vector(12 downto 0);
 signal bg_graphics1_do  : std_logic_vector( 7 downto 0);
 signal bg_graphics2_do  : std_logic_vector( 7 downto 0);
 signal bg_graphics3_do  : std_logic_vector( 7 downto 0);
 signal bg_graphics1_do_r: std_logic_vector( 7 downto 0);
 signal bg_graphics2_do_r: std_logic_vector( 7 downto 0);
 signal bg_graphics3_do_r: std_logic_vector( 7 downto 0);
 signal bg_bit_nb        : integer range 0 to 7;
 signal bg_color_a       : std_logic_vector(3 downto 0);
 signal bg_color_r       : std_logic_vector(3 downto 0);
 signal bg_color         : std_logic_vector(3 downto 0);
 signal bg_vid           : std_logic_vector(2 downto 0); 
 signal bg_vid_r         : std_logic_vector(2 downto 0);
 signal bg_code_line     : std_logic_vector(9 downto 0);

 signal dma_do            : std_logic_vector(7 downto 0);
 signal sp_ram_addr       : std_logic_vector(7 downto 0);
 signal sp_ram_we         : std_logic;
 signal sp_ram_do         : std_logic_vector(7 downto 0);
 signal sp_ram_do_to_sp_machine : std_logic_vector(7 downto 0);
 
 signal sp_vcnt     : std_logic_vector(7 downto 0);
 signal sp_on_line  : std_logic;

 signal sp_online_ram_we   : std_logic;
 signal sp_online_ram_addr : std_logic_vector(4 downto 0);
 signal sp_online_ram_di   : std_logic_vector(8 downto 0);
 signal sp_online_ram_do   : std_logic_vector(8 downto 0);
  
 signal vflip_r        : std_logic_vector(8 downto 0);
 signal sp_online_vcnt : std_logic_vector(7 downto 0);
 signal sp_line        : std_logic_vector(7 downto 0); 
 signal sp_code        : std_logic_vector(7 downto 0);
 signal sp_color       : std_logic_vector(7 downto 0);
 signal sp_color_r     : std_logic_vector(4 downto 0);

 signal sp_code_line    : std_logic_vector(13 downto 0);
 signal sp_hflip        : std_logic;
 signal sp_hflip_r      : std_logic;
 signal sp_vflip        : std_logic;
 
-- signal sp_graphics_addr  : std_logic_vector(13 downto 0);
 signal sp_graphics1_do   : std_logic_vector( 7 downto 0); 
 signal sp_graphics2_do   : std_logic_vector( 7 downto 0); 
 signal sp_graphics3_do   : std_logic_vector( 7 downto 0); 

 signal sp_ok              : std_logic;
 signal sp_ok_r            : std_logic;
 signal sp_bit_hpos        : std_logic_vector(7 downto 0);
 signal sp_bit_hpos_r      : std_logic_vector(7 downto 0);
 signal sp_bit_nb          : integer range 0 to 7;

 signal sp_buffer_ram_addr : std_logic_vector(7 downto 0);
 signal sp_buffer_ram_we   : std_logic;
 signal sp_buffer_ram_di   : std_logic_vector(7 downto 0);
 signal sp_buffer_ram_do   : std_logic_vector(7 downto 0);
 signal sp_buffer_ram_do_r : std_logic_vector(7 downto 0);

 signal sp_vid             : std_logic_vector(7 downto 0);
 signal sp_vid_r           : std_logic_vector(7 downto 0);

 signal vblkn, vblkn_r : std_logic;
 signal int_on       : std_logic := '0';
 
 signal flip_cpu     : std_logic := '0';
 signal flip         : std_logic := '0';
 signal ch_color_ref : std_logic := '0'; 
 signal bg_position  : std_logic_vector(10 downto 0) := (others => '0');
 signal bg_color_ref : std_logic := '0';
 signal bg_enable    : std_logic := '0';
 
 signal p1_input  : std_logic_vector(7 downto 0);
 signal p2_input  : std_logic_vector(7 downto 0); 

 signal gen_input : std_logic_vector(7 downto 0);
 
 signal coin1_r, coin1_mem, coin1_ena : std_logic := '0';
 signal coin2_r, coin2_mem, coin2_ena : std_logic := '0';

 signal sound_cmd : std_logic_vector( 7 downto 0);
 signal audio_out : std_logic_vector(15 downto 0);
 
 signal cpu_rom_we : std_logic;
 signal ch_1_rom_we : std_logic;
 signal ch_2_rom_we : std_logic;
 signal bg_1_rom_we : std_logic;
 signal bg_2_rom_we : std_logic;
 signal bg_3_rom_we : std_logic;
 signal sp_1_rom_we : std_logic;
 signal sp_2_rom_we : std_logic;
 signal sp_3_rom_we : std_logic;
 signal map_1_rom_we : std_logic;
 signal map_2_rom_we : std_logic;
 signal palette_rom_we : std_logic;
 
begin

clock_vid  <= clock_24;
clock_vidn <= not clock_24;
reset_n    <= not reset;

-- debug 
--process (reset, clock_vid)
--begin
---- if rising_edge(clock_vid) and cpu_ena ='1' and cpu_mreq_n ='0' then
---- dbg_cpu_addr <=  cpu_addr;
---- if rising_edge(clock_vid) then 
---- dbg_cpu_addr <= sp_buffer_ram_do & sp_graphics1_do;
---- end if;
--end process;

-- make enables clock from clock_vid
process (clock_vid, reset)
begin
	if reset='1' then
		clock_cnt <= (others=>'0');
	else 
		if rising_edge(clock_vid) then
			if clock_cnt = "1111" then  -- divide by 16
				clock_cnt <= (others=>'0');
			else
				clock_cnt <= clock_cnt + 1;
			end if;
		end if;
	end if;   		
end process;
--  _   _   _   _   _   _   _   _   _   _   _ 
--   |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |  clock_vid    24MHz
--      ___     ___     ___     ___     ___
--  ___|   |___|   |___|   |___|   |___|   |__  clock_cnt(0) 12MHz
--          _______         _______         __
--  _______|       |_______|       |_______|    clock_cnt(1)  6MHz
--      ___             ___             ___
--  ___|   |___________|   |___________|   |__  pix_ena       6MHz
--
--  _______ _______________ _______________ __
--  _______|_______________|_______________|__  video
--      ___                             ___
--  ___|   |___________________________|   |__  cpu_ena       3MHz
--
--

pix_ena <= '1' when clock_cnt(1 downto 0) = "01"    else '0'; -- (6MHz)
cpu_ena <= '1' when hcnt(0) = '0' and pix_ena = '1' else '0'; -- (3MHz)

video_ce <= pix_ena;
video_clk <= clock_vid;

---------------------------------------
-- Video scanner  384x264 @6.083 MHz --
-- display 256x224                   --
--                                   --
-- line  : 63.13us -> 15.84kHz       --
-- frame : 16.67ms -> 60.00Hz        --
---------------------------------------

process (reset, clock_vid)
begin
	if reset='1' then
		hcnt  <= (others=>'0');
		vcnt  <= (others=>'0');
		top_frame <= '0';
	else 
		if rising_edge(clock_vid) then
			if pix_ena = '1' then
		
				-- main horizontal / vertical counters
				hcnt <= hcnt + 1;
				if hcnt = 511 then
					hcnt <= std_logic_vector(to_unsigned(128,9));
				end if;	
					
				if hcnt = 128+8+8 then
					vcnt <= vcnt + 1;
					if vcnt = 263 then
						vcnt <= (others=>'0');
						top_frame <= not top_frame;
					end if;
				end if;
				
				-- set syncs position 
				if hcnt = 170 then              -- tune screen H position here
					hs_cnt <= (others => '0');
					if (vcnt = 248) then         -- tune screen V position here
						vs_cnt <= (others => '0');
					else
						vs_cnt <= vs_cnt +1;
					end if;
					
				else 
					hs_cnt <= hs_cnt + 1;
				end if;
			
				if    vs_cnt = 1 then video_vs <= '0';
				elsif vs_cnt = 3 then video_vs <= '1';
				end if;    

				-- blanking
--				video_blankn <= '0';				

--				if (hcnt >= 256+9-5 or hcnt < 128+9-5) and
--					 vcnt >= 17 and  vcnt < 240 then video_blankn <= '1';end if;
--					 	
				if hcnt = 256+9+1 then
					video_hblank <= '0';
				end if;
				if hcnt = 128+9+1 then
					video_hblank <= '1';
				end if;

				if hcnt = 256+9+1 then
					video_vblank <= '1';
					if vcnt >= 16 and vcnt < 240 then
						video_vblank <= '0';
					end if;
				end if;

				-- build syncs pattern (composite)
				if    hs_cnt =  0 then hsync0 <= '0'; video_hs <= '0';
				elsif hs_cnt = 29 then hsync0 <= '1'; video_hs <= '1';
				end if;

				if    hs_cnt =      0  then hsync1 <= '0';
				elsif hs_cnt =     14  then hsync1 <= '1';
				elsif hs_cnt = 192+ 0  then hsync1 <= '0';
				elsif hs_cnt = 192+14  then hsync1 <= '1';
				end if;
		
				if    hs_cnt =      0  then hsync2 <= '0';
				elsif hs_cnt = 192-29  then hsync2 <= '1';
				elsif hs_cnt = 192     then hsync2 <= '0';
				elsif hs_cnt = 384-29  then hsync2 <= '1';
				end if;

				if    hs_cnt =      0  then hsync3 <= '0';
				elsif hs_cnt =     14  then hsync3 <= '1';
				elsif hs_cnt = 192     then hsync3 <= '0';
				elsif hs_cnt = 384-29  then hsync3 <= '1';
				end if;

				if    hs_cnt =      0  then hsync4 <= '0';
				elsif hs_cnt = 192-29  then hsync4 <= '1';
				elsif hs_cnt = 192     then hsync4 <= '0';
				elsif hs_cnt = 192+14  then hsync4 <= '1';
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
end process;

---------------------------------
-- players/dip switches inputs --
---------------------------------
p1_input <= "000" & fire   & down   & up   & left   & right  ;
p2_input <= "000" & fire_c & down_c & up_c & left_c & right_c;
gen_input <= service & coin2_mem & coin1_mem & '0' & start2 & start1 & "00";

------------------------------------------
-- cpu data input with address decoding --
------------------------------------------
cpu_di <= cpu_rom_do       when cpu_mreq_n = '0' and cpu_addr(15 downto 12) < X"8" else -- 0000-7FFF
			 wram_do_to_cpu   when cpu_mreq_n = '0' and cpu_addr(15 downto 12) = x"8" else -- 8000-8FFF
			 ch_ram_do_to_cpu when cpu_mreq_n = '0' and (cpu_addr and x"E000") = x"A000" else -- video/color ram   A000-A7FF + mirroring 1800
			 p1_input         when cpu_mreq_n = '0' and (cpu_addr and x"E03B") = x"C000" else -- player 1  C000 + mirroring 1FC4 
			 p2_input         when cpu_mreq_n = '0' and (cpu_addr and x"E03B") = x"C001" else -- player 2  C001 + mirroring 1FC4 
			 sw1_input        when cpu_mreq_n = '0' and (cpu_addr and x"E03B") = x"C002" else -- switch 1  C002 + mirroring 1FC4 
			 sw2_input        when cpu_mreq_n = '0' and (cpu_addr and x"E03B") = x"C003" else -- switch 2  C003 + mirroring 1FC4 
			 gen_input        when cpu_mreq_n = '0' and (cpu_addr and x"E038") = x"C008" else -- general   C008 + mirroring 1FC7 
   		 X"FF";
	
------------------------------------------------------------------------
-- Coin registers
------------------------------------------------------------------------
process (clock_vid, coin1_ena, coin2_ena)
begin
	if coin1_ena = '0' then
		coin1_mem <= '0';
	else 
		if rising_edge(clock_vid) then	
			coin1_r <= coin1;
			if coin1 = '1' and coin1_r = '0' then coin1_mem <= coin1_ena; end if;			
		end if;
	end if;
	if coin2_ena = '0' then
		coin2_mem <= '0';
	else 
		if rising_edge(clock_vid) then	
			coin2_r <= coin2;
			if coin2 = '1' and coin2_r = '0' then coin2_mem <= coin2_ena; end if;
		end if;
	end if;
end process;	

------------------------------------------------------------------------
-- Misc registers - interrupt set/enable
------------------------------------------------------------------------
vblkn <= '0' when vcnt < 256 else '1';

process (clock_vid)
begin
	if rising_edge(clock_vid) then
	
		vblkn_r <= vblkn; 
	
		if cpu_mreq_n = '0' and cpu_wr_n = '0' then 
			-- U55/U52
			if (cpu_addr and x"E03F") = x"C018" then coin1_ena    <= cpu_do(0); end if; -- C018 + mirroring 1FC0
			if (cpu_addr and x"E03F") = x"C019" then coin2_ena    <= cpu_do(0); end if; -- C019 + mirroring 1FC0
			if (cpu_addr and x"E03F") = x"C01D" then bg_enable    <= cpu_do(0); end if; -- C01D + mirroring 1FC0
			if (cpu_addr and x"E03F") = x"C01E" then flip_cpu     <= cpu_do(0); end if; -- C01E + mirroring 1FC0
			if (cpu_addr and x"E03F") = x"C01F" then int_on       <= cpu_do(0); end if; -- C01F + mirroring 1FC0
			-- U55/U53
			if (cpu_addr and x"E03F") = x"C021" then ch_color_ref <= cpu_do(0); end if; -- C021 + mirroring 1FC0
			if (cpu_addr and x"E03F") = x"C023" then bg_color_ref <= cpu_do(0); end if; -- C023 + mirroring 1FC0
--			if (cpu_addr and x"E03F") = x"C026" then ch_bank      <= cpu_do(0); end if; -- C026 + mirroring 1FC0 N.U. rom5 dump is 4ko only
--			if (cpu_addr and x"E03F") = x"C027" then palette_bank <= cpu_do(0); end if; -- C027 + mirroring 1FC0 N.U. depend on J1 setting

			-- U55/U39 U27,28,30,29
			if (cpu_addr and x"E03B") = x"C028" then bg_position( 7 downto 0) <= not cpu_do   ;          end if; -- C028 + mirroring 1FC4
			if (cpu_addr and x"E03B") = x"C029" then bg_position(10 downto 8) <= not cpu_do(2 downto 0); end if; -- C029 + mirroring 1FC4
			-- U55
			if (cpu_addr and x"E038") = x"C038" then sound_cmd <= cpu_do; end if; -- C038 + mirroring 1FC0
		end if;
		
		-- U41
		if int_on = '0' then 
			cpu_irq_n <= '1';		
		else
			if vblkn_r = '1' and vblkn = '0' then cpu_irq_n <= '0'; end if;
		end if;	
		
	end if;
end process;

------------------------------------------
-- write enable / ram access from CPU   --
-- mux ch_ram and sp ram addresses      --
-- dmux ch_ram and sp_ram data out      -- 
------------------------------------------
wram_we      <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 12 ) = x"8"    and hcnt(0) = '1' else '0'; -- 8000-8FFF
ch_ram_we    <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and (cpu_addr and x"FC00")  = x"A000" and hcnt(0) = '0' else '0'; -- A000-A3FF  
color_ram_we <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and (cpu_addr and x"FC00")  = x"A400" and hcnt(0) = '0' else '0'; -- A400-A7FF

flip <= flip_cpu xor flip_screen;
hflip <= hcnt when flip = '0' else not hcnt;
vflip <= vcnt when flip = '0' else not vcnt;

wram_addr <= cpu_addr(11 downto 0) when hcnt(0) = '1' else dma_src_addr;
ch_ram_addr <= cpu_addr(9 downto 0) when hcnt(0) = '0' else vflip(7 downto 3) & hflip(7 downto 3);
sp_ram_addr <= dma_dst_addr when hcnt(0) = '1' else '0'& hcnt(7 downto 1);

process (clock_vid)
begin
	if rising_edge(clock_vid) then
		if hcnt(0) = '1' then
			wram_do_to_cpu <= wram_do;
		else
			sp_ram_do_to_sp_machine <= sp_ram_do;
			if cpu_addr(10) = '0' then 
				ch_ram_do_to_cpu <= ch_ram_do;
			else
				ch_ram_do_to_cpu <= color_ram_do;
			end if;
		end if;
	end if;
end process;

----------------------
--- sprite machine ---
----------------------
--
------ DMA : transfert sprite data from wram to sp_ram
--
sp_ram_we <= '1' when dma_started = '1' and dma_step > x"1" and hcnt(0) = '1' and pix_ena = '1' else '0';

process (clock_vid)
begin
	if rising_edge(clock_vid) then
	
		if cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_ena = '1' then 
			-- U59 (DMA)
			if (cpu_addr and x"E03B") = x"C030" then dma_src_addr( 7 downto 0) <= cpu_do; end if;             -- C030 + mirroring 1FC4
			if (cpu_addr and x"E03B") = x"C031" then dma_src_addr(11 downto 8) <= cpu_do(3 downto 0); end if; -- C031 + mirroring 1FC4
			if (cpu_addr and x"E03B") = x"C032" then dma_cnt                   <= cpu_do; end if;             -- C032 + mirroring 1FC4
			if (cpu_addr and x"E03B") = x"C033" and cpu_do = x"01" then                                       -- C033 + mirroring 1FC4
				dma_started <= '1';
				dma_step <= x"0";
			end if;         
		end if;
		
		if dma_started = '1' and pix_ena = '1' then
			
			if hcnt(0) = '0' then
			
				dma_do <= wram_do;
				
				if dma_step = x"1" then
					dma_dst_addr <= dma_do(5 downto 0) & "00";
				else
					dma_dst_addr <= dma_dst_addr + 1;				
				end if;
				
				if dma_step = x"5" then
					dma_step <= x"1";
					if dma_cnt = 0 then 
						dma_started <= '0';
					else
						dma_cnt <= dma_cnt - 1;
					end if;
				else
					dma_step <= dma_step + 1; 
				end if;
				
				dma_src_addr <= dma_src_addr + 1;
				if dma_step = x"4" then
					dma_src_addr <= dma_src_addr + 28;								
				end if;
			end if;			
	
		end if;
		
	end if;
end process;

--
-- transfert sprites data from sp_ram to sp_online_ram
--

sp_vcnt          <= sp_ram_do_to_sp_machine + ("111" & not(flip)  & flip  & flip  & flip  & '1') + vflip(7 downto 0) + 1; 

sp_online_ram_we <= '1' when hcnt(8) = '1' and sp_on_line = '1' and hcnt(0) ='0' and sp_online_ram_addr < "11111" else 
						  '1' when hcnt(8) = '0' and hcnt(3) = '1' else '0';

sp_online_ram_di <= '1' & sp_ram_do_to_sp_machine when hcnt(8) = '1' else '0'&x"00";

process (clock_vid)
begin
	if rising_edge(clock_vid) then

		if hcnt(8) = '1' then
			if hcnt(2 downto 0) = "000" then
				if sp_vcnt(7 downto 5) = "111" then 
					sp_on_line <= '1';
				else
					sp_on_line <= '0';
				end if;
			end if;
		else
			sp_on_line <= '0';		
		end if;
		
		if hcnt(8) = '1' then
		
			-- during line display seek for sprite on line and transfert them to sp_online_ram
			if hcnt = 256 then sp_online_ram_addr <= (others => '0'); end if;			
			
			if pix_ena = '1' and sp_on_line = '1' and hcnt(0) = '0' and sp_online_ram_addr < "11111" then 
	
				sp_online_ram_addr <= sp_online_ram_addr + 1;
				
			end if;
				
			-- during line fly back read sp_online_ram				
		else
			sp_online_ram_addr <= hcnt(6 downto 4) & hcnt(2 downto 1);
		end if;
		
	end if;
end process;	

--
-- read sprite data from sp_online_ram and feed sprite line buffer with sprite graphics data
--

sp_online_vcnt <= sp_online_ram_do(7 downto 0) + ("111" & not(flip)  & flip  & flip  & flip  & '1') + vflip_r(7 downto 0) + 1; 

sp_code_line <= (sp_code(6 downto 0)) & 
                (sp_line(4 downto 3) xor (sp_code(7) & sp_code(7))) &
                ("00"                xor (sp_color(7) & sp_color(7))) &
                (sp_line(2 downto 0) xor (sp_code(7) & sp_code(7) & sp_code(7)));

sp_buffer_ram_addr <= sp_bit_hpos_r when flip = '1' and hcnt(8) = '1' else not sp_bit_hpos_r;

sp_buffer_ram_di <= x"00" when hcnt(8) = '1' else
                    sp_color_r & sp_graphics3_do(sp_bit_nb) &
                    sp_graphics2_do(sp_bit_nb) & sp_graphics1_do(sp_bit_nb);

sp_buffer_ram_we <= pix_ena when hcnt(8) = '1' else
                    sp_ok and clock_cnt(0) when sp_buffer_ram_do(2 downto 0) = "000" else '0';

sp_hflip <= sp_color(7);

process (clock_vid)
begin
	if rising_edge(clock_vid) then

		sp_buffer_ram_do_r <= sp_buffer_ram_do;
		if pix_ena = '1' then
			sp_vid <= sp_buffer_ram_do_r;
		end if;

		if hcnt = 128 then vflip_r <= vflip; end if; 

		if hcnt(8)='0' then 

			if clock_cnt(0) = '1' then 
				if sp_hflip_r = '1' then sp_bit_nb <= sp_bit_nb + 1; end if;
				if sp_hflip_r = '0' then sp_bit_nb <= sp_bit_nb - 1; end if;

				sp_bit_hpos_r <= sp_bit_hpos_r + 1;			
			end if;

			if pix_ena = '1' then

				if hcnt(3 downto 0) = "0000" then sp_line  <= sp_online_vcnt; end if;
				if hcnt(3 downto 0) = "0010" then sp_code  <= sp_online_ram_do(7 downto 0); end if;
				if hcnt(3 downto 0) = "0100" then sp_color <= sp_online_ram_do(7 downto 0); end if;
				if hcnt(3 downto 0) = "0110" then 
					sp_ok_r <= sp_online_ram_do(8);
					sp_bit_hpos <= sp_online_ram_do(7 downto 0) + ("111" & not(flip)  & flip  & flip  & flip  & '1') +1;
				end if;

				if hcnt(3 downto 0) = "1000" then
					if sp_hflip = '1' then sp_bit_nb <= 0; else sp_bit_nb <= 7; end if;
					sp_bit_hpos_r <= sp_bit_hpos;
					sp_color_r <= sp_color(4 downto 0);
					sp_hflip_r <= sp_hflip;
					sp_vflip <= sp_code(7);
					sp_ok <= sp_ok_r;
				end if;

				-- sprite rom address setup
				if hcnt(3 downto 0) = "0110" then
					sp_graphics_addr <= sp_code_line;
				end if;
				if hcnt(3 downto 0) = "1010" then
					sp_graphics_addr(4 downto 3) <= "01" xor (sp_hflip_r & sp_hflip_r);
				end if;
				if hcnt(3 downto 0) = "1110" then
					sp_graphics_addr(4 downto 3) <= "10" xor (sp_hflip_r & sp_hflip_r);
				end if;
				if hcnt(3 downto 0) = "0010" then
					sp_graphics_addr(4 downto 3) <= "11" xor (sp_hflip_r & sp_hflip_r);
				end if;
				-- sprite rom data latch
				if hcnt(1 downto 0) = "00" then
					sp_graphics1_do <= sp_graphics_do(7 downto 0);
					sp_graphics2_do <= sp_graphics_do(15 downto 8);
					sp_graphics3_do <= sp_graphics_do(23 downto 16);
				end if;

			end if;

		else

			if flip = '1' then 
				sp_bit_hpos_r <= hcnt(7 downto 0) - 8; -- tune sprite position w.r.t. background
			else
				sp_bit_hpos_r <= hcnt(7 downto 0) - 6; -- tune sprite position w.r.t. background
			end if;

		end if;

	end if;
end process;

--------------------
--- char machine ---
--------------------
ch_code  <= ch_ram_do;
ch_code_line_1 <= '0' & ch_code & vflip(2 downto 0);
ch_code_line_2 <= '1' & ch_code & vflip(2 downto 0);

process (clock_vid)
begin
	if rising_edge(clock_vid) then

		if pix_ena = '1' then

			if hcnt(2 downto 0) = "111" then
				ch_color_r <= color_ram_do(3 downto 0);
				ch_graphx1_do_r <= ch_graphx1_do;
				ch_graphx2_do_r <= ch_graphx2_do;
				if flip = '1' then ch_bit_nb <= 0; else ch_bit_nb <= 7; end if;
			else

				if flip  = '1' then 
					ch_bit_nb <= ch_bit_nb + 1;
				else
					ch_bit_nb <= ch_bit_nb - 1;			
				end if;

			end if;

			ch_vid   <= ch_graphx2_do_r(ch_bit_nb) & ch_graphx1_do_r(ch_bit_nb);
			ch_color <= ch_color_r;

		end if;

	end if;
end process;

--ch_vid    <= ch_graphx2_do_r(ch_bit_nb) & ch_graphx1_do_r(ch_bit_nb);

--------------------------
--- background machine ---
--------------------------
map_offset_h <= (bg_position & '1') + (x"0" & vflip(7 downto 0)) + 1;

map_offset_l1 <= not('0' & vflip(7 downto 1)) + (hflip(7 downto 3) & "111") + 1;
map_offset_l2 <= map_offset_l1 + ('0' & not(flip) & flip & flip & flip & "000");

map_addr <=  map_offset_h(10 downto 3) & map_offset_l2(7 downto 3);

process (clock_vid)
begin
	if rising_edge(clock_vid) then

		if pix_ena = '1' then

			if hcnt(2 downto 0) = "011" then  -- 4H^
				bg_color_a <= map2_do(7 downto 4);

				bg_graphics_addr(2 downto 0) <= map_offset_h(2 downto 0);
				bg_graphics_addr(12 downto 3) <= map2_do(1 downto 0) & map1_do;--bg_code_line;
			end if;
			if hcnt(2 downto 0) = "111" then -- LD7
				bg_color_r <= bg_color_a;
				bg_graphics1_do <= bg_graphics_do(7 downto 0);
				bg_graphics2_do <= bg_graphics_do(15 downto 8);
				bg_graphics3_do <= bg_graphics_do(23 downto 16);
			end if;

			if (not(vflip(3 downto 1)) + hflip(2 downto 0)) = "111" then
				bg_graphics1_do_r <= bg_graphics1_do;
				bg_graphics2_do_r <= bg_graphics2_do;
				bg_graphics3_do_r <= bg_graphics3_do;

				bg_color   <= bg_color_r;

				if flip  = '1' then bg_bit_nb <= 0;	else bg_bit_nb <= 7; end if;
			else
				if flip  = '1' then 
					bg_bit_nb <= bg_bit_nb + 1;
				else
					bg_bit_nb <= bg_bit_nb - 1;
				end if;
			end if;

			bg_vid_r <= bg_graphics3_do_r(bg_bit_nb) & bg_graphics2_do_r(bg_bit_nb) & bg_graphics1_do_r(bg_bit_nb);

		end if;

	end if;
end process;

bg_vid <= "000" when bg_enable = '0' else
           bg_graphics3_do_r(bg_bit_nb) & bg_graphics2_do_r(bg_bit_nb) & bg_graphics1_do_r(bg_bit_nb) when flip = '1' else -- hack
           bg_vid_r;

--------------------------------------
-- mux char/background/sprite video --
--------------------------------------
process (clock_vid)
begin
	if rising_edge(clock_vid) then

		if pix_ena = '1' then

			palette_addr <= bg_color_ref & bg_color & bg_vid;

			if sp_vid(2 downto 0) /= "000" then
				palette_addr <= sp_vid;
 			end if;

			if ch_vid /= "00" then
				palette_addr <= ch_color_ref & ch_color & '0' & ch_vid;
 			end if;

			video_r <= palette_do(2 downto 0);
			video_g <= palette_do(5 downto 3);
			video_b <= palette_do(7 downto 6);

		end if;

	end if;
end process;

-----------
-- Audio --
-----------

audio_out_r <= audio_out;
audio_out_l <= audio_out;

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
  WAIT_n  => not pause,
  INT_n   => cpu_irq_n,
  NMI_n   => '1', --cpu_nmi_n,
  BUSRQ_n => '1',
  M1_n    => cpu_m1_n,
  MREQ_n  => cpu_mreq_n,
  IORQ_n  => open,
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
--rom_cpu : entity work.congo_cpu
--port map(
-- clk  => clock_vidn,
-- addr => cpu_addr(14 downto 0),
-- data => cpu_rom_do
--);

--cpu_rom_we <= '1' when dl_wr = '1' and dl_addr(17 downto 15) = "000" else '0'; -- 00000-07FFF
--rom_cpu : entity work.dpram
--generic map( dWidth => 8, aWidth => 15)
--port map(
-- clk_a  => clock_vidn,
-- addr_a => cpu_addr(14 downto 0),
-- q_a    => cpu_rom_do,
-- clk_b  => clock_vid,
-- addr_b => dl_addr(14 downto 0),
-- we_b   => cpu_rom_we,
-- d_b    => dl_data
--);
cpu_rom_addr <= cpu_addr(14 downto 0);

-- working RAM   0x8000-0x8FFF
wram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk  => clock_vidn,
 we   => wram_we,
 addr => wram_addr, --cpu_addr(11 downto 0),
 d    => cpu_do,
 q    => wram_do
);

-- video RAM  0xA000-0xA3FF + mirroring adresses
-- U59 low part
video_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_vidn,
 we   => ch_ram_we,
 addr => ch_ram_addr,
 d    => cpu_do,
 q    => ch_ram_do
);

-- color RAM  0xA400-0xA7FF + mirroring adresses
-- U59 high part
color_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_vidn,
 we   => color_ram_we,
 addr => ch_ram_addr,  -- video RAM / color RAM same low bits address
 d    => cpu_do,
 q    => color_ram_do
);

-- sprite RAM - DMA access
-- U12
sprite_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_vidn,
 we   => sp_ram_we,
 addr => sp_ram_addr,
 d    => dma_do,
 q    => sp_ram_do
);

-- sprite online RAM
sprites_online_ram : entity work.gen_ram
generic map( dWidth => 9, aWidth => 5)
port map(
 clk  => clock_vidn,
 we   => sp_online_ram_we,
 addr => sp_online_ram_addr,
 d    => sp_online_ram_di,
 q    => sp_online_ram_do
);

-- sprite line buffer
sprlinebuf : entity work.gen_ram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_vidn,
 we   => sp_buffer_ram_we,
 addr => sp_buffer_ram_addr,
 d    => sp_buffer_ram_di,
 q    => sp_buffer_ram_do
);

-- char graphics ROM 1
--ch_graphics_1 : entity work.congo_char_bits
--port map(
-- clk  => clock_vidn,
-- addr => ch_code_line_1,
-- data => ch_graphx1_do
--);

ch_1_rom_we <= '1' when dl_wr = '1' and dl_addr(17 downto 12) = "001000" else '0'; -- 08000-08FFF
ch_graphics_1 : entity work.dpram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk_a  => clock_vidn,
 addr_a => ch_code_line_1,
 q_a    => ch_graphx1_do,
 clk_b  => clock_vid,
 addr_b => dl_addr(11 downto 0),
 we_b   => ch_1_rom_we,
 d_b    => dl_data
);

-- char graphics ROM 2
--ch_graphics_2 : entity work.congo_char_bits
--port map(
-- clk  => clock_vidn,
-- addr => ch_code_line_2,
-- data => ch_graphx2_do
--);
ch_2_rom_we <= '1' when dl_wr = '1' and dl_addr(17 downto 12) = "001001" else '0'; -- 09000-09FFF
ch_graphics_2 : entity work.dpram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk_a  => clock_vidn,
 addr_a => ch_code_line_2,
 q_a    => ch_graphx2_do,
 clk_b  => clock_vid,
 addr_b => dl_addr(11 downto 0),
 we_b   => ch_2_rom_we,
 d_b    => dl_data
);

-- map tile ROM 1
--map_tile_1 : entity work.congo_map_1
--port map(
-- clk  => clock_vidn,
-- addr => map_addr,
-- data => map1_do
--);

map_1_rom_we <= '1' when dl_wr = '1' and dl_addr(17 downto 13) = "00101" else '0'; -- 0A000-0BFFF
map_tile_1 : entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_vidn,
 addr_a => map_addr,
 q_a    => map1_do,
 clk_b  => clock_vid,
 addr_b => dl_addr(12 downto 0),
 we_b   => map_1_rom_we,
 d_b    => dl_data
);

-- map tile ROM 2
--map_tile_2 : entity work.congo_map_2
--port map(
-- clk  => clock_vidn,
-- addr => map_addr,
-- data => map2_do
--);
map_2_rom_we <= '1' when dl_wr = '1' and dl_addr(17 downto 13) = "00110" else '0'; -- 0C000-0DFFF
map_tile_2 : entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_vidn,
 addr_a => map_addr,
 q_a    => map2_do,
 clk_b  => clock_vid,
 addr_b => dl_addr(12 downto 0),
 we_b   => map_2_rom_we,
 d_b    => dl_data
);

-- background graphics ROM 1
--bg_graphics_bits_1 : entity work.congo_bg_bits_1
--port map(
-- clk  => clock_vidn,
-- addr => bg_graphics_addr,
-- data => bg_graphics1_do
--);
--bg_1_rom_we <= '1' when dl_wr = '1' and dl_addr(17 downto 13) = "00111" else '0'; -- 0E000-0FFFF
--bg_graphics_bits_1 : entity work.dpram
--generic map( dWidth => 8, aWidth => 13)
--port map(
-- clk_a  => clock_vidn,
-- addr_a => bg_graphics_addr,
-- q_a    => bg_graphics1_do,
-- clk_b  => clock_vid,
-- addr_b => dl_addr(12 downto 0),
-- we_b   => bg_1_rom_we,
-- d_b    => dl_data
--);

-- background graphics ROM 2
--bg_graphics_bits_2 : entity work.congo_bg_bits_2
--port map(
-- clk  => clock_vidn,
-- addr => bg_graphics_addr,
-- data => bg_graphics2_do
--);
--bg_2_rom_we <= '1' when dl_wr = '1' and dl_addr(17 downto 13) = "01000" else '0'; -- 10000-11FFF
--bg_graphics_bits_2 : entity work.dpram
--generic map( dWidth => 8, aWidth => 13)
--port map(
-- clk_a  => clock_vidn,
-- addr_a => bg_graphics_addr,
-- q_a    => bg_graphics2_do,
-- clk_b  => clock_vid,
-- addr_b => dl_addr(12 downto 0),
-- we_b   => bg_2_rom_we,
-- d_b    => dl_data
--);

-- background graphics ROM 3
--bg_graphics_bits_3 : entity work.congo_bg_bits_3
--port map(
-- clk  => clock_vidn,
-- addr => bg_graphics_addr,
-- data => bg_graphics3_do
--);

--bg_3_rom_we <= '1' when dl_wr = '1' and dl_addr(17 downto 13) = "01001" else '0'; -- 12000-13FFF
--bg_graphics_bits_3 : entity work.dpram
--generic map( dWidth => 8, aWidth => 13)
--port map(
-- clk_a  => clock_vidn,
-- addr_a => bg_graphics_addr,
-- q_a    => bg_graphics3_do,
-- clk_b  => clock_vid,
-- addr_b => dl_addr(12 downto 0),
-- we_b   => bg_3_rom_we,
-- d_b    => dl_data
--);

-- sprite graphics ROM 1
--sp_graphics_bits_1 : entity work.congo_sp_bits_1
--port map(
-- clk  => clock_vidn,
-- addr => sp_graphics_addr,
-- data => sp_graphics1_do
--);

--sp_1_rom_we <= '1' when dl_wr = '1' and dl_addr(17 downto 14) = "0110" else '0'; -- 18000-1BFFF
--sp_graphics_bits_1 : entity work.dpram
--generic map( dWidth => 8, aWidth => 14)
--port map(
-- clk_a  => clock_vidn,
-- addr_a => sp_graphics_addr,
-- q_a    => sp_graphics1_do,
-- clk_b  => clock_vid,
-- addr_b => dl_addr(13 downto 0),
-- we_b   => sp_1_rom_we,
-- d_b    => dl_data
--);

-- sprite graphics ROM 2
--sp_graphics_bits_2 : entity work.congo_sp_bits_2
--port map(
-- clk  => clock_vidn,
-- addr => sp_graphics_addr,
-- data => sp_graphics2_do
--);

--sp_2_rom_we <= '1' when dl_wr = '1' and dl_addr(17 downto 14) = "0101" else '0'; -- 14000-17FFF
--sp_graphics_bits_2 : entity work.dpram
--generic map( dWidth => 8, aWidth => 14)
--port map(
-- clk_a  => clock_vidn,
-- addr_a => sp_graphics_addr,
-- q_a    => sp_graphics2_do,
-- clk_b  => clock_vid,
-- addr_b => dl_addr(13 downto 0),
-- we_b   => sp_2_rom_we,
-- d_b    => dl_data
--);

-- sprite graphics ROM 3
--sp_graphics_bits_3 : entity work.congo_sp_bits_3
--port map(
-- clk  => clock_vidn,
-- addr => sp_graphics_addr,
-- data => sp_graphics3_do
--);

--sp_3_rom_we <= '1' when dl_wr = '1' and dl_addr(17 downto 14) = "0111" else '0'; -- 1C000-1FFFF
--sp_graphics_bits_3 : entity work.dpram
--generic map( dWidth => 8, aWidth => 14)
--port map(
-- clk_a  => clock_vidn,
-- addr_a => sp_graphics_addr,
-- q_a    => sp_graphics3_do,
-- clk_b  => clock_vid,
-- addr_b => dl_addr(13 downto 0),
-- we_b   => sp_3_rom_we,
-- d_b    => dl_data
--);

--congo_sound_board 
sound_board : entity work.congo_sound_board
port map(
 clock_24  => clock_24,
 reset     => reset, 
 sound_cmd => sound_cmd,
 audio_out => audio_out,
 
 dl_addr   => dl_addr,
 dl_wr     => dl_wr,
 dl_data   => dl_data,
 
 dbg_out   => dbg_cpu_addr
);

-- palette
--palette : entity work.congo_palette
--port map(
-- clk  => clock_vidn,
-- addr => palette_addr,
-- data => palette_do
--);

palette_rom_we <= '1' when dl_wr = '1' and dl_addr(17 downto 8) = "1010000000" else '0'; -- 28000-280FF
palette : entity work.dpram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk_a  => clock_vidn,
 addr_a => palette_addr,
 q_a    => palette_do,
 clk_b  => clock_vid,
 addr_b => dl_addr(7 downto 0),
 we_b   => palette_rom_we,
 d_b    => dl_data
);


end struct;