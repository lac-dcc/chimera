---------------------------------------------------------------------------------
-- Williams by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
-- https://sourceforge.net/projects/darfpga/files
-- github.com/darfpga
---------------------------------------------------------------------------------
-- gen_ram.vhd & io_ps2_keyboard
-------------------------------- 
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
---------------------------------------------------------------------------------
-- mc6809 
-- Cycle-Accurate 6809 Core 
-- Copyright (c) 2016, Greg Miller
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
-- Version 0.0 -- 05/02/2022 -- 
--		    initial version
---------------------------------------------------------------------------------
--  Features :
--   TV 15KHz mode only (atm)
--   Cocktail mode : todo
-- 
--  Use with MAME roms from tshoot.zip
--
---------------------------------------------------------------------------------
--  Use make_tshoot_proms.bat to build vhd file and bin from binaries
--  Load sdram with external rom bank -sdram_loader_de10_lite.sof-
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
-- see turkey shoot settings whithin tshoot_cmos_ram.vhd
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity williams2 is
port(
 clock_12      : in std_logic;
 reset         : in std_logic;
 hwsel         : in std_logic_vector(1 downto 0);

 rom_addr      : buffer std_logic_vector(17 downto 0);
 rom_do        : in  std_logic_vector( 7 downto 0);
 rom_rd        : out std_logic;
 gfx_rom_addr  : out std_logic_vector(13 downto 0);
 gfx_rom_do    : in  std_logic_vector(31 downto 0);
 snd_rom_addr  : out std_logic_vector(12 downto 0);
 snd_rom_do    : in  std_logic_vector( 7 downto 0);
 snd2_rom_addr : out std_logic_vector(16 downto 0);
 snd2_rom_do   : in  std_logic_vector( 7 downto 0);

 video_r       : out std_logic_vector(3 downto 0);
 video_g       : out std_logic_vector(3 downto 0);
 video_b       : out std_logic_vector(3 downto 0);
 video_i       : out std_logic_vector(3 downto 0);
 video_csync   : out std_logic;
 video_blankn  : out std_logic;
 video_hs      : out std_logic;
 video_vs      : out std_logic;

 audio_left    : out unsigned(16 downto 0);
 audio_right   : out unsigned(16 downto 0);

 input1        : in  std_logic_vector(7 downto 0);
 input2        : in  std_logic_vector(7 downto 0);
 input_sel     : out std_logic;

 btn_auto_up          : in std_logic;
 btn_advance          : in std_logic; 
 btn_high_score_reset : in std_logic;
 btn_coin      : in std_logic;

 cnt_4ms_o     : out std_logic;

 sw_coktail_table : in std_logic;
 seven_seg : out std_logic_vector( 7 downto 0);

 dl_clock       : in  std_logic;
 dl_addr        : in  std_logic_vector(15 downto 0);
 dl_data        : in  std_logic_vector( 7 downto 0);
 dl_wr          : in  std_logic;
 up_data        : out std_logic_vector(7 downto 0);
 cmos_wr        : in std_logic
);
end williams2;

