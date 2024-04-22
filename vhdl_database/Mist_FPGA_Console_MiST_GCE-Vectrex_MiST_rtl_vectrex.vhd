---------------------------------------------------------------------------------
-- Vectrex by Dar (darfpga@aol.fr) (27/12/2017)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
--  
-- Vectrex releases
--
-- Release 0.2 - 12/06/2018 - Dar
--	delays ramp related signals w.r.t. blank signal 
--	result is not perfect but clean sweep maze is much more correct and playable
--
-- Release 0.1 - 05/05/2018 - Dar
--	add sp0256-al2 VHDL speech simulation
--	add speakjet interface (speech IC)
--
-- Release 0.0 - 10/02/2018 - Dar
--	initial release
--
---------------------------------------------------------------------------------
-- SP0256-al2 prom decoding scheme and speech synthesis algorithm are from :
--
-- Copyright Joseph Zbiciak, all rights reserved.
-- Copyright tim lindner, all rights reserved.
--
-- See C source code and license in sp0256.c from MAME source
--
-- VHDL code is by Dar.
---------------------------------------------------------------------------------
-- gen_ram.vhd & io_ps2_keyboard
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
---------------------------------------------------------------------------------
-- VIA m6522
-- Copyright (c) MikeJ - March 2003
-- + modification
---------------------------------------------------------------------------------
-- YM2149 (AY-3-8910)
-- Copyright (c) MikeJ - Jan 2005
---------------------------------------------------------------------------------
-- cpu09l_128
-- Copyright (C) 2003 - 2010 John Kent
-- + modification 
---------------------------------------------------------------------------------
-- Use vectrex_de10_lite.sdc to compile (Timequest constraints)
-- /!\
-- Don't forget to set device configuration mode with memory initialization 
--  (Assignments/Device/Pin options/Configuration mode)
---------------------------------------------------------------------------------
-- Vectrex beam control hardware
--   Uses via port_A, dac and capacitor to set beam x/y displacement speed
--   when done beam displacement is released (port_B_7 = 0)
--   beam displacement duration is controled by Timer 1 (that drive port_B_7)
--   or by 6809 instructions execution duration.
--
--   Uses via port_A, dac and capacitor to set beam intensity before displacment

--   Before drawing any object (or text) the beam position is reset to screen center. 
--   via_CA2 is used to reset beam position.
--
--	  Uses via_CB2 to set pen ON/OFF. CB2 is always driven by via shift register (SR)
--   output. SR is loaded with 0xFF for plain line drawing. SR is loaded with 0x00
--   for displacement with no drawing. SR is loaded with characters graphics 
--   (character by character and line by line). SR is ALWAYS used in one shot mode
--   although SR bits are recirculated, SR shift stops on the last data bit (and 
--   not on the first bit of data recirculated)
--
--   Exec_rom uses line drawing with Timer 1 and FF/00 SR loading (FF or 00 with
--   recirculation always output respectively 1 or 0). Timer 1 timeout is checked
--   by software polling loop.
--
--	  Exec_rom draw characters in the following manner : start displacement and feed
--   SR with character grahics (at the right time) till the end of the complete line.
--   Then move down one line and then backward up to the begining of the next line 
--   with no drawing. Then start drawing the second line... ans so on 7 times. 
--   CPU has enough time to get the next character and the corresponding graphics 
--   line data between each SR feed. T1 is not used.
--   
--   Most games seems to use those exec_rom routines.
--
--   During cut scene of spike sound sample have to be interlaced (through dac) while
--   drawing. Spike uses it's own routine for that job. That routine prepare drawing
--   data (graphics and vx/vy speeds) within working ram before cut scene start to be
--   able to feed sound sample between each movement segment. T1 and SR are used but 
--   T1 timeout is not check. CPU expect there is enough time from T1 start to next 
--   dac modification (dac ouput is alway vx during move). Modifying dac before T1 
--   timeout will corrupt drawing. eg : when starting from @1230 (clr T1h), T1 must
--   have finished before reaching @11A4 (put sound sample value on dac). Drawing
--   characters with this routine is done by going backward between each character
--   graphic. Beam position is reset to screen center after/before each graphic line.
--   one sound sample is sent to dac after each character graphic.

