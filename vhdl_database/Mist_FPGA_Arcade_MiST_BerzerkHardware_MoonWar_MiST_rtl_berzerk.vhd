----------------------------------------------------------------------------------
-- berzerk by Dar (darfpga@aol.fr) (June 2018)
-- http://darfpga.blogspot.fr
----------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
-- T80/T80se - Version : 0304 /!\ (0247 has some interrupt vector problems)
-----------------------------
-- Z80 compatible microprocessor core
-- Copyright (c) 2001-2002 Daniel Wallner (jesus@opencores.org)
--               MikeJ March 2005
--               Wolfgang Scherr 2011-2015 (email: WoS <at> pin4 <dot> at)
---------------------------------------------------------------------------------
-- gen_ram.vhd & io_ps2_keyboard
-------------------------------- 
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
-- Use berzerk_de10_lite.sdc to compile (Timequest constraints)
-- /!\
-- Don't forget to set device configuration mode with memory initialization 
--  (Assignments/Device/Pin options/Configuration mode)
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--
-- Berzerk has not graphics tile nor sprite. Instead berzerk use a 1 pixel video
-- buffer and a color map buffer.
--
-- Video buffer is 256 pixels x 224 lines : 32 x 224 bytes 
--
-- Video buffer can be written by cpu @4000-5fff (normal write : cpu_do => vram_di)
-- video buffer and working ram share the same ram.
--
-- Video buffer can be written by cpu @6000-7fff 
-- 	in that case the written cpu data can be shifted and completed with previous written data
--    then the result can be bit reversed 0..7 => 7..0 (flopper)
--    then the result can be combined (alu) with the current video data at that address
--    shift/flop and alu function are controled by data written at I/O 0x4B
--    during such write flopper output is compared with current video data to detect 
--    pixel colision (called intercept)
--
-- color buffer is @8000-87ff :32x64 area of 1 byte 
-- one byte covers 2x4 pixels and 4 lines. 
-- bits 7-4 => 4 pixels of color1
-- bits 3-0 => 4 pixels of color2
-- color 4bits : intensity/blue/green/red
--
-- Sound effects uses a ptm6840 timer (3 channel) + noise generator and volume control
--

--
-----------------------------------------------------------------------------------------------
-- Problème rencontré : cpu_int acquitée par iorq durant le cylce de capture du vecteur
-- d'interruption => mauvais vecteur lu => plantage un peu plus tard.
--
-- Solution : ajouter m1_n dans l'equation d'acquitement de int. 
-----------------------------------------------------------------------------------------------
-- Mame command reminder
-- wpiset 40,1,w,1,{printf "a:%08x d:%02X",wpaddr,wpdata; g}
-- wpiset 40,1,w,(wpdata!=0) && (wpdata!=90) && (wpdata!=92),{printf "a:%08x d:%02X",wpaddr,wpdata; g}
-----------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity berzerk is
port(
  clock_10     : in std_logic;
  reset        : in std_logic;

  video_r      : out std_logic;
  video_g      : out std_logic;
  video_b      : out std_logic;
  video_hi     : out std_logic;
  video_clk    : out std_logic;
  video_csync  : out std_logic;
  video_hs     : out std_logic;
  video_vs     : out std_logic;
  video_hb     : out std_logic;
  video_vb     : out std_logic;  
  audio_out    : out std_logic_vector(15 downto 0);
  
  hyperflip    : in std_logic;
  coin1        : in std_logic;
  
  start1       : in std_logic;
  start2       : in std_logic;
  fire3        : in std_logic;
  fire2        : in std_logic;
  fire1        : in std_logic;
  cleft        : in std_logic;
  cright       : in std_logic;
  
  sw          : in std_logic_vector(9 downto 0);
  ledr        : out std_logic_vector(9 downto 0) := "0000000000";
  dbg_cpu_di   : out std_logic_vector( 7 downto 0);
  dbg_cpu_addr : out std_logic_vector(15 downto 0);
  dbg_cpu_addr_latch : out std_logic_vector(15 downto 0)
    
);
end berzerk;

architecture struct of berzerk is

-- clocks 
signal clock_10n : std_logic;
signal reset_n   : std_logic;

-- video syncs
signal hsync       : std_logic;
signal vsync       : std_logic;
signal csync       : std_logic;
signal blank       : std_logic;

-- global synchronisation
signal ena_pixel  : std_logic := '0';
signal hcnt   : std_logic_vector(8 downto 0);
signal vcnt   : std_logic_vector(8 downto 0);
signal hcnt_r : std_logic_vector(8 downto 0);
signal vcnt_r : std_logic_vector(8 downto 0);

