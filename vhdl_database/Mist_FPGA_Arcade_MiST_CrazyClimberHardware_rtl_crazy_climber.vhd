----------------------------------------------------------------------------------
-- Crazy climber - Dar - June 2018
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity crazy_climber is
port(
  clock_12  : in std_logic;
  reset        : in std_logic;
  video_r      : out std_logic_vector(3 downto 0);
  video_g      : out std_logic_vector(3 downto 0);
  video_b      : out std_logic_vector(3 downto 0);
  video_hblank : out std_logic;
  video_vblank : out std_logic;
  video_hs     : out std_logic;
  video_vs     : out std_logic;
  audio_out    : out std_logic_vector(15 downto 0);

  rom_addr     : out std_logic_vector(15 downto 0);
  rom_do       : in std_logic_vector(7 downto 0);

  p1           : in std_logic_vector(7 downto 0);
  p2           : in std_logic_vector(7 downto 0);
  sys1         : in std_logic_vector(7 downto 0);
  sys2         : in std_logic_vector(7 downto 0);
  dip          : in std_logic_vector(7 downto 0);
  
  hwsel        : in std_logic_vector(4 downto 0);

  dl_clock     : in std_logic;
  dl_addr      : in std_logic_vector(15 downto 0);
  dl_wr        : in std_logic;
  dl_data      : in std_logic_vector(7 downto 0)
);
end crazy_climber;

architecture struct of crazy_climber is

-- clocks 
signal clock_12n : std_logic;
signal reset_n   : std_logic;

-- video syncs
signal hsync       : std_logic;
signal vsync       : std_logic;
signal hblank       : std_logic;
signal vblank       : std_logic;

-- global synchronisation
signal ena_pixel  : std_logic := '0';
signal is_sprite  : std_logic;
signal sprite     : std_logic_vector(2 downto 0);
signal x_tile     : std_logic_vector(4 downto 0);
signal y_tile     : std_logic_vector(4 downto 0);
signal x_pixel    : std_logic_vector(2 downto 0);
signal y_pixel    : std_logic_vector(2 downto 0);
signal y_line     : std_logic_vector(7 downto 0);

signal y_sp_bg    : std_logic_vector(7 downto 0);
signal y_line_shift : std_logic_vector(7 downto 0);
signal attr_sp : std_logic_vector(7 downto 0);
signal attr_sp_bg : std_logic_vector(7 downto 0);
signal bg_tile_code : std_logic_vector(7 downto 0);

signal tile_graph_rom_addr    : std_logic_vector(12 downto 0);
signal tile_graph_rom_addr_mod : std_logic_vector(12 downto 0);
signal tile_graph_rom_bit0_do : std_logic_vector(7 downto 0);
signal tile_graph_rom_bit1_do : std_logic_vector(7 downto 0);
signal tile_graph_rom_bit2_do : std_logic_vector(7 downto 0);

signal big_sprite_tile_rom_addr : std_logic_vector(11 downto 0);
signal big_sprite_tile_rom_bit0_do : std_logic_vector(7 downto 0);
signal big_sprite_tile_rom_bit1_do : std_logic_vector(7 downto 0);
signal big_sprite_tile_rom_bit2_do : std_logic_vector(7 downto 0);

-- background and sprite tiles and graphics
signal tile_code   : std_logic_vector(12 downto 0);
signal tile_color  : std_logic_vector(3 downto 0);
signal x_sprite    : std_logic_vector(7 downto 0);
signal y_sprite    : std_logic_vector(7 downto 0);
signal keep_sprite : std_logic;

signal tile_color_r  : std_logic_vector(3 downto 0);
signal tile_graph1_r : std_logic_vector(7 downto 0);
signal tile_graph2_r : std_logic_vector(7 downto 0);
signal tile_graph3_r : std_logic_vector(7 downto 0);

signal pixel          : std_logic_vector(2 downto 0);
signal pixel_color    : std_logic_vector(6 downto 0);
signal pixel_color_r  : std_logic_vector(6 downto 0);

signal sprite_pixel_color  : std_logic_vector(6 downto 0);
signal palette_addr        : std_logic_vector(7 downto 0);
signal do_palette          : std_logic_vector(7 downto 0);
signal do_palette2         : std_logic_vector(7 downto 0);

signal addr_ram_sprite : std_logic_vector(8 downto 0);
signal is_sprite_r     : std_logic;

type ram_256x6 is array(0 to 255) of std_logic_vector(6 downto 0);
signal ram_sprite : ram_256x6;

-- big sprite tiles and graphics
signal x_big_sprite           : std_logic_vector(7 downto 0);
signal y_big_sprite           : std_logic_vector(7 downto 0);
signal y_line_big_sprite_shift: std_logic_vector(7 downto 0);
signal attr_big_sprite      : std_logic_vector(5 downto 0);
signal prio_big_sprite      : std_logic;

signal big_sprite_graph1    : std_logic_vector(7 downto 0);
signal big_sprite_graph2    : std_logic_vector(7 downto 0);
signal big_sprite_graph3    : std_logic_vector(7 downto 0);
signal xy_big_sprite_cclimber : std_logic_vector(7 downto 0);
signal xy_big_sprite_ckong  : std_logic_vector(7 downto 0);
signal xy_big_sprite        : std_logic_vector(7 downto 0);
signal big_sprite_tile_code : std_logic_vector(7 downto 0);
signal big_sprite_tile_code_r : std_logic_vector(7 downto 0);
signal is_big_sprite_on     : std_logic;
signal x_big_sprite_counter : std_logic_vector(7 downto 0);
--signal big_sprite_graph1_delay : std_logic_vector(7 downto 0);
--signal big_sprite_graph2_delay : std_logic_vector(7 downto 0);
--signal big_sprite_graph3_delay : std_logic_vector(7 downto 0);

