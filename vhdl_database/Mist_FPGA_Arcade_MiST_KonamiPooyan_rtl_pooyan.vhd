---------------------------------------------------------------------------------
-- Pooyan by Dar (darfpga@aol.fr) (29/10/2017)
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
-- YM2149 (AY-3-8910)
-- Copyright (c) MikeJ - Jan 2005
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------

--  Features :
--   TV 15KHz mode only (atm)
--   Coctail mode ok
--   Sound ok

--  Use with MAME roms from pooyan.zip
--
--  Use make_pooyan_proms.bat to build vhd file from binaries
--
--  Pooyan Hardware caracteristics :
--
--  VIDEO : 1xZ80@3MHz CPU accessing its program rom, working ram,
--    sprite data ram, I/O, sound board register and trigger.
--		  32Kx8bits program rom
--
--    One char tile map 32x28
--      8Kx16bits graphics rom 4bits/pixel
--      16colors/16sets among 16 colors
--
--    24 sprites with priorities and flip H/V
--      16Kx16bits graphics rom 4bits/pixel
--      15 colors/16sets among 16 colors (different of char colors).
--
--    Char/sprites color palette 2x16 colors among 256 colors
--      3red 3green 2blue
--
--    Working ram : 4Kx8bits
--    Sprites data ram : 256x16bits
--    Sprites line buffer rams : 1 scan line delay flip/flop 2x256x4bits  

--  SOUND : 1xZ80@1.79MHz CPU accessing its program rom, working ram, 2x-AY3-8910
--		  16Kx8bits program rom
--
--      1xAY-3-8910
-- 		I/O noise input and command/trigger from video board.
--			3 sound channels
--
--      1xAY-3-8910
--			3 sound channels
--
--		  6 RC filters with 4 states : transparent or cut 600Hz, 700Hz, 3.4KHz
--
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pooyan is
port(
 clock_6      : in std_logic;
 clock_12     : in std_logic;
 clock_14     : in std_logic;
 reset        : in std_logic;
 video_r        : out std_logic_vector(2 downto 0);
 video_g        : out std_logic_vector(2 downto 0);
 video_b        : out std_logic_vector(1 downto 0);
 video_clk      : out std_logic;
 video_blankn   : out std_logic;
 video_hs       : out std_logic;
 video_vs       : out std_logic;
 video_csync    : out std_logic;
 audio_out      : out std_logic_vector(10 downto 0);
 roms_addr      : out std_logic_vector(14 downto 0);
 roms_do   : in std_logic_vector(7 downto 0);
 roms_rd       : out std_logic;
 dip_switch_1   : in std_logic_vector(7 downto 0); -- Coinage_B / Coinage_A
 dip_switch_2   : in std_logic_vector(7 downto 0); -- Sound(8)/Difficulty(7-5)/Bonus(4)/Cocktail(3)/lives(2-1)
 
 start2         : in std_logic;
 start1         : in std_logic;
 coin1          : in std_logic;
 
 fire1          : in std_logic;
 right1         : in std_logic;
 left1          : in std_logic;
 down1          : in std_logic;
 up1            : in std_logic;
 
 fire2          : in std_logic;
 right2         : in std_logic;
 left2          : in std_logic; 
 down2          : in std_logic;
 up2            : in std_logic;
 
 dbg_cpu_addr : out std_logic_vector(15 downto 0)
 );
end pooyan;