-- Z80 interface 
signal cpu_clock  : std_logic;
signal cpu_wr_n   : std_logic;
signal cpu_addr   : std_logic_vector(15 downto 0);
signal cpu_do     : std_logic_vector(7 downto 0);
signal cpu_di     : std_logic_vector(7 downto 0);
signal cpu_di_r   : std_logic_vector(7 downto 0);
signal cpu_mreq_n : std_logic;
signal cpu_m1_n   : std_logic;
signal cpu_int_n  : std_logic := '1';
signal cpu_nmi_n  : std_logic := '1';
signal cpu_iorq_n : std_logic;
signal cpu_di_mem : std_logic_vector(7 downto 0);
signal cpu_di_io : std_logic_vector(7 downto 0);

-- rom/ram addr/we/do
signal prog2_rom_addr : std_logic_vector(15 downto 0);
signal prog1_do    : std_logic_vector(7 downto 0);
signal prog2_do    : std_logic_vector(7 downto 0);
signal mosram_do   : std_logic_vector(7 downto 0);
signal mosram_we   : std_logic;
signal vram_addr   : std_logic_vector(12 downto 0);
signal vram_di     : std_logic_vector( 7 downto 0);
signal vram_do     : std_logic_vector( 7 downto 0);
signal vram_we     : std_logic;
signal cram_addr   : std_logic_vector(10 downto 0);
signal cram_do     : std_logic_vector(7 downto 0);
signal cram_we     : std_logic;

-- I/O chip seclect
signal io1_cs     : std_logic;
signal io2_cs     : std_logic;

-- misc
signal int_enable : std_logic;
signal nmi_enable : std_logic;
signal inta       : std_logic;
signal vcnt_int   : std_logic;
signal vcnt_int_r : std_logic;
signal led_on     : std_logic;
--signal intercept       : std_logic;
signal intercept_latch : std_logic;

-- grapihcs computation
signal shifter_flopper_alu_cmd : std_logic_vector(7 downto 0);
signal last_data_written       : std_logic_vector(6 downto 0);
signal shifter_do              : std_logic_vector(7 downto 0);
signal flopper_do              : std_logic_vector(7 downto 0);
signal alu_do                  : std_logic_vector(7 downto 0);
signal vram_do_latch           : std_logic_vector(7 downto 0);

-- graphics data
signal graphx : std_logic_vector (7 downto 0);
signal colors : std_logic_vector (7 downto 0);
signal color  : std_logic_vector (3 downto 0);

-- player I/O 
signal player1  : std_logic_vector(7 downto 0);
signal player2  : std_logic_vector(7 downto 0);
signal system   : std_logic_vector(7 downto 0);

-- line doubler I/O
signal video   : std_logic_vector (3 downto 0);
signal video_i : std_logic_vector (3 downto 0);
signal video_o : std_logic_vector (3 downto 0);
signal video_s : std_logic_vector (3 downto 0);
signal hsync_o : std_logic;
signal vsync_o : std_logic;

signal sound_out   : std_logic_vector(11 downto 0);
signal speech_out  : std_logic_vector(11 downto 0);
signal speech_busy : std_logic;

signal dail : std_logic_vector(4 downto 0);

begin

--process(cpu_clock)
--begin
--dail <= "01111";
--	if (cleft = '1') then dail <= dail-1; end if;
--	if (cright = '1') then dail <= dail+1; end if;
--end process;

audio_out <= ("00"&speech_out&"00")+('0'&sound_out&"000");
clock_10n <= not clock_10;
reset_n   <= not reset;
ledr(0) <= led_on;

----------
-- debug
----------
dbg_cpu_addr <= cpu_addr;
process(cpu_clock, reset)
begin
	if rising_edge(cpu_clock) then
		if cpu_m1_n = '0' then
			dbg_cpu_addr_latch <= cpu_addr;
		end if;
	end if;
end process;

-----------------------
-- Enable pixel counter
-- and cpu clock
-----------------------
process(clock_10, reset)
begin
	if reset = '1' then
		ena_pixel <= '0';
	else
		if rising_edge(clock_10) then
		ena_pixel <= not ena_pixel;
		end if;
	end if;
end process;

cpu_clock <= hcnt(0);

------------------
-- video output
------------------
-- demux color nibbles
color <= colors(7 downto 4) when hcnt(2) = '0' else colors(3 downto 0);

