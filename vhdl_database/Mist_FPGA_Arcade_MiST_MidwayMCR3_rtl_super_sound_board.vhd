---------------------------------------------------------------------------------
-- Tapper sound board by Dar (darfpga@aol.fr) (19/10/2019)
-- http://darfpga.blogspot.fr
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
--
--  SOUND : 1xZ80 @ 2.0MHz CPU accessing its program rom, working ram, 2x-AY3-8910
--      8Kx8bits program rom
--      1Kx8bits working ram
--
--      1xAY-3-8910
--      3 sound channels
--
--      1xAY-3-8910
--      3 sound channels
--
--      6 sound modulation (required 8MHz signal => 40MHz/5)
--      2 global volume control (not activated - not sure it was used for kick )
--
--  I/O : 
--    4x8bits command registers from main cpu board (IRAM)
--    1x8bits status  registers to   main cpu board (STAT)
--    5x8bits input   buffers   to   main cpu board (IP0-IP5)
--    2x8bits output  registers from main cpu board (OP0/OP4)
--
---------------------------------------------------------------------------------
--  Schematics remarks :
--     Not sure global volume are used => both deactivated
--     Not sure if global channels are mixed together or not => allow for 
--        external control mixed/separated
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity super_sound_board is
port(
 clock_40     : in std_logic;
 reset        : in std_logic;

 main_cpu_addr : in std_logic_vector(7 downto 0);

 ssio_iowe     : in std_logic;
 ssio_di       : in std_logic_vector(7 downto 0); 
 ssio_do       : out std_logic_vector(7 downto 0);

 input_0 : in std_logic_vector(7 downto 0);
 input_1 : in std_logic_vector(7 downto 0);
 input_2 : in std_logic_vector(7 downto 0);
 input_3 : in std_logic_vector(7 downto 0);
 input_4 : in std_logic_vector(7 downto 0);

 output_5 : out std_logic_vector(7 downto 0);
 output_6 : out std_logic_vector(7 downto 0);

 separate_audio : in std_logic;

 audio_out_l : out std_logic_vector(15 downto 0);
 audio_out_r : out std_logic_vector(15 downto 0);

 cpu_rom_addr : out std_logic_vector(13 downto 0);
 cpu_rom_do : in std_logic_vector(7 downto 0);

 dbg_cpu_addr : out std_logic_vector(15 downto 0)
 );
end super_sound_board;

architecture struct of super_sound_board is

 signal reset_n   : std_logic;
 signal clock_snd : std_logic;
 signal clock_sndn: std_logic;

 signal clock_cnt1 : std_logic_vector(4 downto 0) := "00000";

 signal cpu_ena     : std_logic;
 signal ena_4Mhz    : std_logic;
 signal clk_8Mhz    : std_logic;

 signal cpu_addr    : std_logic_vector(15 downto 0);
 signal cpu_di      : std_logic_vector( 7 downto 0);
 signal cpu_do      : std_logic_vector( 7 downto 0);
 signal cpu_wr_n    : std_logic;
 signal cpu_rd_n    : std_logic;
 signal cpu_mreq_n  : std_logic;
 signal cpu_ioreq_n : std_logic;
 signal cpu_irq_n   : std_logic;
 signal cpu_m1_n    : std_logic;