architecture struct of pooyan is

 signal reset_n: std_logic;
 signal clock_12n : std_logic;
 signal clock_6n  : std_logic;
 signal clock_div : std_logic_vector(1 downto 0) := "00";

 signal hcnt    : std_logic_vector(5 downto 0); -- horizontal counter
 signal vcnt    : std_logic_vector(8 downto 0); -- vertical counter
 signal pxcnt   : std_logic_vector(2 downto 0); -- pixel counter
 signal spcnt   : std_logic_vector(4 downto 0); -- sprite counter
 
 signal csync   : std_logic; 
 signal hsync0  : std_logic; 
 signal hsync1  : std_logic; 
 signal hsync2  : std_logic; 

 signal hblank  : std_logic; 
 signal vblank  : std_logic; 
 
 signal cpu_ena        : std_logic;

 signal cpu_addr   : std_logic_vector(15 downto 0);
 signal cpu_di     : std_logic_vector( 7 downto 0);
 signal cpu_do     : std_logic_vector( 7 downto 0);
 signal cpu_wr_n   : std_logic;
 signal cpu_mreq_n : std_logic;
 signal cpu_nmi_n  : std_logic;

 signal cpu_rom_do : std_logic_vector( 7 downto 0);
 
 signal wram_addr  : std_logic_vector(11 downto 0);
 signal wram_we    : std_logic;
 signal wram_do    : std_logic_vector( 7 downto 0);
 
 signal ch_graphx_addr_f: std_logic_vector(11 downto 0);
 signal ch_graphx_addr  : std_logic_vector(11 downto 0);
 signal ch_graphx1_do   : std_logic_vector( 7 downto 0);
 signal ch_graphx2_do   : std_logic_vector( 7 downto 0);
 signal ch_pixels       : std_logic_vector(15 downto 0);
 signal ch_data1        : std_logic_vector( 7 downto 0);
 signal ch_color_set    : std_logic_vector(3 downto 0);
 signal ch_palette_addr : std_logic_vector(7 downto 0);
 signal ch_palette_do   : std_logic_vector(7 downto 0); 

 signal spram_addr      : std_logic_vector(7 downto 0);
 signal spram1_we       : std_logic;
 signal spram1_do       : std_logic_vector(7 downto 0);
 signal spram2_we       : std_logic;
 signal spram2_do       : std_logic_vector(7 downto 0);
 
 signal sp_graphx_addr  : std_logic_vector(11 downto 0);
 signal sp_graphx1_do   : std_logic_vector(7 downto 0);
 signal sp_graphx2_do   : std_logic_vector(7 downto 0);
 signal vcnt_r       : std_logic_vector(8 downto 0);
 signal sp_line      : std_logic_vector(7 downto 0);
 signal sp_on_line   : std_logic;
 signal sp_attr      : std_logic_vector(7 downto 0);
 signal sp_posh      : std_logic_vector(7 downto 0);
 signal sp_pixels    : std_logic_vector(15 downto 0);
 signal sp_color_set    : std_logic_vector(3 downto 0);
 signal sp_palette_addr : std_logic_vector(7 downto 0);
 signal sp_palette_do   : std_logic_vector(7 downto 0); 
 signal sp_read_out     : std_logic_vector(3 downto 0); 
 signal sp_blank   : std_logic;
 
 signal rgb_palette_addr  : std_logic_vector(4 downto 0);
 signal rgb_palette_do    : std_logic_vector(7 downto 0); 
 
 signal sp_buffer_write_addr : std_logic_vector(7 downto 0);
 signal sp_buffer_write_we   : std_logic;
 signal sp_buffer_read_addr  : std_logic_vector(7 downto 0);
  
 signal sp_buffer_ram1_addr : std_logic_vector(7 downto 0);
 signal sp_buffer_ram1_we   : std_logic;
 signal sp_buffer_ram1_di   : std_logic_vector(3 downto 0);
 signal sp_buffer_ram1_do   : std_logic_vector(3 downto 0);

 signal sp_buffer_ram2_addr : std_logic_vector(7 downto 0);
 signal sp_buffer_ram2_we   : std_logic;
 signal sp_buffer_ram2_di   : std_logic_vector(3 downto 0);
 signal sp_buffer_ram2_do   : std_logic_vector(3 downto 0);

 signal sp_buffer_sel : std_logic;
 
 signal itt_n      : std_logic;
 signal flip       : std_logic;
 signal A10x_we    : std_logic;
 signal A18x_we    : std_logic;
 signal sound_cmd  : std_logic_vector(7 downto 0);
 signal sound_trig : std_logic;
 
 signal input_0       : std_logic_vector(7 downto 0);
 signal input_1       : std_logic_vector(7 downto 0);
 signal input_2       : std_logic_vector(7 downto 0);

begin

clock_12n <= not clock_12;
clock_6n  <= not clock_6;
reset_n   <= not reset;

-- debug 
process (reset, clock_12)
begin
 if rising_edge(clock_12) and cpu_ena ='1' and cpu_mreq_n ='0' then
   dbg_cpu_addr <= cpu_addr;
 end if;