signal do_big_sprite_palette   : std_logic_vector(7 downto 0);
signal big_sprite_pixel        : std_logic_vector(2 downto 0);
signal big_sprite_pixel_color_r: std_logic_vector(4 downto 0);
signal big_sprite_pixel_r      : std_logic_vector(2 downto 0);
signal big_sprite_color_r      : std_logic_vector(2 downto 0);

signal bgon                    : std_logic;
signal video_mux               : std_logic_vector(11 downto 0);

-- Z80 interface 
signal cpu_clock  : std_logic;
signal cpu_clock_en: std_logic;
signal cpu_wr_n   : std_logic;
signal cpu_addr   : std_logic_vector(15 downto 0);
signal cpu_do     : std_logic_vector(7 downto 0);
signal cpu_di     : std_logic_vector(7 downto 0);
signal cpu_mreq_n : std_logic;
signal cpu_m1_n   : std_logic;
signal cpu_int_n  : std_logic;
signal cpu_iorq_n : std_logic;
signal cpu_di_mem   : std_logic_vector(7 downto 0);
signal cpu_addr_mod : std_logic_vector(9 downto 0);

-- misc
signal reg4_we_n  : std_logic;
signal reg5_we_n  : std_logic;
signal reg6_we_n  : std_logic;
signal raz_int_n  : std_logic;

signal prog_do    : std_logic_vector(7 downto 0);
signal wram1_addr : std_logic_vector(10 downto 0);
signal wram1_do   : std_logic_vector(7 downto 0);
signal wram1_we   : std_logic;
signal wram2_do   : std_logic_vector(7 downto 0);
signal wram2_we   : std_logic;

signal tile_ram_addr : std_logic_vector(9 downto 0);
signal tile_ram_do   : std_logic_vector(7 downto 0);
signal tile_ram_we   : std_logic;
signal tile_ram_cs   : std_logic;

signal color_ram_addr: std_logic_vector(9 downto 0);
signal color_ram_do  : std_logic_vector(7 downto 0);
signal color_ram_we  : std_logic;
signal color_ram_cs  : std_logic;

signal big_sprite_ram_addr : std_logic_vector(7 downto 0);
signal big_sprite_ram_do   : std_logic_vector(7 downto 0);
signal big_sprite_ram_q    : std_logic_vector(7 downto 0);
signal big_sprite_ram_we   : std_logic;
signal big_sprite_ram_cs   : std_logic;

signal misc_rom0_addr      : std_logic_vector(11 downto 0);
signal misc_rom1_addr      : std_logic_vector(11 downto 0);
signal misc_rom0_do        : std_logic_vector(7 downto 0);
signal misc_rom1_do        : std_logic_vector(7 downto 0);
signal misc0_we            : std_logic;
signal misc1_we            : std_logic;

-- data bus from AY-3-8910
signal ym_8910_data : std_logic_vector(7 downto 0);

signal video_i : std_logic_vector (11 downto 0);
signal tile_bit0_we : std_logic;
signal tile_bit1_we : std_logic;
signal big_sprite_tile_bit0_we : std_logic;
signal big_sprite_tile_bit1_we : std_logic;
signal palette_we : std_logic;
signal palette2_we : std_logic;
signal big_sprite_palette_we : std_logic;

signal swimmer_palette_bank : std_logic;
signal swimmer_bgcolor      : std_logic_vector(7 downto 0);
signal swimmer_sidebg       : std_logic;
signal swimmer_sidebg_ena   : std_logic;

signal cc_audio_rom_addr : std_logic_vector(12 downto 0);
signal yamato_audio_rom_addr : std_logic_vector(12 downto 0);
signal swimmer_audio_rom_addr : std_logic_vector(12 downto 0);
signal audio_rom_addr : std_logic_vector(12 downto 0);
signal audio_rom_do : std_logic_vector(7 downto 0);
signal audio_rom_we : std_logic;
signal cc_audio_out : std_logic_vector(15 downto 0);
signal yamato_audio_out : std_logic_vector(15 downto 0);
signal yamato_audio_p0 : std_logic_vector(7 downto 0);
signal yamato_audio_p1 : std_logic_vector(7 downto 0);
signal swimmer_audio_out : std_logic_vector(15 downto 0);

-- decryption tool
signal prog_do_decrypted : std_logic_vector(7 downto 0); -- CClimber decrypt
signal prog_do_rpatrol   : std_logic_vector(7 downto 0); -- River Patrol decrypt
signal prog_do_segacrypt : std_logic_vector(7 downto 0); -- SEGA 315_5018

signal index : integer range 0 to 127;
signal index_vector : std_logic_vector(6 downto 0);
type convtable_t is array(0 to 127) of std_logic_vector(7 downto 0);
signal convtable: convtable_t:= (
	X"44",X"14",X"54",X"10",X"11",X"41",X"05",X"50",X"51",X"00",X"40",X"55",X"45",X"04",X"01",X"15",
	X"44",X"10",X"15",X"55",X"00",X"41",X"40",X"51",X"14",X"45",X"11",X"50",X"01",X"54",X"04",X"05",
	X"45",X"10",X"11",X"44",X"05",X"50",X"51",X"04",X"41",X"14",X"15",X"40",X"01",X"54",X"55",X"00",
	X"04",X"51",X"45",X"00",X"44",X"10",X"ff",X"55",X"11",X"54",X"50",X"40",X"05",X"ff",X"14",X"01",
	X"54",X"51",X"15",X"45",X"44",X"01",X"11",X"41",X"04",X"55",X"50",X"ff",X"00",X"10",X"40",X"ff",
	X"ff",X"54",X"14",X"50",X"51",X"01",X"ff",X"40",X"41",X"10",X"00",X"55",X"05",X"44",X"11",X"45",
	X"51",X"04",X"10",X"ff",X"50",X"40",X"00",X"ff",X"41",X"01",X"05",X"15",X"11",X"14",X"44",X"54",
	X"ff",X"ff",X"54",X"01",X"15",X"40",X"45",X"41",X"51",X"04",X"50",X"05",X"11",X"44",X"10",X"14");

