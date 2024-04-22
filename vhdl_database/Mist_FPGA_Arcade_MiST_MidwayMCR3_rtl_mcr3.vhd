---------------------------------------------------------------------------------
-- DDerby by Dar (darfpga@aol.fr) (22/11/2019)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
--
-- release rev 00 : initial release
--  (22/11/2019)
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
--   Video        : VGA 31Khz/60Hz progressive and TV 15kHz interlaced
--   Coctail mode : NO
--   Sound        : OK

--  Use with MAME roms from timber.zip
--
--  Use make_timber_proms.bat to build vhd file from binaries
--  (CRC list included)

--  Timber (midway mcr) Hardware caracteristics :
--
--  VIDEO : 1xZ80@3MHz CPU accessing its program rom, working ram,
--    sprite data ram, I/O, sound board register and trigger.
--		  56Kx8bits program rom
--
--    One char/background tile map 30x32
--      2x8Kx8bits graphics rom 4bits/pixel + 2 bit color set
--      rbg programmable ram palette 64 colors 9bits : 3red 3green 3blue
--
--    128 sprites, up to ~30/line, 32x32 with flip H/V
--      4x32Kx8bits graphics rom 4bits/pixel + 2 bit color set
--      rbg programmable ram palette 64 colors 9bits : 3red 3green 3blue 
--
--    Working ram : 2Kx8bits
--    video (char/background) ram  : 2Kx8bits
--    Sprites ram : 512x8bits + 512x8bits cache buffer

--    Sprites line buffer rams (graphics and colors) : 1 scan line delay flip/flop 2x256x16bits
--
--  SOUND : see tron_sound_board.vhd

---------------------------------------------------------------------------------
--  Schematics remarks :
--
--		Display is 512x480 pixels  (video 635x525 lines @ 20MHz )

--       635/20e6  = 31.75us per line  (31.750KHz)
--       31.75*525 = 16.67ms per frame (59.99Hz)
--        
--    Original video is interlaced 240 display lines per 1/2 frame
--
--       H0 and V0 are not use for background => each bg tile is 16x16 pixel but 
--			background graphics is 2x2 pixels defintion.
--
--			Sprite are 32x32 pixels with 1x1 pixel definition, 16 lines for odd 1/2
--       frame and 16 lines for even 2/2 frame thanks to V8 on sprite rom ROMAD2
--       (look at 74ls86 G1 pin 9 on video genration board schematics)
--
--    *H and V stand for Horizontal en Vertical counter (Hcnt, Vcnt in VHDL code)
--
--    /!\ For VHDL port interlaced video mode is replaced with progressive video 
--        mode.
--
--    Real hardware uses background ram access after each 1/2 frame (~line 240
--    and 480). In these areas cpu can access ram since scanlines are out of
--    visible display. In progessive mode there are video access around lines 240.
--    These accesses will create video artfacts aound mid display. In VHDL code
--    ram access is muliplexed between cpu and scanlines by using hcnt(0) in
--    order to avoid these artefacts.
--
--    Sprite data are stored first by cpu into a 'cache' buffer (staging ram at
--    K6/L6) this buffer is read and write for cpu. After visible display, cache
--    buffer (512x8) is moved to actual sprite ram buffer (512x8). Actual sprite
--    buffer is access by transfer address counter during 2 scanlines after 
--    visible area and only by sprite machine during visible area.
--
--    Thus cpu can read and update sprites position during entire frame except
--    during 2 lines.
-- 
--    Sprite data are organised (as seen by cpu F000-F1FF) into 128 * 4bytes.
--    bytes #1 : Vertical position
--    bytes #2 : code and attribute
--    bytes #3 : Horizontal position
--    bytes #4 : not used
--
--		Athough 1x1 pixel defintion sprite position horizontal/vertical is made on
--    on a 2x2 grid (due to only 8bits for position data)
--
--    Z80-CTC : interruption ar managed by CTC chip. ONly channel 3 is trigered
--    by hardware signal line 493. channel 0 to 2 are in timer mode. Schematic 
--    show zc/to of channel 0 connected to clk/trg of channel 1. This seems to be
--    unsued for that (Kick) game. 
--
--    Z80-CTC VHDL port keep separated interrupt controler and each counter so 
--    one can use them on its own. Priority daisy-chain is not done (not used in
--    that game). clock polarity selection is not done since it has no meaning
--    with digital clock/enable (e.g cpu_ena signal) method.
--
--    Ressource : input clock 40MHz is chosen to allow easy making of 20MHz for
--    pixel clock and 8MHz signal for amplitude modulation circuit of ssio board
--
--  TODO :
--    Working ram could be initialized to set initial difficulty level and
--    initial bases (live) number. Otherwise one can set it up by using service
--    menu at each power up.
--
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mcr3 is
port(
 clock_40       : in std_logic;
 reset          : in std_logic;
 tv15Khz_mode   : in std_logic;
 video_r        : out std_logic_vector(2 downto 0);
 video_g        : out std_logic_vector(2 downto 0);
 video_b        : out std_logic_vector(2 downto 0);
 video_clk      : out std_logic;
 video_csync    : out std_logic;
 video_blankn   : out std_logic;
 video_hs       : out std_logic;
 video_vs       : out std_logic;

 soundboard     : in  std_logic_vector(1 downto 0); -- Super Sound Board/Turbo Cheap Squeak/Sounds Good switch
 snd_stat       : out std_logic_vector(1 downto 0); -- sound board stat output
 audio_out      : out std_logic_vector(9 downto 0); -- TCS/SG audio out
 audio_out_l    : out std_logic_vector(15 downto 0); -- super sound board left
 audio_out_r    : out std_logic_vector(15 downto 0); -- super sound board right

 monoboard      :  in std_logic;
 h_flip         :  in std_logic;

 -- ssio input/outputs
 input_0        :  in std_logic_vector(7 downto 0);
 input_1        :  in std_logic_vector(7 downto 0);
 input_2        :  in std_logic_vector(7 downto 0);
 input_3        :  in std_logic_vector(7 downto 0);
 input_4        :  in std_logic_vector(7 downto 0);
 output_5       : out std_logic_vector(7 downto 0);
 output_6       : out std_logic_vector(7 downto 0);

 -- external ROM signals
 cpu_rom_addr   : out std_logic_vector(15 downto 0);
 cpu_rom_do     : in std_logic_vector(7 downto 0);
 snd_rom_addr   : out std_logic_vector(17 downto 0);
 snd_rom_do     : in std_logic_vector(15 downto 0);

 sp_addr        : out std_logic_vector(15 downto 0);
 sp_graphx32_do : in std_logic_vector(31 downto 0);
 
 -- internal ROM download
 dl_addr        : in std_logic_vector(18 downto 0);
 dl_data        : in std_logic_vector(7 downto 0);
 dl_wr          : in std_logic;
 up_data        : out std_logic_vector(7 downto 0);
 cmos_wr        : in std_logic
 );
