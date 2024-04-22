---------------------------------------------------------------------------------
-- IREM M52 SOUNDC Board by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- gen_ram.vhd  
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
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
-- Version 0.0 -- 24/11/2017 -- 
--		    initial version
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity moon_patrol_sound_board is
port(
 clock_E      : in std_logic; -- 3.58 Mhz/4
 areset       : in std_logic;

 select_sound : in std_logic_vector(7 downto 0);
 audio_out    : out std_logic_vector(11 downto 0);
 snd_rom_addr : out std_logic_vector(12 downto 0);
 snd_rom_do   : in  std_logic_vector(7 downto 0);
 snd_rom_vma  : out std_logic;
 dbg_cpu_addr : out std_logic_vector(15 downto 0)
);
end moon_patrol_sound_board;

architecture struct of moon_patrol_sound_board is

 signal reset      : std_logic := '1';
 signal reset_n    : std_logic;
 signal reset_cnt  : integer range 0 to 1000000 := 1000000;

 signal cpu_addr   : std_logic_vector(15 downto 0);
 signal cpu_di     : std_logic_vector( 7 downto 0);
 signal cpu_do     : std_logic_vector( 7 downto 0);
 signal cpu_rw     : std_logic;
 signal cpu_irq    : std_logic;
 signal cpu_nmi    : std_logic;
 signal cpu_vma    : std_logic;
 
 signal irqraz_cs : std_logic;
 signal irqraz_we : std_logic;
 
 signal wram_cs   : std_logic;
 signal wram_we   : std_logic;
 signal wram_do   : std_logic_vector( 7 downto 0);
 
 signal rom_cs    : std_logic;
 signal rom_do    : std_logic_vector( 7 downto 0);

 signal ay1_chan_a    : std_logic_vector(7 downto 0);
 signal ay1_chan_b    : std_logic_vector(7 downto 0);
 signal ay1_chan_c    : std_logic_vector(7 downto 0);
 signal ay1_do        : std_logic_vector(7 downto 0);
 signal ay1_audio     : std_logic_vector(9 downto 0);
 signal ay1_port_b_do : std_logic_vector(7 downto 0);
 
 signal ay2_chan_a    : std_logic_vector(7 downto 0);
 signal ay2_chan_b    : std_logic_vector(7 downto 0);
 signal ay2_chan_c    : std_logic_vector(7 downto 0);
 signal ay2_do        : std_logic_vector(7 downto 0);
 signal ay2_audio     : std_logic_vector(9 downto 0);

 signal ports_cs    : std_logic;
 signal ports_we    : std_logic;
  
 signal port1_bus   : std_logic_vector(7 downto 0);  
 signal port1_data  : std_logic_vector(7 downto 0);
 signal port1_ddr   : std_logic_vector(7 downto 0);
 signal port1_in    : std_logic_vector(7 downto 0);
 
 signal port2_bus   : std_logic_vector(7 downto 0);  
 signal port2_data  : std_logic_vector(7 downto 0);
 signal port2_ddr   : std_logic_vector(7 downto 0);
 signal port2_in    : std_logic_vector(7 downto 0);
 
 signal adpcm_ce    : std_logic;
 signal adpcm_cs    : std_logic;
 signal adpcm_we  : std_logic;
 signal adpcm_di  : std_logic_vector(3 downto 0);
 signal select_sound_r : std_logic_vector(7 downto 0);
 signal adpcm_out : signed(11 downto 0);
 signal adpcm_vclk  : std_logic;

 signal audio : std_logic_vector(12 downto 0);
 
 COMPONENT jt5205
	PORT
	(
		rst		:	 IN STD_LOGIC;
		clk		:	 IN STD_LOGIC;
		cen		:	 IN STD_LOGIC;
		sel		:	 IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		din		:	 IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		sound		:	 out signed(11 downto 0);
		sample		:	 OUT STD_LOGIC;
		irq		:	 OUT STD_LOGIC;
		vclk_o		:	 OUT STD_LOGIC
	);
END COMPONENT;
begin

dbg_cpu_addr <= cpu_addr;
reset_n <= not reset;

-- cs
wram_cs   <= '1' when cpu_addr(15 downto  7) = X"00"&'1' else '0'; -- 0080-00FF
ports_cs  <= '1' when cpu_addr(15 downto  4) = X"000"    else '0'; -- 0000-000F
adpcm_cs  <= '1' when cpu_addr(14 downto 11) = "0001"    else '0'; -- 0800-0FFF / 8800-8FFF
irqraz_cs <= '1' when cpu_addr(14 downto 12) = "001"     else '0'; -- 1000-1FFF / 9000-9FFF
rom_cs    <= '1' when cpu_addr(14 downto 12) = "111"     else '0'; -- 7000-7FFF / F000-FFFF
	