---------------------------------------------------------------------------------
-- Video raster 588*444 < 256k running at 24MHz(25MHz) for VGA 640x480-60Hz 
-- (horizontal display)
--
--   requires 3 access per cycle =>
--   | read video scan buffer| Write video scan buffer | write vector beam |
--   => 75Mhz ram access with single ram (13ns access time)
--
--   implemented here as 4 separated buffers for 4 consecutives pixels
--   4 phases acces at 24MHz(25MHz)
--
--	  1) Read 1 pixel from each 4 buffers at video address => 4 pixels to be displayed
--   2) Write one pixel at beam vector address (ie to one buffer only)
--	  3) Write 1 pixel to each 4 buffers at video address => 4 pixels updated
--   4) Write one pixel at beam vector address (ie to one buffer only)
--
--   thus video refresh (VGA) is ok : 4 pixels every 4 clock periods (25MHz)
--   vector beam is continuously written at 12MHz (seems to be ok)
--
-- Each vram buffer is 64k (256k/4) x 2bits or 4bits
--
-- 2bits witdh video raster (vram_width) buffer : 
--    vector beam write value = 2
--    video scan decrease this value by 1 after reading at each video frame (60Hz)
--		pixel is displayed full intensity as long as value not equal to 0
--
-- 4bits witdh video raster (vram_width) buffer : 
--    vector beam write value = 2 in lower bits and intensity (0-3) in upper bits
--    video scan decrease the 2 lower bits by 1 after reading at each video frame (60Hz)
--		pixel is displayed upper bits intensity as long as lower bits value not equal to 0
--
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity vectrex is
port
(
	clock_24     : in std_logic;
	clock_12     : in std_logic;
	reset        : in std_logic;
	cpu          : in std_logic; -- 1 - CPU by John Kent, 0 -- CPU by Greg Miller (Cycle exact)

	video_r      : out std_logic_vector(3 downto 0);
	video_g      : out std_logic_vector(3 downto 0);
	video_b      : out std_logic_vector(3 downto 0);

	video_hs     : out std_logic;
	video_vs     : out std_logic;
	video_hblank : out std_logic;
	video_vblank : out std_logic;

	speech_mode  : in  std_logic;
	video_csync  : out std_logic;
	frame		    : out std_logic;
	
	audio_out    : out std_logic_vector(9 downto 0);
	cart_addr    : out std_logic_vector(14 downto 0);
	cart_do      : in std_logic_vector( 7 downto 0);
	cart_rd      : out std_logic;	
	btn11        : in std_logic;
	btn12        : in std_logic;
	btn13        : in std_logic;
	btn14        : in std_logic;
	pot_x_1      : in signed(7 downto 0);
	pot_y_1      : in signed(7 downto 0);
	btn21        : in std_logic;
	btn22        : in std_logic;
	btn23      	 : in std_logic;
	btn24        : in std_logic;
	pot_x_2      : in signed(7 downto 0);
	pot_y_2      : in signed(7 downto 0);
	speakjet_cmd : out std_logic;
	speakjet_rdy : in  std_logic;
	speakjet_pwm : in  std_logic;
	external_speech_mode : in std_logic_vector(1 downto 0);
	leds 			 : out std_logic_vector(9 downto 0);	
	dbg_cpu_addr : out std_logic_vector(15 downto 0)
  );
end vectrex;

architecture syn of vectrex is

component mc6809 is port
(
	CPU    : in  std_logic;

	CLK    : in  std_logic;
	CLKEN  : in  std_logic;

	E      : out std_logic;
	riseE  : out std_logic;
	fallE  : out std_logic;

	Q      : out std_logic;
	riseQ  : out std_logic;
	fallQ  : out std_logic;

	Din    : in  std_logic_vector(7 downto 0);
	Dout   : out std_logic_vector(7 downto 0);
	ADDR   : out std_logic_vector(15 downto 0);
	RnW    : out std_logic;

	nIRQ   : in  std_logic := '1';
	nFIRQ  : in  std_logic := '1';
	nNMI   : in  std_logic := '1';
	nHALT  : in  std_logic := '1';
	nRESET : in  std_logic := '1'
);
end component mc6809;

--------------------------------------------------------------
-- Configuration
--------------------------------------------------------------
-- Select catridge rom around line 700
--------------------------------------------------------------
-- intensity level : more or less ram 
-------------------------------------
-- requires also comment/uncomment at two other places below
--
   constant vram_width : integer := 2; -- no intensity level
-- constant vram_width : integer := 4;  -- 3 intensity level
--------------------------------------------------------------
-- horizontal display (comment/uncomment whole section)
---------------------
-- constant horizontal_display : integer := 1;
-- constant max_h           : integer := 588; -- have to be multiple of 4
-- constant max_v           : integer := 444; 
-- constant max_x           : integer := 16875*8;
-- constant max_y           : integer := 22500*8; 
-- constant vram_addr_width : integer := 16;  -- 64k vram buffer (x4)
-- constant video_start_h   : integer := 160;
-- constant video_start_v   : integer := 50;
--------------------------------------------------------------
-- vertical display (comment/uncomment whole section)
-------------------
 constant horizontal_display : integer := 0;
 constant max_h           : integer := 312; -- have to be multiple of 4
 constant max_v           : integer := 416;
 constant max_x           : integer := 22500*8;
 constant max_y           : integer := 16875*8;
 constant vram_addr_width : integer := 15;  -- 32k vram buffer (x4)
 constant video_start_h   : integer := 300;
 constant video_start_v   : integer := 70;
