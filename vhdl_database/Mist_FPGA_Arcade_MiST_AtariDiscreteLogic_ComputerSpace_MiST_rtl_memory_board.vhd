-----------------------------------------------------------------------------
-- MEMORY BOARD LOGIC																		--
-- For use with Computer Space FPGA emulator.										--
-- Implementation of Computer Space's Memory Board									--
-- "wire by wire" and "component by component"/"gate by gate"					--	
-- according to original schematics.													--
-- With exceptions regarding:																--
-- 	> analogue based timers (impl as counters)									--
-- 	> all flip flops / ICs using asynch clock inputs are replaced with 	--
--   	  flip flops driven by a high freq clock and logic to						--
-- 	  identify edge changes on the logical clock input							--	
-- 	> the "diode matrix" is implemented as a vector rather than a diode	--
--   	  equivalent; but the resulting functionality becomes the same			--
--		> sound pulse trains used by the analogue sound unit are replaced by	--
--	     on/off flags to trigger sound sample playback								-- 
--																									--	
-- This entity is implementation agnostic												--
--																									--
-- There are plenty of comments throughout the code to make it easier to	--
-- understand the logic, but due to the sheer number of comments there 		--
-- may exist occasional mishaps.			 												--
--																									--
-- Please take a moment to marvel at the logic behind rotating the four		--
-- core rocket images into 32 different positions. Very clever, keeping in	--
-- mind this was done back in 1971 (without RAM, ROM and CPU)					--
-- and that this was the first commercial	video arcade game ever.				--
-- Pretty cool and ambitious graphics stuff to go for as a first,				--	
-- compared to the simplicity of the subsequent Pong graphics.					--
-- Even in "modern" day it is not all together easy to figure out	how to	--
-- create 32 rotational position images based on four (16x16 pixel) base 	-- 
-- images. Hats off!																			--
--																									--
-- Naming convention:																		--
--	Signals are labelled after the component that generates the signal; 		--
-- more specifically the component's schematics label and the specific 		--	
-- output. For instance: NOR gate F6 and its output pin 10 generate a		--
-- signal which will be labelled f6_10.												--
-- Occasionally signals are labelled after a component input - this is		--
-- most common for components where the input is exposed 						--
-- to "component-internal processing" beyond simple gate functionality, 	--
-- such as bistable latches, counters, flip-flops and multiplexers.			--
-- Memory Board inputs/outputs are labelled MemBrd_<nn>, where <nn> is 		--
-- according to original schematics input/output labels. 						--
--																									--
-- v1.0																							--
-- by Mattias G, 2015																		--
-- Enjoy!																						-- 
-----------------------------------------------------------------------------

library 	ieee;
use 		ieee.std_logic_1164.all; 
use 		ieee.numeric_std.all;
library 	work;

--80--------------------------------------------------------------------------|

entity memory_board is 
	port(
	super_clk,	-- Clock  to emulate
					-- asynch flip flop logic
					
	thrust_and_rotate_clk,
	explosion_rotate_clk 							: in std_logic := '1';
	
	MemBrd_2, 	-- saucer 16x8 image's 
					-- vertical position bit 1	
	MemBrd_3,	-- saucer 16x8 image's 
					-- horizontal position bit 1	
	MemBrd_4,   -- rocket 16x16 image's 
					-- horizontal position bit 1
	MemBrd_5,   -- rocket 16x16 image's 
					-- vertical position bit 1  
	MemBrd_6, 	-- saucer 16x8 image's 
					-- vertical position bit 3 
	MemBrd_7,	-- saucer 16x8 image's 
					-- horizontal position bit 3
	MemBrd_8, 	-- rocket 16x16 image's 
					-- vertical position bit 3
	MemBrd_9, 	-- rocket 16x16 image's 
					-- horizontal position bit 3  
					
	MemBrd_10, 	-- Rocket Enable
					-- the tv beam is in position
					-- to display rocket
					-- on screen and the 
					-- rocket image can actually be
					-- displayed (for instance
					-- rocket should not be visible
					-- on screen directly after
					-- being hit by saucer missile,
					-- having collided with saucer
					-- or game is not playing)	
					
	MemBrd_11,	-- 30Hz pulse train
					-- to give rocket missile
					-- vertical and/or 
					-- horizontal "speed" with
					-- which it can move in 
					-- "angels" other than 
					-- up/down, righ/left and
					-- 45/135/225/315 degrees
					-- Resulting angels are:
					-- 22,5/67,5/112.5/157,5/
					--	212.5/257.5/302.5/342.5
					-- degrees
	
	MemBrd_A, 	-- saucer 16x8 image's 
					-- vertical position bit 0
	MemBrd_B,	-- saucer 16x8 image's 
					-- horizontal position bit 0
	MemBrd_C, 	-- rocket 16x16 image's 
					-- vertical position bit 0
	MemBrd_D,  	-- rocket 16x16 image's 
					-- horizontal position bit 0  
	MemBrd_E, 	-- saucer 16x8 image's 
					-- vertical position bit 2
	MemBrd_F,	-- saucer 16x8 image's 
					-- horizontal position bit 2
	MemBrd_H,	-- rocket 16x16 image's 
					-- vertical position bit 2 
	MemBrd_J,  	-- rocket 16x16 image's 
					-- horizontal position bit 2  

	MemBrd_K, 	-- Saucer Enable
					-- the tv beam is in position
					-- to display one of the
					-- saucers on screen
					-- and the saucer 
					-- image will actually be
					-- displayed (for instance a
					-- saucer should not be visible
					-- on screen directly after
					-- being hit by rocket missile,
					-- or having collided
					-- with rocket)
	
	MemBrd_M, 	-- signal to rotate
					-- rocket clock wise (cw)  
	
	MemBrd_N, 	-- signal to rotate
					--	rocket counter
					-- clock wise (ccw) 
	
	MemBrd_R, 	-- signal to spin rocket
					-- clock wise during
					-- explosion 
	
	MemBrd_S  	--	Thrust button pressed						
															: in std_logic;
	
	MemBrd_12,  -- rocket pointing upwards
					-- or downwards
					-- 0 - up  / 1 - down

	MemBrd_13, 	-- rocket horizontal
					-- velocity level bit 1
	MemBrd_14, 	-- rocket horizontal
					-- velocity level bit 0
	MemBrd_15,	-- rocket horizontal
					-- velocity level bit 2
	MemBrd_16, 	-- rocket horizontal
					-- velocity: rocket going
					-- right or left
					-- 0 - left / 1 - right					
	
	MemBrd_17, 	-- rocket pointing towards
					-- right or left
					-- 0 - left / 1 - right	
	
	MemBrd_K1, 	-- signal for rocket rotation
					-- audio
	
	MemBrd_K2, 	-- signal for rocket thrust
					-- audio
	
	MemBrd_P,  	-- video out (rocket and
					-- saucer)	
	
	MemBrd_T, 	-- Rocket Missile
					-- Up/Down Enable
					-- 0 - up/down allowed
					-- 1 - up/down not allowed
					-- Is either constantly
					-- 1 or 0 or
					-- switches between 1 and 0
					-- with a 30 Hz frequency
					-- to allow for rocket 
					-- missile direction of:
					-- 67,5/112.5/257.5/302.5
					--	degrees		
	MemBrd_U,  	-- Rocket Missile
					--	Right/Left Enable
					-- 0 - right/left allowed
					-- 1 - right/left not allowed
					-- Is either constantly
					-- 1 or 0 or
					-- switches between 1 and 0
					-- with a 30 Hz frequency
					-- to allow for rocket 
					-- missile direction of
					-- 22,5/157,5/212.5/342.5
					--	degrees	
	MemBrd_V,  	-- rocket vertical
					-- velocity level bit 1 
	MemBrd_W,  	-- rocket vertical
					-- velocity level bit 0 
	MemBrd_X,  	-- rocket vertical
					-- velocity level bit 2 
	MemBrd_Y, 	-- rocket vertical velocity:
					-- rocket going up or down
					-- 0 up / 1 down
					
	turn_sound
															: out std_logic
	);
	
end memory_board;

architecture memory_board_architecture
				 of memory_board is 

component rocket_diode_images is
port(
	image_select  										: in  integer range 0 to 3;
	rocket_hor, rocket_ver   						: in  integer range 0 to 15; 
	diode_left_column, diode_right_column  	: in  std_logic;
	out_image_bit   									: out std_logic
	);
end component;

component saucer_diode_image is 
port(
	saucer_enable   									: in  std_logic; 
	saucer_ver   										: in  integer range 0 to 7;
	saucer_hor   										: in  integer range 0 to 15; 	
	saucer_diode_rotating_light   				: in  std_logic;
	out_saucer_image_bit 	 						: out std_logic
	);
end component;

-- statemachine type for 74193
-- with carry and borrow
TYPE STATE_TYPE IS
(UNSIGNED_UP_DOWN, READY_FOR_CARRY,
READY_FOR_BORROW, CARRY, BORROW);

-- A5 pins, 7486
signal a5_8,a5_11,a5_3,a5_6 						: std_logic; 

-- B5 pins, 7486
signal b5_8, b5_11, b5_3, b5_6 					: std_logic; 

-- A6 pins, 74153
signal a6_10, a6_11, a6_12, a6_13, a6_6,
		 a6_4, a6_3, a6_14,a6_2, a6_7, a6_9,
		 a6_5 											: std_logic; 

-- B6 pins, 74153
signal b6_10, b6_11, b6_12, b6_13, b6_6,
		 b6_4,b6_3, b6_14,b6_2, b6_7, b6_9, 
		 b6_5 											: std_logic; 

-- C6 pins, 74153
signal c6_10, c6_11, c6_12, c6_13, c6_6,
		 c6_4, c6_3, c6_14,c6_2,c6_7, c6_9,
		 c6_5 											: std_logic; 

-- D6 pins, 74153
signal d6_10, d6_11,d6_12, d6_13, d6_6,
		 d6_4, d6_3, d6_14, d6_2, d6_7,
		 d6_9, d6_5 									: std_logic;

signal f4_4,f4_8,c5_8, c5_11, c5_3 				: std_logic :='0';
signal e1_10, e2_9, e2_7, e1_13, h2_8,
		 e5_3, c5_6 									: std_logic:='0'; 
