-----------------------------------------------------------------------------
-- MOTION BOARD LOGIC																		--
-- For use with Computer Space FPGA emulator.										--
-- Implementation of Computer Space's Motion Board									--
-- "wire by wire" and "component by component"/"gate by gate"	based on		--
-- original schematics.																		--
-- With exceptions regarding:																--
-- 	> analogue based timers (impl as counters)									--
-- 	> all flip flops / ICs using asynch clock inputs are replaced with 	--
--   	  flip flops driven by a high freq clock and logic to						--
-- 	  identify "logical clock edge" changes										--
--		> sound pulse trains used by the analogue sound unit are replaced by	--
--	     on/off flags to trigger sound sample playback								-- 
--																									--
-- There are plenty of comments throughout the code to make it easier to	--
-- understand the logic, but due to the sheer number of comments there 		--
-- may exist occasional mishaps.			 												--
--																									--	
-- This entity is implementation agnostic												--
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
-- Motion Board inputs/outputs are labelled MB_<nn>, where <nn> is 			--
-- according to original schematics input/output labels. 						--
--																									--
-- v1.0																							--
-- by Mattias G, 2015																		--
-- Enjoy!																						--
-----------------------------------------------------------------------------

library 	ieee;
use 		ieee.std_logic_1164.all; 
use 		ieee.numeric_std.all;
use 		ieee.std_logic_unsigned.all;
library 	work;

--80--------------------------------------------------------------------------|

entity motion_board is 
	port (
	super_clk,	-- Clock to emulate
					-- asynch flip flop logic
															
	timer_base_clk										: in std_logic; 	
	rocket_missile_life_time_duration,
	saucer_missile_life_time_duration, 
	saucer_missile_hold_duration,
	signal_delay_duration 							: in integer;

	MB_3,  	-- rocket horizontal velocity:
				-- speed bit 0
	MB_4,  	-- rocket horizontal velocity:
				-- speed bit 2
				
	MB_16, 	-- rocket missile
				-- horizontal direction
				-- 1- right, 0 - left
	MB_17, 	-- rocket missile
				-- horizontal (right/left)
				-- speed
				-- constant 1 - no speed
				-- constant 0 - "60Hz" speed
				-- pulse 0/1 at 30 Hz rate
				-- gives "30 Hz" speed
				
	MB_18, 	-- rocket missile
				-- vertical direction
				-- 0 - up, 1 - down
	MB_19, 	-- rocket missile 
				-- vertical (up / down)
				-- speed
				-- constant 1 - no speed
				-- constant 0 - "60Hz" speed
				-- (60 pixels / second)
				-- pulse 0/1 at 30 Hz rate
				-- gives "30 Hz" speed	
				-- (30 pixels / second)
				
	MB_20,	-- game clock
	MB_C,		-- count enable
	
	MB_D,  	-- rocket horizontal velocity:
				-- speed bit 1
				
	MB_H,  	-- rocket up or down
				-- 0 - up / 1 - down
	MB_J,   	-- rocket right or left
				-- 0 - left / 1- right
				
	MB_T, 	-- rocket vertical velocity:
				-- speed bit 0
	MB_U, 	-- rocket vertical velocity:
				-- speed bit 1
	MB_V,		-- rocket vertical velocity:
				-- speed bit 2
				
	MB_Y 		-- rocket missile fire;
				-- active when fire button
				-- has been pressed	
															: in std_logic; 
															
	MB_5, 	-- saucer 16x8 image's 
				-- horizontal position bit 2
	MB_6, 	-- saucer 16x8 image's 
				-- horizontal position bit 0
	MB_8, 	-- saucer 16x8 image's 
				-- vertical position bit 0
	MB_9, 	-- saucer 16x8 image's 
				-- vertical position bit 2

	MB_10,   -- saucer missile video
				-- signals that the TV beam
				-- is "sweeping" by the current 
				-- pixel position of an active
				-- saucer missile  
	
	MB_11,	-- rocket 16x16 image's 
				-- horizontal position bit 2
	MB_12,	-- rocket 16x16 image's 
				-- horizontal position bit 0
	MB_13,	-- rocket 16x16 image's 
				-- vertical position bit 1
	MB_14,	-- rocket 16x16 image's 
				-- vertical position bit 3
	MB_15,	-- rocket 16x16 image's 
				-- vertical position bit 0
				
	MB_21, 	-- Saucer Enable
				-- signals that the TV beam
				-- is "sweeping" by the current 
				-- position of one of the
				-- two 16 x 8
				-- saucer image grids
				-- The exact image pixel that
				-- the TV beam is sweeping by
				-- is provided by
				-- horizontal pos bit 0-3:
				-- MB_6, MB_F, MB_5, MB_E 
				-- vertical pos bit 0-3:
				-- MB_8, MB_K, MB_9, MB_L 
				-- The information is used 
				-- by the Memory Board
				-- to feed the correct
				-- image pixel for further
				-- video signal processing
				-- at the sync star board	
	
	MB_B, 	-- 30Hz frequency pulse train
				-- used by Memory Board to create
				-- Rocket missile motion
				
	MB_E, 	-- saucer 16x8 image's 
				-- horizontal position bit 3
	MB_F, 	-- saucer 16x8 image's 
				-- horizontal position bit 1
	MB_K, 	-- saucer 16x8 image's 
				-- vertical position bit 1  and rocket_turn_sound
	MB_L, 	-- saucer 16x8 image's 
				-- vertical position bit 3
				
	MB_N,		-- rocket 16x16 image's 
				-- horizontal position bit 1
	MB_M,		-- rocket 16x16 image's 
				-- horizontal position bit 3			

	MB_P, 	-- Rocket Missile Video
				-- signals that the TV beam
				-- is "sweeping" by the current 
				-- pixel position of an active
				-- rocket missile  

	MB_R, 	-- rocket 16x16 image's 
				-- vertical position bit 2

	MB_W, 	-- Rocket Enable
				-- signals that the TV beam
				-- is "sweeping" by the current 
				-- position of the 16 x 16
				-- rocket image grid
				-- The exact image pixel that
				-- the TV beam is sweeping by
				-- is provided by
				-- horizontal pos bit 0-3:
				-- MB_12, MB_N, MB_11, MB_M,
				-- vertical pos bit 0-3:
				-- MB_15, MB_13, MB_R, MB_14 
				-- The information is used 
				-- by the Memory Board
				-- to feed the correct
				-- image pixel for further
				-- video signal processing
				-- at the sync star board					
				
	MB_2_rocket,  	-- rocket missile
						-- sound trigger
	MB_2_saucer,	-- saucer missile
						-- sound trigger
						
	saucer_missile_sound,
	rocket_missile_sound
															: out std_logic 
	);
end motion_board;

architecture motion_board_architecture
				 of motion_board is 

signal clk  											: std_logic ;
signal e5_15, missile_timer  						: std_logic := '0';
signal f4_8												: std_logic := '1';
signal d6_1, f6_10, f6_13,f6_4,
		 e6_6 											: std_logic := '1';

signal a_rocket_q 									: unsigned (15 downto 0)
															:= "0000000000000000";

-- signals for horizontal and vertical
-- velocity for the rocket
signal f5_8, f3_10, f3_13, f2_8,
		 b1_10, e1_6, e1_8, f4_12,
		 f4_6, a6_12, a5_8 							: std_logic;

signal c1_1, c1_6, d1_1, d1_6 					: std_logic;
signal d1_11, c1_15, d1_15, c1_11 				: std_logic := '0';
signal c1_10 											: std_logic := '1';

signal b4_3, b4_4, d4_3, d4_4 					: std_logic ;
signal d5_3, d5_4, b5_4, b5_3 					: std_logic ;	
signal e4_11, e4_12, e4_13, c4_11,
		 c4_12, c4_13 									: std_logic ;	

signal e4_14, c4_14, d4_11, b4_11   			: std_logic ;	