end process;

--------------------------
-- Video/sprite scanner --
--------------------------

-- make hcnt and vcnt video scanner from pixel clocks and counts
-- 
--  pxcnt      |0|1|2|3|4|5|6|7|0|1|2|3|4|5|6|7|
--  hcnt       |         N     |      N+1      | 
--  cpu_adr/do |                               | 

--
--  hcnt [0..47] => 48 x 8 = 384 pixels,  384/6.144Mhz => 1 line is 62.5us (16.000KHz)
--  vcnt [252..255,256..511] => 260 lines, 1 frame is 260 x 62.5us = 16.250ms (61.54Hz)

process (reset, clock_6)
begin
	if reset='1' then
		pxcnt <= "000";
		hcnt  <= "000000";
		vcnt  <= '0'&X"FC";	
		spcnt <= "00000";
	else 
		if rising_edge(clock_6) then
			pxcnt <= pxcnt + '1';
			if pxcnt = "111" then
				hcnt <= hcnt + '1';
				
				if hcnt = "101111" then -- char from #0 to #47 (one line)
					hcnt <= "000000";
					if vcnt = '1'&X"FF" then
						vcnt <= '0'&X"FC";
					else
						vcnt <= vcnt + '1';
					end if;
				end if;
				
				-- sprite down counter
				if hcnt(0) = '1' then -- every is 16 bits (2 char)
					if hcnt = "101111" then
						spcnt <= "01000";  -- start with sprite #8
					else
						spcnt <= spcnt + '1'; -- upto sprite #31
					end if;
				end if;
				
			end if;
		end if;
	end if;
end process;

cpu_ena  <= not pxcnt(0);

-- inputs
input_0       <= "111" & not start2 & not start1 & '1'     & '1'        & not coin1; --   ?/  ?/  ?/ 2S/ 1S/SVC/ C2/ C1
input_1       <= "111" & not fire1  & not down1  & not up1 & not right1 & not left1; --   ?/1FL/1SR/1SL/1DW/1UP/1RI/1LE
input_2       <= "111" & not fire2  & not down2  & not up2 & not right2 & not left2; --   ?/2FL/2SR/2SL/2DW/2UP/2RI/2LE

-- cpu input address decoding (mirror mostly from Mame)
cpu_di <= cpu_rom_do   when cpu_addr(15 downto 12) < X"8" else      -- 0000-7FFF
			 wram_do      when cpu_addr(15 downto 12) = X"8" else      -- 8000-8FFF
			 
			 spram1_do    when cpu_addr(15 downto 12) = X"9" and
									 cpu_addr(10) = '0'            else      -- 9000-93FF
									 
			 spram2_do    when cpu_addr(15 downto 12) = X"9" and
									 cpu_addr(10) = '1'            else      -- 9400-97FF					 
										  
			 dip_switch_2 when cpu_addr(15 downto 12) = X"A" and
									 cpu_addr( 7 downto  5) = "000" else     -- A000-A000
			 
			 input_0      when cpu_addr(15 downto 12) = X"A" and
									 cpu_addr( 7 downto  5) = "100" else     -- A080-A080
									 
			 input_1      when cpu_addr(15 downto 12) = X"A" and
									 cpu_addr( 7 downto  5) = "101" else     -- A0A0-A0A0
									 
			 input_2      when cpu_addr(15 downto 12) = X"A" and
									 cpu_addr( 7 downto  5) = "110" else     -- A0C0-A0C0
			 
			 dip_switch_1 when cpu_addr(15 downto 12) = X"A" and
									 cpu_addr( 7 downto  5) = "111" else     -- A0E0-A0E0
			 
   		 X"FF";

-- working ram address multiplexer cpu/video scanner
wram_addr <= cpu_addr(11 downto 0) when cpu_ena = '1' else 
             '0' & pxcnt(1) & vcnt(7 downto 3) & hcnt(4 downto 0) when flip = '0' else
             '0' & pxcnt(1) & not vcnt(7 downto 3) & not hcnt(4 downto 0);

-- sprite data ram address multiplexer cpu/sprite scanner
spram_addr <= cpu_addr(7 downto 0) when cpu_ena = '1' else "00" & spcnt & pxcnt(1);
			 
