---------------------------------------------------------------------------------
-- burger time by Dar (darfpga@aol.fr) (27/12/2017)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
-- gen_ram.vhd & io_ps2_keyboard
-------------------------------- 
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
---------------------------------------------------------------------------------
-- T65(b) core.Ver 301 by MikeJ March 2005
-- Latest version from www.fpgaarcade.com (original www.opencores.org)
---------------------------------------------------------------------------------
-- YM2149 (AY-3-8910)
-- Copyright (c) MikeJ - Jan 2005
---------------------------------------------------------------------------------
-- Use burger_timer_de10_lite.sdc to compile (Timequest constraints)
-- /!\
-- Don't forget to set device configuration mode with memory initialization 
--  (Assignments/Device/Pin options/Configuration mode)
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity burger_time is
port
(
	clock_12     : in std_logic;
	reset        : in std_logic;
	hwsel        : in integer range 0 to 1;
	
	video_r      : out std_logic_vector(2 downto 0);
	video_g      : out std_logic_vector(2 downto 0);
	video_b      : out std_logic_vector(1 downto 0);

	video_hs     : out std_logic;
	video_vs     : out std_logic;
	video_hblank : out std_logic;
	video_vblank : out std_logic;
	video_csync  : out std_logic;
	
	audio_out    : out std_logic_vector(10 downto 0);	
	P1     			: in std_logic_vector(7 downto 0);
	P2     			: in std_logic_vector(7 downto 0);
	SYS     			: in std_logic_vector(7 downto 0);
	DSW1     		: in std_logic_vector(6 downto 0);
	DSW2     		: in std_logic_vector(7 downto 0);
	prg_rom_addr	: out std_logic_vector(14 downto 0);
	prg_rom_do     : in std_logic_vector(7 downto 0);	
	snd_rom_addr	: out std_logic_vector(11 downto 0);
	snd_rom_do     : in std_logic_vector(7 downto 0);

	dl_clk        : in std_logic;
	dl_addr       : in std_logic_vector(16 downto 0);
	dl_data       : in std_logic_vector(7 downto 0);
	dl_wr         : in std_logic
  );
end burger_time;

