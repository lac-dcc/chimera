---------------------------------------------------------------------------------
-- Pooyan sound board by Dar (darfpga@aol.fr) (08/11/2017)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- gen_ram.vhd
-------------------------------- 
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
---------------------------------------------------------------------------------
-- T80/T80se - Version : 0247
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pooyan_sound_board is
port(
 clock_14     : in std_logic;
 reset        : in std_logic;

 sound_cmd    : in std_logic_vector(7 downto 0);
 sound_trig   : in std_logic;
 
 audio_out    : out std_logic_vector(10 downto 0);
 
 dbg_cpu_addr : out std_logic_vector(15 downto 0)
 );
end pooyan_sound_board;

architecture struct of pooyan_sound_board is

 signal reset_n: std_logic;
 signal clock_14n : std_logic;
 
 signal clock_div1 : std_logic_vector(11 downto 0) := (others => '0');
 signal biquinary_div : std_logic_vector(3 downto 0) := (others => '0');
 
 signal cpu_clock_en  : std_logic;
 signal ayx_clock_en  : std_logic;

 signal cpu_addr   : std_logic_vector(15 downto 0);
 signal cpu_di     : std_logic_vector( 7 downto 0);
 signal cpu_do     : std_logic_vector( 7 downto 0);
 signal cpu_wr_n   : std_logic;
 signal cpu_mreq_n : std_logic;
 signal cpu_irq_n  : std_logic;
 signal cpu_iorq_n : std_logic;
 signal cpu_m1_n   : std_logic;

 signal cpu_rom_do : std_logic_vector( 7 downto 0);
 signal wram_do    : std_logic_vector( 7 downto 0);
 signal wram_we    : std_logic;
 
 signal clr_irq_n  : std_logic;
 signal sen1_n     : std_logic;
 signal sen2_n     : std_logic;
 signal sen3_n     : std_logic;
 signal sen4_n     : std_logic;

 signal sound_trig_r : std_logic;
 
 signal ay1_do          : std_logic_vector(7 downto 0);
 signal ay1_cs_n        : std_logic;
 signal ay1_bdir        : std_logic;
 signal ay1_bc1         : std_logic;
 signal ay1_audio_muxed : std_logic_vector(7 downto 0);
 signal ay1_audio_chan  : std_logic_vector(1 downto 0);
 signal ay1_port_b_di   : std_logic_vector(7 downto 0);
  
 signal ay2_do          : std_logic_vector(7 downto 0);
 signal ay2_cs_n        : std_logic;
 signal ay2_bdir        : std_logic;
 signal ay2_bc1         : std_logic;
 signal ay2_audio_muxed : std_logic_vector(7 downto 0);
 signal ay2_audio_chan  : std_logic_vector(1 downto 0);
 
 signal ay1_chan_a : std_logic_vector(7 downto 0);
 signal ay1_chan_b : std_logic_vector(7 downto 0);
 signal ay1_chan_c : std_logic_vector(7 downto 0);
 signal ay2_chan_a : std_logic_vector(7 downto 0);
 signal ay2_chan_b : std_logic_vector(7 downto 0);
 signal ay2_chan_c : std_logic_vector(7 downto 0);
 
 signal filter_cmd_we : std_logic;
 signal filter_cmd    : std_logic_vector(11 downto 0);
 signal mult_cmd      : std_logic_vector(1 downto 0);
 signal mult_value    : integer range 0 to 779;
 
 signal Vc_1a : integer range -256*1024 to 256*1024-1;
 signal Vc_1b : integer range -256*1024 to 256*1024-1;
 signal Vc_1c : integer range -256*1024 to 256*1024-1;
 signal Vc_2a : integer range -256*1024 to 256*1024-1;
 signal Vc_2b : integer range -256*1024 to 256*1024-1;
 signal Vc_2c : integer range -256*1024 to 256*1024-1;
 signal Vc    : integer range -256*1024 to 256*1024-1;
 signal Vin   : integer range -256 to 255;
 signal dV    : integer range -512 to 511;
 signal Vcn_a : integer range -1024*1024 to 1024*1024-1;
 signal Vcn_b : integer range -1024*1024 to 1024*1024-1;
 signal Vcn_c : integer range  -256*1024 to  256*1024-1;
 
begin

clock_14n <= not clock_14;
reset_n   <= not reset;

-- debug 
process (reset, clock_14)
begin
 if rising_edge(clock_14) and cpu_mreq_n ='0' then
   dbg_cpu_addr <= cpu_addr;
 end if;