end mcr3;

architecture struct of mcr3 is

 signal reset_n   : std_logic;
 signal clock_vid : std_logic;
 signal clock_vidn: std_logic;
 signal clock_cnt : std_logic_vector(3 downto 0) := "0000";

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
 signal cpu_rd_n    : std_logic;
 signal cpu_mreq_n  : std_logic;
 signal cpu_ioreq_n : std_logic;
 signal cpu_irq_n   : std_logic;
 signal cpu_m1_n    : std_logic;
 signal cpu_rfsh_n  : std_logic;
 signal cpu_int_ack_n : std_logic;

 signal ctc_ce      : std_logic;
 signal ctc_do      : std_logic_vector(7 downto 0);

 signal ctc_counter_1_trg : std_logic;
 signal ctc_counter_2_trg : std_logic;
 signal ctc_counter_3_trg : std_logic;

-- signal cpu_rom_do : std_logic_vector( 7 downto 0);
 
 signal wram_we    : std_logic;
 signal wram_do    : std_logic_vector( 7 downto 0);

 signal bg_ram_addr: std_logic_vector(10 downto 0);
 signal bg_ram_we  : std_logic;
 signal bg_ram_do  : std_logic_vector(7 downto 0);
 signal bg_ram_do_r: std_logic_vector(7 downto 0); -- registred ram data for cpu

 signal bg_code         : std_logic_vector(7 downto 0); 
 signal bg_code_r       : std_logic_vector(7 downto 0); 
 signal bg_attr         : std_logic_vector(7 downto 0);

 signal bg_code_line    : std_logic_vector(13 downto 0);
 signal bg_graphx1_do   : std_logic_vector( 7 downto 0);
 signal bg_graphx2_do   : std_logic_vector( 7 downto 0);
 signal bg_palette_addr : std_logic_vector( 5 downto 0);
 
 signal sp_ram_cache_addr       : std_logic_vector(8 downto 0);
 signal sp_ram_cache_we         : std_logic;
 signal sp_ram_cache_do         : std_logic_vector(7 downto 0);
 signal sp_ram_cache_do_r       : std_logic_vector(7 downto 0);-- registred ram data for cpu
 
 signal move_buf          : std_logic;
 signal sp_ram_addr       : std_logic_vector(8 downto 0);
 signal sp_ram_we         : std_logic;
 signal sp_ram_do         : std_logic_vector(7 downto 0);

 signal sp_cnt          : std_logic_vector( 6 downto 0);
 signal sp_code         : std_logic_vector( 7 downto 0);
 signal sp_attr         : std_logic_vector( 7 downto 0);
 signal sp_input_phase  : std_logic_vector( 5 downto 0);

 signal sp_done         : std_logic;
 signal sp_vcnt         : std_logic_vector( 9 downto 0);
 signal sp_line         : std_logic_vector( 4 downto 0);
 signal sp_hcnt         : std_logic_vector( 8 downto 0); -- lsb used to mux rd/wr line buffer
 signal sp_on_line      : std_logic;
 signal sp_on_line_r    : std_logic;
 signal sp_byte_cnt     : std_logic_vector( 1 downto 0);
 signal sp_code_line_mux: std_logic_vector(16 downto 0);
 signal sp_hflip        : std_logic_vector( 1 downto 0);
 signal sp_vflip        : std_logic_vector( 4 downto 0);
 signal sp_offset       : signed(7 downto 0);
 
 signal sp_graphx_do    : std_logic_vector( 7 downto 0);
 signal sp_graphx32_do_r: std_logic_vector(31 downto 0);
 signal sp_graphx_mux   : std_logic_vector( 7 downto 0);
 signal sp_mux_roms     : std_logic_vector( 1 downto 0);

 signal sp_graphx_a     : std_logic_vector( 3 downto 0);
 signal sp_graphx_b     : std_logic_vector( 3 downto 0);
 signal sp_graphx_a_ok  : std_logic;
 signal sp_graphx_b_ok  : std_logic;
 
 signal sp_buffer_ram1_addr : std_logic_vector(7 downto 0);
 signal sp_buffer_ram1a_we  : std_logic;
 signal sp_buffer_ram1b_we  : std_logic;
 signal sp_buffer_ram1a_di  : std_logic_vector( 7 downto 0);
 signal sp_buffer_ram1b_di  : std_logic_vector( 7 downto 0);
 signal sp_buffer_ram1a_do  : std_logic_vector( 7 downto 0);
 signal sp_buffer_ram1b_do  : std_logic_vector( 7 downto 0);
 signal sp_buffer_ram1_do_r : std_logic_vector(15 downto 0);
 
 signal sp_buffer_ram2_addr : std_logic_vector(7 downto 0);
 signal sp_buffer_ram2a_we  : std_logic;
 signal sp_buffer_ram2b_we  : std_logic;
 signal sp_buffer_ram2a_di  : std_logic_vector( 7 downto 0);
 signal sp_buffer_ram2b_di  : std_logic_vector( 7 downto 0);
 signal sp_buffer_ram2a_do  : std_logic_vector( 7 downto 0);
 signal sp_buffer_ram2b_do  : std_logic_vector( 7 downto 0);
 signal sp_buffer_ram2_do_r : std_logic_vector(15 downto 0);
 
 signal sp_buffer_sel       : std_logic;
 
 signal sp_vid              : std_logic_vector(3 downto 0);
 signal sp_col              : std_logic_vector(3 downto 0);
 signal sp_palette_addr     : std_logic_vector(5 downto 0);
 
 signal palette_addr        : std_logic_vector(5 downto 0);
 signal palette_we          : std_logic;
 signal palette_do          : std_logic_vector(8 downto 0);

 -- SSIO signals
 signal ssio_iowe : std_logic;
 signal ssio_do   : std_logic_vector(7 downto 0);

 signal op_5      : std_logic_vector(7 downto 0);
 signal op_6      : std_logic_vector(7 downto 0);