-- serialize video byte
video <= color when graphx(to_integer(unsigned(not hcnt(2 downto 0)))) = '1' else "0000";

-----------------------
-- cpu write addressing
-- cpu I/O chips select
-----------------------																																	111110 0000000000
mosram_we <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 10) = "111110" else '0'; -- 0800-0bff  000010 0000000000
vram_we   <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 14) = "01"    and cpu_clock = '0' else '0'; -- 4000-5fff mirror 6000-7fff 
cram_we   <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 11) = "10000" and cpu_clock = '0' else '0'; -- 8000-87ff 

io1_cs   <=  '1' when cpu_iorq_n ='0' and cpu_m1_n = '1' and cpu_addr(7 downto 4) = "0100" else '0'; -- x40-x4f
io2_cs   <=  '1' when cpu_iorq_n ='0' and cpu_m1_n = '1' and cpu_addr(7 downto 5) = "011" else '0';  -- x60-x7f

---------------------------
-- enable/disable interrupt
-- latch/clear interrupt
-- led
---------------------------
vcnt_int <= (not(vcnt(6)) and vcnt(7)) or vcnt(8);

process (cpu_clock, reset)
begin
	if reset = '1' then
		nmi_enable <= '0';
		int_enable <= '0';
		led_on <= '0';
	else
		if rising_edge(cpu_clock) then
			if io1_cs ='1' then
				if cpu_addr(3 downto 0) = "1100" then nmi_enable <= '1'; end if; -- 4c 
				if cpu_addr(3 downto 0) = "1101" then nmi_enable <= '0'; end if; -- 4d
				if cpu_addr(3 downto 0) = "1111" and cpu_wr_n = '0' then int_enable <= cpu_do(0); end if; -- 4f
			end if;

			if io2_cs ='1' then
				if cpu_addr(2 downto 0) = "110" then led_on <= '0'; end if; -- 66 
				if cpu_addr(2 downto 0) = "111" then led_on <= '1'; end if; -- 67
			end if;
		end if;
	end if;
end process;

process (clock_10, cpu_iorq_n, cpu_addr, reset)
begin
	if reset = '1' then
		cpu_int_n <= '1';
		cpu_nmi_n <= '1';
	else

	if rising_edge(clock_10) then

		vcnt_r <= vcnt;
		vcnt_int_r <= vcnt_int;

		if nmi_enable = '1' then
			if vcnt_r(4) = '0' and vcnt(4) = '1' then  cpu_nmi_n <= '0';end if;
			if hcnt_r(0) = '0' and hcnt(0) = '1' then  cpu_nmi_n <= '1';end if; 
		else
			cpu_nmi_n <= '1';
		end if;		
		
	end if;
	
	if rising_edge(clock_10) then
		if cpu_iorq_n ='0' then
			-- m1_n avoid clear interrupt during vector reading
			if cpu_addr(7 downto 0) = X"4e" and cpu_m1_n = '1' then cpu_int_n <= '1'; end if; 
		end if;	
		if int_enable = '1' then
			if vcnt_int_r = '0' and vcnt_int = '1' then cpu_int_n <= '0';end if;
		end if;
	end if;
	
	end if;
end process;

------------------------------------
-- mux cpu data mem read and io read
------------------------------------
-- memory mux
with cpu_addr(15 downto 11) select 
	cpu_di_mem <=
		prog1_do  when "00000", -- 0000-07ff  16k  00
		prog1_do  when "00001", -- 0800-0fff  16k  00
		prog1_do  when "00010", -- 1000-17ff  16k  01
		prog1_do  when "00011", -- 1800-1fff  16k  01
		prog1_do  when "00100", -- 2000-27ff  16k  01
		prog1_do  when "00101", -- 2800-2fff  16k  10
		prog1_do  when "00110", -- 3000-37ff  16k  11
		prog1_do  when "00111", -- 3800-3fff  16k  11

		vram_do   when "01000", -- 4000-47ff
		vram_do   when "01001", -- 4800-4fff
		vram_do   when "01010", -- 5000-57ff
		vram_do   when "01011", -- 5800-5fff
		vram_do   when "01100", -- 6000-67ff 
		vram_do   when "01101", -- 6800-6fff
		vram_do   when "01110", -- 7000-77ff 
		vram_do   when "01111", -- 7800-7fff	
		
		cram_do   when "10000", -- 8000-87ff      10000 00000000000
		
		prog2_do  when "11000", -- c000-c7ff  4k  11000 00000000000
		prog2_do  when "11001", -- c800-cfff  4k  11001 00000000000
		mosram_do when "11111", -- f800-fbff      11111 00000000000
		x"FF"        when others;

