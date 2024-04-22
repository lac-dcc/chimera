---------------------------------------------------------------------------------
-- Defender by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- gen_ram.vhd & io_ps2_keyboard
-------------------------------- 
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
---------------------------------------------------------------------------------
-- cpu09l - Version : 0128
-- Synthesizable 6809 instruction compatible VHDL CPU core
-- Copyright (C) 2003 - 2010 John Kent
---------------------------------------------------------------------------------
-- cpu68 - Version 9th Jan 2004 0.8
-- 6800/01 compatible CPU core 
-- GNU public license - December 2002 : John E. Kent
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
-- Version 0.0 -- 15/10/2017 -- 
--		    initial version
---------------------------------------------------------------------------------
--  Features :
--   TV 15KHz mode only (atm)
--   Cocktail mode : OK 
-- 
--  Use with MAME roms from defender.zip
--
--  Use make_defender_proms.bat to build vhd file and bin from binaries
--
--  Defender Hardware caracteristics :
--
--    1x6809 CPU accessing program rom and shared ram/devices
--      3x16Ko video and working ram
--      26Ko program roms
--      1 pia for player I/O
--      1 pia service switches, irq and sound selection to sound board
--
--    384 pixels x 260 line video scan, 16 colors per pixel
--    Ram palette 16 colors among 256 colors (3 red bits,3 green bits, 2 blue bits)
--
--    2 decoder proms for video scan and cocktail/upright flip
--
--    No sprites, no char tiles 
--
--    128x4 cmos ram (see defender_cmos_ram.vhd for initial values)
--    No save when power off (see also defender_cmos_ram.vhd)
--
--    1x6808/02
--      128x8 working ram
--      4k program rom 
--      1 pia for sound selection cmd input and audio samples output

---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- defender cmos data (see also defender_cmos_ram.vhd)
-- (ram is 128x4 => only 4 bits/address, that is only 1 hex digit/address)
--
-- @      values             - (fonction) meaning

--	0       0                 - ?
-- 1       0005              - (01) coins left
-- 5       0000              - (02) coins center
-- 9       0000              - (03) coins right
-- 13      0005              - (04) total paid
-- 17      0000              - (05) ships won
---21      0000              - (06) total time
-- 25      0003              - (07) total ships

-- -- 8 entries of 6 digits highscore + 3 ascii letters

-- 29      021270 44 52 4A   
-- 41      018315 53 41 4D
-- 53      015920 4C 45 44
-- 65      014285 50 47 44
-- 77      012520 43 52 42
-- 89      011035 4D 52 53
-- 101     008265 53 53 52
-- 113     006010 54 4D 48 

-- 125     00                - credits
-- 127     5                 - ?

-- -- protected data writeable only with coin door opened 

-- 128     A                 - ?
-- 129     0100              - (08) bonus ship level
-- 133     03                - (09) nb ships
-- 135     03                - (10) coinage select
-- 137     01                - (11) left coin mult
-- 139     04                - (12) center coin mult
-- 141     01                - (13) right coin mult
-- 143     01                - (14) coins for credit
-- 145     00                - (15) coins for bonus
-- 147     00                - (16) minimum coins
-- 149     00                - (17) free play
-- 151     05                - (18) game adjust 1  Stating difficulty 0=lib; 1=mod; 2=cons
-- 153     15                - (19) game adjust 2  Progessive wave diff. limit > 4-25
-- 155     01                - (20) game adjust 3  Background sound 0=off; 1=on
-- 157     05                - (21) game adjust 4  Planet restore wave number
-- 159     00                - (22) game adjust 5
-- 161     00                - (23) game adjust 6
-- 163     00                - (24) game adjust 7
-- 165     00                - (25) game adjust 8
-- 167     00                - (26) game adjust 9
-- 169     00                - (27) game adjust 10

