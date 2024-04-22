---------------------------------------------------------------------------------
-- Yamato sound 2xAY-3-8910 - Slingshot - June 2022
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity yamato_sound is
port (
	reset_n      : in  std_logic;
	clock_12     : in  std_logic;
	cpu_clock_en : in  std_logic;
	p0           : in  std_logic_vector( 7 downto 0);
	p1           : in  std_logic_vector( 7 downto 0);
	audio        : out std_logic_vector(15 downto 0);

	rom_addr     : out std_logic_vector(12 downto 0);
	rom_do       : in  std_logic_vector( 7 downto 0)
);
end yamato_sound;

architecture struct of yamato_sound is

signal hdiv         : std_logic_vector(1 downto 0);
signal clock_1_5mhz : std_logic; -- 1.50Mhz
signal clock_1_5mhz_en : std_logic; -- 1.50Mhz

signal p0_cs           : std_logic;
signal p1_cs           : std_logic;
signal ay1_cs          : std_logic;
signal ay2_cs          : std_logic;
signal rom_cs          : std_logic;
signal ram_cs          : std_logic;
signal ram_we          : std_logic;
signal ram_do          : std_logic_vector( 7 downto 0);

signal cpu_addr        : std_logic_vector(15 downto 0);
signal cpu_do          : std_logic_vector( 7 downto 0);
signal cpu_di          : std_logic_vector( 7 downto 0);
signal cpu_wr_n        : std_logic;
signal cpu_iorq_n      : std_logic;
signal cpu_mreq_n      : std_logic;
signal ym_2149_1_data  : std_logic_vector( 7 downto 0);
signal ym_2149_2_data  : std_logic_vector( 7 downto 0);

signal ym_2149_1_audio : std_logic_vector( 9 downto 0);
signal ym_2149_2_audio : std_logic_vector( 9 downto 0);

begin

process(clock_12)
begin
	if rising_edge(clock_12) then
		clock_1_5mhz_en <= '0';
		if cpu_clock_en = '1' then
			clock_1_5mhz <= not clock_1_5mhz;
			if clock_1_5mhz = '0' then
				clock_1_5mhz_en <= '1';
			end if;
		end if;
	end if;
end process;

ay1_cs <= '1' when cpu_mreq_n = '1' and cpu_iorq_n = '0' and cpu_addr(3 downto 1) = "000" else '0';
ay2_cs <= '1' when cpu_mreq_n = '1' and cpu_iorq_n = '0' and cpu_addr(3 downto 1) = "001" else '0';
p0_cs  <= '1' when cpu_mreq_n = '1' and cpu_iorq_n = '0' and cpu_addr(3 downto 1) = "010" else '0';
p1_cs  <= '1' when cpu_mreq_n = '1' and cpu_iorq_n = '0' and cpu_addr(3 downto 1) = "100" else '0';

rom_addr <= cpu_addr(12 downto 0);
rom_cs <= '1' when cpu_mreq_n = '0' and cpu_iorq_n = '1' and cpu_addr(15 downto 11) = "00000" else '0';  -- 0x0000-0x07ff
ram_cs <= '1' when cpu_mreq_n = '0' and cpu_iorq_n = '1' and cpu_addr(15 downto 10) = "010100" else '0'; -- 0x5000-0x53ff
cpu_di <= rom_do when rom_cs = '1' else
          ram_do when ram_cs = '1' else
          p0 when p0_cs = '1' else
          p1 when p1_cs = '1' else
          ym_2149_1_data when ay1_cs = '1' else
          ym_2149_2_data when ay2_cs = '1' else
          x"FF";

ram_we <= ram_cs and not cpu_wr_n and not cpu_mreq_n;

wram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_12,
 we   => ram_we,
 addr => cpu_addr(9 downto 0),
 d    => cpu_do,
 q    => ram_do
);

Z80 : entity work.T80se
generic map(Mode => 0, T2Write => 1, IOWait => 1)
port map(
  RESET_n => reset_n,
  CLK_n   => clock_12,
  CLKEN   => cpu_clock_en,
  WAIT_n  => '1',
  INT_n   => '1',
  NMI_n   => '1',
  BUSRQ_n => '1',
  M1_n    => open,
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

ym2149_1 : entity work.ym2149
port map (
-- data bus
	I_DA            => cpu_do,       --: in  std_logic_vector(7 downto 0);
	O_DA            => ym_2149_1_data, --: out std_logic_vector(7 downto 0);
	O_DA_OE_L       => open,         --: out std_logic;
-- control
	I_A9_L          => '0', --scs_n,	--: in  std_logic;
	I_A8            => '1', --: in  std_logic;
	I_BDIR          => not cpu_wr_n and ay1_cs, --: in  std_logic;
	I_BC2           => '1', --: in  std_logic;
	I_BC1           => not cpu_addr(0) and ay1_cs, --: in  std_logic;
	I_SEL_L         => '1',                            --: in  std_logic;
-- audio
	O_AUDIO_L       => ym_2149_1_audio, --: out std_logic_vector(9 downto 0);
-- port a
	I_IOA           => "11111111",    --: in  std_logic_vector(7 downto 0);
	O_IOA           => open,          --: out std_logic_vector(7 downto 0);
	O_IOA_OE_L      => open,          --: out std_logic;
-- port b
	I_IOB           => "11111111",    --: in  std_logic_vector(7 downto 0);
	O_IOB           => open,          --: out std_logic_vector(7 downto 0);
	O_IOB_OE_L      => open,          --: out std_logic;

	ENA             => clock_1_5mhz_en,--: in  std_logic; -- clock enable for higher speed operation
	RESET_L         => '1',           --: in  std_logic;
	CLK             => clock_12       --: in  std_logic
);
	
ym2149_2 : entity work.ym2149
port map (
-- data bus
	I_DA            => cpu_do,       --: in  std_logic_vector(7 downto 0);
	O_DA            => ym_2149_2_data, --: out std_logic_vector(7 downto 0);
	O_DA_OE_L       => open,         --: out std_logic;
-- control
	I_A9_L          => '0', --scs_n,	--: in  std_logic;
	I_A8            => '1',  --: in  std_logic;
	I_BDIR          => not cpu_wr_n and ay2_cs, --: in  std_logic;
	I_BC2           => '1', --: in  std_logic;
	I_BC1           => not cpu_addr(0) and ay2_cs, --: in  std_logic;
	I_SEL_L         => '1',                            --: in  std_logic;
-- audio
	O_AUDIO_L       => ym_2149_2_audio, --: out std_logic_vector(9 downto 0);
-- port a
	I_IOA           => "11111111",    --: in  std_logic_vector(7 downto 0);
	O_IOA           => open,          --: out std_logic_vector(7 downto 0);
	O_IOA_OE_L      => open,          --: out std_logic;
-- port b
	I_IOB           => "11111111",    --: in  std_logic_vector(7 downto 0);
	O_IOB           => open,          --: out std_logic_vector(7 downto 0);
	O_IOB_OE_L      => open,          --: out std_logic;

	ENA             => clock_1_5mhz_en,--: in  std_logic; -- clock enable for higher speed operation
	RESET_L         => '1',           --: in  std_logic;
	CLK             => clock_12       --: in  std_logic
);

audio <= "000" & std_logic_vector(unsigned(ym_2149_1_audio) + unsigned(ym_2149_2_audio)) & "000";

end architecture;