-- write enable to working ram, sprite data ram and misc registers
wram_we   <= '1' when cpu_wr_n = '0' and cpu_ena = '1' and cpu_addr(15 downto 12) = X"8" else '0';
spram1_we <= '1' when cpu_wr_n = '0' and cpu_ena = '1' and cpu_addr(15 downto 12) = X"9" and cpu_addr(10) = '0' else '0';
spram2_we <= '1' when cpu_wr_n = '0' and cpu_ena = '1' and cpu_addr(15 downto 12) = X"9" and cpu_addr(10) = '1' else '0';
A10x_we   <= '1' when cpu_wr_n = '0' and cpu_ena = '1' and cpu_addr(15 downto 12) = X"A" and cpu_addr(8 downto 7) = "10" else '0';
A18x_we   <= '1' when cpu_wr_n = '0' and cpu_ena = '1' and cpu_addr(15 downto 12) = X"A" and cpu_addr(8 downto 7) = "11" else '0';

-- Misc registers : interrupt enable/clear, cocktail flip, sound trigger
process (clock_6)
begin
	if rising_edge(clock_6) then
		if A10x_we = '1' then
			sound_cmd <= cpu_do;
		end if;

   	if A18x_we = '1' then
			if cpu_addr(2 downto 0) = "000" then itt_n <= cpu_do(0); end if;
			if cpu_addr(2 downto 0) = "111" then flip  <= not cpu_do(0); end if;
			if cpu_addr(2 downto 0) = "001" then sound_trig <= cpu_do(0); end if;
		end if;
		
		if itt_n = '0' then
			cpu_nmi_n <= '1';
		else	-- lauch nmi and end of frame
			if (vcnt = 493) and (hcnt = "000000") and (pxcnt = "000") then
				cpu_nmi_n <= '0';
			end if;
		end if;
	end if;	
end process;	


----------------------
--- sprite machine ---
----------------------
-- sprite data rams are scanned from sprites addresse 31 to 8 at each line

-- latch current sprite data with respect to pixel and hcnt in relation
-- with sprite data ram addressing  
process (clock_6)
begin
	if rising_edge(clock_6) then
	
		if (hcnt(0) = '0') and (pxcnt = "001") then
			sp_posh <= spram1_do ; -- a.k.a. X
			sp_attr <= spram2_do ; -- color and flip x/y
			vcnt_r  <= vcnt;
		end if;

		-- sprite is on current line if sp_line is below 16
		-- and if sprite vertical position (a.k.a. Y) is below xF0
		if (hcnt(0) = '0') and (pxcnt = "011") then
			if sp_line(7 downto 4) = "0000" and spram2_do < X"F0" then
				sp_on_line <= '1';
			else
				sp_on_line <= '0';
			end if;
		end if;

		-- delay sp_color_set
		if (hcnt(0) = '0') and (pxcnt = "100") then
			 sp_color_set <= sp_attr(3 downto 0);
		end if;
	
	end if;
end process;	

-- sp_line (valid only when pxcnt = "011")
sp_line <= not(vcnt_r(7 downto 0)) - spram2_do;

-- address sprite graphics rom with sprite code and tile number and sprite line counter
-- with respect to sprite flip x/y controls
with sp_attr(7 downto 6) select
	sp_graphx_addr <= spram1_do(5 downto 0) &     sp_line(3) &     hcnt(0) &     pxcnt(2) &     sp_line(2 downto 0) when "11",  
							spram1_do(5 downto 0) &     sp_line(3) & not hcnt(0) & not pxcnt(2) &     sp_line(2 downto 0) when "10",  
							spram1_do(5 downto 0) & not sp_line(3) &     hcnt(0) &     pxcnt(2) & not sp_line(2 downto 0) when "01",  
							spram1_do(5 downto 0) & not sp_line(3) & not hcnt(0) & not pxcnt(2) & not sp_line(2 downto 0) when others;
							