--------------------------------------------------------------
 
 signal clock_24n : std_logic;
 signal clock_div : std_logic_vector(3 downto 0);
 signal clock_div2: std_logic_vector(6 downto 0);
 signal clock_250k: std_logic;
 signal reset_n   : std_logic;

 signal cpu_clock  : std_logic;
 signal cpu_clock_en: std_logic;
 signal cpu_addr   : std_logic_vector(15 downto 0);
 signal cpu_di     : std_logic_vector( 7 downto 0);
 signal cpu_do     : std_logic_vector( 7 downto 0);
 signal cpu_rw     : std_logic;
 signal cpu_irq    : std_logic;
 signal cpu_firq   : std_logic;
 signal cpu_ifetch : std_logic;
 signal cpu_fetch  : std_logic;

 signal ram_cs   : std_logic;
 signal ram_do   : std_logic_vector( 7 downto 0);
 signal ram_we   : std_logic;

 signal rom_cs   : std_logic;
 signal rom_do   : std_logic_vector( 7 downto 0);

 signal cart_cs  : std_logic;
 --signal cart_do  : std_logic_vector( 7 downto 0);

 signal via_cs_n  : std_logic;
 signal via_do    : std_logic_vector(7 downto 0);
 signal via_ca1_i : std_logic;
 signal via_ca2_o : std_logic;
 signal via_cb2_o : std_logic;
 signal via_pa_i  : std_logic_vector(7 downto 0);
 signal via_pa_o  : std_logic_vector(7 downto 0);
 signal via_pb_i  : std_logic_vector(7 downto 0);
 signal via_pb_o  : std_logic_vector(7 downto 0);
 signal via_irq_n : std_logic;
 signal via_en_4  : std_logic;
 
  type delay_buffer_t is array(0 to 255) of std_logic_vector(17 downto 0);
 signal delay_buffer : delay_buffer_t;

 signal via_ca2_o_d : std_logic;
 signal via_cb2_o_d : std_logic;
 signal via_pa_o_d  : std_logic_vector(7 downto 0);
 signal via_pb_o_d  : std_logic_vector(7 downto 0);

 
 signal sh_dac  : std_logic;
 signal dac_mux : std_logic_vector(2 downto 1);
 signal zero_integrator_n : std_logic;
 signal ramp_integrator_n : std_logic;
 signal beam_blank_n      : std_logic;
  
 signal dac       : signed(8 downto 0);
 signal dac_y     : signed(8 downto 0);
 signal dac_z     : unsigned(7 downto 0);
 signal ref_level : signed(8 downto 0);
 signal z_level   : std_logic_vector(1 downto 0);
 signal dac_sound : std_logic_vector(7 downto 0);
 
 signal integrator_x : signed(19 downto 0);
 signal integrator_y : signed(19 downto 0);

 signal shifted_x : signed(19 downto 0);
 signal shifted_y : signed(19 downto 0);

 signal limited_x : unsigned(19 downto 0);
 signal limited_y : unsigned(19 downto 0);

 signal beam_h : unsigned(9 downto 0);
 signal beam_v : unsigned(9 downto 0);
  
 constant offset_y : integer := 0;
 constant offset_x : integer := 0;
 
 constant scale_x : integer := max_v*256*256/(2*max_x); 
 constant scale_y : integer := max_h*256*256/(2*max_y);
 
 signal beam_blank_buffer    : std_logic_vector(5 downto 0);
 signal beam_blank_n_delayed : std_logic;

 signal beam_video_addr : std_logic_vector(19 downto 0);
 signal scan_video_addr : std_logic_vector(19 downto 0);
 signal video_addr      : std_logic_vector(16 downto 0);
 
 signal phase : std_logic_vector(1 downto 0);
 
 signal video_we_0 : std_logic;
 signal video_we_1 : std_logic;
 signal video_we_2 : std_logic;
 signal video_we_3 : std_logic;
 signal video_rd   : std_logic;
 signal video_pixel: std_logic_vector(3 downto 0);
 
 signal read_0 : std_logic_vector(vram_width-1 downto 0);
 signal read_0b: std_logic_vector(vram_width-1 downto 0);
 signal read_1 : std_logic_vector(vram_width-1 downto 0);
 signal read_1b: std_logic_vector(vram_width-1 downto 0);
 signal read_2 : std_logic_vector(vram_width-1 downto 0);
 signal read_2b: std_logic_vector(vram_width-1 downto 0);
 signal read_3 : std_logic_vector(vram_width-1 downto 0);
 signal read_3b: std_logic_vector(vram_width-1 downto 0);
 signal pixel  : std_logic_vector(vram_width-1 downto 0);
 
 signal write_0 : std_logic_vector(vram_width-1 downto 0);
 signal write_1 : std_logic_vector(vram_width-1 downto 0);
 signal write_2 : std_logic_vector(vram_width-1 downto 0);
 signal write_3 : std_logic_vector(vram_width-1 downto 0);
 
 signal hcnt : std_logic_vector(9 downto 0);
 signal vcnt : std_logic_vector(9 downto 0);	
 signal hcnt_video : std_logic_vector(9 downto 0);
 signal vcnt_video : std_logic_vector(9 downto 0);
 
 signal hblank : std_logic;
 signal vblank : std_logic;

 signal frame_line : std_logic;
 
 signal ay_do          : std_logic_vector(7 downto 0);
 signal ay_audio_muxed : std_logic_vector(7 downto 0);
 signal ay_audio_chan  : std_logic_vector(1 downto 0);
 signal ay_chan_a      : std_logic_vector(7 downto 0);
 signal ay_chan_b      : std_logic_vector(7 downto 0);
 signal ay_chan_c      : std_logic_vector(7 downto 0);
 signal ay_ioa_oe      : std_logic;
 
 signal pot     : signed(7 downto 0);
 signal compare : std_logic;
 signal players_switches : std_logic_vector(7 downto 0);
 signal ay_ioa_out : std_logic_vector(7 downto 0);

 signal vectrex_bd_rate_div       : std_logic_vector(7 downto 0) := X"00";
 signal vectrex_serial_bit_in     : std_logic;
 signal vectrex_serial_bit_in_d   : std_logic;
 signal vectrex_serial_data_shift : std_logic_vector(7 downto 0) := X"00";
 signal vectrex_serial_bit_cnt    : std_logic_vector(3 downto 0) := X"0";
 signal vectrex_serial_byte_rdy   : std_logic;
 signal vectrex_serial_byte_out   : std_logic_vector(7 downto 0) := X"00";
 
 signal audio_1        : std_logic_vector(9 downto 0);
 signal audio_speech   : std_logic_vector(9 downto 0);
 --signal speech_mode    : std_logic_vector(1 downto 0);
 signal speech_rdy     : std_logic;
 signal sp0256_rdy     : std_logic;


 
