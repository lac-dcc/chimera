---------------------------------------------------------------------------------
-- Congo_Bongo_sound_board by Dar (darfpga@aol.fr) (08/11/2022)
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
-- 
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
--
--  SOUND : 1xZ80 @ 4.0MHz CPU accessing its program rom, working ram, 2xPSG SN76489
--		  8Kx8bits program rom
--      2Kx8bits working ram
--
---------------------------------------------------------------------------------
--  Schematics remarks :
--  
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity congo_sound_board is
port(
 clock_24    : in std_logic;
 reset       : in std_logic;
 
 sound_cmd   : in std_logic_vector(7 downto 0);
 
 audio_out   : out std_logic_vector(15 downto 0);
 
 dl_addr        : in  std_logic_vector(17 downto 0);
 dl_wr          : in  std_logic;
 dl_data        : in  std_logic_vector( 7 downto 0); 
 
 dbg_out     : out std_logic_vector(15 downto 0)
 
 );
end congo_sound_board;

architecture struct of congo_sound_board is
 
 signal reset_n   : std_logic;
 signal clock_24n : std_logic;
 
 signal clock_cnt1  : std_logic_vector( 2 downto 0) := "000";
 signal clock_cnt2  : std_logic_vector( 3 downto 0) := x"0";
 signal clock_cnt3  : std_logic_vector(11 downto 0) := x"000";

 signal ck1_ena     : std_logic;
 signal ck4_ena     : std_logic;

 signal cpu_addr    : std_logic_vector(15 downto 0);
 signal cpu_di      : std_logic_vector( 7 downto 0);
 signal cpu_do      : std_logic_vector( 7 downto 0);
 signal cpu_wr_n    : std_logic;
 signal cpu_rd_n    : std_logic;
 signal cpu_mreq_n  : std_logic;
 signal cpu_ioreq_n : std_logic;
 signal cpu_irq_n   : std_logic;
 signal cpu_m1_n    : std_logic;
 signal cpu_wait_n  : std_logic;
 
 signal cpu_rom_do  : std_logic_vector( 7 downto 0);
 
 signal wram_we     : std_logic;
 signal wram_do     : std_logic_vector( 7 downto 0);

 signal ppi_port_b  : std_logic_vector( 7 downto 0);
 signal ppi_port_c  : std_logic_vector( 7 downto 0);
 
 signal wave_addr     : std_logic_vector(15 downto 0);
 signal wave_data     : std_logic_vector( 7 downto 0);
 signal samples_audio : std_logic_vector(15 downto 0);
 
 signal psg1_ce_n   : std_logic;
 signal psg2_ce_n   : std_logic;
 signal psg1_rdy    : std_logic;
 signal psg2_rdy    : std_logic;
 signal psg1_audio  : std_logic_vector( 7 downto 0);
 signal psg2_audio  : std_logic_vector( 7 downto 0);
 
 signal cpu_rom_we : std_logic;
  
 signal dbg_cpu_addr : std_logic_vector(15 downto 0);
 signal dbg_cpu_do   : std_logic_vector( 7 downto 0);

begin

clock_24n <= not clock_24;
reset_n   <= not reset;

-- debug 
--process (reset, clock_24)
--begin
-- if rising_edge(clock_24) then
--  dbg_cpu_addr <= cpu_addr;
--  dbg_cpu_do <= cpu_do;
-- end if;
--end process;
--
--dbg_out <= dbg_cpu_addr and x"FF"&dbg_cpu_do;

-- make enables clocks

process (clock_24, reset)
begin
	if reset='1' then
		clock_cnt1 <= (others=>'0');
		clock_cnt2 <= (others=>'0');
	else 
		if rising_edge(clock_24) then
			ck1_ena <= '0';
			ck4_ena <= '0';
		
			if clock_cnt1 = "101" then  -- divide by 6
				ck4_ena <= '1';
				if clock_cnt2(1 downto 0) = "01" then ck1_ena <= '1'; end if;
				
				clock_cnt1 <= (others=>'0');
				if clock_cnt2 = x"F" then  -- divide by 16
					clock_cnt2 <= (others=>'0');
				else
					clock_cnt2 <= clock_cnt2 + 1;
				end if;			
			else
				clock_cnt1 <= clock_cnt1 + 1;
			end if;			
		end if;
	end if;   		
end process;
			
process (clock_24, reset)
begin
	if reset='1' or cpu_ioreq_n = '0' then  -- reset on INT acknowledge
		clock_cnt3 <= (others=>'0');
	else 
		if rising_edge(clock_24) then
			if clock_cnt2 = x"F" and clock_cnt1 = "101" then
				clock_cnt3 <= clock_cnt3 + 1;
			end if;
		end if;
	end if;   		
end process;