signal missile_life_time_counter 				: integer := 0;

--- saucer signals
signal d3_4, d3_3, b3_4, b3_3, e3_11,
		 e3_13, e3_14, b3_14, a6_10,
		 a3_8, f3_1, f3_4, g1_8, g1_6,
		 f1_2, f1_3, e3_12, e3_15 					: std_logic;

signal f1_13, f1_7, f1_6, f1_15_0,
		 f1_16_0, f1_9_0, f1_10_0,
		 f1_10, f1_15, f1_16, f1_9 				: std_logic;

signal c3_11, c3_12, c3_13, c3_14, d3_11	 	: std_logic;	
signal c6_1, f6_1										: std_logic;	

signal saucer_q 										: std_logic_vector (15 downto 0)
															:= "0000000000000000";

-- to simulate pulse to change direction
-- of saucer and to launch saucer 
-- missile at the same time
signal clk_count 										: integer := 0;

-- saucer missile signals
signal a4_1, a4_2, a4_4, a4_5, a4_13,
		 a4_12, a4_10, a4_9 							: std_logic;	
signal a4_3, a4_6, a4_11, a4_8  					: std_logic;	
signal a2_2, a2_3, a2_5, a2_6, a2_1, a2_4  	: std_logic;	
signal a1_2, a1_3, a1_6, a1_7, a1_13		  	: std_logic;	
signal a1_15_0, a1_16_0, a1_9_0, a1_10_0  	: std_logic;	
signal a1_15, a1_16, a1_10, a1_9  				: std_logic;	
signal b1_1, b6_2, b1_13, g1_3			 		: std_logic;	
signal f4_2												: std_logic := '1';	

signal e2_15								  			: std_logic := '0';	
signal d2_4, d2_3, b2_4, b2_3, b1_4  			: std_logic;
signal launch_missile								: std_logic := '1';	
signal b6_6 											: std_logic; 
signal b6_5 											: std_logic;
signal b6_5_old 										: std_logic := '0';	
signal delay_count 									: integer := 0;

-- signals to manage asynchronous
-- clock design embedded in
-- synchronous clk solutions
signal c1_1_old, c1_6_old,
		 f1_13_old, a1_13_old  						: std_logic;

signal d1_1_old, d1_6_old  						: std_logic;

signal rocket_missile_freq, saucer_missile_freq : std_logic;
	
component v74161_16bit 
	port(
	clk 													: in std_logic;
	clrn 													: in std_logic;
	ldn 													: in std_logic;
	enp 													: in std_logic;
	ent 													: in std_logic;
	D 														: in unsigned (15 downto 0);
	Q 														: out unsigned (15 downto 0);
  rco 													: out std_logic
  );
end component;

-----------------------------------------------------------------------------//
begin

-----------------------------------------------------------------------------
-- clk is the game_clk																		--	
-- replaces a6_8, a6_6, a6_4, a6_2														--	
-----------------------------------------------------------------------------
clk <= not MB_20;

-----------------------------------------------------------------------------
-- ROCKET MISSILE MOTION: Keep and change position									--
-- 74161 counters: B5, C5, D5, E5														--
--																									--
-- GENERAL:																						--	
-- The game screen is defined by the game as a grid of 255 lines				--
-- where each line is divided into 256 pixels, except for one line			-- 
-- which only has 255 pixels. The reason for the 255 pixels 					--
-- has to do with the approach to create object motion - described below	-- 
--																									--
-- Consequently a full screen consists of:											--
-- 255 pixels at one line + 256 pixels/line x 254 lines = 65.279 pixels		--
--																									--
-- Missiles are 1x1 pixel objects, each saucer is a 16x8 pixel object and	--
-- the rocket is a 16x16 pixel object.													--
--																									--
-- In modern day programming, the object's pixels would be mapped in a		-- 
-- 256x256 memory buffer, with pointers to each object's position.			--
-- Movement would be simply to change the object's x,y coordinates and		--	
-- re-draw the objects in their new position. The TV picture would be		--
-- generated by reading from the memory buffer.										--
--																									--
-- In the world of Computer Space, without RAM, ROM and CPU, a non-buffer	--
-- approach is applied to object "screen draw" and motion. In essence the	--	
-- object's pixels are processed and sent to the video signal in sync		--	
-- with the TV beam as the beam moves across the screen - without any		--
-- memory buffer. The trick is to use a "relative counter" approach 			--
-- where each object keeps track of its own "relative screen position".   	--
-- Computer Space uses a 16-bit counter solution (implemented as 4 x 4-bit	-- 
-- counters) to count all 65.279 pixels.												--
--																									--
-- Full 16 bit counter: (2 raised to the power of 16) -1 = 65.535				--
-- from 0 - 65.535 = 65.536 positions													--
-- 65.536 pixels max - 1 pixel less on first line - 256 pixels 				--	
-- for one line less (only 255 lines) = 65.279 										--
-- => starting on 257 (256 +1) and counting 65.278 times to cover 			--
--		65.279 position will have the counter reach its max value 65.535		--	
--		before resetting to zero. 															--
--																									--
-- For instance:																				--
--		1) when a 1x1 missile pixel has been drawn, its								--
-- 		16 bit counter (4 x 4-bit counters) is reset to 257					--
--			= (msb:0000 0001 0000 0001 lsb - E5 D5 C5 B5) and its carry flag	--
--			(RCO) is reset to 0.																--
--		2) For each pixel that the TV beam passes	by, the missile position	--
--			counter is increaed by 1 in full sync with the TV beam.				--
--			The RCO-value (=0) is continuously fed to the video signal, which	--
--			equals the color black.															--
--		3) When the counter reaches 65.535 (1111 1111 1111 1111) and sets 	--
--			carry flag (RCO) to '1', the TV beam has travelled across all		--
-- 		65.279 pixels (65.535-257+1) and arrived at the missile pixel's	--	
-- 		original position. The RCO flag '1' is fed to the video signal at	--
--			which point the pixel is drawn again (to keep it visible on the 	--
--			screen).	The value '1' equals the color white							--
--		4) The counter is reset to 257 again (and RCO is reset), and the		--
--			process starts all over, resulting in a motionless pixel drawn		--
--			onto screen. The exact position of the pixel depends on the TV		--
--			beam's position in relation to when the counter reaches 65.535		--  
--																									--
-- For clarity: the TV beam does not have any pixels to relate to, it is	--
-- a continuous "analogue" sweeping motion across the screen. Instead,		--	
-- each "pixel" is a duration of time that translates into a specific		--
-- distance that the TV beam covers as it moves horizontally across the		--
-- screen - line by line.  																--
--																									--
-- Horizontal movement:																		--
-- Moving the missile pixel horizontally is now a very simple operation.	--
-- By resetting the counter to 256 instead of 257 the counter will have		--	
-- to count one extra time (65.280 instead of 65.279) before it reaches		--
-- 65.535 and hence the pixel will move to the right of its previous			--
-- position.																					--
-- bit 15.................0																--
-- 257: 0000 0001 0000 0001 (bit0=1, bit1=0): no movement						--
-- 256: 0000 0001 0000 0000 (bit0=0, bit1=0): movement to the right			--
--																									--
-- Similarly, if the  counter is reset to 258, the counter reaches			--
-- 65.535 one pixel ahead of its previous position; a move to the left.		--
-- bit 15.................0																--
-- 257: 0000 0001 0000 0001 (bit0=1, bit1=0): no movement						--
-- 258: 0000 0001 0000 0010 (bit0=0, bit1=1): movement to the left			--
--																									--
-- Vertical Movement:																		--
-- Reset to 1 and the counter have to count a full line (256 pixels)			--
-- extra before it reaches 65.535 - which creates a downward motion			--
-- bit 15.......8.........0																--
-- 257: 0000 0001 0000 0001 (bit8=1, bit9=0): no movement						--
--   1: 0000 0000 0000 0001 (bit8=0, bit9=0): movement down						--	
--																									--
-- Reset to 513 - and the counter reaches 65.535 one line (256 pixels)		--
-- ahead of its previous position - upward motion.   								--
-- bit 15.......8.........0																--
-- 257: 0000 0001 0000 0001 (bit8=1, bit9=0): no movement						--
-- 513: 0000 0010 0000 0001 (bit8=0, bit9=1): movement up						--	
--																									--
-- Resulting motion control signals:													--
-- bit 0: Horizontal movement (0) or not (1)											--	
-- bit 1: Move Right (0) or Left (1) 													--
-- bit 8: Vertical movement (0) or not (1)											--
-- bit 9: Move Down (0) or Up (1)														--
--																									--
--	Maximum speed:																				--
-- The pixel can only move at a maximum pace of 60 pixels/second as the		--
-- TV beam sweeps across the screen 60 times/second (60Hz) for NTSC 			--
-- standard. Slower speed can be achieved by moving the object only			--
-- every second screen refresh or less, and let it stand still in between	--
--																									--	
--	Counters viewed as horizontal and vertical counters:							--
-- The counters can also be viewed as horizontal (x) and vertical (y)		--
-- D5, E5 - represent the current line (vertical)									--
-- B5, C5 - represent the pixel on that line (horizontal position) 			--
-- This view may be a more attractive way of thinking about the relative	--
-- screen position, but keeping in mind that origo of the x,y coordinate	--
-- system for an object is to the left of the object's bottom right corner	--
-- and the first "line" is only 255 pixels.											--
--																									--
-- IMPLEMENTATION:																			--
-- The counter represents the relative screen position as a 16-bit binary	--	
-- number (with 4 x 4-bit counters)														--
--																									--
-- bits 0 and 1 are for controlling horizontal movement:							--
-- 0: (bit0=0, bit1=0) => right movement one pixel per 1/60s					--
-- 1: (bit0=1, bit1=0) => no horizontal movement 									--
-- 2: (bit0=0, bit1=1) => left movement one pixel per 1/60s						--
-- 																								--
-- bits 8 and 9 are for controlling vertical movement:	 						--
-- 0	: (bit8=0, bit9=0) => downward movement one pixel per 1/60s				--
-- 256: (bit8=1, bit9=0) => no vertical movement									--
-- 512: (bit8=0, bit9=1) => upward movement one pixel per 1/60s	 			--
--																									--
-- in VHDL implemented as a 16 bit counter instead of 4 x 4-bit counters	--
-----------------------------------------------------------------------------
missile_motion: v74161_16bit
 port map(
			clk 	=> clk,
			clrn  => e6_6,
			ldn 	=> f4_8,
			enp 	=> '1',
			ent 	=> MB_C,	
			D(15) => '0',
			D(14) => '0',
			D(13) => '0',
			D(12) => '0',
			D(11) => '0',
			D(10) => '0',
			D(9)  => d5_4, -- Down (0) or Up (1) 
			D(8)  => d5_3, -- Vertical movement (0) or not (1) 
			D(7)  => '0',
			D(6)  => '0',
			D(5)  => '0',
			D(4)  => '0',
			D(3)  => '0',
			D(2)  => '0',
			D(1)  => b5_4,  -- Right (0) or Left (1) 
			D(0)  => b5_3,  -- Horizontal movement (0) or not (1) 
			rco 	=> e5_15,
			Q(11) => rocket_missile_freq
			);

