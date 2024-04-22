-- Top level file for Atari Sprint 4
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


entity sprint4 is 
port(		
			clk_12		: in	std_logic;	-- 12MHz input clock
			Reset_I		: in	std_logic;	-- Reset button (Active low)
			Video1_O		: out std_logic;  -- White video output (680 Ohm)
			Video2_O		: out std_logic;	-- Black video output (1.2k)
			Sync_O		: out std_logic;  -- Composite sync output (1.2k)
			Blank_O		: out std_logic;  -- Composite blank output
			VideoR_O		: out std_logic;  -- Color monitor signals, the Electrohome G02 had digital color inputs
			VideoG_O		: out std_logic;
			VideoB_O		: out std_logic;
			Hsync			: buffer std_logic;
			Vsync			: buffer std_logic;
			Hblank		: buffer std_logic;
			Vblank		: buffer std_logic;
			Audio1_O		: out std_logic_vector(6 downto 0);
			Audio2_O		: out std_logic_vector(6 downto 0);
			Coin1_I		: in  std_logic;  -- Coin switches (Active low)
			Coin2_I		: in  std_logic;
			Coin3_I		: in  std_logic;
			Coin4_I		: in  std_logic;
			Start1_I		: in  std_logic;  -- Start buttons
			Start2_I		: in  std_logic;
			Start3_I		: in  std_logic;
			Start4_I		: in  std_logic;
			Gas1_I		: in  std_logic;
			Gas2_I		: in  std_logic;
			Gas3_I		: in  std_logic;
			Gas4_I		: in  std_logic;

			c_gearup1	: in  std_logic;
			c_geardown1	: in  std_logic;
			c_left1	: in  std_logic;
			c_right1	: in  std_logic;
	
			c_gearup2	: in  std_logic;
			c_geardown2	: in  std_logic;
			c_left2	: in  std_logic;
			c_right2	: in  std_logic;
	
			c_gearup3	: in  std_logic;
			c_geardown3	: in  std_logic;
			c_left3	: in  std_logic;
			c_right3	: in  std_logic;
	
			c_gearup4	: in  std_logic;
			c_geardown4	: in  std_logic;
			c_left4	: in  std_logic;
			c_right4	: in  std_logic;
			
			TrackSel_I	: in  std_logic;
			Test_I		: in  std_logic;  -- Self-test switch
			StartLamp_O	: out std_logic_vector(4 downto 1);	-- Player start button LEDs
			DIP			: in std_logic_vector(7 downto 0)
			);
end sprint4;

architecture rtl of sprint4 is

signal Clk_6				: std_logic;
signal Phi1 				: std_logic;
signal Phi2					: std_logic;
signal Reset_n				: std_logic;

signal Hcount		   	: std_logic_vector(8 downto 0);
signal Vcount  			: std_logic_vector(7 downto 0) := (others => '0');
signal H256_s				: std_logic;
signal Vblank_n_s			: std_logic;
signal CompBlank			: std_logic;
signal CompBlank_s		: std_logic;
signal CompSync_n_s		: std_logic;
signal WhiteVid 			: std_logic;
signal PeachVid 			: std_logic;
signal VioletVid 			: std_logic;
signal GreenVid 			: std_logic;
signal BlueVid 			: std_logic;

signal DMA					: std_logic_vector(7 downto 0);
signal DMA_n				: std_logic_vector(7 downto 0);
signal PRAM					: std_logic_vector(7 downto 0);
signal Load_n				: std_logic_vector(8 downto 1);
signal Car					: std_logic_vector(4 downto 1);
signal Car_n				: std_logic_vector(4 downto 1);
signal Playfield_n		: std_logic;

signal CPU_Din				: std_logic_vector(7 downto 0);
signal CPU_Dout			: std_logic_vector(7 downto 0);
signal DBus_n				: std_logic_vector(7 downto 0);
signal BA					: std_logic_vector(15 downto 0);

signal Trac_Sel_Read_n	: std_logic;
signal Gas_Read_n			: std_logic;
signal Coin_Read_n		: std_logic;
signal Collision_Read_n	: std_logic;
signal Collision_n		: std_logic_vector(4 downto 1);
signal CollisionReset_n	: std_logic_vector(4 downto 1);
signal Options_Read_n	: std_logic;
signal AD_Read_n			: std_logic;
signal Wr_DA_Latch_n 	: std_logic;
signal Wr_CrashWord_n	: std_logic;
signal Skid					: std_logic_vector(4 downto 1);
signal Attract				: std_logic;
signal Attract_n			: std_logic;	