signal diode_image0_bit, diode_image1_bit,
		 diode_image2_bit, diode_image3_bit 	: std_logic :='0';

signal rocket_hor, rocket_ver						: integer range 0 to 15;
signal saucer_ver 									: integer range 0 to 7;
signal saucer_hor 									: integer range 0 to 15;
signal saucer_image_bit 							: std_logic :='0';

signal RVER, RHOR 									: std_logic_vector (3 downto 0);
signal SVER 											: std_logic_vector (2 downto 0);
signal count 											: integer range 0 to 15 := 0;
signal counter_clock 								: std_logic;
signal count_r 										: unsigned (3 downto 0) := "0000";
signal e4_count 										: unsigned (3 downto 0) := "0000";

signal e4_12 ,e4_13 									: std_logic :='1';
-- set to initial '1' to avoid ship from
-- flipping from initial position

signal h2_10, e4_4, e4_5, e4_2, e4_3,
		 e4_6, e4_7, e4_11 							: std_logic;
signal e2_7x, e2_9x 									: std_logic;
signal e3_1 											: std_logic;

signal e2_10, e2_11, e2_2, e2_14,  e2_15,
		 e2_1,e2_3, e2_4 , e2_5, e2_12, e2_6,
		 e2_13 											: std_logic;

signal f6_8, e5_6, d5_3, e6_10 					: std_logic;
signal f4_10, e5_11, d5_11, d5_8, e5_8 		: std_logic;
signal d5_6, e4_11_process 						: std_logic;
signal e3_15 											: std_logic := '0';
signal e3_14											: std_logic := '1';

-- thrust circuitry and velocity signals
signal f2_12,f2_10, f3_3, h2_6, f3_6 			: std_logic;
signal j4_2, j4_3,j4_4, j4_5, j4_6, j4_7 		: std_logic;
signal j5_6, j5_11, j5_3 							: std_logic;
signal j6_6, inv_4, j6_8, j3_8, j3_6,
		 j2_10, j2_13 									: std_logic;
signal h4_2, h4_3, h4_4, h4_5, h4_6, h4_7 	: std_logic;
signal h5_6, h5_11, h5_3, h6_6, h2_2,
		 h6_8, h3_6, h3_8, h2_12 					: std_logic;
signal f5_10, f5_13, h5_8, j5_8,
		 f4_6, f6_6, f4_2, f4_12, f5_4, f5_1 	: std_logic;

signal thrust 											: std_logic;
signal j4_count, h4_count 							: unsigned (3 downto 0) := "0000";
signal j4_clock, h4_clock 							: std_logic;

signal explode_rotate_clock_wise,
		 combined_clk 									: std_logic;

-- rocket engine flame
signal diode_row_1, diode_row_3, f2_6,
		 f2_8, e1_1, e1_4, f3_8, f3_11, 	
		 diode_left_column,
		 diode_right_column 							: std_logic;

-- saucer rotating light
signal saucer_diode_rotating_light 				: std_logic;

-- signals to manage asynchronous
-- clock design embedded in
-- synchronous clk solutions
signal e4_4_old, e4_5_old, e3_1_old 			: std_logic;
signal j4_4_old, j4_5_old, h4_4_old,
		 h4_5_old 										: std_logic;

-- signals for audio
signal e6_4, e6_1, e6_13      					: std_logic;

-- signals for 74193 circuit statemachine
signal state : STATE_TYPE := UNSIGNED_UP_DOWN;

----------------------------------------------------------------------------//
begin 

-----------------------------------------------------------------------------
-- GENERAL INFORMATION																		--
-- The rocket has four base images from which in total 32 different images	--
-- are created to represent the rocket’s rotational positions. The 32		--	
-- images are created through the following 3 key-mechanisms:					--
--		1) Vary which base image to read from; Choose between one of the		--
--			four images																			--
--		2) Vary image read direction: Reading the base image either "top to	--
--			bottom" or "bottom to top" and from "right to left" or "left to	--	
--			right"																				--	
--		3) Vary image x-y axis: Reading the base image’s horizontal				--
--			slices (rows) as horizontal slices (rows) onto screen or				--
--			reading the	vertical slices (columns) as horizontal slices (rows)	--
--			onto screen																			--
--																									--
-- The Memory Board contains logic that can determine which base image to	--
-- select, which image read direction to apply and which image axis setup	--
-- to use depending on the rocket’s rotational position.							--
--																									--
--	ALL ROCKET ORIENTATIONS AND THEIR CORRESPONDING IMAGE LOGIC:				--
-- Deg - approx degree that the rocket is pointing in 							--
--	R/L - indicate if rocket is pointing to the right or to the left 			--
--	Pos - the corresponding "position value" for a specific degree 			--
-- (R/L-flag and Pos together corresponds to any of the unique 32 rocket	--
--	orientations / degrees)																	--
-- Image - the diode matrix image (0-3) to use										--
--	Image Read Direction - 	How the diode matrix image is being read along	--
--									its two "axis"												--
--	X-Y axis setup -  (Horizontal-2-Horizontal):	The image's horizontal		--
--																slices will be fed to		--
--																the screen as horizontal	--
--																slices acc to Image Read	--
--																Direction						--
--							(Vertical-2-Horizontal) :	The image's vertical			--
--																slices will be fed to		--
--																the screen as horizontal	--
--																slices acc to Image Read	--
--																Direction						--
--																									--
--	Deg  R/L	  Pos	 Image	Image Read Direction		X-Y Axis	Setup				--			
--	===  ===	  ===	 =====	======================	=======================	--
--	~3		R		0		0		Top2Bottom	Left2Right	Horizontal-2-Horizontal	--		
-- ~16	R		1		1		Top2Bottom	Left2Right	Horizontal-2-Horizontal	--
--	~32	R		2		2		Top2Bottom	Left2Right	Horizontal-2-Horizontal	--	
--	~43	R		3		3		Top2Bottom	Left2Right	Horizontal-2-Horizontal	--
--																									--			
-- ~47	R 		4		3		Bottom2Top	Right2Left	Vertical-2-Horizontal	--	
-- ~61	R 		5		2		Bottom2Top	Right2Left	Vertical-2-Horizontal	--	
-- ~74	R 		6		1		Bottom2Top	Right2Left	Vertical-2-Horizontal	--	
-- ~87	R 		7		0		Bottom2Top	Right2Left	Vertical-2-Horizontal	--	
--																									--
--	~93	R		8		0		Bottom2Top	Left2Right	Vertical-2-Horizontal	--
--	~105	R		9		1		Bottom2Top	Left2Right	Vertical-2-Horizontal	--
--	~121	R		10		2		Bottom2Top	Left2Right	Vertical-2-Horizontal	--
--	~134	R		11		3		Bottom2Top	Left2Right	Vertical-2-Horizontal	--
--																									--
--	~137	R		12		3		Bottom2Top	Left2Right	Horizontal-2-Horizontal	--
--	~151	R		13		2		Bottom2Top	Left2Right	Horizontal-2-Horizontal	--
--	~163	R		14		1		Bottom2Top	Left2Right	Horizontal-2-Horizontal	--
--	~175	R		15		0		Bottom2Top	Left2Right	Horizontal-2-Horizontal	--
--																									--
--	~183	L		0		0		Bottom2Top	Right2Left	Horizontal-2-Horizontal	--
--	~197	L		1		1		Bottom2Top	Right2Left	Horizontal-2-Horizontal	--
--	~209	L		2		2		Bottom2Top	Right2Left	Horizontal-2-Horizontal	--
--	~223	L		3		3		Bottom2Top	Right2Left	Horizontal-2-Horizontal	--
--																									--
--	~229	L		4		3		Top2Bottom	Left2Right	Vertical-2-Horizontal	--
--	~240	L		5		2		Top2Bottom	Left2Right	Vertical-2-Horizontal	--
--	~253	L		6		1		Top2Bottom	Left2Right	Vertical-2-Horizontal	--
--	~267	L		7		0		Top2Bottom	Left2Right	Vertical-2-Horizontal	--
-- 																								--	
--	~274	L		8		0		Top2Bottom	Right2Left	Vertical-2-Horizontal	--
--	~287	L		9		1		Top2Bottom	Right2Left	Vertical-2-Horizontal	--
--	~300	L		10		2		Top2Bottom	Right2Left	Vertical-2-Horizontal	--
--	~312	L		11		3		Top2Bottom	Right2Left	Vertical-2-Horizontal	--
--																									--
--	~319	L		12		3		Top2Bottom	Right2Left	Horizontal-2-Horizontal	--
--	~331	L		13		2		Top2Bottom	Right2Left	Horizontal-2-Horizontal	--
--	~343	L		14		1		Top2Bottom	Right2Left	Horizontal-2-Horizontal	--
--	~356	L		15		0		Top2Bottom	Right2Left	Horizontal-2-Horizontal	--
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Saucer Video Enable				 														--
-- Inverting the Saucer Enable signal for downstream logic						--
-- where it is applicable to have the inverse as "active"						--
-----------------------------------------------------------------------------	
f4_8 <= not MemBrd_K; 	-- f4_8 is (inverse) active	
								-- when saucer video should be
								-- displayed	

-----------------------------------------------------------------------------
-- IMAGE READ: Select horizontal diode matrix slice								--	
-- 7486 xor 																					--
-- diode matrix "horizontal slice" (row) selector									--
-- Input to 74154 for both saucer, rocket, regarding which 						--
-- horizontal slice to read image pixel data from									--
-- 4-bit binary number that can address 16 slices (0-15) 						--
-----------------------------------------------------------------------------	
a5_8 	<= a6_9 xor f4_4;  	-- D ; horizontal slice number bit 3
a5_11 <= b6_9 xor f4_4; 	-- C ; horizontal slice number bit 2
a5_3 	<= c6_9 xor f4_4;  	-- B ; horizontal slice number bit 1
a5_6 	<= d6_9 xor f4_4; 	-- A ; horizontal slice number bit 0

