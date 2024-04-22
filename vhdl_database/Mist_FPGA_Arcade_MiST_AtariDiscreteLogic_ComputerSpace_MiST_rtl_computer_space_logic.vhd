-----------------------------------------------------------------------------		
-- COMPUTER SPACE LOGIC																		--
-- Implementation of Computer Space FPGA emulator.									--
-- Module that embodies the three CS boards											--
-- and manages the interfaces between those boards									--
-- as well as the interface with the implementation specifics and key 		--
-- clocks/timers																				--
--																									--
-- This entity is implementation agnostic												--
--																									--
-- Naming convention:																		--
-- Sync Star Board inputs/outputs are labelled SB_<nn>, where <nn> is 		--
-- according to original schematics input/output labels. 						--
-- Motion Board inputs/outputs are labelled MB_<nn>, where <nn> is 			--
-- according to original schematics input/output labels. 						--
-- Memory Board inputs/outputs are labelled MemBrd_<nn>, where <nn> is 		--
-- according to original schematics input/output labels. 						--
--																									--
-- v1.0																							--
-- by Mattias G, 2015																		--
-- Enjoy!																						-- 
-----------------------------------------------------------------------------

library 	ieee;
use 		ieee.std_logic_1164.all; 
use 		ieee.std_logic_arith.all;
use 		ieee.std_logic_unsigned.all;
library	work;

--80--------------------------------------------------------------------------|

entity computer_space_logic is 
	port
	(
	reset,

	-- clocks and timers
	game_clk, super_clk, explosion_clk,
	seconds_clk, timer_base_clk 				: in std_logic;
	
	rocket_missile_life_time_duration,
	saucer_missile_life_time_duration, 
	saucer_missile_hold_duration,
	signal_delay_duration 						: in integer;
	
	-- for use with memory board
	thrust_and_rotate_clk,
	explosion_rotate_clk 						: in std_logic;

	-- control panel signals incl coin
	signal_start, signal_coin,
	signal_thrust, signal_fire,
	signal_cw, signal_ccw  						: in std_logic;
	
	-- composite video
	-- signals; to send via gpio
	-- to TV (via resistor circuitry)
	composite_video_signal						: out std_logic_vector(3 downto 0);
	blank												: out std_logic;

	hsync												: out std_logic;
	vsync												: out std_logic;
	
	-- signals for sound
	audio_gate										: out std_logic;
	sound_switch									: out std_logic_vector (7 downto 0)
														:= "00000000";
														
	saucer_missile_sound							: out std_logic;
	rocket_missile_sound							: out std_logic;
	turn_sound										: out std_logic
	
	);
	
end computer_space_logic;

architecture
computer_space_logic_architecture
of computer_space_logic is 

component sync_star_board 
	port (
	reset,
	game_clk											: in std_logic;
	super_clk,
	explosion_clk, seconds_clk					: in std_logic; 

	SB_3, SB_4, SB_6, SB_7,
	SB_C, SB_E, SB_N								: in std_logic;  	

	SB_2, SB_5, SB_H, SB_K,
	SB_L, SB_M, SB_Y 								: out std_logic;  
		
	hsync												: out std_logic;
	vsync												: out std_logic;
	composite_video_signal 					 	: out std_logic_vector(3 downto 0);
	blank												: out std_logic  
	);																		
end component;

component motion_board 
	port (
	super_clk, timer_base_clk  				: in std_logic; 
	rocket_missile_life_time_duration,
	saucer_missile_life_time_duration, 
	saucer_missile_hold_duration,
	signal_delay_duration 						: in integer;

	MB_3,	MB_4, MB_16, MB_17,
	MB_18, MB_19, MB_20,
	MB_C,	MB_D, MB_H, MB_J,
	MB_T, MB_U, MB_V,	MB_Y 						: in std_logic; 

	MB_5, MB_6, MB_8, MB_9,
	MB_10, MB_11, MB_12,
	MB_13, MB_14, MB_15,MB_21,
	MB_B, MB_E, MB_F,
	MB_K, MB_L, MB_N, MB_M,						
	MB_P, MB_R, MB_W,  
	MB_2_rocket, MB_2_saucer,
	saucer_missile_sound,
	rocket_missile_sound                  : out std_logic 
	);