-- signal cpu_rom_do  : std_logic_vector( 7 downto 0);

 signal wram_we     : std_logic;
 signal wram_do     : std_logic_vector( 7 downto 0);

 signal iram_0_do   : std_logic_vector( 7 downto 0);
 signal iram_1_do   : std_logic_vector( 7 downto 0);
 signal iram_2_do   : std_logic_vector( 7 downto 0);
 signal iram_3_do   : std_logic_vector( 7 downto 0);
 
 signal ssio_status : std_logic_vector( 7 downto 0);
 
 signal div_E11 : std_logic_vector(2 downto 0);  -- binary counter 3msb of E11 - 74161
 signal div_D11 : std_logic_vector(3 downto 0);  -- decade counter - D11 - 74160
 signal div_C12 : std_logic_vector(6 downto 0);  -- stage ripple counter - C12 - MC140247 
 signal clr_int : std_logic;

 signal ay1_audio_chan : std_logic_vector( 1 downto 0);
 signal ay1_audio_muxed: std_logic_vector( 7 downto 0);
 signal ay1_bc1        : std_logic;
 signal ay1_bdir       : std_logic;
 signal ay1_do         : std_logic_vector( 7 downto 0);
 signal ay1_cs         : std_logic;
 signal ay1_port_a     : std_logic_vector( 7 downto 0);
 signal ay1_port_b     : std_logic_vector( 7 downto 0);
 
 signal ay2_audio_chan : std_logic_vector( 1 downto 0);
 signal ay2_audio_muxed: std_logic_vector( 7 downto 0);
 signal ay2_bc1        : std_logic;
 signal ay2_bdir       : std_logic;
 signal ay2_do         : std_logic_vector( 7 downto 0);
 signal ay2_cs         : std_logic;
 signal ay2_port_a     : std_logic_vector( 7 downto 0);
 signal ay2_port_b     : std_logic_vector( 7 downto 0);
 
 signal ssio_82s123_addr        : std_logic_vector(4 downto 0);
 signal ssio_82s123_do          : std_logic_vector(7 downto 0);
 signal ssio_modulation_clock   : std_logic;
 signal ssio_modulation_clock_r : std_logic;
 signal ssio_modulation_load    : std_logic;
 signal modulation_counter_a1   : std_logic_vector(3 downto 0);
 signal modulation_counter_b1   : std_logic_vector(3 downto 0);
 signal modulation_counter_c1   : std_logic_vector(3 downto 0);
 signal modulation_counter_a2   : std_logic_vector(3 downto 0);
 signal modulation_counter_b2   : std_logic_vector(3 downto 0);
 signal modulation_counter_c2   : std_logic_vector(3 downto 0);

 signal ch_a1 : std_logic_vector(7 downto 0);
 signal ch_b1 : std_logic_vector(7 downto 0);
 signal ch_c1 : std_logic_vector(7 downto 0);
 signal ch_a2 : std_logic_vector(7 downto 0);
 signal ch_b2 : std_logic_vector(7 downto 0);
 signal ch_c2 : std_logic_vector(7 downto 0);
 
 -- K volume data : 148 138 127 112 95 72 42 0
 type bytes_array is array(0 to  7) of std_logic_vector(7 downto 0);
 signal K_volume : bytes_array := (X"94",X"8A",X"7F",X"70",X"5F",X"48",X"2A",X"00");

 signal volume_ch1 : std_logic_vector(7 downto 0);
 signal volume_ch2 : std_logic_vector(7 downto 0);
 
 signal snd_1    : std_logic_vector(17 downto 0);
 signal snd_2    : std_logic_vector(17 downto 0);
 signal snd_mono : std_logic_vector(18 downto 0);
 
begin

clock_snd  <= clock_40;
clock_sndn <= not clock_40;
reset_n    <= not reset;

-- debug 
process (reset, clock_snd)
begin
 if rising_edge(clock_snd) and cpu_ena ='1' and cpu_mreq_n ='0' then
  dbg_cpu_addr <= cpu_addr;
 end if;
end process;

-- make enables clock from clock_snd
process (clock_snd, reset)
begin
	if reset='1' then
		clock_cnt1 <= (others=>'0');
		clk_8Mhz	<= '0';
	else 
		if rising_edge(clock_snd) then
			if clock_cnt1 = "10011" then  -- divide by 20
				clock_cnt1 <= (others=>'0');
			else
				clock_cnt1 <= clock_cnt1 + 1;
			end if;

			if clock_cnt1 = "10011" or 
				clock_cnt1 = "00100" or
				clock_cnt1 = "01001" or
				clock_cnt1 = "01110" then 

				clk_8Mhz <= not clk_8Mhz;  -- (50% duty cycle)
			end if;

		end if;
	end if;
end process;
--
cpu_ena  <= '1' when clock_cnt1 = "00000" else '0'; -- (2.0MHz)

ena_4Mhz <= '1' when clock_cnt1 = "00000" or clock_cnt1 = "01010" else '0'; -- (4.0MHz)