-- I/O-2 mux
with cpu_addr(2 downto 0) select
	cpu_di_io <=
		X"00"  when "000", -- 60 (F3)
		X"F8"  when "001", -- 61 (F2)
		X"FF"  when "010", -- 62 (F6)
		X"FF"  when "011", -- 63 (F5)   
		X"FF"  when "100", -- 64 (F4)
		X"00"  when "101", -- 65 (SW2)
		X"00"  when "110", -- 66 (led on )
		X"00"  when "111", -- 67 (led off)   
		X"00"  when others;
		
------------------
-- player controls
------------------
dail1 : entity work.moonwar_dail
port map(
	clk      		=> clock_10,
	moveleft      	=> cleft,
	moveright      => cright,
	dailout      	=> dail
);

player1 <= not(fire1 & fire2 & fire3 & dail);--todo dail
player2 <= not(fire1 & fire2 & fire3 & dail);--todo dail
--system  <= not(coin1 & "000" & hyperflip & '0' & start2 & start1);
system  <= not(coin1 & "00000" & start2 & start1);



	
		
-- I/O-1 and final mux 00011111
-- pull up on ZPU board
cpu_di <=  "111111" & cpu_int_n & '0'           when cpu_iorq_n = '0' and cpu_m1_n = '0' -- interrupt vector
		else '0'&not(speech_busy)&"000000"        when io1_cs = '1' and cpu_addr(3 downto 0) = X"4"  -- speech board
		else player1                              when io1_cs = '1' and cpu_addr(3 downto 0) = X"8"  -- P1
		else system                               when io1_cs = '1' and cpu_addr(3 downto 0) = X"9"  -- sys
		else player2                              when io1_cs = '1' and cpu_addr(3 downto 0) = X"a"  -- P2
		else intercept_latch & "111111" & vcnt(8) when io1_cs = '1' and cpu_addr(3 downto 0) = X"e"
		else cpu_di_io                            when io2_cs = '1'
		else cpu_di_mem;

-- video memory computation
process(clock_10, reset)
begin
	if reset = '1' then
		shifter_flopper_alu_cmd <= (others => '0');
	else
		if rising_edge(clock_10) then

			if cpu_clock = '0' and ena_pixel = '1' then
				vram_do_latch <= vram_do;
			end if;
		
			if vram_we = '1' and cpu_addr(13) = '1' then
				if ena_pixel = '1' then
					last_data_written <= cpu_do(6 downto 0);
					
					if (vram_do_latch and flopper_do) /= X"00" then
						intercept_latch <= '1';					
					end if;
				end if;
			end if;
		
			if io1_cs = '1' then
				if cpu_addr(3 downto 0) = "1011" then  -- 4b
					shifter_flopper_alu_cmd <= cpu_do;
					last_data_written <= (others => '0');
					intercept_latch <= '0';
				end if;
			end if;
		end if;
	end if;
end process;

-- shifter - flopper
with shifter_flopper_alu_cmd(2 downto 0) select
	shifter_do <=                                   cpu_do(7 downto 0) when "000",
						last_data_written(         0)  & cpu_do(7 downto 1) when "001",
						last_data_written(1 downto 0)  & cpu_do(7 downto 2) when "010",
						last_data_written(2 downto 0)  & cpu_do(7 downto 3) when "011",
						last_data_written(3 downto 0)  & cpu_do(7 downto 4) when "100",
						last_data_written(4 downto 0)  & cpu_do(7 downto 5) when "101",
						last_data_written(5 downto 0)  & cpu_do(7 downto 6) when "110",
						last_data_written(6 downto 0)  & cpu_do(7         ) when others;

with shifter_flopper_alu_cmd(3) select
	flopper_do <=	shifter_do when '0',
						shifter_do(0)&shifter_do(1)&shifter_do(2)&shifter_do(3)&
						shifter_do(4)&shifter_do(5)&shifter_do(6)&shifter_do(7) when others;

