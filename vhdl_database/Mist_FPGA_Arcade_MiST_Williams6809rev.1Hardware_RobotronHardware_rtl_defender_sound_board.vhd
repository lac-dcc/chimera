---------------------------------------------------------------------------------
-- Defender sound board by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- gen_ram.vhd 
-------------------------------- 
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
-- Version 0.0 -- 15/10/2017 -- 
--		    initial version
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity defender_sound_board is
port(
 clk_0p89     : in  std_logic;
 reset        : in  std_logic;
 hand         : out std_logic;
 select_sound : in  std_logic_vector( 5 downto 0);
 audio_out    : out std_logic_vector( 7 downto 0);
 speech_out   : out std_logic_vector(15 downto 0);
 rom_addr     : out std_logic_vector(13 downto 0);
 rom_do       : in  std_logic_vector( 7 downto 0);
 spch_do      : in  std_logic_vector( 7 downto 0);
 rom_vma      : out std_logic
);
end defender_sound_board;

architecture struct of defender_sound_board is

 signal reset_n   : std_logic;

 signal cpu_addr   : std_logic_vector(15 downto 0);
 signal cpu_di     : std_logic_vector( 7 downto 0);
 signal cpu_do     : std_logic_vector( 7 downto 0);
 signal cpu_rw     : std_logic;
 signal cpu_irq    : std_logic;
 signal cpu_vma    : std_logic;

 signal wram_cs   : std_logic;
 signal wram_we   : std_logic;
 signal wram_do   : std_logic_vector( 7 downto 0);
 
 signal rom_cs    : std_logic;
 signal spch_cs   : std_logic;

-- signal rom_do    : std_logic_vector( 7 downto 0);

-- pia port a
--      bit 0-7 audio output

-- pia port b
--      bit 0-4 select sound input (sel0-4)
--      bit 5-6 switch sound/notes/speech on/off
--      bit 7   sel5

-- pia io ca/cb
--      ca1 vdd
--      cb1 sound trigger (sel0-5 = 1)
--      ca2 speech data N/C
--      cb2 speech clock N/C

 signal speech_cen : std_logic;
 signal speech_data: std_logic;

 signal pia_rw_n   : std_logic;
 signal pia_cs     : std_logic;
 signal pia_irqa   : std_logic;
 signal pia_irqb   : std_logic;
 signal pia_do     : std_logic_vector( 7 downto 0);
 signal pia_pa_o   : std_logic_vector( 7 downto 0);
 signal pia_pb_i   : std_logic_vector( 7 downto 0);
 signal pia_cb1_i  : std_logic;

begin

reset_n   <= not reset;

-- pia cs
wram_cs <= '1' when cpu_addr(15 downto  8) = X"00" else '0';                       -- 0000-007F
pia_cs  <= '1' when cpu_addr(14 downto 12) = "000" and cpu_addr(10) = '1' else '0'; -- 8400-8403 ? => 0400-0403
spch_cs <= '1' when cpu_addr(15 downto 12) >= X"B" and cpu_addr(15 downto 12) <= X"E" else '0'; -- B000-EFFF
rom_cs  <= '1' when cpu_addr(15 downto 12) = X"F" else '0';                        -- F800-FFFF

-- write enables
wram_we <=    '1' when cpu_rw = '0' and wram_cs = '1' else '0';
pia_rw_n <=   '0' when cpu_rw = '0' and pia_cs = '1' else '1'; 

-- mux cpu in data between roms/io/wram
cpu_di <=
	wram_do when wram_cs = '1' else
	pia_do  when pia_cs = '1' else
	rom_do when rom_cs = '1' else
	spch_do when spch_cs = '1' else X"55";

-- pia I/O
audio_out <= pia_pa_o;

pia_pb_i(5 downto 0) <= select_sound(5 downto 0);
--pia_pb_i(4 downto 0) <= select_sound(4 downto 0);
--pia_pb_i(6 downto 5) <= "11"; -- assume DS1-1 and DS1-2 open
pia_pb_i(6) <= '1';
pia_pb_i(7) <= '1'; -- Handshake to ? from rom board (drawings are confusing)

-- pia Cb1
pia_cb1_i <= '0' when select_sound = "111111" else '1';

-- pia irqs to cpu
cpu_irq  <= pia_irqa or pia_irqb;

-- microprocessor 6800
main_cpu : entity work.cpu68
port map(	
	clk      => clk_0p89,-- E clock input (falling edge)
	rst      => reset,    -- reset input (active high)
	rw       => cpu_rw,   -- read not write output
	vma      => cpu_vma,  -- valid memory address (active high)
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
--cpu_prog_rom : entity work.defender_sound
--port map(
-- clk  => clk_0p89,
-- addr => cpu_addr(10 downto 0),
-- data => rom_do
--);
rom_vma   <= rom_cs and cpu_vma;
rom_addr  <= (cpu_addr(13 downto 12) - "11") & cpu_addr(11 downto 0);

-- cpu wram 
cpu_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 7)
port map(
 clk  => clk_0p89,
 we   => wram_we,
 addr => cpu_addr(6 downto 0),
 d    => cpu_do,
 q    => wram_do
);

-- pia 
pia : entity work.pia6821
port map
(	
	clk       	=> clk_0p89,
	rst       	=> reset,
	cs        	=> pia_cs,
	rw        	=> pia_rw_n,
	addr      	=> cpu_addr(1 downto 0),
	data_in   	=> cpu_do,
	data_out  	=> pia_do,
	irqa      	=> pia_irqa,
	irqb      	=> pia_irqb,
	pa_i      	=> (others => '0'),
	pa_o        => pia_pa_o,
	pa_oe       => open,
	ca1       	=> '1',
	ca2_i      	=> '0',
	ca2_o       => speech_data,
	ca2_oe      => open,
	pb_i      	=> pia_pb_i,
	pb_o        => open,
	pb_oe       => open,
	cb1       	=> pia_cb1_i,
	cb2_i      	=> '0',
	cb2_o       => speech_cen,
	cb2_oe      => open
);

-- CVSD speech decoder  
IC1: entity work.HC55564  
port map( 
 clk => clk_0p89,
 cen => speech_cen,
 rst => '0', -- Reset is not currently implemented
 bit_in => speech_data,
 sample_out(15 downto 0) => speech_out
);

end struct;