end process;

--------------------------------------------------------
-- RC filters equation
--
-- Vc  : capacitor voltage = output voltage
-- fs  : sample frequency
-- Vin : voltage at resistor input
--
-- Vc(k+1) = Vc(k) + (Vin-Vc(k))/(fs.R.C) 
--
-- Vcn * 1024 <= Vcn * 1024 + (Vin-Vc) * 1024/(fs.R.C)
-- With Vcn = 1024 * Vc
--------------------------------------------------------
-- Filters will be run at 14.318MHz/512 = 27.96KHz
--------------------------------------------------------
-- 6 filters have to be implemented
-- RC equation is time multiplexed to save multiplier
-- for small FPGA
--------------------------------------------------------

-- mux Vc 
with clock_div1(3 downto 0) select
Vc <= Vc_1a when X"0",  -- Vc_xy : [0..255*1024]
		Vc_1b when X"1",  -- => Vc : [-256*1024..255*1024] 
		Vc_1c when X"2",
		Vc_2a when X"3",
		Vc_2b when X"4",
		Vc_2c when others;
			
-- mux Vin
with clock_div1(3 downto 0) select
Vin <= 	to_integer(unsigned(ay1_chan_a)) when X"0",   -- ayx_chan_y : [0..255]
			to_integer(unsigned(ay1_chan_b)) when X"1",   -- => Vin     : [-256:255]
			to_integer(unsigned(ay1_chan_c)) when X"2",
			to_integer(unsigned(ay2_chan_a)) when X"3",
			to_integer(unsigned(ay2_chan_b)) when X"4",
			to_integer(unsigned(ay2_chan_c)) when others;

-- compute dV
dV  <= Vin-Vc/1024;  -- Vc/1024 : [0..255], dv : [-255..511] => [-512..511]

-- mux filter cmd
with clock_div1(3 downto 0) select
mult_cmd <=  filter_cmd( 7 downto  6) when X"0",
				 filter_cmd( 9 downto  8) when X"1",
				 filter_cmd(11 downto 10) when X"2",
				 filter_cmd( 1 downto  0) when X"3",
				 filter_cmd( 3 downto  2) when X"4",
				 filter_cmd( 5 downto  4) when others;
				 
-- mux multiplier value
with mult_cmd select
mult_value <= 779 when "10", -- 0.047uF/1KOhm => (1024/fs.R.C = 779, cut fcy 3386Hz)
			     166 when "01", -- 0.220uF/1KOhm => (1024/fs.R.C = 166, cut fcy  723Hz)
			     137 when "11", -- 0.267uF/1KOhm => (1024/fs.R.C = 137, cut fcy  596Hz)
				  779 when others; -- Not use
				 
-- compute Vcn
Vcn_a <= Vin*1024 when mult_cmd = "00" else Vc + dv*mult_value; -- => Vcn_a : [-1024*1024..1023*1024]

-- limit to > 0
Vcn_b <= 0        when Vcn_a < 0 else Vcn_a; 

-- limit to < 255*1024
Vcn_c <= 255*1024 when Vcn_b > 255*1024 else Vcn_b;

-- demux/store result and mix channels				
process (clock_14)  
begin
	if rising_edge(clock_14) then -- 14.318MHz/512 => fs = 27.96KHz
	
		-- demux & down sample
		if clock_div1(8 downto 0) = '0'&X"00" then Vc_1a <= Vcn_c; end if;
		if clock_div1(8 downto 0) = '0'&X"01" then Vc_1b <= Vcn_c; end if;
		if clock_div1(8 downto 0) = '0'&X"02" then Vc_1c <= Vcn_c; end if;
		if clock_div1(8 downto 0) = '0'&X"03" then Vc_2a <= Vcn_c; end if;
		if clock_div1(8 downto 0) = '0'&X"04" then Vc_2b <= Vcn_c; end if;
		if clock_div1(8 downto 0) = '0'&X"05" then Vc_2c <= Vcn_c; end if;

		-- rescale and mix channels with down sample
		if clock_div1(8 downto 0) = '0'&X"06" then
			audio_out <= std_logic_vector(to_unsigned(Vc_1a/1024,11)) +
					   	 std_logic_vector(to_unsigned(Vc_1b/1024,11)) +
							 std_logic_vector(to_unsigned(Vc_1c/1024,11)) +
							 std_logic_vector(to_unsigned(Vc_2a/1024,11)) +
							 std_logic_vector(to_unsigned(Vc_2b/1024,11)) +
							 std_logic_vector(to_unsigned(Vc_2c/1024,11));		
		end if;
	end if;