-----------------------------------------------------------------------------
-- IMAGE READ: Select vertical diode matrix slice									--	
-- 7486 xor 																					--
-- diode matrix "vertical slice" (colum) selector									--
--																									--	
-- Input to 74151 for saucer, and 74150:s for rocket, regarding which 		--
-- vertical slice to read image pixel data from										--
-- 4-bit binary number that can address 16 slices (0-15) 						--
-- 74151 is only using three bits (0-2); and can consequently address 8		--
-- slices 																						--
-- 74151: Only 5 inputs are connected to diode matrix slices					--
-- 74150:s Only 12 inputs are connected to diode matrix slices					--
-- The other inputs that are not connected to any slice will only give		--
-- "black" pixels when addressed															--  	
-----------------------------------------------------------------------------	
b5_8 	<= a6_7 xor c5_11;  	-- D ; vertical slice number bit 3
b5_11 <= b6_7 xor c5_11; 	-- C ; vertical slice number bit 2
b5_3 	<= c6_7 xor c5_11; 	-- B ; vertical slice number bit 1
b5_6 	<= d6_7 xor c5_11;  	-- A ; vertical slice number bit 0

-----------------------------------------------------------------------------
-- IMAGE READ: Select saucer vertical diode matrix slice 						--
-- 74151	8-Line To 1-Line Data Selector / Multiplexer								--
-- DECODE VERTICAL DIODE IMAGE LINES													--
-- SVER(0) is pin 11  A																		--
-- SVER(1) is pin 10  B																		--
-- SVER(2) is pin  9  C 																	--
-----------------------------------------------------------------------------
SVER(0) <= b5_6;  -- 74151 pin11  A
SVER(1) <= b5_3; 	-- 74151 pin10  B
SVER(2) <= b5_11; -- 74151 pin9   C 

-- DECODE
saucer_ver <=
	0 when SVER ="000" else     
	1 when SVER ="001" else     
   2 when SVER ="010" else
   3 when SVER ="011" else
	4 when SVER ="100" else
	5 when SVER ="101" else
	6 when SVER ="110" else
	7 ;	

-----------------------------------------------------------------------------
-- IMAGE READ: Select saucer horizontal diode matrix slice  					--
-- SAUCER 74153 4-Line To 16-Line Decoders/Demultiplexers						--
-- DECODE HORIZONTAL DIODE IMAGE LINES													--
-----------------------------------------------------------------------------
saucer_hor <= rocket_hor;	-- horizontal decoding the same as for rocket;
									-- use the same 74154 to "activate" a
									-- horizontal slice of diodes

-----------------------------------------------------------------------------
-- IMAGE READ: SAUCER DIODE MATRIX & 74151: 											--
-- emulates the diode matrix and the part of 74151 that reads the matrix	--
-- value 																						--
-- corresponds to activating a specific horizontal slice							--
-- and reading resulting "value" for a specific vertical slice 				--
-----------------------------------------------------------------------------
saucer_image: saucer_diode_image
port map (MemBrd_K, saucer_ver, saucer_hor,
			 saucer_diode_rotating_light, saucer_image_bit);				 
	
	
-----------------------------------------------------------------------------
-- IMAGE READ: SAUCER VIDEO ENABLE														--
-- Letting saucer image pass through to screen output								--
-- This "filter" prevents the saucer image from being written 					--
-- repeatedly when it shouldnt															--
-----------------------------------------------------------------------------
c5_6 <= saucer_image_bit nand f4_8;		-- f4_8 is only active when
													-- saucer should be displayed

-----------------------------------------------------------------------------
-- IMAGE READ: Select rocket horizontal diode matrix slice 						-- 
-- DECODE HORIZONTAL DIODE IMAGE LINES					 								--
-- 74154 connection																			--
-- RHOR(0) is pin 23  A																		--
-- RHOR(1) is pin 22  B																		--
-- RHOR(2) is pin 21  C																		--
-- RHOR(3) is pin 20  D																		--
-----------------------------------------------------------------------------
RHOR(0) <= a5_6;  -- 74154 pin23  A
RHOR(1) <= a5_3;  -- 74154 pin22  B
RHOR(2) <= a5_11; -- 74154 pin21  C
RHOR(3) <= a5_8;  -- 74154 pin20  D

-- DECODE
rocket_hor <= 
	0 	when RHOR ="0000" else     
	1 	when RHOR ="0001" else     
   2 	when RHOR ="0010" else
   3 	when RHOR ="0011" else
	4 	when RHOR ="0100" else
	5 	when RHOR ="0101" else
	6  when RHOR ="0110" else
	7  when RHOR ="0111" else
	8  when RHOR ="1000" else
	9  when RHOR ="1001" else
	10 when RHOR ="1010" else
	11 when RHOR ="1011" else
	12 when RHOR ="1100" else
	13 when RHOR ="1101" else
	14 when RHOR ="1110" else
	15;
	
-----------------------------------------------------------------------------
-- IMAGE READ: Select rocket vertical diode matrix slice 						--
-- 74150's	- all four																		-- 
-- DECODE VERTICAL DIODE IMAGE LINES 													--
-- RVER(0) is pin 15  A																		--
-- RVER(1) is pin 14  B																		--
-- RVER(2) is pin 13  C																		--
-- RVER(3) is pin 11  D																		--
-----------------------------------------------------------------------------
RVER(0) <= b5_6;  -- 74150 pin15  A
RVER(1) <= b5_3;  -- 74150 pin14  B
RVER(2) <= b5_11; -- 74150 pin13  C
RVER(3) <= b5_8;  -- 74150 pin11  D

-- DECODE	
rocket_ver <= 
	0 	when RVER ="0000" else     
	1 	when RVER ="0001" else     
   2 	when RVER ="0010" else
	3 	when RVER ="0011" else
	4  when RVER ="0100" else
	5  when RVER ="0101" else
	6  when RVER ="0110" else
	7  when RVER ="0111" else
	8  when RVER ="1000" else
	9  when RVER ="1001" else
	10 when RVER ="1010" else
	11 when RVER ="1011" else
	12 when RVER ="1100" else
	13 when RVER ="1101" else
	14 when RVER ="1110" else
	15;

-----------------------------------------------------------------------------
-- IMAGE READ: ROCKET DIODE MATRIX & 74150: Rocket Image 0 - 3					--
-- emulates the diode matrix and the part of 74150 that reads the matrix	--
-- value 																						--
-- corresponds to activating a specific horizontal slice							--
-- and reading resulting "value" for a specific vertical slice 				--
-----------------------------------------------------------------------------
rocket_image_0: rocket_diode_images
port map (0, rocket_hor,rocket_ver,
			diode_left_column, diode_right_column, diode_image0_bit);

rocket_image_1: rocket_diode_images
port map (1, rocket_hor,rocket_ver,
			diode_left_column, diode_right_column, diode_image1_bit); 

rocket_image_2: rocket_diode_images
port map (2, rocket_hor, rocket_ver,
			diode_left_column, diode_right_column, diode_image2_bit);

rocket_image_3: rocket_diode_images
port map (3, rocket_hor, rocket_ver,
			diode_left_column, diode_right_column, diode_image3_bit); 

	
-----------------------------------------------------------------------------	
-- IMAGE READ: Rocket Engine "Flame" Logic											--
-----------------------------------------------------------------------------
diode_row_1 <= '0' when rocket_hor = 0 else '1';

diode_row_3 <= '0' when rocket_hor = 2 else '1';

e1_1 	<= f2_6 nor diode_row_1; 
e1_4 	<= f2_8 nor diode_row_3;

f3_8 	<= e1_1 nand MemBrd_S;
f3_11 <= e1_4 nand MemBrd_S;

diode_left_column <= not f3_8;	-- send info to diode image component
											-- (in real circuit expecting active low, 
											-- in this realization - active high)


diode_right_column <= not f3_11;	-- send info to diode image component
											-- (in real circuit expecting active 
											-- low, in this realization - active high) 


-----------------------------------------------------------------------------
-- THRUST CIRCUITRY: Create thrust pulse train										--
-----------------------------------------------------------------------------
f2_6 <= thrust_and_rotate_clk;		-- emulating the clk that is generated
												-- by the digital and discrete/analogues

f2_8 <= not thrust_and_rotate_clk;	-- emulating the clk that is generated
												-- by the digital and discrete/analogues

-----------------------------------------------------------------------------
-- IMAGE READ: Saucer "Rotating Lights" Logic										--
-- using a signal to create a pulse train to drive rotating light				--
-- frequency																					--
-- the pulse train is derived from reading a bit of the rocket's				--
-- horizontal scan counter 																--
-----------------------------------------------------------------------------
saucer_diode_rotating_light <= not MemBrd_H;

-----------------------------------------------------------------------------
-- IMAGE READ: X-Y AXIS IMAGE READ CONTROL - bit 3 processing					--
-- A6, 74153 																					-- 
-- 4-line to 1-line data selector/multiplexor 										--
-- (a,b) select c0 to c3																	--
-- (0,0):c0=>y, (0,1):c1=>y, (1,0):c2=>y, (1,1):c3=>y								--
--																									--
-- Rocket & Saucer hor & vert bit 3 processing										--
--																									--
-- OVERALL: A6, B6, C6, D6 Logic															--
-- Forwards which horizontal and vertical position to read from the saucer	--
-- and rocket's images - ie which pixel from the 16x8 or 16x16 image 		--
-- grid to output to screen - and whether to read the rocket's image’s		--
-- horizontal slices as horizontal slices onto the screen or reading the	--	
-- vertical slices as horizontal slices onto screen.								--
-- The saucer is always default to reading the vertical slices as				--
-- horizontal slices onto screen.														--
--																									--
-- The positions are given as 4-bit values (0000 - 1111; 16 positions)		--
-- and each chip (A6, B6, C6, D6) manages one of the bits each; for both	--
-- the vertical and the horizontal position for the saucer and the rocket.	--
-- A6 - bit 3, B6 - bit 2, C6 - bit 1, D6 - bit 0,									--
--																									--
-- The output can only be either rocket or saucer positions, so a set 		--
-- of selectors choose between saucer and rocket and also determine			--	
-- whether to read the rocket's image’s horizontal slices as horizontal		--
-- slices onto the screen or reading the vertical slices as horizontal		--
-- slices onto screen.																		--
-- The saucer is always default to reading he vertical slices as				--
-- horizontal slices onto screen.						 								--
-- 																								--
-- The input is fed by rocket's motion counter's horizontal and vertical	--
-- lower bits (0-3 for horizontal / x-axis and 8-11 for vertical / y-axis)	--
-- and likewise from the saucer's motion counter									--
-- These feeds are constantly active and contribute to overall image pixel	--
-- read, but at a further stage, in the Memory Board, image video is only	--
-- "allowed" when the rocket's 16x16 image position or one of the 			--	
-- saucers's two 16x8 images positions matches the TV beams current 			--
-- position as it	sweeps across the TV screen. This is done via 				--
-- Rocket Enable and Saucer Enable flags.	Otherwise images would be 			--
-- repeated across the screen for every 16 pixels and 16 lines (8 lines		--
-- for saucer)																					--
--																									--
-- The selector input combination a and b determines which input to pass 	--
-- through to rest of the graphics circuitry.										--
-- The way a and b are fed by upstream logic and how the data inputs			--
-- are "reverse connected" gives the following effect:							--
-- b - determines whether saucer or rocket should be fed to screen			--
-- a - determines whether the rocket's horizontal image slices should 		--
--	be displayed on the x axis or y axis on the screen and consequently 		--
-- whether the rocket's vertical image slices should be displayed on the	--
-- y or x axis. This is the basis for one subsset of the 32 potential 		--
-- rocket images.																				--
-- Selector a does not vary for saucer image as it is pre-set by 				--
-- up stream logic whenever selector b is set to display saucer (c5_3)		--
-----------------------------------------------------------------------------
a6_10 <= MemBrd_C;	-- data input 2C0 rocket horizontal bit 3 
a6_11 <= MemBrd_D; 	-- data input 2C1 rocket vertical bit 3
a6_12 <= MemBrd_A; 	-- data input 2C2 saucer vertical bit 3
a6_13 <= MemBrd_B; 	-- data input 2C3 saucer horizontal bit 3

