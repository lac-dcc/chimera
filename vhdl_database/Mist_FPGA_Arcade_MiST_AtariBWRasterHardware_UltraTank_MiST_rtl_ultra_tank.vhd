-- Top level file for Kee Games Ultra Tank
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

-- Targeted to EP2C5T144C8 mini board but porting to nearly any FPGA should be fairly simple
-- See Ultra Tank manual for video output details. Resistor values listed here have been scaled 
-- for 3.3V logic. 


library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity ultra_tank is 
port(		
			clk_12		: in	std_logic;	-- 50MHz input clock
			Reset_n		: in	std_logic;	-- Reset button (Active low)
			Vid			: out std_logic_vector(7 downto 0);
			Sync_O		: out std_logic;  -- Composite sync output (1.2k)
			Blank_O		: out std_logic;  -- Composite blank output
			HS				: out std_logic;
			VS				: out std_logic;
			HB				: out std_logic;
			VB				: out std_logic;
			CC3_n_O		: out std_logic;  -- Not sure what these are, color monitor? (not connected in real game)
			CC2_O			: out std_logic;
			CC1_O			: out std_logic;
			CC0_O			: out std_logic;
			Audio1_O		: out std_logic_vector(6 downto 0);  -- Ideally these should have a simple low pass filter
			Audio2_O		: out std_logic_vector(6 downto 0);
			Coin1_I		: in  std_logic;  -- Coin switches (Active low)
			Coin2_I		: in  std_logic;
			Start1_I		: in  std_logic;  -- Start buttons
			Start2_I		: in  std_logic;
			Invisible_I	: in	std_logic;	-- Invisible tanks switch
			Rebound_I	: in	std_logic;	-- Rebounding shells switch
			Barrier_I	: in  std_logic;	-- Barriers switch
			JoyW_Fw_I	: in	std_logic;	-- Joysticks, these are all active low
			JoyW_Bk_I	: in	std_logic;
			JoyY_Fw_I	: in  std_logic;
			JoyY_Bk_I	: in	std_logic;
			JoyX_Fw_I	: in	std_logic;
			JoyX_Bk_I	: in	std_logic;
			JoyZ_Fw_I	: in	std_logic;
			JoyZ_Bk_I	: in	std_logic;
			FireA_I		: in  std_logic; 	-- Fire buttons
			FireB_I		: in  std_logic;
			Test_I		: in  std_logic;  -- Self-test switch
			Slam_I		: in  std_logic;  -- Slam switch
			LED1_O		: out std_logic;	-- Player 1 and 2 start button LEDs
			LED2_O		: out std_logic;
			Lockout_O	: out std_logic   -- Coin mech lockout coil
			);
end ultra_tank;

architecture rtl of ultra_tank is

signal Clk_6				: std_logic;
signal Phi1 				: std_logic;
signal Phi2					: std_logic;
signal Video		   	: std_logic_vector(1 downto 0);
signal Hcount		   	: std_logic_vector(8 downto 0);
signal Vcount  			: std_logic_vector(7 downto 0) := (others => '0');
signal H256_s				: std_logic;
signal Hsync				: std_logic;
signal Vsync				: std_logic;
signal Vblank				: std_logic;
signal Vblank_n_s			: std_logic;
signal HBlank				: std_logic;
signal White				: std_logic; 
signal DMA					: std_logic_vector(7 downto 0);
signal DMA_n				: std_logic_vector(7 downto 0);
signal PRAM					: std_logic_vector(7 downto 0);
signal Load_n				: std_logic_vector(8 downto 1);
signal Object				: std_logic_vector(4 downto 1);
signal Object_n			: std_logic_vector(4 downto 1);
signal Playfield_n		: std_logic;
signal BlackPF_n			: std_logic;
signal WhitePF_n			: std_logic;
signal CPU_Din				: std_logic_vector(7 downto 0);
signal CPU_Dout			: std_logic_vector(7 downto 0);
signal DBus_n				: std_logic_vector(7 downto 0);
signal BA					: std_logic_vector(15 downto 0);
signal CC3_n				: std_logic;
signal Barrier_Read_n	: std_logic;
signal Throttle_Read_n	: std_logic;
signal Coin_Read_n		: std_logic;
signal Collision_Read_n	: std_logic;
signal Collision_n		: std_logic;
signal CollisionReset_n	: std_logic_vector(4 downto 1);
signal Options_Read_n	: std_logic;
signal Wr_DA_Latch_n 	: std_logic;
signal Wr_Explosion_n	: std_logic;
signal Fire1				: std_logic;
signal Fire2				: std_logic;
signal Attract				: std_logic;
signal Attract_n			: std_logic;	

signal SW1					: std_logic_vector(7 downto 0);


begin
-- Configuration DIP switches, these can be brought out to external switches if desired
-- See Ultra Tank manual page 6 for complete information. Active low (0 = On, 1 = Off)
--    1 	2							Extended Play		(11 - 75pts, 01 - 50pts, 10 - 25pts, 00 - None)
--   			3	4					Game Length			(11 - 60sec, 10 - 90sec, 01 - 120sec, 00 - 150sec) 
--						5	6			Game Cost   		(10 - 1 Coin, 1 Play, 01 - 2 Plays, 1 Coin, 11 - 2 Coins, 1 Play)
--								7	8	Unused?
SW1 <= "10010100"; -- Config dip switches

		
		