end component;

component memory_board 
	port (
	super_clk, thrust_and_rotate_clk,
	explosion_rotate_clk 						: in std_logic := '1';
	
	MemBrd_2, MemBrd_3, MemBrd_4,
	MemBrd_5, MemBrd_6, MemBrd_7,
	MemBrd_8, MemBrd_9, MemBrd_10,
	MemBrd_11, MemBrd_A, MemBrd_B,
	MemBrd_C, MemBrd_D, MemBrd_E,
	MemBrd_F, MemBrd_H, MemBrd_J, 
	MemBrd_K, MemBrd_M, MemBrd_N,
	MemBrd_R, MemBrd_S  							: in 	std_logic;
	
	MemBrd_12, MemBrd_13, MemBrd_14,
	MemBrd_15, MemBrd_16, MemBrd_17,
	MemBrd_K1, MemBrd_K2, MemBrd_P,
	MemBrd_T, MemBrd_U, MemBrd_V, 
	MemBrd_W, MemBrd_X, MemBrd_Y,
	turn_sound										: out std_logic
	);
end component;

-- signals for interfacing
-- with sync star board
signal SB_3, SB_4, SB_6,
		 SB_C, SB_E, SB_N							: std_logic;   
signal SB_2, SB_5, SB_7,
		 SB_H, SB_K, SB_L, SB_M, SB_Y			: std_logic;   

-- signals for interfacing with
-- memory board 
signal MemBrd_A, MemBrd_B, MemBrd_C,
		 MemBrd_D, MemBrd_2, MemBrd_3,
		 MemBrd_4, MemBrd_5,MemBrd_E,
		 MemBrd_F, MemBrd_J, MemBrd_H,
		 MemBrd_6, MemBrd_7, MemBrd_8,
		 MemBrd_9 									: std_logic; 
signal MemBrd_13, MemBrd_14, MemBrd_15,
		 MemBrd_16 									: std_logic;
signal MemBrd_W, MemBrd_V, MemBrd_X,
		 MemBrd_Y, MemBrd_S 						: std_logic;
signal MemBrd_17, MemBrd_T, MemBrd_U,
		 MemBrd_12, MemBrd_11 					: std_logic;
signal MemBrd_10, MemBrd_22, MemBrd_R,
		 MemBrd_K, MemBrd_P, MemBrd_M,
		 MemBrd_N 									: std_logic;
signal MemBrd_K1, MemBrd_K2 					: std_logic := '0';

-- signals for interfacing
-- with motion board 
signal MB_V, MB_U, MB_T, MB_4, MB_D,
		 MB_3, MB_H, MB_J, MB_B, MB_C 		: std_logic;
signal MB_19, MB_18, MB_16, MB_17, MB_20	: std_logic;

signal MB_E, MB_5, MB_F, MB_6, MB_L,
		 MB_9, MB_K, MB_8, MB_21, MB_M,
		 MB_11, MB_N, MB_12, MB_14, MB_R,
		 MB_13, MB_15, MB_P, MB_W, MB_10,
		 MB_Y 										: std_logic;
signal MB_2_rocket, MB_2_saucer 				: std_logic;

-----------------------------------------------------------------------------//
begin

-----------------------------------------------------------------------------
-- SYNC STAR BOARD  								            							--
-----------------------------------------------------------------------------
Sync_Star_Brd : sync_star_board 
port map (reset, game_clk, super_clk, explosion_clk, seconds_clk,
SB_3, SB_4, SB_6, SB_7, SB_C, SB_E, SB_N,
SB_2, SB_5, SB_H, SB_K, SB_L, SB_M, SB_Y, hsync, vsync,
composite_video_signal, blank);