architecture syn of burger_time is

  -- clocks, reset
  signal clock_12n      : std_logic;
  signal clock_6        : std_logic := '0';
  signal reset_n        : std_logic;
      
  -- cpu signals  
  signal cpu_addr       : std_logic_vector(23 downto 0);
  signal cpu_di         : std_logic_vector( 7 downto 0);
  signal cpu_di_dec     : std_logic_vector( 7 downto 0);
  signal cpu_do         : std_logic_vector( 7 downto 0);
  signal cpu_rw_n       : std_logic;
  signal cpu_nmi_n      : std_logic;
  signal cpu_sync       : std_logic;
  signal cpu_ena        : std_logic;
  signal had_written    : std_logic := '0';
  signal decrypt        : std_logic;
  
  -- program rom signals
  signal prog_rom_cs     : std_logic;
  signal prog_rom_do     : std_logic_vector(7 downto 0); 

  -- working ram signals
  signal wram_cs         : std_logic;
  signal wram_we         : std_logic;
  signal wram_do         : std_logic_vector(7 downto 0);

  -- foreground ram signals
  signal fg_ram_cs       : std_logic;
  signal fg_ram_low_we   : std_logic;
  signal fg_ram_high_we  : std_logic;
  signal fg_ram_addr_sel : std_logic_vector(1 downto 0);
  signal fg_ram_addr     : std_logic_vector(9 downto 0);
  signal fg_ram_low_do   : std_logic_vector(7 downto 0);
  signal fg_ram_high_do  : std_logic_vector(1 downto 0);

  
  -- video scan counter
  signal hcnt   : std_logic_vector(8 downto 0);
  signal vcnt   : std_logic_vector(8 downto 0);
  signal hsync0 : std_logic;
  signal hsync1 : std_logic;
  signal hsync2 : std_logic;
  signal csync  : std_logic;
  signal hblank : std_logic;
  signal vblank : std_logic;

  signal hcnt_flip : std_logic_vector(8 downto 0);
  signal vcnt_flip : std_logic_vector(8 downto 0);
  signal cocktail_we   : std_logic;
  signal cocktail_flip : std_logic := '0';
  signal hcnt8_r       : std_logic;
  signal hcnt8_rr      : std_logic;
 
	-- io
	signal io_cs      : std_logic;
	signal dip_sw1    : std_logic_vector(7 downto 0);
	signal dip_sw2    : std_logic_vector(7 downto 0);
	signal btn_p1     : std_logic_vector(7 downto 0);
	signal btn_p2     : std_logic_vector(7 downto 0);
	signal btn_system : std_logic_vector(7 downto 0);
	
	-- foreground and sprite graphix
	signal sprite_attr         : std_logic_vector( 2 downto 0);
	signal sprite_tile         : std_logic_vector( 7 downto 0);
	signal sprite_line         : std_logic_vector( 7 downto 0);
	signal sprite_buffer_addr  : std_logic_vector( 7 downto 0);
	signal sprite_buffer_addr_flip  : std_logic_vector( 7 downto 0);
	signal sprite_buffer_di    : std_logic_vector( 2 downto 0);
	signal sprite_buffer_do    : std_logic_vector( 2 downto 0);
	signal fg_grphx_addr       : std_logic_vector(12 downto 0);
	signal fg_grphx_addr_early : std_logic_vector(12 downto 0);
	signal fg_grphx_1_do       : std_logic_vector( 7 downto 0);
	signal fg_grphx_2_do       : std_logic_vector( 7 downto 0);
	signal fg_grphx_3_do       : std_logic_vector( 7 downto 0);
	signal fg_sp_grphx_1_do    : std_logic_vector( 7 downto 0);
	signal fg_sp_grphx_2_do    : std_logic_vector( 7 downto 0);
	signal fg_sp_grphx_3_do    : std_logic_vector( 7 downto 0);
	signal fg_sp_grphx_1       : std_logic_vector( 7 downto 0);	
	signal fg_sp_grphx_2       : std_logic_vector( 7 downto 0);
	signal fg_sp_grphx_3       : std_logic_vector( 7 downto 0);
	signal display_tile        : std_logic;
	signal fg_low_priority     : std_logic;
	signal fg_sp_bits          : std_logic_vector( 2 downto 0);
	signal sp_bits_out         : std_logic_vector( 2 downto 0);
	signal fg_bits             : std_logic_vector( 2 downto 0);

	-- color palette 
	signal palette_addr : std_logic_vector(3 downto 0);
	signal palette_cs   : std_logic;
	signal palette_we   : std_logic;
	signal palette_do   : std_logic_vector(7 downto 0);
	
	-- background map rom
	signal bg_map_addr : std_logic_vector(11 downto 0);
	signal bg_map_do   : std_logic_vector(7 downto 0);

	-- background control
	signal scroll1_we : std_logic;
	signal scroll1    : std_logic_vector(4 downto 0);
	signal scroll2_we : std_logic;
	signal scroll2    : std_logic_vector(7 downto 0);

	signal bg_hcnt	      : std_logic_vector( 7 downto 0);
	signal bg_scan_hcnt  : std_logic_vector( 9 downto 0);
	signal bg_scan_addr  : std_logic_vector( 9 downto 0);
	signal bg_grphx_addr : std_logic_vector(10 downto 0); 
	signal bg_grphx_1_do : std_logic_vector( 7 downto 0);
	signal bg_grphx_2_do : std_logic_vector( 7 downto 0);
	signal bg_grphx_3_do : std_logic_vector( 7 downto 0);
	signal bg_grphx_1    : std_logic_vector( 7 downto 0);
	signal bg_grphx_2    : std_logic_vector( 7 downto 0);
	signal bg_grphx_3    : std_logic_vector( 7 downto 0);
	signal bg_bits       : std_logic_vector( 2 downto 0);
	
	-- misc
	signal raz_nmi_we : std_logic;
	signal coin_r : std_logic;
	signal sound_req : std_logic;

	signal bg_map_we : std_logic;
	signal bg_graphx_1_we : std_logic;
	signal bg_graphx_2_we : std_logic;
	signal bg_graphx_3_we : std_logic;
	signal fg_sp_graphx_1_we : std_logic;
	signal fg_sp_graphx_2_we : std_logic;
	signal fg_sp_graphx_3_we : std_logic;
	signal fg_graphx_1_we : std_logic;
	signal fg_graphx_2_we : std_logic;
	signal fg_graphx_3_we : std_logic;

    constant HW_BTIME : integer := 0;
    constant HW_TISLAND : integer := 1;

