---------------------------------------------------------------------------------
-- Zaxxon by Dar (darfpga@aol.fr) (23/11/2019)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
--
-- release rev 00 : initial release
--  (23/11/2019)
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
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------

--  Features :
--   Video        : TV 15kHz
--   Coctail mode : Yes
--   Sound        : No (atm)

--  Use with MAME roms from zaxxon.zip
--
--  Use make_zaxxon_proms.bat to build vhd file from binaries
--  (CRC list included)

--  Zaxxon (Gremlin/SEGA) Hardware caracteristics :
--
--  VIDEO : 1xZ80@3MHz CPU accessing its program rom, working ram,
--    sprite data ram, I/O, sound board register and trigger.
--		  20Kx8bits program rom
--
--    3 graphic layers
--
--    One char map 32x28 tiles 
--      2x2Kx8bits graphics rom 2bits/pixel
--      static layout color rom 16 color/tile
--
--    One diagonal scrolling background map 8x8 tiles
--      4x8Kx8bits tile map rom (10 bits code + 4bits color)
--      3x8Kx8bits graphics rom 3bits/pixel
--
--    32 sprites, up to 8/scanline 32x32pixels with flip H/V
--      6bits code + 2 bits flip h/v, 5 bits color 
--      3x8Kx8bits graphics rom 3bits/pixel
--      
--    general palette 256 colors 3red 3green 2blue 
--       char 2bits/tile +  4bits color set/tile + 1bits global set
--       background 3bits/tile + 4 bits color set/tile + 1bits global set
--       sprites   3bits/sprite + 5 bits color set/sprite
--
--    Working ram : 4Kx8bits
--    char ram    : 1Kx8bits code, (+ static layout color rom)
--    sprites ram : 256x8bits + 32x9bits intermediate buffer + 256x8bits line buffer
--

--  SOUND : see zaxxon_sound_board.vhd

---------------------------------------------------------------------------------
--  Schematics remarks : IC board 834-0214 and 834-0257 or 834-0211
--  some details are missing or seems to be wrong:
--     - sprite buffer addresses flip control seems to be incomplete
--       (fliping adresses both at read and write is useless !)
--     - diagonal scrolling seems to be incomplete (BCK on U52 pin 4 where from ?)
--     - 834-0211 sheet 6 of 9 : 74ls161 U26 at C-5 no ouput used !
--     - 834-0211 sheet 7 of 9 : /128H, 128H and 256H dont agree with U21 Qc/Qd 
--       output ! 
--
--  tips :
--     Background tiles scrolls over H (and V) but map rom output are latched
--     at fixed Hcnt position (4H^). Graphics rom ouput latch is scrolled over H.
--
--     During visible area (hcnt(8) = 1) sprite data are transfered from sp_ram
--     to sp_online_ram. Only sprites visible on (next) line are transfered. So
--     64 sprites are defined in sp_ram and only 8 can be transfered to 
--     sp_online_ram. 
--
--     During line fly back (hcnt(8) = 0) sp_online_ram is read and sprite
--     graphics feed line buffer. Line buffer is then read starting from
--     visible line.
--
--     Sprite data transfer is done at pixel rate : each sprite is 4 bytes data.
--     Visible area allows 64 sprites x 4 data (256 pixels) to be read, only 8
--     sprites (the ones on next line) are transfered.
--
--     Line buffer feed is done at twice pixel rate : 8 sprites x 32 pixels / 2
--     (256/2 = 128 pixels = fly back area length).
--
--     sp_online_ram is 9 bits wide. 9th bits is set during tranfer for actual 
--     sprites data written. 9th bit is reset during fly back area after data
--     are read. So 9th bits are all set to 0s at start of next transfer.
--
--     When feeding line buffer sprites graphic data are written only of no 
--     graphics have been written previouly for that line. Line buffer pixels are
--     set to 0s after each pixel read during visible area. Thus line buffer is 
--     fully cleared at start of next feeding.
--
--     Global screen flip is fully managed at hardware level. This allow to 
--     easily add an external flip screen feature.
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity zaxxon is
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

 hwsel          : in std_logic_vector(1 downto 0); --00 - zaxxon, 01 - futspy

 coin1          : in std_logic;
 coin2          : in std_logic;
 start1         : in std_logic; 
 start2         : in std_logic; 

 p1_input       : in std_logic_vector(7 downto 0);
 p2_input       : in std_logic_vector(7 downto 0); 

 sw1_input      : in  std_logic_vector( 7 downto 0);
 sw2_input      : in  std_logic_vector( 7 downto 0);

 service        : in std_logic;
 flip_screen    : in std_logic;

 enc_type       : in std_logic_vector(3 downto 0);
 cpu_rom_addr   : out std_logic_vector(14 downto 0);
 cpu_rom_do     : in std_logic_vector(7 downto 0);
 bg_graphics_addr : out std_logic_vector(12 downto 0);
 bg_graphics_do : in std_logic_vector(31 downto 0);
 sp_graphics_addr : out std_logic_vector(13 downto 0);
 sp_graphics_do : in std_logic_vector(31 downto 0);
 
 dl_addr        : in std_logic_vector(17 downto 0);
 dl_data        : in std_logic_vector(7 downto 0);
 dl_wr          : in std_logic;

 wave_addr      : buffer std_logic_vector(19 downto 0);
 wave_rd        : out std_logic;
 wave_data      : in std_logic_vector(15 downto 0);

 dbg_cpu_addr : out std_logic_vector(15 downto 0)
 );