Vid_sync: entity work.synchronizer
port map(
		Clk_12 => Clk_12,
		Clk_6 => Clk_6,
		HCount => HCount,
		VCount => VCount,
		HSync => HSync,
		HBlank => HBlank,
		VBlank_n_s => VBlank_n_s,
		VBlank => VBlank,
		VSync => VSync
		);


Background: entity work.playfield
port map( 
		Clk6 => Clk_6,
		DMA => DMA,
		PRAM => PRAM,
		Load_n => Load_n,
		Object => Object,
		HCount => HCount,
		VCount => VCount,
		HBlank => HBlank,
		VBlank => VBlank,
		VBlank_n_s => VBlank_n_s,
		HSync => Hsync,
		VSync => VSync,
		H256_s => H256_s,
		Playfield_n => Playfield_n,
		CC3_n => CC3_n,
		CC2 => CC2_O,
		CC1 => CC1_O,
		CC0 => CC0_O,
		White => White,
		PF_Vid1 => BlackPF_n,
		PF_Vid2 => WhitePF_n
		);
			
		
Tank_Shells: entity work.motion
port map(
		CLK6 => Clk_6,
		PHI2 => Phi2,
		DMA_n => DMA_n,
      PRAM => PRAM,
		H256_s => H256_s,
		VCount => VCount,
		HCount => HCount,
		Load_n => Load_n,
		Object => Object,
		Object_n => Object_n
		);
		
		
Tank_Shell_Comparator: entity work.collision_detect
port map(	
		Clk6 => Clk_6,
		Adr => BA(2 downto 0),
		Object_n	=> Object_n,
		Playfield_n => Playfield_n,
		CollisionReset_n => CollisionReset_n,
		Slam_n => Slam_I,
		Collision_n	=> Collision_n
		);
	
	
CPU: entity work.cpu_mem
port map(
		Clk12 => clk_12,
		Clk6 => clk_6,
		Reset_n => reset_n,
		VCount => VCount,
		HCount => HCount,
		Vblank_n_s => Vblank_n_s,
		Test_n => Test_I,
		Collision_n => Collision_n,
		DB_in => CPU_Din,
		DBus => CPU_Dout,
		DBus_n => DBus_n,
		PRAM => PRAM,
		ABus => BA,
		Attract => Attract,
		Attract_n => Attract_n,
		CollReset_n => CollisionReset_n,
		Barrier_Read_n => Barrier_Read_n,
		Throttle_Read_n => Throttle_Read_n,
		Coin_Read_n => Coin_Read_n,
		Options_Read_n => Options_Read_n,
		Wr_DA_Latch_n => Wr_DA_Latch_n,
		Wr_Explosion_n => Wr_Explosion_n,
		Fire1 => Fire1,
		Fire2 => Fire2,
		LED1 => LED1_O,
		LED2 => LED2_O,
		Lockout_n => Lockout_O,
		Phi1_o => Phi1,
		Phi2_o => Phi2,
		DMA => DMA,
		DMA_n => DMA_n
		);
		
		
Input: entity work.Control_Inputs
port map(
		Clk6 => Clk_6,
		DipSw => SW1, -- DIP switches
		Coin1_n => Coin1_I,
		Coin2_n => Coin2_I,
		Start1_n => Start1_I,
		Start2_n => Start2_I,
		Invisible_n => Invisible_I,
		Rebound_n => Rebound_I,
		Barrier_n => Barrier_I,
		JoyW_Fw => JoyW_Fw_I,
		JoyW_Bk => JoyW_Bk_I,
		JoyY_Fw => JoyY_Fw_I,
		JoyY_Bk => JoyY_Bk_I,
		JoyX_Fw => JoyX_Fw_I,
		JoyX_Bk => JoyX_Bk_I,
		JoyZ_Fw => JoyZ_Fw_I,
		JoyZ_Bk => JoyZ_Bk_I,
		FireA_n => FireA_I,
		FireB_n => FireB_I,
	   Throttle_Read_n => Throttle_Read_n,
		Coin_Read_n => Coin_Read_n,
		Options_Read_n => Options_Read_n,
		Barrier_Read_n => Barrier_Read_n,
		Wr_DA_Latch_n => Wr_DA_Latch_n,
		Adr => BA(2 downto 0),
		DBus => CPU_Dout(3 downto 0),
		Dout => CPU_Din
	);	

	
Sound: entity work.audio
port map( 
		Clk_6 => Clk_6,
		Reset_n => Reset_n,
		Load_n => Load_n,
		Fire1 => Fire1,
		Fire2 => Fire2,
		Write_Explosion_n => Wr_Explosion_n,
		Attract => Attract,
		Attract_n => Attract_n,
		PRAM => PRAM,
		DBus_n => not CPU_Dout,
		HCount => HCount,
		VCount => VCount,
		Audio1 => Audio1_O,
		Audio2 => Audio2_O
		);

Sync_O <= HSync nor VSync;
Blank_O <= HBlank nor VBlank;
CC3_n_O <= CC3_n;
Video(0) <= (not BlackPF_n) nor CC3_n;	
Video(1) <= (not WhitePF_n);	  

HS <= HSync;
VS <= VSync;
HB <= HBlank;
VB <= VBlank;

COL: process(clk_12, Video)
begin
	case Video is
		when "01" => Vid <= ("10000000");
		when "10" => Vid <= ("01010000");
		when "11" => Vid <= ("11111111");
		when others => Vid <= ("00000000");
	end case;
end process;

end rtl;