begin

--process (clock_12, cpu_sync)
--begin 
--	if rising_edge(clock_12) then
--		if cpu_sync = '1' then
--			dbg_cpu_addr <= cpu_addr(15 downto 0);
--		end if;
--	end if;		
--end process;

reset_n <= not reset;
clock_12n <= not clock_12;
  
process (clock_12, reset)
  begin
	if reset='1' then
		clock_6 <= '0';
	else
      if rising_edge(clock_12) then
			clock_6 <= not clock_6;
		end if;
	end if;
end process;

-------------------
-- Video scanner --
-------------------

-- make hcnt and vcnt video scanner (from schematics !)
--
--  hcnt [0..255,256..383] => 384 pixels,  384/6Mhz => 1 line is 64us (15.625KHz)
--  vcnt [8..255,256..279] => 272 lines, 1 frame is 272 x 64us = 17.41ms (57.44Hz)

process (reset, clock_12, clock_6)
begin
	if reset='1' then
		hcnt  <= (others => '0');
		vcnt  <= (others => '0');
	else 
		if rising_edge(clock_12) and clock_6 = '1' then
			hcnt <= hcnt + '1';
			if hcnt = 383 then
				hcnt <= (others => '0');
				if vcnt = 260 then -- total should be 272 from Bump&Jump schematics !
					vcnt <= (others => '0');
				else
					vcnt <= vcnt + '1';
				end if;
			end if;			
		end if;

	end if;
end process;

hcnt_flip <= hcnt when cocktail_flip = '0' else not hcnt;
vcnt_flip <= not vcnt when cocktail_flip = '0' else vcnt;
dip_sw1 <= vblank & DSW1;
dip_sw2 <= DSW2;
btn_p1 <=  P1;
btn_p2 <=  P2;
btn_system <= SYS;

-- misc (coin, nmi, cocktail)
process (reset,clock_12)
begin
	if reset = '1' then
		cpu_nmi_n <= '1';
		had_written <='0';
		cocktail_flip <= '0';
	elsif rising_edge(clock_12)then
			coin_r <= btn_system(6) or btn_system(7);
			if coin_r = '0' and (btn_system(6) = '1' or btn_system(7) = '1') then
				cpu_nmi_n <= '0';
			end if;
			if raz_nmi_we = '1' then
				cpu_nmi_n <= '1';
			end if;
			if cpu_ena = '1' then
				if cpu_rw_n = '0' then
					had_written <= '1';
				elsif cpu_sync = '1' then
					had_written <= '0';
				end if;
			end if;
			if cocktail_we = '1' then
				cocktail_flip <= dip_sw1(6) and cpu_do(0);
			end if;
	end if;
end process;	


cpu_ena <= '1' when hcnt(2 downto 0) = "111" and clock_6 = '1' else '0';
  
-- chip select
wram_cs     <= '1' when cpu_addr(15 downto 11) = "00000"         else '0'; -- working ram     0000-07ff
io_cs       <= '1' when cpu_addr(15 downto  3) = "0100000000000" else '0'; -- player/dip_sw   4000-4007 (4004) 
fg_ram_cs   <= '1' when cpu_addr(15 downto 12) = "0001"          else '0'; -- foreground ram  1000-1fff
palette_cs  <= '1' when cpu_addr(15 downto  4) = "000011000000"  else '0'; -- palette ram     0c00-0c0f
prog_rom_cs <= '1' when cpu_addr(15) = '1' else '0';                       -- program rom     9000-ffff