------------------------------------------
-- cpu data input with address decoding --
------------------------------------------
cpu_di <= cpu_rom_do  when cpu_mreq_n = '0' and cpu_addr(15 downto 14) = "00" else -- 0x0000-0x3FFF
          wram_do     when cpu_mreq_n = '0' and cpu_addr(15 downto 12) = X"8" else -- 0x8000-0x83FF
          iram_0_do   when cpu_mreq_n = '0' and cpu_addr(15 downto  0)=  X"9000" else
          iram_1_do   when cpu_mreq_n = '0' and cpu_addr(15 downto  0)=  X"9001" else
          iram_2_do   when cpu_mreq_n = '0' and cpu_addr(15 downto  0)=  X"9002" else
          iram_3_do   when cpu_mreq_n = '0' and cpu_addr(15 downto  0)=  X"9003" else
          ay1_do      when cpu_mreq_n = '0' and cpu_addr(15 downto 12)=  X"A" else
          ay2_do      when cpu_mreq_n = '0' and cpu_addr(15 downto 12)=  X"B" else
          x"FF"       when cpu_mreq_n = '0' and cpu_addr(15 downto 12)=  X"F" else -- 0xF000  (sw3 dip - D14)
          x"FF";

------------------------------------------
-- write enable to working ram from CPU --
-- clear interrupt, cs for AY3-8910     --
-- ssio output to main cpu (read input) --
-- ssio status to main cpu              --
------------------------------------------
wram_we   <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 12) = X"8" else '0'; -- 0x8000-0x83FF
clr_int   <= '1' when cpu_mreq_n = '0' and cpu_rd_n = '0' and cpu_addr(15 downto 12) = X"E" else '0'; -- 0xE000-0xEFFF

ay1_cs <= '1' when cpu_mreq_n = '0' and (cpu_rd_n = '0' or cpu_wr_n = '0') and cpu_addr(15 downto 12) = X"A" else '0'; -- 0xA000-0xAFFF
ay2_cs <= '1' when cpu_mreq_n = '0' and (cpu_rd_n = '0' or cpu_wr_n = '0') and cpu_addr(15 downto 12) = X"B" else '0'; -- 0xB000-0xBFFF

ay1_bdir <= not (not ay1_cs or cpu_addr(0) );
ay1_bc1  <= not (not ay1_cs or cpu_addr(1) );
ay2_bdir <= not (not ay2_cs or cpu_addr(0) );
ay2_bc1  <= not (not ay2_cs or cpu_addr(1) );

ssio_do <= input_0     when main_cpu_addr(2 downto 0) = "000" else -- Input 0 -- players, coins, ...
           input_1     when main_cpu_addr(2 downto 0) = "001" else -- Input 1 
           input_2     when main_cpu_addr(2 downto 0) = "010" else -- Input 2
           input_3     when main_cpu_addr(2 downto 0) = "011" else -- Input 3 -- sw1 dip 
           input_4     when main_cpu_addr(2 downto 0) = "100" else -- Input 4 
           ssio_status when main_cpu_addr(2 downto 0) = "111" else -- ssio status
           x"FF";

process (clock_snd)
begin
	if rising_edge(clock_snd) then
		if cpu_wr_n = '0' and cpu_addr(15 downto 12) = X"C" then ssio_status <= cpu_do; end if; -- 0xC000-0xCFFF
	end if;
end process; 

------------------------------------------------------------------------
-- Misc registers : interrupt, counters E11/D11/C12
------------------------------------------------------------------------
process (clock_snd, reset, clr_int, ena_4Mhz)
begin
	if reset = '1' then
		div_E11 <= (others => '0');  -- 3msb of E11
		div_D11 <= (others => '0');  -- decade counter
		div_C12 <= (others => '0');  -- MC14024
	else
		if rising_edge(clock_snd) then

			if ena_4Mhz = '1' then 

				div_E11 <= div_E11 + 1;
				
				if div_E11 = "111" then
					if div_D11 = "1001" then
						div_D11 <= (others => '0');
					else
						div_D11 <= div_D11 + 1;
					end if;
					
					if div_D11 = "0100" then
						div_C12 <= div_C12 + 1;
					end if;
					
				end if;

			end if;

			if clr_int = '1' then
				div_C12 <= (others => '0');
			end if;

		end if;
	end if;