-- 171     00000             - ?
-- 176     0000000000000000  - ?
-- 192     0000000000000000  - ?
--	208     0000000000000000  - ?
--	224     0000000000000000  - ?
--	240     0000000000000000  - ?

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity defender is
port(
 clk_sys        : in  std_logic;
 clock_6     	  : in  std_logic;
 clk_0p89       : in  std_logic;
 reset          : in  std_logic;
 video_r        : out std_logic_vector(2 downto 0);
 video_g        : out std_logic_vector(2 downto 0);
 video_b        : out std_logic_vector(1 downto 0);
 video_csync    : out std_logic;
 video_blankn   : out std_logic;
 video_hs       : out std_logic;
 video_vs       : out std_logic;
 audio_out      : out std_logic_vector( 7 downto 0);
 
 mayday         : in  std_logic; -- Mayday protection
 input0         : in  std_logic_vector( 7 downto 0);
 input1         : in  std_logic_vector( 7 downto 0);
 input2         : in  std_logic_vector( 7 downto 0);

 cmd_select_players_btn : out std_logic;

 roms_addr   		: out std_logic_vector(14 downto 0);
 roms_do     		: in  std_logic_vector( 7 downto 0);
 vma       			: out std_logic;
 snd_addr       : out std_logic_vector(11 downto 0);
 snd_do         : in  std_logic_vector( 7 downto 0);
 snd_vma        : out std_logic;

 dl_clock       : in  std_logic;
 dl_addr        : in  std_logic_vector(15 downto 0);
 dl_data        : in  std_logic_vector( 7 downto 0);
 dl_wr          : in  std_logic;
 up_data        : out std_logic_vector(7 downto 0);
 cmos_wr        : in std_logic
);
end defender;

architecture struct of defender is

 signal reset_n: std_logic;
 signal clock_div : std_logic_vector(1 downto 0);

 signal clock_6n  : std_logic;
 signal cpu_a      : std_logic_vector(15 downto 0);
 signal cpu_addr   : std_logic_vector(15 downto 0);
 signal cpu_di     : std_logic_vector( 7 downto 0);
 signal cpu_do     : std_logic_vector( 7 downto 0);
 signal cpu_rw     : std_logic;
 signal cpu_irq    : std_logic;

 signal wram_addr  : std_logic_vector(13 downto 0);
 signal wram_we    : std_logic;
 signal wram0_do   : std_logic_vector( 7 downto 0);
 signal wram0_we   : std_logic;
 signal wram1_do   : std_logic_vector( 7 downto 0);
 signal wram1_we   : std_logic;
 signal wram2_do   : std_logic_vector( 7 downto 0);
 signal wram2_we   : std_logic;
 signal roms_io_do : std_logic_vector( 7 downto 0);

 signal io_we   : std_logic;
 signal io_CS   : std_logic;

 signal rom_page : std_logic_vector( 2 downto 0);
 signal rom_page_we : std_logic;
 
 signal screen_ctrl    : std_logic;
 signal screen_ctrl_we : std_logic;

 signal cmos_do   : std_logic_vector(3 downto 0);
 signal cmos_we   : std_logic;

 signal palette_addr : std_logic_vector(3 downto 0);
 signal palette_we : std_logic;
 signal palette_di : std_logic_vector( 7 downto 0);
 signal palette_do : std_logic_vector( 7 downto 0);
 
 signal pias_clock  : std_logic;
 
-- pia io port a
--      bit 0  Fire
--      bit 1  Thrust
--      bit 2  Smart Bomb
--      bit 3  HyperSpace
--      bit 4  2 Players
--      bit 5  1 Player
--      bit 6  Reverse
--      bit 7  Down

-- pia io port b
--      bit 0  Up
--      bit 7  1 for coktail table, 0 for upright cabinet
--      other <= GND

-- pia io ca/cb
--      ca1, ca2, cb1 <= GND
--      cb2  ouput + w2_jumper => select player 1/2 buttons for COCktail table
 
 signal pia_io_CS     : std_logic;
 signal pia_io_rw_n   : std_logic;
 signal pia_io_do     : std_logic_vector( 7 downto 0);
 signal pia_io_pa_i   : std_logic_vector( 7 downto 0);
 signal pia_io_pb_i   : std_logic_vector( 7 downto 0);
 signal pia_io_cb2_o  : std_logic;
 