-- write enable
wram_we        <= '1' when wram_cs = '1'   and cpu_rw_n = '0' and cpu_ena = '1' else '0'; -- 0000-07ff
raz_nmi_we     <= '1' when io_cs = '1'     and cpu_addr(2 downto 0) = "000" and cpu_rw_n = '0' and cpu_ena = '1' else '0'; -- 4000
scroll1_we     <= '1' when io_cs = '1'     and cpu_addr(2 downto 0) = "100" and cpu_rw_n = '0' and cpu_ena = '1' else '0'; -- 4004
scroll2_we     <= '1' when io_cs = '1'     and cpu_addr(2 downto 0) = "101" and cpu_rw_n = '0' and cpu_ena = '1' else '0'; -- 4005
cocktail_we    <= '1' when io_cs = '1'     and cpu_addr(2 downto 0) = "010" and cpu_rw_n = '0' and cpu_ena = '1' else '0'; -- 4002
sound_req      <= '1' when io_cs = '1'     and cpu_addr(2 downto 0) = "011" and cpu_rw_n = '0'         else '0'; -- 4003
fg_ram_low_we  <= '1' when fg_ram_cs = '1' and cpu_addr(10) = '0' and cpu_rw_n = '0' and cpu_ena = '1' else '0'; -- 1000-13ff & 1800-4bff
fg_ram_high_we <= '1' when fg_ram_cs = '1' and cpu_addr(10) = '1' and cpu_rw_n = '0' and cpu_ena = '1' else '0'; -- 1400-17ff & 1c00-4fff
palette_we     <= '1' when palette_cs = '1'                       and cpu_rw_n = '0' and cpu_ena = '1' else '0'; -- 0c00-0c0f

-- cpu di mux
cpu_di <= wram_do        when wram_cs     = '1' else
			 prog_rom_do    when prog_rom_cs = '1' else
			 dip_sw1 		 when (io_cs = '1') and (cpu_addr(2 downto 0) = "011") else
			 dip_sw2        when (io_cs = '1') and (cpu_addr(2 downto 0) = "100") else
			 btn_p1         when (io_cs = '1') and (cpu_addr(2 downto 0) = "000") else
			 btn_p2         when (io_cs = '1') and (cpu_addr(2 downto 0) = "001") else
			 btn_system     when (io_cs = '1') and (cpu_addr(2 downto 0) = "010") else
			 fg_ram_low_do  when (fg_ram_cs = '1') and (cpu_addr(10) = '0') else
			 "000000"&fg_ram_high_do when (fg_ram_cs = '1') and (cpu_addr(10) = '1') else
          X"FF";
			 
-- decrypt fetched instruction
decrypt <= '1' when ((cpu_addr(15 downto 0) and X"0104") = X"0104") and (cpu_sync = '1') and (had_written = '1') else '0';
cpu_di_dec <= cpu_di when decrypt = '0' else
 				  cpu_di(6) & cpu_di(5) & cpu_di(3) & cpu_di(4) & cpu_di(2) & cpu_di(7) & cpu_di(1 downto 0);

----------------------------				  
-- foreground and sprites --
----------------------------
    
-- foreground ram addr
fg_ram_addr_sel <= "00" when cpu_ena = '1' and cpu_addr(11) = '0' else
						 "01" when cpu_ena = '1' and cpu_addr(11) = '1' else
						 "10" when cpu_ena = '0' and hcnt(8) = '0' else
						 "11";
  
with fg_ram_addr_sel select
fg_ram_addr <= cpu_addr(4 downto 0) & cpu_addr(9 downto 5)   when "00",    -- cpu mirrored addressing
				   cpu_addr(9 downto 0)                          when "01",    -- cpu normal addressing
					vcnt_flip(7 downto 3) & hcnt_flip(7 downto 3) when "10",    -- foreground tile scan addressing
					"00000" & hcnt(6 downto 2)                    when others;  -- sprite data scan addressing