begin

-- debug
process (clock_24)
begin 
	if rising_edge(clock_24) then
		if cpu_ifetch = '1' then
			dbg_cpu_addr <=  cpu_addr;
		end if;
	end if;		
end process;

-- clocks
reset_n <= not reset;
clock_24n <= not clock_24;

process (clock_24) begin
	if rising_edge(clock_24) then
		clock_div <= clock_div + '1';
	end if;
end process;

via_en_4  <= '1' when clock_div(1 downto 0) = "11" else '0';

process (clock_24, reset)
begin
	if reset='1' then
		clock_div2 <= (others=>'0');
	else 		
		if rising_edge(clock_24) then
			if clock_div2 >= 99 then
				clock_div2 <= (others=>'0');
			else
				clock_div2 <= clock_div2 + '1';
			end if;		
		end if;
	end if;	
end process;

clock_250k <= clock_div2(6);


--static ADDRESS_MAP_START(vectrex_map, AS_PROGRAM, 8, vectrex_state )
--	AM_RANGE(0x0000, 0x7fff) AM_NOP // cart area, handled at machine_start
--	AM_RANGE(0xc800, 0xcbff) AM_RAM AM_MIRROR(0x0400) AM_SHARE("gce_vectorram")
--	AM_RANGE(0xd000, 0xd7ff) AM_READWRITE(vectrex_via_r, vectrex_via_w)
--	AM_RANGE(0xe000, 0xffff) AM_ROM AM_REGION("maincpu", 0)
--ADDRESS_MAP_END

-- chip select
cart_cs  <= '1' when cpu_addr(15) = '0' else '0'; 	
ram_cs   <= '1' when cpu_addr(15 downto 12) = X"C"  else '0'; 
via_cs_n <= '0' when cpu_addr(15 downto 12) = X"D"  else '1'; 
rom_cs   <= '1' when cpu_addr(15 downto 13) = "111" else '0'; 
	
-- write enable working ram
ram_we <=   '1' when cpu_rw = '0' and ram_cs = '1' else '0';

-- misc
cpu_irq <= not via_irq_n;
cpu_firq <= btn14;
cart_rd <= cart_cs;
cpu_di <= cart_do when cart_cs  = '1' else
			 ram_do  when ram_cs   = '1' else
			 via_do  when via_cs_n = '0' else
			 rom_do  when rom_cs   = '1' else
			 X"00";

via_pa_i <= ay_do;
via_pb_i <= "00"&compare&"00000";

-- players controls
players_switches <= not(btn24&btn23&btn22&btn21&btn14&btn13&btn12&btn11) when speech_mode = '0' 
							else speech_rdy&speech_rdy&speech_rdy&speech_rdy & not(btn14&btn13&btn12&btn11);

with via_pb_o(2 downto 1) select  -- dac_mux but not delayed
pot <= pot_x_1 when "00",
		 pot_y_1 when "01",
		 pot_x_2 when "10",
		 pot_y_2 when others;

compare <= '1' when (pot(7)&pot) > signed(via_pa_o(7)&via_pa_o) else '0'; -- dac but not delayed

-- beam control

-- integrator related signals have to be delayed with respect to blank signal
-- tuned value : ~94 @ clock_12
-- (port A, port B, CA2 and CB2 are declared to be delayed. Unsued delayed signals/buffers
-- will be removed automaticaly by compiler so no ressources will be wasted)