d5_3 <= MB_19;			-- MB_19 sets the vertical speed
							-- constant 1 - no speed
							-- constant 0 - speed of 60 pixels/second
							-- pulse 0/1 @ 30 Hz rate - speed of 30 pixels/s
							-- (a full screen is 255 pixels vertically)
					
d5_4 <= f6_13;			-- f6_13 sets the vertical direction
							-- 0 - down, 1 - up		

b5_4 <= f6_10;			-- f6_10 sets the horizontal direction
							-- 0 - right, 1 - left
					
b5_3 <= MB_17;			-- MB_17 sets the horizontal speed
							-- constant 1 - no speed
							-- constant 0 - speed of 60 pixels/second
							-- pulse 0/1 @ 30 Hz rate - speed of 30 pixels/s
							-- (a screen is 256 pixels horizontally)		
			
f4_8 <= not (e5_15);	-- trigger load of new start value once
							-- counter has reached 65.535 (RCO is high)

-----------------------------------------------------------------------------	
-- Rocket missile video																		--
-----------------------------------------------------------------------------
MB_P <= e5_15; -- rocket missile video (=RCO)

-----------------------------------------------------------------------------
-- ROCKET MISSILE MOTION: VERTICAL SPEED AND DIRECTION LOGIC					--
--																									--
-- f6_13 sets the vertical direction: 0 - down, 1 - up							--
-- its the inverse of MB_18 (which comes from Memory Board)						--
-- Its fed to the missile motion counter, but will only result in vertical	--
-- motion if MB_19 is set to 0 for a specific screen draw						--
-----------------------------------------------------------------------------
f6_13 <= MB_19 nor MB_18;	-- MB_19 sets the vertical speed
									-- constant 1 - no speed
									-- constant 0 - speed of 60 pixels/second
									-- pulse 0/1 @ 30 Hz rate - speed of 30 pixels/s
									-- (a full screen i 255 pixels vertically)
									-- MB_18 sets the vertical direction
									-- 0 - up, 1 - down
				
-----------------------------------------------------------------------------
-- ROCKET MISSILE MOTION: HORIZONTAL SPEED AND DIRECTION LOGIC					--
--																									--
-- f6_10 sets the horizontal direction: 0 - right, 1 - left						--
-- its the inverse of MB_16 (which comes from Memory Board)	in order to 	--
-- fit the missile motion counter logic 												--
-- Its fed to the missile motion counter, but will only result in 			--
-- horizontal motion if MB_17 is set to 0 for a specific screen draw			--
-----------------------------------------------------------------------------
f6_10 <= MB_17 nor MB_16;	-- MB_17 sets the horizontal speed
									-- constant 1 - no speed
									-- constant 0 - speed of 60 pixels/second
									-- pulse 0/1 @ 30 Hz rate - speed of 30 pixels/s
									-- (a full screen i 256 pixels horizontally)
									-- MB_16 sets the horizontal direction
									-- 0 - left, 1 - right

-----------------------------------------------------------------------------
-- ROCKET MISSILE LIFE CYCLE: Timer functionality 									--
-- D6, 74121																					--
-- when rocket missile fire button is pressed, the timer starts				--
-- counting the lifetime for the missile, a few seconds.							--
-- Time is dependent on "timer_base_clk" frequency and							--
-- "missile_life_time_counter". Both set in implementation specific code	--
-- MB_2_rocket is used instead of MB_2 and g1_11 - for the rocket missile	--
-- audio.																						--
-----------------------------------------------------------------------------
process (timer_base_clk, MB_Y, missile_timer, missile_life_time_counter, rocket_missile_life_time_duration)
begin
if (MB_Y = '1' and missile_timer = '0') then 
	d6_1 <= '0';
	missile_timer <= '1';
	MB_2_rocket <= '1';	-- rocket missile sound sample trigger on
elsif (rising_edge(timer_base_clk) and missile_timer = '1') then 
	missile_life_time_counter <= missile_life_time_counter + 1;
elsif (rising_edge(timer_base_clk) and
		missile_life_time_counter > rocket_missile_life_time_duration) then 
	missile_life_time_counter <= 0;
	missile_timer <= '0';
	d6_1 <= '1';
	MB_2_rocket <= '0';	-- rocket missile sound sample trigger off
end if;
end process;


rocket_missile_sound <= not (rocket_missile_freq and not d6_1);