-- latch sprite data, 
-- manage fg and sprite graphix rom address
-- manage sprite line buffer address
process (clock_12, clock_6)
begin
	if rising_edge(clock_12) and clock_6 = '1' then
		
		if  hcnt(3 downto 0) = "0000" then
			sprite_attr <= fg_ram_low_do(2 downto 0);
		end if;
		if  hcnt(3 downto 0) = "0100" then
			sprite_tile <= fg_ram_low_do(7 downto 0);
		end if;
		if  hcnt(3 downto 0) = "1000" then
			if sprite_attr(1) = '0' then
				sprite_line <=  vcnt_flip(7 downto 0) - 0 + fg_ram_low_do(7 downto 0);
			else
				sprite_line <= (vcnt_flip(7 downto 0) - 0 + fg_ram_low_do(7 downto 0)) xor X"0F"; -- flip V
			end if;
		end if;
		
		if hcnt(2 downto 0) = "100" then
			hcnt8_r <= hcnt(8);
			fg_grphx_addr_early <= fg_ram_high_do & fg_ram_low_do & vcnt_flip(2 downto 0); -- fg_ram_low_do(7) = '1' => low priority foreground
			if hcnt8_r = '1' then
				fg_grphx_addr <= sprite_tile & not (sprite_attr(2) xor hcnt_flip(3) xor cocktail_flip) & sprite_line(3 downto 0);
				if hcnt(3) = '1' then
					if (sprite_line(7 downto 4) = "1111") and (sprite_attr(0) = '1') then
						display_tile <= '1';
					else 
						display_tile <= '0';					
					end if;
				end if;
			else
				fg_grphx_addr <= fg_grphx_addr_early;
				display_tile <= '1';
			end if;
		end if;

		if hcnt8_r = '1' then
			if hcnt(3 downto 0) = X"D" then
				sprite_buffer_addr <= fg_ram_low_do(7 downto 0);			
				hcnt8_rr <= '1';
			else
				sprite_buffer_addr <= sprite_buffer_addr + '1';
			end if;	
		else
			if hcnt(7 downto 0) = X"0D" then 
				sprite_buffer_addr <= X"01"; -- (others => '0');
				hcnt8_rr <= '0';
			else
				sprite_buffer_addr <= sprite_buffer_addr + '1';
			end if;
		end if;
					
	end if;	
end process;

sprite_buffer_addr_flip <= not (sprite_buffer_addr) when hcnt8_rr = '0' and cocktail_flip = '1' else sprite_buffer_addr;

-- latch and shift foreground and sprite graphics
process (clock_12, clock_6)
begin
	if rising_edge(clock_12) and clock_6 = '1' then
		if hcnt(2 downto 0) = "101" then
			if display_tile = '1' then
				if hcnt8_r = '1' or hwsel = HW_BTIME then
					fg_sp_grphx_1 <= fg_sp_grphx_1_do;
					fg_sp_grphx_2 <= fg_sp_grphx_2_do;
					fg_sp_grphx_3 <= fg_sp_grphx_3_do;
				else
					fg_sp_grphx_1 <= fg_grphx_1_do;
					fg_sp_grphx_2 <= fg_grphx_2_do;
					fg_sp_grphx_3 <= fg_grphx_3_do;
				end if;
				fg_low_priority <= '1'; --fg_grphx_addr(10); -- #fg_ram_low_do(7) (always 1 for burger time) 
			else	
				fg_sp_grphx_1 <= (others =>'0');
				fg_sp_grphx_2 <= (others =>'0');
				fg_sp_grphx_3 <= (others =>'0');
			end if;
		elsif cocktail_flip = '0' or hcnt8_rr = '1' then
			fg_sp_grphx_1 <= '0' & fg_sp_grphx_1(7 downto 1);
			fg_sp_grphx_2 <= '0' & fg_sp_grphx_2(7 downto 1);
			fg_sp_grphx_3 <= '0' & fg_sp_grphx_3(7 downto 1);
		else
			fg_sp_grphx_1 <= fg_sp_grphx_1(6 downto 0) & '0';
			fg_sp_grphx_2 <= fg_sp_grphx_2(6 downto 0) & '0';
			fg_sp_grphx_3 <= fg_sp_grphx_3(6 downto 0) & '0';
		end if;
	end if;	
end process;

fg_sp_bits <= fg_sp_grphx_3(0) & fg_sp_grphx_2(0) & fg_sp_grphx_1(0) when cocktail_flip = '0' or hcnt8_rr = '1' else
				  fg_sp_grphx_3(7) & fg_sp_grphx_2(7) & fg_sp_grphx_1(7);
				  
-- data to sprite buffer
sprite_buffer_di <= "000"            when hcnt8_rr = '0' else -- clear ram after read
						  sprite_buffer_do when fg_sp_bits = "000" else fg_sp_bits; -- sp vs sp priority rules

-- read sprite buffer
process (clock_12,clock_6)
begin
	if rising_edge(clock_12) and clock_6 = '0' then
		if hcnt8_rr = '0' then
			sp_bits_out <= sprite_buffer_do;
		else
			sp_bits_out <= "000";
		end if;
	end if;