architecture struct of williams2 is
	component mc6809is is
	port (
		CLK      : in  std_logic;
		fallE_en : in  std_logic;
		fallQ_en : in  std_logic;
		D        : in  std_logic_vector( 7 downto 0);
		Dout     : out std_logic_vector( 7 downto 0);
		ADDR     : out std_logic_vector(15 downto 0);
		RnW      : out std_logic;
		BS       : out std_logic;
		BA       : out std_logic;
		nIRQ     : in  std_logic := '1';
		nFIRQ    : in  std_logic := '1';
		nNMI     : in  std_logic := '1';
		AVMA     : out std_logic;
		BUSY     : out std_logic;
		LIC      : out std_logic;
		nHALT    : in  std_logic := '1';
		nRESET   : in  std_logic := '1';
		nDMABREQ : in  std_logic := '1'
	);
	end component mc6809is;
 
 constant HW_TSHOOT : std_logic_vector(1 downto 0) := "00";
 constant HW_JOUST2 : std_logic_vector(1 downto 0) := "01";
 constant HW_INFERNO : std_logic_vector(1 downto 0) := "10";
 constant HW_MYSTICM : std_logic_vector(1 downto 0) := "11";

 signal en_pixel     : std_logic := '0'; 
 signal video_access : std_logic;
 signal graph_access : std_logic;

 signal color_cs     : std_logic;
 signal rom_bank_cs  : std_logic;
 
 signal en_cpu     : std_logic := '0';
 signal cpu_addr   : std_logic_vector(15 downto 0);
 signal cpu_di     : std_logic_vector( 7 downto 0);
 signal cpu_do     : std_logic_vector( 7 downto 0);
 signal cpu_rw_n   : std_logic;
 signal cpu_irq    : std_logic;
 signal cpu_firq   : std_logic;

 signal addr_bus      : std_logic_vector(15 downto 0);
 signal data_bus_high : std_logic_vector( 7 downto 0);
 signal data_bus_low  : std_logic_vector( 7 downto 0);
 signal data_bus      : std_logic_vector( 7 downto 0);
 signal we_bus        : std_logic;

 signal decod_addr : std_logic_vector( 8 downto 0);
 signal decod_do   : std_logic_vector( 7 downto 0);

 signal vram_addr    : std_logic_vector(13 downto 0);
 signal vram_cs      : std_logic;
 signal vram_we      : std_logic;
 signal vram_l0_do   : std_logic_vector( 3 downto 0);
 signal vram_l0_we   : std_logic;
 signal vram_h0_do   : std_logic_vector( 3 downto 0);
 signal vram_h0_we   : std_logic;
 signal vram_l1_do   : std_logic_vector( 3 downto 0);
 signal vram_l1_we   : std_logic;
 signal vram_h1_do   : std_logic_vector( 3 downto 0);
 signal vram_h1_we   : std_logic;
 signal vram_l2_do   : std_logic_vector( 3 downto 0);
 signal vram_l2_we   : std_logic;
 signal vram_h2_do   : std_logic_vector( 3 downto 0);
 signal vram_h2_we   : std_logic;

 signal rom_addr_r   : std_logic_vector(17 downto 0);
 signal rom_bank_a_do   : std_logic_vector( 7 downto 0);
 signal rom_bank_b_do   : std_logic_vector( 7 downto 0);
 signal rom_bank_c_do   : std_logic_vector( 7 downto 0);
 signal rom_bank_d_do   : std_logic_vector( 7 downto 0);

 signal rom_prog1_do    : std_logic_vector( 7 downto 0);
 signal rom_prog2_do    : std_logic_vector( 7 downto 0);

 signal sram_cs        : std_logic;
 signal sram_we        : std_logic;
 signal sram_do        : std_logic_vector( 7 downto 0);

 signal page    : std_logic_vector( 2 downto 0);
 signal page_cs : std_logic;

 signal seven_seg_cs : std_logic;
 
 signal flip     : std_logic;
 signal flip_cs  : std_logic;
 signal flip_bg  : std_logic;
 signal flip_bg_a: std_logic;

 signal dma_inh_n  : std_logic;
 signal dma_inh_cs : std_logic;

 signal cmos_do   : std_logic_vector(3 downto 0);
 signal cmos_we   : std_logic;

 signal palette_addr  : std_logic_vector(9 downto 0);
 signal palette_lo_we : std_logic;
 signal palette_lo_do : std_logic_vector(7 downto 0);
 signal palette_hi_we : std_logic;
 signal palette_hi_do : std_logic_vector(7 downto 0);

 signal fg_color_bank   : std_logic_vector(5 downto 0);
 signal fg_color_bank_cs: std_logic;
 signal bg_color_bank   : std_logic_vector(5 downto 0);
 signal bg_color_bank_cs: std_logic;
 
 signal map_we          : std_logic;
 signal map_addr        : std_logic_vector(10 downto 0);
 signal map_do          : std_logic_vector( 7 downto 0);
 signal map_x           : std_logic_vector( 8 downto 0);
 signal xscroll_high_cs : std_logic;
 signal xscroll_low_cs  : std_logic;
 signal xscroll         : std_logic_vector(11 downto 0);
 signal xscroll_adj     : std_logic_vector( 2 downto 0);

 signal graph_addr : std_logic_vector(13 downto 0);
 signal graph1_do  : std_logic_vector( 7 downto 0);
 signal graph2_do  : std_logic_vector( 7 downto 0);
 signal graph3_do  : std_logic_vector( 7 downto 0);
  
 signal pias_clock  : std_logic;

 signal pia_io1_cs     : std_logic;
 signal pia_io1_do     : std_logic_vector( 7 downto 0);
 signal pia_io1_pa_i   : std_logic_vector( 7 downto 0);
 signal pia_io1_pb_i   : std_logic_vector( 7 downto 0);
 signal pia_io1_irqa   : std_logic;
 signal pia_io1_irqb   : std_logic;
 signal pia_io1_ca2_o  : std_logic;
 
 signal pia_io2_cs    : std_logic;
 signal pia_io2_do    : std_logic_vector( 7 downto 0);
 signal pia_io2_irqa  : std_logic;
 signal pia_io2_irqb  : std_logic;
 signal pia_io2_pa_i  : std_logic_vector( 7 downto 0);
 
 signal vcnt_240 : std_logic;
 signal cnt_4ms  : std_logic;
 
 signal pixel_cnt : std_logic_vector(2 downto 0) := "000";
 signal hcnt : std_logic_vector(5 downto 0) := "000000";
 signal vcnt : std_logic_vector(8 downto 0) := "000000000";

 signal fg_pixels   : std_logic_vector(23 downto 0);
 signal fg_pixels_0 : std_logic_vector( 3 downto 0);
 signal bg_pixels   : std_logic_vector(23 downto 0);
 signal bg_pixels_0 : std_logic_vector( 3 downto 0);
 signal bg_pixels_1 : std_logic_vector( 3 downto 0);
 signal bg_pixels_2 : std_logic_vector( 3 downto 0);
 signal bg_pixels_3 : std_logic_vector( 3 downto 0);
 signal bg_pixels_4 : std_logic_vector( 3 downto 0);
 signal bg_pixels_5 : std_logic_vector( 3 downto 0);
 signal bg_pixels_6 : std_logic_vector( 3 downto 0);
 signal bg_pixels_7 : std_logic_vector( 3 downto 0);
 signal bg_pixels_shifted : std_logic_vector(3 downto 0);
 
 signal hsync0,hsync1,hsync2,csync,hblank,vblank : std_logic;

 signal blit_cs     : std_logic;
 signal blit_has_bus: std_logic;
 signal blit_start  : std_logic;
 signal blit_cmd    : std_logic_vector( 7 downto 0);
 signal blit_color  : std_logic_vector( 7 downto 0);
 signal blit_src    : std_logic_vector(15 downto 0);
 signal blit_dst    : std_logic_vector(15 downto 0);
 signal blit_width  : std_logic_vector( 7 downto 0);
 signal blit_height : std_logic_vector( 7 downto 0);

 signal blit_go         : std_logic;
 signal blit_cur_src    : std_logic_vector(15 downto 0);
 signal blit_cur_dst    : std_logic_vector(15 downto 0);
 signal blit_cur_width  : std_logic_vector( 7 downto 0);
 signal blit_cur_height : std_logic_vector( 7 downto 0);
 signal blit_dst_ori    : std_logic_vector(15 downto 0);
 signal blit_src_ori    : std_logic_vector(15 downto 0);

 signal blit_rw_n     : std_logic := '1';
 signal blit_addr     : std_logic_vector(15 downto 0);
 signal blit_data     : std_logic_vector( 7 downto 0);
 signal blit_halt     : std_logic := '0';
 signal blit_wr_inh_h : std_logic := '0';
 signal blit_wr_inh_l : std_logic := '0';
 signal right_nibble  : std_logic_vector(3 downto 0);
 
 signal cpu_halt    : std_logic;
 signal cpu_ba      : std_logic;
 signal cpu_bs      : std_logic;
 
 signal sound_select : std_logic_vector(7 downto 0);
 signal sound_trig   : std_logic;
 signal sound_trig2  : std_logic;
 signal sound_ack    : std_logic;

 signal audio        : std_logic_vector( 7 downto 0);
 signal pia_audio    : std_logic_vector( 7 downto 0);
 signal speech_out   : std_logic_vector(15 downto 0);
 signal fm_left      : signed(15 downto 0);
 signal fm_right     : signed(15 downto 0);

 signal ic79_a   : std_logic_vector(3 downto 0);
 signal ic79_b   : std_logic_vector(3 downto 0);
 signal ic79_out : std_logic;
