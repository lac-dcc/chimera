-- Audio for Atari Canyon Bomber
-- There may be some room for improvement as I do not have a real board to compare.
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

entity audio is 
port(		
			Clk_12			: in  std_logic;
			Ena_3k			: in  std_logic;
			Reset_n			: in	std_logic;
			Motor1_n			: in	std_logic;
			Motor2_n			: in  std_logic;
			Whistle1			: in  std_logic;
			Whistle2			: in	std_logic;
			Explode_n		: in  std_logic;
			Attract1			: in  std_logic;
			Attract2			: in  std_logic;
			DBus				: in	std_logic_vector(7 downto 0);
			VCount			: in  std_logic_vector(7 downto 0);
			P1_audio			: out std_logic_vector(6 downto 0);
			P2_audio			: out std_logic_vector(6 downto 0)
			);
end audio;

architecture rtl of audio is

signal Reset			: std_logic;

signal V2				: std_logic;
signal V2_D			: std_logic;

signal Noise			: std_logic;
signal Noise_Shift	: std_logic_vector(15 downto 0);
signal Shift_in  		: std_logic;

signal Mtr1_Freq		: std_logic_vector(3 downto 0) := "0000";
signal Motor1_speed	: std_logic_vector(3 downto 0) := "0000";
signal Motor1_snd		: std_logic_vector(5 downto 0);
signal Mtr2_Freq		: std_logic_vector(3 downto 0) := "0000";
signal Motor2_speed	: std_logic_vector(3 downto 0) := "0000";
signal Motor2_snd		: std_logic_vector(5 downto 0);

signal Explosion					: std_logic_vector(3 downto 0);
signal Explosion_prefilter    : std_logic_vector(3 downto 0);
signal Explosion_filter_t1    : std_logic_vector(3 downto 0);
signal Explosion_filter_t2 	: std_logic_vector(3 downto 0);
signal Explosion_filter_t3    : std_logic_vector(3 downto 0);
signal Explosion_filtered     : std_logic_vector(5 downto 0);

signal Whistle_snd1				: std_logic_vector(3 downto 0);
signal Whistle_snd2				: std_logic_vector(3 downto 0);




begin

reset <= (not reset_n);

V2 <= VCount(1);

-- Explosion --
-- LFSR that generates pseudo-random noise used by the explosion sound
Noise_gen: process(Attract1, Attract2, clk_12)
begin
	if ((Attract1 nand Attract2) = '0') then
		noise_shift <= (others => '0');
		noise <= '0';
	elsif rising_edge(clk_12) then
		V2_D <= V2;
		if V2_D = '0' and V2 = '1' then
			shift_in <= not(noise_shift(6) xor noise_shift(8));
			noise_shift <= shift_in & noise_shift(15 downto 1);
			noise <= noise_shift(0); 
		end if;
	end if;
end process;

-- Explosion envelope is latched on rising edge of Explode_n (not sure why this is shown active low)		
Explosion_sound: process(Explode_n, DBus, noise)		
begin
	if rising_edge(Explode_n) then
		explosion <= DBus(7 downto 4);
	end if;
end process;
explosion_prefilter <= explosion when noise = '1' else "0000";

-- Very simple low pass filter, borrowed from MikeJ's Asteroids code, should probably be lower cutoff
explode_filter: process(clk_12)
begin
	if rising_edge(clk_12) then
		if (ena_3k = '1') then
			explosion_filter_t1 <= explosion_prefilter;
			explosion_filter_t2 <= explosion_filter_t1;
			explosion_filter_t3 <= explosion_filter_t2;
		end if;
		explosion_filtered <=  ("00" & explosion_filter_t1) +
								('0'  & explosion_filter_t2 & '0') +
								("00" & explosion_filter_t3);
	end if;
end process;	
-----------------------	


-- Engine Sounds --
Motor1_Freq: process(Motor1_n, DBus)
begin
	if rising_edge(Motor1_n) then
		Motor1_speed <= DBus(3 downto 0);
	end if;
end process;

Player1_Motor: entity work.EngineSound 
generic map( 
		Freq_tune => 45 -- Tuning pot for engine sound frequency (Range 1-100)
		)
port map(		
		Clk_12 => clk_12,
		Ena_3k => ena_3k,
		EngineData => motor1_speed,
		Motor => motor1_snd
		);
	
Motor2_Freq: process(Motor2_n, DBus)
begin
	if rising_edge(Motor2_n) then
		Motor2_speed <= DBus(3 downto 0);
	end if;
end process;
	
Player2_Motor: entity work.EngineSound 
generic map( 
		Freq_tune => 47 -- Tuning pot for engine sound frequency (Range 1-100)
		)
port map(		
		Clk_12 => clk_12,
		Ena_3k => ena_3k,
		EngineData => motor2_speed,
		Motor => motor2_snd
		);		
-----------------------		
	
	
-- Bomb Drop Whistles -- 
-- Player 1 whistle
Player1_Whistle: entity work.Whistle 
generic map( 
		Freq_tune => 40 -- Tuning pot for whistle sound frequency (Range 1-100)
		)
port map(		
		Clk_12 => clk_12,
		Ena_3k => ena_3k,
		Whistle_trig => whistle1,
		Whistle_out => whistle_snd1
		);

Player2_Whistle: entity work.Whistle 
generic map( 
		Freq_tune => 44 -- Tuning pot for whistle sound frequency (Range 1-100)
		)
port map(			
		Clk_12 => clk_12,
		Ena_3k => ena_3k,
		Whistle_trig => whistle2,
		Whistle_out => whistle_snd2
		);		
-----------------------		


-- Audio mixer, also mutes sound in attract mode
P1_Audio <= ("000" & whistle_snd1) + ('0' & motor1_snd) + ('0' & whistle_snd1) + ('0' & explosion_filtered) when attract1 = '0'
				else "0000000";
				
P2_Audio <= ("000" & whistle_snd2) + ('0' & motor2_snd) + ('0' & whistle_snd2) + ('0' & explosion_filtered) when attract2 = '0'
				else "0000000";	
-----------------------	
		

end rtl;