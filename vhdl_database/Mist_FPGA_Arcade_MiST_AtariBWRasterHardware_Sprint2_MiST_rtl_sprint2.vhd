-- Top level file for Kee Games Sprint 2 
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
-- See Sprint 2 manual for video output details. Resistor values listed here have been scaled 
-- for 3.3V logic. 
-- R48 1k Ohm
-- R49 1k Ohm
-- R50 680R
-- R51 330R

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity sprint2 is 
port(		
			clk_12		: in	std_logic;	-- 12MHz input clock
			Reset_n		: in	std_logic;	-- Reset button (Active low)
			VID	: out 	std_logic_vector(7 downto 0);
			Sync_O		: out std_logic;  -- Composite sync output (1.2k)
			Audio1_O		: out std_logic_vector(6 downto 0);  -- Ideally this should have a simple low pass filter
			Audio2_O		: out std_logic_vector(6 downto 0);			
			Hs				: out std_logic;
			Vs				: out std_logic;
			Vb				: out std_logic;			
			Hb				: out std_logic;	
			Coin1_I		: in  std_logic;  -- Coin switches (Active low)
			Coin2_I		: in  std_logic;
			Start1_I		: in  std_logic;  -- Start buttons
			Start2_I		: in  std_logic;
			Trak_Sel_I	: in  std_logic;  -- Track select button 
			Gas1_I		: in  std_logic;	-- Gas pedals 
			Gas2_I		: in  std_logic;
			c_gearup		: in  std_logic;
			c_geardown	: in  std_logic;
			c_left		: in  std_logic;
			c_right		: in  std_logic;
			c_gearup2	: in  std_logic;
			c_geardown2	: in  std_logic;
			c_left2		: in  std_logic;
			c_right2		: in  std_logic;
			Test_I		: in  std_logic;  -- Self-test switch
			Lamp1_O		: out std_logic;	-- Player 1 and 2 start button LEDs
			Lamp2_O		: out std_logic
			);
end sprint2;

architecture rtl of sprint2 is

signal clk_6			: std_logic;
signal phi1 			: std_logic;
signal phi2				: std_logic;

signal Hcount		   : std_logic_vector(8 downto 0) := (others => '0');
signal H256				: std_logic;
signal H256_s			: std_logic;
signal H256_n			: std_logic;
signal H128				: std_logic;
signal H64				: std_logic;
signal H32				: std_logic;
signal H16				: std_logic;
signal H8				: std_logic;
signal H8_n				: std_logic;
signal H4				: std_logic;
signal H4_n				: std_logic;
signal H2				: std_logic;
signal H1				: std_logic;

signal Hsync			: std_logic;
signal Vsync			: std_logic;
signal Video			: std_logic_vector(1 downto 0);
signal Vcount  		: std_logic_vector(7 downto 0) := (others => '0');
signal V128				: std_logic;
signal V64				: std_logic;
signal V32				: std_logic;
signal V16				: std_logic;
signal V8				: std_logic;
signal V4				: std_logic;
signal V2				: std_logic;
signal V1				: std_logic;

signal Vblank			: std_logic;
signal Vreset			: std_logic;
signal Vblank_s		: std_logic;
signal Vblank_n_s		: std_logic;
signal HBlank			: std_logic;

signal CompBlank_s	: std_logic;
signal CompSync_n_s	: std_logic;

signal WhitePF_n		: std_logic;
signal BlackPF_n		: std_logic;

signal Display			: std_logic_vector(7 downto 0);


-- Address decoder
signal addec_bus		: std_logic_vector(7 downto 0);
signal RnW				: std_logic;
signal Write_n			: std_logic;
signal ROM1				: std_logic;
signal ROM2				: std_logic;
signal ROM3				: std_logic;
signal WRAM				: std_logic;
signal RAM_n			: std_logic;
signal Sync_n			: std_logic;
signal Switch_n		: std_logic;
signal Collision1_n	: std_logic;
signal Collision2_n	: std_logic;
signal Display_n		: std_logic;
signal TimerReset_n	: std_logic;
signal CollRst1_n		: std_logic;
signal CollRst2_n		: std_logic;
signal SteerRst1_n	: std_logic;
signal SteerRst2_n	: std_logic;
signal NoiseRst_n		: std_logic;
signal Attract			: std_logic := '1';	
signal Skid1			: std_logic;
signal Skid2			: std_logic;
signal Lamp1			: std_logic;
signal Lamp2			: std_logic;

