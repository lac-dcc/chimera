---------------------------------------------------------------------------------
-- burger time sound by Dar (darfpga@aol.fr) (27/12/2017)
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
-- Use burger_time_de10_lite.sdc to compile (Timequest constraints)
-- /!\
-- Don't forget to set device configuration mode with memory initialization 
--  (Assignments/Device/Pin options/Configuration mode)
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity burger_time_sound is
port
(
	clock_12     : in std_logic;
	reset        : in std_logic;
	
	sound_req     : in std_logic;
	sound_code_in : in std_logic_vector(7 downto 0);
	sound_timing  : in std_logic;

	audio_out     : out std_logic_vector(10 downto 0);
	snd_rom_addr	: out std_logic_vector(11 downto 0);
	snd_rom_do     : in std_logic_vector(7 downto 0);
	dbg_cpu_addr: out std_logic_vector(15 downto 0)
  );
end burger_time_sound;

architecture syn of burger_time_sound is

  -- clocks, reset
  signal clock_12n      : std_logic;
  signal clock_div1     : std_logic_vector(8 downto 0) := (others =>'0');
  signal clock_div2     : std_logic_vector(4 downto 0) := (others =>'0');
  signal clock_500K     : std_logic;
  signal ayx_clock      : std_logic;
  signal reset_n        : std_logic;
      
  -- cpu signals  
  signal cpu_addr       : std_logic_vector(23 downto 0);
  signal cpu_di         : std_logic_vector( 7 downto 0);
  signal cpu_di_dec     : std_logic_vector( 7 downto 0);
  signal cpu_do         : std_logic_vector( 7 downto 0);
  signal cpu_rw_n       : std_logic;
  signal cpu_nmi_n      : std_logic;
  signal cpu_irq_n      : std_logic;
  signal cpu_sync       : std_logic;
  
  -- program rom signals
  signal prog_rom_cs     : std_logic;
  signal prog_rom_do     : std_logic_vector(7 downto 0); 

  -- working ram signals
  signal wram_cs         : std_logic;
  signal wram_we         : std_logic;
  signal wram_do         : std_logic_vector(7 downto 0);

  -- sound req management  
  signal nmi_reg    : std_logic;
  signal nmi_reg_cs : std_logic;
  signal nmi_reg_we : std_logic;
  signal sound_code : std_logic_vector(7 downto 0);
  signal sound_code_cs : std_logic;

  -- ay-3-8910 signal
  signal ay1_bc1  : std_logic;
  signal ay1_bdir : std_logic;
  signal ay1_audio_chan : std_logic_vector(1 downto 0);
  signal ay1_audio_muxed: std_logic_vector(7 downto 0);
  signal ay1_chan_a: std_logic_vector(7 downto 0);
  signal ay1_chan_b: std_logic_vector(7 downto 0);
  signal ay1_chan_c: std_logic_vector(7 downto 0);

  signal ay2_bc1  : std_logic;
  signal ay2_bdir : std_logic;
  signal ay2_audio_chan : std_logic_vector(1 downto 0);
  signal ay2_audio_muxed: std_logic_vector(7 downto 0);
  signal ay2_chan_a: std_logic_vector(7 downto 0);
  signal ay2_chan_b: std_logic_vector(7 downto 0);
  signal ay2_chan_c: std_logic_vector(7 downto 0);
 
  -- digital filtering AY2 channel A
  signal uin  : integer range -256 to 255;
  signal u3   : integer range -32768 to 32767;
  signal u4   : integer range -32768 to 32767;
  signal du3  : integer range -32768*4096 to 32767*4096;
  signal du4  : integer range -32768*4096 to 32767*4096;
  signal uout : integer range -32768 to 32767;
  signal uout_lim : integer range -128 to 127;
  
begin

process (clock_12, cpu_sync)
begin 
	if rising_edge(clock_12) then
		if cpu_sync = '1' then
			dbg_cpu_addr <= cpu_addr(15 downto 0);
		end if;
	end if;		
end process;

reset_n <= not reset;
clock_12n <= not clock_12;
  
process (clock_12, reset)
  begin
	if reset='1' then
		clock_div1 <= (others => '0');
		clock_div2 <= (others => '0');
	else
      if rising_edge(clock_12) then
			if clock_div1 = "111111111" then -- divide by 512 (23.437kHz)
				clock_div1 <= "000000000";
			else
				clock_div1 <= clock_div1 + '1';
			end if;
			if clock_div2 = "10111" then -- divide by 24
				clock_div2 <= "00000";
			else
				clock_div2 <= clock_div2 + '1';
			end if;
		end if;
	end if;
end process;

clock_500K <= clock_div2(4); --12MHz/24 = 500kHz
ayx_clock  <= clock_div1(2); --12MHz/8  = 1.5MHz

