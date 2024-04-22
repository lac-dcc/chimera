-- Audio for Atari Dominos
-- Based upon work done for Sprint 2 which uses very similar 
-- hardware. There may be room for improvement as
-- I do not have a real board to compare.
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
			Clk_6			: in  std_logic;
			Reset_n			: in  std_logic;
			Attract			: in  std_logic;
			Tumble			: in  std_logic;
			Display			: in  std_logic_vector(7 downto 0);
			HCount			: in  std_logic_vector(8 downto 0);
			VCount			: in  std_logic_vector(7 downto 0);
			Audio				: out std_logic_vector(6 downto 0)
			);
end audio;

architecture rtl of audio is


signal H4				: std_logic;
signal H8 				: std_logic;	
signal H16 				: std_logic;	
signal H32 				: std_logic;	
signal H64 				: std_logic;	
signal H256 				: std_logic;	
signal V4			       : std_logic;

signal Amp_n				: std_logic;
signal Freq_n				: std_logic;
signal Tone_freq			: std_logic_vector(3 downto 0);
signal Tone			        : std_logic_vector(3 downto 0);
signal Pulse				: std_logic;
signal Topple				: std_logic;

signal ena_count			: std_logic_vector(10 downto 0);
signal ena_3k				: std_logic;

signal tone_prefilter                   : std_logic_vector(3 downto 0);
signal tone_filter_t1                   : std_logic_vector(3 downto 0);
signal tone_filter_t2                   : std_logic_vector(3 downto 0);
signal tone_filter_t3                   : std_logic_vector(3 downto 0);
signal tone_filtered                    : std_logic_vector(5 downto 0);



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


H4 <= HCount(2);
H8 <= HCount(3);
H16 <= HCount(4);
H32 <= HCount(5);
H64 <= HCount(6);
H256 <= HCount(8);
V4 <= VCount(2);

-- These signals latch the frequency and amplitude data from the Display bus 
-- Decoding corresponds to locations in RAM when addressed by video hardware
Freq_n <= '0' when (H32 and (not H16) and H8 and (not H4) and (not H64) and (not H256)) = '1' else '1';
Amp_n <= '0' when (H32 and H16 and H8 and (not H4) and (not H64) and (not H256)) = '1' else '1';


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

	
Tone_sound: process(amp_n, display, pulse, tone)		
begin
	if amp_n = '0' then
		tone <= display(3 downto 0);
	end if;
	if pulse = '1' then
		tone_prefilter <= tone;
	else
		tone_prefilter <= "0000";
	end if;
end process;

---- Very simple low pass filter, borrowed from MikeJ's Asteroids code
Filter: process(clk_6)
begin
	if rising_edge(clk_6) then
		if (ena_3k = '1') then
			tone_filter_t1 <= tone_prefilter;
			tone_filter_t2 <= tone_filter_t1;
			tone_filter_t3 <= tone_filter_t2;
		end if;
		tone_filtered <=  ("00" & tone_filter_t1) +
			('0'  & tone_filter_t2 & '0') +
		        ("00" & tone_filter_t3);
	end if;
end process;	


Freq_latch: process(Freq_n, Display)
begin
	if Freq_n = '0' then
		tone_freq <= Display(3 downto 0);
	end if;
end process;

Tone_pulse: entity work.Oscillator
generic map( 
		Freq_tune => 50 -- Tuning pot for frequency
		)
port map(		
		Clk_6 => clk_6, 
		Ena_3k => ena_3k,
		Freqdata => tone_freq,
		Output => pulse
		);

Topple <= Tumble and (not V4);		

		
	
--Audio mixer, also mutes sound in attract mode
Audio <= "0000" & ("00" & topple) + ('0' & tone_filtered) when attract = '0'
				else "0000000";
				


	
end rtl;