-- latch and shift sprite graphics data with respect to flipx control
-- 16bits => 4x4bits = 4pixels / 16colors (15colors + transparent)
process (clock_6)
begin
	if rising_edge(clock_6) then
	
		if pxcnt(1 downto 0) = "00" then
			if sp_on_line = '1' then
				if sp_attr(6) = '1' then
					sp_pixels <= sp_graphx1_do & sp_graphx2_do;
				else
					sp_pixels( 3 downto  0) <= sp_graphx2_do(0) & sp_graphx2_do(1) & sp_graphx2_do(2) & sp_graphx2_do(3);
					sp_pixels( 7 downto  4) <= sp_graphx2_do(4) & sp_graphx2_do(5) & sp_graphx2_do(6) & sp_graphx2_do(7);
					sp_pixels(11 downto  8) <= sp_graphx1_do(0) & sp_graphx1_do(1) & sp_graphx1_do(2) & sp_graphx1_do(3);
					sp_pixels(15 downto 12) <= sp_graphx1_do(4) & sp_graphx1_do(5) & sp_graphx1_do(6) & sp_graphx1_do(7);
				end if;
			else
				sp_pixels <= (others => '0');
			end if;
		else 
			sp_pixels( 3 downto  0) <= sp_pixels( 2 downto  0) & '0';
			sp_pixels( 7 downto  4) <= sp_pixels( 6 downto  4) & '0';
			sp_pixels(11 downto  8) <= sp_pixels(10 downto  8) & '0';
			sp_pixels(15 downto 12) <= sp_pixels(14 downto 12) & '0';
		end if;
		
	end if;

end process;

-- address sprite color palette 16colors/pixel, 16 sets => 16 colors
sp_palette_addr <= sp_color_set & sp_pixels(3) & sp_pixels(7) & sp_pixels(11) & sp_pixels(15);

-- write sprite to line buffer at posh position
process (clock_6)
begin
	if rising_edge(clock_6) then
		if hcnt(0) = '0' and pxcnt = "101" then
			sp_buffer_write_addr <= sp_posh;
		else
			sp_buffer_write_addr <= sp_buffer_write_addr + '1';
		end if;
	end if;
end process;

-- write colors to buffer when not transparent
sp_buffer_write_we <= '0' when sp_palette_do(3 downto 0) = "0000" else '1';

-- read sprite line buffer and erase after read
process (clock_12)
begin
	if rising_edge(clock_12) then
		if hcnt = "101111" and pxcnt = "111" then
			sp_buffer_read_addr <= "11111010"; -- tune horizontal position of sprites
		else
			if clock_6 = '0' then
				sp_buffer_read_addr <= sp_buffer_read_addr + '1';
			else
				if vcnt(0) = '0' then
					sp_read_out <= sp_buffer_ram1_do;
				else
					sp_read_out <= sp_buffer_ram2_do;
				end if;
			end if;
		end if;
	end if;
end process;

-- toggle read/write sprite line buffer every other line