begin

-- make pixels counters and cpu clock
-- in original hardware cpu clock = 1us = 6pixels
-- here one make 2 cpu clock within 1us
process (reset, clock_12)
begin
	if rising_edge(clock_12) then
	
		en_pixel <= not en_pixel;
		en_cpu <= '0';
		video_access <= '0';
		graph_access <= '0';
		rom_rd <= '0';

		if pixel_cnt = "000" then en_cpu <= '1';       end if;
		if pixel_cnt = "001" then rom_rd <= '1';       end if;
		if pixel_cnt = "011" then video_access <= '1'; end if;			
		if pixel_cnt = "100" then graph_access <= '1'; end if;

		if en_pixel = '1' then 		
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
process (reset, clock_12)
begin
	if reset='1' then
		hcnt <= "000000";
		vcnt <= '0'&X"FC";
	else 
		if rising_edge(clock_12) then
		
			if (pixel_cnt = "101") and (en_pixel = '1' ) then
				hcnt <= hcnt + '1';
				if hcnt = "111101" then
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

-- mux cpu addr and blitter addr to bus addr
blit_has_bus <= '1' when cpu_halt = '1' and cpu_ba = '1' and cpu_bs = '1' else '0';
addr_bus <= blit_addr when blit_has_bus = '1' else cpu_addr;

-- decod bus addr to vram addr
decod_addr <= addr_bus(15 downto 13) &'0'& addr_bus(12 downto 8);
 
-- mux bus addr and video scanner to vram addr
vram_addr <= 
	addr_bus (7 downto 0) & decod_do(5 downto 0) when video_access = '0' else
	vcnt(7 downto 0) & hcnt;	

-- mux bus addr and video scanner to map ram addr
map_x <= (("000" & (hcnt(5 downto 0)+1)) + ('0' & xscroll(10 downto 3))) xor (xscroll(11) & x"00") ;
map_addr <=
	addr_bus(3 downto 0) & addr_bus(10 downto 4) when video_access = '0' else 
	vcnt(7 downto 4) & map_x(8 downto 2);

-- bg pixel delay
process (clock_12) 
begin
	if rising_edge(clock_12) then 
		if en_pixel = '0' then
			if flip_bg = '0' then 
				bg_pixels_0 <= bg_pixels(23 downto 20); 
			else 
				bg_pixels_0 <= bg_pixels( 3 downto  0);
			end if;
			bg_pixels_1 <= bg_pixels_0;
			bg_pixels_2 <= bg_pixels_1;
			bg_pixels_3 <= bg_pixels_2;
			bg_pixels_4 <= bg_pixels_3;
			bg_pixels_5 <= bg_pixels_4;
			bg_pixels_6 <= bg_pixels_5;
			bg_pixels_7 <= bg_pixels_6;
			
			if flip = '0' then 
				fg_pixels_0 <= fg_pixels(23 downto 20);
			else 
				fg_pixels_0 <= fg_pixels( 3 downto  0);
			end if;

		end if;
	end if;
end process;

xscroll_adj <= xscroll(2 downto 0) when hwsel = HW_TSHOOT else xscroll(2 downto 0) xor "111";
with xscroll_adj(2 downto 0) select
bg_pixels_shifted <= 
	bg_pixels_0 when "000",
	bg_pixels_1 when "001",
	bg_pixels_2 when "010",
	bg_pixels_3 when "011",
	bg_pixels_4 when "100",
	bg_pixels_5 when "101",
	bg_pixels_6 when "110",
	bg_pixels_7 when others;

-- ic79 74LS85 controls low background color bank bit w.r.t ligne number (vcnt)
ic79_a   <= bg_color_bank(0) & bg_color_bank(0) & "01";
ic79_b   <= "00"&vcnt(7)&vcnt(6);
ic79_out <= '1' when (ic79_a > ic79_b) or ((ic79_a = ic79_b) and (vcnt(5)='0')) else '0';

--	mux bus addr and pixels data to palette addr
palette_addr <=
	addr_bus(10 downto 1) when color_cs = '1' else 
	fg_color_bank & fg_pixels_0 when fg_pixels_0 /= x"0" else
	bg_color_bank(5 downto 0) & bg_pixels_shifted when hwsel = HW_JOUST2 else
	bg_color_bank(5 downto 3) & bg_color_bank(1) & bg_color_bank(2) & ic79_out & bg_pixels_shifted when hwsel = HW_MYSTICM else
	bg_color_bank(5 downto 3) & vcnt(7 downto 5) & bg_pixels_shifted;