end zaxxon;

architecture struct of zaxxon is

 signal reset_n   : std_logic;
 signal clock_vid : std_logic;
 signal clock_vidn: std_logic;
 signal clock_cnt : std_logic_vector(3 downto 0) := "0000";

 signal hcnt    : std_logic_vector(8 downto 0) := (others=>'0'); -- horizontal counter
 signal vcnt    : std_logic_vector(8 downto 0) := (others=>'0'); -- vertical counter
 signal hflip   : std_logic_vector(8 downto 0) := (others=>'0'); -- horizontal counter flip
 signal vflip   : std_logic_vector(8 downto 0) := (others=>'0'); -- vertical counter flip
 signal hflip2  : std_logic_vector(8 downto 0) := (others=>'0'); -- horizontal counter flip

 signal hs_cnt, vs_cnt :std_logic_vector(9 downto 0) ;
 signal hsync0, hsync1, hsync2, hsync3, hsync4 : std_logic;
 signal top_frame : std_logic := '0';
 
 signal pix_ena     : std_logic;
 signal cpu_ena     : std_logic;

 signal cpu_addr    : std_logic_vector(15 downto 0);
 signal cpu_di      : std_logic_vector( 7 downto 0);
 signal cpu_do      : std_logic_vector( 7 downto 0);
 signal cpu_wr_n    : std_logic;
 signal cpu_rd_n    : std_logic;
 signal cpu_mreq_n  : std_logic;
 signal cpu_ioreq_n : std_logic;
 signal cpu_irq_n   : std_logic;
 signal cpu_m1_n    : std_logic;
  
-- signal cpu_rom_do : std_logic_vector(7 downto 0);
 
 signal wram_we    : std_logic;
 signal wram_do    : std_logic_vector(7 downto 0);

 signal ch_ram_addr: std_logic_vector(9 downto 0);
 signal ch_ram_we  : std_logic;
 signal ch_ram_do  : std_logic_vector(7 downto 0);
 signal ch_ram_do_to_cpu: std_logic_vector(7 downto 0); -- registred ram data for cpu

 signal ch_code         : std_logic_vector(7 downto 0); 
 signal ch_code_r       : std_logic_vector(7 downto 0); 
 signal ch_attr         : std_logic_vector(7 downto 0);
 signal ch_color        : std_logic_vector(3 downto 0); 
 signal ch_color_r      : std_logic_vector(3 downto 0); 

 signal ch_code_line    : std_logic_vector(10 downto 0);
 signal ch_bit_nb       : integer range 0 to 7;
 signal ch_graphx1_do   : std_logic_vector( 7 downto 0);
 signal ch_graphx1_do_r : std_logic_vector( 7 downto 0);
 signal ch_graphx2_do   : std_logic_vector( 7 downto 0);
 signal ch_graphx2_do_r : std_logic_vector( 7 downto 0);
 signal ch_vid          : std_logic_vector( 1 downto 0);
 
 signal ch_color_addr   : std_logic_vector(7 downto 0);
 signal ch_color_do     : std_logic_vector(7 downto 0); -- 4 bits only used
 signal palette_addr    : std_logic_vector(7 downto 0);
 signal palette_do      : std_logic_vector(7 downto 0);
 
 signal map_offset_h     : std_logic_vector(11 downto 0);
 signal map_offset_l1    : std_logic_vector( 7 downto 0); 
 signal map_offset_l2    : std_logic_vector( 7 downto 0); 
 
 signal map_addr         : std_logic_vector(13 downto 0);
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

 signal sp_ram_addr       : std_logic_vector(7 downto 0);
 signal sp_ram_we         : std_logic;
 signal sp_ram_do         : std_logic_vector(7 downto 0);
 signal sp_ram_do_to_cpu        : std_logic_vector(7 downto 0);
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
 signal sp_color       : std_logic_vector(4 downto 0);
 signal sp_color_r     : std_logic_vector(4 downto 0);

 signal sp_code_line    : std_logic_vector(13 downto 0);
 signal sp_hflip        : std_logic;
 signal sp_hflip_r      : std_logic;
 signal sp_vflip        : std_logic;
 