end process;

			
-- divide clocks 
-- random generator ?
process (clock_14)
begin
	if reset='1' then
		clock_div1 <= (others =>'0');
		biquinary_div <= (others =>'0');
	else 
		if rising_edge(clock_14) then
			clock_div1  <= clock_div1 + '1';
			
			if clock_div1 = X"800" then
				if biquinary_div(3 downto 1) = "100" then
					biquinary_div(3 downto 1) <= "000";
				   biquinary_div(0) <= not biquinary_div(0);	
				else
					biquinary_div(3 downto 1) <= biquinary_div(3 downto 1) + '1';
				end if;
			end if;			
		
		end if;
	end if;   		
end process;

-- make clocks for cpu and sound generators
cpu_clock_en <= '1' when clock_div1(2 downto 0) = "011" else '0';
ayx_clock_en <= '1' when clock_div1(2 downto 0) = "111" else '0';

-- mux rom/ram/devices data ouput to cpu data input w.r.t cpu address
cpu_di <= cpu_rom_do   when cpu_addr(15 downto 12) = "0000" else -- 0000-0FFF
			 wram_do      when cpu_addr(15 downto 12) = "0011" else -- 3000-3FFF
			 ay1_do       when cpu_addr(15 downto 13) = "010"  else -- 4000-5FFF
			 ay2_do       when cpu_addr(15 downto 13) = "011"  else -- 6000-7FFF
   		 X"FF";

--	write enable to working ram and filter command register		 
wram_we   <= '1' when cpu_wr_n = '0' and cpu_addr(15 downto 12) = "0011" else '0';
filter_cmd_we <= '1' when cpu_wr_n = '0' and cpu_addr(15) = '1' else '0';

-- chip select with r/w direction to AY chips
sen1_n <= '0' when cpu_mreq_n = '0' and cpu_addr(15 downto 12) = X"4" else '1';
sen2_n <= '0' when cpu_mreq_n = '0' and cpu_addr(15 downto 12) = X"5" else '1';
sen3_n <= '0' when cpu_mreq_n = '0' and cpu_addr(15 downto 12) = X"6" else '1';
sen4_n <= '0' when cpu_mreq_n = '0' and cpu_addr(15 downto 12) = X"7" else '1';

-- finalise AY r/w & address controls
ay1_bc1   <= not sen2_n or (    cpu_wr_n and not sen1_n);
ay1_bdir  <= not sen2_n or (not cpu_wr_n and not sen1_n);
ay1_cs_n  <= sen1_n and sen2_n;

ay2_bc1   <= not sen4_n or (    cpu_wr_n and not sen3_n);
ay2_bdir  <= not sen4_n or (not cpu_wr_n and not sen3_n);
ay2_cs_n  <= sen3_n and sen4_n;

-- input random (?) to AY1 chip
ay1_port_b_di <= biquinary_div(0)&biquinary_div(3)&biquinary_div(2)&clock_div1(11)&"0000";

-- clear irq when reset and irq acknowledge
clr_irq_n <= reset_n and (cpu_m1_n or cpu_iorq_n); 

-- regsiter filters commands (11 bits data are cpu address)
process (clock_14, cpu_clock_en)
begin
	if rising_edge(clock_14) and cpu_clock_en = '1' then
		if filter_cmd_we = '1' then filter_cmd <= cpu_addr(11 downto 0); end if;
	end if;	
end process;

-- latch sound trigger rising edge to set cpu_irq, and manage clear
process (clock_14)
begin
	if rising_edge(clock_14) then
		
		sound_trig_r <= sound_trig;	
		
		if clr_irq_n = '0' then
			cpu_irq_n <= '1';
		else	
			if sound_trig ='1' and sound_trig_r = '0' then
				cpu_irq_n <= '0';
			end if;
		end if;
		
	end if;	
end process;

