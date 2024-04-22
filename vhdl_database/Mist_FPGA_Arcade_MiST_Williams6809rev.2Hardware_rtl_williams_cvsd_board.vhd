---------------------------------------------------------------------------------
-- Williams cvsd board by Dar (darfpga@aol.fr)
--
-- Background sound and speech (D-11298) model
--
-- http://darfpga.blogspot.fr
-- https://sourceforge.net/projects/darfpga/files
-- github.com/darfpga
---------------------------------------------------------------------------------
-- gen_ram.vhd
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
---------------------------------------------------------------------------------
-- MC6809
-- Copyright (c) 2016, Greg Miller
---------------------------------------------------------------------------------
-- HC55516/HC55564 Continuously Variable Slope Delta decoder
-- (c)2015 vlait
---------------------------------------------------------------------------------
-- JT51 (YM2151). <http://www.gnu.org/licenses/>.
-- Author: Jose Tejada Gomez. Twitter: @topapate
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
-- Version 0.0 -- 25/03/2022 -- 
--		    initial version
---------------------------------------------------------------------------------
--  Features :
-- 
--  Use with MAME roms from joust2.zip
--
--  Connexions :
--
--     main board                        cvsd board 
--     pia_io2 pb_o   (IC5/2C - port B)  => sound_select
--     pia_io2 ca2_o  (IC5/2C - ca2)     => sound_trig
--
---------------------------------------------------------------------------------
--  Use make_joust2_proms.bat to build vhd file and bin from binaries
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity williams_cvsd_board is
port(
 clock_12     : in std_logic;
 reset        : in std_logic;
 
 sound_select : in std_logic_vector(7 downto 0);
 sound_trig   : in std_logic;
 
 pia_audio    : out std_logic_vector( 7 downto 0);
 speech_out   : out std_logic_vector(15 downto 0);
 ym2151_left  : out signed (15 downto 0);
 ym2151_right : out signed (15 downto 0);

 snd_rom_addr : buffer std_logic_vector(16 downto 0);
 snd_rom_do   : in  std_logic_vector( 7 downto 0);

 dbg_out : out std_logic_vector(31 downto 0)

);
end williams_cvsd_board;

architecture struct of williams_cvsd_board is

component jt51 is
port (

 rst   : in std_logic;    -- reset
 clk   : in std_logic;    -- main clock
 cen   : in std_logic;    -- clock enable (* direct_enable *)
 cen_p1: in std_logic;    -- clock enable at half the speed (* direct_enable *)
 cs_n  : in std_logic;    -- chip select
 wr_n  : in std_logic;    -- write
 a0    : in std_logic;   
 din   : in  std_logic_vector(7 downto 0); -- data in
 dout  : out std_logic_vector(7 downto 0); -- data out
 -- peripheral control
 ct1   : out std_logic;
 ct2   : out std_logic;
 irq_n : out std_logic;    -- I do not synchronize this signal
 
 -- Low resolution output (same as real chip)
 sample: out std_logic;     -- marks new output sample
 left  : out signed (15 downto 0);
 right : out signed (15 downto 0);
 -- Full resolution output
 xleft  : out signed (15 downto 0);
 xright : out signed (15 downto 0)
); end component jt51;