-----------------------------------------------------------------------------
-- ROCKET MISSILE LIFE CYCLE: ROCKET MISSILE LAUNCH & VIDEO ENABLE			--
-- If rocket missile is active then the rocket missile may be displayed		--
-- (final display enable logic is done at Sync Star Board)						--
-- When the missile launches it originates from "the heart" of the 			--
-- rocket.																						--
--																									--	
-- f6_4 is dividing the rocket's 16x16 image grid into four quadrants;	 	--
-- each an 8x8 pixel image grid. The upper left quadrant's pixels are 		--
-- given a value of 1 and the other quadrants' pixels are given a value		--
-- of	0. 																						--
-- This follows from applying NOR on the MSBs of the rocket's motion			--
-- counters lower nibble for horizontal and vertical counting. 				--
--																									--
--	horizontal d4_14		vertical c4_14		=>		f6_4 (NOR)						--
--	0000000011111111		0000000000000000		1111111100000000					--
--	0000000011111111		0000000000000000		1111111100000000					--
-- 0000000011111111		0000000000000000		1111111100000000					--
-- 0000000011111111		0000000000000000		1111111100000000					--
--	0000000011111111		0000000000000000		1111111100000000					--
--	0000000011111111		0000000000000000		1111111100000000					--
-- 0000000011111111		0000000000000000		1111111100000000					--
-- 0000000011111111		0000000000000000		1111111100000000					--
-- 0000000011111111		1111111111111111		0000000000000000					--
-- 0000000011111111		1111111111111111		0000000000000000					--
-- 0000000011111111		1111111111111111		0000000000000000					--	
-- 0000000011111111		1111111111111111		0000000000000000					--
-- 0000000011111111		1111111111111111		0000000000000000					--	
-- 0000000011111111		1111111111111111		0000000000000000					--	
-- 0000000011111111		1111111111111111		0000000000000000					--
-- 0000000011111111		1111111111111111		0000000000000000					--	
--																									--
-- The rocket's 16x16 image is always appearing on the last 16 lines and	--
-- last 16 pixels of those lines. 														--
--																									--
-- 1) If the missile is not active (d6_1 = 1) then e6_6 will go low 		  	--
-- 	when the TV beam reaches any pixel in the upper left quadrant,			--
-- 	and consequently the missile motion counter will be reset.				--
--	2)	When the TV beam moves from the bottom right pixel  (the "last"		--
--		pixel) of the 8x8 upper left pixel quadrant into the next quadrant	--
--		then e6_6 moves from  low to high and the missile motion counter		--
--		starts counting.																		--
--	3) The above process is repeated for every screen drawn (60 times /s);	--
--		- which means the missile motion counter is always counting and		--
--		ready to go. 																			--
--	4)	If the missile has become active(missile launch) or is active then	--
--		there will be no clear signal when the TV beam moves into the upper	--
--		left 8x8	pixel quadrant and consequently the missile pixel will		--
--		be displayed as missile	motion counter reaches 65.535.					--	
-- 5) If it is a missile launch then the pixel will appear one line			--	
--		below the rocket's center,  immediately to the right of the 8x8		--
--		upper left quadrant; which is almost in the center/heart of the		--
--		rocket.																					--		
-----------------------------------------------------------------------------
a6_12 <= not a5_8;									-- signals when TV beam is
															-- passing by the
															-- current position of  the
															-- rocket's 16x16 image grid		