a6_6 	<= a6_11;		-- data input 1C0 rocket vertical bit 3
a6_5 	<= a6_10;	 	-- data input 1C1 rocket horizontal bit 3
a6_4 	<= a6_13; 		-- data input 1C2 saucer horizontal bit 3
a6_3 	<= a6_12; 		-- data input 1C3 saucer vertical bit 3

a6_14 <= c5_3;    	-- A select INPUT depending on rotation
a6_2 	<= f4_8;     	-- B select INPUT depends on saucer enable

a6_7 <= -- output y1
	a6_6 when (a6_14='0' and a6_2='0') else     
   a6_5 when (a6_14='1' and a6_2='0') else
   a6_4 when (a6_14='0' and a6_2='1') else
   a6_3;

a6_9 <= -- output y2
	a6_10 when (a6_14='0' and a6_2='0') else     
   a6_11 when (a6_14='1' and a6_2='0') else
   a6_12 when (a6_14='0' and a6_2='1') else
   a6_13;		  

-----------------------------------------------------------------------------
-- IMAGE READ: X-Y AXIS IMAGE READ CONTROL - bit 2 processing					--
-- B6, 74153 																					-- 
-- 4-line to 1-line data selector/multiplexor 										--
-- (a,b) select c0 to c3																	--
-- (0,0):c0=>y, (0,1):c1=>y, (1,0):c2=>y, (1,1):c3=>y								--
--																									--
-- For overall logic refer to A6															--
-----------------------------------------------------------------------------	
b6_10 <= MemBrd_4; 	-- data input 2C0 rocket horizontal bit 2
b6_11 <= MemBrd_5; 	-- data input 2C1 rocket vertical bit 2 
b6_12 <= MemBrd_2; 	-- data input 2C2 saucer vertical bit 2
b6_13 <= MemBrd_3; 	-- data input 2C3 saucer horizontal bit 2

b6_6 	<= b6_11 ;		-- data input 1C0 rocket vertical bit 2
b6_5 	<= b6_10; 		-- data input 1C1 rocket horizontal bit 2
b6_4 	<= b6_13; 		-- data input 1C2 saucer horizontal bit 2
b6_3 	<= b6_12; 		-- data input 1C3 saucer vertical bit 2

b6_14 <= c5_3;   		-- A select INPUT 
b6_2 	<= f4_8;			-- B select INPUT depends on saucer enable

b6_7 <=  -- output y1
	b6_6 when (b6_14='0' and b6_2='0') else     
   b6_5 when (b6_14='1' and b6_2='0') else
   b6_4 when (b6_14='0' and b6_2='1') else
   b6_3;

b6_9 <=   -- output y2
	b6_10 when (b6_14='0' and b6_2='0') else     
   b6_11 when (b6_14='1' and b6_2='0') else
   b6_12 when (b6_14='0' and b6_2='1') else
   b6_13;		  	
	
-----------------------------------------------------------------------------
-- IMAGE READ: X-Y AXIS IMAGE READ CONTROL - bit 1 processing					--
-- C6, 74153 																					-- 
-- 4-line to 1-line data selector/multiplexor 										--
-- (a,b) select c0 to c3																	--
-- (0,0):c0=>y, (0,1):c1=>y, (1,0):c2=>y, (1,1):c3=>y								--
--																									--
-- For overall logic refer to A6															--
-----------------------------------------------------------------------------	
c6_10 <= MemBrd_H; 	-- data input 2C0 rocket horizontal bit 1
c6_11 <= MemBrd_J; 	-- data input 2C1 rocket vertical bit 1
c6_12 <= MemBrd_E; 	-- data input 2C2 saucer vertical bit 1
c6_13 <= MemBrd_F; 	-- data input 2C3 saucer horizontal bit 1

c6_6 	<= c6_11 ;		-- data input 1C0 rocket vertical bit 1
c6_5 	<= c6_10; 		-- data input 1C1 rocket horizontal bit 1
c6_4 	<= c6_13; 		-- data input 1C2 saucer horizontal bit 1
c6_3 	<= c6_12; 		-- data input 1C3 saucer vertical bit 1

c6_14 <= c5_3;   		-- A select INPUT 
c6_2 	<= f4_8; 		-- B select INPUT depends on saucer enable

c6_7 <= -- output y1
	c6_6 when (c6_14='0' and c6_2='0') else     
   c6_5 when (c6_14='1' and c6_2='0') else
   c6_4 when (c6_14='0' and c6_2='1') else
   c6_3;

c6_9 <=   -- output y2
	c6_10 when (c6_14='0' and c6_2='0') else     
   c6_11 when (c6_14='1' and c6_2='0') else
   c6_12 when (c6_14='0' and c6_2='1') else
   c6_13;		  		

-----------------------------------------------------------------------------
-- IMAGE READ: X-Y AXIS IMAGE READ CONTROL - bit 0 processing					--
-- D6, 74153 																					-- 
-- 4-line to 1-line data selector/multiplexor 										--
-- (a,b) select c0 to c3																	--
-- (0,0):c0=>y, (0,1):c1=>y, (1,0):c2=>y, (1,1):c3=>y								--
--																									--
-- For overall logic refer to A6															--
-----------------------------------------------------------------------------	
d6_10 <= MemBrd_8; 	-- data input 2C0 rocket horizontal bit 0
d6_11 <= MemBrd_9; 	-- data input 2C1 rocket vertical bit 0
d6_12 <= MemBrd_6; 	-- data input 2C2 saucer vertical bit 0
d6_13 <= MemBrd_7; 	-- data input 2C3 saucer horizontal bit 0

d6_6 	<= d6_11 ;		-- data input 1C0 rocket vertical bit 0
d6_5 	<= d6_10; 		-- data input 1C1 rocket horizontal bit 0
d6_4 	<= d6_13; 		-- data input 1C2 saucer horizontal bit 0
d6_3 	<= d6_12; 		-- data input 1C3 saucer vertical bit 0

d6_14 <= c5_3; 		-- A select INPUT 
d6_2 	<= f4_8;  		-- B select INPUT depends on saucer enable

d6_7 <= -- output y1
	d6_6 when (d6_14='0' and d6_2='0') else     
   d6_5 when (d6_14='1' and d6_2='0') else
   d6_4 when (d6_14='0' and d6_2='1') else
   d6_3;

d6_9 <=   -- output y2
	d6_10 when (d6_14='0' and d6_2='0') else     
   d6_11 when (d6_14='1' and d6_2='0') else
   d6_12 when (d6_14='0' and d6_2='1') else
   d6_13;			

-----------------------------------------------------------------------------
-- IMAGE READ LOGIC: ROCKET IMAGE SELECTOR											--
-- E2, 74153							                          						-- 
-- 4-line to 1-line data selector/multiplexor 										--
-- with strobe logic, to select output pin 9 and/or pin 7 						--
--																									--
-- Logic to determine which rocket diode image to use (to send to screen).	--
-- In the design the "image read direction" and "axis setup" operate			--
-- on all four images simultaneously - and the final stage is to select		--
-- which image to use (rather than selecting image first, and then apply	--
-- direction and axis logic).																--	
-- Please refer to comment section "GENERAL INFORMATION" above regarding 	--
-- how rocket orientation position drives selection of base image.			--	
-- 																								--
-- Current image bit from all four rocket diode images are sent				--
-- simultaneously to the  multiplexor 													--
-- a and b selectors (e2_14 and e2_1) determine which image to output 		--
-- The selectors are fed by bit 0 and bit 1 (00, 01, 10, 11) from the		--
-- image counter (E4, 74193). 															--
-- Strobe g1 and g2 (e2_15 and e2_2) are used to select whether images		--
-- are output straight (00=image 0, 01=image 1, 10=image 2, 11=image 3) or --
-- "reversed"  (00=image 3, 01=image 2, 10=image 1, 11=image 0).				--
-- The strobes are fed by bit 3 from the image counter (E4, 74193) 			--
-- as straight and as inverse (which keep images output mutually switched	--
-- on/off).																						--
-- As the image bits are mirrored/reversed on one of the data inputs		 	--	
-- and straight on the other data inputs, selecting one or the other 		--
-- input to have active output achives the effect of "reversing" image.		--
--																									--
-- output from E4 74193 to control image selection									--
--  QD 	 QC 	 QB 	 QA		Image	to output										--
-- e4_7 	e4_6 	e4_2 	e4_3		(e9_9 and e_7)											--
--  X		 0		 0		 0					0													--
--  X	    0     0     1					1													--
--  X     0     1     0					2													--
--  X     0     1     1					3													--
--  X     1     0     0					3													--
--  X     1     0     1					2													--
--  X     1     1     0					1													--
--  X     1     1     1					0													--
-----------------------------------------------------------------------------
e2_10 <= diode_image3_bit;		-- image input in normal order 0->3
e2_11 <= diode_image2_bit;		-- image input in normal order 0->3
e2_12 <= diode_image1_bit;		-- image input in normal order 0->3
e2_13 <= diode_image0_bit;		-- image input in normal order 0->3