-- 74181 - alu (logical computation only)
with not(shifter_flopper_alu_cmd(7 downto 4)) select
	alu_do <= 	not flopper_do                         when "0000",
					not(flopper_do  or      vram_do_latch) when "0001",
					not(flopper_do) and     vram_do_latch  when "0010",
					    X"00"                              when "0011",
					not(flopper_do  and     vram_do_latch) when "0100",
					                    not(vram_do_latch) when "0101",
					    flopper_do  xor     vram_do_latch  when "0110",
					    flopper_do  and not(vram_do_latch) when "0111",
					not(flopper_do) or      vram_do_latch  when "1000",
					not(flopper_do  xor     vram_do_latch) when "1001",
					                        vram_do_latch  when "1010",
					    flopper_do  and     vram_do_latch  when "1011",
					    X"FF"                              when "1100",
					    flopper_do  or  not(vram_do_latch) when "1101",
					    flopper_do  or      vram_do_latch  when "1110",
					    flopper_do                         when others;						

------------------------------------------------------
-- video & color ram address/data mux
------------------------------------------------------
with cpu_addr(13) select
	vram_di <= 	cpu_do when '0',
					alu_do when others;

vram_addr <= cpu_addr(12 downto 0) when cpu_clock = '0'
        else vcnt(7 downto 0) & hcnt(7 downto 3);

cram_addr <= cpu_addr(10 downto 0) when cpu_clock = '0'
        else vcnt(7 downto 2) & hcnt(7 downto 3);

-------------------------------------------------------
-- video & color ram read
-------------------------------------------------------
process(clock_10)
begin
	if rising_edge(clock_10) then
		if hcnt(2 downto 0) = "111" and ena_pixel = '1' then
			graphx <= vram_do;
			colors <= cram_do;
		end if;
	end if;
end process;

-- Sync and video counters
video_gen : entity work.video_gen
port map (
  clock     => clock_10,
  reset     => reset,
  ena_pixel => ena_pixel,
  hsync     => hsync,
  vsync     => vsync,
  csync     => csync,
  hblank     => video_hb,
  vblank     => video_vb,
  hcnt_o    => hcnt,
  vcnt_o    => vcnt
);

video_s <= video;
video_hs <= hsync;
video_vs <= vsync;
video_r  <= video_s(0);				
video_g  <= video_s(1);				
video_b  <= video_s(2);
video_hi <= video_s(3);
video_clk   <= clock_10;
video_csync <= csync;

-- Z80
Z80 : entity work.T80se
generic map(Mode => 0, T2Write => 1, IOWait => 1)
port map(
  RESET_n => reset_n,
  CLK_n   => cpu_clock,
  CLKEN   => '1', 
  WAIT_n  => '1',
  INT_n   => cpu_int_n,
  NMI_n   => cpu_nmi_n,
  BUSRQ_n => '1',
  M1_n    => cpu_m1_n,
  MREQ_n  => cpu_mreq_n,
  IORQ_n  => cpu_iorq_n,
  RD_n    => open,
  WR_n    => cpu_wr_n,
  RFSH_n  => open,
  HALT_n  => open,
  BUSAK_n => open,
  A       => cpu_addr,
  DI      => cpu_di,
  DO      => cpu_do
);


-- program roms 
program1 : entity work.MoonWar_program1
port map (
	addr  => cpu_addr(13 downto 0),
	clk   => clock_10n,
	data  => prog1_do
);

prog2_rom_addr <= cpu_addr-X"c000";

program2 : entity work.MoonWar_program2
port map (
	addr  => cpu_addr(11 downto 0),
	clk   => clock_10n,
	data  => prog2_do
);

-- working ram - 0800-0bff
mosram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_10n,
 we   => mosram_we,
 addr => cpu_addr( 9 downto 0),
 d    => cpu_do,
 q    => mosram_do
);

-- video/working ram - 4000-5fff mirrored 6000-7fff
vram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk  => clock_10n,
 we   => vram_we,
 addr => vram_addr,
 d    => vram_di,
 q    => vram_do
);

-- color ram - 8000-87ff
cram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk  => clock_10n,
 we   => cram_we,
 addr => cram_addr,
 d    => cpu_do,
 q    => cram_do
);


-- sound effects
berzerk_sound_fx : entity work.berzerk_sound_fx
port map(	
	clock  => cpu_clock,
	reset  => reset,
	cs     => io1_cs,
	addr   => cpu_addr(4 downto 0),
	di     => cpu_do,
   sample => sound_out
);

-- speech synthesis (s14001a)
berzerk_speech : entity work.berzerk_speech
port map(
	sw     => sw,
	clock  => cpu_clock,
	reset  => reset,
	cs     => io1_cs,
	wr_n   => cpu_wr_n,
	addr   => cpu_addr(4 downto 0),
	di     => cpu_do,
	busy   => speech_busy,
   sample => speech_out
);
------------------------------------------
end architecture;