-- pia rom board port a
--      bit 0  Auto Up / manual Down
--      bit 1  Advance
--      bit 2  Right Coin (nc)
--      bit 3  High Score Reset
--      bit 4  Left Coin
--      bit 5  Center Coin (nc)
--      bit 6  led 2 (output)
--      bit 7  led 1 (output)

-- pia rom board port b
--      bit 0-5 to sound board (output)
--      bit 6  led 4 (output)
--      bit 7  led 3 (output)

-- pia rom board ca/cb
--      ca1 count 240
--      ca2 coin door pin 7 (nc) 
--      cb1 4ms
--      cb2 sound board pin 8 (H5-nc)
 
 signal pia_ROM_CS    : std_logic;
 signal pia_rom_rw_n  : std_logic;
 signal pia_rom_do    : std_logic_vector( 7 downto 0);
 signal pia_rom_irqa  : std_logic;
 signal pia_rom_irqb  : std_logic;
 signal pia_rom_pa_i  : std_logic_vector( 7 downto 0);
 signal pia_rom_pa_o  : std_logic_vector( 7 downto 0);
 signal pia_rom_pb_o  : std_logic_vector( 7 downto 0);
 
 signal vcnt_240 : std_logic;
 signal cnt_4ms  : std_logic;
 
 signal cpu_to_video_addr : std_logic_vector(8 downto 0);
 signal cpu_to_video_do : std_logic_vector(7 downto 0);

 signal video_scan_addr : std_logic_vector(8 downto 0);
 signal video_scan_do : std_logic_vector(7 downto 0); 

 signal pixel_cnt : std_logic_vector(2 downto 0);
 signal hcnt : std_logic_vector(5 downto 0);
 signal vcnt : std_logic_vector(8 downto 0);

 signal pixels : std_logic_vector(23 downto 0);
 
 signal hsync0,hsync1,hsync2,csync,hblank,vblank : std_logic;
 
 signal select_sound : std_logic_vector(5 downto 0);
 signal cpu_ce  : std_logic;

 signal cpu_video_addr_decoder_we  : std_logic;
 signal video_scan_addr_decoder_we : std_logic;

begin

clock_6n  <= not clock_6;
reset_n   <= not reset;
		
		
-- make pixels counters and cpu clock
-- in original hardware cpu clock = 1us = 6pixels
-- here one make 2 cpu clock within 1us
process (reset, clock_6n)
begin
	if reset='1' then
		pixel_cnt <= "000";
	else 
		if rising_edge(clock_6n) then
		
			if pixel_cnt = "101" then
				pixel_cnt <= "000";
			else
				pixel_cnt <= pixel_cnt + '1';
			end if;	
		end if;
	end if;
end process;

-- make hcnt and vcnt video scanner from pixel clocks and counts
-- 
--  pixels   |0|1|2|3|4|5|0|1|2|3|4|5|
--  hcnt     |     N     |  N+1      | 
--
--  hcnt [0..63] => 64 x 6 = 384 pixels,  1 pixel is 1us => 1 line is 64us (15.625KHz)
--  vcnt [252..255,256..511] => 260 lines, 1 frame is 260 x 64us = 16.640ms (60.1Hz)
--
process (reset, clock_6n)
begin
	if reset='1' then
		hcnt <= "000000";
		vcnt <= '0'&X"FC";
	else 
		if rising_edge(clock_6n) then
		
			if pixel_cnt = "101" then
				hcnt <= hcnt + '1';
				if hcnt = "111111" then
					if vcnt = '1'&X"FF" then
						vcnt <= '0'&X"FC";
					else
						vcnt <= vcnt + '1';
					end if;
				end if;
			end if;
									
		end if;
	end if;
end process;