process (clock_12)
begin
	if rising_edge(clock_12) then
	
		delay_buffer(0) <= via_cb2_o & via_ca2_o & via_pb_o & via_pa_o;
		for i in 255 downto 1 loop
			delay_buffer(i) <= delay_buffer(i-1) ;
		end loop;
		
		via_pa_o_d  <= delay_buffer(94)( 7 downto 0);
		via_pb_o_d  <= delay_buffer(94)(15 downto 8);
		via_ca2_o_d <= delay_buffer(94)(16);
		via_cb2_o_d <= delay_buffer(94)(17);
		
	end if;
end process;	

sh_dac            <= via_pb_o_d(0);
dac_mux           <= via_pb_o_d(2 downto 1);
zero_integrator_n <= via_ca2_o_d;
ramp_integrator_n <= via_pb_o_d(7);
beam_blank_n      <= via_cb2_o;      -- blank is not delayed
	 			 
dac <= signed(via_pa_o_d(7)&via_pa_o_d); -- must ensure sign extension for 0x80 value to be used in integrator equation

z_level <=  "11" when dac_z > 128 else 
				"10" when dac_z >  64 else
				"01" when dac_z >   0 else 
				"00";

process (clock_12, reset)
	variable limit_n : std_logic;
begin
	if reset='1' then
		null;
	else
      if rising_edge(clock_12) then
				
			if sh_dac = '0' then
				case dac_mux is
				when "00"   => dac_y     <= dac;
				when "01"   => ref_level <= dac;
				when "10"   => dac_z     <= unsigned(via_pa_o_d);
				when others => dac_sound <= via_pa_o_d;
				end case;
			end if;

			if zero_integrator_n = '0' then
				integrator_x <= (others=>'0');
				integrator_y <= (others=>'0');
			else
				if ramp_integrator_n = '0' then
					if horizontal_display = 1 then 
						integrator_x <= integrator_x + (ref_level - dac);   -- horizontal display
						integrator_y <= integrator_y + (ref_level - dac_y); -- horizontal display
					else
						integrator_x <= integrator_x + (ref_level - dac_y); -- vertical display
						integrator_y <= integrator_y - (ref_level - dac);   -- vertical display
					end if;
				end if;
			end if;
			
			-- set 'preserve registers' wihtin assignments editor to ease signaltap debuging

			shifted_x <= integrator_x+max_x-offset_x;
			shifted_y <= integrator_y+max_y-offset_y;
			
			-- limit and scaling should be enhanced
			
			limit_n := '1';
			if    shifted_x > 2*max_x then limited_x <= to_unsigned(2*max_x,20);
													 limit_n := '0'; 
			elsif shifted_x < 0       then limited_x <= (others=>'0');
													 limit_n := '0'; 
			else                           limited_x <= unsigned(shifted_x); end if;
						
			if    shifted_y > 2*max_y then limited_y <= to_unsigned(2*max_y,20);
													 limit_n := '0'; 
			elsif shifted_y < 0       then limited_y <= (others=>'0');
													 limit_n := '0'; 
			else                           limited_y <= unsigned(shifted_y); end if;
			
			-- integer computation to try making rounding computation during division 

			beam_v <= to_unsigned(to_integer(limited_x*to_unsigned(scale_x,10))/(256*256),10);
			beam_h <= to_unsigned(to_integer(limited_y*to_unsigned(scale_y,10))/(256*256),10);			
						
		   beam_video_addr <= std_logic_vector(beam_v * to_unsigned(max_h,10) + beam_h);
			
			-- compense beam_video_addr computation delay vs beam_blank
			
			beam_blank_buffer <= beam_blank_buffer(4 downto 0) & beam_blank_n;
			
			beam_blank_n_delayed <= beam_blank_buffer(3) and limit_n;
						
		end if;
	end if;
end process;

-- video buffer
--
-- 4 phases : (beam is fully asynchrone with video scanner)
--
-- |read previous pixels| write beam pixel | write updated pixels | write beam pixel |
-- |from the 4 buffers  | to one buffer    | to the 4 buffers     | to one buffer    |
--
-- Persistance simulation :
-- beam pixel are written as value 2
-- updated pixels is written as previous value-1
-- previous pixels are demuxed (serialized) and send to display
-- pixel is ON if value > 0
--
-- Intensity simulation :
-- if used (vram_witdh = 4) intensity is written by beam or read by scanner simultaneoulsy
-- with pixels. Its value is never modified.
--
-- Compared to real hardware : 
--   - fixed beam position has no effect on diplayed intensity.
--   - persitance management may show double trace for fast moving object
--   - flicker may appear where only lower intensity will be seen
--
process (reset, clock_24)
begin
	if reset='1' then
		phase <= (others => '0');
	else 
		if rising_edge(clock_24) then
			phase <= hcnt_video(1 downto 0);	
			
			video_we_0 <= '0';
			video_we_1 <= '0';
			video_we_2 <= '0';
			video_we_3 <= '0';
			
			case phase is
				when "00" =>
					video_addr <= scan_video_addr(18 downto 2);
					
				when "10" =>
					video_addr <= scan_video_addr(18 downto 2);
					if hblank = '0' and vblank = '0' then
						if read_0(1 downto 0) > "00" then video_we_0 <= '1'; write_0 <= read_0 - '1'; end if;
						if read_1(1 downto 0) > "00" then video_we_1 <= '1'; write_1 <= read_1 - '1'; end if;
						if read_2(1 downto 0) > "00" then video_we_2 <= '1'; write_2 <= read_2 - '1'; end if;
						if read_3(1 downto 0) > "00" then video_we_3 <= '1'; write_3 <= read_3 - '1'; end if;
 					end if;
					
				when others =>
					video_addr <= beam_video_addr(18 downto 2);
					if beam_blank_n_delayed = '1' then
						case beam_video_addr(1 downto 0) is
						
