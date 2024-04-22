---------------------------------------------------------------------------------
-- Crazy climber sound AY-3-8910 and samples - Dar - June 2018
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity crazy_climber_sound is
port	(
	clock_12     : in std_logic;
	cpu_clock_en : in std_logic;
	cpu_addr     : in std_logic_vector(15 downto 0);
	cpu_data     : in std_logic_vector( 7 downto 0);
	cpu_iorq_n   : in std_logic;
	reg4_we_n    : in std_logic;
	reg5_we_n    : in std_logic;
	reg6_we_n    : in std_logic;
	ym_2149_data : out std_logic_vector( 7 downto 0);
	sound_sample : out std_logic_vector(15 downto 0);

	rom_addr     : out std_logic_vector(12 downto 0);
	rom_do       : in std_logic_vector( 7 downto 0)
);
end crazy_climber_sound;

architecture struct of crazy_climber_sound is

signal hdiv         : std_logic_vector(1 downto 0);
signal clock_1_5mhz : std_logic; -- 1.50Mhz
signal clock_750khz : std_logic; -- 0.75MHz
signal clock_1_5mhz_en : std_logic; -- 1.50Mhz
signal clock_750khz_en : std_logic; -- 0.75MHz

signal ym_2149_audio : std_logic_vector(9 downto 0);

signal vctr_n          : std_logic;
signal scs_n           : std_logic;
signal frequency_div   : std_logic_vector( 7 downto 0); 

signal frequency_cnt   : std_logic_vector( 7 downto 0);
signal frequency_tick  : std_logic;
signal sample_volume   : std_logic_vector( 7 downto 0);
signal sample_start1   : std_logic_vector( 7 downto 0);
signal sample_start2   : std_logic_vector( 7 downto 0);
signal sample_cnt      : std_logic_vector(11 downto 0);
signal sample_rom_addr : std_logic_vector(12 downto 0);
signal sound_data      : std_logic_vector( 7 downto 0);
signal sample_data     : std_logic_vector(3 downto 0);

begin

--clock_1_5mhz <= hdiv(0);
--clock_750khz <= hdiv(1);

clock_1_5mhz_en <= cpu_clock_en and hdiv(0);
clock_750khz_en <= '1' when cpu_clock_en = '1' and hdiv="01" else '0';

process(clock_12, cpu_clock_en)
begin
	if rising_edge(clock_12) and cpu_clock_en = '1' then

		if hdiv = "11" then
			hdiv <= "00";
		else
			hdiv <= std_logic_vector(unsigned(hdiv) + 1);
		end if;

		if cpu_addr(2 downto 0) = "100" and reg4_we_n = '0' then
			vctr_n <= cpu_data(0);
		end if;
		
		if cpu_addr(2 downto 0) = "111" and reg4_we_n = '0' then
			scs_n <= cpu_data(0);
		end if;

		if reg5_we_n = '0' then
			frequency_div<= cpu_data(7 downto 0);
		end if;

		if reg6_we_n = '0' then
			sample_volume<= cpu_data(7 downto 0);
		end if;

	end if;
end process;

-- Sample machine

process(clock_12, clock_750khz_en)
begin
	if rising_edge(clock_12) and clock_750khz_en = '1' then
		if frequency_cnt = "11111111" then
			frequency_cnt   <= frequency_div;
			frequency_tick  <= '1';
		else
			frequency_cnt <= std_logic_vector(unsigned(frequency_cnt) + 1);
			frequency_tick  <= '0';
		end if;
	end if; 
end process;

process(frequency_tick)
begin
	if rising_edge(frequency_tick) then
		if vctr_n = '0' then
			sample_cnt <= sample_start1(5 downto 0) & "000000";
		else
			if sound_data = "01110000" then
				sample_cnt <= sample_cnt;
			else
				sample_cnt <= std_logic_vector(unsigned(sample_cnt) + 1);
			end if;
		end if;
	end if; 
end process;

sample_rom_addr <= sample_start1(7 downto 6) & sample_cnt(11 downto 1);

sample_data <= sound_data(3 downto 0) when sample_cnt(0) = '0' else sound_data(7 downto 4);

sound_sample <= std_logic_vector(( unsigned(ym_2149_audio) & unsigned(ym_2149_audio(9 downto 4))) + unsigned("000" & sample_data & sample_data & "00000"));
------

rom_addr <= sample_rom_addr;
sound_data <= rom_do;

ym2149 : entity work.ym2149
port map (
-- data bus
	I_DA            => cpu_data,     --: in  std_logic_vector(7 downto 0);
	O_DA            => ym_2149_data, --: out std_logic_vector(7 downto 0);
	O_DA_OE_L       => open,         --: out std_logic;
-- control
	I_A9_L          => '0', --scs_n,	--: in  std_logic;
	I_A8            =>     cpu_iorq_n or cpu_addr(3),  --: in  std_logic;
	I_BDIR          => not(cpu_iorq_n or cpu_addr(2)), --: in  std_logic;
	I_BC2           => not(cpu_iorq_n or cpu_addr(1)), --: in  std_logic;
	I_BC1           => not(cpu_iorq_n or cpu_addr(0)), --: in  std_logic;
	I_SEL_L         => '1',                            --: in  std_logic;
-- audio
	O_AUDIO_L       => ym_2149_audio, --: out std_logic_vector(9 downto 0);
-- port a
	I_IOA           => "11111111",    --: in  std_logic_vector(7 downto 0);
	O_IOA           => sample_start1, --: out std_logic_vector(7 downto 0);
	O_IOA_OE_L      => open,          --: out std_logic;
-- port b
	I_IOB           => "11111111",    --: in  std_logic_vector(7 downto 0);
	O_IOB           => sample_start2, --: out std_logic_vector(7 downto 0);
	O_IOB_OE_L      => open,          --: out std_logic;

	ENA             => clock_1_5mhz_en,--: in  std_logic; -- clock enable for higher speed operation
	RESET_L         => '1',           --: in  std_logic;
	CLK             => clock_12       --: in  std_logic
);

end architecture;