-- rom address multiplexer
-- should reflect content of defender_prog.bin
--
-- 4k 0000-0FFF  cpu_space D000-DFFF defend.1 + defend.4  
-- 4k 1000-1FFF            E000-EFFF defend.2
-- 4k 2000-2FFF            F000-FFFF defend.3
-- 4k 3000-3FFF  page=1    C000-CFFF defend.9 + defend.12 
-- 4k 4000-4FFF  page=2    C000-CFFF defend.8 + defend.11 
-- 4k 5000-5FFF  page=3    C000-CFFF defend.7 + defend.10 
-- 4k 6000-6FFF  page=7    C000-C7FF defend.6 + 2k empty
-- 4k 7000-7FFF            N.A       4k empty

roms_addr <= 
	"011" & cpu_addr(11 downto 0) when cpu_addr(15 downto 12) = X"C" and rom_page = "001" else 
	"100" & cpu_addr(11 downto 0) when cpu_addr(15 downto 12) = X"C" and rom_page = "010" else 
	"101" & cpu_addr(11 downto 0) when cpu_addr(15 downto 12) = X"C" and rom_page = "011" else 
	"110" & cpu_addr(11 downto 0) when cpu_addr(15 downto 12) = X"C" and rom_page = "111" else 
	"000" & cpu_addr(11 downto 0) when cpu_addr(15 downto 12) = X"D" else 
	"001" & cpu_addr(11 downto 0) when cpu_addr(15 downto 12) = X"E" else 
	"010" & cpu_addr(11 downto 0) ;--when cpu_addr(15 downto 12) = X"F";

-- encoded cpu addr (decoder.2) and encoded scan addr (decoder.3)
-- and screen control for cocktail table flip
cpu_to_video_addr <= screen_ctrl & cpu_addr(15 downto 8);
video_scan_addr   <= screen_ctrl & vcnt(7 downto 0);

-- mux cpu addr/scan addr to wram
wram_addr <= 
	cpu_addr(7 downto 0) & cpu_to_video_do(5 downto 0) when cpu_ce = '1' else
	video_scan_do & hcnt;	

--	mux cpu addr/pixels data to palette addr
palette_addr <=
	cpu_addr(3 downto 0) when palette_we = '1' else 
	pixels(23 downto 20) when screen_ctrl = '0' else pixels(3 downto 0);

-- only cpu can write to palette	
palette_di <= cpu_do;

-- palette output to colors bits
video_r <= palette_do(2 downto 0);
video_g <= palette_do(5 downto 3);
video_b <= palette_do(7 downto 6);
	

-- 24 bits pixels shift register
-- 6 pixels of 4 bits
process (clock_6) 
begin
	if rising_edge(clock_6) then 
		if screen_ctrl = '0' then
			if pixel_cnt = "001" then
				pixels <= wram0_do & wram1_do & wram2_do;
			else
				pixels <= pixels(19 downto 0) & X"0" ;		
			end if;
		else
			if pixel_cnt = "001" then
				pixels <= wram2_do & wram1_do & wram0_do;
			else
				pixels <= X"0" & pixels(23 downto 4);		
			end if;
		end if;
	end if;
end process;

-- pias cs
io_cs   <=      '1' when cpu_ce = '1' and cpu_addr(15 downto 12) = X"C" and rom_page ="000" else '0'; 	
pia_rom_cs <=   '1' when io_cs = '1' and cpu_addr(11 downto 10) = "11" and cpu_addr(2) = '0' else '0'; -- CC00-CC03
pia_io_cs <=    '1' when io_cs = '1' and cpu_addr(11 downto 10) = "11" and cpu_addr(2) = '1' else '0'; -- CC04-CC07
	
-- write enables
wram_we <=        '1' when cpu_rw = '0' and cpu_ce = '1' and cpu_addr(15 downto 12) < X"C" else '0';
io_we   <=        '1' when cpu_rw = '0' and cpu_ce = '1' and cpu_addr(15 downto 12) = X"C" and rom_page ="000" else '0'; 	
rom_page_we <=    '1' when cpu_rw = '0' and cpu_ce = '1' and cpu_addr(15 downto 12) = X"D" else '0';