--static ADDRESS_MAP_START( audio_map, AS_PROGRAM, 8, btime_state )
--	AM_RANGE(0x0000, 0x03ff) AM_MIRROR(0x1c00) AM_RAM AM_SHARE("audio_rambase")
--	AM_RANGE(0x2000, 0x3fff) AM_DEVWRITE("ay1", ay8910_device, data_w)
--	AM_RANGE(0x4000, 0x5fff) AM_DEVWRITE("ay1", ay8910_device, address_w)
--	AM_RANGE(0x6000, 0x7fff) AM_DEVWRITE("ay2", ay8910_device, data_w)
--	AM_RANGE(0x8000, 0x9fff) AM_DEVWRITE("ay2", ay8910_device, address_w)
--	AM_RANGE(0xa000, 0xbfff) AM_READ(audio_command_r)
--	AM_RANGE(0xc000, 0xdfff) AM_WRITE(audio_nmi_enable_w)
--	AM_RANGE(0xe000, 0xefff) AM_MIRROR(0x1000) AM_ROM
--ADDRESS_MAP_END

-- chip select
wram_cs       <= '1' when cpu_addr(15 downto 13) = "000"                  else '0'; -- working ram     0000-07ff .. 1fff
ay1_bc1       <= '1' when cpu_addr(15 downto 13) = "010"                  else '0';
ay1_bdir      <= '1' when cpu_addr(15 downto 13) = "001" or ay1_bc1 = '1' else '0';
ay2_bc1       <= '1' when cpu_addr(15 downto 13) = "100"                  else '0';
ay2_bdir      <= '1' when cpu_addr(15 downto 13) = "011" or ay2_bc1 = '1' else '0';
sound_code_cs <= '1' when cpu_addr(15 downto 13) = "101"                  else '0';
nmi_reg_cs    <= '1' when cpu_addr(15 downto 13) = "110"                  else '0';
prog_rom_cs   <= '1' when cpu_addr(15 downto 13) = "111"                  else '0';

-- write enable
wram_we        <= '1' when wram_cs = '1' and cpu_rw_n = '0' else '0';
nmi_reg_we     <= '1' when nmi_reg_cs = '1'  and cpu_rw_n = '0' else '0';
    			
-- cpu di mux
cpu_di <= wram_do        when wram_cs       = '1' else
			 prog_rom_do    when prog_rom_cs   = '1' else
			 sound_code     when sound_code_cs = '1' else
          X"FF";
	
-- regsiter sound code and irq management
process (clock_12)
begin
	if rising_edge(clock_12) then
		if sound_req = '1' then 
			sound_code <= sound_code_in;
	      cpu_irq_n <= '0';		
		end if;
		if sound_code_cs = '1' then
	      cpu_irq_n <= '1';		
		end if;
	end if;	
end process;

-- nmi autorisation management
process (reset, clock_12)
begin
	if reset = '1' then
		nmi_reg <= '0';
	else
		if rising_edge(clock_12) then		
			if nmi_reg_we = '1' then
				nmi_reg <= cpu_do(0);
			end if;
		end if;
	end if;	
end process;

-- nmi 
cpu_nmi_n <= '0' when nmi_reg = '1' and sound_timing = '1' else '1';

-- demux AY chips output
process (ayx_clock)
begin
	if rising_edge(ayx_clock) then
		if ay1_audio_chan = "00" then ay1_chan_a <= ay1_audio_muxed; end if;
		if ay1_audio_chan = "01" then ay1_chan_b <= ay1_audio_muxed; end if;
		if ay1_audio_chan = "10" then ay1_chan_c <= ay1_audio_muxed; end if;
		if ay2_audio_chan = "00" then ay2_chan_a <= ay2_audio_muxed; end if;
		if ay2_audio_chan = "01" then ay2_chan_b <= ay2_audio_muxed; end if;
		if ay2_audio_chan = "10" then ay2_chan_c <= ay2_audio_muxed; end if;		
	end if;	
end process;

-- AOP Rauch passe bande filter
--
--                 ----------o------------
--            u4^  |         |           |
--              | --- C4    | | R5       |
--              | ---       | |          |
--              |  |    C3   |           |
--     --| R1 |----o----||---o------|\   |
--     ^           |  ------> u3    | \__o---
--     |           |                | /     ^
--     |uin       | | R2          --|/      |
--     |          | |             |         | uout
--     |           |              |         |
--     ------------o--------------o----------   
--
--
-- i1 = (sin+u3)/R1
-- i2 = -u3/R2
-- i3 = (u4-u3)/R5
-- i4 = i2-i1-i3
--    
-- u3(t+dt) = u3(t) + i3(t)*dt/C3;
-- u4(t+dt) = u4(t) + i4(t)*dt/C4; 

-- uout = u4-u3