------------------------------------------
-- cpu data input with address decoding --
------------------------------------------
cpu_di <= cpu_rom_do  when cpu_mreq_n = '0' and cpu_addr(15 downto 13) = "000" else -- 0000-1FFF
			 wram_do     when cpu_mreq_n = '0' and cpu_addr(15 downto 13) = "010" else -- 4000-47FF + mirror 1800
			 sound_cmd   when cpu_mreq_n = '0' and cpu_addr(15 downto 13) = "100" and cpu_addr(1 downto 0) = "00" else -- 8000
			 ppi_port_b  when cpu_mreq_n = '0' and cpu_addr(15 downto 13) = "100" and cpu_addr(1 downto 0) = "01" else -- 8001
			 ppi_port_c  when cpu_mreq_n = '0' and cpu_addr(15 downto 13) = "100" and cpu_addr(1 downto 0) = "10" else -- 8002
   		 X"FF";

------------------------------------------
-- write enable to working ram from CPU --
------------------------------------------
wram_we   <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 13) = "010" else '0'; -- 4000-47FF + mirror 1800

psg1_ce_n <= '0' when cpu_mreq_n = '0' and (cpu_rd_n = '0' or cpu_wr_n = '0') and cpu_addr(15 downto 13) = "011" else '1'; -- 6000-7FFF
psg2_ce_n <= '0' when cpu_mreq_n = '0' and (cpu_rd_n = '0' or cpu_wr_n = '0') and cpu_addr(15 downto 13) = "101" else '1'; -- A000-BFFF
	
------------------------------------------------------------------------
-- Misc registers, interrupt
------------------------------------------------------------------------
cpu_irq_n <= not clock_cnt3(10);
cpu_wait_n <= '1' when psg1_rdy = '1' and psg2_rdy = '1' else '0';

process (clock_24, reset)
begin
	if reset='1' then
		ppi_port_b <= (others=>'0');
		ppi_port_c <= (others=>'0');
	else 
		if rising_edge(clock_24) then
			if cpu_mreq_n = '0' and cpu_wr_n = '0' then 
				if cpu_addr(15 downto 13) = "100" and cpu_addr(1 downto 0) = "01" then ppi_port_b <= cpu_do; end if; -- 8001
				if cpu_addr(15 downto 13) = "100" and cpu_addr(1 downto 0) = "10" then ppi_port_c <= cpu_do; end if; -- 8002
			end if;
		end if;		
	end if;   		
end process;

-------------------------------
-- sound --
-------------------------------

audio_out <= (('0'&psg1_audio) + ('0'&psg2_audio)) & "0000000" + ("00"&samples_audio(15 downto 2));

----------------
-- components --
----------------

-- microprocessor Z80
cpu : entity work.T80se
generic map(Mode => 0, T2Write => 1, IOWait => 1)
port map(
  RESET_n => reset_n,
  CLK_n   => clock_24,
  CLKEN   => ck4_ena,
  WAIT_n  => cpu_wait_n,
  INT_n   => cpu_irq_n,
  NMI_n   => '1',
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

-- cpu program ROM 0x0000-0x1FFF
--rom_cpu : entity work.congo_sound_cpu
--port map(
-- clk  => clock_24n,
-- addr => cpu_addr(12 downto 0),
-- data => cpu_rom_do
--);

cpu_rom_we <= '1' when dl_wr = '1' and dl_addr(17 downto 13) = "10011" else '0'; -- 26000-27FFF
rom_cpu : entity work.dpram
generic map( dWidth => 8, aWidth => 13)
port map(
 clk_a  => clock_24n,
 addr_a => cpu_addr(12 downto 0),
 q_a    => cpu_rom_do,
 clk_b  => clock_24,
 addr_b => dl_addr(12 downto 0),
 we_b   => cpu_rom_we,
 d_b    => dl_data
);

-- working RAM   0x4000-0x47FF
wram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk  => clock_24n,
 we   => wram_we,
 addr => cpu_addr(10 downto 0),
 d    => cpu_do,
 q    => wram_do
);

---- samples data --
samples : entity work.congo_samples
port map(
 clk  => clock_24n,
 addr => wave_addr(13 downto 0),
 data => wave_data
);

-- PSG1 
psg1 : entity work.sn76489_top
--
--  generic (
--    clock_div_16_g : integer := 1
--  );
port map(
 clock_i    => clock_24,
 clock_en_i => ck4_ena,
 res_n_i    => reset_n,
 ce_n_i     => psg1_ce_n,
 we_n_i     => cpu_wr_n,
 ready_o    => psg1_rdy,
 d_i        => cpu_do,
 aout_o     => psg1_audio
);

-- PSG2 
psg2 : entity work.sn76489_top
--
--  generic (
--    clock_div_16_g : integer := 1
--  );
port map(
 clock_i    => clock_24,
 clock_en_i => ck1_ena,
 res_n_i    => reset_n,
 ce_n_i     => psg2_ce_n,
 we_n_i     => cpu_wr_n,
 ready_o    => psg2_rdy,
 d_i        => cpu_do,
 aout_o     => psg2_audio
);


samples_player : entity work.samples_player
port map(
 clock_24    => clock_24,
 reset       => reset,

 port_b      => ppi_port_b,
 port_c      => ppi_port_c,

 audio_out   => samples_audio,

 wave_addr   => wave_addr,
 wave_rd     => open,
 wave_data   => wave_data
 );
 
end struct;