-- wait pxcnt = "101" to allow last sprite (#31) to be written to line buffer
process (clock_6)
begin
	if rising_edge(clock_6) then
		if pxcnt = "101" then sp_buffer_sel <= vcnt(0); end if;
	end if;
end process;

sp_buffer_ram1_addr <= sp_buffer_read_addr when sp_buffer_sel = '0' else sp_buffer_write_addr;
sp_buffer_ram2_addr <= sp_buffer_read_addr when sp_buffer_sel = '1' else sp_buffer_write_addr;

sp_buffer_ram1_di <= "0000" when sp_buffer_sel = '0' else sp_palette_do(3 downto 0);
sp_buffer_ram2_di <= "0000" when sp_buffer_sel = '1' else sp_palette_do(3 downto 0);

sp_buffer_ram1_we <= not clock_6 when sp_buffer_sel = '0' else sp_buffer_write_we;
sp_buffer_ram2_we <= not clock_6 when sp_buffer_sel = '1' else sp_buffer_write_we;

--------------------
--- char machine ---
--------------------

-- latch current char data with respect to vcnt and hcnt in relation
-- with wram ram addressing  
process (clock_6)
begin
	if rising_edge(clock_6) and pxcnt = "001" then
		ch_data1 <= wram_do ;
	end if;

	if rising_edge(clock_6) and pxcnt = "100" then
		ch_color_set <= ch_data1(3 downto 0) ;
	end if;

end process;	

-- address char graphics rom with char code, pixel count and vertical line counter
-- with respect to char flip x/y controls
with ch_data1(7 downto 6) select
ch_graphx_addr_f <= wram_do &     pxcnt(2) &     vcnt(2 downto 0)  when "00",
					     wram_do & not pxcnt(2) &     vcnt(2 downto 0)  when "01",
						  wram_do &     pxcnt(2) & not(vcnt(2 downto 0)) when "10",
						  wram_do & not pxcnt(2) & not(vcnt(2 downto 0)) when others;	

-- in cocktail flip mode  negate h/v counters 
ch_graphx_addr <= ch_graphx_addr_f when flip ='0' else ch_graphx_addr_f xor "000000001111";

-- latch and shift char graphics data with respect to flipx control and cocktail flip control
-- 16bits => 4x4bits = 4pixels / 16colors
process (clock_6)
begin
	if rising_edge(clock_6) then
		if pxcnt(1 downto 0) = "00" then 
			if (ch_data1(6) xor flip) = '0'  then
				ch_pixels <= ch_graphx1_do & ch_graphx2_do;
			else
				ch_pixels( 3 downto  0) <= ch_graphx2_do(0) & ch_graphx2_do(1) &ch_graphx2_do(2) &ch_graphx2_do(3);
				ch_pixels( 7 downto  4) <= ch_graphx2_do(4) & ch_graphx2_do(5) &ch_graphx2_do(6) &ch_graphx2_do(7);
				ch_pixels(11 downto  8) <= ch_graphx1_do(0) & ch_graphx1_do(1) &ch_graphx1_do(2) &ch_graphx1_do(3);
				ch_pixels(15 downto 12) <= ch_graphx1_do(4) & ch_graphx1_do(5) &ch_graphx1_do(6) &ch_graphx1_do(7);
			end if;
		else 
			ch_pixels( 3 downto  0) <= ch_pixels( 2 downto  0) & '0';
			ch_pixels( 7 downto  4) <= ch_pixels( 6 downto  4) & '0';
			ch_pixels(11 downto  8) <= ch_pixels(10 downto  8) & '0';
			ch_pixels(15 downto 12) <= ch_pixels(14 downto 12) & '0';
		end if;
	end if;

end process;	

-- address char color palette 4 colors, 64 sets => 16 colors
ch_palette_addr <= ch_color_set & ch_pixels(3) & ch_pixels( 7) & ch_pixels(11) & ch_pixels(15);

---------------------
-- mux char/sprite --
---------------------

-- char data controls sprite display/hide
--process (clock_6)
--begin
--	if rising_edge(clock_6) then
--		sp_blank <= ch_color_set(4);
--	end if;
--end process;	

-- select rbg color and bank with respect to char/sprite selection
rgb_palette_addr <= 
--	'1' & ch_palette_do(3 downto 0) when (sp_read_out = "0000" or sp_blank = '1') else 
	'1' & ch_palette_do(3 downto 0) when (sp_read_out = "0000" ) else 
	'0' & sp_read_out; 
	
-- register and assign rbg palette output
process (clock_6)
begin
	if rising_edge(clock_6) then
		video_r <= rgb_palette_do(2 downto 0);
		video_g <= rgb_palette_do(5 downto 3);
		video_b <= rgb_palette_do(7 downto 6);
	end if;
end process;

----------------------------
-- video syncs and blanks --
----------------------------

video_csync <= csync;

process(clock_6)
	constant hcnt_base : integer := 37;
	variable vsync_cnt : std_logic_vector(3 downto 0);
begin

if rising_edge(clock_6) and pxcnt = "111" then

		if    hcnt = hcnt_base+0 then hsync0 <= '0';
		elsif hcnt = hcnt_base+3 then hsync0 <= '1';
		end if;

  if    hcnt = hcnt_base+0     then hsync1 <= '0';
  elsif hcnt = hcnt_base+1     then hsync1 <= '1';
  elsif hcnt = hcnt_base+24-48 then hsync1 <= '0';
  elsif hcnt = hcnt_base+25-48 then hsync1 <= '1';
  end if;

  if    hcnt = hcnt_base+0        then hsync2 <= '0';
  elsif hcnt = hcnt_base+24-1-48  then hsync2 <= '1';
  elsif hcnt = hcnt_base+24-48    then hsync2 <= '0';
  elsif hcnt = hcnt_base+0-1      then hsync2 <= '1';
  end if;
  
		if hcnt = hcnt_base then 
			if vcnt = 500 then
				vsync_cnt := X"0";
			else
				if vsync_cnt < X"F" then vsync_cnt := vsync_cnt + '1'; end if;
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

  if    hcnt = hcnt_base-6  then hblank <= '1'; 
  elsif hcnt = hcnt_base+10  then hblank <= '0';
  end if;

  if    vcnt = 496 then vblank <= '1';   -- 492 ok
  elsif vcnt = 262 then vblank <= '0';   -- 262 ok 
		end if;

  -- external sync and blank outputs
  video_blankn <= not (hblank or vblank);

		video_hs <= hsync0;
	  
		if    vsync_cnt = 0 then video_vs <= '0';
		elsif vsync_cnt = 8 then video_vs <= '1';
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
  CLK_n   => clock_6,
  CLKEN   => cpu_ena,
  WAIT_n  => '1',
  INT_n   => '1', --cpu_irq_n,
  NMI_n   => cpu_nmi_n,
  BUSRQ_n => '1',
  M1_n    => open,
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

roms_addr <= cpu_addr(14 downto 0);
cpu_rom_do <= roms_do;
roms_rd <= '1';

-- working/char RAM   0x8000-0x8FFF
wram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk  => clock_6n,
 we   => wram_we,
 addr => wram_addr,
 d    => cpu_do,
 q    => wram_do
);