-- palette output to colors bits
video_r <= palette_lo_do(3 downto 0);
video_g <= palette_lo_do(7 downto 4);
video_b <= palette_hi_do(3 downto 0);
video_i <= palette_hi_do(7 downto 4);

-- debug -- bypass palette
--video_r <= bg_pixels(23) & bg_pixels(22) & "00" when fg_pixels(23 downto 20) = x"0" else fg_pixels(23) & fg_pixels(22) & "00";
--video_g <= bg_pixels(21) & bg_pixels(21) & "00" when fg_pixels(23 downto 20) = x"0" else fg_pixels(21) & fg_pixels(21) & "00";
--video_b <= bg_pixels(20) & bg_pixels(20) & "00" when fg_pixels(23 downto 20) = x"0" else fg_pixels(20) & fg_pixels(20) & "00";
--video_i <= x"F";

---- 24 bits pixels shift register
---- 6 pixels of 4 bits
process (clock_12) 
begin
	if rising_edge(clock_12) then 
		if en_pixel = '0' then
--		if screen_ctrl = '0' then
			if video_access = '1' then
				fg_pixels <= vram_h0_do & vram_l0_do & vram_h1_do & vram_l1_do & vram_h2_do & vram_l2_do;
				-- map graphics address
				if hwsel = HW_JOUST2 then
					graph_addr <= map_do(7 downto 0) & vcnt(3 downto 0) & map_x(1) & map_x(0);         -- /!\ bit supplementaire
				else
					flip_bg_a <= map_do(7);
					if map_do(7) = '0' then
						graph_addr <= '0' & map_do(6 downto 0) & vcnt(3 downto 0) & map_x(1) & map_x(0);
					else
						graph_addr <= '0' & map_do(6 downto 0) & vcnt(3 downto 0) & not map_x(1) & not map_x(0);
					end if;
				end if;
			else
				fg_pixels <= fg_pixels(19 downto 0) & X"0" ;		
			end if;

			if graph_access = '1' then
				flip_bg <= flip_bg_a;
				bg_pixels <= graph1_do & graph2_do & graph3_do;
			else
				if flip_bg = '0' then 
					bg_pixels <= bg_pixels(19 downto 0) & X"0";
				else 
					bg_pixels <= X"0" & bg_pixels(23 downto 4);		
				end if;
			end if;
		else
		--end if;
		end if;
	end if;
end process;

pias_clock <= not clock_12;
pia_io1_pa_i <= input1;
pia_io1_pb_i <= input2; 
pia_io2_pa_i <= sw_coktail_table & "000" & btn_coin & btn_high_score_reset & btn_advance & btn_auto_up;
input_sel <= pia_io1_ca2_o;

-- video syncs to pia
vcnt_240  <= '1' when vcnt = '1'&X"F0" else '0';
cnt_4ms   <= vcnt(5);
cnt_4ms_o <= vcnt(5);

-- pia rom irqs to cpu
cpu_irq  <= pia_io1_irqa or pia_io1_irqb or pia_io2_irqa or pia_io2_irqb when hwsel = HW_TSHOOT else
            pia_io1_irqb or pia_io2_irqa or pia_io2_irqb when hwsel = HW_MYSTICM else
            pia_io2_irqa or pia_io2_irqb;
cpu_firq <= pia_io1_irqa when hwsel = HW_MYSTICM else '0';

-- chip select/we
we_bus  <= '1' when (cpu_rw_n = '0' or blit_rw_n = '0') and en_pixel = '1' and en_cpu = '1' else '0';

vram_cs <= '1' when color_cs = '0' and 
                    ( (blit_has_bus = '0' and (addr_bus < x"C000" or hwsel = HW_JOUST2)) or
                      (blit_has_bus = '1' and (addr_bus < x"9000" or (addr_bus >= x"C000" and hwsel = HW_TSHOOT) or dma_inh_n = '0'))) else '0';

color_cs         <= '1' when addr_bus(15 downto 12) = X"8" and page(1 downto 0) = "11" else '0'; -- 8000-8FFF & page 3
rom_bank_cs      <= '1' when addr_bus(15) = '0' and (page /= "000" and page /= "111")  else '0'; -- 0000-7000

blit_cs          <= '1' when addr_bus(15 downto  7) = X"C8"&'1'   else '0'; -- C880-C8FF ? TBC
page_cs          <= '1' when addr_bus(15 downto  7) = X"C8"&'0'   else '0'; -- C800-C87F
seven_seg_cs     <= '1' when addr_bus(15 downto  0) = X"C98C"     else '0'; -- C98C
fg_color_bank_cs <= '1' when addr_bus(15 downto  5) = X"CB"&"000" else '0'; -- CB00-CB1F
bg_color_bank_cs <= '1' when addr_bus(15 downto  5) = X"CB"&"001" else '0'; -- CB20-CB3F
xscroll_low_cs   <= '1' when addr_bus(15 downto  5) = X"CB"&"010" else '0'; -- CB40-CB5F
xscroll_high_cs  <= '1' when addr_bus(15 downto  5) = X"CB"&"011" else '0'; -- CB60-CB7F
flip_cs          <= '1' when cpu_addr(15 downto  5) = X"CB"&"100" else '0'; -- CB80-CB9F
dma_inh_cs       <= '1' when cpu_addr(15 downto  5) = X"CB"&"101" else '0'; -- CBA0-CBBF
pia_io2_cs       <= '1' when addr_bus(15 downto  7) = X"C9"&"1" and addr_bus(3 downto 2) = "00" else '0'; -- C980-C983
pia_io1_cs       <= '1' when addr_bus(15 downto  7) = X"C9"&"1" and addr_bus(3 downto 2) = "01" else '0'; -- C984-C987
sram_cs          <= '1' when addr_bus(15 downto 12) = X"D" and (hwsel = HW_INFERNO or hwsel = HW_MYSTICM) else '0'; -- D000-DFFF