signal sega_315_5018_idx : std_logic_vector(6 downto 0);
signal sega_315_5018: convtable_t := (
	x"88",x"a8",x"08",x"28",x"88",x"a8",x"80",x"a0",
	x"20",x"a0",x"28",x"a8",x"88",x"a8",x"80",x"a0",
	x"88",x"a8",x"80",x"a0",x"88",x"a8",x"80",x"a0",
	x"88",x"a8",x"80",x"a0",x"20",x"a0",x"28",x"a8",
	x"88",x"a8",x"08",x"28",x"88",x"a8",x"08",x"28",
	x"88",x"a8",x"80",x"a0",x"88",x"a8",x"80",x"a0",
	x"20",x"a0",x"28",x"a8",x"20",x"a0",x"28",x"a8",
	x"88",x"a8",x"80",x"a0",x"88",x"a8",x"80",x"a0",
	x"20",x"a0",x"28",x"a8",x"88",x"a8",x"08",x"28",
	x"20",x"a0",x"28",x"a8",x"28",x"20",x"a8",x"a0",
	x"a0",x"20",x"80",x"00",x"20",x"a0",x"28",x"a8",
	x"28",x"20",x"a8",x"a0",x"20",x"a0",x"28",x"a8",
	x"20",x"a0",x"28",x"a8",x"88",x"a8",x"08",x"28",
	x"88",x"a8",x"08",x"28",x"88",x"a8",x"08",x"28",
	x"a0",x"20",x"80",x"00",x"88",x"08",x"80",x"00",
	x"20",x"a0",x"28",x"a8",x"00",x"08",x"20",x"28"
);

signal hwmod : std_logic_vector(2 downto 0);
constant HW_CCLIMBER : std_logic_vector(2 downto 0) := "000";
constant HW_CKONG    : std_logic_vector(2 downto 0) := "001";
constant HW_YAMATO   : std_logic_vector(2 downto 0) := "010";
constant HW_SWIMMER  : std_logic_vector(2 downto 0) := "011";
constant HW_TOPROLLR : std_logic_vector(2 downto 0) := "100";

signal hwenc : std_logic_vector(1 downto 0);

begin

clock_12n <= not clock_12;
reset_n   <= not reset;

hwmod <= hwsel(2 downto 0);
hwenc <= hwsel(4 downto 3);

-----------------------
-- Enable pixel counter
-----------------------
process(clock_12)
begin
	if rising_edge(clock_12) then
		ena_pixel <= not ena_pixel;
	end if;
end process;

------------------
-- video output
------------------
bgon <= '1' when is_big_sprite_on = '0' and pixel_color_r(2 downto 0) = "000" else '0';
video_mux <= -- misc_rom1_do(3 downto 0) & misc_rom0_do when hwmod = HW_YAMATO and bgon = '1' else -- FIXME: find out Yamato background gradient method
             "100011000010" when hwmod = HW_SWIMMER and bgon = '1' and swimmer_sidebg_ena = '1' and swimmer_sidebg = '1' else
             swimmer_bgcolor(2 downto 0) & '0' & swimmer_bgcolor(5 downto 3) & '0' & swimmer_bgcolor(7 downto 6) & "00" when hwmod = HW_SWIMMER and bgon = '1' else
             do_palette2(3 downto 2) & "00" & do_palette2(1 downto 0) & do_palette(3) & '0' & do_palette(2 downto 0) & '0' when hwmod = HW_SWIMMER and is_big_sprite_on = '0' else
             do_palette(7 downto 6) & "00" & do_palette(5 downto 3) & '0' & do_palette(2 downto 0) & '0' when hwmod /= HW_YAMATO and is_big_sprite_on = '0' else 
             do_palette2(3 downto 0) & do_palette when hwmod = HW_YAMATO and is_big_sprite_on = '0' else
             do_big_sprite_palette(7 downto 6) & "00" & do_big_sprite_palette(5 downto 3) & '0' & do_big_sprite_palette(2 downto 0) & '0';

process(clock_12)
begin
	if rising_edge(clock_12) then
		if ena_pixel = '1' then
			if x_tile = "11001" then
				swimmer_sidebg <= '1';
			elsif x_tile = "00001" then
				swimmer_sidebg <= '0';
			end if;

			if hblank = '0' then
				video_i <= video_mux;			
			else
				video_i <= (others => '0');
			end if;
		end if;
	end if;
end process;

video_r     <= video_i(3 downto 0);
video_g     <= video_i(7 downto 4);
video_b     <= video_i(11 downto 8);

video_hblank <= hblank;
video_vblank <= vblank;

video_hs    <= hsync;
video_vs    <= vsync;

-----------------------
-- cpu write addressing
-----------------------
wram2_we   <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and (
               ((hwmod = HW_CKONG or hwmod = HW_YAMATO)    and cpu_addr(15 downto 11) = "01100") or -- 6000-67ff (ckong)
               (hwmod = HW_SWIMMER                         and cpu_addr(15 downto 11) = "10000"))   -- 8000-87ff (swimmer)
			    else '0'; 
wram1_we   <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and (
               (hwmod = HW_CCLIMBER                        and cpu_addr(15 downto 11) = "10000") or -- 8000-87ff (cclimber)
               ((hwmod = HW_CKONG or hwmod = HW_YAMATO)    and cpu_addr(15 downto 11) = "01101") or -- 6800-6bff (ckong)
               (hwmod = HW_SWIMMER                         and cpu_addr(15 downto 11) = "11000"))   -- c000-c7ff (guzzler)
               else '0';

tile_ram_cs       <= '1' when cpu_addr(15 downto 11) = "10010"    else '0'; -- 9000-93ff mirror 9400-97ff
color_ram_cs      <= '1' when cpu_addr(15 downto 11) = "10011"    else '0'; -- 9800-9bff
big_sprite_ram_cs <= '1' when cpu_addr(15 downto 11) = "10001" and
            (hwmod = HW_SWIMMER or cpu_addr(10 downto 8) = "000") else '0'; -- 8800-88ff
