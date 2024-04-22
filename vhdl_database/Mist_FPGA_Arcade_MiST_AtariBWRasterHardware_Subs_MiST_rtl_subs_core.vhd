-- Top level file for Atari Subs
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
-- See Subs manual Figure 4-11 for video output details. Resistor values listed here have been scaled 
-- for 3.3V logic. Original game supported two types of monitors but composite video will work for 
-- almost all displays.


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity subs_core is 
port(		
			clk12			: in	std_logic;
			Clk_50_I		: in	std_logic;	-- 50MHz input clock
			Reset_I		: in	std_logic;	-- Reset button (Active low)
			Vid1_O		: out std_logic;  -- Display 1 video output, 680R resistor to CompVid1
			Vid2_O		: out std_logic;	-- Display 2 video output, 680R resistor to CompVid2
			CompSync_O	: out std_logic;  -- Composite sync output, 1.2k resistor to each CompVid output 
			CompBlank_O	: out std_logic;  -- Composite blank output, 1.2k resistor to each CompVid output
			HBlank		: out std_logic;
			VBlank		: out std_logic;
			HSync			: out std_logic;
			VSync			: out std_logic;
			Coin1_I		: in  std_logic;  -- Coin switches (Active low)
			Coin2_I		: in  std_logic;
			Start1_I		: in  std_logic;  -- Start buttons
			Start2_I		: in  std_logic;
			Fire1_I		: in  std_logic;
			Fire2_I		: in  std_logic;
			Steer_1A_I	: in  std_logic;	-- Steering wheel inputs, these are quadrature encoders
			Steer_1B_I	: in	std_logic;
			Steer_2A_I	: in	std_logic;
			Steer_2B_I	: in 	std_logic;
			Test_I		: in  std_logic;  -- Self-test switch
			DiagStep_I	: in  std_logic;	-- Self-test advance button
			DiagHold_I	: in	std_logic;
			Slam_I		: in	std_logic;
			DIP_Sw		: in std_logic_vector(7 downto 0);
			P1_audio		: out std_logic_vector(7 downto 0);
			P2_audio		: out std_logic_vector(7 downto 0);
			LED1_O		: out std_logic;	-- Player 1 and 2 start button LEDs
			LED2_O		: out std_logic;
			CCounter_O	: out std_logic	-- Coin counter
			);
end subs_core;

architecture rtl of subs_core is

signal Clk6					: std_logic;
signal Ena_3k				: std_logic;
signal Phi1 				: std_logic;
signal Phi2					: std_logic;
signal Reset_n				: std_logic;

signal HCount				: std_logic_vector(8 downto 0);
signal VCount				: std_logic_vector(7 downto 0);
--signal HSync				: std_logic;
signal HBlank_s				: std_logic;
--signal VBlank				: std_logic;
signal HSync_s			: std_logic;
signal VBlank_s			: std_logic;
signal VBlank_n_s			: std_logic;
signal VReset				: std_logic;
signal VSync_s				: std_logic;
signal VSync_n				: std_logic;

signal H256_s				: std_logic;
signal PFLd1_n				: std_logic;
signal PFLd2_n				: std_logic;

signal Sub1_n				: std_logic;
signal Sub2_n				: std_logic;
signal Torp1				: std_logic;
signal Torp2				: std_logic;

signal Invert1				: std_logic;
signal Invert2				: std_logic;

signal Adr					: std_logic_vector(10 downto 0);

signal DBus_in				: std_logic_vector(7 downto 0);
signal DMA					: std_logic_vector(7 downto 0);
signal DMA_n				: std_logic_vector(7 downto 0);
signal PRAM					: std_logic_vector(7 downto 0);
signal Load_n				: std_logic_vector(8 downto 1);

signal Control_Read_n	: std_logic := '1';
signal Steer_Reset_n		: std_logic := '1';
signal Options_Read_n	: std_logic := '1';
signal Coin_Read_n		: std_logic := '1';
signal SW_F9				: std_logic_vector(7 downto 0);

signal Noise_Reset_n		: std_logic := '1';
signal SnrStart1			: std_logic := '0';
signal SnrStart2			: std_logic := '0';
signal Crash				: std_logic := '0';
signal Explode				: std_logic := '0';
signal Video				: std_logic_vector(1 downto 0);

begin	

Vid_sync: entity work.synchronizer
port map(
		Clk_12 => Clk12,
		Clk_6 => Clk6,
		HCount => HCount,
		VCount => VCount,
		HSync => HSync_s,
		HBlank => HBlank_s,
		VBlank_s => VBlank_s,
		VBlank_n_s => VBlank_n_s,
		VBlank => VBlank_s,
		VSync => VSync_s,
		VSync_n => VSync_n
		);
		
		