end process;

-- mux foreground and sprite buffer output with priorities
fg_bits <= sp_bits_out when (fg_sp_bits = "000") or (sp_bits_out/="000" and fg_low_priority = '1')  else fg_sp_bits;

----------------				  
-- background --
----------------

-- latch scroll1 & 2 data
process (clock_12n,clock_6) 
begin
	if rising_edge(clock_12n) and clock_6 = '1' then	
		if scroll1_we = '1' then 
			scroll1 <= cpu_do(4 downto 0);
		end if;		
		if scroll2_we = '1' then 
			scroll2 <= cpu_do;
		end if;		
	end if;
end process;

-- manage background rom map address
bg_scan_hcnt <= (hcnt_flip) + (scroll1(1 downto 0)&scroll2) + "0011110010" when cocktail_flip = '0' else
                (hcnt_flip) + (scroll1(1 downto 0)&scroll2) + "1100000101";

bg_map_addr <= '0'&scroll1(2) & bg_scan_hcnt(9 downto 4) & vcnt_flip(7 downto 4);

-- manage background graphics rom address
process (clock_12,clock_6) 
begin
	if rising_edge(clock_12) and clock_6 = '0' then	
		if bg_scan_hcnt(2 downto 0) = "000" then 
			bg_grphx_addr <= bg_map_do(5 downto 0) & bg_scan_hcnt(3) & vcnt_flip(3 downto 0);
		end if;		
	end if;
end process;
		
-- latch and shift background graphics
process (clock_12,clock_6)
begin
	if rising_edge(clock_12) and clock_6 = '1' then
		if scroll1(4) = '0' then
				bg_grphx_1 <= (others => '0');
				bg_grphx_2 <= (others => '0');		
				bg_grphx_3 <= (others => '0');		
		else	
			if bg_scan_hcnt(2 downto 0) = "000" then 
				bg_grphx_1 <= bg_grphx_1_do;
				bg_grphx_2 <= bg_grphx_2_do;
				bg_grphx_3 <= bg_grphx_3_do;
			elsif cocktail_flip = '0' then
				bg_grphx_1 <= '0' & bg_grphx_1(7 downto 1);
				bg_grphx_2 <= '0' & bg_grphx_2(7 downto 1);
				bg_grphx_3 <= '0' & bg_grphx_3(7 downto 1);
			else
				bg_grphx_1 <= bg_grphx_1(6 downto 0) & '0';
				bg_grphx_2 <= bg_grphx_2(6 downto 0) & '0';
				bg_grphx_3 <= bg_grphx_3(6 downto 0) & '0';
			end if;
		end if;
	end if;	
end process;
		
bg_bits <= bg_grphx_3(0) & bg_grphx_2(0) & bg_grphx_1(0) when cocktail_flip = '0' else
			  bg_grphx_3(7) & bg_grphx_2(7) & bg_grphx_1(7);

-- manage color palette address 	
palette_addr <= cpu_addr(3 downto 0) when palette_we = '1' else
					 '1'&bg_bits when fg_bits = "000" else	
					 '0'&fg_bits;

-- get palette output
process (clock_12,clock_6) 
begin
	if rising_edge(clock_12) and clock_6 = '0' then
		video_r <= not palette_do(2 downto 0);
		video_g <= not palette_do(5 downto 3);
		video_b <= not palette_do(7 downto 6);
	end if;	
end process;
				
----------------------------
-- video syncs and blanks --
----------------------------

video_csync <= csync;

process(clock_12,clock_6)
	constant hcnt_base : integer := 312;  --320
 	variable vsync_cnt : std_logic_vector(3 downto 0);
begin