palette_lo_we <= '1' when we_bus = '1' and color_cs = '1' and addr_bus(0) = '0' else '0';
palette_hi_we <= '1' when we_bus = '1' and color_cs = '1' and addr_bus(0) = '1' else '0';
map_we        <= '1' when we_bus = '1' and addr_bus(15 downto 11) = X"C"&'0'    else '0'; -- C000-C7FF
cmos_we       <= '1' when we_bus = '1' and addr_bus(15 downto 10) = x"C"&"11"   else '0'; -- CC00-CFFF
vram_we       <= '1' when we_bus = '1' and vram_cs = '1' else '0';
sram_we       <= '1' when we_bus = '1' and sram_cs = '1' else '0';

-- dispatch we to devices with respect to decoder bits 7-6 and blitter inhibit
vram_l0_we  <= '1' when vram_we = '1' and blit_wr_inh_l = '0' and decod_do(7 downto 6)  = "00" else '0';
vram_l1_we  <= '1' when vram_we = '1' and blit_wr_inh_l = '0' and decod_do(7 downto 6)  = "01" else '0';
vram_l2_we  <= '1' when vram_we = '1' and blit_wr_inh_l = '0' and decod_do(7 downto 6)  = "10" else '0';
vram_h0_we  <= '1' when vram_we = '1' and blit_wr_inh_h = '0' and decod_do(7 downto 6)  = "00" else '0';
vram_h1_we  <= '1' when vram_we = '1' and blit_wr_inh_h = '0' and decod_do(7 downto 6)  = "01" else '0';
vram_h2_we  <= '1' when vram_we = '1' and blit_wr_inh_h = '0' and decod_do(7 downto 6)  = "10" else '0';

-- mux banked rom address to external (d)ram
rom_addr <= rom_addr_r when (cpu_rw_n = '0' or blit_rw_n = '0') else
            "10000"&addr_bus(12 downto 0) when addr_bus(15 downto 13) = "111" else -- 8K
            "100010"&addr_bus(11 downto 0) when addr_bus(15 downto 12) = X"D" else -- 4K
            "000"&addr_bus(14 downto 0) when (page = "010"                ) else
            "001"&addr_bus(14 downto 0) when (page = "110"                ) else
            "010"&addr_bus(14 downto 0) when (page = "001" or page = "011") else
            "011"&addr_bus(14 downto 0) when (page = "100" or page = "101") else
            rom_addr_r;

process (clock_12)
begin
	if rising_edge(clock_12) then 
		rom_addr_r <= rom_addr;
	end if;
end process;

-- mux data bus between cpu/blitter/roms/io/vram
data_bus_high <=
	sram_do                 when sram_cs = '1' else -- 4K- D000-DFFF
	rom_do                  when addr_bus(15 downto 12) >= X"D" else
	--rom_prog2_do            when addr_bus(15 downto 12) >= X"E" else -- 8K
	--rom_prog1_do            when addr_bus(15 downto 12) >= X"D" else -- 4K	
	vcnt(7 downto 0)        when addr_bus(15 downto  4)  = X"CBE" else
	map_do                  when addr_bus(15 downto 11)  = X"C"&'0' else
	x"0"&cmos_do            when addr_bus(15 downto 10)  = X"C"&"11" else
	pia_io1_do              when pia_io1_cs = '1' else
	pia_io2_do              when pia_io2_cs = '1' else
	X"00";

data_bus_low <=
	palette_lo_do           when color_cs = '1' and addr_bus(0) = '0' else
	palette_hi_do           when color_cs = '1' and addr_bus(0) = '1' else	
	rom_do                  when rom_bank_cs = '1' else
--	rom_bank_a_do           when rom_bank_cs = '1' and (page = "010"                ) else
--	rom_bank_b_do           when rom_bank_cs = '1' and (page = "110"                ) else
--	rom_bank_c_do           when rom_bank_cs = '1' and (page = "001" or page = "011") else
--	rom_bank_d_do           when rom_bank_cs = '1' and (page = "100" or page = "101") else
	vram_h0_do & vram_l0_do when decod_do(7 downto 6)  = "00" else
	vram_h1_do & vram_l1_do when decod_do(7 downto 6)  = "01" else
	vram_h2_do & vram_l2_do when decod_do(7 downto 6)  = "10" else
	X"00";

data_bus <=
	cpu_do		  when cpu_rw_n = '0' else
	blit_data     when blit_rw_n = '0' else
	data_bus_low  when addr_bus(15 downto 12) < x"C" else
	data_bus_high;

process (clock_12)
begin
	if rising_edge(clock_12) then 
		cpu_di <= data_bus;
	end if;
end process;
	