PF: entity work.playfield
port map(
		Clk6 => Clk6,
		DMA => DMA,
		HCount => HCount,
		VCount => VCount,
		VBlank_n_s => VBlank_n_s,
		HSync => HSync_s,
		H256_s => H256_s,
		PFld1_n => PFld1_n,
		Pfld2_n => PFLd2_n
		);
		

Objects: entity work.motion
port map(
		Clk6 => Clk6,
		PHI2 => Phi2,	
		DMA_n => DMA_n,
		PRAM => PRAM,
		H256_s => H256_s,
		VCount => VCount,
		HCount => Hcount,
		Load_n => Load_n,
		Sub1_n => Sub1_n,
		Sub2_n => Sub2_n,
		Torp1 => Torp1,
		Torp2 => Torp2
		);

		
VidMixer: entity work.mixer
port map(
		Clk6 => Clk6,
		PRAM => PRAM,
		VBlank_n_s => VBlank_n_s,
		Load_n => Load_n,
		Invert1 => Invert1,
		Invert2 => Invert2,
		PFld1_n => PFld1_n,
		PFld2_n => PFld2_n,
		Sub1_n => Sub1_n,
		Sub2_n => Sub2_n,
		Torp1 => Torp1,
		Torp2 => Torp2,
		H256_s => H256_s,
		Video1 => Vid1_O,
		Video2 => Vid2_O
		);
		
		
CPU: entity work.cpu_mem
port map(
		Clk6 => Clk6,
		Ena_3k => Ena_3k,
		Reset_I => Reset_I,
		Reset_n => Reset_n,
		VCount => VCount,
		HCount => HCount,
		Test_n => Test_I,
		DBus_in => DBus_in,
		PRAM => PRAM,
		Adr => Adr,
		Control_Read_n => Control_Read_n,
		Steer_Reset_n => Steer_Reset_n,
		Options_Read_n => Options_Read_n,
		Coin_Read_n => Coin_Read_n,
		LED1 => LED1_O,
		LED2 => LED2_O,
		SnrStart1 => SnrStart1,
		SnrStart2 => SnrStart2,
		Noise_Reset_n => Noise_Reset_n,
		Crash	=> Crash,
		Explode => Explode,
		Invert1 => Invert1,
		Invert2 => Invert2,
		PHI1 => Phi1,
		PHI2 => Phi2,
		DMA => DMA,
		DMA_n => DMA_n
		);
		
Inputs: entity work.input
port map(
		Clk6 => Clk6,
		Sw_F9 => DIP_Sw,
		Coin1_n => Coin1_I,
		Coin2_n => Coin2_I,
		Start1 => Start1_I,
		Start2 => Start2_I,
		Fire1 => Fire1_I,
		Fire2 => Fire2_I,
		Test_n => Test_I,
		Diag_step => DiagStep_I,
		Diag_hold => DiagHold_I,
		Slam => Slam_I,
		Steering1A_n => Steer_1A_I,
		Steering1B_n => Steer_1B_I,
		Steering2A_n => Steer_2A_I,
		Steering2B_n => Steer_2B_I,
		SteerReset_n => Steer_Reset_n,
		Coin_Rd_n => Coin_Read_n,
		Control_Rd_n => Control_Read_n,
		Options_Rd_n => Options_Read_n,
		VBlank_n_s => VBlank_n_s,
		Adr => Adr(2 downto 0),
		DBus => DBus_in, 
		Coin_Ctr => CCounter_O
		);

Sound: Entity work.audio
port map(
		Clk_50 => Clk_50_I,
		Clk_12 => Clk12,
		Clk_6 => Clk6,
		Ena_3k => Ena_3k,
		Reset_n => Reset_n,
		Load_n => Load_n,
		SnrStart1 => SnrStart1,
		SnrStart2 => SnrStart2,
		Noise_reset_n => Noise_Reset_n,
		Crash => Crash,
		Explode => Explode,
		PRAM => PRAM,
		HCount => HCount,
		VCount => VCount,
		P1_audio => P1_audio,
		P2_audio => P2_audio
		);
		

-- Some logic to combine the video blanking and sync signals
CompBlank_O <= HBlank_s nor VBlank_s;
CompSync_O <= HSync_s nor VSync_s;
HBlank <= HBlank_s;
VBlank <= not VBlank_n_s;
HSync <= HSync_s;
VSync <= VSync_s;

end rtl;