if rising_edge(clock_12) and clock_6 = '1' then

  if    hcnt = hcnt_base+0  then hsync0 <= '0';
  elsif hcnt = hcnt_base+24 then hsync0 <= '1';
  end if;

  if    hcnt = hcnt_base+0       then hsync1 <= '0';
  elsif hcnt = hcnt_base+12      then hsync1 <= '1';
  elsif hcnt = hcnt_base+192-384 then hsync1 <= '0';
  elsif hcnt = hcnt_base+204-384 then hsync1 <= '1';
  end if;

  if    hcnt = hcnt_base+0          then hsync2 <= '0';
  elsif hcnt = hcnt_base+192-12-384 then hsync2 <= '1';
  elsif hcnt = hcnt_base+192-384    then hsync2 <= '0';
  elsif hcnt = hcnt_base+0-12       then hsync2 <= '1';
  end if;
  
  if hcnt = hcnt_base then 
	 if vcnt = 246 then
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

  if    hcnt = 267 then hblank <= '1'; 
  elsif hcnt = 14 then hblank <= '0';
  end if;

  if    vcnt = 248 then vblank <= '1';   
  elsif vcnt = 8   then vblank <= '0';   
  end if;

  -- external sync and blank outputs
  video_hs <= hsync0;
  
  if    vsync_cnt = 0 then video_vs <= '0';
  elsif vsync_cnt = 8 then video_vs <= '1';
  end if;

end if;
end process;

video_hblank <= hblank;
video_vblank <= vblank;
			
---------------------------
-- components
---------------------------			
			
cpu_inst : entity work.T65
port map
(
    Mode        => "00",  -- 6502
    Res_n       => reset_n,
    Enable      => cpu_ena,
    Clk         => clock_12,
    Rdy         => '1',
    Abort_n     => '1',
    IRQ_n       => '1',--cpu_irq_n,
    NMI_n       => cpu_nmi_n,
    SO_n        => '1',--cpu_so_n,
    R_W_n       => cpu_rw_n,
    Sync        => cpu_sync, -- open
    EF          => open,
    MF          => open,
    XF          => open,
    ML_n        => open,
    VP_n        => open,
    VDA         => open,
    VPA         => open,
    A           => cpu_addr,
    DI          => cpu_di_dec,
    DO          => cpu_do
);


-- working ram 
wram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk  => clock_12n,
 we   => wram_we,
 addr => cpu_addr( 10 downto 0),
 d    => cpu_do,
 q    => wram_do
);

-- program rom
--program_rom: entity work.prog
--port map(
-- clk  => clock_12n,
-- addr => cpu_addr(14 downto 0),
-- data => prog_rom_do
--);

prg_rom_addr <= cpu_addr(14 downto 0);
prog_rom_do <= prg_rom_do;

-- foreground ram low 
fg_ram_low : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_12n,
 we   => fg_ram_low_we,
 addr => fg_ram_addr,
 d    => cpu_do,
 q    => fg_ram_low_do
);

-- foreground ram high
fg_ram_high : entity work.gen_ram
generic map( dWidth => 2, aWidth => 10)
port map(
 clk  => clock_12n,
 we   => fg_ram_high_we,
 addr => fg_ram_addr,
 d    => cpu_do(1 downto 0),
 q    => fg_ram_high_do
);

-- foreground/sprite roms

fg_sp_graphx_1: entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_12n,
 addr_a => fg_grphx_addr,
 q_a    => fg_sp_grphx_1_do,
 clk_b  => dl_clk,
 addr_b => dl_addr(12 downto 0),
 we_b   => fg_sp_graphx_1_we,
 d_b    => dl_data
);

fg_sp_graphx_1_we <= '1' when dl_wr = '1' and dl_addr(16 downto 13) = "0110" else '0'; -- 0C000 - 0DFFF

fg_sp_graphx_2: entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_12n,
 addr_a => fg_grphx_addr,
 q_a    => fg_sp_grphx_2_do,
 clk_b  => dl_clk,
 addr_b => dl_addr(12 downto 0),
 we_b   => fg_sp_graphx_2_we,
 d_b    => dl_data
);

fg_sp_graphx_2_we <= '1' when dl_wr = '1' and dl_addr(16 downto 13) = "0111" else '0'; -- 0E000 - 0FFFF

fg_sp_graphx_3: entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_12n,
 addr_a => fg_grphx_addr,
 q_a    => fg_sp_grphx_3_do,
 clk_b  => dl_clk,
 addr_b => dl_addr(12 downto 0),
 we_b   => fg_sp_graphx_3_we,
 d_b    => dl_data
);

fg_sp_graphx_3_we <= '1' when dl_wr = '1' and dl_addr(16 downto 13) = "1000" else '0'; -- 10000 - 11FFF