palette_we <=     '1' when io_we = '1' and cpu_addr(11 downto 10) = "00" and cpu_addr(4) = '0' else '0'; -- C000-C00F
screen_ctrl_we <= '1' when io_we = '1' and cpu_addr(11 downto 10) = "00" and cpu_addr(4) = '1' else '0'; -- C010-C01F
cmos_we <=        '1' when io_we = '1' and cpu_addr(11 downto 10) = "01"                       else '0'; -- C400-C7FF
pia_rom_rw_n <=   '0' when io_we = '1' and cpu_addr(11 downto 10) = "11" and cpu_addr(2) = '0' else '1'; -- CC00-CC03
pia_io_rw_n <=    '0' when io_we = '1' and cpu_addr(11 downto 10) = "11" and cpu_addr(2) = '1' else '1'; -- CC04-CC07

-- mux io data between cmos/video register/pias/c000_rom_page
roms_io_do <= 
	X"0"&cmos_do          when rom_page = "000" and cpu_addr(11 downto 10) = "01" else -- C400-C7FF
	vcnt(7 downto 2)&"00" when rom_page = "000" and cpu_addr(11 downto 10) = "10" else -- C800-cBFF
	pia_rom_do            when rom_page = "000" and cpu_addr(11 downto 10) = "11" and cpu_addr(2) = '0' else -- CC00-CC03 (A2n.A3n.A4n)
	pia_io_do             when rom_page = "000" and cpu_addr(11 downto 10) = "11" and cpu_addr(2) = '1' else -- CC04-CC07 (A2.A3n)
	roms_do;

-- mux cpu in data between roms/io/wram
cpu_di <=
	roms_do    when cpu_addr(15 downto 12) >= X"D" else
	roms_io_do when cpu_addr(15 downto 12) >= X"C" else
	wram0_do   when cpu_to_video_do(7 downto 6)  = "00" else
	wram1_do   when cpu_to_video_do(7 downto 6)  = "01" else
	wram2_do   when cpu_to_video_do(7 downto 6)  = "10" else X"00";

	
-- dispatch cpu we to devices with respect to decoder2 bits 7-6
wram0_we  <= '1' when wram_we = '1' and cpu_to_video_do(7 downto 6)  = "00" else '0';
wram1_we  <= '1' when wram_we = '1' and cpu_to_video_do(7 downto 6)  = "01" else '0';
wram2_we  <= '1' when wram_we = '1' and cpu_to_video_do(7 downto 6)  = "10" else '0';


-- rom bank page (and IO) select register
-- screen control register
process (reset, clock_6) 
begin
 if reset='1' then
	rom_page <= "000";
	screen_ctrl <= '0';
 else 
  if rising_edge(clock_6) then 
		if rom_page_we = '1' then rom_page <= cpu_do(2 downto 0); end if;
		if screen_ctrl_we = '1' then screen_ctrl <= cpu_do(0); end if;
  end if;
 end if;
end process;

pias_clock <= clock_6; --not cpu_clock;
pia_rom_pa_i <= input0;
pia_io_pa_i  <= input1;
pia_io_pb_i  <= input2;

-- pia io ca/cb
cmd_select_players_btn <= pia_io_cb2_o; 

-- pia rom ca1/Cb1
vcnt_240 <= '1' when vcnt(7 downto 4) = X"F" else '0';
cnt_4ms  <= vcnt(5);

-- pia rom irqs to cpu
cpu_irq  <= pia_rom_irqa or pia_rom_irqb;

-- pia rom to sound board
select_sound <= pia_rom_pb_o(5 downto 0);

cpu_ce <= '1' when pixel_cnt = "100" or pixel_cnt = "010" else '0';