big_sprite_ram_we <= not(cpu_wr_n) and not(cpu_mreq_n) and big_sprite_ram_cs;

reg4_we_n <= '0' when cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 11) = "10100" else '1';
reg5_we_n <= '0' when cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 11) = "10101" else '1';
reg6_we_n <= '0' when cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 11) = "10110" else '1';

---------------------------
-- a000-a007 latch
---------------------------
process (clock_12)
begin
	if rising_edge(clock_12) then
		if cpu_clock_en = '1' and reg4_we_n = '0' then
			case cpu_addr(2 downto 0) is
				when "000" => raz_int_n <= cpu_do(0);
				when "001" => null; -- flipx
				when "010" => null; -- flipy
				when "011" => swimmer_sidebg_ena <= cpu_do(0);
				when "100" => swimmer_palette_bank <= cpu_do(0);
				when others => null;
			end case;
		end if;
	end if;
end process;

---------------------------
-- swimmer bgcolor latch
---------------------------
process (clock_12)
begin
	if rising_edge(clock_12) then
		if cpu_addr = x"b800" and cpu_mreq_n = '0' and cpu_wr_n = '0' then
			swimmer_bgcolor <= cpu_do;
		end if;
	end if;
end process;

-------------------------------
-- latch interrupt at last line 
-------------------------------
process(clock_12, raz_int_n)
begin
	if raz_int_n = '0' then
		cpu_int_n <= '1';
	else
		if rising_edge(clock_12) then
			if y_tile = "11100" and y_pixel = "000" then
				cpu_int_n <= '0';
			end if;
		end if;
	end if;
end process;

------------------------------------
-- mux cpu data mem read and io read
------------------------------------
index_vector <= prog_do(7) & prog_do(1) & cpu_addr(0) & prog_do(6) & prog_do(4) & prog_do(2) & prog_do(0);
index <= to_integer(unsigned(index_vector));

with cpu_m1_n select
	prog_do_decrypted <=
		prog_do                                  when '1',
		(prog_do and X"AA") or convtable(index)  when others;

prog_do_rpatrol <= prog_do xor x"79" when cpu_addr(0) = '0' else prog_do xor x"5b";

sega_315_5018_idx <= cpu_addr(12) & cpu_addr(8) & cpu_addr(4) & cpu_addr(0) & cpu_m1_n & (rom_do(5) xor rom_do(7)) & (rom_do(3) xor rom_do(7));
prog_do_segacrypt <= (rom_do and not X"A8") or (sega_315_5018(to_integer(unsigned(sega_315_5018_idx))) xor (rom_do(7) & '0' & rom_do(7) & '0' & rom_do(7) & "000"));

process(hwmod, cpu_addr, big_sprite_ram_q, tile_ram_do, color_ram_do, p1, p2, dip, sys1, sys2, 
	hwenc, prog_do, prog_do_decrypted, prog_do_rpatrol, prog_do_segacrypt, wram1_do, wram2_do)
begin
	cpu_di_mem <= X"FF";
	case cpu_addr(15 downto 11) is
		when "10001" => cpu_di_mem <= big_sprite_ram_q;  -- 8800-8fff (ram only at 8800-88ff)
 		when "10010" => cpu_di_mem <= tile_ram_do;       -- 9000-97ff (ram only at 9000-93ff)
		when "10011" => cpu_di_mem <= color_ram_do;      -- 9800-9fff (ram only at 9800-9bff)		
		when "10100" => cpu_di_mem <= p1;                -- a000
		when "10101" => cpu_di_mem <= p2;                -- a800
		when "10110" => cpu_di_mem <= dip;               -- b000
		when others => null;
	end case;

	if cpu_addr = x"b800" then cpu_di_mem <= sys1; end if;
	if cpu_addr = x"ba00" or cpu_addr = x"b880" then cpu_di_mem <= sys2; end if; -- yamato/swimmer

	if cpu_addr < x"6000" or cpu_addr(15 downto 12) = x"7" then
		case hwenc is
			when "01" => cpu_di_mem <= prog_do_decrypted;
			when "10" => cpu_di_mem <= prog_do_rpatrol;
			when "11" => cpu_di_mem <= prog_do_segacrypt;
			when others => cpu_di_mem <= prog_do;
		end case;
	end if;

	case hwmod is
		when HW_CCLIMBER =>
			if cpu_addr(15 downto 11) = "10000" then cpu_di_mem <= wram1_do; end if; -- 8000-87ff (ram only at 8000-83ff) cclimber only		
		when HW_CKONG | HW_YAMATO =>
			if cpu_addr(15 downto 11) = "01101" then cpu_di_mem <= wram1_do; end if; -- 6800-6fff (ram only at 6800-6bff) ckong only
			if cpu_addr(15 downto 11) = "01100" then cpu_di_mem <= wram2_do; end if; -- 6000-67ff                         ckong only
		when HW_SWIMMER =>
			if cpu_addr(15 downto 12) = x"6" or cpu_addr(15 downto 12) >= x"E" then cpu_di_mem <= prog_do; end if;
			if cpu_addr(15 downto 11) = "11000" then cpu_di_mem <= wram1_do; end if; -- c000-c7ff
			if cpu_addr(15 downto 11) = "10000" then cpu_di_mem <= wram2_do; end if; -- 8000-87ff
		when others => null;
	end case;
end process;

cpu_di <= ym_8910_data when cpu_iorq_n = '0' else cpu_di_mem;

process(clock_12, reset)
begin
	if reset = '1' then
		yamato_audio_p0 <= (others => '0');
		yamato_audio_p1 <= (others => '0');
	elsif rising_edge(clock_12) then
		if cpu_iorq_n = '0' and cpu_mreq_n = '1' and cpu_addr(7 downto 1) = 0 and cpu_wr_n = '0' then
			if cpu_addr(0) = '0' then
				yamato_audio_p0 <= cpu_do;
			else
				yamato_audio_p1 <= cpu_do;
			end if;
		end if;
	end if;
end process;