-- sprite RAM1    0x9000-0x90FF
spram1 : entity work.gen_ram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_6n,
 we   => spram1_we,
 addr => spram_addr,
 d    => cpu_do,
 q    => spram1_do
);

-- sprite RAM2    0x9400-0x94FF
spram2 : entity work.gen_ram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_6n,
 we   => spram2_we,
 addr => spram_addr,
 d    => cpu_do,
 q    => spram2_do
);

-- sprite line buffer 1
splinebuf1 : entity work.gen_ram
generic map( dWidth => 4, aWidth => 8)
port map(
 clk  => clock_12n,
 we   => sp_buffer_ram1_we,
 addr => sp_buffer_ram1_addr,
 d    => sp_buffer_ram1_di,
 q    => sp_buffer_ram1_do
);

-- sprite line buffer 2
splinebuf2 : entity work.gen_ram
generic map( dWidth => 4, aWidth => 8)
port map(
 clk  => clock_12n,
 we   => sp_buffer_ram2_we,
 addr => sp_buffer_ram2_addr,
 d    => sp_buffer_ram2_di,
 q    => sp_buffer_ram2_do
);

-- char graphics ROM G10
char_graphics_1 : entity work.pooyan_char_grphx1
port map(
 clk  => clock_6,
 addr => ch_graphx_addr,
 data => ch_graphx1_do
);

-- char graphics ROM G9
char_graphics_2 : entity work.pooyan_char_grphx2
port map(
 clk  => clock_6,
 addr => ch_graphx_addr,
 data => ch_graphx2_do
);

-- char palette ROM
ch_palette : entity work.pooyan_char_color_lut
port map(
 clk  => clock_6,
 addr => ch_palette_addr,
 data => ch_palette_do
);

-- sprite graphics ROM A9
sp_graphics_1 : entity work.pooyan_sprite_grphx1
port map(
 clk  => clock_6,
 addr => sp_graphx_addr,
 data => sp_graphx1_do
);

-- sprite graphics ROM A8
sp_graphics_2 : entity work.pooyan_sprite_grphx2
port map(
 clk  => clock_6,
 addr => sp_graphx_addr,
 data => sp_graphx2_do
);

-- sprite palette ROM
sp_palette : entity work.pooyan_sprite_color_lut
port map(
 clk  => clock_6,
 addr => sp_palette_addr,
 data => sp_palette_do
);

-- rgb palette ROM 
rgb_palette_gb : entity work.pooyan_palette
port map(
 clk  => clock_6,
 addr => rgb_palette_addr,
 data => rgb_palette_do
);


-- sound board
pooyan_sound_board : entity work.pooyan_sound_board
port map(
 clock_14     => clock_14,
 reset        => reset,
 sound_trig   => sound_trig,
 sound_cmd    => sound_cmd,
 audio_out    => audio_out,
 dbg_cpu_addr => open
 );

end struct;