-- microprocessor 6809
main_cpu : entity work.cpu09
port map(	
	clk      => clock_6,  -- E clock input (falling edge)
	ce       => cpu_ce,
	rst      => reset,    -- reset input (active high)
	vma      => vma,     -- valid memory address (active high)
	lic_out  => open,     -- last instruction cycle (active high)
	ifetch   => open,     -- instruction fetch cycle (active high)
	opfetch  => open,     -- opcode fetch (active high)
	ba       => open,     -- bus available (high on sync wait or DMA grant)
	bs       => open,     -- bus status (high on interrupt or reset vector fetch or DMA grant)
	addr     => cpu_a,    -- address bus output
	rw       => cpu_rw,   -- read not write output
	data_out => cpu_do,   -- data bus output
	data_in  => cpu_di,   -- data bus input
	irq      => cpu_irq,  -- interrupt request input (active high)
	firq     => '0',      -- fast interrupt request input (active high)
	nmi      => '0',      -- non maskable interrupt request input (active high)
	halt     => '0'      -- not cpu_ce -- hold input (active high) extend bus cycle
--	hold     => '0'--not cpu_ce -- hold input (active high) extend bus cycle
);

-- Mayday protection.
cpu_addr <= cpu_a   when mayday = '0' else
            x"A193" when cpu_rw = '1' and cpu_a = x"A190" else
            x"A194" when cpu_rw = '1' and cpu_a = x"A191" else
            cpu_a;

-- cpu program rom
-- 4k D000-DFFF
-- 4k E000-EFFF
-- 4k F000-FFFF
-- 4K C000-CFFF page=1
-- 4K C000-CFFF page=2
-- 4K C000-CFFF page=3
-- 2K C000-C7FF page=7
-- 6K N.A. 



--cpu_prog_rom : entity work.defender_prog
--port map(
-- clk  => clock_6,
-- addr => roms_addr(14 downto 0),
-- data => roms_do
--);

-- cpu/video wram 0
cpu_video_ram0 : entity work.gen_ram
generic map( dWidth => 8, aWidth => 14)
port map(
 clk  => clock_6,
 we   => wram0_we,
 addr => wram_addr(13 downto 0),
 d    => cpu_do,
 q    => wram0_do
);

-- cpu/video wram 1
cpu_video_ram1 : entity work.gen_ram
generic map( dWidth => 8, aWidth => 14)
port map(
 clk  => clock_6,
 we   => wram1_we,
 addr => wram_addr(13 downto 0),
 d    => cpu_do,
 q    => wram1_do
);

-- cpu/video wram 2
cpu_video_ram2 : entity work.gen_ram
generic map( dWidth => 8, aWidth => 14)
port map(
 clk  => clock_6,
 we   => wram2_we,
 addr => wram_addr(13 downto 0),
 d    => cpu_do,
 q    => wram2_do
);

-- palette ram 
palette_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 4)
port map(
 clk  => clock_6,
 we   => palette_we,
 addr => palette_addr,
 d    => palette_di,
 q    => palette_do
);

-- cmos ram 
cmos_ram : entity work.dpram
generic map( dWidth => 4, aWidth => 8)
port map(
 clk_a  => clock_6,
 we_a   => cmos_we,
 addr_a => cpu_addr(7 downto 0),
 d_a    => cpu_do(3 downto 0),
 q_a    => cmos_do,
 clk_b  => dl_clock,
 we_b   => cmos_wr,
 addr_b => dl_addr(7 downto 0),
 d_b    => dl_data(3 downto 0),
 q_b    => up_data(3 downto 0)
);

-- cpu to video addr decoder
cpu_video_addr_decoder : entity work.dpram
generic map( dWidth => 8, aWidth => 9)
port map(
 clk_a  => clock_6,
 addr_a => cpu_to_video_addr,
 q_a    => cpu_to_video_do,
 clk_b  => dl_clock,
 we_b   => cpu_video_addr_decoder_we,
 addr_b => dl_addr(8 downto 0),
 d_b    => dl_data
);
cpu_video_addr_decoder_we <= '1' when dl_wr = '1' and dl_addr(15 downto 9) = x"7"&"000" else '0'; -- 7000-71FF

-- video scan addr decoder
video_scan_addr_decoder : entity work.dpram
generic map( dWidth => 8, aWidth => 9)
port map(
 clk_a  => clock_6,
 addr_a => video_scan_addr,
 q_a    => video_scan_do,
 clk_b  => dl_clock,
 we_b   => video_scan_addr_decoder_we ,
 addr_b => dl_addr(8 downto 0),
 d_b    => dl_data
);
video_scan_addr_decoder_we <= '1' when dl_wr = '1' and dl_addr(15 downto 9) = x"7"&"001" else '0'; -- 7200-73FF