-- demux AY chips output
process (clock_14, ayx_clock_en)
begin
	if rising_edge(clock_14) and ayx_clock_en = '1' then
		if ay1_audio_chan = "00" then ay1_chan_a <= ay1_audio_muxed; end if;
		if ay1_audio_chan = "01" then ay1_chan_b <= ay1_audio_muxed; end if;
		if ay1_audio_chan = "10" then ay1_chan_c <= ay1_audio_muxed; end if;
		if ay2_audio_chan = "00" then ay2_chan_a <= ay2_audio_muxed; end if;
		if ay2_audio_chan = "01" then ay2_chan_b <= ay2_audio_muxed; end if;
		if ay2_audio_chan = "10" then ay2_chan_c <= ay2_audio_muxed; end if;
	end if;	
end process;

-- microprocessor Z80
cpu : entity work.T80se
generic map(Mode => 0, T2Write => 1, IOWait => 1)
port map(
  RESET_n => reset_n,
  CLK_n   => clock_14,
  CLKEN   => cpu_clock_en,
  WAIT_n  => '1',
  INT_n   => cpu_irq_n,
  NMI_n   => '1',
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

-- cpu1 program ROM
rom_cpu1 : entity work.pooyan_sound_prog
port map(
 clk  => clock_14n,
 addr => cpu_addr(12 downto 0),
 data => cpu_rom_do
);

-- working RAM
wram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_14n,
 we   => wram_we,
 addr => cpu_addr(9 downto 0),
 d    => cpu_do,
 q    => wram_do
);

-- AY-3-8910 #1
ay_3_8910_1 : entity work.YM2149
port map(
  -- data bus
  I_DA       => cpu_do,    -- in  std_logic_vector(7 downto 0);
  O_DA       => ay1_do,    -- out std_logic_vector(7 downto 0);
  O_DA_OE_L  => open,      -- out std_logic;
  -- control
  I_A9_L     => ay1_cs_n,  -- in  std_logic;
  I_A8       => '1',       -- in  std_logic;
  I_BDIR     => ay1_bdir,  -- in  std_logic;
  I_BC2      => '1',       -- in  std_logic;
  I_BC1      => ay1_bc1,   -- in  std_logic;
  I_SEL_L    => '1',       -- in  std_logic;

  O_AUDIO    => ay1_audio_muxed, -- out std_logic_vector(7 downto 0);
  O_CHAN     => ay1_audio_chan,  -- out std_logic_vector(1 downto 0);
  
  -- port a
  I_IOA      => sound_cmd, -- in  std_logic_vector(7 downto 0);
  O_IOA      => open,      -- out std_logic_vector(7 downto 0);
  O_IOA_OE_L => open,      -- out std_logic;
  -- port b
  I_IOB      => ay1_port_b_di,   -- in  std_logic_vector(7 downto 0);
  O_IOB      => open,            -- out std_logic_vector(7 downto 0);
  O_IOB_OE_L => open,            -- out std_logic;

  ENA        => ayx_clock_en,    -- in  std_logic; -- clock enable for higher speed operation
  RESET_L    => reset_n,         -- in  std_logic;
  CLK        => clock_14         -- in  std_logic
);

-- AY-3-8910 #2
ay_3_8910_2 : entity work.YM2149
port map(
  -- data bus
  I_DA       => cpu_do,    -- in  std_logic_vector(7 downto 0);
  O_DA       => ay2_do,    -- out std_logic_vector(7 downto 0);
  O_DA_OE_L  => open,      -- out std_logic;
  -- control
  I_A9_L     => ay2_cs_n,  -- in  std_logic;
  I_A8       => '1',       -- in  std_logic;
  I_BDIR     => ay2_bdir,  -- in  std_logic;
  I_BC2      => '1',       -- in  std_logic;
  I_BC1      => ay2_bc1,   -- in  std_logic;
  I_SEL_L    => '1',       -- in  std_logic;

  O_AUDIO    => ay2_audio_muxed, -- out std_logic_vector(7 downto 0);
  O_CHAN     => ay2_audio_chan,  -- out std_logic_vector(1 downto 0);
  
  -- port a
  I_IOA      => (others => '0'), -- in  std_logic_vector(7 downto 0);
  O_IOA      => open,            -- out std_logic_vector(7 downto 0);
  O_IOA_OE_L => open,            -- out std_logic;
  -- port b
  I_IOB      => (others => '0'), -- in  std_logic_vector(7 downto 0);
  O_IOB      => open,            -- out std_logic_vector(7 downto 0);
  O_IOB_OE_L => open,            -- out std_logic;

  ENA        => ayx_clock_en,    -- in  std_logic; -- clock enable for higher speed operation
  RESET_L    => reset_n,         -- in  std_logic;
  CLK        => clock_14         -- in  std_logic
);


end struct;