------------------------------------------------------
-- big_sprite_registers
------------------------------------------------------
process(clock_12)
begin
	if rising_edge(clock_12) then
		if cpu_wr_n = '0' and cpu_mreq_n ='0' and cpu_addr(15 downto 8) = X"98" and 
		   ((cpu_addr(7 downto 4) = x"D" and hwmod /= HW_SWIMMER) or (cpu_addr(7 downto 4) = X"F" and hwmod = HW_SWIMMER)) then
			if cpu_addr(3 downto 0) = X"C" then prio_big_sprite <= cpu_do(0); end if;
			if cpu_addr(3 downto 0) = X"D" then attr_big_sprite <= cpu_do(5 downto 0); end if;
			if cpu_addr(3 downto 0) = X"E" then y_big_sprite    <= cpu_do; end if;		
			if cpu_addr(3 downto 0) = X"F" then x_big_sprite    <= cpu_do; end if;
		end if;
	end if;
end process;

------------------------------------------------------
-- cpu addressing mode for color ram 98XX (ckong)
------------------------------------------------------
cpu_addr_mod <= cpu_addr(10 downto 6) & cpu_addr(4 downto 0);

-------------------------------------
-- color ram addressing scheme 
-------------------------------------
process(clock_12)
begin
	if rising_edge(clock_12) then
		color_ram_we <= '0';
		case x_pixel is
				
			when "000" =>	
				if is_sprite = '1' then 			
					color_ram_addr <= "00010" & sprite & "10"; -- y sprite -- ckong   (color ram 040-05f)
				else
					color_ram_addr <= "00000" & x_tile;-- bg scroll column -- ckong   (color ram 000-01f)
				end if;
				if ena_pixel = '1' then y_sp_bg <= color_ram_do; end if;

			when "010" =>	
				if is_sprite = '1' then 
					color_ram_addr <= "00010" & sprite & "01"; -- color sprite -- ckong (color ram 040-05f)
				else
					color_ram_addr <= '1' & y_line_shift(7 downto 4) & x_tile; -- color background -- ckong (color ram 040-05f)
				end if;
				if ena_pixel = '1' then attr_sp_bg <= color_ram_do; end if;

			when "100" =>	
				if is_sprite = '1' then 
					color_ram_addr <= "00010" & sprite & "00"; -- tile sprite -- ckong (color ram 040-05f)
				else
					color_ram_addr <= (others => '0');
				end if;
				if ena_pixel = '1' then attr_sp <= color_ram_do; end if;
						
			when "110" =>
				if is_sprite = '1' then 
					color_ram_addr <= "00010" & sprite & "11"; -- x sprite -- ckong (color ram 040-05f)
				else
					color_ram_addr <= (others => '0');
				end if;
				if ena_pixel = '1' then x_sprite <= color_ram_do; end if;
				
			when others =>
				color_ram_addr <= cpu_addr_mod;
				color_ram_we <= not(cpu_wr_n) and not(cpu_mreq_n) and color_ram_cs;				
				
		end case;	
	end if;
end process;

-------------------------------------
-- tile ram addressing scheme 
-------------------------------------
process(clock_12)
begin
	if rising_edge(clock_12) then
		tile_ram_we <= '0';
		case x_pixel is

			when "100" =>
				tile_ram_addr <= y_line_shift(7 downto 3) & x_tile;-- bg tile code

			when others =>
				tile_ram_addr <= cpu_addr(9 downto 0);
				tile_ram_we <= not(cpu_wr_n) and not(cpu_mreq_n) and tile_ram_cs;				

		end case;
	end if;
end process;

-------------------------------------
-- tile graph rom addressing scheme 
-------------------------------------
tile_graph_rom_bit2_do <= misc_rom0_do when hwmod = HW_SWIMMER else (others=>'0'); -- only for Swimmer and Guzzler
misc_rom0_addr <= "001" & x_tile & x_pixel & '0' when hwmod = HW_YAMATO else tile_graph_rom_addr_mod(11 downto 0);

process(clock_12)
begin
	if rising_edge(clock_12) then
		case x_pixel is
		
			when "100" =>
				if ena_pixel = '1' then
					bg_tile_code <= tile_ram_do;
				end if;
		
			when "110" =>
				if is_sprite = '1' then
						case attr_sp(7 downto 6) is
						when "00"   => tile_graph_rom_addr <= attr_sp_bg(4) & attr_sp_bg(5) & attr_sp(5 downto 0) & ((y_line_shift(3) & x_tile(0) & y_line_shift(2 downto 0)) xor "00000");
						when "01"   => tile_graph_rom_addr <= attr_sp_bg(4) & attr_sp_bg(5) & attr_sp(5 downto 0) & ((y_line_shift(3) & x_tile(0) & y_line_shift(2 downto 0)) xor "01000");
						when "10"   => tile_graph_rom_addr <= attr_sp_bg(4) & attr_sp_bg(5) & attr_sp(5 downto 0) & ((y_line_shift(3) & x_tile(0) & y_line_shift(2 downto 0)) xor "10111");
						when others => tile_graph_rom_addr <= attr_sp_bg(4) & attr_sp_bg(5) & attr_sp(5 downto 0) & ((y_line_shift(3) & x_tile(0) & y_line_shift(2 downto 0)) xor "11111");
						end case;
				else
					if (attr_sp_bg(7) = '0' or hwmod = HW_CKONG) then
						tile_graph_rom_addr <= attr_sp_bg(4) & attr_sp_bg(5) & bg_tile_code & y_line_shift(2 downto 0);
					else
						tile_graph_rom_addr <= attr_sp_bg(4) & attr_sp_bg(5) & bg_tile_code & not(y_line_shift(2 downto 0));
					end if;
				end if;

			when "111" =>
				if ena_pixel = '1' then
					tile_graph1_r <= tile_graph_rom_bit0_do;
					tile_graph2_r <= tile_graph_rom_bit1_do;
					tile_graph3_r <= tile_graph_rom_bit2_do;
					tile_color_r  <= attr_sp_bg(3 downto 0);
					
					if (is_sprite = '1' and attr_sp(6) = '1') or (is_sprite = '0' and attr_sp_bg(6) = '1' and (hwmod = HW_CCLIMBER or hwmod = HW_SWIMMER)) then 
						for i in 0 to 7 loop
							tile_graph1_r(i) <= tile_graph_rom_bit0_do(7-i);
							tile_graph2_r(i) <= tile_graph_rom_bit1_do(7-i);
							tile_graph3_r(i) <= tile_graph_rom_bit2_do(7-i);
						end loop;
					end if;

					is_sprite_r <= is_sprite;
					
					keep_sprite <= '0';
					if (y_line_shift(7 downto 4) = "1111") and (x_sprite /= X"00") and (y_sp_bg /= X"00") then
						keep_sprite <= '1';
					end if;
				
				end if;
				
			when others => null;		
				
		end case;	
	end if;