f6_4 <= d4_11 nor b4_11;							-- signals that the TV beam
															-- is passing by the upper
															-- left 8x8 pixel quadrant
															-- of any 16x16 image 
															-- grid (could be the rocket's)
															-- at "16 pixels intervals" and
															-- at "16 lines intervals"	
	
e6_6 <=	not (d6_1 and a6_12 and f6_4); 		-- Missile Active Flag
															-- d6_1 signals that the   
 															-- missile is active	
															-- The combination of a6_12 and 
															-- f6_4 signals when the TV 
															-- beam passes by the upper left
															-- 8x8 pixel quadrant of the 
															-- rocket's 16x16 image grid.
															-- The resulting signal feeds 
															-- the Rocket Missile Motion
															-- Counter's clrn
															-- If the missile is not active
															-- when the TV beam moves into
															-- the 8x8 pixel quadrant, then
															-- the counter will be cleared 	
															-- - and when the TV beam moves 
															-- from the bottom right pixel 
															-- (the "last" pixel) of the 8x8
															-- upper left pixel quadrant 
															-- into the next quadrant then 
															-- the resulting signal moves  	
															-- from "clear" to "not clear" 
															-- and starts counting.
															--	If the missile has been set
															-- to active or is active then
															-- there will be no clear signal
															-- when the TV beam moves into
															-- the upper left 8x8 pixel 
															-- quadrant and consequently the
															-- missile pixel will be
															-- displayed as the motion 
															-- counter reaches 65.535.
															-- If it is the launch then the 
															-- pixel will appear one line
															-- below and one pixel to the 
														   -- right of the rocket center 	

-----------------------------------------------------------------------------
-- ROCKET MOTION: Keep and change position 											--
-- 74161 counters: B4, C4, D4, E4														--
--																									--
--	Motion principles:																		--
-- For basic motion principles, please see explanation above for 				--
-- ROCKET MISSILE MOTION.																	--	
-- Whereas the 1x1 missile pixel is using RCO to feed the video signal		--
-- the rocket needs to feed 16x16 pixels, which requires additional logic.	--
-- The rocket object is placed in the last 16 pixel of the last 16 lines	--
-- that the rocket motion counter (B4,C4,D4,E4) is counting. The very last	--
-- pixel (the bottom right pixel of the 16x16 image grid) is displayed		--
-- at the count of 65.535. 																--
-- In this context, it can be useful to view the counter as one				--
-- horizontal counter and one vertical counter.										--
--																									--
--   V: 	 H: 240..............255 														--
--  239	.....................															--
--  240	.....xxxxxxxxxxxxxxxx  (240,240)->(255,240) or 61.680->61.695		--
--   .	.....xxxxxxxxxxxxxxxx							.								--
--   .	.....xxxxxxxxxxxxxxxx							.								--	
--   .	.....xxxxxxxxxxxxxxxx							.								--
--   .	.....xxxxxxxxxxxxxxxx							.								--
--   .	.....xxxxxxxxxxxxxxxx							.								--
--   .	.....xxxxxxxxxxxxxxxx							.								--
--   .	.....xxxxxxxxxxxxxxxx							.								--
--   .	.....xxxxxxxxxxxxxxxx							.								--
--   .	.....xxxxxxxxxxxxxxxx							.								--
--   .	.....xxxxxxxxxxxxxxxx							.								--
--   .	.....xxxxxxxxxxxxxxxx							.								--
--   .	.....xxxxxxxxxxxxxxxx							.								--
--   .	.....xxxxxxxxxxxxxxxx							.								--
--   .	.....xxxxxxxxxxxxxxxx							.								--
--  255 	.....xxxxxxxxxxxxxxxO  (240,255)->(255,255) or 65.520->65.535		--
--																									--
--	A very simple logic (a5_8) determines when the last 16 pixels for the	--
-- last 16 lines are being counted by the rocket motion counter - by 		--
-- simply looking at the MSB nibble														--
-- MSB nibble: 1111 xxxx = 240 - 255 for horizontal								--
-- MSB nibble: 1111 xxxx = 240 - 255 for vertical									--	
--																									--
-- If the counter is being reset in the same way as explained for the 		--
-- ROCKET MISSILE MOTION to achieve horizontal and/or vertical movement		--
-- then this will consequently imapct all the 16x16 bits, as their			--
-- relative positions are all, naturally, "hanging together".					-- 
--																									--
-- IMPLEMENTATION:																			--
-- The counter represents the relative screen position as a 16-bit binary	--	
-- number (with 4 x 4-bit counters)														--
--																									--
-- bits 0 and 1 are for controlling horizontal movement:							--
-- 0: (bit0=0, bit1=0) => right movement one pixel per 1/60s					--
-- 1: (bit0=1, bit1=0) => no horizontal movement 									--
-- 2: (bit0=0, bit1=1) => left movement one pixel per 1/60s						--
--																									--	
-- Horizontal speed is achieved by changing the frequency 						--
-- with which the rocket is set to move horizontally. For instance			--
-- letting the rocket pause every 1/30s and move every 1/30s					--
-- gives the impression of moving one pixel per 1/30s								--
-- 																								--
-- bits 8 and 9 are for controlling vertical movement:	 						--
-- 0	: (bit8=0, bit9=0) => downward movement one pixel per 1/60s				--
-- 256: (bit8=1, bit9=0) => no vertical movement									--
-- 512: (bit8=0, bit9=1) => upward movement one pixel per 1/60s	 			--
--																									--
-- Vertical speed is achieved by changing the frequency 							--
-- with which the rocket is set to move vertically. For instance				--
-- letting the rocket pause every 1/30s and move every 1/30s					--
-- gives the impression of moving one pixel per 1/30s								--
--																									--
-- in VHDL implemented as a 16 bit counter instead of 4 x 4-bit counters	--
-----------------------------------------------------------------------------
process (clk)
begin
if rising_edge(clk) then
	if MB_C='1' then
		if a_rocket_q < 65534 then
			a_rocket_q <= a_rocket_q + 1;
		elsif a_rocket_q < 65535 then
			a_rocket_q <= a_rocket_q + 1;
		else
			a_rocket_q (0) <= b4_3;	-- Horizontal movement (0) or not (1)
			a_rocket_q (1) <= b4_4;	-- Right (0) or Left (1) 
			a_rocket_q (2) <= '0';
			a_rocket_q (3) <= '0';
			a_rocket_q (4) <= '0';
			a_rocket_q (5) <= '0';
			a_rocket_q (6) <= '0';
			a_rocket_q (7) <= '0';
			a_rocket_q (8) <= d4_3;	-- Vertical movement (0) or not (1)
			a_rocket_q (9) <= d4_4;	-- Down (0) or Up (1)
			a_rocket_q (10) <= '0';
			a_rocket_q (11) <= '0';
			a_rocket_q (12) <= '0';
			a_rocket_q (13) <= '0';
			a_rocket_q (14) <= '0';
			a_rocket_q (15) <= '0';
		end if;
	end if;
end if;
end process;			
			
d4_4 <= f3_10;	-- Down (0) or Up (1)

d4_3 <= f5_8;	-- Vertical movement (0) or not (1)
					-- constant 1 gives no movemenet
					-- pulsing between 0 and 1 at specific
					-- frequency intervals
					-- gives a range of screen speeds
					
b4_4 <= f3_13;	-- Right (0) or Left (1)
 
b4_3 <= f2_8;	-- Horizontal movement (0) or not (1)
					-- constant 1 gives no movemenet
					-- pulsing between 0 and 1 at specific
					-- frequency intervals
					-- gives a range of screen speeds


d4_11 <= a_rocket_q(11);

e4_11 <= a_rocket_q(15);
e4_12 <= a_rocket_q(14);
e4_13 <= a_rocket_q(13); 
e4_14 <= a_rocket_q(12);  
c4_11 <= a_rocket_q(7); 
c4_12 <= a_rocket_q(6); 
c4_13 <= a_rocket_q(5); 
c4_14 <= a_rocket_q(4); 

b4_11 <= a_rocket_q(3);

-- creating motion board connectors from chip B4 and D4
MB_M  <= a_rocket_q(0);
MB_11 <= a_rocket_q(1);
MB_N  <= a_rocket_q(2);
MB_12 <= a_rocket_q(3);

MB_14 <= a_rocket_q(8);
MB_R  <= a_rocket_q(9);
MB_13 <= a_rocket_q(10);
MB_15 <= a_rocket_q(11);

-----------------------------------------------------------------------------
-- ROCKET MOTION: creating rocket enable signal (active low)	 				--
-- when the TV beam is passing by the position of the								--
-- rocket's 16 x 16 image grid 															--
-----------------------------------------------------------------------------
MB_W <= a5_8; -- Rocket Enable

a5_8 <= not (c4_11 and c4_12 and c4_13 and c4_14
		       and e4_11 and e4_12 and e4_13 and e4_14);	
			
-----------------------------------------------------------------------------
-- ROCKET MOTION: Vertical direction and velocity									--
-- f3_10 sets the vertical direction: 0 - down, 1 - up							--
-- its the inverse of MB_H (which comes from Memory Board) in order to 		--
-- fit the rocket motion counter logic 												--	
-- Its fed to the rocket motion counter, but will only result in 				--
-- vertical motion when f5_8 is set to 0 for a specific screen draw			--
-----------------------------------------------------------------------------
f3_10 <= MB_H nor f5_8;		-- MB_H sets the vertical direction 
									-- 0 - up, 1 - down
									-- f5_8 sets the vertical speed
									-- pulses 0/1:s at discrete frequencies which 
									-- will make the rocket move a pixel at specific
									-- intervals and create a range of rocket speeds	
									-- 1 - no speed
									-- 0 - one pixel movement per new screen draw
 				
-----------------------------------------------------------------------------
-- ROCKET MOTION: Horizontal direction and velocity			 					--
-- f6_13 sets the horizontal direction: 0 - right, 1 - left						--
-- its the inverse of MB_J (which comes from Memory Board) in order to 		--
-- fit the rocket motion counter logic 												--
-- Its fed to the rocket motion counter, but will only result in 				--
-- horizontal motion when f2_8 is set to 0 for a specific screen draw		--
-----------------------------------------------------------------------------
f3_13 <= MB_J nor f2_8;		-- MB_J sets the horizontal direction 
									-- 0 - left, 1 - right
									-- f2_8 sets the horizontal speed
									-- pulses 0/1:s at discrete frequencies which 
									-- will make the rocket move a pixel at specific
									-- intervals and create a range of rocket speeds	
									-- 1 - no speed
									-- 0 - one pixel movement per new screen draw

-----------------------------------------------------------------------------
-- ROCKET VELOCITY: Vertical screen velocity pulse train							--
-- Mixing the rocket's current vertical velocity level (0-7) with base		--
-- frequencies to create a range of discrete frequencies that will			--
-- increase with velocity level.															--
-- Higher frequency results in rocket moving more frequent and 				--
-- consequently achieving a higher vertical speed on screen. 					--
-----------------------------------------------------------------------------
f5_8 <= not ((MB_V and b1_10) or (MB_U and f4_6) or (MB_T and f4_12)); 

-----------------------------------------------------------------------------
-- ROCKET VELOCITY: Horizontal screen velocity pulse train						--
-- Mixing the rocket's current horizontal velocity level (0-7) with base	--
-- frequencies to create a range of discrete frequencies that will			--
-- increase with velocity level.															--
-- Higher frequency results in rocket moving more frequent and 				--
-- consequently achieving a higher horizontal speed on screen. 				--
-----------------------------------------------------------------------------
f2_8 <= not ((MB_4 and b1_10) or (MB_D and f4_6) or (MB_3 and f4_12)); 

-----------------------------------------------------------------------------
-- ROCKET VELOCITY: Frequency mixing										 			--
-- create frequencies used as a basis to create a range of discrete rocket	--
-- velocities																					--	
-- b1_10: 15 Hz frequency pulse train with positive pulse lasting 1/30 s	--
-- f4_6 : 7,5 Hz fequency pulse train with positive pulse lasting 1/30 s 	--
-- f4_12: 3.25 Hz fequency pulse train with positive pulse lasting 1/30 s	-- 
----------------------------------------------------------------------------- 
b1_10 <= c1_15 nor c1_10;

e1_6 	<= not (c1_15 and c1_10 and d1_6 and d1_6); 		-- 7420 (nand)
																		-- wrong gate
																		-- marking (7402 nor)
																		-- on original 
																		-- schematics
																		
f4_6	<= not e1_6;

e1_8 	<= not (c1_10 and d1_15 and c1_15 and d1_11);	-- 7420 (nand)
																		-- wrong gate
																		-- marking (7402 nor)
																		-- on original 
																		-- schematics	
																		
f4_12 <= not e1_8;

-----------------------------------------------------------------------------
-- ROCKET VELOCITY: FREQUENCY DIVIDER LOGIC											--
-- Flip-Flops C1 & D1																		--
-- Frequency division as a base to create a range of discrete rocket			--
-- velocities																					--	
-- c1_15: 30 Hz pulse train																--
-- c1_10: 15 Hz pulse train																--
-- d1_15: 7.5 Hz pulse train																--
-- di_11: 3.25 Hz pulse train																--
-- MB_B : 30 Hz pulse train used by Memory Board to create rocket missile	--
--        speed 																				--
-----------------------------------------------------------------------------
c1_1 <= e3_11;	

process (super_clk)
begin
if rising_edge (super_clk) then
	c1_1_old <= c1_1;
	if (c1_1_old = '1') and (c1_1 = '0') then
		c1_15 <= not c1_15; 
	end if;	
end if;
end process;

MB_B <= c1_15;

c1_6 <= c1_15;

process (super_clk)
begin
if rising_edge (super_clk) then
	c1_6_old <= c1_6;
	if (c1_6_old = '1') and (c1_6 = '0') then
		c1_11 <= not c1_11;
		c1_10 <= not c1_10; 
	end if;
end if;
end process;

d1_1 <= c1_11;

process (super_clk)
begin
if rising_edge (super_clk) then
	d1_1_old <= d1_1;
	if (d1_1_old = '1') and (d1_1 = '0') then
		d1_15 <= not d1_15;
	end if;
end if;
end process;			
			
d1_6 <= d1_15;		

process (super_clk)
begin
if rising_edge (super_clk) then
	d1_6_old <= d1_6;
	if (d1_6_old = '1') and (d1_6 = '0') then
		d1_11 <= not d1_11 ;
	end if;
end if;
end process;			 

-----------------------------------------------------------------------------
-- SAUCER MOTION: Keep and change position											--
-- 74161 counters: B3, C3, D3, E3														--
--																									--
--	Motion principles:																		--
-- For basic motion principles, please see explanation above for 				--
-- ROCKET MOTION.																				--
--																									--
-- bits 0 and 1 are for controlling horizontal movement:							--
-- (bit0=0, bit1=1) => no horizontal movement 										--
-- (bit0=1, bit1=1) => right movement one pixel per 1/60s						--
-- (bit0=1, bit1=0) => left movement one pixel per 1/60s							--
--  																								--
-- The de facto horizontal speed is achieved by moving the saucer every		--
-- 1/30s. This is achived by pulsing the movement signal on/off every		--
-- second screen draw (=>30Hz)															--
--																									--
-- bits 8 and 9 are for controlling vertical movement:	 						--
-- (bit8=0, bit9=1) => no vertical movement											--
-- (bit8=1, bit9=1) => downward movement one pixel per 1/60s 					--
-- (bit8=1, bit9=0) => upward movement  one pixel per 1/60s 					--
--  																								--
-- The de facto vertical speed is achieved by moving the saucer every		--
-- 1/30s. This is achived by pulsing the movement signal on/off every		--
-- second screen draw (=>30Hz)															--	
--																									--
-- Implemented as a 16 bit counter instead of 4 x 4 bit counters 				--
-----------------------------------------------------------------------------
process (clk)
begin
if rising_edge(clk) then
	if MB_C='1' then
		if saucer_q < 65534 then
			saucer_q <= saucer_q + 1;
			e3_15 <= '0';
		elsif saucer_q < 65535 then
			saucer_q <= saucer_q + 1;
			e3_15 <= '1';
		else
			e3_15 <= '0';
			saucer_q (0) 	<= b3_3;	-- Horizontal movement (0) or not (1)
			saucer_q (1) 	<= b3_4;	-- Right (0) or Left (1) 
			saucer_q (2) 	<= '0';
			saucer_q (3) 	<= '0';
			saucer_q (4) 	<= '0';
			saucer_q (5) 	<= '0';
			saucer_q (6) 	<= '0';
			saucer_q (7) 	<= '0';
			saucer_q (8) 	<= d3_3;	-- Vertical movement (0) or not (1)
			saucer_q (9) 	<= d3_4;	-- Down (0) or Up (1)
			saucer_q (10) 	<= '0';
			saucer_q (11) 	<= '0';
			saucer_q (12) 	<= '0';
			saucer_q (13) 	<= '0';
			saucer_q (14) 	<= '0';
			saucer_q (15) 	<= '0';
		end if;
	end if;
end if;
end process;			

d3_4 <= f3_1;	-- Down (0) or Up (1)

d3_3 <= g1_8;	-- Vertical movement (0) or not (1)
					-- constant 1 gives no movemenet
					-- pulsing between 0 and 1 at 30Hz
					-- gives a 30 pixels/s screen speed
					
b3_4 <= f3_4;	-- Right (0) or Left (1)

b3_3 <= g1_6;	-- Horizontal movement (0) or not (1)
					-- constant 1 gives no movemenet
					-- pulsing between 0 and 1 at 30Hz
					-- gives a 30 pixels/s screen speed
				
-- creating motion board connectors from chip B4 and D4
MB_E <= saucer_q(0);
MB_5 <= saucer_q(1);
MB_F <= saucer_q(2);
MB_6 <= saucer_q(3);

MB_L <= saucer_q(8);
MB_9 <= saucer_q(9);
MB_K <= saucer_q(10);
MB_8 <= saucer_q(11);


b3_14 <= saucer_q(0);
c3_11 <= saucer_q(7);
c3_12 <= saucer_q(6);
c3_13 <= saucer_q(5);
c3_14 <= saucer_q(4);

d3_11 <= saucer_q(11);

e3_11 <= saucer_q(15); 
e3_12 <= saucer_q(14);
e3_13 <= saucer_q(13);
e3_14 <= saucer_q(12);

-----------------------------------------------------------------------------
-- SAUCER MOTION: creating saucer enable signal (active low)					--
-- when the TV beam is passing by the position of either one of the  		--
-- saucer's 16 x 8 image grids 															--
-----------------------------------------------------------------------------
MB_21 <= not a3_8; --saucer_enable 

 a3_8 <= not (c3_11 and c3_12 and c3_13 and c3_14
              and e3_12 and e3_13 and e3_14 and d3_11);

-----------------------------------------------------------------------------
-- SAUCER MOTION: saucer vertical direction and speed 							--
-- f3_1 sets the vertical direction: 0 - down, 1 - up								--
-- its the inverse of f1_9  in order to fit the saucer motion counter		--
-- logic 																						--
-- Its fed to the saucer motion counter, but will only result in 				--
-- vertical motion when g1_8 is set to 0 for a specific screen draw			--
-----------------------------------------------------------------------------
f3_1 <= f1_9 nor g1_8;		-- f1_9 sets the vertical direction 
									-- 0 - up, 1 - down
									-- g1_8 sets the vertical speed
									-- it is either constant 1 - no speed or
									-- pulses 0/1:s at 30Hz frequency which 
									-- will make the saucer move 30 pixels/s	
									-- 0 - one pixel movement per new screen draw

-----------------------------------------------------------------------------
-- SAUCER MOTION: saucer horizontal direction and speed 							--
-- f3_4 sets the horizontal direction: 0 - right, 1 - left						--
-- its the inverse of f1_15 in order to fit the saucer motion counter		--
-- logic 																						--
-- Its fed to the saucer motion counter, but will only result in 				--
-- horizontal motion when g1_6 is set to 0 for a specific screen draw		--
-----------------------------------------------------------------------------
f3_4 <= f1_15 nor g1_6;		-- f1_15 sets the horizontal direction 
									-- 0 - left, 1 - right
									-- g1_6 sets the horizontal speed
									-- it is either constant 1 - no speed or
									-- pulses 0/1:s at 30Hz frequency which 
									-- will make the saucer move 30 pixels/s	
									-- 0 - one pixel movement per new screen draw

-----------------------------------------------------------------------------
-- SAUCER VELOCITY: Saucer vertical speed					 							--
-- "Filters" the frequency that is the basis for saucer speed					--
-----------------------------------------------------------------------------
g1_8 <= f1_10 nand c1_15; 	-- f1_10 is a flag that signals whether
									-- the saucer should have vertical speed or not
									-- c1_15 is a 30Hz frequency that is passed 
									-- through to g1_8 when f1_10 = 1

-----------------------------------------------------------------------------
-- SAUCER VELOCITY: Saucer horizontal speed				 							--
-- "Filters" the frequency that is the basis for saucer speed					--
-----------------------------------------------------------------------------
g1_6 <= f1_16 nand c1_15;  -- f1_16 is a flag that signals whether
									-- the saucer should have vertical speed or not
									-- c1_15 is a 30Hz frequency that is passed 
									-- through to g1_6 when f1_16 = 1
 
-----------------------------------------------------------------------------
-- SAUCER DIRECTION SELECTION: Load and lock new or same direction			--
-- F1 7475																						--
-- 4-bit bistable latch																		-- 
-- emulated as a clocked version															--
-- determines the next saucer direction												--
-----------------------------------------------------------------------------
f1_2 <= e3_11; 	-- 60 Hz frequency in sync with
						--	final saucer pixel being drawn to screen 

f1_3 	<= b3_14;
f1_13 <= f6_1;
f1_7 	<= e3_12;
f1_6 	<= e3_13;

process (clk)
begin
if rising_edge (clk) then
	f1_13_old <= f1_13;
	if (f1_13_old = '0') and (f1_13 = '1') then
		f1_15 <=  f1_3;		-- vertical velocity or not	
		f1_16 <=  f1_2;		-- horizontal velocity or not
		f1_9 <= f1_7;			-- vertical direction up/down
		f1_10 <= f1_6;			-- horizontal direction left/right
	end if;
end if;
end process;

-----------------------------------------------------------------------------
-- SAUCER MISSILE LIFECYCLE AND DIRECTION CHANGE TIMER							--
-- C6 74121 - Schmitt Astabile Multivibrator											--
-- Drive change of c6_1 as an emulation of b6_8/10/12 + 250uF and the 		--
-- 74121 set-up 																				-- 
-----------------------------------------------------------------------------
process (timer_base_clk)
begin
if rising_edge (timer_base_clk) then
	if c6_1 = '0' then
		if clk_count < saucer_missile_life_time_duration then
			clk_count <= clk_count+1;
		else	
			clk_count <= 0;  -- reset clock_count to start a new pulse wave
			c6_1 <= '1';
		end if;
	elsif	c6_1 = '1' then
		if clk_count < saucer_missile_hold_duration then 
			clk_count <= clk_count+1;
		else	
			clk_count <= 0;  -- reset clock_count to start a new pulse wave
			c6_1 <= '0';
		end if;
	end if;
end if;	
end process;

-- special case; assign input of b6_6 the input value (operand then applies 
-- with delay on b6_6 below)  
b6_5 <= c6_1; 

-----------------------------------------------------------------------------
-- SAUCER DIRECTION SELECTION: Create direction change pulse					--
-- Drive change of b6_6 as an emulation of delay caused by b6 and .2F Cap	--
-- Create the pulse that will load the saucer's new (or the same)				--
-- direction																					--
-- The pulse is somewhat delayed in relation to the launch of the saucer 	--
-- missile, creating the effect that the saucer will first launch its 		--
-- missile and thereafter change (or maintain) direction							--
-----------------------------------------------------------------------------
process (timer_base_clk)
begin
if rising_edge (timer_base_clk) then
	b6_5_old <= b6_5;
	if b6_5_old = '0' and b6_5 = '1' then 
	-- if rising edge , initiate a delay before output changes
		delay_count <= 0;
	elsif b6_5_old = '0' and b6_5 = '1' then
	-- if falling edge , initiate a delay before output changes
		delay_count <= 0;
	else
		if delay_count < signal_delay_duration then 
			delay_count <= delay_count +1;
		else
			delay_count <= 0;
			b6_6 <= not b6_5;
			-- change output after signal delay; this causes a signal spike
		end if;					
	end if;	
end if;
end process;

f6_1 <= c6_1 nor b6_6; 

-----------------------------------------------------------------------------
-- SAUCER MISSILE AI LOGIC: Rocket's position relative current TV beam pos	--
-- A4, 7486																						--
-- quadruple 2-input xor gates															--
-- Identify how the current TV beam position relates to the rocket's			--
-- vertical and horizontal position.													--
--																									--
-- The complete missile AI logic will determine whether the rocket is to	--
-- the left or to the right of (or on level with) the saucer and whether	--
-- it is below or above (or on plane with) the saucer. This will control	--
-- the saucer missile's launch direction.												--
-- If the rocket and the saucer are very close to each other					--
-- then the saucer missile will not get any movement and instead become 	--
-- a "mine" (a missile that appears like a motionless star that exists 		--
-- for a while and then disappears)														--
-----------------------------------------------------------------------------
a4_1 	<= e4_11; 
a4_2 	<= e4_12;  
a4_4 	<= e4_12;
a4_5 	<= e4_13;
a4_13 <= c4_11; 
a4_12 <= c4_12; 
a4_10 <= c4_12;
a4_9 	<= c4_13; 

a4_3 	<= a4_1 	xor a4_2;	-- current TV beam position
									-- above or below the rocket's 16x16 image
									-- position within 65 - 255 pixels (=1)
									-- or within 64 pixels (=0)
 
a4_6 	<= a4_4 	xor a4_5;	-- current TV beam position
									-- above or below the rocket's 16x16 image
									-- position within 33 - 191 pixels (=1)
									-- or within 32 pixels (=0)

a4_11 <= a4_13 xor a4_12;	-- current TV beam position
									-- to the left or to the right of 
									-- the rocket's 16x16 image position
									-- within 65 - 255 pixels (=1)
									-- or within 64 pixels (=0)

a4_8 	<= a4_10	xor a4_9;	-- current TV beam position
									-- to the left or to the right of 
									-- the rocket's 16x16 image position
									-- within 33 - 191 pixels (=1)
									-- or within 32 pixels (=0)
	
-----------------------------------------------------------------------------	
-- SAUCER MISSILE AI LOGIC: Current TV beam pos very close to rocket?		--
-- A2, 7402																						--
-- quadruple 2-input nor gates															--
--	if the current TV beam position is very close to the rocket vertically 	--
-- and/or horizontally;	sets a flag. Used by downstream logic to prevent	--
-- saucer missile motion vertically and/or horizontally. 						-- 
-- 																								--
-- The complete missile AI logic will determine whether the rocket is to	--
-- the left or to the right of (or on level with) the saucer and whether	--
-- it is below or above (or on plane with) the saucer. This will control	--
-- the saucer missile's launch direction.												--
-- If the rocket and the saucer are very close to each other					--
-- then the saucer missile will not get any movement and instead become 	--
-- a "mine" (a missile that appears like a motionless star that exists 		--
-- for a while and then disappears)														--
-----------------------------------------------------------------------------
a2_2 <= a4_3;
a2_3 <= a4_6;
a2_5 <= a4_11;
a2_6 <= a4_8;

a2_1 <= a2_2 nor a2_3;	-- current TV beam position
								-- above or below the rocket's 16x16 image
								-- position within 32 pixels (=1)
 
a2_4 <= a2_5 nor a2_6;	-- current TV beam position
								-- to the left or to the right of 
								-- the rocket's 16x16 image position
								-- within 32 pixels (=1)

-----------------------------------------------------------------------------	
-- SAUCER MISSILE AI LOGIC: Launch missile!											--
-- when the saucer missile timer is reset and starts counting (c6_1) and	--
-- the missile carrying saucer's last pixel has just been drawn to screen	--
-- (e3_15) then this creats a short combined pulse (g1_3) that will be		--
-- used to:																						--
-- 1) lock the current saucer missile direction input value (A1)	 			--
-- 2) load those values into the saucer missile motion logic and				--
-- allow the saucer missile to launch							 						--
-----------------------------------------------------------------------------
g1_3 	<= c6_1 nand e3_15; 
b6_2 	<= not g1_3;