-- R1 = 5000;
-- R2 = 10000;
-- C3 = 0.068e-6;
-- C4 = 0.068e-6;
-- R5 = 47000;
--
-- dt = 1/f_ech = 1/23437
-- dt/C3 = dt/C4 = 627
--
-- (i3(t)*dt/C3)*8192 = du3*8192 = ((u4-u3)/47000*627)*8192 
--                               = (u4-u3)*109
--
-- (i4(t)*dt/C4)*8192 = du4*8192 = (-u3/10000 -(uin+u3)/5000 -(u4-u3)/47000)*627*8192
--                               = -u3(514+1027-109) - uin*1027 - u4*109
--										   = -(u4*109 + u3*1432 + uin*1027)
--

-- down sample to 23.437kHz and filter AY2 channel A
uin <= to_integer(unsigned(ay2_chan_a));

process (clock_12)
begin
	if rising_edge(clock_12) then
	
		if clock_div1 = "000000000" then 
			du3 <= u4*109 - u3*109;
			du4 <= u4*109 + u3*1432 + uin*1027*16; -- add gain(16) to uin
		end if;	

		if clock_div1 = "000000001" then 
			u3 <= u3 + du3/8192;
			u4 <= u4 - du4/8192;
		end if;
		
		if clock_div1 = "000000010" then
			uout <= (u4 - u3) / 8; -- adjust output gain
		end if;
		
		-- limit signed dynamique before return to unsigned
		if clock_div1 = "000000011" then
			if uout > 127 then
				uout_lim <= 127;
			elsif uout < -127 then
				uout_lim <= -127;
			else
				uout_lim <= uout;
			end if;
		end if;	

		if clock_div1 = "000000100" then 

			audio_out <= 	("000"&ay1_chan_a(7 downto 0)) +
								("000"&ay1_chan_b(7 downto 0)) +
								("000"&ay1_chan_c(7 downto 0)) +			
								("000"&std_logic_vector(to_unsigned(uout_lim+128,8)))+
								("000"&ay2_chan_b(7 downto 0)) +
								("000"&ay2_chan_c(7 downto 0));
		end if;
		
	end if;	
end process;
	
---------------------------
-- components
---------------------------			
			
cpu_inst : entity work.T65
port map
(
    Mode        => "00",  -- 6502
    Res_n       => reset_n,
    Enable      => '1',
    Clk         => clock_500K,
    Rdy         => '1',
    Abort_n     => '1',
    IRQ_n       => cpu_irq_n,
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
    DI          => cpu_di,
    DO          => cpu_do
);


-- working ram 
wram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk  => clock_12n,
 we   => wram_we,
 addr => cpu_addr(10 downto 0),
 d    => cpu_do,
 q    => wram_do
);

-- program rom
--program_rom: entity work.sound_prog
--port map(
-- clk  => clock_12n,
-- addr => cpu_addr(11 downto 0),
-- data => prog_rom_do
--);

snd_rom_addr <= cpu_addr(11 downto 0);
prog_rom_do <= snd_rom_do;	

-- AY-3-8910 #1
ay_3_8910_1 : entity work.YM2149
port map(
  -- data bus
  I_DA       => cpu_do,    -- in  std_logic_vector(7 downto 0);
  O_DA       => open,      -- out std_logic_vector(7 downto 0);
  O_DA_OE_L  => open,      -- out std_logic;
  -- control
  I_A9_L     => '0',       -- in  std_logic;
  I_A8       => '1',       -- in  std_logic;
  I_BDIR     => ay1_bdir,  -- in  std_logic;
  I_BC2      => '1',       -- in  std_logic;
  I_BC1      => ay1_bc1,   -- in  std_logic;
  I_SEL_L    => '1',       -- in  std_logic;

  O_AUDIO    => ay1_audio_muxed, -- out std_logic_vector(7 downto 0);
  O_CHAN     => ay1_audio_chan,  -- out std_logic_vector(1 downto 0);
  
  -- port a
  I_IOA      => X"00",     -- in  std_logic_vector(7 downto 0);
  O_IOA      => open,      -- out std_logic_vector(7 downto 0);
  O_IOA_OE_L => open,      -- out std_logic;
  -- port b
  I_IOB      => X"00",     -- in  std_logic_vector(7 downto 0);
  O_IOB      => open,      -- out std_logic_vector(7 downto 0);
  O_IOB_OE_L => open,      -- out std_logic;

  ENA        => '1',       -- in  std_logic; -- clock enable for higher speed operation
  RESET_L    => reset_n,   -- in  std_logic;
  CLK        => ayx_clock  -- in  std_logic  -- note 6 Mhz
);

-- AY-3-8910 #2
ay_3_8910_2 : entity work.YM2149
port map(
  -- data bus
  I_DA       => cpu_do,    -- in  std_logic_vector(7 downto 0);
  O_DA       => open,      -- out std_logic_vector(7 downto 0);
  O_DA_OE_L  => open,      -- out std_logic;
  -- control
  I_A9_L     => '0',       -- in  std_logic;
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

  ENA        => '1', --cpu_ena,         -- in  std_logic; -- clock enable for higher speed operation
  RESET_L    => reset_n,         -- in  std_logic;
  CLK        => ayx_clock        -- in  std_logic  -- note 6 Mhz
);


end SYN;
