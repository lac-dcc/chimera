-- Audio for Atari Subs
-- (c) 2018 James Sweet
--
-- This is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- This is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.numeric_std.all;

entity audio is 
port(		
			Clk_50				: in	std_logic;
			Clk_12				: in  std_logic;
			Clk_6					: in  std_logic;
			Ena_3k				: in  std_logic;
			Reset_n				: in	std_logic;
			Load_n				: in	std_logic_vector(8 downto 1);
			SnrStart1			: in  std_logic;
			SnrStart2			: in  std_logic;
			Noise_reset_n		: in  std_logic;
			Crash					: in  std_logic;
			Explode				: in  std_logic;
			PRAM					: in	std_logic_vector(7 downto 0);
			HCount				: in  std_logic_vector(8 downto 0);
			VCount				: in  std_logic_vector(7 downto 0);
			P1_audio				: out std_logic_vector(7 downto 0);
			P2_audio				: out std_logic_vector(7 downto 0)
			);
end audio;

architecture rtl of audio is


signal reset						: std_logic;

signal V8							: std_logic;
signal H4							: std_logic;
signal H256							: std_logic;

signal RNoise						: std_logic := '0';
signal Gated_noise				: std_logic := '0';
signal Noise_Shift				: std_logic_vector(15 downto 0) := (others => '0');
signal Shift_in  					: std_logic := '0';

signal Bang 						: std_logic_vector(3 downto 0) := (others => '0');
signal Crash_raw					: std_logic_vector(3 downto 0) := (others => '0');
signal Crash_snd					: std_logic_vector(3 downto 0) := (others => '0');
signal Explosion					: std_logic_vector(5 downto 0) := (others => '0');
signal Launch_raw					: std_logic_vector(3 downto 0) := (others => '0');
signal Launch						: std_logic_vector(3 downto 0) := (others => '0');

signal explosion_prefilter    : std_logic_vector(3 downto 0) := (others => '0');
signal explosion_filter_t1    : std_logic_vector(3 downto 0) := (others => '0');
signal explosion_filter_t2    : std_logic_vector(3 downto 0) := (others => '0');
signal explosion_filter_t3    : std_logic_vector(3 downto 0) := (others => '0');
signal explosion_filtered     : std_logic_vector(5 downto 0) := (others => '0');

signal Ping_duration1			: std_logic_vector(11 downto 0);
signal Ping_duration2			: std_logic_vector(11 downto 0);

signal Sonar1 						: std_logic_vector(5 downto 0);
signal Sonar2 						: std_logic_vector(5 downto 0);



signal clk_count : std_logic_vector(3 downto 0);
signal clk_1k : std_logic;

signal Snr1_envelope 			: std_logic_vector(8 downto 0);
signal Snr1_prefilter			: std_logic_vector(8 downto 0);
signal Snr1_ping					: std_logic_vector(7 downto 0);
signal Snr2_envelope 			: std_logic_vector(8 downto 0);
signal Snr2_prefilter			: std_logic_vector(8 downto 0);
signal Snr2_ping					: std_logic_vector(7 downto 0);


signal unsigned_filt		: std_logic_vector(18 downto 0);
signal filtered_audio	: signed(18 downto 0);
signal audio_data			: std_logic_vector(17 downto 0);
signal voice1_signed		: signed(12 downto 0);
signal unsigned_audio	: std_logic_vector(17 downto 0);
signal input_valid		: std_logic;
signal tick_q1  			: std_logic;
signal tick_q2 			: std_logic;
signal ff1					: std_logic;

signal testcount 	: std_logic_vector(25 downto 0);

begin

-- HCount
-- (0) 1H 	3 MHz
-- (1) 2H   1.5MHz
-- (2) 4H	750 kHz
-- (3) 8H	375 kHz
-- (4) 16H	187 kHz
-- (5) 32H	93 kHz
-- (6) 64H	46 kHz
-- (7) 128H 23 kHz
-- (8) 256H 12 kHz


reset <= (not reset_n);

H4 <= HCount(2);
H256 <= HCount(8);
V8 <= VCount(3);

--process(clk_6, ena_3k)
--begin
--if rising_edge(clk_6) then
--	if ena_3k = '1' then
--		if clk_count = "0001" then
--			clk_count <= (others => '0');
--			clk_1k <= (not clk_1k);
--		else
--			clk_count <= clk_count + 1;
--		end if;
--	end if;
--end if;
--end process;




-- Sonar ping envelope generator, this is a 0.1 second decaying burst of rnoise
Ping1_envelope: process(Clk_6, ena_3k, SnrStart1)
begin
	if SnrStart1 = '0' then
		Snr1_envelope <= "100101100"; -- 300 decremented at 3kHz gives 0.1 second
	elsif rising_edge(clk_6) then
		if Ena_3k = '1' then
			if Snr1_envelope > 0 then
				Snr1_envelope <= Snr1_envelope - 1;
			end if;
		end if;
	end if;
end process;