-- signal sp_graphics_addr  : std_logic_vector(12 downto 0);
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
 
 signal sp_vid              : std_logic_vector(7 downto 0);

 signal vblkn, vblkn_r : std_logic;
 signal int_on       : std_logic := '0';
 
 signal flip_cpu     : std_logic := '0';
 signal flip         : std_logic := '0';
 signal ch_color_ref : std_logic := '0';
 signal bg_position  : std_logic_vector(10 downto 0) := (others => '0');
 signal bg_color_ref : std_logic := '0';
 signal bg_enable    : std_logic := '0';
 
 signal gen_input : std_logic_vector(7 downto 0);
 
 signal coin1_r, coin1_mem, coin1_ena : std_logic := '0';
 signal coin2_r, coin2_mem, coin2_ena : std_logic := '0';

 signal map1_we               : std_logic;
 signal map2_we               : std_logic;
 signal map_dl_addr           : std_logic_vector(17 downto 0);
 signal bg_graphics_1_we      : std_logic; 
 signal bg_graphics_2_we      : std_logic; 
 signal bg_graphics_bits_1_we : std_logic;
 signal bg_graphics_bits_2_we : std_logic;
 signal bg_graphics_bits_3_we : std_logic;
 signal sp_graphics_bits_1_we : std_logic;
 signal sp_graphics_bits_2_we : std_logic;
 signal sp_graphics_bits_3_we : std_logic;
 signal char_color_we         : std_logic;
 signal palette_we            : std_logic;

 signal port_a, port_a_r : std_logic_vector(7 downto 0); -- i8255 ports
 signal port_b, port_b_r : std_logic_vector(7 downto 0);
 signal port_c, port_c_r : std_logic_vector(7 downto 0);
 
 signal cpu_rom_dec : std_logic_vector(7 downto 0);
 signal cpu_rom_addr_enc : std_logic_vector(14 downto 0);