e2_3 	<= e2_10;					-- image input in "reverse" order 3->0
e2_4 	<= e2_11;					-- image input in "reverse" order 3->0
e2_5 	<= e2_12;					-- image input in "reverse" order 3->0
e2_6 	<= e2_13;					-- image input in "reverse" order 3->0

e2_14 <= e4_3;						-- a select
e2_2 	<= e4_2;						-- b select
										-- controlling which image to output

e2_1 	<= e4_6;						-- logic for choosing either normal image read
h2_10 <= not e4_6;				-- or
e2_15 <= h2_10;					-- reversed image read


e2_7x <= -- output y1; normal image read/output
	e2_6 when (e2_14='0' and e2_2='0') else     
   e2_5 when (e2_14='1' and e2_2='0') else
   e2_4 when (e2_14='0' and e2_2='1') else
   e2_3;

e2_7 <= e2_7x and (not e2_1); -- strobe from pin 1, active low
	 
e2_9x <=   -- output y2; "reversed" image read/output
	e2_10 when (e2_14='0' and e2_2='0') else     
   e2_11 when (e2_14='1' and e2_2='0') else
   e2_12 when (e2_14='0' and e2_2='1') else
   e2_13;			
	
e2_9 <= e2_9x and (not e2_15); -- strobe from pin 15, active low

-----------------------------------------------------------------------------
-- Video Out Logic													 						--
-----------------------------------------------------------------------------
e1_10 <= e2_9 nor e2_7; 		-- merging normal image read and reversed 
										-- image read
										-- as they are mutually on/off
										-- the images can never be in conflict					

e1_13 <= MemBrd_10 nor e1_10; -- only displaying rocket if it is enabled
										-- MemBrd_10 is "rocket enable", which
										-- is active low when the TV beam is
										-- passing by any of the pixel's screen 
										-- positions in the rocket's 16x16 image grid
										-- and rocket is allowed to be displayed (not
										-- directly after collision/explosion or
										-- game is not playing)	

h2_8 <= not e1_13; 				-- inverting to get signal chain correct

e5_3 <= h2_8 nand c5_6; 		-- merging with saucer image output

MemBrd_P <= e5_3;  				-- Resulting video out, saucer or rocket
										-- pixel level

-----------------------------------------------------------------------------
-- Rotation Circuitry: Rotation input logic											--
-- Rotation input logic	- incl sending rotation signal to sound unit  		-- 
-----------------------------------------------------------------------------
-- 7450 : rotate_clock_wise
f6_8 <=  not ((explosion_rotate_clk and MemBrd_R) or
					(thrust_and_rotate_clk and MemBrd_M)); 

-- 7400 : rotate_counter_clock_wise
e5_6 <= thrust_and_rotate_clk nand MemBrd_N; 

-- 7402
e6_4 <= not (MemBrd_N nor MemBrd_M); 

-- simplified output to audio, do not need other freq input
-- as the audio is generated from audio samples
-- in this case K1 only triggers a sample.
-- otherwise include logic as per schematics to
-- get sound frequency input via e6_13.
e6_1 <= e6_4; 
MemBrd_K1 <= e6_1;

-- DarFPGA 2017 : original freq input
e6_13 <= thrust_and_rotate_clk nor MemBrd_2;
turn_sound <= e6_13 nor (not e6_4);

-----------------------------------------------------------------------------
-- Rocket orientation register: Keep & update rocket orientation 				--
-- E4, 74193							                          						-- 
-- synchronous 4-bit up/down counter (dual clock with clear)					--
-- binary counter 																			--
-- Implemented as a state machine to makes things easy to get carry			--
-- and borrow behaving properly on clock edges										--
--																									--
--	OVERALL:																						--
-- The rocket can be in any of 32 positions. The current rocket position 	--
-- is stored as two parameters; one flag (right / left) and a position		--	
-- number (0 to 15).																			--
-- 																								--	
-- This counter holds the position number 0-15, and can move in one step	--
-- increments (up/down) between the numbers 											--
--																									--
-- When the counter reaches 15 and is increased by 1, the right/left flag	--
-- changes direction from right to left (or left to right) and the counter	--
-- is reset to 0. Similar logic follows when the counter reaches 0 and 		--
-- is decreaed by 1; direction change + reset to 15.								--
--																									--
-- Counter value:	0000 -> 1111 (0-15)													--
-- Represents which position the rocket is in for either 0-180 degrees		--
--	or 180-360 degrees. 																		--
--	The carry/borrow bits that	are set as the counter moves between			--
-- 0000 and 1111 are used to set a flag (flip-flop) that indicates			--
-- whether the rocket is in sector 0-180 degrees or 180-360 degrees			--
--																									--
-- Counter specifics:																		--
-- clear not used																				--
-- loadn not used																				--	
-- Data inputs not used																		--
-- +1 occurs on count up rising edge, and count_down is high					--	
-- carry goes from high to low when falling edge of count_up 					--
-- -1 occurs on count down rising edge, and count_up is high 					--
-- borrow occurs on (goes low) on count down falling edge 						--
-----------------------------------------------------------------------------
e4_4 <= e5_6; -- down clk  needs to be active low
e4_5 <= f6_8; -- up clk needs to be active low

process (super_clk)
begin
if rising_edge (super_clk) then
	e4_4_old <= e4_4;
	e4_5_old <= e4_5;

	case state is
		when UNSIGNED_UP_DOWN =>
			e4_12 <= '1';
			e4_13 <= '1';
			if (e4_5_old = '0') and (e4_5 = '1') then
			-- PRIO for UP clock rising edge of count up clock => need to 
			-- increment counter 
				if e4_count = 14 then 
					state <= READY_FOR_CARRY;
					e4_count <= "1111";
				else
					state <= UNSIGNED_UP_DOWN;
					e4_count <= e4_count + 1;
				end if;
			elsif (e4_4_old = '0') and (e4_4 = '1') then
			-- rising edge of count down clock => need to decrease counter
				if e4_count = 1 then 
					state <= READY_FOR_BORROW;
					e4_count <= "0000";
				else
					state <= UNSIGNED_UP_DOWN;
					e4_count <= e4_count - 1;
				end if;
			end if;	
		
		when READY_FOR_CARRY =>   -- e4_count is "1111"
			e4_12 <= '1';
			e4_13 <= '1';
			if (e4_5_old = '1') and (e4_5 = '0') then
			-- PRIO for UP clock falling edge of count up clock => need to set 
			-- carry flag 
				e4_12 <= '0';  -- setting carry flag
				state <= CARRY;
			elsif (e4_4_old = '0') and (e4_4 = '1') then
			-- rising edge of count down clock => need to decrease counter
				e4_count <= e4_count - 1;
				state <= UNSIGNED_UP_DOWN;
			end if;		
			
		when READY_FOR_BORROW =>   -- e4_count is "0000"
			e4_12 <= '1';
			e4_13 <= '1';
			if (e4_5_old = '0') and (e4_5 = '1') then
			-- PRIO for UP clock; rising edge of count UP clock => need to 
			-- increase counter
				e4_count <= e4_count + 1;
				state <= UNSIGNED_UP_DOWN;			
			elsif (e4_4_old = '1') and (e4_4 = '0') then
			-- falling edge of count down clock => need to set borrow flag 
				e4_13 <= '0';  -- setting borrow flag
				state <= BORROW;

			end if;		
			
		when CARRY =>     
			e4_12 <= '0';
			e4_13 <= '1';
			if (e4_5_old = '0') and (e4_5 = '1') then
			-- rising edge of count up clock => need to clear carry flag and 
			-- increment
				e4_12 <= '1';  -- clear carry flag
				e4_count <= "0000";
				state <= READY_FOR_BORROW;
			end if;	
			
		when BORROW =>
			e4_12 <= '1';
			e4_13 <= '0';
			if (e4_4_old = '0') and (e4_4 = '1') then
			-- rising edge of count down clock => need to clear borrow flag and 
			-- decrease
				e4_13 <= '1';  -- clear carry flag
				e4_count <= "1111";
				state <= READY_FOR_CARRY;
			end if;				

		when others =>          
			e4_12 <= '1';
			e4_13 <= '1';			
			state <= UNSIGNED_UP_DOWN;
			e4_count <= "0000";
				
	end case;
end if;	
end process;
			
e4_2 <= e4_count(1); -- Qb
e4_3 <= e4_count(0); -- Qa
e4_6 <= e4_count(2); -- Qc
e4_7 <= e4_count(3); -- Qd

-----------------------------------------------------------------------------
-- Rocket orientation register: Indicate move fr. right to left or reverse	--
-- Bridge from up/down counter to flip flop									  		--
-- Signals when to move between 0<-<180 and 180<-<360 degree sectors			--
-- which is equivalent to whether rocket is pointing to the right or to		--
-- the left. 																					--
-----------------------------------------------------------------------------
e5_8 <= e4_13 nand e4_12; 	-- merges carry and borrow to signal
									-- the rocket has moved between 0<-<180 and
									-- 180<-<360 degree sectors
									-- (changing left-to-right or right-to-left)

-----------------------------------------------------------------------------
-- Rocket orientation register: Set right-left flag								--
-- E3 7476																				  		-- 
-- Flip flop that acts as a flag to indicate whether the rocket is 			--
-- pointing to the right (0<-<180 degrees)or											--
-- to the left (180<-<360 degrees)														--
--																									--
-- e3_14:																						--
-- 0 - rocket pointing to the left														--
-- 1 - rocket pointing to the right														--
--																									--
-- e3_15:																						--
-- 0 - rocket pointing to the right														--
-- 1 - rocket pointing to the left														--
-----------------------------------------------------------------------------
e3_1 <= e5_8;

process (super_clk)
begin
if rising_edge (super_clk) then
	e3_1_old <= e3_1;
	if (e3_1_old = '1') and (e3_1 = '0') then
	-- falling edge, j and k permanent high => toggle
		e3_15 <= not e3_15;
		e3_14 <= not e3_14;
	end if;
end if;
end process;