-- signal max_sprite: std_logic_vector(7 downto 0); -- dbg
-- signal max_sprite_r: std_logic_vector(7 downto 0); -- dbg
-- signal max_sprite_rr: std_logic_vector(7 downto 0); -- dbg
 signal bg_graphics_1_we : std_logic;
 signal bg_graphics_2_we : std_logic;
 
 signal ssb_rom_addr : std_logic_vector(13 downto 0);
 signal ssb_rom_do   : std_logic_vector( 7 downto 0);
 signal tcs_rom_addr : std_logic_vector(14 downto 0);
 signal tcs_rom_do   : std_logic_vector( 7 downto 0);
 signal tcs_audio    : std_logic_vector( 9 downto 0);
 signal sg_rom_addr  : std_logic_vector(17 downto 1);
 signal sg_audio     : std_logic_vector( 9 downto 0);

begin

clock_vid  <= clock_40;
clock_vidn <= not clock_40;
reset_n    <= not reset;

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
--
cpu_ena <= '1' when clock_cnt(2 downto 0) = "111" else '0'; -- (5MHz for 91490 super cpu board)
pix_ena <= '1' when (clock_cnt(1 downto 0) = "11" and tv15Khz_mode = '1') or         -- (10MHz)
						  (clock_cnt(0) = '1'           and tv15Khz_mode = '0') else '0';  -- (20MHz)