COMPONENT Sega_Crypt
	PORT
	(
		clk          : IN  STD_LOGIC;
		enc_type     : IN  STD_LOGIC_VECTOR(3 downto 0);
		mrom_m1      : IN  STD_LOGIC;
		mrom_ad      : IN  STD_LOGIC_VECTOR(14 DOWNTO 0);
		mrom_dt      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		cpu_rom_addr : OUT STD_LOGIC_VECTOR(14 DOWNTO 0);
		cpu_rom_do   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

begin

clock_vid  <= clock_24;
clock_vidn <= not clock_24;
reset_n    <= not reset;

-- debug 
process (reset, clock_vid)
begin
-- if rising_edge(clock_vid) and cpu_ena ='1' and cpu_mreq_n ='0' then
   --dbg_cpu_addr <=  cpu_addr;
 if rising_edge(clock_vid) then 
   dbg_cpu_addr <= sp_buffer_ram_do & sp_graphics1_do;
 end if;
end process;

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

-----------------------------------------
-- coin registers/start buttons inputs --
-----------------------------------------
gen_input <= service & '0' & coin1_mem & '0' & start2 & start1 & "00";

------------------------------------------
-- cpu data input with address decoding --
------------------------------------------
cpu_di <= 
       cpu_rom_dec      when cpu_mreq_n = '0' and cpu_addr(15 downto 12) < X"6" and enc_type /= x"0" else -- 0000-5FFF
			 cpu_rom_do       when cpu_mreq_n = '0' and cpu_addr(15 downto 12) < X"6" and enc_type  = x"0" else -- 0000-5FFF
			 wram_do          when cpu_mreq_n = '0' and cpu_addr(15 downto 12) = x"6" else -- 6000-6FFF
			 ch_ram_do_to_cpu when cpu_mreq_n = '0' and (cpu_addr and x"E000") = x"8000" else -- video ram   8000-83FF + mirroring 1C00
			 sp_ram_do_to_cpu when cpu_mreq_n = '0' and (cpu_addr and x"E000") = x"A000" else -- sprite ram  A000-A0FF + mirroring 1F00
			 p1_input         when cpu_mreq_n = '0' and (cpu_addr and x"E703") = x"C000" else -- player 1    C000      + mirroring 18FC 
			 p2_input         when cpu_mreq_n = '0' and (cpu_addr and x"E703") = x"C001" else -- player 2    C001      + mirroring 18FC 
			 sw1_input        when cpu_mreq_n = '0' and (cpu_addr and x"E703") = x"C002" else -- switch 1    C002      + mirroring 18FC 
			 sw2_input        when cpu_mreq_n = '0' and (cpu_addr and x"E703") = x"C003" else -- switch 2    C003      + mirroring 18FC 
			 gen_input        when cpu_mreq_n = '0' and (cpu_addr and x"E700") = x"C100" else -- general     C100      + mirroring 18FF 
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
		
			if (cpu_addr and x"E707") = x"C000" then coin1_ena                <= cpu_do(0);          end if; -- C000 + mirroring 18F8
			if (cpu_addr and x"E707") = x"C001" then coin2_ena                <= cpu_do(0);          end if; -- C001 + mirroring 18F8
			if (cpu_addr and x"E707") = x"C006" then flip_cpu                 <= cpu_do(0);      end if; -- C006 + mirroring 18F8
			
			if (cpu_addr and x"E0FF") = x"E0F0" then int_on                   <= cpu_do(0);          end if; -- E0F0 + mirroring 1F00
			if (cpu_addr and x"E0FF") = x"E0F1" then ch_color_ref             <= cpu_do(0);          end if; -- E0F1 + mirroring 1F00
			if (cpu_addr and x"E0FF") = x"E0F8" then bg_position( 7 downto 0) <= not cpu_do   ;          end if; -- E0F8 + mirroring 1F00
			if (cpu_addr and x"E0FF") = x"E0F9" then bg_position(10 downto 8) <= not cpu_do(2 downto 0); end if; -- E0F9 + mirroring 1F00
			if (cpu_addr and x"E0FF") = x"E0FA" then bg_color_ref             <= cpu_do(0);          end if; -- E0FA + mirroring 1F00
			if (cpu_addr and x"E0FF") = x"E0FB" then bg_enable                <= cpu_do(0);          end if; -- E0FB + mirroring 1F00

			-- (i8255 trivial mode 0)
			if (cpu_addr and x"E0FF") = x"E03C" then port_a <= cpu_do; port_a_r <= port_a; end if; -- E03C + mirroring 1F00
			if (cpu_addr and x"E0FF") = x"E03D" then port_b <= cpu_do; port_b_r <= port_b; end if; -- E03D + mirroring 1F00
			if (cpu_addr and x"E0FF") = x"E03E" then port_c <= cpu_do; port_c_r <= port_c; end if; -- E03E + mirroring 1F00

		end if;
		
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
wram_we   <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 12 ) = x"6"   else '0';
ch_ram_we <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and (cpu_addr and x"E000")  = x"8000" and hcnt(0) = '0' else '0';
sp_ram_we <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and (cpu_addr and x"E000")  = x"A000" and hcnt(0) = '1' else '0';

flip <= flip_cpu xor flip_screen;
hflip <= hcnt when flip = '0' else not hcnt;
vflip <= vcnt when flip = '0' else not vcnt;

ch_ram_addr <= cpu_addr(9 downto 0) when hcnt(0) = '0' else vflip(7 downto 3) & hflip(7 downto 3);
sp_ram_addr <= cpu_addr(7 downto 0) when hcnt(0) = '1' else '0'& hcnt(7 downto 1);

process (clock_vid)
begin
	if rising_edge(clock_vid) then
		if hcnt(0) = '1' then
			sp_ram_do_to_cpu <= sp_ram_do;
		else
			sp_ram_do_to_sp_machine <= sp_ram_do;		
		end if;
		if hcnt(0) = '0' then
			ch_ram_do_to_cpu <= ch_ram_do;
		end if;
	end if;
end process;

----------------------
--- sprite machine ---
----------------------
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