end process;

cpu_irq_n <= not div_C12(6);

-------------------------------
-- sound modulation / volume --
-------------------------------

ssio_82s123_addr <= div_D11 & div_E11(2);

--74166 8 bits shift register (D13)
ssio_modulation_clock <= ssio_82s123_do(7-to_integer(unsigned(div_E11(1 downto 0) & clk_8Mhz)));
ssio_modulation_load <= '1' when div_D11 = "1001" else '0';

-- AY-3-8910 #1 
-- ch A (pin  4) modulated by counter controled by port A3-0 (pin 18->21)
-- ch B (pin  3) modulated by counter controled by port A7-4 (pin 14->17)
-- ch C (pin 38) modulated by counter controled by port B3-0 (pin 10->13)
-- mute left and right port B7 (pin 6)
-- volume#1  contoled by port B6-4 (pin 7->9)

-- AY-3-8910 #2
-- ch A (pin  4) modulated by counter controled by port A3-0 (pin 18->21)
-- ch B (pin  3) modulated by counter controled by port A7-4 (pin 14->17)
-- ch C (pin 38) modulated by counter controled by port B3-0 (pin 10->13)
-- mute global port B7 (pin 6)
-- volume#2 contoled by port B6-4 (pin 7->9)

-- 4051 cmos mux (D5 and E3)
--   CBA 
--   000 => switch X0 (pin 13) ON others OFF
--   001 => switch X1 (pin 14) ON others OFF
--   ...
--   111 => switch X7 (pin  4) ON others OFF

-- Assuming R179 to R187 equivalent to
--
--             --------
--     --------|  R2  |--------        -- with R1 = 24k + n*4.7k
--     ^   |   --------   |   ^        --      R2 = 24k
--     |  ---            ---  |        --      R3 = (7-n)*4.7
--     |  | |            | |  |        --
-- Vin |  | | R1      R3 | |  | Vout   --   n being 4051 CBA value
--     |  | |            | |  |        --
--     |  ---            ---  |        -- which gives  
--     |   |              |   |        -- Vout = Vin * (7-n)*4.7/(24+(7-n)*4.7)
--     ------------------------       
--
--  let : Vout = Vin * K(n) = Vin * (7-n)*4.7/(24+(7-n)*4.7) * 256
--   
--  with K(n) = [148 138 127 112 95 72 42 0]
--

process (clock_snd, ssio_modulation_clock, ssio_modulation_load)
begin
	if rising_edge(clock_snd) then
		ssio_modulation_clock_r <= ssio_modulation_clock;
	
		if ssio_modulation_load = '1' then 
			modulation_counter_a1 <= ay1_port_a(3 downto 0);
			modulation_counter_b1 <= ay1_port_a(7 downto 4);
			modulation_counter_c1 <= ay1_port_b(3 downto 0);
			modulation_counter_a2 <= ay2_port_a(3 downto 0);
			modulation_counter_b2 <= ay2_port_a(7 downto 4);
			modulation_counter_c2 <= ay2_port_b(3 downto 0);
		else
			if ssio_modulation_clock = '1' and ssio_modulation_clock_r = '0' then 
				if modulation_counter_a1 > X"0" then modulation_counter_a1 <= modulation_counter_a1 - 1; end if;
				if modulation_counter_b1 > X"0" then modulation_counter_b1 <= modulation_counter_b1 - 1; end if;
				if modulation_counter_c1 > X"0" then modulation_counter_c1 <= modulation_counter_c1 - 1; end if;
				if modulation_counter_a2 > X"0" then modulation_counter_a2 <= modulation_counter_a2 - 1; end if;
				if modulation_counter_b2 > X"0" then modulation_counter_b2 <= modulation_counter_b2 - 1; end if;
				if modulation_counter_c2 > X"0" then modulation_counter_c2 <= modulation_counter_c2 - 1; end if;
			end if;
		end if;
		
		case ay1_audio_chan is
		when "00" => if modulation_counter_a1 = x"0" then ch_a1 <= ay1_audio_muxed; else ch_a1 <= (others => '0'); end if;
		when "01" => if modulation_counter_b1 = x"0" then ch_b1 <= ay1_audio_muxed; else ch_b1 <= (others => '0'); end if;
		when "10" => if modulation_counter_c1 = x"0" then ch_c1 <= ay1_audio_muxed; else ch_c1 <= (others => '0'); end if;
		when others => null;
		end case;
		
		case ay2_audio_chan is
		when "00" => if modulation_counter_a2 = x"0" then ch_a2 <= ay2_audio_muxed; else ch_a2 <= (others => '0'); end if;
		when "01" => if modulation_counter_b2 = x"0" then ch_b2 <= ay2_audio_muxed; else ch_b2 <= (others => '0'); end if;
		when "10" => if modulation_counter_c2 = x"0" then ch_c2 <= ay2_audio_muxed; else ch_c2 <= (others => '0'); end if;
		when others => null;
		end case;
		