end process;

--------------------------------
-- sprite/ big sprite y position
--------------------------------
y_line                  <= y_tile & y_pixel;
y_line_shift            <= std_logic_vector(unsigned(y_line) + unsigned(y_sp_bg) + 1);
y_line_big_sprite_shift <= std_logic_vector(unsigned(y_line) + unsigned(y_big_sprite) + 1);

------------------------------------------
-- read/write sprite line-memory addresing
------------------------------------------
process (clock_12)
begin 
	if rising_edge(clock_12) then

		if ena_pixel = '1' then
			addr_ram_sprite <= addr_ram_sprite + '1';
		end if;

		if is_sprite = '1' and x_pixel = "111" and ena_pixel = '1' and x_tile(0) = '0' then
			addr_ram_sprite <= '0' & x_sprite;
		end if;

		if is_sprite = '0' and x_pixel = "111" and ena_pixel = '1' and x_tile = "00000" then
			addr_ram_sprite <= "000000001";
		end if;

	end if;
end process;

-------------------------------------
-- read/write sprite line-memory data
-------------------------------------
process (clock_12)
begin
	if rising_edge(clock_12) then
		if ena_pixel = '0' then
			sprite_pixel_color <= ram_sprite(to_integer(unsigned(addr_ram_sprite)));
		else
			if sprite_pixel_color(2 downto 0) = "000" then
				pixel_color_r <= pixel_color;
			else
				pixel_color_r <= sprite_pixel_color;
			end if;
		
			if is_sprite_r = '1' then
				if (keep_sprite = '1') and (addr_ram_sprite(8) = '0') then
					if sprite_pixel_color(2 downto 0) = "000" then
						ram_sprite(to_integer(unsigned(addr_ram_sprite))) <= pixel_color;
					else
						ram_sprite(to_integer(unsigned(addr_ram_sprite))) <= sprite_pixel_color;
					end if;
						
				end if;
			else
				ram_sprite(to_integer(unsigned(addr_ram_sprite))) <= (others => '0');
			end if;
		end if;
	end if;
end process;

-----------------------------------------------------------------
-- serialize background/sprite graph to pixel + concatenate color
-----------------------------------------------------------------
pixel <= tile_graph1_r(to_integer(unsigned(not x_pixel))) &	tile_graph2_r(to_integer(unsigned(not x_pixel))) & tile_graph3_r(to_integer(unsigned(not x_pixel)));
pixel_color <= tile_color_r & pixel when pixel /= "000" else (others => '0');

-------------------------------------
-- select big sprite ram tile address
-------------------------------------
with attr_big_sprite(5 downto 4) select
xy_big_sprite_cclimber <=    y_line_big_sprite_shift(6 downto 3)  & not(x_big_sprite_counter(6 downto 3)) when "01",
                        not (y_line_big_sprite_shift(6 downto 3)) & not(x_big_sprite_counter(6 downto 3)) when "11",
                             y_line_big_sprite_shift(6 downto 3)  &    (x_big_sprite_counter(6 downto 3)) when "00",
                        not (y_line_big_sprite_shift(6 downto 3)) &    (x_big_sprite_counter(6 downto 3)) when others;
with attr_big_sprite(5 downto 4) select
xy_big_sprite_ckong    <=    y_line_big_sprite_shift(6 downto 3)  & not(x_big_sprite_counter(6 downto 3)) when "00",
                        not (y_line_big_sprite_shift(6 downto 3)) & not(x_big_sprite_counter(6 downto 3)) when "10",
                             y_line_big_sprite_shift(6 downto 3)  &    (x_big_sprite_counter(6 downto 3)) when "01",
                        not (y_line_big_sprite_shift(6 downto 3)) &    (x_big_sprite_counter(6 downto 3)) when others;
xy_big_sprite <= xy_big_sprite_ckong when hwmod = HW_CKONG else xy_big_sprite_cclimber;

----------------------------------------
-- select big sprite graphic rom address
----------------------------------------
with attr_big_sprite(5) select
big_sprite_tile_rom_addr <= attr_big_sprite(3) & big_sprite_tile_code_r &      y_line_big_sprite_shift(2 downto 0) when '0',
                            attr_big_sprite(3) & big_sprite_tile_code_r & not (y_line_big_sprite_shift(2 downto 0)) when others;

------------------------------------
-- big sprite tile graph rom reading 
-------------------------------------
big_sprite_tile_rom_bit2_do <= misc_rom1_do; -- only for Guzzler and Swimmer
misc_rom1_addr <= "001" & x_tile & x_pixel & '0' when hwmod = HW_YAMATO else big_sprite_tile_rom_addr;