--signal Gearnum1	  	: std_logic_vector(2 downto 0);
signal Gear11			: std_logic; 
signal Gear12			: std_logic; 
signal Gear13			: std_logic;
signal Steer1A			: std_logic;
signal Steer1B			: std_logic;

--signal Gearnum2	  	: std_logic_vector(2 downto 0);
signal Gear21			: std_logic; 
signal Gear22			: std_logic; 
signal Gear23			: std_logic;
signal Steer2A			: std_logic;
signal Steer2B			: std_logic;
 
--signal Gearnum3	  	: std_logic_vector(2 downto 0);
signal Gear31			: std_logic; 
signal Gear32			: std_logic; 
signal Gear33			: std_logic;
signal Steer3A			: std_logic;
signal Steer3B			: std_logic;

--signal Gearnum4	  	: std_logic_vector(2 downto 0);
signal Gear41			: std_logic; 
signal Gear42			: std_logic; 
signal Gear43			: std_logic; 
signal Steer4A			: std_logic;
signal Steer4B			: std_logic;

COMPONENT joy2quad
	PORT
	(
		CLK			:	 IN STD_LOGIC;
		clkdiv		:	 IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		c_right		:	 IN STD_LOGIC;
		c_left		:	 IN STD_LOGIC;
		SteerA		:	 OUT STD_LOGIC;
		SteerB		:	 OUT STD_LOGIC
	);
END COMPONENT;

begin
				
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
		
Color_mixer: entity work.colormix
port map(
		Clk6 => Clk_6,
		CompBlank => CompBlank,
		WhiteVid => WhiteVid,
		PeachVid => PeachVid,
		VioletVid => VioletVid,
		GreenVid => GreenVid,
		BlueVid => BlueVid,
		video_r => VideoR_O,
		video_g => VideoG_O,
		video_b => VideoB_O
		);

Background: entity work.playfield
port map( 
		Clk6 => Clk_6,
		DMA => DMA,
		PRAM => PRAM,
		Load_n => Load_n,
		Car => Car,
		HCount => HCount,
		VCount => VCount,
		HBlank => HBlank,
		VBlank => VBlank,
		VBlank_n_s => VBlank_n_s,
		HSync => Hsync,
		VSync => VSync,
		H256_s => H256_s,
		Playfield_n => Playfield_n,
		WhiteVid => WhiteVid,
		PeachVid => PeachVid,
		VioletVid => VioletVid,
		GreenVid => GreenVid,
		BlueVid => BlueVid,
		Video1 => Video1_O,
		Video2 => Video2_O
		);		
		
Cars: entity work.motion
port map(
		CLK6 => Clk_6,
		PHI2 => Phi2,
		DMA_n => DMA_n,
      PRAM => PRAM,
		H256_s => H256_s,
		VCount => VCount,
		HCount => HCount,
		Load_n => Load_n,
		Car => Car,
		Car_n => Car_n
		);

CPU: entity work.cpu_mem
port map(
		Clk12 => clk_12,
		Clk6 => clk_6,
		Reset_I => Reset_I,
		Reset_n => reset_n,
		VCount => VCount,
		HCount => HCount,
		Vblank_n_s => Vblank_n_s,
		Test_n => Test_I,
		DB_in => CPU_Din,
		DBus => CPU_Dout,
		DBus_n => DBus_n,
		PRAM => PRAM,
		ABus => BA,
		Attract => Attract,
		Attract_n => Attract_n,
		CollReset_n => CollisionReset_n,
		Trac_Sel_Read_n => Trac_Sel_Read_n,
		AD_Read_n => AD_Read_n,
		Gas_Read_n => Gas_Read_n,
		Coin_Read_n => Coin_Read_n,
		Options_Read_n => Options_Read_n,
		Wr_DA_Latch_n => Wr_DA_Latch_n,
		Wr_CrashWord_n => Wr_CrashWord_n,
		StartLamp => StartLamp_O,
		Skid => Skid,
		Phi1_o => Phi1,
		Phi2_o => Phi2,
		DMA => DMA,
		DMA_n => DMA_n,
		ADR => open
		);
		