-----------------------------------
-- Video scanner  634x525 @20Mhz --
-- display 512x480               --
-----------------------------------
process (reset, clock_vid)
begin
	if reset='1' then
		hcnt  <= (others=>'0');
		vcnt  <= (others=>'0');
		top_frame <= '0';
	elsif rising_edge(clock_vid) then
		if pix_ena = '1' then

			hcnt <= hcnt + 1;
			if hcnt = 633 then
				hcnt <= (others=>'0');
				vcnt <= vcnt + 1;
				if (vcnt = 511 and tv15Khz_mode = '0') or (vcnt = 255 and tv15Khz_mode = '1') then
					vcnt <= (others=>'0');
					top_frame <= not top_frame;
				end if;
			end if;

			if tv15Khz_mode = '0' then 
						--	progessive mode

				if vcnt = 490-1 then video_vs <= '0'; end if; -- front porch 10
				if vcnt = 492-1 then video_vs <= '1'; end if; -- sync pulse   2
																				 -- back porch  33 
						
				if hcnt = 512+13+9+6 then video_hs <= '0'; end if; -- front porch 16/25*20 = 13
				if hcnt = 512+90+9+6 then video_hs <= '1'; end if; -- sync pulse  96/25*20 = 77
																				   -- back porch  48/25*20 = 38
				video_blankn <= '0';
				if hcnt >= 2+16-1 and  hcnt < 514+16-1 and
				  vcnt >= 0 and  vcnt < 480 then video_blankn <= '1';end if;
				
			else    -- interlaced mode

				if hcnt = 530+22 then 
					hs_cnt <= (others => '0');
					if (vcnt = 240) then
						vs_cnt <= (others => '0');
					else
						vs_cnt <= vs_cnt +1;
					end if;
					
					if vcnt = 240 then video_vs <= '0'; end if;
					if vcnt = 242 then video_vs <= '1'; end if;

				else 
					hs_cnt <= hs_cnt + 1;
				end if;

				video_blankn <= '0';
				if hcnt >= 2+16 and  hcnt < 514+16 and
					vcnt >= 0 and  vcnt < 240 then video_blankn <= '1';end if;

				if    hs_cnt =  0 then hsync0 <= '0'; video_hs <= '0';
				elsif hs_cnt = 47 then hsync0 <= '1'; video_hs <= '1';
				end if;

				if    hs_cnt =      0  then hsync1 <= '0';
				elsif hs_cnt =     23  then hsync1 <= '1';
				elsif hs_cnt = 317+ 0  then hsync1 <= '0';
				elsif hs_cnt = 317+23  then hsync1 <= '1';
				end if;
		
				if    hs_cnt =      0  then hsync2 <= '0';
				elsif hs_cnt = 317-47  then hsync2 <= '1';
				elsif hs_cnt = 317     then hsync2 <= '0';
				elsif hs_cnt = 634-47  then hsync2 <= '1';
				end if;

				
				if    hs_cnt =      0  then hsync3 <= '0';
				elsif hs_cnt =     23  then hsync3 <= '1';
				elsif hs_cnt = 317     then hsync3 <= '0';
				elsif hs_cnt = 634-47  then hsync3 <= '1';
				end if;

				if    hs_cnt =      0  then hsync4 <= '0';
				elsif hs_cnt = 317-47  then hsync4 <= '1';
				elsif hs_cnt = 317     then hsync4 <= '0';
				elsif hs_cnt = 317+23  then hsync4 <= '1';
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

------------------------------------------
-- cpu data input with address decoding --
------------------------------------------
cpu_di <= cpu_rom_do        when cpu_mreq_n  = '0' and cpu_addr(15 downto 12) < X"E"      else -- 0000-DFFF
          wram_do           when cpu_mreq_n  = '0' and (cpu_addr and X"F800") = x"E000"   else -- E000-E7FF
          sp_ram_cache_do_r when cpu_mreq_n  = '0' and (cpu_addr and x"FC00") = x"E800"   else -- sprite ram  E800-E9FF + mirroring 0200
          bg_ram_do_r       when cpu_mreq_n  = '0' and (cpu_addr and x"F800") = x"F000"   else -- video ram   F000-F7FF
          ctc_do            when cpu_int_ack_n = '0' or ctc_ce = '1'                      else -- ctc (interrupt vector or counter data)
          ssio_do           when cpu_ioreq_n = '0' and cpu_addr(7 downto 5) = "000"       else -- 0x00-0x1F
          X"FF";

------------------------------------------------------------------------
-- Misc registers : ctc write enable / interrupt acknowledge
------------------------------------------------------------------------
cpu_int_ack_n     <= cpu_ioreq_n or cpu_m1_n;
ctc_ce            <= '1' when cpu_ioreq_n = '0' and cpu_addr(7 downto 4) = x"F" else '0';
ctc_counter_2_trg <= '1' when (vcnt >= 240 and tv15Khz_mode = '1') or (vcnt >= 480 and tv15Khz_mode = '0') else '0'; --gvblank
ctc_counter_3_trg <= '1' when top_frame = '1' and ((vcnt = 246 and tv15Khz_mode = '1') or (vcnt = 493 and tv15Khz_mode = '0')) else '0';