Ping2_envelope: process(Clk_6, ena_3k, SnrStart2)
begin
	if SnrStart2 = '0' then
		--Snr2_envelope <= "100101100"; -- 300 decremented at 3kHz gives 0.1 second
		Snr2_envelope <= "111111110"; 
	elsif rising_edge(clk_6) then
		if Ena_3k = '1' then
			if Snr2_envelope > 0 then
				Snr2_envelope <= Snr2_envelope - 1;
			end if;
		end if;
	end if;
end process;


-- Envelope is modulated by rnoise
Snr1_prefilter <= Snr1_envelope when rnoise = '1' and SnrStart1 = '1' else (others => '0');

Snr2_prefilter <= Snr2_envelope when rnoise = '1' and SnrStart2 = '1' else (others => '0');


process(h256)
begin
if rising_edge(h256) then
	testcount <= testcount + 1;
end if;
end process;



-- State Variable Filter with 1kHz bandpass

--voice1_signed <= signed("0000" & Snr1_prefilter) - 2048;
--
--SnrFilter1: entity work.sid_filters 
--	port map (
--		clk			=> Clk_12,
--		rst			=> Reset,
--		-- SID registers.
--		Fc_lo			=> "00000101",
--		Fc_hi			=> "11111111",
--		Res_Filt		=> testcount(22 downto 15),
--		Mode_Vol		=> "01111111",
--		-- Voices - resampled to 13 bit
--		voice1		=> voice1_signed,
--		voice2		=> voice1_signed,
--		voice3		=> voice1_signed,
--		--
--		input_valid => '1',
--		ext_in		=> voice1_signed,
--
--		sound			=> filtered_audio,
--		valid			=> open
--	);
--	
--	
--
--	unsigned_filt 	<= std_logic_vector(filtered_audio + "1000000000000000000");
--	unsigned_audio	<= unsigned_filt(18 downto 1);
--	audio_data		<= unsigned_audio;
--	

-- Temporary test:
--Snr1_ping <= audio_data(8 downto 1);
--Snr2_ping <= audio_data(8 downto 1); --Snr2_prefilter(8 downto 1);

snr1_ping <= Snr1_prefilter(8 downto 1);
snr2_ping <= Snr2_prefilter(8 downto 1);


---- LFSR consisting of K11 and K12 that generates pseudo-random noise (sounds like crap, is schematic wrong?)
--Noise_gen: process(H256, noise_reset_n)
--begin
----	if (noise_reset_n = '0') then
----		noise_shift <= (others => '0');
----		rnoise <= '0';
--	if rising_edge(H256) then
--		shift_in <= (not noise_shift(1)) xor noise_shift(2);
--		--shift_in <= not (noise_shift(1) xor noise_shift(2));
--		noise_shift <= shift_in & noise_shift(15 downto 1);
--		rnoise <= noise_shift(2); 
--	end if;
--end process;


-- LFSR that generates pseudo-random noise (from Ultra Tank, this one sounds right)
Noise_gentank: process(H256, noise_reset_n)
begin
	if (noise_reset_n = '0') then
		noise_shift <= (others => '0');
		rnoise <= '0';
	elsif rising_edge(H256) then
		shift_in <= (not noise_shift(6)) xor noise_shift(8);
		noise_shift <= shift_in & noise_shift(15 downto 1);
		rnoise <= noise_shift(0); 
	end if;
end process;


NoiseGate: process(V8, rnoise)
begin
	if rising_edge(V8) then
		gated_noise <= rnoise;
	end if;
end process;

-- Generate the Launch sound
Launch_Gen: process(PRAM, Load_n(3))		
begin
	if rising_edge(Load_n(3)) then
		launch_raw <= PRAM(3 downto 0);
	end if;
end process;
launch <= launch_raw when rnoise = '1' else "0000";


-- Generate the bang sound which is used for the crash and explosion sounds
Crash_gen: process(Clk_6, PRAM, Load_n(3), gated_noise)
begin
	if rising_edge(Load_n(3)) then
		crash_raw <= PRAM(7 downto 4);
	end if;
end process;
bang <= crash_raw when gated_noise = '1' else "0000";
explosion_prefilter <= bang; -- Explosion sound comes from the same source as crash sound

-- Very simple low pass filter, borrowed from MikeJ's Asteroids code
Explosion_filter: process(clk_6)
begin
	if rising_edge(clk_6) then
		if (Ena_3k = '1') then
			explosion_filter_t1 <= explosion_prefilter;
			explosion_filter_t2 <= explosion_filter_t1;
			explosion_filter_t3 <= explosion_filter_t2;
		end if;
		explosion_filtered <=  ("00" & explosion_filter_t1) +
								     ('0'  & explosion_filter_t2 & '0') +
								     ("00" & explosion_filter_t3);
		
	end if;
end process;


explosion <= explosion_filtered when explode = '1' else "000000";

crash_snd <= bang when crash = '1' else "0000";


-- ToDo: Tweak volume of individual sounds

-- Audio mixer
P1_Audio <= ("00000") + Snr1_ping + ('0' & explosion & '0') + ('0' & crash_snd & '0') + ("00" & launch); 
			
				
P2_Audio <= ("00000") + Snr2_ping + ('0' & explosion & '0') + ('0' & crash_snd & '0') + ("00" & launch); 
				

	
end rtl;