-- write enables
wram_we <=   '1' when cpu_rw = '0' and wram_cs =   '1' else '0';
ports_we <=  '1' when cpu_rw = '0' and ports_cs =  '1' else '0';
adpcm_we <=  '1' when cpu_rw = '0' and adpcm_cs =  '1' else '0';
irqraz_we <= '1' when cpu_rw = '0' and irqraz_cs = '1' else '0';

-- mux cpu in data between roms/io/wram
cpu_di <=
	wram_do when wram_cs = '1' else
	port1_ddr when ports_cs = '1' and cpu_addr(3 downto 0) = X"0" else
	port2_ddr when ports_cs = '1' and cpu_addr(3 downto 0) = X"1" else
	port1_in  when ports_cs = '1' and cpu_addr(3 downto 0) = X"2" else
	port2_in  when ports_cs = '1' and cpu_addr(3 downto 0) = X"3" else
	snd_rom_do when rom_cs = '1' else X"55";

process (clock_E)
begin
	if rising_edge(clock_E) then
		reset <= '0';
		if reset_cnt /= 0 then
			reset_cnt <= reset_cnt - 1;
			reset <= '1';
		end if;
		if areset = '1' then
		   reset_cnt <= 1000000;
		end if;
	end if;
end process;

-- irq to cpu
process (reset, clock_E)
begin
	if reset='1' then
		cpu_irq <= '0';
		select_sound_r(7) <= '0';
	elsif rising_edge(clock_E) then
		select_sound_r <= select_sound;
		if select_sound_r(7) = '0' then
			cpu_irq  <= '1';
		end if;
		if irqraz_we = '1' then
			cpu_irq  <= '0';
		end if;
	end if;
end process;

-- cpu nmi
cpu_nmi <= adpcm_vclk;

-- 6803 ports 1 and 2 (only)
process (reset, clock_E)
begin
	if reset='1' then
		port1_ddr  <= (others=>'0');  -- port1 set as input
		port1_data <= (others=>'0');  -- port1 data set to 0
		port2_ddr  <= ("11100000");   -- port2 bit 7 to 5 should always remain output to simulate mode data
		port2_data <= ("01000000");   -- port2 data bit 7 to 5 set to 2 (for mode 2 at start up)
	elsif rising_edge(clock_E) then
			if ports_cs = '1' and ports_we = '1' then
				if cpu_addr(3 downto 0) = X"0" then port1_ddr  <= cpu_do; end if;
				if cpu_addr(3 downto 0) = X"1" then port2_ddr  <= cpu_do and "11100000"; end if;
				if cpu_addr(3 downto 0) = X"2" then port1_data <= cpu_do; end if; 
				if cpu_addr(3 downto 0) = X"3" then port2_data <= cpu_do; end if;
			end if;
	end if;
end process;

port1_in <= (port1_bus and not(port1_ddr)) or (port1_data and port1_ddr);
port2_in <= (port2_bus and not(port2_ddr)) or (port2_data and port2_ddr);

-- port1 bus mux
port1_bus <= ay1_do when port2_data(4) = '0' else 
				 ay2_do when port2_data(3) = '0' else X"FF";

-- port2 bus
port2_bus <= X"FF";

-- latch adpcm (msm5205) data in
process (reset, clock_E)
begin
	if reset='1' then
		adpcm_di <= (others=>'0');
	elsif rising_edge(clock_E) then
			if adpcm_cs = '1' and adpcm_we = '1' then
				adpcm_di  <= cpu_do(3 downto 0);
			end if;
	end if;
end process;

-- audio mux
audio <= ("00"&ay1_audio&'0') + ("00"&ay2_audio&'0') + std_logic_vector(not adpcm_out(11)&adpcm_out(10 downto 0));
audio_out <= audio(12 downto 1);

-- 384 kHz clock enable
process( reset, clock_E )
  variable CLK_SUM : integer;
begin
  if reset = '1' then
    CLK_SUM := 0;
    adpcm_ce <= '0';
  elsif rising_edge(clock_E) then
    adpcm_ce <= '0';
    CLK_SUM := CLK_SUM + 384;
    if CLK_SUM >= 895 then
      CLK_SUM := CLK_SUM - 895;
      adpcm_ce <= '1';
    end if;
  end if;
end process;
				 
