-- Audio for Sprint 1
-- First attempt at modeling the analog sound circuits used in Sprint 1, may be room for improvement as
-- I do not have a real board to compare.
-- (c) 2017 James Sweet
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
			Clk_6				: in  std_logic;
			Reset_n			: in	std_logic;
			Motor1_n			: in	std_logic;
			Skid1				: in  std_logic;
			Crash_n			: in  std_logic;
			NoiseReset_n	: in  std_logic;
			Attract			: in  std_logic;
			Display			: in	std_logic_vector(7 downto 0);
			HCount			: in  std_logic_vector(8 downto 0);
			VCount			: in  std_logic_vector(7 downto 0);
			Audio1			: out std_logic_vector(6 downto 0)
			);
end audio;

architecture rtl of audio is

signal reset			: std_logic;

signal H4				: std_logic;
signal V2				: std_logic;

signal Noise			: std_logic;
signal Noise_Shift	: std_logic_vector(15 downto 0);
signal Shift_in  		: std_logic;

signal Screech_count	: integer range 1000 to 11000;
signal Screech_state	: std_logic;
signal Screech_snd1	: std_logic;
signal Screech1		: std_logic_vector(3 downto 0);

signal Crash			: std_logic_vector(3 downto 0);
signal Bang				: std_logic_vector(3 downto 0);

signal Mtr1_Freq		: std_logic_vector(3 downto 0);
signal Motor1_speed	: std_logic_vector(3 downto 0);
signal Motor1_snd		: std_logic_vector(5 downto 0);

signal ena_count		: std_logic_vector(10 downto 0);
signal ena_3k			: std_logic;

signal bang_prefilter     : std_logic_vector(3 downto 0);
signal bang_filter_t1     : std_logic_vector(3 downto 0);
signal bang_filter_t2     : std_logic_vector(3 downto 0);
signal bang_filter_t3     : std_logic_vector(3 downto 0);
signal bang_filtered      : std_logic_vector(5 downto 0);


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
V2 <= VCount(1);

-- Generate the 3kHz clock enable used by the filter
Enable: process(clk_6)
begin
	if rising_edge(CLK_6) then
		ena_count <= ena_count + "1";
		ena_3k <= '0';
		if (ena_count(10 downto 0) = "00000000000") then
			ena_3k <= '1';
		end if;
	end if;
end process;


-- LFSR that generates pseudo-random noise
Noise_gen: process(NoiseReset_n, V2)
begin
	if (noisereset_n = '0') then
		noise_shift <= (others => '0');
		noise <= '0';
	elsif rising_edge(V2) then
		shift_in <= not(noise_shift(6) xor noise_shift(8));
		noise_shift <= shift_in & noise_shift(15 downto 1);
		noise <= noise_shift(0); 
	end if;
end process;


-- Tire screech sound
Screech_gen1: entity work.tire_screech
generic map( -- These values can be tweaked to tune the screech sound
		Inc1 => 24, -- Ramp increase rate when noise = 0
		Inc2 => 33, -- Ramp increase rate when noise = 1
		Dec1 => 29, -- Ramp decrease rate when noise = 0
		Dec2 => 16  -- Ramp decrease rate when noise = 1
		)
port map(
		Clk => H4,
		Noise => noise,
		Screech_out => screech_snd1
		);
		
	
-- Convert screech from 1 bit to 4 bits wide and enable via skid1  signal
Screech_ctrl: process(screech_snd1, skid1)
begin
	if (skid1 and screech_snd1) = '1' then
		screech1 <= "1111";
	else
		screech1 <= "0000";
	end if;
end process;
		
	
Crash_sound: process(crash_n, display, noise, crash)		
begin
	if crash_n = '0' then
		crash <= display(3 downto 0);
	end if;
	if noise = '1' then
		bang_prefilter <= crash;
	else
		bang_prefilter <= "0000";
	end if;
end process;


---- Very simple low pass filter, borrowed from MikeJ's Asteroids code
Crash_filter: process(clk_6)
begin
	if rising_edge(clk_6) then
		if (ena_3k = '1') then
			bang_filter_t1 <= bang_prefilter;
			bang_filter_t2 <= bang_filter_t1;
			bang_filter_t3 <= bang_filter_t2;
		end if;
		bang_filtered <=  ("00" & bang_filter_t1) +
								('0'  & bang_filter_t2 & '0') +
								("00" & bang_filter_t3);
	end if;
end process;	


Motor1_latch: process(Motor1_n, Display)
begin
	if Motor1_n = '0' then
		Motor1_speed <= Display(3 downto 0);
	end if;
end process;

Motor1: entity work.EngineSound 
generic map( 
		Freq_tune => 50 -- Tuning pot for engine sound frequency
		)
port map(		
		Clk_6 => clk_6, 
		Ena_3k => ena_3k,
		EngineData => motor1_speed,
		Motor => motor1_snd
		);
	
	
-- Audio mixer, also mutes sound in attract mode
audio1 <= ('0' & motor1_snd) + ("00" & screech1) + ('0' & bang_filtered) when attract = '0'
				else "0000000";

	
end rtl;