signal Crash_n			: std_logic;
signal Motor1_n 		: std_logic;
signal Motor2_n		: std_logic;
signal Car1				: std_logic;
signal Car1_n			: std_logic;
signal Car2				: std_logic;
signal Car2_n			: std_logic;
signal Car3_4_n		: std_logic;	

signal NMI_n			: std_logic;

signal Adr				: std_logic_vector(9 downto 0);

signal SW1				: std_logic_vector(7 downto 0);

signal Inputs			: std_logic_vector(1 downto 0);
signal Collisions1	: std_logic_vector(1 downto 0);
signal Collisions2	: std_logic_vector(1 downto 0);
signal Gearnum	  	: std_logic_vector(2 downto 0);
signal Gear1			: std_logic; 
signal Gear2			: std_logic; 
signal Gear3			: std_logic;
signal SteerA			: std_logic;
signal SteerB			: std_logic;
signal Gearnum2	  	: std_logic_vector(2 downto 0);
signal Gear21			: std_logic; 
signal Gear22			: std_logic; 
signal Gear23			: std_logic;
signal Steer2A			: std_logic;
signal Steer2B			: std_logic;

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
-- Configuration DIP switches, these can be brought out to external switches if desired
-- See Sprint 2 manual page 11 for complete information. Active low (0 = On, 1 = Off)
--    1 								Oil slicks			(0 - Oil slicks enabled)
--			2							Cycle tracks      (1 - Cycle through all tracks in attract mode)
--   			3	4					Coins per play		(00 - 1 Coin per player) 
--						5				Extended Play		(0 - Extended Play enabled)
--							6			Not used				(X - Don't care)
--								7	8	Game time			(01 - 120 Seconds)
SW1 <= "01000101"; -- Config dip switches
		
		
Vid_sync: entity work.synchronizer
port map(
		clk_12 => clk_12,
		clk_6 => clk_6,
		hcount => hcount,
		vcount => vcount,
		hsync => hsync,
		hblank => hblank,
		vblank_s => vblank_s,
		vblank_n_s => vblank_n_s,
		vblank => vblank,
		vsync => vsync,
		vreset => vreset
		);


Background: entity work.playfield
port map( 
		clk6 => clk_6,
		Gear_Shift_1 => Gearnum,
		Gear_Shift_2 => Gearnum2,
		Display => display,
		HCount => HCount,
		VCount => VCount,
		HBlank => HBlank,		
		H256_s => H256_s,
		VBlank => VBlank,
		VBlank_n_s => Vblank_n_s,
		HSync => Hsync,
		VSync => VSync,
		CompSync_n_s => CompSync_n_s,
		CompBlank_s => CompBlank_s,
		WhitePF_n => WhitePF_n,
		BlackPF_n => BlackPF_n 
		);

		
Cars: entity work.motion
port map(
		CLK6 => clk_6,
		CLK12 => clk_12,
		PHI2 => phi2,
		DISPLAY => Display,
		H256_s => H256_s,
		VCount => VCount,
		HCount => HCount,
		Crash_n => Crash_n,
		Motor1_n => Motor1_n,
		Motor2_n => Motor2_n,
		Car1 => Car1,
		Car1_n => Car1_n,
		Car2 => Car2,
		Car2_n => Car2_n,
		Car3_4_n => Car3_4_n	
		);
		
		
PF_Comparator: entity work.collision_detect
port map(	
		Clk6 => clk_6,
		Car1 => Car1,
		Car1_n => Car1_n,
		Car2 => Car2,
		Car2_n => Car2_n,
		Car3_4_n	=> Car3_4_n,
		WhitePF_n => WhitePF_n,
		BlackPF_n => BlackPF_n,
		CollRst1_n => CollRst1_n,
		CollRst2_n => CollRst2_n,
		Collisions1 => Collisions1,
		Collisions2 => Collisions2
		);
	
	
CPU: entity work.cpu_mem
port map(
		Clk12 => clk_12,
		Clk6 => clk_6,
		Reset_n => reset_n,
		VCount => VCount,
		HCount => HCount,
		Hsync_n => not Hsync,
		Vblank_s => Vblank_s,
		Vreset => Vreset,
		Test_n => not Test_I,
		Attract => Attract,
		Skid1 => Skid1,
		Skid2 => Skid2,
		NoiseReset_n => NoiseRst_n,
		CollRst1_n => CollRst1_n,
		CollRst2_n => CollRst2_n,
		SteerRst1_n => SteerRst1_n,
		SteerRst2_n => SteerRst2_n,
		Lamp1 => Lamp1_O,
		Lamp2 => Lamp2_O,
		Phi1_o => Phi1,
		Phi2_o => Phi2,
		Display => Display,
		IO_Adr => Adr,
		Collisions1 => Collisions1,
		Collisions2 => Collisions2,
		Inputs => Inputs
		);


Input: entity work.Control_Inputs
port map(
		clk6 => clk_6,
		SW1 => SW1, -- DIP switches
		Coin1_n => Coin1_I,
		Coin2_n => Coin2_I,
		Start1 => not Start1_I, -- Active high in real hardware, inverting these makes more sense with the FPGA
		Start2 => not Start2_I,
		Trak_Sel => not Trak_Sel_I,
		Gas1 => not Gas1_I,
		Gas2 => not Gas2_I,
		Gear1_1 => not Gear1,
		Gear1_2 => not Gear21,
		Gear2_1 => not Gear2,
		Gear2_2 => not Gear22,
		Gear3_1 => not Gear3,
		Gear3_2 => not Gear23,
		Self_Test => not Test_I,
		Steering1A_n => SteerA,
		Steering1B_n => SteerB,
		Steering2A_n => Steer2A,
		Steering2B_n => Steer2B,
		SteerRst1_n => SteerRst1_n,
		SteerRst2_n => SteerRst2_n,
		Adr => Adr,
		Inputs => Inputs
	);	


RotaryEncoder: joy2quad
port map(
		CLK => clk_6,
		clkdiv => x"000057E4",
		c_right => c_right,
		c_left => c_left,
		SteerA=> SteerA,
		SteerB=> SteerB
	);
	
			  
Gears: entity work.gearshift
port map(
		CLK => clk_6,
		reset => not Reset_n,
		gearout => Gearnum,
		gearup => c_gearup,
		geardown => c_geardown,
		gear1 => Gear1,
		gear2 => Gear2,
		gear3 => Gear3
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
	
			  
Gears2: entity work.gearshift
port map(
		CLK => clk_6,
		reset => not Reset_n,
		gearout => Gearnum2,
		gearup => c_gearup2,
		geardown => c_geardown2,
		gear1 => Gear21,
		gear2 => Gear22,
		gear3 => Gear23
	);
	

Sound: entity work.audio
port map( 
		Clk_6 => Clk_6,
		Reset_n => Reset_n,
		Motor1_n => Motor1_n,
		Motor2_n => Motor2_n,
		Skid1 => Skid1,
		Skid2 => Skid2,
		Crash_n => Crash_n,
		NoiseReset_n => NoiseRst_n,
		Attract => Attract,
		Display => Display,
		HCount => HCount,
		VCount => VCount,
		Audio1 => Audio1_O,
		Audio2 => Audio2_O
		);

-- Video mixing	
Video(0) <= (not(BlackPF_n and Car2_n and Car3_4_n)) nor CompBlank_s;	
Video(1) <= not(WhitePF_n and Car1_n and Car3_4_n);  
Sync_O <= CompSync_n_s;
Vb <= VBLANK;
Hb <= HBLANK;
Hs <= Hsync;
Vs <= Vsync;

col: process(clk_12, Video)
begin
	case Video is
		when "01" => VID <= ("10000000");
		when "10" => VID <= ("01010000");
		when "11" => VID <= ("11111111");
		when others => VID <= ("00000000");
	end case;
end process;


end rtl;