-----------------------------------------------------------------------------
-- IMAGE READ LOGIC: Determine Image Read Direction								--
-- Logic to determine when to read the diode images "left to right" and 	--
-- when to read the diode images "right to left".									--
-- Please refer to comment section "GENERAL INFORMATION" above regarding 	--
-- how rocket orientation position drives image read direction.				--  
--																									--
-- c5_11:																						--	
-- '0' read image "left to right"														--
-- '1' reads "right to left" (inverting read line input)							--
-----------------------------------------------------------------------------
f4_10 <= not e4_7;
e5_11 <= f4_10 nand e4_6;			-- For rocket:
											-- determines whether
											-- the rocket is in range:
											-- 45< - <90 degrees or 
											-- 225< - <270 degrees 
											-- to give it value '0'
											-- all other angels are giving value '1'
											
d5_11 <= e5_11 xor e3_15;			-- For rocket:
											-- all angels in range <0 - <180 degrees
											-- maintains it read direction value
											-- otherwise the value is inversed.
											-- this results in angels 45< - <90 degrees,
											-- 180< - <225 degrees, 270< - <360 degrees
											-- are being read "right to left"

c5_11 <= d5_11 nand MemBrd_K;		-- if saucer is being drawn	
											-- (saucer video enabled: MemBrd_K) then
											-- default read direction required by
											-- saucer image (right to left) is set
											-- otherwise d5_11 signal is inversed

-----------------------------------------------------------------------------
-- IMAGE READ LOGIC: Determine Image Activation Direction						--
-- Logic to determine when to activate the diode images top-to-botton and 	--
-- when to activate images bottom-to-top.												--
-- Please refer to comment section "GENERAL INFORMATION" above regarding 	--
-- how rocket orientation position drives activation direction					-- 
--  																								--	
-- c5_8:																							--
-- '1' activates image "top to bottom" via 74154									--
-- '0' activates "bottom to top" via 74154 by inverting activation line 	--
-- input.																						--
-----------------------------------------------------------------------------
e6_10 <= e4_7 nor e4_6;			-- For rocket:
										-- verify if image no is 0-3 (out of 0-15); 
										-- which could be either first four images
										-- in 0< - <45 degrees 
										-- or first four images 180< - <225 degrees
										
d5_8 	<= e3_15 xor e6_10;		-- For rocket:
										-- excludes 180< - < 225 degrees 
										-- and adds 225< - <360 degrees
										-- this is done via e3_15
										-- e3_15 = '1' means images are in range:
										-- 180< - <360 degrees.	
										-- Result is that rocket pointing:
										-- 0< - <45 degrees or 225< - <360 degrees
										-- is read Top to Bottom.
										-- Otherwise Bottom to Top.

c5_8 	<= MemBrd_K nand d5_8; 	-- if saucer is being drawn then default
										-- activation direction required by saucer
										-- image (bottom up)
										-- otherwise signal is just inversed
										
f4_4 	<= not c5_8; 				-- re-inverses signal
										-- to fit follow-on logic

-----------------------------------------------------------------------------
-- IMAGE READ LOGIC: Determine Activation and Read Axis							-- 
-- Logic to determine whether the horizontal diode image slices are read 	--
-- as horizontal slices onto screen OR the vertical diode image slices		--
-- are read as horizontal image slices onto screen									-- 
-- Please refer to comment section "GENERAL INFORMATION" above regarding 	--
-- how rocket orientation position drives axis setup								--
--																									--
-- c5_3:																							--
-- '0':	Reading the diode image’s horizontal slices (rows) as horizontal 	--
--			slices (rows) onto screen														--
--	'1'	Reading the	diode image’s  vertical slices (columns) as				--
---		horizontal slices (rows) onto screen										--
-----------------------------------------------------------------------------
d5_3 <= e4_6  xor e4_7;			-- For rocket:
										-- whenever image no is between 4 - 11
										-- meaning 45< - <135 degree or
										-- 225< - <315  degrees
										-- d5_3 is set to use the horizontal part of 
										-- the diode matrix as the "on screen" 
										--	horizontal part OR the vertical part
										-- of the diode matrix as the "on screen" 
										-- horizontal part
										-- '0' activates diode matrix row by row and	
										-- and for each row read pixel by pixel =>
										-- horizontal images slices are read onto
										-- screen as horizontal slices
										-- '1' activates diode matrix row and reads
										-- pixel in current column, and move through
										--	all rows in this manner until all pixels
										-- for a column is read, then repeat this 
										-- process column by column => vertical image
										-- slices are read onto screen as horizontal
										-- slices

c5_3 <= MemBrd_K nand d5_3; 	-- if saucer is being drawn then default to
										-- activation/read axis required by saucer
										-- image:read vertical diode part as
										--			horizontal
										--  - which is easy to realize just by looking
										-- at the 90 degree tilted saucer diode 
										-- image on the schematics
										-- Otherwise signal is just inversed for rocket
										-- to comply with down stream logic needs.
										
-----------------------------------------------------------------------------
-- Rocket North/South/West/East Indicator: D5_6										-- 
-- Determine whether the rocket is oriented (pointing) very close to			--
-- 0 degrees, 90 degrees, 180 degrees, or 270 degrees								--
-- within two positions on each side of each main direction						--
-- using bit 1 and bit 2 of the image position counter							--
-----------------------------------------------------------------------------
d5_6 <= e4_2 xor e4_6;	-- 0: very close to 0, 90, 180 or 270 degrees
								-- 1: not very close to	0, 90, 180 or 270 degrees

-----------------------------------------------------------------------------
-- THRUST CIRCUITRY: Create thrust pulse train										-- 
-- when thrust button is pressed, create a pulse train that controls			--
-- how fast the rocket's engine flame pulsates, and how fast the rocket's	--
-- velocity level change (gives the feeling of acceleration/deceleration)	--
-----------------------------------------------------------------------------
f3_6 <= not (MemBrd_S and thrust_and_rotate_clk) ; 

-----------------------------------------------------------------------------
-- THRUST CIRCUITRY: audio																	-- 
-- signal to create thrust sound when thrust button is pressed					--
-- not a true implementation of the original schematics 							--
-- as this implementation relies on sampled audio and only needs "button	--
-- press" signal (and no audio frequency)												--
-----------------------------------------------------------------------------
membrd_K2 <= MemBrd_S;  -- thrust audio

-----------------------------------------------------------------------------
-- Horizontal Rocket Velocity: Keep and Update Velocity Level					--
-- 74193																							--
-- Aynchronous 4-bit up/down counter (dual clock with clear)					--
-- Binary counter																				--
-- Counter to hold the current velocity level value, and to increase or		--
-- decrease the value when told to do so												--
-- j4_3 (bit0), j4_2 (bit 1), j4_6 (bit 2) represent the 3 bit					--
-- velocity level																				--
-- j4_7 (bit 3=) represents direction left or right								--
-- 0 - left / 1 - right																		--
--																									--
-- Counting up - decreases rightbound/increases leftbound velocity  			--
-- Counting down - increases rightbound/decreases leftbound velocity 		--
-- When velocity is (0)000 and  counting down, the counter flips to (1)111	--
-- velocity levels gets "reversed/flipped" for rightbound velocity			--
-- j4_7 = 0 (left); 000 means no velocity and 111 means max velocity			--
-- j4_7 = 1 (right); 111 means no velocity and 000 means max velocity		--
--																									--
-- Please note that left/right values are inversed as they reach the  		--
-- Motion Board's Rocket Motion unit (0 = right, 1 = left) to fit the		--
-- Motion Logic  																				--
-----------------------------------------------------------------------------
j4_4 <= j3_6; -- count down (decrease)
j4_5 <= j3_8; -- count up (increase) 
 
process (super_clk)
begin
if rising_edge (super_clk) then
	j4_4_old <= j4_4;
	j4_5_old <= j4_5;
	if (j4_4_old = '0') and (j4_4 = '1') and (j4_5 = '1') then
		j4_count <= j4_count-1;
	elsif  (j4_5_old = '0') and (j4_5 = '1') and (j4_4 = '1') then
		j4_count <= j4_count+1;
	end if;
end if;
end process; 
	
j4_2 <= j4_count(1); -- Qb
j4_3 <= j4_count(0); -- Qa
j4_6 <= j4_count(2); -- Qc
j4_7 <= j4_count(3); -- Qd

-----------------------------------------------------------------------------
-- Horizontal Rocket Velocity: Velocity Level  "Harmonization"		 			--
--																									--
-- j4_3 (bit0), j4_2 (bit 1), j4_6 (bit 2) represent the 3 bit					--
-- velocity level																				--
-- j4_7 represents direction left or right, and due to the use of counter	--
-- the velocity levels gets "reversed/flipped" for rightbound velocity		--
-- j4_7 = 0 (left); 000 means no velocity and 111 means max velocity			--
-- j4_7 = 1 (right); 111 means no velocity and 000 means max velocity		--
--																									-- 
-- By applying XOR logic with the direction signal j4_7, the velocity		--
-- level is "harmonized" so that direction does not matter						--
-- and 000 means no velocity and 111 means max velocity							--
-----------------------------------------------------------------------------
j5_6 	<= j4_3 xor j4_7; 	
j5_11 <= j4_2 xor j4_7; 	
j5_3 	<= j4_6 xor j4_7; 	

-----------------------------------------------------------------------------
-- Horizontal Rocket Velocity: Output Velocity Level and Direction			--
-- 000 represents zero motion and 111 is maximum velocity						--
--																									--
-- Please note that left/right values are inversed as they reach the  		--
-- Motion Board's Rocket Motion unit (0 = right, 1 = left) to fit the		--
-- Motion Logic  																				--
-----------------------------------------------------------------------------
MemBrd_14 <= j5_6; 	-- velocity bit 0
MemBrd_13 <= j5_11; 	-- velocity bit 1
MemBrd_15 <= j5_3; 	-- velocity bit 3
MemBrd_16 <= j4_7; 	-- (0)Left /(1)Right
									
-----------------------------------------------------------------------------
-- Horizontal Rocket Velocity: Max Rightbound Velocity Level Flag				--
-- Logic to flag when max velocity level has been reached						--
-- Flag is used to stop velocity counter from being further decreased		--
-- (for rightbound velocity; decrease counter increases velocity)				--
-----------------------------------------------------------------------------
j6_6 <= not ( j5_6 and j5_11 and j5_3 and j4_7); 	-- when velocity level is
																	-- 111 and direction is
																	-- to the right,
																	-- then flag is set
																	