-----------------------------------------------------------------------------	
-- SAUCER MISSILE AI LOGIC: Load saucer missile direction input values		--
-- input to A1, 7475																			--
-- The inputs, their values and their donwstream impact: 						--
-- c4_14:																						--
-- 0=rocket is closer to the left of current TV beam position					--
-- => right bound missile motion															--
-- 1=rocket is closer to the right of current TV beam position					--
-- => leftbound missile motion															--
--																									--
-- e4_14:																						--
-- 0=rocket is closer above current TV beam position								--
-- => upward missile motion																--
-- 1=rocket is closer below current TV beam position								--
-- => downward missile motion																--
--																									--		
-- c4_14 and e4_14 are the msb for horizontal and vertical rocket count		--
-- which in one view point counts how far "away" from the rocket the TV		--
-- beam is																						--
--																									--	
-- a2_4																							--		
-- 1= current TV beam position to the left or to the right of 					--
--		the rocket's 16x16 image position within 32 pixels							--
--		and should prevent horizontal saucer missile motion						--
-- 0= not within 32 pixels																	--
--																									--
-- a2_1																							--
-- 1= current TV beam position below or above  										--
--		the rocket's 16x16 image position within 32 pixels							--
--		and should prevent vertical saucer missile motion							--
-- 0= not within 32 pixels																	--
-----------------------------------------------------------------------------
a1_2 <= a2_4; 		-- 1d (data input)