component mc6809is is
port (
 CLK      : in  std_logic;
 fallE_en : in  std_logic;
 fallQ_en : in  std_logic;

 D      : in  std_logic_vector(7 downto 0);
 DOut   : out std_logic_vector(7 downto 0);
 ADDR   : out std_logic_vector(15 downto 0);
 RnW    : out std_logic;
 BS     : out std_logic;
 BA     : out std_logic;

 nIRQ   : in  std_logic := '1';
 nFIRQ  : in  std_logic := '1';
 nNMI   : in  std_logic := '1';
	
 AVMA   : out std_logic;
 BUSY   : out std_logic;
 LIC    : out std_logic;
	
 nHALT  : in  std_logic := '1';
 nRESET : in  std_logic := '1';
	
 nDMABREQ: in std_logic := '1';
 RegData : out std_logic_vector(111 downto 0)
);
end component mc6809is;

 signal en_cnt  : std_logic := '0'; 
 signal div_cnt : std_logic_vector(1 downto 0) := "00";

 signal rom_bank_cs  : std_logic;
 
 signal cpu_addr   : std_logic_vector(15 downto 0);
 signal cpu_di     : std_logic_vector( 7 downto 0);
 signal cpu_do     : std_logic_vector( 7 downto 0);
 signal cpu_rw_n   : std_logic;
 signal write_n    : std_logic;

 signal reset_n    : std_logic;
 signal cpu_firq_n : std_logic;
 signal cpu_nmi_n  : std_logic;
 signal cpu_e_en   : std_logic;
 signal cpu_q_en   : std_logic;
  
 signal page_cs         : std_logic;
 signal page            : std_logic_vector( 2 downto 0);
 signal rom_cs          : std_logic;
 signal rom_bank_a_do   : std_logic_vector( 7 downto 0);
 signal rom_bank_b_do   : std_logic_vector( 7 downto 0);
 signal rom_bank_c_do   : std_logic_vector( 7 downto 0);

 signal sram_cs        : std_logic;
 signal sram_we        : std_logic;
 signal sram_do        : std_logic_vector( 7 downto 0);
 
 signal cvsd1_cs   : std_logic;
 signal cvsd2_cs   : std_logic;
 signal cvsd_data  : std_logic;
 signal cvsd_clk   : std_logic;
 signal cvsd_cnt   : std_logic_vector(15 downto 0);

 signal pia_clock  : std_logic;

 signal pia_cs     : std_logic;
 signal pia_we_n   : std_logic;
 signal pia_do     : std_logic_vector( 7 downto 0);
-- signal pia_pa_o   : std_logic_vector( 7 downto 0);
 signal pia_irqa   : std_logic;
 signal pia_irqb   : std_logic;
 signal pia_a_o    : std_logic_vector( 7 downto 0);

 signal ym2151_irq_n  : std_logic := '0';
 signal ym2151_cs_n   : std_logic;
 signal ym2151_do     : std_logic_vector( 7 downto 0);
 signal ym2151_we_n   : std_logic;

 signal lim       : unsigned(9 downto 0);
 signal cnt_max   : unsigned(9 downto 0);
 signal next_cnt  : unsigned(9 downto 0);
 signal next_cnt2 : unsigned(9 downto 0);
 signal cen_cnt   : unsigned(9 downto 0) := "0000000000";
 signal alt       : std_logic := '0';
 signal cen_1p78  : std_logic := '0';
 signal cen_3p57  : std_logic := '0';

 signal snd_rom_addr_r : std_logic_vector(16 downto 0);

begin

-- for debug
process (clock_12) 
begin
	if rising_edge(clock_12) then 
		dbg_out(15 downto 0) <= cpu_addr;
		dbg_out(23 downto 16) <= cpu_di;
	end if;
end process;

-- 
reset_n    <= not reset;
		
-- make cpu clocks 2MHz (12MHz/6)
-- in original hardware 2MHz from 8MHz/4
--             _   _   _   _   _
-- en_cnt   |_| |_| |_| |_| |_| | ...  (6MHz)
--
-- div_cnt  | 0 | 1 | 2 | 0 | 1 | ...
--               _           _
-- cpu_e_en  ___| |_________| |__ ...
--           _           _        
-- cpu_q_en | |_________| |______ ...
--          ______ ___________ __
-- cpu_do   ______|___________|__ ...
--          __________     ______
-- write_n            |___|       ...

process (reset, clock_12)
begin
	if rising_edge(clock_12) then
	
		en_cnt   <= not en_cnt;
		write_n  <= '1';
		cpu_e_en <= '0';
		cpu_q_en <= '0';
	
		if en_cnt = '1' then 		
			if div_cnt = "10" then
				div_cnt <= "00";
			else
				div_cnt <= div_cnt + '1';
			end if;

			-- place E and Q falling edge for MC6809
			if  div_cnt = "00" then cpu_e_en <= '1'; end if;
			if  div_cnt = "10" then cpu_q_en <= '1'; end if;
			
		end if;						

		-- center cpu write pulse 
		if div_cnt = "10" then write_n <= cpu_rw_n; end if;

		-- synchronize interruptions
		if  div_cnt = "01" then
			cpu_nmi_n  <= not pia_irqb;
			cpu_firq_n <= not pia_irqa;
		end if;
		
	end if;
end process;

pia_clock <= not clock_12;