-- uncomment when vram_width is 4
--							when "00"   => video_we_0 <= '1'; write_0 <= z_level&"10"; 
--							when "01"   => video_we_1 <= '1'; write_1 <= z_level&"10";
--							when "10"   => video_we_2 <= '1'; write_2 <= z_level&"10";
--							when others => video_we_3 <= '1'; write_3 <= z_level&"10";
--
-- uncomment when vram_width is 2
							when "00"   => video_we_0 <= '1'; write_0 <= "10";
							when "01"   => video_we_1 <= '1'; write_1 <= "10";
							when "10"   => video_we_2 <= '1'; write_2 <= "10";
							when others => video_we_3 <= '1'; write_3 <= "10";
--							
						end case;
					end if;	
			end case;
			
			if phase = "01" then
				read_0 <= read_0b;
				read_1 <= read_1b;
				read_2 <= read_2b;
				read_3 <= read_3b;
			end if;

			case phase is
				when "10"   => pixel <= read_0;
				when "11"   => pixel <= read_1;
				when "00"   => pixel <= read_2;
				when others => pixel <= read_3;
			end case;
			
		end if;
	end if;
end process;


-- uncomment when vram_width is 4
--
--video_pixel <= pixel(3 downto 2)&"00" when (pixel(1 downto 0) > "00") and (hblank = '0') else "0000";
--
-- uncomment when vram_width is 2
--
video_pixel <= "1100" when (pixel(1 downto 0) > "00") and (hblank = '0') else "0000";
--

video_g <= video_pixel when frame_line = '0' else video_pixel or "0000";
video_b <= video_pixel when frame_line = '0' else video_pixel or "0000";
video_r <= video_pixel when frame_line = '0' else video_pixel or "0100";

buf_0 : entity work.gen_ram
generic map( dWidth => vram_width, aWidth => vram_addr_width)
port map( clk => clock_24n, we => video_we_0, addr => video_addr(vram_addr_width-1 downto 0),
          d   => write_0,   q  => read_0b);

buf_1 : entity work.gen_ram
generic map( dWidth => vram_width, aWidth => vram_addr_width)
port map( clk => clock_24n, we => video_we_1, addr => video_addr(vram_addr_width-1 downto 0),
          d   => write_1,   q  => read_1b);

buf_2 : entity work.gen_ram
generic map( dWidth => vram_width, aWidth => vram_addr_width)
port map( clk => clock_24n, we => video_we_2, addr => video_addr(vram_addr_width-1 downto 0),
          d   => write_2,   q  => read_2b);

buf_3 : entity work.gen_ram
generic map( dWidth => vram_width, aWidth => vram_addr_width)
port map( clk => clock_24n, we => video_we_3, addr => video_addr(vram_addr_width-1 downto 0),
          d   => write_3,   q  => read_3b);
			 
-------------------
-- Video scanner --
-------------------
process (reset, clock_24)
begin
	if reset='1' then
		hcnt  <= (others => '0');
		vcnt  <= (others => '0');
	else 
		if rising_edge(clock_24) then
		
			hcnt <= hcnt + '1';
			if hcnt = 767 then --799 for 25 MHz
				hcnt <= (others => '0');
				if vcnt = 523 then 
					vcnt <= (others => '0');
				else
					vcnt <= vcnt + '1';
				end if;
				if vcnt = 523 then video_vs <= '0'; end if;
				if vcnt =   1 then video_vs <= '1'; end if;
			end if;			
			
			if hcnt = 767 then video_hs <= '0'; end if; --799 for 25 MHz
			if hcnt =  90 then video_hs <= '1'; end if;
			
			if vcnt_video = 0 or vcnt_video = (max_v-1) then
				if hcnt_video = 3       then frame_line <= '1'; end if;
				if hcnt_video = max_h+3 then frame_line <= '0'; end if;				
			elsif vcnt_video > 0 and vcnt_video < (max_v-1) then 
				  if hcnt_video = 3 or hcnt_video = max_h+2 then frame_line <= '1';
				  else frame_line <= '0'; end if;
			else frame_line <= '0';	end if;
			
			if hcnt = video_start_h then 
				hcnt_video <= (others => '0');
				if vcnt = video_start_v then 
					vcnt_video <= (others => '0');
				else
					vcnt_video <= vcnt_video + '1';
				end if;
			else
				hcnt_video <= hcnt_video + '1';
			end if;	

			if hcnt_video =       3 then hblank <= '0'; end if;
			if hcnt_video = max_h+3 then hblank <= '1'; end if;
			if vcnt_video =       0 then vblank <= '0'; end if;			
			if vcnt_video =   max_v then vblank <= '1'; end if;
			
		end if;
	end if;
