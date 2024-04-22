-- Top level file for Atari Canyon Bomber
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

-- Targeted to EP2C5T144C8 mini board but porting to nearly any FPGA should be fairly simple
-- See Canyon Bomber manual for video output details. Resistor values listed here have been scaled 
-- for 3.3V logic. 
-- R44 1.2k Ohm
-- R43 1.2k Ohm
-- R51 1.2k Ohm
-- R42 330R

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity canyon_bomber is 
port(		
			clk_12	: in	std_logic;	-- 12MHz input clock
			Reset_I		: in	std_logic;	-- Reset button (Active low)
			VID	: out 	std_logic_vector(7 downto 0);
			Vblank_O		: out 	std_logic;
			HBlank_O		: out 	std_logic;
			HSync_O			: out 	std_logic;
			VSync_O			: out 	std_logic;
			Sync_O		: out 	std_logic;  	-- Composite sync output (1.2k)
			Audio1_O	: out 	std_logic_vector(6 downto 0);  	-- Player 1 audio
			Audio2_O	: out 	std_logic_vector(6 downto 0);  	-- Player 2 audio
			Coin1_I		: in  	std_logic;  	-- Coin switches (All inputs are active-low)
			Coin2_I		: in  	std_logic;
			Start1_I	: in  	std_logic;  	-- Player 1 and 2 Start buttons
			Start2_I	: in  	std_logic;
			Fire1_I		: in	std_logic;  	-- Fire buttons
			Fire2_I		: in	std_logic;
			Slam_I		: in	std_logic;  	-- Slam switch
			Test_I		: in  	std_logic;  	-- Self-test switch
			Lamp1_O		: out 	std_logic;	-- Player 1 and 2 start button LEDs
			Lamp2_O		: out 	std_logic
			);
end canyon_bomber;

architecture rtl of canyon_bomber is

signal clk_6		: std_logic;
signal clk_6en	: std_logic;
signal Ena_3k		: std_logic;
signal phi1 		: std_logic;
signal phi2		: std_logic;
signal reset_n		: std_logic;

signal Hcount		: std_logic_vector(8 downto 0) := (others => '0');
signal H256_s		: std_logic;
signal Vcount  		: std_logic_vector(7 downto 0) := (others => '0');
signal Vreset		: std_logic;
signal HBlank		: std_logic;
signal VBlank		: std_logic;
signal HSync		: std_logic;
signal VSync		: std_logic;
signal Vblank_s	: std_logic;
signal Vblank_n_s	: std_logic;
signal Video		: std_logic_vector(1 downto 0);
signal CompBlank_n_s	: std_logic;

signal CompSync_n_s	: std_logic;

signal WhitePF_n	: std_logic;
signal BlackPF_n	: std_logic;

signal Adr		: std_logic_vector(9 downto 0);
signal DBus		: std_logic_vector(7 downto 0);
signal Display		: std_logic_vector(7 downto 0);

signal RnW		: std_logic;
signal Write_n		: std_logic;
signal NMI_n		: std_logic;

signal RAM_n		: std_logic;
signal Sync_n		: std_logic;
signal Switch_n		: std_logic;
signal Display_n	: std_logic;
signal TimerReset_n	: std_logic;

signal Attract1		: std_logic;
signal Attract2		: std_logic;	
signal Skid1		: std_logic;
signal Skid2		: std_logic;
signal Lamp1		: std_logic;
signal Lamp2		: std_logic;

signal Motor1_n 	: std_logic;
signal Motor2_n		: std_logic;
signal Whistle1		: std_logic;
signal Whistle2		: std_logic;
signal Explode_n	: std_logic;
signal Ship1_n		: std_logic;
signal Ship2_n		: std_logic;
signal Shell1_n		: std_logic;
signal Shell2_n		: std_logic;

signal DIP_Sw		: std_logic_vector(8 downto 1);