-----------------------------------------------------------------------------
-- MOTION BOARD											            					--
-----------------------------------------------------------------------------
Motion_Brd: motion_board
port map (super_clk, timer_base_clk, rocket_missile_life_time_duration,
saucer_missile_life_time_duration, saucer_missile_hold_duration,
signal_delay_duration, MB_3, MB_4, MB_16, MB_17, MB_18, MB_19, MB_20, MB_C,
MB_D, MB_H, MB_J,	MB_T, MB_U, MB_V,	MB_Y, MB_5, MB_6, MB_8, MB_9, MB_10,
MB_11, MB_12, MB_13, MB_14, MB_15,MB_21, MB_B, MB_E, MB_F, MB_K, MB_L, MB_N,
MB_M,	MB_P, MB_R, MB_W, MB_2_rocket, MB_2_saucer,saucer_missile_sound,rocket_missile_sound); 

-----------------------------------------------------------------------------
-- MEMORY BOARD  											            					--
-----------------------------------------------------------------------------	
Memory_Brd: memory_board
port map(super_clk, thrust_and_rotate_clk, explosion_rotate_clk, MemBrd_2,
MemBrd_3, MemBrd_4, MemBrd_5, MemBrd_6, MemBrd_7, MemBrd_8, MemBrd_9,
MemBrd_10, MemBrd_11, MemBrd_A, MemBrd_B, MemBrd_C, MemBrd_D, MemBrd_E, 
MemBrd_F, MemBrd_H, MemBrd_J, MemBrd_K, MemBrd_M, MemBrd_N, MemBrd_R,
MemBrd_S, MemBrd_12, MemBrd_13, MemBrd_14, MemBrd_15, MemBrd_16, MemBrd_17,
MemBrd_K1, MemBrd_K2, MemBrd_P, MemBrd_T, MemBrd_U, MemBrd_V, MemBrd_W,
MemBrd_X, MemBrd_Y, turn_sound); 								
		
-----------------------------------------------------------------------------
-- COMPUTER SPACE BOARD INTRA CONNECTION MAPPING                 				--
-- from Motion Board to Memory Board													--
-----------------------------------------------------------------------------
MemBrd_A <= MB_8; 	-- SAUCER VERTICAL BIT 3
MemBrd_2 <= MB_K; 	-- SAUCER VERTICAL BIT 2
MemBrd_E <= MB_9; 	-- SAUCER VERTICAL BIT 1
MemBrd_6 <= MB_L; 	-- SAUCER VERTICAL BIT 0

MemBrd_B <= MB_6; 	-- SAUCER HORIZONTAL BIT 3 
MemBrd_3 <= MB_F; 	-- SAUCER HORIZONTAL BIT 2
MemBrd_F <= MB_5; 	-- SAUCER HORIZONTAL BIT 1
MemBrd_7 <= MB_E; 	-- SAUCER HORIZONTAL BIT 0

MemBrd_C <= MB_12; 	-- ROCKET HORIZONTAL BIT 3
MemBrd_4 <= MB_N; 	-- ROCKET HORIZONTAL BIT 2
MemBrd_H <= MB_11; 	-- ROCKET HORIZONTAL BIT 1
MemBrd_8 <= MB_M; 	-- ROCKET HORIZONTAL BIT 0

MemBrd_D <= MB_15; 	-- ROCKET VERTICAL BIT 3
MemBrd_5 <= MB_13; 	-- ROCKET VERTICAL BIT 2
MemBrd_J <= MB_R; 	-- ROCKET VERTICAL BIT 1
MemBrd_9 <= MB_14; 	-- ROCKET VERTICAL BIT 0


MemBrd_11 <= MB_B;  	-- 30Hz pulse train

-----------------------------------------------------------------------------
-- COMPUTER SPACE BOARD INTRA CONNECTION MAPPING                 				--
-- from Memory Board to Motion Board													--
-----------------------------------------------------------------------------
MB_V  <= MemBrd_X;	-- rocket vertical velocity level bit 2
MB_U  <= MemBrd_V;	-- rocket vertical velocity level bit 1
MB_T  <= MemBrd_W;	-- rocket vertical velocity level bit 0

MB_4  <= MemBrd_15;	-- rocket horizontal velocity level bit 2
MB_D  <= MemBrd_13;	-- rocket horizontal velocity level bit 1
MB_3  <= MemBrd_14;	-- rocket horizontal velocity level bit 0