--		volume_ch1 <= K_volume(to_integer(unsigned(ay1_port_b(6 downto 4))));
--		volume_ch2 <= K_volume(to_integer(unsigned(ay2_port_b(6 downto 4))));
--		volume_ch2 <= K_volume(to_integer(unsigned(ay1_port_b(6 downto 4)))); -- use ch1 control otherwise ch2 is always OFF!

		volume_ch1 <= X"FF"; -- finaly don't use volume controls
		volume_ch2 <= X"FF";

		if ay1_audio_chan = "00" then
			snd_1 <= (("00"&ch_a1) + ("00"&ch_b1)  + ("00"&ch_c1)) * volume_ch1;
		end if;

		if ay2_audio_chan = "00" then
			snd_2 <= (("00"&ch_a2) + ("00"&ch_b2)  + ("00"&ch_c2)) * volume_ch2; 
		end if;

	end if;
end process;

snd_mono <= ('0'&snd_1) + ('0'&snd_2);

audio_out_l <= snd_1(17 downto 2) when separate_audio = '1' else snd_mono(18 downto 3);
audio_out_r <= snd_2(17 downto 2) when separate_audio = '1' else snd_mono(18 downto 3);

------------------------------
-- components & sound board --
------------------------------

-- microprocessor Z80
cpu : entity work.T80se
generic map(Mode => 0, T2Write => 1, IOWait => 1)
port map(
  RESET_n => reset_n,
  CLK_n   => clock_snd,
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
  RFSH_n  => open,
  HALT_n  => open,
  BUSAK_n => open,
  A       => cpu_addr,
  DI      => cpu_di,
  DO      => cpu_do
);

-- cpu program ROM 0x0000-0x3FFF
--rom_cpu : entity work.timber_sound_cpu
--port map(
-- clk  => clock_sndn,
-- addr => cpu_addr(13 downto 0),
-- data => cpu_rom_do
--);
cpu_rom_addr <= cpu_addr(13 downto 0);

-- working RAM   0x8000-0x83FF
wram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_sndn,
 we   => wram_we,
 addr => cpu_addr(9 downto 0),
 d    => cpu_do,
 q    => wram_do
);

-- iram (command from main cpu to sound cpu)
process (clock_snd, reset, ssio_iowe)
begin
	if reset = '1' then
		iram_0_do <= (others => '0');
		iram_1_do <= (others => '0');
		iram_2_do <= (others => '0');
		iram_3_do <= (others => '0');
		output_5  <= (others => '0');
		output_6  <= (others => '0');
	elsif rising_edge(clock_snd) then
		if ssio_iowe = '1' and main_cpu_addr(7 downto 2) = "000111" then  -- 0x1C - 0x1F
			case main_cpu_addr(1 downto 0) is
			when "00" => iram_0_do <= ssio_di;
			when "01" => iram_1_do <= ssio_di;
			when "10" => iram_2_do <= ssio_di;
			when "11" => iram_3_do <= ssio_di;
			when others => null;
			end case;
		end if;
		if ssio_iowe = '1' and main_cpu_addr(7 downto 0) = x"05" then output_5 <= ssio_di; end if;
		if ssio_iowe = '1' and main_cpu_addr(7 downto 0) = x"06" then output_6 <= ssio_di; end if;
	end if;