-- misc. registers
process (reset, clock_12)
variable blit_h, blit_l : std_logic;
variable data: std_logic_vector(7 downto 0);
begin
	if reset='1' then
		page <= "000";
		seven_seg <= X"00";
		flip <= '0';
		dma_inh_n <='0';
		fg_color_bank <= (others => '0');
		bg_color_bank <= (others => '0');
	else 
		if rising_edge(clock_12) then 
			if page_cs = '1'          and we_bus = '1' then page          <= data_bus(2 downto 0); end if;
			if seven_seg_cs = '1'     and we_bus = '1' then seven_seg     <= data_bus; end if;
			if flip_cs = '1'          and we_bus = '1' then flip          <= data_bus(0); end if;
			if dma_inh_cs = '1'       and we_bus = '1' then dma_inh_n     <= data_bus(0); end if;
			if fg_color_bank_cs = '1' and we_bus = '1' then fg_color_bank <= data_bus(5 downto 0); end if;
			if bg_color_bank_cs = '1' and we_bus = '1' then bg_color_bank <= data_bus(5 downto 0); end if;
			if xscroll_low_cs = '1'   and we_bus = '1' then xscroll( 3 downto 0) <= data_bus(7) & data_bus(2 downto 0) ;end if;
			if xscroll_high_cs = '1'  and we_bus = '1' then xscroll(11 downto 4) <= data_bus; end if;
		end if;
	end if;
end process;

-- blitter registers
process (reset, clock_12)
variable blit_h, blit_l : std_logic;
variable data: std_logic_vector(7 downto 0);
begin
if reset='1' then
	blit_start  <= '0';
	blit_cmd    <= (others=>'0');
	blit_color  <= (others=>'0');
	blit_src    <= (others=>'0');
	blit_dst    <= (others=>'0');
	blit_width  <= (others=>'0');
	blit_height <= (others=>'0');
else 
	if rising_edge(clock_12) then 		
		if blit_cs = '1' and we_bus = '1' then
				case addr_bus(2 downto 0) is 
					when "000" => blit_cmd <= data_bus;
									  blit_start <= '1';
					when "001" => blit_color <= data_bus;
					when "010" => blit_src(15 downto 8) <= data_bus;
					when "011" => blit_src( 7 downto 0) <= data_bus;
					when "100" => blit_dst(15 downto 8) <= data_bus;
					when "101" => blit_dst( 7 downto 0) <= data_bus;
					when "110" =>
						if data_bus = X"00" then 
							blit_width <= x"00";
						else
							blit_width <= data_bus-1;
						end if;
					
					when "111" =>
						if data_bus = X"00" then 
							blit_height <= x"00";
						else
							blit_height <= data_bus-1;
						end if;
					when others => null;
				end case;
		end if;
		
		if blit_halt = '1' then 
			blit_start <= '0';
		end if;

	end if;
end if;
end process;

-- blitter - IC29-30
process (reset, clock_12)
variable blit_h, blit_l : std_logic;
variable data: std_logic_vector(7 downto 0);
begin
if reset='1' then
	blit_rw_n     <= '1';
 	cpu_halt      <= '0';
	blit_halt     <= '0';
	blit_wr_inh_h <= '0';
	blit_wr_inh_l <= '0';
else 
	if rising_edge(clock_12) then

		-- sync cpu_halt in the middle of cpu cycle
		if video_access = '1' then
			cpu_halt <= blit_halt;
		end if;

		--	intialize blit
		if blit_start = '1' and blit_halt = '0' and video_access = '1' then
			blit_halt <= '1';
			blit_cur_src <= blit_src;
			blit_src_ori <= blit_src;
			blit_cur_dst <= blit_dst;
			blit_dst_ori <= blit_dst;
			blit_cur_width <= blit_width;
			blit_cur_height <= blit_height;
			right_nibble <= x"0";
			blit_go <= '1';
			-- begin with read step
			blit_addr <= blit_src;
			blit_rw_n <= '1';
		end if;

		-- do blit
		if blit_has_bus = '1' then

			-- read step (use graph access)
			if graph_access = '1' and en_pixel = '0' and blit_go = '1' then

				-- next step will be write
				blit_addr <= blit_cur_dst;
				blit_rw_n <= '0';

				-- also prepare next source address w.r.t source stride
				if blit_cmd(0) = '0' then
					blit_cur_src <= blit_cur_src + 1;
				else
					if blit_cur_width = 0  then
						blit_cur_src <= blit_src_ori + 1;
						blit_src_ori <= blit_src_ori + 1;
					else
						blit_cur_src <= blit_cur_src + 256;
					end if;
				end if;

				-- get data from source and prepare data to be written
				blit_h := not blit_cmd(7);
				blit_l := not blit_cmd(6);

				-- right shift mode
				if blit_cmd(5) = '0' then
					data := data_bus;
				else
					data :=  right_nibble & data_bus(7 downto 4);
					right_nibble <= data_bus(3 downto 0);
				end if;

				-- transparent mode : don't write pixel if src = 0
				if blit_cmd(3) = '1' then
					if data(7 downto 4) = x"0" then blit_h := '0'; end if;
					if data(3 downto 0) = x"0" then blit_l := '0'; end if;
				end if;

				-- solid mode : write color instead of src data
				if blit_cmd(4) = '1' then
					data := blit_color;
				else
					data := data;
				end if;

				-- put data to written on bus with write inhibits
				blit_data <= data;
				blit_wr_inh_h <= not blit_h;
				blit_wr_inh_l <= not blit_l;

			end if;

			-- write step (use cpu access)
			if en_cpu = '1' and en_pixel = '0' and blit_go = '1' then
				-- next step will be read
				blit_addr <= blit_cur_src;
				blit_rw_n <= '1';

				-- also prepare next destination address w.r.t destination stride
				-- or stop blit
				if blit_cur_width = 0 then
					if blit_cur_height = 0 then
						-- end of blit
						blit_halt <= '0';
						blit_wr_inh_h <= '0';
						blit_wr_inh_l <= '0';
					else
						blit_cur_width <= blit_width;
						blit_cur_height <= blit_cur_height - 1;

						if blit_cmd(1) = '0' then
							blit_cur_dst <= blit_cur_dst + 1;
						else
							blit_cur_dst <= blit_dst_ori + 1;
							blit_dst_ori <= blit_dst_ori + 1;
						end if;

					end if;
				else
					blit_cur_width <= blit_cur_width - 1;

					if blit_cmd(1) = '0' then
						blit_cur_dst <= blit_cur_dst + 1;
					else
						blit_cur_dst <= blit_cur_dst + 256;
					end if;
				end if;
			end if;

			-- slow mode
			if en_cpu = '1' and en_pixel = '0' and blit_cmd(2) = '1' then
				blit_go <= not blit_go;
			end if;

		end if; -- cpu halted
	end if;