-- foreground only rom (tisland, zoar)
fg_graphx_1: entity work.dpram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk_a  => clock_12n,
 addr_a => fg_grphx_addr(11 downto 0),
 q_a    => fg_grphx_1_do,
 clk_b  => dl_clk,
 addr_b => dl_addr(11 downto 0),
 we_b   => fg_graphx_1_we,
 d_b    => dl_data
);

fg_graphx_1_we <= '1' when dl_wr = '1' and dl_addr(16 downto 12) = "10010" else '0'; -- 12000 - 12FFF

fg_graphx_2: entity work.dpram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk_a  => clock_12n,
 addr_a => fg_grphx_addr(11 downto 0),
 q_a    => fg_grphx_2_do,
 clk_b  => dl_clk,
 addr_b => dl_addr(11 downto 0),
 we_b   => fg_graphx_2_we,
 d_b    => dl_data
);

fg_graphx_2_we <= '1' when dl_wr = '1' and dl_addr(16 downto 12) = "10011" else '0'; -- 13000 - 13FFF

fg_graphx_3: entity work.dpram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk_a  => clock_12n,
 addr_a => fg_grphx_addr(11 downto 0),
 q_a    => fg_grphx_3_do,
 clk_b  => dl_clk,
 addr_b => dl_addr(11 downto 0),
 we_b   => fg_graphx_3_we,
 d_b    => dl_data
);

fg_graphx_3_we <= '1' when dl_wr = '1' and dl_addr(16 downto 12) = "10100" else '0'; -- 14000 - 14FFF

-- sprite buffer ram
sprite_buffer_ram : entity work.gen_ram
generic map( dWidth => 3, aWidth => 8)
port map(
 clk  => clock_12n,
 we   => clock_6,
 addr => sprite_buffer_addr_flip,
 d    => sprite_buffer_di,
 q    => sprite_buffer_do
);

-- color palette ram
color_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 4)
port map(
 clk  => clock_12n,
 we   => palette_we,
 addr => palette_addr,
 d    => cpu_do,
 q    => palette_do
);

bg_map: entity work.dpram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk_a  => clock_12n,
 addr_a => bg_map_addr,
 q_a    => bg_map_do,
 clk_b  => dl_clk,
 addr_b => dl_addr(11 downto 0),
 we_b   => bg_map_we,
 d_b    => dl_data
);

bg_map_we <= '1' when dl_wr = '1' and dl_addr(16 downto 12) = "01001" else '0'; -- 09000 - 09FFF

bg_graphx_1: entity work.dpram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk_a  => clock_12n,
 addr_a => bg_grphx_addr,
 q_a    => bg_grphx_1_do,
 clk_b  => dl_clk,
 addr_b => dl_addr(10 downto 0),
 we_b   => bg_graphx_1_we,
 d_b    => dl_data
);

bg_graphx_1_we <= '1' when dl_wr = '1' and dl_addr(16 downto 11) = "010100" else '0'; -- 0A000 - 0A7FF

bg_graphx_2: entity work.dpram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk_a  => clock_12n,
 addr_a => bg_grphx_addr,
 q_a    => bg_grphx_2_do,
 clk_b  => dl_clk,
 addr_b => dl_addr(10 downto 0),
 we_b   => bg_graphx_2_we,
 d_b    => dl_data
);

bg_graphx_2_we <= '1' when dl_wr = '1' and dl_addr(16 downto 11) = "010101" else '0'; -- 0A800 - 0AFFF

bg_graphx_3: entity work.dpram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk_a  => clock_12n,
 addr_a => bg_grphx_addr,
 q_a    => bg_grphx_3_do,
 clk_b  => dl_clk,
 addr_b => dl_addr(10 downto 0),
 we_b   => bg_graphx_3_we,
 d_b    => dl_data
);

bg_graphx_3_we <= '1' when dl_wr = '1' and dl_addr(16 downto 11) = "010110" else '0'; -- 0B000 - 0B7FF

-- sound part
Sound: entity work.burger_time_sound
port map(
	clock_12  => clock_12,
	reset     => reset,
	
	sound_req     => sound_req,
	sound_code_in => cpu_do,
	sound_timing  => vcnt(3),

	audio_out     => audio_out,
	snd_rom_addr  => snd_rom_addr,
	snd_rom_do    => snd_rom_do,	
	dbg_cpu_addr => open
);

end SYN;