MB_H  <= MemBrd_Y;	-- rocket vertical velocity:
							-- rocket going up or down
							-- 0 up / 1 down
							
MB_J  <= MemBrd_16; 	-- rocket horizontal velocity:
							-- rocket going right or left
							-- 0 - left / 1 - right	
							
MB_19 <= MemBrd_T;	-- rocket missile 
							-- vertical (up / down) speed
							-- constant 1 - no speed
							-- constant 0 - "60Hz" speed (60 pixels / second)
							-- pulse 0/1 at 30 Hz rate
							-- gives "30 Hz" speed (30 pixels / second)
							
MB_18 <= MemBrd_12; 	-- rocket missile
							-- vertical direction
							-- 0 - up, 1 - down

MB_17 <= MemBrd_U; 	-- rocket missile
							-- horizontal (right/left) speed
							-- constant 1 - no speed
							-- constant 0 - "60Hz" speed
							-- pulse 0/1 at 30 Hz rate
							-- gives "30 Hz" speed
							
MB_16 <= MemBrd_17;	-- rocket missile
							-- horizontal direction
							-- 1- right, 0 - left

-----------------------------------------------------------------------------
-- COMPUTER SPACE BOARD INTRA CONNECTION MAPPING                 				--
-- from Motion Board to Sync Star Board 												--
----------------------------------------------------------------------------- 
SB_3 <= MB_21; 		-- saucer enable
SB_E <= MB_W;			-- rocket enable
SB_4 <= MB_10; 		-- saucer missile video
SB_6 <= MB_P; 			-- rocket missile video from motionboard to syncboard
							-- (game on and collision/explosion)

-----------------------------------------------------------------------------
-- COMPUTER SPACE BOARD INTRA CONNECTION MAPPING                 				--
-- from Sync Star Board to Memory Board												--
-----------------------------------------------------------------------------
MemBrd_K  <= SB_2; 	-- saucer out / saucer enable
							-- after collision/explosion logic has been applied

MemBrd_10 <= SB_5; 	-- rocket_enable 
							-- after game on and collision/explosion 
							-- logic has been applied 
							
MemBrd_22 <= SB_L; 	-- explosion audio trigger
							-- (in real impl connected to audio unit
							-- on Memory Board)
							
MemBrd_R  <= SB_M; 	-- spin 

-----------------------------------------------------------------------------
-- COMPUTER SPACE BOARD INTRA CONNECTION MAPPING                 				--
-- from Memory Board to Sync Star Board												--
-----------------------------------------------------------------------------
SB_N <= MemBrd_P;		-- video out (rocket and saucer)

-----------------------------------------------------------------------------
-- COMPUTER SPACE BOARD INTRA CONNECTION MAPPING                 				--
-- from Sync Star Board to Motion Board												--
-----------------------------------------------------------------------------
MB_C 	<= SB_H; 		-- count enable
MB_20 <= SB_Y; 		-- clock inverse

-----------------------------------------------------------------------------
-- CONNECTING TO BUTTONS																	--
-----------------------------------------------------------------------------
SB_C  	<= signal_coin;
SB_7 		<= signal_start;
MemBrd_S <= signal_thrust;
MB_Y		<= signal_fire;
MemBrd_M <= signal_cw;
MemBrd_N <= signal_ccw;

-----------------------------------------------------------------------------
-- CONNECTING TO AUDIO																		--
--																									--
-- connecting to sound module, specific to the fpga board implementation	--
-----------------------------------------------------------------------------
audio_gate <= not SB_K;	-- if high, then audio is active (game is on)
								-- if low then audio is inactive (game is not on)

sound_switch (1) <= MemBrd_K1; 		-- rocket rotation
sound_switch (2) <= MemBrd_K2; 		-- rocket thrust
sound_switch (3) <= MB_2_rocket; 	-- rocket missile shooting
sound_switch (4) <= MemBrd_22; 		-- explosion
sound_switch (5) <= MB_2_saucer;		-- saucer missile shooting	
sound_switch (6) <= '0';

end computer_space_logic_architecture;