end process;

-- AY-3-8910 # 1
ay_3_8910_1 : entity work.YM2149
port map(
  -- data bus
  I_DA       => cpu_do,    -- in  std_logic_vector(7 downto 0); -- pin 37 to 30
  O_DA       => ay1_do,    -- out std_logic_vector(7 downto 0); -- pin 37 to 30
  O_DA_OE_L  => open,      -- out std_logic;
  -- control
  I_A9_L     => '0',       -- in  std_logic; -- pin 24
  I_A8       => '1',       -- in  std_logic; -- pin 25
  I_BDIR     => ay1_bdir,  -- in  std_logic; -- pin 27
  I_BC2      => '1',       -- in  std_logic; -- pin 28
  I_BC1      => ay1_bc1,   -- in  std_logic; -- pin 29
  I_SEL_L    => '1',       -- in  std_logic;

  O_AUDIO    => ay1_audio_muxed, -- out std_logic_vector(7 downto 0);
  O_CHAN     => ay1_audio_chan,  -- out std_logic_vector(1 downto 0);
  
  -- port a
  I_IOA      => (others => '0'), -- in  std_logic_vector(7 downto 0); -- pin 21 to 14
  O_IOA      => ay1_port_a,      -- out std_logic_vector(7 downto 0); -- pin 21 to 14
  O_IOA_OE_L => open,            -- out std_logic;
  -- port b
  I_IOB      => (others => '0'), -- in  std_logic_vector(7 downto 0); -- pin 13 to 6
  O_IOB      => ay1_port_b,     -- out std_logic_vector(7 downto 0); -- pin 13 to 6
  O_IOB_OE_L => open,            -- out std_logic;

  ENA        => cpu_ena,   -- in  std_logic; -- clock enable for higher speed operation
  RESET_L    => reset_n,   -- in  std_logic;
  CLK        => clock_snd  -- in  std_logic  -- note 6 Mhz
);


-- AY-3-8910 # 2
ay_3_8910_2 : entity work.YM2149
port map(
  -- data bus
  I_DA       => cpu_do,    -- in  std_logic_vector(7 downto 0); -- pin 37 to 30
  O_DA       => ay2_do,    -- out std_logic_vector(7 downto 0); -- pin 37 to 30
  O_DA_OE_L  => open,      -- out std_logic;
  -- control
  I_A9_L     => '0',       -- in  std_logic; -- pin 24
  I_A8       => '1',       -- in  std_logic; -- pin 25
  I_BDIR     => ay2_bdir,  -- in  std_logic; -- pin 27
  I_BC2      => '1',       -- in  std_logic; -- pin 28
  I_BC1      => ay2_bc1,   -- in  std_logic; -- pin 29
  I_SEL_L    => '1',       -- in  std_logic;

  O_AUDIO    => ay2_audio_muxed, -- out std_logic_vector(7 downto 0);
  O_CHAN     => ay2_audio_chan,  -- out std_logic_vector(1 downto 0);

  -- port a
  I_IOA      => (others => '0'), -- in  std_logic_vector(7 downto 0); -- pin 21 to 14
  O_IOA      => ay2_port_a,      -- out std_logic_vector(7 downto 0); -- pin 21 to 14
  O_IOA_OE_L => open,            -- out std_logic;
  -- port b
  I_IOB      => (others => '0'), -- in  std_logic_vector(7 downto 0); -- pin 13 to 6
  O_IOB      => ay2_port_b,      -- out std_logic_vector(7 downto 0); -- pin 13 to 6
  O_IOB_OE_L => open,            -- out std_logic;

  ENA        => cpu_ena,   -- in  std_logic; -- clock enable for higher speed operation
  RESET_L    => reset_n,   -- in  std_logic;
  CLK        => clock_snd  -- in  std_logic  -- note 6 Mhz
);

-- midway ssio sound modulation prom
midssio : entity work.midssio_82s123
port map(
 clk  => clock_sndn,
 addr => ssio_82s123_addr,
 data => ssio_82s123_do
);

end struct;