-- chip select/we
sram_cs      <= '1' when cpu_addr(15 downto 13) = "000"   else '0'; -- 0000-1FFF
ym2151_cs_n  <= '0' when cpu_addr(15 downto 13) = "001"   else '1'; -- 2000-3FFF
pia_cs       <= '1' when cpu_addr(15 downto 13) = "010"   else '0'; -- 4000-5FFF
cvsd1_cs     <= '1' when cpu_addr(15 downto 11) = "01100" else '0'; -- 6000-67FF
cvsd2_cs     <= '1' when cpu_addr(15 downto 11) = "01101" else '0'; -- 6800-6FFF
page_cs      <= '1' when cpu_addr(15 downto 11) = "01111" else '0'; -- 7800-7FFF
rom_cs       <= '1' when cpu_addr(15)           = '1';              -- 8000-FFFF

sram_we       <= '1' when write_n = '0' and sram_cs     = '1' else '0';
pia_we_n      <= '0' when write_n = '0' and pia_cs      = '1' else '1';
ym2151_we_n   <= '0' when write_n = '0' and ym2151_cs_n = '0' else '1';

-- mux data to cpu di
cpu_di <=
	cpu_do        when cpu_rw_n = '0' else 
	sram_do		  when sram_cs = '1' else
	ym2151_do	  when ym2151_cs_n = '0' else
	pia_do        when pia_cs = '1' else
	snd_rom_do    when rom_cs = '1' else
	--rom_bank_a_do when rom_cs = '1' and page(1 downto 0) = "00" else
	--rom_bank_b_do when rom_cs = '1' and page(1 downto 0) = "01" else
	--rom_bank_c_do when rom_cs = '1' and page(1 downto 0) = "10" else
	X"00";
	
-- page register, cvsd clock and data
process (reset, clock_12)
begin
	if reset='1' then
		page <= "000";
		cvsd_data <= '0';
		cvsd_clk  <= '0';
	else 
		if rising_edge(clock_12) then 
			if page_cs = '1' and write_n = '0' then page <= cpu_do(2 downto 0); end if;
			if cvsd1_cs = '1' then cvsd_data <= cpu_do(0); end if;
			if cvsd1_cs = '1' then cvsd_clk <= '0';        end if;
			if cvsd2_cs = '1' then cvsd_clk <= '1';        end if;			
		end if;
	end if;
end process;

-- microprocessor 6809 -IC28
--main_cpu : entity work.cpu09
--port map(	
--	clk      => en_cpu,   -- E clock input (falling edge)
--	rst      => reset,    -- reset input (active high)
--	vma      => open,     -- valid memory address (active high)
-- lic_out  => open,     -- last instruction cycle (active high)
-- ifetch   => open,     -- instruction fetch cycle (active high)
-- opfetch  => open,     -- opcode fetch (active high)
-- ba       => open,     -- bus available (high on sync wait or DMA grant)
-- bs       => open,     -- bus status (high on interrupt or reset vector fetch or DMA grant)
--	addr     => cpu_addr, -- address bus output
--	rw       => cpu_rw_n, -- read not write output
--	data_out => cpu_do,   -- data bus output
--	data_in  => cpu_di,   -- data bus input
--	irq      => '0',      -- interrupt request input (active high)
--	firq     => cpu_firq, -- fast interrupt request input (active high)
--	nmi      => cpu_nmi,  -- non maskable interrupt request input (active high)
--	halt     => '0',      -- halt input (active high) grants DMA
--	hold     => '0'       -- hold input (active high) extend bus cycle
--);

-- microprocessor 6809 - IC28
main_cpu : mc6809is
port map (
 CLK      => clock_12, -- : in  std_logic;
 fallE_en => cpu_e_en, -- : in  std_logic;
 fallQ_en => cpu_q_en, -- : in  std_logic;

 D        => cpu_di,   -- : in  std_logic_vector(7 downto 0);
 DOut     => cpu_do,   -- : out std_logic_vector(7 downto 0);
 ADDR     => cpu_addr, -- : out std_logic_vector(15 downto 0); 
 RnW      => cpu_rw_n, -- : out std_logic;
 BS       => open,     -- : out std_logic;
 BA       => open,     -- : out std_logic;

 nIRQ     => '1',        -- : in  std_logic := '1';
 nFIRQ    => cpu_firq_n, -- : in  std_logic := '1';
 nNMI     => cpu_nmi_n,  -- : in  std_logic := '1';
	
 AVMA     => open,   -- : out std_logic;
 BUSY     => open,   -- : out std_logic;
 LIC      => open,   -- : out std_logic;
	
 nHALT    => '1',    -- : in  std_logic := '1'
 nRESET   => reset_n,-- : in  std_logic := '1';
	
 nDMABREQ => '1',    -- : in std_logic := '1';
 RegData  => open    -- : out std_logic_vector(111 downto 0);
);