end process;

video_hblank <= hblank;
video_vblank <= vblank;
scan_video_addr <= vcnt_video * std_logic_vector(to_unsigned(max_h,10)) + hcnt_video;

-- sound
process (clock_24)
begin
	if rising_edge(clock_24) then
		if ay_audio_chan = "00" then ay_chan_a <= ay_audio_muxed; end if;
		if ay_audio_chan = "01" then ay_chan_b <= ay_audio_muxed; end if;
		if ay_audio_chan = "10" then ay_chan_c <= ay_audio_muxed; end if;
	end if;
end process;

audio_1  <=     ("00"&ay_chan_a) +
                ("00"&ay_chan_b) +
                ("00"&ay_chan_c) +
                ("00"&dac_sound);

audio_out <=  "000"&audio_1(9 downto 3) + audio_speech;

-- vectrex just toggle port A forced/high Z to produce serial data
-- when in high Z vectrex sense port A to get speech chip ready for new byte
vectrex_serial_bit_in <= (ay_ioa_oe or ay_ioa_out(4)) and speech_mode;

-- get serial data from vectrex joystick port

process (clock_24, reset)
  begin
	if reset='1' then
		vectrex_bd_rate_div <= X"00";
	elsif rising_edge(clock_24) then
		if cpu_clock_en = '1' then

                        vectrex_serial_bit_in_d <= vectrex_serial_bit_in;

                        if vectrex_serial_bit_in /= vectrex_serial_bit_in_d then -- reset baud counter on either edge
                                vectrex_bd_rate_div <= X"00";
                        else
                                if vectrex_bd_rate_div = X"9B" then -- 1.5MHz/156 = 9615kHz
                                        vectrex_bd_rate_div <= X"00";
                                else
                                        vectrex_bd_rate_div <= vectrex_bd_rate_div + '1';
                                end if;
                        end if;

                        if vectrex_bd_rate_div = X"4E" then
                                vectrex_serial_data_shift <=  vectrex_serial_bit_in  & vectrex_serial_data_shift(7 downto 1); -- serial is lsb first (ok speakjet/vecvoice/vecvox)

                                if vectrex_serial_bit_cnt = X"0" and vectrex_serial_bit_in = '0' then
                                        vectrex_serial_bit_cnt <= X"1";
                                        vectrex_serial_byte_rdy <= '0';
                                end if;

                                if vectrex_serial_bit_cnt > X"0" then
                                        vectrex_serial_bit_cnt <= vectrex_serial_bit_cnt + '1';
                                end if;

                                if vectrex_serial_bit_cnt = X"A" then
                                        vectrex_serial_bit_cnt <= X"0";
                                end if;

                        end if;

                        if vectrex_bd_rate_div = X"60" then
                                if vectrex_serial_bit_cnt = X"9" then
                                        vectrex_serial_byte_rdy <= '1';
                                        vectrex_serial_byte_out <= vectrex_serial_data_shift;
                                end if;
                        end if;

		end if;
	end if;
end process;
	
frame <= frame_line;	
---------------------------
-- components
---------------------------			

-- microprocessor 6809
main_cpu : mc6809
port map
(
	CLK    => clock_24,
	CLKEN  => via_en_4,
	nRESET => not reset,
	CPU    => not cpu,

	E      => cpu_clock,
	riseQ  => cpu_clock_en,

	Din    => cpu_di,
	Dout   => cpu_do,
	ADDR   => cpu_addr,
	RnW    => cpu_rw,

	nIRQ   => not cpu_irq,
	nFIRQ  => not cpu_firq
);

cpu_prog_rom : entity work.vectrex_exec_prom
port map(
 clk  => clock_24,
 addr => cpu_addr(12 downto 0),
 data => rom_do
);

--------------------------------------------------------------------
-- Select cartridge here, select right rom length within port map

--cart_do <= (others => '0');  -- no cartridge

--cart_rom : entity work.vectrex_AGT_prom
--cart_rom : entity work.vectrex_scramble_prom
--cart_rom : entity work.vectrex_berzerk_prom
--cart_rom : entity work.vectrex_spacewar_prom
--cart_rom : entity work.vectrex_frogger_prom
--cart_rom : entity work.vectrex_polepos_prom
--cart_rom : entity work.vectrex_ripoff_prom
--cart_rom : entity work.vectrex_spike_prom
--cart_rom : entity work.vectrex_startrek_prom
--cart_rom : entity work.vectrex_vecmania1_prom
--cart_rom : entity work.vectrex_webwars_prom
--cart_rom : entity work.vectrex_wotr_prom