-- pia i/O board
pia_io : entity work.pia6821
port map
(	
	clk       	=> pias_clock,            -- rising edge
	rst       	=> reset,                 -- active high
	cs        	=> pia_io_cs,
	rw        	=> pia_io_rw_n,           -- write low
	addr      	=> cpu_addr(1 downto 0),
	data_in   	=> cpu_do,
	data_out  	=> pia_io_do,
	irqa      	=> open,                  -- active high
	irqb      	=> open,                  -- active high
	pa_i      	=> pia_io_pa_i,
	pa_o        => open,
	pa_oe       => open,
	ca1       	=> '0',
	ca2_i      	=> '0',
	ca2_o       => open,
	ca2_oe      => open,
	pb_i      	=> pia_io_pb_i,
	pb_o        => open,
	pb_oe       => open,
	cb1       	=> '0',
	cb2_i      	=> '0',
	cb2_o       => pia_io_cb2_o,
	cb2_oe      => open
);

-- pia rom board
pia_rom : entity work.pia6821
port map
(	
	clk       	=> pias_clock,
	rst       	=> reset,
	cs        	=> pia_rom_cs,
	rw        	=> pia_rom_rw_n,
	addr      	=> cpu_addr(1 downto 0),
	data_in   	=> cpu_do,
	data_out  	=> pia_rom_do,
	irqa      	=> pia_rom_irqa,
	irqb      	=> pia_rom_irqb,
	pa_i      	=> pia_rom_pa_i,
	pa_o        => open,
	pa_oe       => open,
	ca1       	=> vcnt_240,
	ca2_i      	=> '0',
	ca2_o       => open,
	ca2_oe      => open,
	pb_i      	=> (others => '0'),
	pb_o        => pia_rom_pb_o,
	pb_oe       => open,
	cb1       	=> cnt_4ms,
	cb2_i      	=> '0',
	cb2_o       => open,
	cb2_oe      => open
);

-- video syncs and blanks
video_csync <= csync;

process(clock_6n)
	constant hcnt_base : integer := 54;
	variable vsync_cnt : std_logic_vector(3 downto 0);
begin

if rising_edge(clock_6n) then

  if    hcnt = hcnt_base+0 then hsync0 <= '0';
  elsif hcnt = hcnt_base+6 then hsync0 <= '1';
  end if;

  if    hcnt = hcnt_base+0     then hsync1 <= '0';
  elsif hcnt = hcnt_base+3     then hsync1 <= '1';
  elsif hcnt = hcnt_base+32-64 then hsync1 <= '0';
  elsif hcnt = hcnt_base+35-64 then hsync1 <= '1';
  end if;

  if    hcnt = hcnt_base+0        then hsync2 <= '0';
  elsif hcnt = hcnt_base+32-3-64  then hsync2 <= '1';
  elsif hcnt = hcnt_base+32-64    then hsync2 <= '0';
  elsif hcnt = hcnt_base+64-3-128 then hsync2 <= '1';
  end if;
  
  if hcnt = 63 and pixel_cnt = 5 then
	 if vcnt = 495 then                     -- 503 with vcnt max = F4
	   vsync_cnt := X"0";                   -- 499 with F8, 495 with FC
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

  if    hcnt = hcnt_base-2     then hblank <= '1'; 
  elsif hcnt = hcnt_base+12-64 then hblank <= '0';
  end if;

  if    vcnt = 502 then vblank <= '1';   -- 492 ok
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

-- sound board
defender_sound_board : entity work.defender_sound_board
port map(
 clk_0p89      => clk_0p89,
 reset         => reset,
 select_sound  => select_sound,
 audio_out     => audio_out,
 rom_addr      => snd_addr,
 rom_do        => snd_do,
 rom_vma       => snd_vma
);

end struct;