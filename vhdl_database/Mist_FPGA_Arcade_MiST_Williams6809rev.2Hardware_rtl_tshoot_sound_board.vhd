---------------------------------------------------------------------------------
-- Tshoot sound board by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
-- https://sourceforge.net/projects/darfpga/files
-- github.com/darfpga
---------------------------------------------------------------------------------
-- gen_ram.vhd 
-------------------------------- 
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
---------------------------------------------------------------------------------
-- cpu68 - Version 9th Jan 2004 0.8+
-- 6800/01 compatible CPU core 
-- GNU public license - December 2002 : John E. Kent
-- + 2019 Jared Boone
-- + March 2020 Gyorgy Szombathelyi
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
-- Version 0.0 -- 04/03/2022 -- 
--		    initial version
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tshoot_sound_board is
port(
 clock_12    : in std_logic;
 reset       : in std_logic;
 sound_select : in std_logic_vector(7 downto 0);
 sound_trig   : in std_logic;
 sound_ack    : out std_logic;
 audio_out    : out std_logic_vector( 7 downto 0);

 snd_rom_addr : buffer std_logic_vector(12 downto 0);
 snd_rom_do   : in  std_logic_vector( 7 downto 0)
);
end tshoot_sound_board;

architecture struct of tshoot_sound_board is

constant HW_INFERNO : std_logic_vector(1 downto 0) := "10";

-- signal reset_n   : std_logic;
 signal clock_div : std_logic_vector(3 downto 0);

 signal cpu_clock  : std_logic;
 signal cpu_addr   : std_logic_vector(15 downto 0);
 signal cpu_di     : std_logic_vector( 7 downto 0);
 signal cpu_do     : std_logic_vector( 7 downto 0);
 signal cpu_rw_n   : std_logic;
 signal cpu_irq    : std_logic;

 signal wram_cs   : std_logic;
 signal wram_we   : std_logic;
 signal wram_do   : std_logic_vector( 7 downto 0);
 
 signal rom_cs    : std_logic;
 signal rom_do    : std_logic_vector( 7 downto 0);

 signal snd_rom_addr_r : std_logic_vector(12 downto 0);

-- pia port a
--      bit 0-7 audio output

-- pia port b
--      bit 0-7 sound select input

-- pia io ca/cb
--      ca1 => pia_02_cb2 (main cpu part - sound_trig)
--      cb1 gnd
--      ca2 => pia_02_cb1 (main cpu part - sound ack)
--      cb2 gnd

 signal pia_clock  : std_logic;
 signal pia_rw_n   : std_logic;
 signal pia_cs     : std_logic;
 signal pia_irqa   : std_logic;
 signal pia_irqb   : std_logic;
 signal pia_do     : std_logic_vector( 7 downto 0);

begin

-- clock divider
process (reset, clock_12)
begin
	if rising_edge(clock_12) then
		if clock_div < 11 then 
			clock_div  <= clock_div + '1';
		else
			clock_div  <= (others => '0');
		end if;
		if clock_div > 6 then 
			cpu_clock <= '1';
		else		
			cpu_clock <= '0';
		end if;
		
		if clock_div > 7 and clock_div < 9 then 
			pia_clock <= '1';
		else		
			pia_clock <= '0';
		end if;
				
	end if;
end process;

-- chip select
wram_cs <= '1' when cpu_addr(15 downto 13) = "000" else '0';
pia_cs  <= '1' when cpu_addr(15 downto 13) = "001" else '0';
rom_cs  <= '1' when cpu_addr(15 downto 13) = "111" else '0';

snd_rom_addr <= cpu_addr(12 downto 0) when rom_cs = '1' else snd_rom_addr_r;

process (reset, clock_12)
begin
	if rising_edge(clock_12) then
		snd_rom_addr_r <= snd_rom_addr;
	end if;
end process;

-- write enables
wram_we <=    '1' when cpu_rw_n = '0' and cpu_clock = '1' and wram_cs = '1' else '0';
pia_rw_n <=   '0' when cpu_rw_n = '0' and pia_cs = '1' else '1';

-- mux cpu in data between roms/io/wram
cpu_di <=
	wram_do when wram_cs = '1' else
	pia_do  when pia_cs = '1' else
	rom_do when rom_cs = '1' else X"55";

-- pia irqs to cpu
cpu_irq  <= pia_irqa or pia_irqb;

-- microprocessor 6800
main_cpu : entity work.cpu68
port map(	
	clk      => cpu_clock,-- E clock input (falling edge)
	rst      => reset,    -- reset input (active high)
	rw       => cpu_rw_n, -- read not write output
	vma      => open,     -- valid memory address (active high)
	address  => cpu_addr, -- address bus output
	data_in  => cpu_di,   -- data bus input
	data_out => cpu_do,   -- data bus output
	hold     => '0',      -- hold input (active high) extend bus cycle
	halt     => '0',      -- halt input (active high) grants DMA
	irq      => cpu_irq,  -- interrupt request input (active high)
	nmi      => '0',      -- non maskable interrupt request input (active high)
	test_alu => open,
	test_cc  => open
);

-- cpu program rom
--cpu_prog_rom : entity work.turkey_shoot_sound
--port map(
-- clk  => clock_12,
-- addr => cpu_addr(12 downto 0),
-- data => rom_do
--);
rom_do <= snd_rom_do;

-- cpu wram 
cpu_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 8)
port map(
 clk  => clock_12,
 we   => wram_we,
 addr => cpu_addr(7 downto 0),
 d    => cpu_do,
 q    => wram_do
);

-- pia 
pia : entity work.pia6821
port map
(	
	clk       	=> pia_clock,
	rst       	=> reset,
	cs        	=> pia_cs,
	rw        	=> pia_rw_n,
	addr      	=> cpu_addr(1 downto 0),
	data_in   	=> cpu_do,
	data_out  	=> pia_do,
	irqa      	=> pia_irqa,
	irqb      	=> pia_irqb,
	pa_i      	=> sound_select,
	pa_o        => open,
	pa_oe       => open,
	ca1       	=> sound_trig,
	ca2_i      	=> '0',
	ca2_o       => sound_ack,
	ca2_oe      => open,
	pb_i      	=> x"00",
	pb_o        => audio_out,
	pb_oe       => open,
	cb1       	=> '0',
	cb2_i      	=> '0',
	cb2_o       => open,
	cb2_oe      => open
);

end struct;