------------------------------------------
-- write enable / ram access from CPU --
------------------------------------------
wram_we         <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and (cpu_addr and x"F800") = x"E000" else '0';
sp_ram_cache_we <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and (cpu_addr and x"FC00") = x"E800" and hcnt(0) = '0' else '0';
bg_ram_we       <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and (cpu_addr and x"F800") = x"F000" and hcnt(0) = '0' else '0';
ssio_iowe       <= '1' when cpu_wr_n = '0' and cpu_ioreq_n = '0' else '0';

----------------------------------
--------- sprite machine ---------
----  91464 Super Video Board ----
----------------------------------
hflip <= hcnt when h_flip = '0' else not hcnt;
sp_offset <= -x"04" when h_flip = '0' else x"0C";

vflip <= vcnt(8 downto 0) & not top_frame when tv15Khz_mode = '1' else vcnt; -- do not apply mirror flip

sp_buffer_sel <= vflip(1) when tv15Khz_mode = '1' else vflip(0);

process (clock_vid)
begin
	if rising_edge(clock_vid) then

-- debug -- max sprite counter
--	if vcnt = 0 and hcnt = 0 and pix_ena = '1' then 
--		max_sprite_r <= (others => '0');
--		if max_sprite_r > max_sprite_rr then
--			max_sprite_rr <= max_sprite_r;
--		end if;
--	end if;
	
	if hcnt = 0 then
		sp_cnt <= (others => '0');
		sp_input_phase <= (others => '0');
		sp_on_line <= '0';
		sp_done <= '0';			
--		max_sprite <= (others => '0');
--		if max_sprite > max_sprite_r then
--			max_sprite_r <= max_sprite;
--		end if;
	end if;
			
	if sp_done = '0' then
		sp_input_phase <= sp_input_phase + 1 ;
		if sp_input_phase >= 10 then sp_hcnt <= sp_hcnt + 1; end if;

		case sp_input_phase is
			when "000000" => 
				if sp_vcnt(8 downto 5) = x"F" then -- and sp_ram_do > x"10" then
					sp_line <= sp_vcnt(4 downto 0);
				else
					sp_input_phase <= (others => '0');
					sp_cnt <= sp_cnt + 1;
					if sp_cnt = "1111111" then sp_done <= '1'; end if;
				end if;
				sp_byte_cnt <= (others => '0');
			when "000001" => 
				sp_attr <= sp_ram_do;
			when "000010" => 
				sp_code <= sp_ram_do;
				sp_addr <= sp_attr(3) & sp_ram_do(7 downto 0) & (sp_line xor sp_vflip) & (sp_byte_cnt xor sp_hflip); -- graphics rom addr
			when "000011" => 
				sp_hcnt <= sp_ram_do & '0';
			when "001010" => -- 10
				sp_graphx32_do_r <= sp_graphx32_do; -- latch incoming sprite data
				sp_addr <= sp_attr(3) & sp_code(7 downto 0) & (sp_line xor sp_vflip) & (sp_byte_cnt+1 xor sp_hflip); -- advance graphics rom addr
				sp_on_line <= '1';
			when "010010"|"011010"|"100010" => -- 18,26,34
				sp_graphx32_do_r <= sp_graphx32_do; -- latch incoming sprite data
				sp_addr <= sp_attr(3) & sp_code(7 downto 0) & (sp_line xor sp_vflip) & (sp_byte_cnt+2 xor sp_hflip); -- advance graphics rom addr
				sp_byte_cnt <= sp_byte_cnt + 1;
			when "101010" => -- 42
				sp_on_line <= '0';
				sp_input_phase <= (others => '0');
				sp_cnt <= sp_cnt + 1;
				if sp_cnt = "1111111" then sp_done <= '1'; end if;
			when others =>
				null;
		end case;
		sp_mux_roms <= sp_input_phase(2 downto 1);
	end if;
		
	if pix_ena = '1' then 
		if hcnt(0) = '0' then
			sp_buffer_ram1_do_r <= sp_buffer_ram1b_do & sp_buffer_ram1a_do;
			sp_buffer_ram2_do_r <= sp_buffer_ram2b_do & sp_buffer_ram2a_do;
		end if;		
	end if;

	end if;
end process;	

-- sp_ram_cache can be read/write by cpu when hcnt(0) = 0;
-- sp_ram_cache can be read by sprite machine when hcnt(0) = 1;

sp_ram_cache_addr <= cpu_addr(8 downto 0) when hcnt(0) = '0' else sp_ram_addr;

move_buf    <= '1' when (vcnt(8 downto 1) = 250 and tv15Khz_mode = '0') or (vcnt(7 downto 1) = 125 and tv15Khz_mode = '1') else '0'; -- line 500-501
sp_ram_addr <= vcnt(0) & hcnt(8 downto 1) when move_buf = '1' else sp_cnt & sp_input_phase(1 downto 0);
sp_ram_we   <= hcnt(0) when move_buf = '1' else '0';