-----------------------------------------------------------------------------
-- Horizontal Rocket Velocity: Max Leftbound Velocity Level Flag				--
-- Logic to flag when max velocity level has been reached						--
-- Flag is used to stop velocity counter from being further increased		--
-----------------------------------------------------------------------------
inv_4 <= not j4_7; 											-- no markings on
																	-- schematics, call it
																	-- inv_4

j6_8 <= not ( j5_6 and j5_11 and j5_3 and inv_4); 	-- when velocity level is
																	-- 111 and direction is
																	-- to the left,
																	-- then flag is set

-----------------------------------------------------------------------------
-- Horizontal Rocket Velocity: Incr Leftb Velocity/Decr. Rightb velocity	--
-- Sends signal to decrease rightbound velocity until rocket has no right	--
-- bound motion and increase leftbound velocity until max velocity has 		--	
-- been reached.																				--
-- Decreasing velocity in one direction can only be achieved by applying	--
-- thrust in opposite direction.															--
-- Thrust only has impact if the rocket is pointing to the left 				--
-- (180-360 deg.) but is not pointing very close to north/south.				--
-- Logically j3_8 sends signal to velocity counter to increase the counter	--
-- value.																						--
-----------------------------------------------------------------------------
j3_8 <= not ( j6_8 and e3_15 and j2_10);	-- j6_8: flag that indicates
														-- whether max velocity has been
														-- reached or not. If max velocity
														-- then it prevents further
														-- increase	
														-- e3_15: right/left flag
														-- active and allowing for
														-- increse in velocity only 
														-- when set to "left" (1)
														-- j2_10: pulse that gives the 
														-- pace with which the velocity
														-- can change (acceleration/
														-- deceleration) - pulsating
														-- when thrust button is pressed
														-- and rocket is not pointing
														-- very close to north/south	

-----------------------------------------------------------------------------
-- Horizontal Rocket Velocity: Incr Rightb Velocity/Decr. Leftb velocity	--
-- Sends signal to decrease Leftbound velocity until rocket has no left		--
-- bound motion and increase Rightbound velocity until max velocity has 	--	
-- been reached.																				--
-- Decreasing velocity in one direction can only be achieved by applying	--
-- thrust in opposite direction.															--
-- Thrust only has impact if the rocket is pointing to the right 				--
-- (0-180 deg.) but not pointing very close to north/south						--
--																									--
-- Logically j3_6 sends signal to velocity counter to decrease the 			--
-- counter value																				--
-----------------------------------------------------------------------------
j3_6 <= not (j6_6  and j2_10 and e3_14);	-- j6_6: flag that indicates
														-- whether max velocity has been
														-- reached or not. If max velocity
														-- then it prevents further 
														-- counter decrease	
														-- e3_14: right/left flag
														-- active and allowing for
														-- increse in velocity only 
														-- when set to "right"(1)
														-- j2_10: pulse that gives the 
														-- pace with which the velocity
														-- can change (acceleration/
														-- deceleration) - pulsating
														-- when thrust button is pressed
														-- and rocket is not pointing
														-- very close to north/south
														
-----------------------------------------------------------------------------
-- Horizontal Rocket Velocity: Horizontal Thrust Pulse							--
-- Pulse that gives the pace with which the velocity can change				--
-- (acceleration/ deceleration).					                 					--
-- only pulses as long as rocket is not pointing very close to either 		--
-- north or south 																			--
-- f5_13 NOR f3_6																				--
-- 00:1																							--	
-- 01:0																							--
-- 10:0																							--	
-- 11:0																							--
-- when f5_13=1 then the rocket is pointing very close to either north		--
-- or south, the rocket is not seen as being able to create any 				--
-- horizontal thrust, and consequently no pulse is allowed						--
-- when f5_13=0 then thrust pulse is allowed											--
-- The resulting thrust pulse is inverted, but it does not matter				--
-- f3_6 is a continuous pulse train - when the thrust button is pressed		--
-----------------------------------------------------------------------------
j2_10 <= f5_13 nor f3_6; 

-----------------------------------------------------------------------------
-- Horizontal Rocket Velocity:	Near North/South Direction   F5_13			-- 
-- Determines when the rocket is pointing very close to north/south or		--
-- not.																							--
-- "Very close" is within 2 positions from north/south							--
-- Is used to determine whether thrust should have impact on horizontal 	--	
-- velocity	or not																			--
-- "Input":																						--
-- d5_3 flag is active when rocket is pointing in either:						--
-- 45-135 degrees or 225 - 315 degrees													--
-- d5_6 flag is "active low" whenever the rocket is pointing very close to	--
-- either side of: north, south, east or west										--
-- "Output":																					--
-- Combining these flags with NOR gives:												--	
-- 1: when rocket is pointing very close to north or south 						--
-- 0: when rocket is pointing	in any direction except								--
--		for very close to north or south	(then  thrust is allowed to impact	--
--    horizontal velocity)																	--
-----------------------------------------------------------------------------
f5_13 <= d5_6 nor d5_3; 	

-----------------------------------------------------------------------------
-- Vertical Rocket Velocity: Keep and Update Velocity Level						--
-- 74193																							--
-- Aynchronous 4-bit up/down counter (dual clock with clear)					--
-- Binary counter																				--
-- Counter to hold the current velocity level value, and to increase or		--
-- decrease the value when told to do so												--
-- h4_3 (bit0), h4_2 (bit 1), h4_6 (bit 2) represent the 3 bit					--
-- velocity level																				--
-- h4_7 (bit 3=) represents direction up or down									--
-- 0 - up / 1 - down																			--
--																									--
-- Counting up - decreases downward/increases upward velocity  				--
-- Counting down - increases downward/decreases upward velocity		 		--
-- When velocity is (0)000 and  counting down, the counter flips to (1)111 --
-- velocity levels gets "reversed/flipped" for downward velocity				--
-- h4_7 = 0 (up); 000 means no velocity and 111 means max velocity			--
-- h4_7 = 1 (down); 111 means no velocity and 000 means max velocity			--
--																									--
-- Please note that up/down values are inversed as they reach the Motion 	--
-- Board's Rocket Motion unit (0 = down, 1 = up) to fit the Motion Logic  	--
-----------------------------------------------------------------------------
h4_4 <= h3_6; -- count down (decrease) 
h4_5 <= h3_8; -- count up (increase)
 
process (super_clk)
begin
if rising_edge (super_clk) then
	h4_4_old <= h4_4;
	h4_5_old <= h4_5;
	if (h4_4_old = '0') and (h4_4 = '1') and (h4_5 = '1') then
		h4_count <= h4_count-1;
	elsif  (h4_5_old = '0') and (h4_5 = '1') and (h4_4 = '1') then
		h4_count <= h4_count+1;
	end if;
end if;
end process; 

h4_2 <= h4_count(1); -- Qb
h4_3 <= h4_count(0); -- Qa
h4_6 <= h4_count(2); -- Qc
h4_7 <= h4_count(3); -- Qd

-----------------------------------------------------------------------------
-- Vertical Rocket Velocity:	Near East/West Direction   F5_10					-- 
-- Determines when the rocket is pointing very close to east/west or not.	--
-- "Very close" is within 2 positions from  east/west								--
-- Is used to determine whether thrust should have impact on vertical 		--	
-- velocity	or not																			--
-- "Input":																						--
-- f4_12 flag is active when rocket is pointing in either:						--
-- 315< - <45 degrees or 135< - <225 degrees											--
-- d5_6 flag is "active low" whenever the rocket is pointing very close to	--
-- either side of: north, south, east or west										--
-- "Output":																					--
-- Combining these flags with NOR gives:												--	
-- 1: when rocket is pointing very close to east or west 						--
-- 0: when rocket is pointing	in any direction except								--
--		for very close to east or west (then  thrust is allowed to impact		--
--    vertical velocity)																	--
-----------------------------------------------------------------------------
f5_10 <= d5_6 nor f4_12;

-----------------------------------------------------------------------------
-- Vertical Rocket Velocity:	Vertical Thrust Pulse								--
-- Pulse that gives the pace with which the velocity can change				--
-- (acceleration/ deceleration).					                 					--
-- only pulses as long as rocket is not pointing very close to either		--	
-- east or west																				--
-- f5_10 NOR f3_6																				--
-- 0 0 => 1																						--	
-- 0 1 => 0																						--
-- 1 0 => 0																						--	
-- 1 1 => 0																						--
-- when f5_10=1 then the rocket is pointing very close to either east		--
-- or west and the rocket is not seen as being able to create any 			--
-- vertical thrust, and consequently no pulse is allowed							--
-- when f5_10=0 then thrust pulse is allowed											--
-- The resulting thrust pusle is inverted, but it does not matter				--
-- f3_6 is a continuous pulse train - when the thrust button is pressed		--
-----------------------------------------------------------------------------
j2_13 <= f3_6 nor f5_10;  

-----------------------------------------------------------------------------
-- Vertical Rocket Velocity: Velocity Level  "Harmonization"		 			--
--																									--
-- h4_3 (bit0), h4_2 (bit 1), h4_6 (bit 2) represent the 3 bit					--
-- velocity level																				--
-- h4_7 represents direction up or down, and due to the use of counter		--
-- the velocity levels gets "reversed/flipped" for downward velocity			--
-- h4_7 = 0 (up); 000 means no velocity and 111 means max velocity			--
-- h4_7 = 1 (down); 111 means no velocity and 000 means max velocity			--
--																									-- 
-- By applying XOR logic with the direction signal h4_7, the velocity		--
-- level is "harmonized" so that direction does not matter						--
-- and 000 means no velocity and 111 means max velocity							--
-----------------------------------------------------------------------------
h5_6 	<= h4_3 xor h4_7; 	
h5_11 <= h4_2 xor h4_7; 	
h5_3 	<= h4_6 xor h4_7;		

-----------------------------------------------------------------------------
-- Vertical Rocket Velocity: Output Velocity Level and Direction				--
-- 000 represents zero motion and 111 is maximum velocity						--
--																									--
-- Please note that up/down values are inversed as they reach the Motion 	--
-- Board's Rocket Motion unit (0 = down, 1 = up) to fit the Motion Logic  	--
-----------------------------------------------------------------------------
MemBrd_W <= h5_6; 	-- velocity bit 0
MemBrd_V <= h5_11; 	-- velocity bit 1
MemBrd_X <= h5_3; 	-- velocity bit 3
MemBrd_Y <= h4_7; 	-- Up(0) / Down(1) 