-- microprocessor 6800/01/03
main_cpu : entity work.cpu68
port map(	
	clk      => clock_E,  -- E clock input (falling edge)
	rst      => reset,    -- reset input (active high)
	rw       => cpu_rw,   -- read not write output
	vma      => cpu_vma,  -- valid memory address (active high)
	address  => cpu_addr, -- address bus output
	data_in  => cpu_di,   -- data bus input
	data_out => cpu_do,   -- data bus output
	hold     => '0',      -- hold input (active high) extend bus cycle
	halt     => '0',      -- halt input (active high) grants DMA
	irq      => cpu_irq,  -- interrupt request input (active high)
	nmi      => cpu_nmi,  -- non maskable interrupt request input (active high)
	test_alu => open,
	test_cc  => open
);

snd_rom_addr <= cpu_addr(12 downto 0);
snd_rom_vma <= cpu_vma and rom_cs;

-- cpu wram
cpu_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 7)
port map(
 clk  => clock_E,
 we   => wram_we,
 addr => cpu_addr(6 downto 0),
 d    => cpu_do,
 q    => wram_do
);

-- AY-3-8910 #1
ay_3_8910_1 : entity work.YM2149
port map(
  -- data bus
  I_DA       => port1_data,-- in  std_logic_vector(7 downto 0);
  O_DA       => ay1_do,    -- out std_logic_vector(7 downto 0);
  O_DA_OE_L  => open,      -- out std_logic;
  -- control
  I_A9_L     => port2_data(4),  -- in  std_logic;
  I_A8       => '1',            -- in  std_logic;
  I_BDIR     => port2_data(0),  -- in  std_logic;
  I_BC2      => '1',            -- in  std_logic;
  I_BC1      => port2_data(2),  -- in  std_logic;
  I_SEL_L    => '1',            -- in  std_logic;

  O_AUDIO_L  => ay1_audio,         -- out std_logic_vector(9 downto 0);

  -- port a
  I_IOA      => select_sound, -- in  std_logic_vector(7 downto 0);
  O_IOA      => open,         -- out std_logic_vector(7 downto 0);
  O_IOA_OE_L => open,         -- out std_logic;
  -- port b
  I_IOB      => (others => '0'), -- in  std_logic_vector(7 downto 0);
  O_IOB      => ay1_port_b_do,   -- out std_logic_vector(7 downto 0);
  O_IOB_OE_L => open,            -- out std_logic;

  ENA        => '1', --cpu_ena,  -- in  std_logic; -- clock enable for higher speed operation
  RESET_L    => reset_n,         -- in  std_logic;
  CLK        => clock_E          -- in  std_logic
);

-- AY-3-8910 #2
ay_3_8910_2 : entity work.YM2149
port map(
  -- data bus
  I_DA       => port1_data,-- in  std_logic_vector(7 downto 0);
  O_DA       => ay2_do,    -- out std_logic_vector(7 downto 0);
  O_DA_OE_L  => open,      -- out std_logic;
  -- control
  I_A9_L     => port2_data(3),  -- in  std_logic;
  I_A8       => '1',            -- in  std_logic;
  I_BDIR     => port2_data(0),  -- in  std_logic;
  I_BC2      => '1',            -- in  std_logic;
  I_BC1      => port2_data(2),  -- in  std_logic;
  I_SEL_L    => '1',            -- in  std_logic;

  O_AUDIO_L  => ay2_audio,         -- out std_logic_vector(9 downto 0);

  -- port a
  I_IOA      => (others => '0'), -- in  std_logic_vector(7 downto 0);
  O_IOA      => open,            -- out std_logic_vector(7 downto 0);
  O_IOA_OE_L => open,            -- out std_logic;
  -- port b
  I_IOB      => (others => '0'), -- in  std_logic_vector(7 downto 0);
  O_IOB      => open,            -- out std_logic_vector(7 downto 0);
  O_IOB_OE_L => open,            -- out std_logic;

  ENA        => '1', --cpu_ena,         -- in  std_logic; -- clock enable for higher speed operation
  RESET_L    => reset_n,         -- in  std_logic;
  CLK        => clock_E          -- in  std_logic
);

adpcm : jt5205
port map(
  rst		=>	 ay1_port_b_do(0),
  clk		=>	 clock_E,
  cen		=>	 adpcm_ce,
  sel		=>	 ay1_port_b_do(3 downto 2),
  din		=>	 adpcm_di,
  sound		=>	 adpcm_out,
  sample	=>	 open,
  irq		=>	 open,
  vclk_o	=>	 adpcm_vclk
);

end struct;