sp_vcnt <= vflip + (sp_ram_do & '0') -1 ; -- valid when sp_input_phase = 0

sp_hflip <= (others => sp_attr(4));
sp_vflip <= (others => sp_attr(5));

sp_graphx_do <= sp_graphx32_do_r( 7 downto  0) when (sp_hflip(0) = '0' and sp_mux_roms = "01") or (sp_hflip(0) = '1' and sp_mux_roms = "00") else
                sp_graphx32_do_r(15 downto  8) when (sp_hflip(0) = '0' and sp_mux_roms = "10") or (sp_hflip(0) = '1' and sp_mux_roms = "11") else
					      sp_graphx32_do_r(23 downto 16) when (sp_hflip(0) = '0' and sp_mux_roms = "11") or (sp_hflip(0) = '1' and sp_mux_roms = "10") else
					      sp_graphx32_do_r(31 downto 24);-- when (sp_hflip(0) = '0' and sp_mux_roms = "00") or (sp_hflip(0) = '1' and sp_mux_roms = "01") ;

sp_graphx_a <= sp_graphx_do(7 downto 4) when sp_hflip(0) = '1' else sp_graphx_do(3 downto 0);
sp_graphx_b <= sp_graphx_do(3 downto 0) when sp_hflip(0) = '1' else sp_graphx_do(7 downto 4);

sp_graphx_a_ok <= '1' when sp_graphx_a /= x"0" else '0';
sp_graphx_b_ok <= '1' when sp_graphx_b /= x"0" else '0';

sp_buffer_ram1a_di  <= '0' & sp_attr(2 downto 0) & sp_graphx_a          when sp_buffer_sel = '1' else x"00";
sp_buffer_ram1b_di  <= '0' & sp_attr(2 downto 0) & sp_graphx_b          when sp_buffer_sel = '1' else x"00";
sp_buffer_ram1_addr <= sp_hcnt(8 downto 1)                              when sp_buffer_sel = '1' else hflip(8 downto 1) + std_logic_vector(sp_offset);
sp_buffer_ram1a_we  <= not sp_hcnt(0) and sp_on_line and sp_graphx_a_ok when sp_buffer_sel = '1' else hcnt(0);
sp_buffer_ram1b_we  <= not sp_hcnt(0) and sp_on_line and sp_graphx_b_ok when sp_buffer_sel = '1' else hcnt(0);

sp_buffer_ram2a_di  <= '0' & sp_attr(2 downto 0) & sp_graphx_a          when sp_buffer_sel = '0' else x"00";
sp_buffer_ram2b_di  <= '0' & sp_attr(2 downto 0) & sp_graphx_b          when sp_buffer_sel = '0' else x"00";
sp_buffer_ram2_addr <= sp_hcnt(8 downto 1)                              when sp_buffer_sel = '0' else hflip(8 downto 1) + std_logic_vector(sp_offset);
sp_buffer_ram2a_we  <= not sp_hcnt(0) and sp_on_line and sp_graphx_a_ok when sp_buffer_sel = '0' else hcnt(0);
sp_buffer_ram2b_we  <= not sp_hcnt(0) and sp_on_line and sp_graphx_b_ok when sp_buffer_sel = '0' else hcnt(0);

sp_vid <= sp_buffer_ram1_do_r(11 downto  8) when (sp_buffer_sel = '0') and (hflip(0) = '1') else
          sp_buffer_ram1_do_r( 3 downto  0) when (sp_buffer_sel = '0') and (hflip(0) = '0') else
          sp_buffer_ram2_do_r(11 downto  8) when (sp_buffer_sel = '1') and (hflip(0) = '1') else
          sp_buffer_ram2_do_r( 3 downto  0);-- when (sp_buffer_sel = '1') and (hflip(0) = '0');

sp_col <= sp_buffer_ram1_do_r(15 downto 12) when (sp_buffer_sel = '0') and (hflip(0) = '1') else
          sp_buffer_ram1_do_r( 7 downto  4) when (sp_buffer_sel = '0') and (hflip(0) = '0') else
          sp_buffer_ram2_do_r(15 downto 12) when (sp_buffer_sel = '1') and (hflip(0) = '1') else
          sp_buffer_ram2_do_r( 7 downto  4);-- when (sp_buffer_sel = '1') and (hflip(0) = '0');

--------------------
--- char machine ---
--- 91490 Board ----
--------------------
bg_ram_addr <= cpu_addr(10 downto 0) when hcnt(0) = '0' else vflip(8 downto 4) & hflip(8 downto 4) & hcnt(1);

bg_code_line <= bg_attr(1 downto 0) & bg_code_r & (vflip(3 downto 1) xor (bg_attr(3) & bg_attr(3) & bg_attr(3) ) ) & (hflip(3) xor bg_attr(2));