-----------------------------------------------------------------------------
-- Vertical Rocket Velocity: Max Downward Velocity Level Flag	 				--
-- Logic to flag when max velocity level has been reached						--
-- Flag is used to stop velocity counter from being further decreased		--
-- (for downward velocity: counter decrease => increases velocity)			--
-----------------------------------------------------------------------------
h6_6 	<= not ( h5_6 and h5_11 and h5_3 and h4_7); 	-- when velocity level is
																	-- 111 and direction is
																	-- downwards,
																	-- then flag is set
																	
-----------------------------------------------------------------------------
-- Vertical Rocket Velocity:	Max Upward Velocity Level Flag					--
-- Logic to flag when max velocity level has been reached						--
-- Flag is used to stop velocity counter from being further increased		--
-----------------------------------------------------------------------------
h2_2 	<= not h4_7; 											
h6_8 	<= not ( h5_6 and h5_11 and h5_3 and h2_2); 	-- when velocity level is
																	-- 111 and direction is
																	-- upwards,
																	-- then flag is set 
																	
-----------------------------------------------------------------------------
-- Vertical Rocket Velocity: Incr Downw. Velocity / Decr. Upward velocity	--
-- Sends signal to decrease upward velocity until rocket has no upward		--
-- motion and increase downward velocity until max velocity has been			--	
-- reached.																						--
-- Decreasing velocity in one direction can only be achieved by applying	--
-- thrust in opposite direction.															--
-- Thrust only has impact if the rocket is pointing downwards (90-270 deg)	--
-- but is not pointing very close to east/west.										--
-- Logically h3_6 send signal to velocity counter to decrease the counter	--
-- value 																						--
-----------------------------------------------------------------------------
h3_6 	<= not (h6_6 and j2_13 and j5_8);	-- h6_6: flag that indicates
														-- whether max velocity has been
														-- reached or not. If max velocity
														-- then it prevents further
														-- velocity increase	
														-- j5_8: up/down flag
														-- active and allowing for
														-- increse in velocity only 
														-- when set to "down" (1)
														-- j2_13: pulse that gives the 
														-- pace with which the velocity
														-- can change (acceleration/
														-- deceleration) - pulsating
														-- when thrust button is pressed
														-- and rocket is not pointing 
														-- very close to east or west 		

-----------------------------------------------------------------------------
-- Vertical Rocket Velocity: Incr Upward Velocity / Decr. Downw. Velocity	--
-- Sends signal to decrease downward velocity until rocket has no down		--
-- ward motion and increase upward velocity until max velocity has been		--	
-- reached.																						--
-- Decreasing velocity in one direction can only be achieved by applying	--
-- thrust in opposite direction.															--
-- Thrust only has impact if the rocket is pointing downwards (270-90 deg)	--
-- but is not pointing very close to east/west.										--
-- Logically h3_8 sends signal to velocity counter to increase the counter	--
-- value 																						--
-----------------------------------------------------------------------------
h2_12 <= not j5_8;								-- j5_8: flag that indicates 
														-- whether rocket is pointing
														-- upwards or downwards
														-- 0 - up, 1 - down
														-- h2_12 is inversing to fit 
														-- follow on logic requirement 
														-- that UP is active high (1)

h3_8 	<= not (h6_8 and h2_12 and j2_13);	-- h6_8: flag that indicates
														-- whether max velocity has been
														-- reached or not. If max velocity
														-- then it prevents further
														-- velocity increase	
														-- h2_12: up/down flag
														-- active and allowing for
														-- increse in velocity only 
														-- when set to "up" (1)
														-- j2_13: pulse that gives the 
														-- pace with which the velocity
														-- can change (acceleration/
														-- deceleration) - pulsating
														-- when thrust button is pressed
														-- and rocket is not pointing 
														-- very close to east or west 	

-----------------------------------------------------------------------------
-- ROCKET MISSILE DIRECTION LOGIC: Determine rocket missile direction    	-- 
-- up / down  AND left / right	                         						--
-- used for rocket missile launch angle and manouvering post launch			--
-----------------------------------------------------------------------------
MemBrd_12 <= j5_8; 			-- Missile Up or Down
									-- 0 = Up / 1 = Down

MemBrd_17 <= e3_14;			-- Missile Right or Left (0-180dg vs 180-360 dg)
									-- e3_14 is the inverse of e3_15
									-- 0 = Left / 1 = Right

-----------------------------------------------------------------------------
-- ROCKET MISSILE DIRECTION LOGIC: Rocket missile direction						--
--	Determines which direction the rocket missile should move in. The 		--
-- direction is dependent on the direction in which the rocket is 			--
-- pointing. In summary:																	--
-- 1) Straight up/down or right/left missile motion when the rocket is		--
-- pointing very close to north/south or west/east. At speed of one pixel	--	
-- per every 1/60 second																	--	
-- 2) ”45 degree” (or equivalent 135 / 215 / 305) motion when the rocket 	--
-- is pointing close to 45 degree (or equivalent). At speed of one pixel	--
-- per every 1/60 second																	--	
-- 3) 22,5/157,5/212.5/342.5 degree motion when rocket is close to those	--	
-- angels. At one pixel per every 1/60 second in vertical direction			--	
-- and one pixel per every 1/30 second in horizontal direction					--	
-- 4) 67,5/112.5/257.5/302.5 degree motion when rocket is close to those	--	
-- angels. At one pixel per every 1/30 second in vertical direction	and	--
-- one pixel per every 1/60 second in horizontal direction						--		
--																									--
-- The rocket missile direction is changing as the rocket orientation 		--
-- is changing - allowing for rocket missile manouverability					--
--																									--
-- One input lacks marking on the one player schematics,							--
-- but looking at the 2-player schematics concludes this is tapping from	--
-- motionboard B (MB_B)	(ref MemBrd_11)												--
-- MB_B is a pulse train which goes high/low with half the screen	refresh	--
-- freq: 30 Hz																					--
-----------------------------------------------------------------------------
f4_12 <= not d5_3;						-- active low whenever rocket is
												-- pointing:
												-- 45< - <135 degrees or
												-- 225< - <315  degrees

-- h5_8 <=  e4_2 nand e4_3;			-- original schematics; wrong label 
												-- on gate; should be xor, not nand
h5_8 <=  e4_2 xor e4_3;  				-- revised logic
												-- indicates (low) when the rocket
												-- is oriented, within one position,
												-- to either side of the
												-- 0/45/90/135/180/225/270/325
												-- degree-lines
												-- otherwise high

f4_6 <= not h5_8;							-- indicates (high) when the rocket
												-- is oriented, within one position,
												-- to either side of the
												-- 0/45/90/135/180/225/270/325
												-- degree-lines
												-- otherwise low

f6_6 <= not((h5_8 and MemBrd_11)		-- pulses between two logical output
		  or (d5_6 and f4_6));			-- constructs at a rate of 30Hz
												-- 1: indicate (high) when rocket is
												-- oriented within one position to
												-- either side of north, south, east
												-- or west
												-- otherwise low
												-- 2: indicate (low) when rocket is
												-- within one position to either side
												-- of 45/135/225/325 degree lines
												-- otherwise high
 
f4_2 <= not f6_6;							-- pulses between two logical output
												-- constructs at a rate of 30Hz
												-- 1: indicate (low) when rocket is
												-- oriented within one position to
												-- either side of north, south, east
												-- or west
												-- otherwise high
												-- 2: indicate (high) when rocket is
												-- within one position to either side
												-- of 45/135/225/325 degree lines
												-- otherwise low 

f5_4 <= f4_2 nor f4_12;					-- Rocket is pointing:
												-- 1) within one position
												-- 	to either side of
												--		east or west
												--		=> 1
												--	2) ~61 - ~74 / ~105 - ~121 /
												--		~240 - ~253 / ~287 - ~300
												-- 	degrees
												--		=>  switches between 1 and 0
												-- 		 with a 30 Hz frequency
												-- 3) ~300 < - < ~61 degrees or
												--		~121 < - < ~240 degrees
												--		=> 0													 

f5_1 <= f4_2 nor d5_3;					-- Rocket is pointing:
												-- 1) within one position
												-- 	to either side of
												--		north or south
												--		=> 1
												--	2) ~16 - ~32 / ~151 - ~163 /
												--		~197 - ~209 / ~331 - ~343
												-- 	degrees
												--		=>  switches between 1 and 0
												-- 		 with a 30 Hz frequency
												-- 3) ~32 < - < ~151 degrees or
												--		~209 < - < ~331 degrees
												--		=> 0

MemBrd_T <= f5_4;  						-- Rocket Missile Up/Down Enable
												-- 0 - up/down allowed
												-- 1 - up/down not allowed
												-- Is either constantly
												-- 1 or 0 or
												-- switches between 1 and 0
												-- with a 30 Hz frequency
												-- to allow for rocket 
												-- missile direction of:
												-- 67,5/112.5/257.5/302.5
												--	degrees		
												
MemBrd_U <= f5_1;		  					-- Rocket Missile Right/Left Enable
												-- 0 - right/left allowed
												-- 1 - right/left not allowed
												-- Is either constantly
												-- 1 or 0 or
												-- switches between 1 and 0
												-- with a 30 Hz frequency
												-- to allow for rocket 
												-- missile direction of
												-- 22,5/157,5/212.5/342.5
												--	degrees

-----------------------------------------------------------------------------
-- Determine rocket's main orientation      											-- 
-- up / down  and left / right	                         						--
-- used for rocket's vertical/horizontal velocity acc/dec.						--	
-- and for rocket missile launch angle and manouvering post launch			--
-----------------------------------------------------------------------------
j5_8 <= e3_15 xor e4_7;		-- e3_15 signals whether 0-180 degrees or
									-- 180-360 degrees (right or left pointing)
									-- e4_7 signals whether 90-180 / 270-360 degrees
									-- or 0-90 / 180-270 degrees
									-- XOR gives UP when e3_15(0-180 degrees) meet
									-- e4_7(0-90 degres)
									-- or e3_15(180-360 degrees) meet e4_7(270-350dg)
									-- otherwise DOWN								
		  
end memory_board_architecture;