--port map(
-- clk  => cpu_clock,
-- addr => cpu_addr(11 downto 0), -- scramble,berzerk,ripoff,spacewar,startrek
-- addr => cpu_addr(12 downto 0), -- polepos,spike,webwars
-- addr => cpu_addr(13 downto 0), -- frogger,AGT
-- addr => cpu_addr(14 downto 0), -- vecmania,wotr
 --data => cart_do
--);
--------------------------------------------------------------------

cart_addr <= cpu_addr(14 downto 0);

working_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_24,
 we   => ram_we,
 addr => cpu_addr(9 downto 0),
 d    => cpu_do,
 q    => ram_do
);

via6522_inst : entity work.M6522
port map(
 I_RS            => cpu_addr(3 downto 0),
 I_DATA          => cpu_do,
 O_DATA          => via_do,
 O_DATA_OE_L     => open,

 I_RW_L          => cpu_rw,
 I_CS1           => cpu_addr(12),
 I_CS2_L         => via_cs_n,

 O_IRQ_L         => via_irq_n,

 -- port a
 I_CA1           => via_ca1_i,
 I_CA2           => '0',
 O_CA2           => via_ca2_o,
 O_CA2_OE_L      => open,

 I_PA            => via_pa_i,
 O_PA            => via_pa_o,
 O_PA_OE_L       => open,

 -- port b
 I_CB1           => '0',
 O_CB1           => open,
 O_CB1_OE_L      => open,

 I_CB2           => '0',
 O_CB2           => via_cb2_o,
 O_CB2_OE_L      => open,

 I_PB            => via_pb_i,
 O_PB            => via_pb_o,
 O_PB_OE_L       => open,

 RESET_L         => reset_n,
 CLK             => clock_24,
 I_P2_H          => not cpu_clock,-- high for phase 2 clock  ____----__
 ENA_4           => via_en_4      -- 4x system clock (4HZ)   _-_-_-_-_-
);

-- AY-3-8910
ay_3_8910_2 : entity work.YM2149
port map(
  -- data bus
  I_DA       => via_pa_o,    -- in  std_logic_vector(7 downto 0);
  O_DA       => ay_do,     -- out std_logic_vector(7 downto 0);
  O_DA_OE_L  => open,      -- out std_logic;
  -- control
  I_A9_L     => '0',       -- in  std_logic;
  I_A8       => '1',       -- in  std_logic;
  I_BDIR     => via_pb_o(4),  -- in  std_logic;
  I_BC2      => '1',       -- in  std_logic;
  I_BC1      => via_pb_o(3),   -- in  std_logic;
  I_SEL_L    => '1',       -- in  std_logic;

  O_AUDIO    => ay_audio_muxed, -- out std_logic_vector(7 downto 0);
  O_CHAN     => ay_audio_chan,  -- out std_logic_vector(1 downto 0);

  -- port a
  I_IOA      => players_switches, -- in  std_logic_vector(7 downto 0);
  O_IOA      => ay_ioa_out,       -- out std_logic_vector(7 downto 0);
  O_IOA_OE_L => ay_ioa_oe,        -- out std_logic;
  -- port b
  I_IOB      => (others => '0'), -- in  std_logic_vector(7 downto 0);
  O_IOB      => open,            -- out std_logic_vector(7 downto 0);
  O_IOB_OE_L => open,            -- out std_logic;

  ENA        => cpu_clock_en,    -- in  std_logic; -- clock enable for higher speed operation
  RESET_L    => reset_n,         -- in  std_logic;
  CLK        => clock_24         -- in  std_logic
);

-- select hardware speakjet or VHDL sp0256

-- hardware speakjet chip interface
--speech_rdy <= speakjet_rdy;
--
--speakjet : entity work.vectrex_speakjet
--port map(	
--	cpu_clock    => cpu_clock,
--	clock_25     => clock_24,
--	reset        => reset,
--	
--	mode         => speech_mode,        -- "01" for sp0256, else for speakjet
--		
--	vectrex_serial_byte_out => vectrex_serial_byte_out,
--	vectrex_serial_byte_rdy => vectrex_serial_byte_rdy,
--	
--	speakjet_cmd => speakjet_cmd,       -- serial data to speakjet chip
--	speakjet_rdy => speakjet_rdy,       -- speakjet chip is ready to receive a new cmd
--	speakjet_pwm => speakjet_pwm,       -- speakjet chip audio output
--	
--	audio_out    => audio_speech
--
--);

-- sp0256 VHDL simulation
speech_rdy <= not sp0256_rdy;
 
sp0256 : entity work.sp0256
port map(
 clock_250k  => clock_250k,  
 reset       => reset,
 
 input_rdy      => sp0256_rdy,
 allophone      => vectrex_serial_byte_out(5 downto 0),
 trig_allophone => vectrex_serial_byte_rdy,
 
 audio_out      => audio_speech
  
);

 
end SYN;