process(clock_12)
begin
	if rising_edge(clock_12) then

		if ena_pixel = '1' then

			-- big sprite video ram address and output latch
			if x_big_sprite_counter(2 downto 0) = "111" then
				big_sprite_ram_addr <= xy_big_sprite;
				big_sprite_tile_code <= big_sprite_ram_do;
			end if;

			x_big_sprite_counter <= x_big_sprite_counter + '1';

			if is_sprite = '1' and sprite = "110" then
				if hwmod = HW_CKONG then
					x_big_sprite_counter <= std_logic_vector(to_unsigned(16,8) - unsigned(x_big_sprite));
				else
					x_big_sprite_counter <= std_logic_vector(to_unsigned(128,8) + unsigned(x_big_sprite));
				end if;
			end if;

			if x_big_sprite_counter(2 downto 0) = "111" then
				big_sprite_tile_code_r <= big_sprite_tile_code;

				big_sprite_graph1 <= big_sprite_tile_rom_bit0_do;
				big_sprite_graph2 <= big_sprite_tile_rom_bit1_do;
				big_sprite_graph3 <= big_sprite_tile_rom_bit2_do;
				if (attr_big_sprite(4) = '0' and hwmod /= HW_CKONG) or 
				   (attr_big_sprite(4) = '1' and hwmod  = HW_CKONG) then
					for i in 0 to 7 loop
						big_sprite_graph1(i) <= big_sprite_tile_rom_bit0_do(7-i);
						big_sprite_graph2(i) <= big_sprite_tile_rom_bit1_do(7-i);
						big_sprite_graph3(i) <= big_sprite_tile_rom_bit2_do(7-i);
					end loop;
				end if;
			else
				big_sprite_graph1 <= '0'&big_sprite_graph1(7 downto 1);
				big_sprite_graph2 <= '0'&big_sprite_graph2(7 downto 1);
				big_sprite_graph3 <= '0'&big_sprite_graph3(7 downto 1);
			end if;
		end if;

	end if;
end process;

-----------------------------------------------------------------
-- serialize big sprite graph to pixel + concatenate color
-- clip big sprite display
-----------------------------------------------------------------
big_sprite_pixel <=
	big_sprite_graph1(0) &
	big_sprite_graph2(0) &
	big_sprite_graph3(0) when hwmod = HW_SWIMMER
	else
	'0' &
	big_sprite_graph1(0) &
	big_sprite_graph2(0);

process (clock_12)
begin
	if rising_edge(clock_12) then
		big_sprite_pixel_r <= big_sprite_pixel;
		big_sprite_color_r <= attr_big_sprite(2 downto 0);

		if big_sprite_pixel_r /= "000" and y_line_big_sprite_shift(7) = '1' and 
				x_big_sprite_counter >= (X"21") and
				x_big_sprite_counter <  (X"A1") then
			is_big_sprite_on <= '1';
		else
			is_big_sprite_on <= '0';
		end if;
	end if;
end process;

big_sprite_pixel_color_r <= big_sprite_color_r(1 downto 0) & big_sprite_pixel_r when hwmod = HW_SWIMMER else
                            big_sprite_color_r & big_sprite_pixel_r(1 downto 0);

-- Sync and video counters
video : entity work.video_gen
port map (
  clock_12   => clock_12,
  ena_pixel  => ena_pixel,
  hsync      => hsync,
  vsync      => vsync,
  csync      => open,
  hblank     => hblank,
  vblank     => vblank,

  is_sprite  => is_sprite,
  sprite     => sprite,
  x_tile     => x_tile,
  y_tile     => y_tile,
  x_pixel    => x_pixel,
  y_pixel    => y_pixel,

  cpu_clock  => cpu_clock,
  cpu_clock_en => cpu_clock_en
);

palette_addr <= swimmer_palette_bank & pixel_color_r when hwsel = HW_SWIMMER else "00" & pixel_color_r(6 downto 1);

-- sprite palette rom
palette: entity work.dpram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk_a  => clock_12,
 addr_a => palette_addr,
 q_a    => do_palette,
 clk_b  => dl_clock,
 addr_b => dl_addr(7 downto 0),
 we_b   => palette_we,
 d_b    => dl_data
);
palette_we <= '1' when dl_wr = '1' and dl_addr(15 downto 8) = "10100000" else '0';

palette2: entity work.dpram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk_a  => clock_12,
 addr_a => palette_addr,
 q_a    => do_palette2,
 clk_b  => dl_clock,
 addr_b => dl_addr(7 downto 0),
 we_b   => palette2_we,
 d_b    => dl_data
);
palette2_we <= '1' when dl_wr = '1' and dl_addr(15 downto 8) = "10100001" else '0';

-- big sprite palette rom
big_sprite_palette: entity work.dpram
generic map( dWidth => 8, aWidth => 5)
port map(
 clk_a  => clock_12,
 addr_a => big_sprite_pixel_color_r,
 q_a    => do_big_sprite_palette,
 clk_b  => dl_clock,
 addr_b => dl_addr(4 downto 0),
 we_b   => big_sprite_palette_we,
 d_b    => dl_data
);
big_sprite_palette_we <= '1' when dl_wr = '1' and dl_addr(15 downto 5) = "10100010000" else '0';

-- Z80
Z80 : entity work.T80se
generic map(Mode => 0, T2Write => 1, IOWait => 1)
port map(
  RESET_n => reset_n,
  CLK_n   => clock_12,
  CLKEN   => cpu_clock_en,
  WAIT_n  => '1',
  INT_n   => '1',
  NMI_n   => cpu_int_n,
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

prog_do <= rom_do;
rom_addr <= cpu_addr(15 downto 0);

-- working ram1 - 6800-6bff (ckong)
-- working ram1 - 8000-83ff (cclimber)
-- working ram1 - c000-c7ff (guzzler)

wram1_addr <= cpu_addr(10 downto 0) when hwmod = HW_SWIMMER else '0'&cpu_addr(9 downto 0);
wram1 : entity work.gen_ram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk  => clock_12n,
 we   => wram1_we,
 addr => wram1_addr,
 d    => cpu_do,
 q    => wram1_do
);

-- working ram2 - 6000-67ff (ckong)
-- working ram2 - 8000-87ff (swimmer)
wram2 : entity work.gen_ram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk  => clock_12n,
 we   => wram2_we,
 addr => cpu_addr( 10 downto 0),
 d    => cpu_do,
 q    => wram2_do
);