sp_code_line <= (sp_code(6) and hwsel(0)) &
                (sp_code(5 downto 0)) & 
                (sp_line(4 downto 3) xor (sp_code(7) & sp_code(7))) &
                ("00"                xor (sp_hflip & sp_hflip)) &
                (sp_line(2 downto 0) xor (sp_code(7) & sp_code(7) & sp_code(7)));

sp_buffer_ram_addr <= sp_bit_hpos_r when flip = '1' and hcnt(8) = '1' else not sp_bit_hpos_r;

sp_buffer_ram_di <= x"00" when hcnt(8) = '1' else
							sp_color_r & sp_graphics3_do(sp_bit_nb) &
							sp_graphics2_do(sp_bit_nb) & sp_graphics1_do(sp_bit_nb);

sp_buffer_ram_we <= pix_ena when hcnt(8) = '1' else
						  sp_ok_r and clock_cnt(0) when sp_buffer_ram_do(2 downto 0) = "000" else '0';

sp_hflip <= sp_code(6) when hwsel = "00" else sp_code(7);

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
				if hcnt(3 downto 0) = "0100" then sp_color <= sp_online_ram_do(4 downto 0); end if;
				if hcnt(3 downto 0) = "0110" then 
					sp_ok <= sp_online_ram_do(8);
					sp_bit_hpos <= sp_online_ram_do(7 downto 0) + ("111" & not(flip)  & flip  & flip  & flip  & '1') +1;
				end if;

				if hcnt(3 downto 0) = "1000" then
					if sp_hflip = '1' then sp_bit_nb <= 0; else sp_bit_nb <= 7; end if;
					sp_bit_hpos_r <= sp_bit_hpos;
					sp_color_r <= sp_color;
					sp_hflip_r <= sp_hflip;
					sp_vflip <= sp_code(7);
					sp_ok_r <= sp_ok;
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
				if hcnt(3 downto 0) = "0100" or hcnt(3 downto 0) = "1000" or hcnt(3 downto 0) = "1100" or hcnt(3 downto 0) = "0000" then
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
ch_code_line <= ch_code & vflip(2 downto 0);
ch_color_addr <= vflip(7 downto 5) & hflip(7 downto 3);

process (clock_vid)
begin
	if rising_edge(clock_vid) then

		if pix_ena = '1' then

			if hcnt(2 downto 0) = "111" then
				ch_color_r <= ch_color_do(3 downto 0);
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

			ch_color <= ch_color_r;
			ch_vid    <= ch_graphx2_do_r(ch_bit_nb) & ch_graphx1_do_r(ch_bit_nb);

		end if;

	end if;
end process;
	
--------------------------
--- background machine ---
--------------------------
map_offset_h <= (bg_position & '1') + (x"0" & vflip(7 downto 0)) + 1;

map_offset_l1 <= not('0' & vflip(7 downto 1)) + (hflip(7 downto 3) & "111") + 1;
map_offset_l2 <= map_offset_l1 + ('0' & not(flip) & flip & flip & flip & "000");

map_addr <=  map_offset_h(11 downto 3) & map_offset_l2(7 downto 3);

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
  IORQ_n  => cpu_ioreq_n,
  RD_n    => cpu_rd_n,
  WR_n    => cpu_wr_n,
  RFSH_n  => open,
  HALT_n  => open,
  BUSAK_n => open,
  A       => cpu_addr,
  DI      => cpu_di,
  DO      => cpu_do
);

-- cpu program ROM 0x0000-0x5FFF
--rom_cpu : entity work.zaxxon_cpu
--port map(
-- clk  => clock_vidn,
-- addr => cpu_addr(14 downto 0),
-- data => cpu_rom_do
--);

rom_cpu : Sega_Crypt
port map(
	clk          => clock_vidn,
	enc_type     => enc_type,
	mrom_m1      => not cpu_m1_n,
	mrom_ad      => cpu_addr(14 downto 0),
	mrom_dt  	   => cpu_rom_dec,
	cpu_rom_addr => cpu_rom_addr_enc,
	cpu_rom_do   => cpu_rom_do
);

cpu_rom_addr <= cpu_addr(14 downto 0) when enc_type = x"0" else cpu_rom_addr_enc;

-- working RAM   0x6000-0x6FFF
wram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk  => clock_vidn,
 we   => wram_we,
 addr => cpu_addr(11 downto 0),
 d    => cpu_do,
 q    => wram_do
);