snd_rom_addr <= page(1 downto 0)&cpu_addr(14 downto 0) when rom_cs = '1' else snd_rom_addr_r;

process (reset, clock_12)
begin
	if rising_edge(clock_12) then
		snd_rom_addr_r <= snd_rom_addr;
	end if;
end process;

-- rom0 IC_U4
--bank_a_rom : entity work.joust2_bg_sound_bank_a
--port map(
-- clk  => clock_12,
-- addr => cpu_addr(14 downto 0),
-- data => rom_bank_a_do
--);
--
---- rom1 IC_U19
--bank_b_rom : entity work.joust2_bg_sound_bank_b
--port map(
-- clk  => clock_12,
-- addr => cpu_addr(14 downto 0),
-- data => rom_bank_b_do
--);
--
---- rom2 IC_U20
--bank_c_rom : entity work.joust2_bg_sound_bank_c
--port map(
-- clk  => clock_12,
-- addr => cpu_addr(14 downto 0),
-- data => rom_bank_c_do
--);

-- sram IC U3
sram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk  => clock_12,
 we   => sram_we,
 addr => cpu_addr(10 downto 0),
 d    => cpu_do,
 q    => sram_do
);

-- pia IC_U2
pia : entity work.pia6821
port map
(	
	clk       	=> pia_clock,           -- rising edge
	rst       	=> reset,               -- active high
	cs        	=> pia_cs,
	rw        	=> pia_we_n,            -- write low
	addr      	=> cpu_addr(1 downto 0),
	data_in   	=> cpu_do,
	data_out  	=> pia_do,
	irqa      	=> pia_irqa,            -- active high
	irqb      	=> pia_irqb,            -- active high
	pa_i      	=> pia_a_o,
	pa_o        => pia_a_o,
	pa_oe       => open,
	ca1       	=> ym2151_irq_n,
	ca2_i      	=> '0',
	ca2_o       => open,
	ca2_oe      => open,
	pb_i      	=> sound_select,
	pb_o        => open,
	pb_oe       => open,
	cb1       	=> sound_trig,
	cb2_i      	=> '0',
	cb2_o       => open,
	cb2_oe      => open
);

pia_audio <= pia_a_o;

-- CVSD speech decoder	
cvsd : entity work.HC55564	
port map(	
	clk => clock_12,
	cen => cvsd_clk,
	rst => '0', -- Reset is not currently implemented
	bit_in => cvsd_data,
	sample_out(15 downto 0) => speech_out
);

-- YM2151 : FM Clocks
-- make 3.57 and 1.78MHz from 12MHz
lim       <= to_unsigned(512,10);
cnt_max   <= to_unsigned(512+152,10);

next_cnt  <= cen_cnt + to_unsigned(152,10);
next_cnt2 <= cen_cnt + to_unsigned(152,10) - to_unsigned(512,10);

process (clock_12)
begin
	if rising_edge(clock_12) then
		cen_3p57 <= '0';
		cen_1p78 <= '0';

		if cen_cnt >= cnt_max then 
			cen_cnt <= (others => '0');
			alt <= '0';
		else		
			if next_cnt >= lim then
				cen_cnt <= next_cnt2;
				cen_3p57 <= '1';
				alt <= not alt;
				cen_1p78 <= alt;
			else
				cen_cnt <= next_cnt;
			end if;
		end if;
			
	end if;
end process;


-- YM2151
jt51_if : jt51
port map (

 rst    => reset,         -- reset
 clk    => clock_12,      -- main clock
 cen    => cen_3p57,      -- clock enable (* direct_enable *)
 cen_p1 => cen_1p78,      -- clock enable at half the speed (* direct_enable *)
 cs_n   => ym2151_cs_n,   -- chip select
 wr_n   => ym2151_we_n,   -- write
 a0     => cpu_addr(0),  
 din    => cpu_do,        -- data in
 dout   => ym2151_do,     -- data out
 -- peripheral control
 ct1   => open,
 ct2   => open,
 irq_n => ym2151_irq_n,   -- I do not synchronize this signal

 -- Low resolution output (same as real chip)
 sample => open,          -- marks new output sample
 left   => open,
 right  => open,
 -- Full resolution output
 xleft  => ym2151_left,
 xright => ym2151_right
);

end struct;