begin
-- Configuration DIP switches, these can be brought out to external switches if desired
-- See Canyon Bomber manual for complete information. Active low (0 = On, 1 = Off)
--    8 	7							Game Cost			(10-1 Coin per player, 11-Two coins per player, 01-Two players per coin, 00-Free Play)
--				6	5					Misses Per Play   (00-Three, 01-Four, 10-Five, 11-Six)
--   					4	3			Not Used
--								2	1	Language				(00-English, 10-French, 01-Spanish, 11-German)
--										
DIP_Sw <= "10100000"; -- Config dip switches
		
		
Vid_sync: entity work.synchronizer
port map(
		clk_12 => clk_12,
		clk_6	=> clk_6,
		clk_6en	=> clk_6en,
		hcount => hcount,
		vcount => vcount,
		hsync => HSync,
		hblank => HBlank,
		vblank_s => vblank_s,
		vblank_n_s => vblank_n_s,
		vblank => VBlank,
		vsync => VSync,
		vreset => vreset
		);

Background: entity work.playfield
port map( 
		clk12	=> clk_12,
		clk6en	=> clk_6en,
		display => display,
		HCount => HCount,
		VCount => VCount,
		HBlank => HBlank,		
		H256_s => H256_s,
		VBlank => VBlank,
		VBlank_n_s => Vblank_n_s,
		HSync => Hsync,
		VSync => VSync,
		CompSync_n_s => CompSync_n_s,
		CompBlank_n_s => CompBlank_n_s,
		WhitePF_n => WhitePF_n,
		BlackPF_n => BlackPF_n 
		);
		
Motion_Objects: entity work.motion
port map(
		CLK12 => clk_12,
		clk6en => clk_6en,
		PHI2 => phi2,
		DISPLAY => Display,
		H256_s => H256_s,
		HSync => HSync,
		VCount => VCount,
		HCount => HCount,
		Shell1_n => Shell1_n,
		Shell2_n => Shell2_n,
		Ship1_n => Ship1_n,
		Ship2_n => Ship2_n
		);
		
CPU: entity work.cpu_mem
port map(
		Clk12 => clk_12,
		Ena_3k => Ena_3k,
		Reset_I => Reset_I,
		Reset_n => reset_n,
		VBlank => VBlank,
		VCount => VCount,
		HCount => HCount,
		Test_n => Test_I,
		Coin1_n => Coin1_I,
		Coin2_n	=> Coin2_I,
		Start1_n => Start1_I,
		Start2_n => Start2_I,
		Fire1_n => Fire1_I,
		Fire2_n => Fire2_I,
		Slam_n => Slam_I,
		DIP_Sw => DIP_Sw,
		Motor1_n => Motor1_n,
		Motor2_n => Motor2_n,
		Explode_n => Explode_n,
		Whistle1 => Whistle1,
		Whistle2 => Whistle2,
		Player1Lamp => Lamp1_O,
		Player2Lamp => Lamp2_O,
		Attract1 => Attract1,
		Attract2 => Attract2,
		Phi1_o => Phi1,
		Phi2_o => Phi2,
		DBus => DBus,
		Display => Display
		);
	
Sound: entity work.audio
port map( 
		Clk_12	=> Clk_12,
		Ena_3k => Ena_3k,
		Reset_n => Reset_n,
		Motor1_n => Motor1_n,
		Motor2_n => Motor2_n,
		Whistle1 => Whistle1,
		Whistle2 => Whistle2,
		Explode_n => Explode_n,
		Attract1 => Attract1,
		Attract2 => Attract2,
		DBus => DBus,
		VCount => VCount,
		P1_audio => Audio1_O,
		P2_audio => Audio2_O
		);

-- Video mixing	
Video(0) <= ( BlackPF_n and Ship1_n and Shell1_n and CompBlank_n_s);	
Video(1) <= not(WhitePF_n and Ship2_n and Shell2_n);  
Sync_O <= CompSync_n_s;
HBlank_O <= HBlank;
VBlank_O <= VBlank;
HSync_O <= HSync;
Vid_Mix: process(clk_12, Video)
begin
	case Video is
		when "01" => VID <= ("10000000");
		when "10" => VID <= ("01010000");
		when "11" => VID <= ("11111111");
		when others => VID <= ("00000000");
	end case;
end process;

end rtl;