-- video RAM   0x8000-0x83FF + mirroring adresses
video_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_vidn,
 we   => ch_ram_we,
 addr => ch_ram_addr,
 d    => cpu_do,
 q    => ch_ram_do
);

-- sprite RAM  0xA000-0xA0FF + mirroring adresses
sprites_ram : entity work.gen_ram
--sprites_ram_test : entity work.sp_ram_test
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_vidn,
 we   => sp_ram_we,
-- we   => '0',
 addr => sp_ram_addr,
 d    => cpu_do,
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
bg_graphics_1 : entity work.dpram
generic map(
	dWidth => 8,
	aWidth => 11
)
port map(
 clk_a  => clock_vidn,
 addr_a => ch_code_line,
 q_a    => ch_graphx1_do,
 clk_b  => clock_vid,
 addr_b => dl_addr(10 downto 0),
 we_b   => bg_graphics_1_we,
 d_b    => dl_data
);
bg_graphics_1_we <= '1' when dl_wr = '1' and dl_addr(17 downto 11) = "0011110" else '0';

-- char graphics ROM 2
bg_graphics_2 : entity work.dpram
generic map(
	dWidth => 8,
	aWidth => 11
)
port map(
 clk_a  => clock_vidn,
 addr_a => ch_code_line,
 q_a    => ch_graphx2_do,
 clk_b  => clock_vid,
 addr_b => dl_addr(10 downto 0),
 we_b   => bg_graphics_2_we,
 d_b    => dl_data
);
bg_graphics_2_we <= '1' when dl_wr = '1' and dl_addr(17 downto 11) = "0011111" else '0';


map_dl_addr <= dl_addr + x"1000";
-- map tile ROM 1
map_tile_1 : entity work.dpram
generic map(
	dWidth => 8,
	aWidth => 14
)
port map(
 clk_a  => clock_vidn,
 addr_a => map_addr,
 q_a    => map1_do,
 clk_b  => clock_vid,
 addr_b => map_dl_addr(13 downto 0),
 we_b   => map1_we,
 d_b    => dl_data
);
--map1_do <= map_do(7 downto 0);
map1_we <= '1' when dl_wr = '1' and map_dl_addr(17 downto 14) = "0010" else '0';-- 7000-AFFF (+1000)
--
-- map tile ROM 2
map_tile_2 : entity work.dpram
generic map(
	dWidth => 8,
	aWidth => 14
)
port map(
 clk_a  => clock_vidn,
 addr_a => map_addr,
 q_a    => map2_do,
 clk_b  => clock_vid,
 addr_b => map_dl_addr(13 downto 0),
 we_b   => map2_we,
 d_b    => dl_data
);
--map2_do <= map_do(15 downto 8);
map2_we <= '1' when dl_wr = '1' and map_dl_addr(17 downto 14) = "0011" else '0'; -- B000-EFFF (+1000)

-- char color
char_color : entity work.dpram
generic map(
	dWidth => 8,
	aWidth => 8
)
port map(
 clk_a  => clock_vidn,
 addr_a => ch_color_addr,
 q_a    => ch_color_do,
 clk_b  => clock_vid,
 addr_b => dl_addr(7 downto 0),
 we_b   => char_color_we,
 d_b    => dl_data
);
char_color_we <= '1' when dl_wr = '1' and dl_addr(17 downto 8) = "1010000001" else '0'; --28100-281FF

-- palette
palette : entity work.dpram
generic map(
	dWidth => 8,
	aWidth => 8
)
port map(
 clk_a  => clock_vidn,
 addr_a => palette_addr,
 q_a    => palette_do,
 clk_b  => clock_vid,
 addr_b => dl_addr(7 downto 0),
 we_b   => palette_we,
 d_b    => dl_data
);
palette_we <= '1' when dl_wr = '1' and dl_addr(17 downto 8) = "1010000000" else '0'; --28000-280FF

--zaxxon_sound_board
sound_board : entity work.zaxxon_sound
port map(
 clock_24    => clock_24,
 reset       => reset,

 port_a      => port_a,
 port_a_r    => port_a_r,
 port_b      => port_b,
 port_b_r    => port_b_r,
 port_c      => port_c,
 port_c_r    => port_c_r,

 audio_out_l => audio_out_l,
 audio_out_r => audio_out_r,

 wave_addr   => wave_addr,
 wave_rd     => wave_rd,
 wave_data   => wave_data
);

end struct;