process (clock_vid)
begin
	if rising_edge(clock_vid) then

		-- catch ram data for cpu
		if hcnt(0) = '0' then
			bg_ram_do_r       <= bg_ram_do;
			sp_ram_cache_do_r <= sp_ram_cache_do;
		end if;

		if pix_ena = '1' then

			if hcnt(0) = '1' then
				case hcnt(3 downto 1) is
					when "110" =>  bg_code   <= bg_ram_do;
					when "111" =>  bg_attr   <= bg_ram_do;
					               bg_code_r <= bg_code;
					when others => null;
				end case;			

				case hflip(2 downto 1) xor (bg_attr(2) & bg_attr(2)) is
					when "00"   => bg_palette_addr <= bg_attr(5 downto 4) & bg_graphx2_do(7 downto 6) & bg_graphx1_do(7 downto 6);
					when "01"   => bg_palette_addr <= bg_attr(5 downto 4) & bg_graphx2_do(5 downto 4) & bg_graphx1_do(5 downto 4);
					when "10"   => bg_palette_addr <= bg_attr(5 downto 4) & bg_graphx2_do(3 downto 2) & bg_graphx1_do(3 downto 2);
					when others => bg_palette_addr <= bg_attr(5 downto 4) & bg_graphx2_do(1 downto 0) & bg_graphx1_do(1 downto 0);
				end case;
			end if;

			sp_palette_addr <= not sp_col(1 downto 0) & sp_vid;

		end if;

	end if;
end process;

---------------------------
-- mux char/sprite video --
---------------------------
palette_we <= '1' when monoboard = '1' and cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 10) = x"E"&"11" else -- 0xEC00-EFFF
              '1' when monoboard = '0' and cpu_mreq_n = '0' and cpu_wr_n = '0' and (cpu_addr and x"F800") = x"F800" else   -- 0xF800-F87F + mirroring 0x0780
              '0';

palette_addr <= cpu_addr(6 downto 1) when palette_we = '1'                    else 
                bg_palette_addr      when sp_palette_addr(2 downto 0) = "000" and monoboard = '0' else
                not bg_palette_addr  when sp_palette_addr(2 downto 0) = "000" and monoboard = '1' else
                sp_palette_addr;

process (clock_vid)
begin
	if rising_edge(clock_vid) then
		video_g <= palette_do(2 downto 0);
		video_b <= palette_do(5 downto 3);
		video_r <= palette_do(8 downto 6);
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
  INT_n   => cpu_irq_n,
  NMI_n   => '1', --cpu_nmi_n,
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

-- Z80-CTC (MK3882)
z80ctc : entity work.z80ctc_top
port map (
	clock     => clock_vid,
	clock_ena => cpu_ena,
	reset     => reset,
	din       => cpu_do,
	cpu_din   => cpu_di,
	dout      => ctc_do,
	ce_n      => not ctc_ce,
	cs        => cpu_addr(1 downto 0),
	m1_n      => cpu_m1_n,
	iorq_n    => cpu_ioreq_n,
	rd_n      => cpu_rd_n,
	int_n     => cpu_irq_n,
	trg0      => '0',
	to0       => ctc_counter_1_trg,
	trg1      => ctc_counter_1_trg,
	to1       => open,
	trg2      => ctc_counter_2_trg,
	to2       => open,
	trg3      => ctc_counter_3_trg
);

process (clock_vid, reset)
begin
	if reset = '1' then
		cpu_rom_addr <= x"FFFF";
	elsif rising_edge(clock_vid) then
		if cpu_rfsh_n = '1' and cpu_addr(15 downto 12) < X"E" then
			cpu_rom_addr <= cpu_addr(15 downto 0);
		end if;
	end if;
end process;

-- working RAM   0xE000-0xE7FF
wram : entity work.dpram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk_a  => clock_vidn,
 addr_a => cpu_addr(10 downto 0),
 d_a    => cpu_do,
 we_a   => wram_we,
 q_a    => wram_do,
 clk_b  => clock_vid,
 we_b   => cmos_wr,
 addr_b => dl_addr(10 downto 0),
 d_b    => dl_data,
 q_b    => up_data
);

-- video RAM   0xF000-0xF7FF
video_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk  => clock_vidn,
 we   => bg_ram_we,
 addr => bg_ram_addr,
 d    => cpu_do,
 q    => bg_ram_do
);

-- sprite RAM (no cpu access)
sprite_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 9)
port map(
 clk  => clock_vidn,
 we   => sp_ram_we,
 addr => sp_ram_addr,
 d    => sp_ram_cache_do,
 q    => sp_ram_do
);

-- sprite RAM  0xE800-0xE9FF + mirroring adresses
sprites_ram_cache : entity work.gen_ram
generic map( dWidth => 8, aWidth => 9)
port map(
 clk  => clock_vidn,
 we   => sp_ram_cache_we,
 addr => sp_ram_cache_addr,
 d    => cpu_do,
 q    => sp_ram_cache_do
);