-- tile_ram - 9000-93ff 
tile_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_12n,
 we   => tile_ram_we,
 addr => tile_ram_addr,
 d    => cpu_do,
 q    => tile_ram_do
);

-- color_ram - 9800-9bff (9800-981F = 9820-983f ...)
color_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_12n,
 we   => color_ram_we,
 addr => color_ram_addr,
 d    => cpu_do,
 q    => color_ram_do
);

-- big_sprite_tile_ram - 8800-88ff
big_sprite_tile_ram : entity work.dpram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk_a  => clock_12n,
 addr_a => big_sprite_ram_addr,
 q_a    => big_sprite_ram_do,
 addr_b => cpu_addr(7 downto 0),
 clk_b  => clock_12,
 we_b   => big_sprite_ram_we,
 d_b    => cpu_do,
 q_b    => big_sprite_ram_q
);

audio_rom : entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_12,
 addr_a => audio_rom_addr,
 q_a    => audio_rom_do,
 clk_b  => dl_clock,
 addr_b => dl_addr(12 downto 0),
 we_b   => audio_rom_we,
 d_b    => dl_data
);

audio_rom_addr <= yamato_audio_rom_addr when hwmod = HW_YAMATO else swimmer_audio_rom_addr when hwmod = HW_SWIMMER else cc_audio_rom_addr;
audio_rom_we <= '1' when dl_wr = '1' and dl_addr(15 downto 13) = "000" else '0';

tile_graph_rom_addr_mod <= '0' & tile_graph_rom_addr(12) & tile_graph_rom_addr(10 downto 0) when hwmod = HW_CCLIMBER or hwmod = HW_SWIMMER else tile_graph_rom_addr;

-- sprite and background graphics rom
tile_bit0: entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_12n,
 addr_a => tile_graph_rom_addr_mod,
 q_a    => tile_graph_rom_bit0_do,
 clk_b  => dl_clock,
 addr_b => dl_addr(12 downto 0),
 we_b   => tile_bit0_we,
 d_b    => dl_data
);
tile_bit0_we <= '1' when dl_wr = '1' and dl_addr(15 downto 13) = "001" else '0';

tile_bit1: entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_12n,
 addr_a => tile_graph_rom_addr_mod,
 q_a    => tile_graph_rom_bit1_do,
 clk_b  => dl_clock,
 addr_b => dl_addr(12 downto 0),
 we_b   => tile_bit1_we,
 d_b    => dl_data
);
tile_bit1_we <= '1' when dl_wr = '1' and dl_addr(15 downto 13) = "010" else '0';

-- big sprite graphics rom 
big_sprite_tile_bit0 : entity work.dpram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk_a  => clock_12n,
 addr_a => big_sprite_tile_rom_addr,
 q_a    => big_sprite_tile_rom_bit0_do,
 clk_b  => dl_clock,
 addr_b => dl_addr(11 downto 0),
 we_b   => big_sprite_tile_bit0_we,
 d_b    => dl_data
);
big_sprite_tile_bit0_we <= '1' when dl_wr = '1' and dl_addr(15 downto 12) = "0110" else '0';

big_sprite_tile_bit1 : entity work.dpram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk_a  => clock_12n,
 addr_a => big_sprite_tile_rom_addr,
 q_a    => big_sprite_tile_rom_bit1_do,
 clk_b  => dl_clock,
 addr_b => dl_addr(11 downto 0),
 we_b   => big_sprite_tile_bit1_we,
 d_b    => dl_data
);
big_sprite_tile_bit1_we <= '1' when dl_wr = '1' and dl_addr(15 downto 12) = "0111" else '0';

-- misc roms
misc0 : entity work.dpram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk_a  => clock_12n,
 addr_a => misc_rom0_addr,
 q_a    => misc_rom0_do,
 clk_b  => dl_clock,
 addr_b => dl_addr(11 downto 0),
 we_b   => misc0_we,
 d_b    => dl_data
);
misc0_we <= '1' when dl_wr = '1' and dl_addr(15 downto 12) = "1000" else '0';

misc1 : entity work.dpram
generic map( dWidth => 8, aWidth => 12)
port map(
 clk_a  => clock_12n,
 addr_a => misc_rom1_addr,
 q_a    => misc_rom1_do,
 clk_b  => dl_clock,
 addr_b => dl_addr(11 downto 0),
 we_b   => misc1_we,
 d_b    => dl_data
);
misc1_we <= '1' when dl_wr = '1' and dl_addr(15 downto 12) = "1001" else '0';

-- sound
cclimber_sound : entity work.crazy_climber_sound
port map(
  clock_12     => clock_12,
  cpu_clock_en => cpu_clock_en,
  cpu_addr     => cpu_addr,
  cpu_data     => cpu_do,
  cpu_iorq_n   => cpu_iorq_n,
  reg4_we_n    => reg4_we_n,
  reg5_we_n    => reg5_we_n,
  reg6_we_n    => reg6_we_n,
  ym_2149_data => ym_8910_data,
  sound_sample => cc_audio_out,

  rom_addr     => cc_audio_rom_addr,
  rom_do       => audio_rom_do
);

yamato_sound : entity work.yamato_sound
port map (
  reset_n      => reset_n,
  clock_12     => clock_12,
  cpu_clock_en => cpu_clock_en,
  p0           => yamato_audio_p0,
  p1           => yamato_audio_p1,
  audio        => yamato_audio_out,

  rom_addr     => yamato_audio_rom_addr,
  rom_do       => audio_rom_do
);

swimmer_sound : entity work.swimmer_sound
port map (
  reset_n      => reset_n,
  clock_12     => clock_12,
  snd_we_n     => reg5_we_n,
  dio          => cpu_do,
  audio        => swimmer_audio_out,

  rom_addr     => swimmer_audio_rom_addr,
  rom_do       => audio_rom_do
);

audio_out <= yamato_audio_out when hwmod = HW_YAMATO else swimmer_audio_out when hwmod = HW_SWIMMER else cc_audio_out;
------------------------------------------
end architecture;