a1_3 <= c4_11; 	-- 2d (data input)

a1_6 <= a2_1; 		-- 3d (data input)

a1_7 <= e4_11; 	-- 4d (data input)

a1_13 <= b6_2; 	-- 1c, 2c (enable)

-----------------------------------------------------------------------------
-- SAUCER MISSILE AI LOGIC: Lock saucer missile direction input values		--
-- A1, 7475																						--
-- 4-bit bistable latch																		--
-- when enable is high, output q will follow input data d						--
-- when enable goes low; data input at time of transition  to low 			--
-- will be retained at output q															--
--																									--
-- When missile is about to launch it is synchronized with current TV 		--
-- beam position, and consequently its relative position to the rocket.		--
-----------------------------------------------------------------------------	
process (clk)
begin
if rising_edge (clk) then
	a1_13_old <= a1_13;
	if (a1_13_old = '1') and (a1_13 = '0') then
		a1_15 <= a1_3;
		a1_16 <= a1_2;
		a1_9 	<= a1_7;
		a1_10 <= a1_6;
	end if;
end if;
end process;

-----------------------------------------------------------------------------	
-- SAUCER MISSILE AI LOGIC: horizontal movement feed								--
--																									--
-- a1_15 (=c4_14):																			--
-- 0=rocket is closer to the left of current TV beam position					--
-- => right bound missile motion															--
-- 1=rocket is closer to the right of current TV beam position					--
-- => leftbound missile motion															--
--																									--	
-- a1_16 (=a2_4)																				--
-- 1= current TV beam position to the left or to the right of 					--
--		the rocket's 16x16 image position within 32 pixels							--
--		and should prevent horizontal saucer missile motion						--
-- 0= not within 32 pixels																	--
-----------------------------------------------------------------------------
b1_1	<= a1_15 nor a1_16;	-- right or left motion