-- sprite line buffer 1a
sprlinebuf1a : entity work.gen_ram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_vidn,
 we   => sp_buffer_ram1a_we,
 addr => sp_buffer_ram1_addr,
 d    => sp_buffer_ram1a_di,
 q    => sp_buffer_ram1a_do
);

-- sprite line buffer 1b
sprlinebuf1b : entity work.gen_ram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_vidn,
 we   => sp_buffer_ram1b_we,
 addr => sp_buffer_ram1_addr,
 d    => sp_buffer_ram1b_di,
 q    => sp_buffer_ram1b_do
);

-- sprite line buffer 2a
sprlinebuf2a : entity work.gen_ram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_vidn,
 we   => sp_buffer_ram2a_we,
 addr => sp_buffer_ram2_addr,
 d    => sp_buffer_ram2a_di,
 q    => sp_buffer_ram2a_do
);

-- sprite line buffer 2b
sprlinebuf2b : entity work.gen_ram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_vidn,
 we   => sp_buffer_ram2b_we,
 addr => sp_buffer_ram2_addr,
 d    => sp_buffer_ram2b_di,
 q    => sp_buffer_ram2b_do
);

bg_graphics_1 : entity work.dpram
generic map( dWidth => 8, aWidth => 14)
port map(
 clk_a  => clock_vidn,
 addr_a => bg_code_line(13 downto 0),
 q_a    => bg_graphx1_do,
 clk_b  => clock_vid,
 we_b   => bg_graphics_1_we,
 addr_b => dl_addr(13 downto 0),
 d_b    => dl_data
);
bg_graphics_1_we <= '1' when dl_addr(18 downto 14) = "00000" and dl_wr = '1' else '0'; -- 0000-3FFF

bg_graphics_2 : entity work.dpram
generic map( dWidth => 8, aWidth => 14)
port map(
 clk_a  => clock_vidn,
 addr_a => bg_code_line(13 downto 0),
 q_a    => bg_graphx2_do,
 clk_b  => clock_vid,
 we_b   => bg_graphics_2_we,
 addr_b => dl_addr(13 downto 0),
 d_b    => dl_data
);
bg_graphics_2_we <= '1' when dl_addr(18 downto 14) = "00001" and dl_wr = '1' else '0'; -- 4000-7FFF

-- background & sprite palette
palette : entity work.gen_ram
generic map( dWidth => 9, aWidth => 6)
port map(
 clk  => clock_vidn,
 we   => palette_we,
 addr => palette_addr,
 d    => cpu_addr(0) & cpu_do,
 q    => palette_do
);

-- super_sound_board.
sound_board : entity work.super_sound_board
port map(
 clock_40    => clock_40,
 reset       => reset,

 main_cpu_addr => cpu_addr(7 downto 0),

 ssio_iowe => ssio_iowe,
 ssio_di   => cpu_do,
 ssio_do   => ssio_do,

 input_0 => input_0,
 input_1 => input_1,
 input_2 => input_2,
 input_3 => input_3,
 input_4 => input_4,
 output_5 => op_5,
 output_6 => op_6,

 separate_audio => '1',
 audio_out_l    => audio_out_l,
 audio_out_r    => audio_out_r,

 cpu_rom_addr => ssb_rom_addr,
 cpu_rom_do => ssb_rom_do,

 dbg_cpu_addr => open --dbg_cpu_addr
);

output_5 <= op_5;
output_6 <= op_6;

-- Turbo Cheap Squeak
tcs: entity work.turbo_cheap_squeak
port map (
 clock_40 => clock_40,
 reset => reset,
 input => op_6,
 rom_addr => tcs_rom_addr,
 rom_do => tcs_rom_do,
 audio_out => tcs_audio
);

-- Sounds Good
sg: entity work.sounds_good
port map (
 clock_40 => clock_40,
 reset => reset,
 sint  => op_6(0),
 sndsel => op_6(4 downto 1),
 stat => snd_stat,
 extreset_n => '1', -- should come from watchdog
 rom_addr => sg_rom_addr,
 rom_do => snd_rom_do,
 audio_out => sg_audio
);

ssb_rom_do <= x"00" when soundboard /= "00" else snd_rom_do(15 downto 8) when ssb_rom_addr(0) = '1' else snd_rom_do(7 downto 0);
tcs_rom_do <= snd_rom_do(15 downto 8) when tcs_rom_addr(0) = '1' else snd_rom_do(7 downto 0);
snd_rom_addr <= "0000" & ssb_rom_addr when soundboard = "00" else
                 "000" & tcs_rom_addr when soundboard = "01" else
                sg_rom_addr&'0';
audio_out <= (others => '0') when soundboard = "00" else
             tcs_audio when soundboard = "01" else
             sg_audio;

end struct;