end if;
end process;

-- microprocessor 6809 -IC28
main_cpu : mc6809is
port map(
	CLK      => clock_12,
	fallE_en => en_cpu and not en_pixel,
	fallQ_en => en_cpu and en_pixel,
	D        => cpu_di,
	Dout     => cpu_do,
	ADDR     => cpu_addr,
	RnW      => cpu_rw_n,
	BS       => cpu_bs,
	BA       => cpu_ba,
	nIRQ     => not cpu_irq,
	nFIRQ    => not cpu_firq,
	nNMI     => '1',
	AVMA     => open,
	BUSY     => open,
	LIC      => open,
	nHALT    => not cpu_halt,
	nRESET   => not reset,
	nDMABREQ => '1'
);

-- cpu program roms - IC9-10-54
--prog1_rom : entity work.turkey_shoot_prog1
--port map(
-- clk  => clock_12,
-- addr => addr_bus(11 downto 0),
-- data => rom_prog1_do
--);
--
--prog2_rom : entity work.turkey_shoot_prog2
--port map(
-- clk  => clock_12,
-- addr => addr_bus(12 downto 0),
-- data => rom_prog2_do
--);


-- rom17.ic26 + rom15.ic24 
--bank_a_rom : entity work.turkey_shoot_bank_a
--port map(
-- clk  => clock_12,
-- addr => addr_bus(13 downto 0),
-- data => rom_bank_a_do
--);
--
---- rom16.ic25 + rom14.ic23 + rom13.ic21 + rom12.ic19 
--bank_b_rom : entity work.turkey_shoot_bank_b
--port map(
-- clk  => clock_12,
-- addr => addr_bus(14 downto 0),
-- data => rom_bank_b_do
--);

-- rom11.ic18 + rom9.ic16 + rom7.ic14 + rom5.ic12 
--bank_c_rom : entity work.turkey_shoot_bank_c
--port map(
-- clk  => clock_12,
-- addr => addr_bus(14 downto 0),
-- data => rom_bank_c_do
--);

-- rom10.ic17 + rom8.ic15 + rom6.ic13 + rom4.ic11
--bank_d_rom : entity work.turkey_shoot_bank_d
--port map(
-- clk  => clock_12,
-- addr => addr_bus(14 downto 0),
-- data => rom_bank_d_do
--);

gfx_rom_addr <= graph_addr(13 downto 0);
graph1_do <= gfx_rom_do(7 downto 0);
graph2_do <= gfx_rom_do(15 downto 8);
graph3_do <= gfx_rom_do(23 downto 16);

-- rom20.ic57
--graph1_rom : entity work.turkey_shoot_graph1
--port map(
-- clk  => clock_12,
-- addr => graph_addr(12 downto 0),
-- data => graph1_do
--);

---- rom20.ic58
--graph2_rom : entity work.turkey_shoot_graph2
--port map(
-- clk  => clock_12,
-- addr => graph_addr(12 downto 0),
-- data => graph2_do
--);
--
------ rom20.ic41
--graph3_rom : entity work.turkey_shoot_graph3
--port map(
-- clk  => clock_12,
-- addr => graph_addr(12 downto 0),
-- data => graph3_do
--);

-- cpu/video wram low 0 - IC102-105
cpu_video_ram_l0 : entity work.gen_ram
generic map( dWidth => 4, aWidth => 14)
port map(
 clk  => clock_12,
 we   => vram_l0_we,
 addr => vram_addr,
 d    => data_bus(3 downto 0),
 q    => vram_l0_do
);

-- cpu/video wram high 0 - IC98-101
cpu_video_ram_h0 : entity work.gen_ram
generic map( dWidth => 4, aWidth => 14)
port map(
 clk  => clock_12,
 we   => vram_h0_we,
 addr => vram_addr,
 d    => data_bus(7 downto 4),
 q    => vram_h0_do
);

-- cpu/video wram low 1 - IC110-113
cpu_video_ram_l1 : entity work.gen_ram
generic map( dWidth => 4, aWidth => 14)
port map(
 clk  => clock_12,
 we   => vram_l1_we,
 addr => vram_addr,
 d    => data_bus(3 downto 0),
 q    => vram_l1_do
);

-- cpu/video wram high 1 - IC106-109
cpu_video_ram_h1 : entity work.gen_ram
generic map( dWidth => 4, aWidth => 14)
port map(
 clk  => clock_12,
 we   => vram_h1_we,
 addr => vram_addr,
 d    => data_bus(7 downto 4),
 q    => vram_h1_do
);

-- cpu/video wram low 2 - IC118-121
cpu_video_ram_l2 : entity work.gen_ram
generic map( dWidth => 4, aWidth => 14)
port map(
 clk  => clock_12,
 we   => vram_l2_we,
 addr => vram_addr,
 d    => data_bus(3 downto 0),
 q    => vram_l2_do
);

-- cpu/video wram high 2 - IC115-117
cpu_video_ram_h2 : entity work.gen_ram
generic map( dWidth => 4, aWidth => 14)
port map(
 clk  => clock_12,
 we   => vram_h2_we,
 addr => vram_addr,
 d    => data_bus(7 downto 4),
 q    => vram_h2_do
);