Input: entity work.Control_Inputs
port map(
		Clk6 => Clk_6,
		DipSw => DIP, -- DIP switches
		Trac_Sel_n => TrackSel_I,
		Coin1 => not Coin1_I, -- Coin switches are active-high in real hardware, active-low is easier here
		Coin2 => not Coin2_I,
		Coin3 => not Coin3_I,
		Coin4 => not Coin4_I,
		Start1_n => Start1_I,
		Start2_n => Start2_I,
		Start3_n => Start3_I,
		Start4_n => Start4_I,
		Gas1_n => Gas1_I,
		Gas2_n => Gas2_I,
		Gas3_n => Gas3_I,
		Gas4_n => Gas4_I,		
		Gear1_1_n => Gear11,
		Gear2_1_n => Gear12,
		Gear3_1_n => Gear13,		
		Gear1_2_n => Gear21,
		Gear2_2_n => Gear22,
		Gear3_2_n => Gear23,
		Gear1_3_n => Gear31,
		Gear2_3_n => Gear32,
		Gear3_3_n => Gear33,
		Gear1_4_n => Gear41,
		Gear2_4_n => Gear42,
		Gear3_4_n => Gear43,
		Steering1A_n => Steer1A,
		Steering1B_n => Steer1B,
		Steering2A_n => Steer2A,
		Steering2B_n => Steer2B,
		Steering3A_n => Steer3A,
		Steering3B_n => Steer3B,
		Steering4A_n => Steer4A,
		Steering4B_n => Steer4B,
		Collision_n => Collision_n,	
	   Gas_Read_n => Gas_Read_n,
		AD_Read_n => AD_Read_n,
		Coin_Read_n => Coin_Read_n,
		Options_Read_n => Options_Read_n,
		Trac_Sel_Read_n => Trac_Sel_Read_n,
		Wr_DA_Latch_n => Wr_DA_Latch_n,
		Adr => BA(2 downto 0),
		DBus => CPU_Dout(3 downto 0),
		Dout => CPU_Din
	);		
		
PF_Comparator: entity work.collision_detect
port map(	
		Clk6 => Clk_6,
		Car_n	=> Car_n,
		Playfield_n => Playfield_n,
		CollisionReset_n => CollisionReset_n,
		Collision_n	=> Collision_n
		);
	
Sound: entity work.audio
port map( 
		Clk_6 => Clk_6,
		Reset_n => Reset_n,
		Load_n => Load_n,
		Skid => Skid,
		Wr_CrashWord_n => Wr_CrashWord_n,
		Attract => Attract,
		Attract_n => Attract_n,
		PRAM => PRAM,
		DBus_n => DBus_n,
		HCount => HCount,
		VCount => VCount,
		P1_2audio => Audio1_O,
		P3_4audio => Audio2_O
		);
		
Gears1: entity work.gearshift
port map(
		CLK => clk_6,
		reset => not Reset_n,
--		gearout => Gearnum1,
		gearup => c_gearup1,
		geardown => c_geardown1,
		gear1 => Gear11,
		gear2 => Gear12,
		gear3 => Gear13
	);
	
RotaryEncoder1: joy2quad
port map(
		CLK => clk_6,
		clkdiv => x"000057E4",
		c_right => c_right1,
		c_left => c_left1,
		SteerA=> Steer1A,
		SteerB=> Steer1B
	);	

Gears2: entity work.gearshift
port map(
		CLK => clk_6,
		reset => not Reset_n,
--		gearout => Gearnum2,
		gearup => c_gearup2,
		geardown => c_geardown2,
		gear1 => Gear21,
		gear2 => Gear22,
		gear3 => Gear23
	);
	
RotaryEncoder2: joy2quad
port map(
		CLK => clk_6,
		clkdiv => x"000057E4",
		c_right => c_right2,
		c_left => c_left2,
		SteerA=> Steer2A,
		SteerB=> Steer2B
	);	

Gears3: entity work.gearshift
port map(
		CLK => clk_6,
		reset => not Reset_n,
--		gearout => Gearnum3,
		gearup => c_gearup3,
		geardown => c_geardown3,
		gear1 => Gear31,
		gear2 => Gear32,
		gear3 => Gear33
	);
	
RotaryEncoder3: joy2quad
port map(
		CLK => clk_6,
		clkdiv => x"000057E4",
		c_right => c_right3,
		c_left => c_left3,
		SteerA=> Steer3A,
		SteerB=> Steer3B
	);	

Gears4: entity work.gearshift
port map(
		CLK => clk_6,
		reset => not Reset_n,
--		gearout => Gearnum4,
		gearup => c_gearup4,
		geardown => c_geardown4,
		gear1 => Gear41,
		gear2 => Gear42,
		gear3 => Gear43
	);

RotaryEncoder4: joy2quad
port map(
		CLK => clk_6,
		clkdiv => x"000057E4",
		c_right => c_right4,
		c_left => c_left4,
		SteerA=> Steer4A,
		SteerB=> Steer4B
	);	

Sync_O <= HSync nor VSync;
Blank_O <= HBlank nor VBlank;



end rtl;