-----------------------------------------------------------------------------	
-- SAUCER MISSILE AI LOGIC: vertical movement feed									--
--																									--
-- a1_9 (=e4_14):																				--
-- 0=rocket is closer above current TV beam position								--
-- => upward missile motion																--
-- 1=rocket is closer below current TV beam position								--
-- => downward missile motion																--
--																									--	
-- a1_10 (=a2_1)																				--
-- 1= current TV beam position below or above  										--
--		the rocket's 16x16 image position within 32 pixels							--
--		and should prevent vertical suacer missile motion							--
-- 0= not within 32 pixels																	--
-----------------------------------------------------------------------------
b1_13 <= a1_10 nor a1_9;	-- up or down motion

-----------------------------------------------------------------------------
-- SAUCER MISSILE MOTION: Keep and change position									--
-- 74161 counters: B2, C2, D2, E2														--
--																									--
--	Motion principles:																		--
-- For basic motion principles, please see explanation above for 				--
-- ROCKET MISSILE MOTION.																	--
--																									--
-- bits 0 and 1 are for controlling horizontal movement:							--
-- (bit0=0, bit1=1) => no horizontal movement 										--
-- (bit0=1, bit1=1) => right movement one pixel per 1/60s						--
-- (bit0=1, bit1=0) => left movement one pixel per 1/60s							--
-- 																								--
-- bits 8 and 9 are for controlling vertical movement:	 						--
-- (bit8=0, bit9=1) => no vertical movement											--
-- (bit8=1, bit9=1) => downward movement one pixel per 1/60s					--
-- (bit8=1, bit9=0) => upward movement  one pixel per 1/60s	 					--
--																									--
-- implemented as a 16 bit counter instead of 4 x 4-bit counters 				--
-----------------------------------------------------------------------------
saucer_missile: v74161_16bit
	port map(
			clk => clk,
			clrn  => g1_3,
			ldn => f4_2,
			enp  => '1',
			ent => MB_C,	
			D(15)  => '0',
			D(14)  => '0',
			D(13)  => '0',
			D(12)  => '0',
			D(11)  => '0',
			D(10)  => '0',
			D(9)  => d2_4, -- Down (0) or Up (1)  
			D(8)  => d2_3, -- Vertical movement (0) or not (1)  
			D(7)  => '0',
			D(6)  => '0',
			D(5)  => '0',
			D(4)  => '0',
			D(3)  => '0',
			D(2)  => '0',
			D(1)  => b2_4,  -- Right (0) or Left (1)  
			D(0)  => b2_3,  -- Horizontal movement (0) or not (1)  
			rco => e2_15,
			Q(9) => saucer_missile_freq
			);

b2_4 <= b1_1;			-- Right (0) or Left (1) 

b2_3 <= a1_16;			-- Horizontal movement (0) or not (1)
							-- either constant 1 - no movement; or
							-- constant 0 - "60Hz" horizontal speed
							-- (60 pixels / second)

d2_3 <= a1_10;			-- Vertical movement (0) or not (1)
							-- either constant 1 - no movement; or
							-- constant 0 - "60Hz" vertical speed
							-- (60 pixels / second)							
					
d2_4 <= b1_13;			-- Down (0) or Up (1)  


f4_2 <= not (e2_15);	-- RCO enables the load of value for next cycle  	

-----------------------------------------------------------------------------	
-- Saucer missile video																		--
-----------------------------------------------------------------------------
MB_10 <= e2_15;		-- RCO

-----------------------------------------------------------------------------	
-- Saucer missile audio																		--
-----------------------------------------------------------------------------
--b1_4 <= d2_13 nor c6_1;	-- original schematics (correct)
									-- but can not use freq from d2_13 as the 
									-- audio is generated from a sample
b1_4 <= not c6_1; 			-- instead, to trigger sample

MB_2_saucer <= b1_4;			-- saucer missile sound sample trigger
									-- instead of MB_2
									
saucer_missile_sound <= not saucer_missile_freq and not c6_1;
				
end motion_board_architecture;