-- palette rams - IC78-77
palette_ram_lo : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_12,
 we   => palette_lo_we,
 addr => palette_addr,
 d    => data_bus,
 q    => palette_lo_do
);

-- palette rams - IC76-75
palette_ram_hi : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_12,
 we   => palette_hi_we,
 addr => palette_addr,
 d    => data_bus,
 q    => palette_hi_do
);

-- map ram - IC40
map_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk  => clock_12,
 we   => map_we,
 addr => map_addr,
 d    => data_bus,
 q    => map_do
);

-- sram 0 & 1
sram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk  => clock_12,
 we   => sram_we,
 addr => addr_bus(11 downto 0),
 d    => data_bus,
 q    => sram_do
);

-- cmos ram - IC59
cmos_ram : entity work.dpram
generic map( dWidth => 4, aWidth => 10)
port map(
 clk_a  => clock_12,
 we_a   => cmos_we,
 addr_a => addr_bus(9 downto 0),
 d_a    => data_bus(3 downto 0),
 q_a    => cmos_do,
 clk_b  => dl_clock,
 we_b   => cmos_wr,
 addr_b => dl_addr(9 downto 0),
 d_b    => dl_data(3 downto 0),
 q_b    => up_data(3 downto 0)
);

-- addr bus to video addr decoder - IC60
video_addr_decoder : entity work.williams2_decoder
port map(
 clk  => clock_12,
 addr => decod_addr,
 data => decod_do
);

-- pia iO1 : ic6 (5C)
pia_io1 : entity work.pia6821
port map
(
	clk       	=> pias_clock,            -- rising edge
	rst       	=> reset,                 -- active high
	cs        	=> pia_io1_cs,
	rw        	=> cpu_rw_n,              -- write low
	addr      	=> addr_bus(1 downto 0),
	data_in   	=> cpu_do,
	data_out  	=> pia_io1_do,
	irqa      	=> pia_io1_irqa,          -- active high
	irqb      	=> pia_io1_irqb,          -- active high
	pa_i      	=> pia_io1_pa_i,
	pa_o        => open,
	pa_oe       => open,
	ca1       	=> vcnt_240,
	ca2_i      	=> '0',
	ca2_o       => pia_io1_ca2_o,
	ca2_oe      => open,
	pb_i      	=> pia_io1_pb_i,
	pb_o        => open,
	pb_oe       => open,
	cb1       	=> cnt_4ms,
	cb2_i      	=> '0',
	cb2_o       => open,
	cb2_oe      => open
);

-- pia iO2 : ic5 (2C)
pia_rom : entity work.pia6821
port map
(
	clk       	=> pias_clock,
	rst       	=> reset,
	cs        	=> pia_io2_cs,
	rw        	=> cpu_rw_n,
	addr      	=> addr_bus(1 downto 0),
	data_in   	=> cpu_do,
	data_out  	=> pia_io2_do,
	irqa      	=> pia_io2_irqa,
	irqb      	=> pia_io2_irqb,
	pa_i      	=> pia_io2_pa_i,
	pa_o        => open,
	pa_oe       => open,
	ca1       	=> cnt_4ms, --'0',
	ca2_i      	=> '0',
	ca2_o       => sound_trig2,
	ca2_oe      => open,
	pb_i      	=> (others => '0'),
	pb_o        => sound_select,
	pb_oe       => open,
	cb1       	=> sound_ack,
	cb2_i      	=> '0',
	cb2_o       => sound_trig,
	cb2_oe      => open
);

-- video syncs and blanks
video_csync <= csync;

process(clock_12)
	constant hcnt_base : integer := 52;
	variable vsync_cnt : std_logic_vector(3 downto 0);
begin

if rising_edge(clock_12) then

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
	 if vcnt = 502 then
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

  if    hcnt = 48 and pixel_cnt = 3 then hblank <= '1'; 
  elsif hcnt =  1 and pixel_cnt = 3 then hblank <= '0';
  end if;

  if    vcnt = 504 then vblank <= '1';
  elsif vcnt = 262 then vblank <= '0'; 
  end if;

  -- external sync and blank outputs
  video_blankn <= not (hblank or vblank);

  video_hs <= hsync0;

  if    vsync_cnt = 0 then video_vs <= '0';
  elsif vsync_cnt = 8 then video_vs <= '1';
  end if;

end if;
end process;

-- sound board - IC4-7-8-27
tshoot_sound_board : entity work.tshoot_sound_board
port map(
 clock_12   => clock_12,
 reset      => reset,
 sound_select  => sound_select,
 sound_trig    => sound_trig, 
 sound_ack     => sound_ack,
 audio_out     => audio,

 snd_rom_addr  => snd_rom_addr,
 snd_rom_do    => snd_rom_do
);

williams_cvsd_board : entity work.williams_cvsd_board
port map(
 clock_12   => clock_12,
 reset      => reset,

 sound_select  => sound_select,
 sound_trig    => sound_trig2,

 pia_audio     => pia_audio,
 speech_out    => speech_out,
 ym2151_left   => fm_left,
 ym2151_right  => fm_right,

 snd_rom_addr  => snd2_rom_addr,
 snd_rom_do    => snd2_rom_do
);

audio_left  <= "00000000000000000" + unsigned(audio&"00000") + unsigned(pia_audio&"00000") + unsigned(speech_out(15 downto 1)) + unsigned(not fm_left(15)&fm_left(14 downto 0));
audio_right <= "00000000000000000" + unsigned(audio&"00000") + unsigned(pia_audio&"00000") + unsigned(speech_out(15 downto 1)) + unsigned(not fm_right(15)&fm_right(14 downto 0));

end struct;