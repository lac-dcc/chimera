-----------------------------------------------------------------------------	
-- SYNC STAR BOARD																			--
-- For use with Computer Space FPGA emulator											--
-- Implementation of Computer Space's Sync Star Board								--
-- "wire by wire" and "component by component"/"gate by gate"	based on		--
-- original schematics.																		--
-- With exceptions regarding:																--
-- 	> start/stop & replay logic (impl as state machine instead)				--	
-- 	> analogue/discrete based timers (impl as counters)						--
-- 	> scan counter, sync and star generation logic								--
--		  - 	implemented in separate entity to provide interlaced ntsc	 	--
--				video and overcome Signetics 74161 deviation that impacts		--
--				star generation																--		
-- 	> all flip flops which use asynch clock inputs are replaced with 		--
-- 	  flip flops driven by high freq clock and logic to identify			--
--		  edge changes on the logical clock input										--
--																									--
-- There are plenty of comments throughout the code to make it easier to	--
-- understand the logic, but due to the sheer number of comments there 		--
-- may exist occasional mishaps.			 												--
--																									--
-- This entity is implementation agnostic.											--
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
-- Sync Star Board inputs/outputs are labelled SB_<nn>, where <nn> is 		--
-- according to original schematics input/output labels. 						--
--																									--
-- v1.0																							--
-- by Mattias G, 2015																		--
-- Enjoy!																						--  
-----------------------------------------------------------------------------


library 	ieee;
USE 		ieee.std_logic_1164.all; 
use 		ieee.std_logic_arith.all;
use 		ieee.std_logic_unsigned.all;
library 	work;

--80--------------------------------------------------------------------------|


entity sync_star_board is 
	port (
	reset,
	game_clk 			-- Fundamental game
							-- clock for the whole game's
							-- logical timing
							-- Only used when 
							-- video_signal_type is
							-- set to '1' (ie emulating
							-- original video signalling)
																				: in std_logic;  
	super_clk,			-- Clock to emulate
							-- asynch flip flop logic
					
	explosion_clk,			
	seconds_clk 															: in std_logic;

	SB_3,					-- Saucer Enable
							-- signals that the TV beam
							-- is "sweeping" by the current 
							-- position of one of the
							-- two 16 x 8 pixel
							-- saucer image grids	
	SB_4,					--	Saucer Missile
							-- signals that the TV beam
							-- is "sweeping" by the current 
							-- pixel position of an active
							-- saucer missile  					
	SB_6,					-- Rocket Missile
							-- signals that the TV beam
							-- is "sweeping" by the current 
							-- pixel position of an active
							-- rocket missile  
	SB_7,					-- "start button pressed" signal
	SB_C,					-- "coin inserted" signal
	SB_E,					-- Rocket Enable 
							-- signals that the TV beam
							-- is "sweeping" by the current 
							-- position of the 16 x 16 pixel
							-- rocket image grid
	SB_N					-- rocket & saucer video mix signal
																				: in std_logic;   
	
	SB_2,					-- Saucer Video Enable
							-- active when saucer
							-- can be drawn onto screen (ie its not
							--	in the "pause" state after a
							-- hit or collision)
	SB_5,					-- Rocket Video Enable
							--	active when rocket
							-- can be drawn onto screen (ie its not
							--	in the "pause" state after an
							-- explosion or collision, and its
							-- ongoing game play)
	SB_H,					-- Count Enable
							--	active during the
							-- visible part of the screen to signal
							-- that objects can be moved and drawn
							-- onto screen
	SB_K,					-- audio gate; active when game is on
							-- to open up for audio 
	SB_L,					-- signal to trigger explosion
							-- audio sample
	SB_M,					-- spin; signal to spin rocket
							-- after being hit by saucer missile,
							-- active when spinning
	SB_Y					-- inverse clock out	
																				: out std_logic;
	
	-- signals for
	-- composite video / instead of SB_20
	hsync								: out std_logic;
	vsync								: out std_logic;
	composite_video_signal  	: out std_logic_vector(3 downto 0);
	blank								: out std_logic
	);

end sync_star_board;

architecture sync_star_board_architecture of
				 sync_star_board is 

component scan_counter is
	port (
	game_clk 										: in std_logic;
	hsync												: out std_logic;
	vsync												: out std_logic;
	star_video_out 								: out std_logic;
	count_enable 									: out std_logic;
	blank												: out std_logic;	
	b2_12 											: out std_logic; 
	vertical, horizontal 						: out std_logic_vector (7 downto 0)
	);
end component;

-- statemachine for coin detection,
-- start game and indicate "game on" 
type STATE_TYPE is
(IDLE, COIN_INSERTED, GAME_ON);

signal count_enable, a1_15, c4_14 			: std_logic;

-- signals for score & time display logic
signal j4_8, j2_8, h3_8, h3_6, j3_8,
		 j3_6, j3_12, h3_12 						: std_logic;
signal g3_9, g3_10, g3_11, g3_12,
		 g3_13, g3_14, g3_15 					: std_logic;
signal e5_2											: std_logic;

signal g3_out 										: std_logic_vector (6 downto 0);
signal g3_in 										: std_logic_vector (3 downto 0);

signal g1_8, d2_13, d2_10, c2_6  			: std_logic;
signal d1_11, d1_12, d1_13, c1_11,
		 c1_12, c1_13 			 					: std_logic;
signal c2_3 										: std_logic;
signal g3_7, g3_1, g3_2, g3_6 				: std_logic;
signal f1_11, f1_12, f1_13, f1_14, 
		 e1_11, e1_12, e1_13, e1_14 			: std_logic;
signal j2_6, h1_8, g1_6, f2_6, g2_8,
		 g2_6, e2_6, e2_8, b2_2, d2_4,
		 d2_1 										: std_logic;
signal h2_13, h2_4, h2_10, g1_12, h1_3 	: std_logic;

signal horizontal_position 					: std_logic_vector (7 downto 0)
														:= "00000000";
signal vertical_position 						: std_logic_vector (7 downto 0)
														:= "00000000";

-- signals for score and time keeping
signal f3_3, f3_4, f3_5, f3_6,
		 f3_10, f3_11, f3_12, f3_13,
		 f3_14, f3_2, f3_7, f3_9 				: std_logic;
signal a3_3, a3_4, a3_5,
		 a3_6, a3_10, a3_11, a3_12,
		 a3_13, a3_14, a3_2, a3_7, a3_9 		: std_logic;


signal d3_14, d3_2 								: std_logic;
signal e3_14, e3_2 								: std_logic;
signal h1_6, c5_6, e5_8 						: std_logic;
signal e3_12, e3_11, e3_9, e3_8 				: std_logic;
signal d3_12, d3_11, d3_9, d3_8 				: std_logic;
signal c3_14, c3_2, c3_12, c3_11,
		 c3_9, c3_8 								: std_logic;
signal b3_14, b3_2, b3_12,
		 b3_11, b3_9, b3_8 						: std_logic;

signal b3_count 									: std_logic_vector (3 downto 0);
signal c3_count 									: std_logic_vector (3 downto 0);
signal d3_count 									: std_logic_vector (3 downto 0);
signal e3_count 									: std_logic_vector (3 downto 0);
signal a2_A, a2_B									: std_logic_vector (3 downto 0);

-- signals for replay
signal a2_3, a2_4, a2_5, a2_6,
		 a2_10, a2_11, a2_12,
		 a2_13, a2_15 								: std_logic;
signal c2_11 										: std_logic;

signal SB_F 										: std_logic;

-- signals for explosion circuitry logic
signal a6_8, h2_1, a6_3, a6_11,
		 a6_6, e2_13, e2_4,
		 e2_10, j5_3, c5_8, c5_11 				: std_logic;
signal b6_1 										: std_logic :='1';
signal b5_11, b5_13, b5_12 					: std_logic;
signal b5_3, b5_1, b5_2 						: std_logic;
signal a5_3, a5_1, a5_2 						: std_logic;
signal a4_12, d4_6 								: std_logic;
signal b4_1, b4_3, b4_4, b4_16 				: std_logic;
signal b4_6, b4_9, b4_12, b4_8 				: std_logic;
signal c4_6, c4_9, c4_12, c4_8 				: std_logic; 

-- q output from flip flops that
-- need initial value
signal a5_5, b5_5, b5_9,
		 b4_15, b4_11, c4_11 					: std_logic :='0'; 

-- qn output from flip flops that
-- need initial value
signal a5_6, b5_6, b5_8, b4_10, c4_10 		: std_logic :='1'; 

signal a4_8, a4_6, d4_8, j1_6 				: std_logic;
signal a5_3_1, b5_3_1, b5_11_13,
		 c4_6_8, b4_6_8, b4_1_3 				: std_logic;

-- signals for start/end game
-- circuitry logic
signal SB_D, SB_B 								: std_logic;
--signal SB_7_old 						: std_logic :='1';
signal SB_C_old 						: std_logic :='1';

-- game clock
signal b2_12 										: std_logic;

signal e3_10, c5_3  								: std_logic;
signal e5_12 										: std_logic :='1';
signal d6_6 										: std_logic :='0';
signal d6_8 										: std_logic :='1';
signal a5_11, a5_12, a5_10 					: std_logic;
signal a5_9 										: std_logic :='0';
signal a5_8 										: std_logic :='1';
signal c2_8 										: std_logic;
signal d5_1, d5_3, d5_2 						: std_logic;
signal e5_10 										: std_logic := '0'; 
signal d5_6 										: std_logic :='1';
signal d5_13, d5_11, d5_12, d5_10 			: std_logic;
signal d5_9 										: std_logic := '0';
signal d5_8 										: std_logic := '1';
signal c6_5, c6_6, c6_1 						: std_logic;

signal state 										: STATE_TYPE := IDLE;

-- signals to manage asynchronous
-- clock design embedded in
-- synchronous clk solutions
signal b5_3_old, a5_3_old 						: std_logic;
signal c4_6_old, b4_6_old,
		 b4_1_old, b5_11_old  					: std_logic;
signal d5_11_old, d5_3_old 					: std_logic := '1';
-- set to initial '1' as the initial
-- signal is also '1',
-- to avoid trigger of game
-- start directly

signal e3_14_old, d3_14_old, 
		 c3_14_old, b3_14_old  					: std_logic := '0';

-- signal for composite 
-- star video generation
signal star_video						 			: std_logic;

-- signals for external buttons
-- and coin mechanism
signal signal_ccw, signal_cw,
		 signal_thrust, signal_fire,
		 signal_start, signal_coin 			: std_logic;
 
-----------------------------------------------------------------------------//
begin

-----------------------------------------------------------------------------
-- Game Clock Mapping																		--
-----------------------------------------------------------------------------
SB_Y  <= not b2_12; -- new

-----------------------------------------------------------------------------
-- Composite video sync, scan counter, star generation, game clock			--
-- Corresponds to: 																			--
-- Sync Counter: 		D1, E1, C4 (pin 1-4 / 14-16), C1, F1						--	
-- 						b2_6, b2_4, h1_11													--
-- Sync Generator:	j2_12, j1_3, f2_8, j1_11										--
--	Star Generator:	B1, A1, b2_8														--
-- Game Clock:			b2_12																	--
--																									--
-- Logic that provides either original video signalling or interlaced		--
-- ntsc video signal. As it is not according to original schematics it is	--
-- placed in a separate entity to isolate from rest of original				--
-- schematics.	Functionally it will provide "black box" output					--
-- identical to Computer Space game logic behaviour.								--	
--																									--
--	Star generation also resides in the same entity to emulate a 				--
-- "deviation" in the Signetics 74161 chip, that Computer Space uses,		--
-- versus the "standard" 74161 implementations.										--	
-- The Signetics 74161 allows one counter increment when ENT is low,			--
-- in the case ENT goes low when the clock is also low.							--
-- "Standard"	74161 (eg TI and others) prohibits increments all the time	--
-- when ENT is low. 																			--
-- The star layout on screen is a result of this deviation in Signetics		--
-- implementation of the 74161 counter. A deviation that took a very long	--
-- time to uncover. It was not until measurement data from	a real			-- 
-- Computer Space Board was compared with standard 74161 chip behaviour		--
-- that this piece of the puzzle was solved.											--	 
-----------------------------------------------------------------------------
sync_and_stars: component scan_counter
	port map(game_clk, hsync, vsync, star_video,
	count_enable, blank, b2_12, vertical_position,
	horizontal_position);

a1_15 <= star_video; 
SB_H 	<= count_enable;
c4_14 <= count_enable;

-----------------------------------------------------------------------------
-- Assign counter value from scan counters											--	
-----------------------------------------------------------------------------
d1_11  <= horizontal_position (3);  
d1_12  <= horizontal_position (2);  
d1_13  <= horizontal_position (1);  

e1_11  <= horizontal_position (7); 
e1_12  <= horizontal_position (6); 
e1_13  <= horizontal_position (5); 
e1_14  <= horizontal_position (4); 

c1_11  <= vertical_position (3);
c1_12  <= vertical_position (2);  
c1_13  <= vertical_position (1);  

f1_11  <= vertical_position (7); 
f1_12  <= vertical_position (6); 
f1_13  <= vertical_position (5); 
f1_14  <= vertical_position (4); 

-----------------------------------------------------------------------------
-- COMPOSITE VIDEO OUT																		--
-- Replaces the entire discrete electronics video part in the schematics 	--
-- including SB_20 - except for sync signal (which is a separate signal)	--
-- note j1_6 is steering inverse or not 												--
-- a1_15 is star video NORMAL																--
-- e5_2 is score & time dislay video signal NORMAL									--	
-- c4_14 is count enable																	--
-- SB_N is rocket/saucer video signal													--
-- j5_3 is rocket/saucer missile video signal													--
-----------------------------------------------------------------------------
--composite_video_signal <= c4_14 and  -- count enable
--								 (j1_6 xor (SB_N or e5_2 or a1_15 or j5_3));

composite_video_signal <= j1_6 & (SB_N or j5_3 ) & e5_2 & a1_15;  -- DarFPGA 2017
								 
-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: Seven Segment Display Video								--
-- Outputs the right seven-segment "pixels" depending on where the   	 	--
-- TV beam is currently positioned														--
-- Essentially it decodes the horizontal and vertical position bits (0-3)	--
-- to map segment by segment																--
-----------------------------------------------------------------------------
j2_8 <= not (g3_9 and c1_11 and d2_13);	-- segment e

h3_8 <= not (g3_10 and c1_11 and c2_6);	-- segment d 

h3_6 <= not (g3_11 and c1_11 and c2_3);	-- segment c

j3_8 	<= not (g3_12 and g1_8 and c2_3);  	-- segment b

j3_6 	<= not (g3_13 and g1_8 and d2_10); 	-- segment a

j3_12 <= not (g3_14 and g1_8 and c2_6);  	-- segment f

h3_12 <= not (g3_15 and g1_8 and d2_13); 	-- segment g

j4_8 <= not (j2_8 and h3_8 and h3_6 and	-- segment video mix signal
				 j3_8 and j3_6 and j3_12 and	
				 h3_12);

-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: BCD-TO-SEVEN-SEGMENT DECODER								--
-- G3 7448 		 																				--
-- BCD-TO-SEVEN-SEGMENT DECODERS/DRIVERS 												--
-- 448 pin 1=b, pin 2=c, pin 6=d, pin 7=a 											--
--																									--
-- Decode 4 bit binary into a set of active segments that represent  		--
-- decimal characters (0-9), six strange symbols and one complete blank.	--
-- There are seven segments; a - g	represented by 7 outputs (abcdefg).		--	
-- All segments active = 11111111 (abcdefg)											--
-- no segment active = 0000000 (abcdefg)												--	
-- 																								--
-- 					   ----------------     EXAMPLES	   ---------------		--
-- 																								--
--					       8 = 1000     		  0 = 0000		 	    2 = 0010		--
--				a			=> 1111111         => 1111110		   => 1101101			--
-- 		 -----         ----- 				 ----- 				 ----- 			--
--	 	   I	   I 		  I	  I				I		I						I			--
--	 	f	I		I b	  I     I				I		I						I			--
--			 --g--  			-----					 						 ----- 			--
--			I		I		  I	  I				I		I				I					--
--		e	I		I c     I     I				I		I				I					--
--			 -----		   -----					 -----				 ----- 			--	
--				d																					--
--																									--	
-----------------------------------------------------------------------------
--g3_7 <= a3_7;		-- flawed original schematics
							-- connects the wrong bits from the time&score
							-- keeping part
g3_7 <= a3_9; 			-- revised connection logic for bit 0

--g3_1 <= a3_9; 		-- flawed original schematics
							-- connects the wrong bits from the time&score
							-- keeping part
g3_1 <= a3_7; 			-- revised connection logic for bit 1

g3_2 <= f3_9; 			-- bit 3
g3_6 <= f3_7;  		-- bit 4

g3_in (0) <= g3_7;	-- input a
g3_in (1) <= g3_1;	-- input b
g3_in (2) <= g3_2;	-- input c
g3_in (3) <= g3_6;	-- input d

g3_out <= 
	"1111110" when g3_in = "0000" else
	"0110000" when g3_in = "0001" else
	"1101101" when g3_in = "0010" else
	"1111001" when g3_in = "0011" else
	"0110011" when g3_in = "0100" else
	"1011011" when g3_in = "0101" else
	"0011111" when g3_in = "0110" else
	"1110000" when g3_in = "0111" else
	"1111111" when g3_in = "1000" else
	"1110011" when g3_in = "1001" else	
	"0001101" when g3_in = "1010" else
	"0011001" when g3_in = "1011" else
	"0100011" when g3_in = "1100" else
	"1001011" when g3_in = "1101" else
	"0001111" when g3_in = "1110" else
	"0000000" ;

-- segment output
g3_13 <= g3_out (6);	--output segment a
g3_12 <= g3_out (5);	--output segment b
g3_11 <= g3_out (4);	--output segment c
g3_10 <= g3_out (3);	--output segment d
g3_9 <=  g3_out (2);	--output segment e
g3_15 <= g3_out (1);	--output segment f
g3_14 <= g3_out (0);	--output segment g

-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: Segment display position input 							--
-- Logic to determine when the TV beam's current position matches the		--	
-- position required for individual segments and their "pixels"				--
-- Essentially it decodes the horizontal and vertical position bits (0-3)	--
-----------------------------------------------------------------------------
c2_6 	<= c1_12 and c1_13; 	
d2_10 <= c1_12 nor c1_13; 	
d2_13 <= d1_13 nor d1_12; 	
c2_3 	<= d1_13 and d1_12; 	

g1_8 <= not c1_11;
								
-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: Rocket/Saucer Score and Time Video Enable 			--
-- logic to determine when the TV beam is currently at the vertical			--
-- and horizontal position interval of the screen where either rocket		--
-- score, saucer score or time (tens & unit) shall be be displayed			--
-----------------------------------------------------------------------------
j2_6 	<= not ( g2_6 and g2_8 and f2_6);	-- flag that signals that 
														-- either rocket score, saucer 
														-- score or time (tens&unit) can
														-- be displayed

-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: Score & Time Video Out 									--
-----------------------------------------------------------------------------
h1_3 	<= j4_8 nand j2_6;	-- j4_8 is the "seven segment" video signal
									-- containing the current pixel (black or white)
									-- to display, given the TV beam's current
									-- position, to "draw" score/time characters on 
									-- screen
									-- j2_6 is a flag that indicates whether 
									-- either rocket score, saucer score or time
									-- (tens & unit) should be  displayed or not
									-- (to avoid characters being repeated across
									-- the screen)	
e5_2 	<=  not h1_3; 			-- Score & Time video out signal (inversed to
									-- comply with downstream logic's active level)

-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: UNIT Display Enable			 								--
-- logic to determine when the TV beam is currently at the horizontal		--
-- position interval of the screen where UNITS shall be displayed				--
-----------------------------------------------------------------------------
b2_2 <= not  e1_14;

d2_4 <= d1_11 nor b2_2; 

e2_8 <= not (e1_11 and e1_12 and e1_13 and d2_4); 		-- flag signals UNIT
																		-- can be displayed		
																		
g1_6 	<= not e2_8;												-- flag signals UNIT
																		-- can be displayed
																		-- (set to inverse
																		-- to fit downstream
																		-- active level logic)

-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: TENS Display Enable		 									--
-- logic to determine when the TV beam is currently at the horizontal		--
-- position interval of the screen where TENS shall be displayed				--
-----------------------------------------------------------------------------
d2_1 <= e1_14 nor d1_11;

e2_6 <= not (e1_11 and e1_12 and e1_13 and d2_1);		-- Flag signals TENS
																		-- can be displayed	
																		
-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: TENS and UNIT Display Enable								--
-- logic to determine when the TV beam is currently at the horizontal		--
-- position interval of the screen where TENS or UNIT shall be displayed	--
-----------------------------------------------------------------------------	
h1_8 	<= e2_6 nand e2_8;	-- flag that signals that the TV beam's current
									--	horizontal position is either passing
									-- by the TENS position or UNIT position
									
-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: Rocket Score Display Enable	 							--
-- logic to determine when the TV beam is currently at the vertical			--
-- and horizontal position interval of the screen where rocket score shall	--
-- be displayed																				--
-----------------------------------------------------------------------------
g1_12 <= not f1_12;  

h2_10 <= f1_11 nor g1_12;

g2_8 <= not (g1_6 and f1_14 and f1_13 and h2_10); 		-- g1_6 indicates 
																		-- proper horizontal
																		-- position interval
																		-- (for UNIT)
																		-- f1_11, f1_12, h2_10
																		-- indicate proper
																		-- vertical position
																		-- interval		

-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: Saucer Score Display Enable	 							--
-- logic to determine when the TV beam is currently at the vertical and		--
-- horizontal position interval of the screen where saucer score shall		--
-- be displayed																				--
-----------------------------------------------------------------------------	
h2_13 <= f1_13 nor f1_11;

g2_6 <= not (g1_6 and f1_14 and f1_12 and h2_13); 		-- g1_6 indicates 
																		-- proper horizontal
																		-- position interval
																		-- (for UNIT)
																		-- f1_11, f1_13, h2_13
																		-- indicate proper
																		-- vertical position
																		-- interval 
									
-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: Time Display Enable		 									--
-- logic to determine when the TV beam is currently at the vertical and		--
-- horizontal position interval of the screen where TIME shall be				--
-- displayed (both TENS and UNIT)														--
-----------------------------------------------------------------------------	
h2_4 <= f1_13 nor f1_12;  

f2_6 <= not (h1_8 and h2_4 and f1_11 and f1_14); 		-- h1_8 indicates 
																		-- proper horizontal
																		-- position interval
																		-- (for UNIT & TENS)
																		-- h2_4, f1_11, f1_14
																		-- indicate proper
																		-- vertical position
																		-- interval

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Saucer Display Enable Logic				--
-- verify that saucer can actually be displayed										--
-----------------------------------------------------------------------------
a6_8 <= SB_3 nand b6_1; 	-- SB_3 is saucer_enable from Motion Board
									-- that signals that the TV beam's position is
									-- passing by any of the two saucer's 16x8 image
									-- grid pixels' positions
									-- b6_1 is flagging whether the saucer should
									-- be visible or not (delay after collision
									-- or hit)

SB_2 <= a6_8;					-- Saucer Enable to Memory Board
									-- it is ok to display 
									-- saucer video image
									-- (not to be confused with Saucer Enable
									-- from Motion Board)

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Rocket Display Enable Logic				--
-- verify that the rocket can actually be displayed								--
-----------------------------------------------------------------------------
h2_1 <= SB_E nor c5_8; 		-- SB_E is Rocket Enable from Motion Board
									-- that signals that the TV beam's position is
									-- passing by any of the rocket's 16x16 image
									-- grid pixels' positions
									-- c5_8 is flagging whether the rocket should
									-- be visible or not (delay after collision
									-- or hit)

a6_11 <= h2_1 nand d5_9;	-- Verifies that a game is playing (d5_9)
									-- otherwise the rocket will not be
									-- displayed
									
SB_5 <= a6_11;					-- Rocket Enable to Memory Board
									-- it is ok to display 
									-- rocket video image
									-- (not to be confused with Rocket Enable
									-- from Motion Board)

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Saucer Missile Video Enable Logic		--
-- verify whether saucer missile can be displayed or not							--
-- if a game is on then missile will be displayed, otherwise not				--	
-----------------------------------------------------------------------------
a6_3 <= SB_4 nand d5_9; 	-- SB_4 is saucer_missile video out
									-- which is active when the TV beam's position
									--	is passing by the missile pixel position
									-- d5_9 is flagging whether a game is on or not

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Rocket Missile Video Enable Logic		--
-- verify whether rocket missile can be displayed or not							--
-- if a game is on then missile will be displayed, otherwise not				--	
-----------------------------------------------------------------------------
a6_6 <= SB_6 nand d5_9; 	-- SB_6 is rocket_missile video out
									-- which is active when the TV beam's position
									--	is passing by the missile pixel position
									-- d5_9 is flagging whether a game is or or not		

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Rocket and Saucer Missile Video Out		--
-----------------------------------------------------------------------------
j5_3 	<= a6_3 nand a6_6; 	--  saucer and rocket missile video out
																		
-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Detect collision and missile hit			--
-----------------------------------------------------------------------------
e2_13 <= a6_3 	nor a6_11; 	-- detects rocket hit by saucer missile
e2_4 	<= a6_8 	nor a6_6; 	-- detects saucer hit by rocket missile
e2_10 <= a6_11 nor a6_8; 	-- detects rocket colliding with saucer

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Saucer Visible or Not?						--
-----------------------------------------------------------------------------
b6_1 	<= b5_9 nor b5_5;		-- flags whether saucer should be visible or not
									-- It is not visible for a period of time
									-- after it has collided with the rocket or
									-- it has been hit by a rocket missile	
									
-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Rocket Visible or Not?						--
-----------------------------------------------------------------------------
c5_11 <= a5_5 nand c4_11;	-- signals that saucer should not be visible for 
									-- a period of time after rocket has been spinning
									-- (following being hit by saucer missile)

c5_8 	<= b5_8 nand c5_11;	-- signals that saucer should not be visible
									-- for a period of time
									-- after it has collided with a saucer (b5_8) 
									-- or it has been hit by a saucer missile	(c5_11)

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Rocket & Saucer Collision Flag			--
-- 7474, B5, pin 8-13																		--
-- dual d-type pos edge triggered flipflop w preset & clear						--
-- pin 13 2clrn																				--
-- pin 12 2d																					--
-- pin 11 2clk																					--
-- pin 10 2pren																				--
-- pin 9 2q																						--
-- pin 8 2qn																					--
--																									--
-- Flag is set when rocket and saucer collide, and reset back to normal		--
-- after a while by a timer signal (a4_8)												--
-----------------------------------------------------------------------------
b5_11 <= e2_10; 	-- instant collision detection feeds clk
b5_13 <= a4_8; 	-- timer signal a4_8 feeds clrn

-- Check if Rocket has collided with Saucer
process (super_clk, b5_13)
begin
if b5_13 = '0' then -- clrn
		b5_9 <= '0';
		-- q is cleared when clrn is active low,
		-- as pren is permanently high
		
		b5_8 <= '1';
		-- qn is cleared when clrn is active low,
		-- as pren is permanently high
elsif rising_edge (super_clk) then
	b5_11_old <= b5_11;
	if (b5_11_old = '0') and (b5_11 = '1') then 
		b5_9 <= '1';
		b5_8 <= '0';
	end if;
end if;
end process;

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Saucer Hit By Rocket Missile Flag		--
-- 7474, B5, pin 1-6																			--
-- dual d-type pos edge triggered flipflop w preset & clear						--	
-- pin 1 1clrn																					--
-- pin 2 1d																						--
-- pin 3 1clk																					--
-- pin 4 1pren																					--
-- pin 5 1q																						--
-- pin 6 1qn																					--
--																									--
-- Flag is set when saucer is hit by rocket missile and reset back to		--
-- normal after a while by a timer signal (a4_8)									--
-----------------------------------------------------------------------------
b5_3 <= e2_4; -- instant missile hit detection feeds clk
b5_1 <= a4_8; -- timer signal a4_8 feeds clrn

-- check if Saucer is hit by Rocket missile
process (super_clk, b5_1)
begin
if b5_1 = '0' then -- clrn
	b5_5 <= '0';
	-- q is cleared when clrn is active low, as pren is permanently high
	
	b5_6 <= '1';
	-- qn is cleared when clrn is active low, as pren is permanently high

elsif rising_edge (super_clk) then
	b5_3_old <= b5_3;
	if (b5_3_old = '0') and (b5_3 = '1') then 
		b5_5 <= '1';
		b5_6 <= '0'; -- signal to increase score for rocket player
	end if;
end if;
end process;

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Rocket hit by Saucer Missile Flag		--
-- 7474, A5, pin 1-6																			--
-- dual d-type pos edge triggered flipflop w preset & clear						--
-- pin 1 1clrn																					--
-- pin 2 1d																						--
-- pin 3 1clk																					--	
-- pin 4 1pren																					--
-- pin 5 1q																						--	
-- pin 6 1qn																					--	
--																									--
-- Flag is set when rocket is hit by saucer missile and reset back to		--
-- normal after a while by a timer signal (a4_8)									--
-----------------------------------------------------------------------------
a5_3 <= e2_13; -- instant missile hit detection feeds clk
a5_1 <= a4_8;  -- timer signal a4_8 feeds clrn

-- Check if Rocket has been hit by Saucer missile
process (super_clk, a5_1)
begin
if a5_1 = '0' then -- clrn
	a5_5 <= '0';
	-- q is cleared when clrn is active low,
	-- as pren is permanently high
	
	a5_6 <= '1';
	-- qn is cleared when clrn is active low, 
	-- as pren is permanently high

elsif rising_edge (super_clk) then
	a5_3_old <= a5_3;
	if (a5_3_old = '0') and (a5_3 = '1')then
		a5_5 <= '1';
		a5_6 <= '0'; -- signal to increase score for saucer 
	end if;
end if;
end process;

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Rocket spin signal							--
-----------------------------------------------------------------------------
SB_M <= a5_5; -- spin

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Collision & Explosion Timer Signal		--
-- Signals when the rocket or saucer has been hit by a missile or rocket	--
-- and saucer have collided																--
-- The signal triggers downstream collision timer to start counting the 	--
-- time for collision/explosion "events"												--	
-----------------------------------------------------------------------------
a4_12 <= not (a5_6 and b5_6 and b5_8);

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Fundamental clock								--
-- Creates the fundamental pulse train for timing collision and				--
-- explosion events																			--
-----------------------------------------------------------------------------
d4_6 <= explosion_clk; 

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Frequency divider logic flipflop 1		--
-- 7476, B4, flip flop 1																	--
-- dual master slave jk flip flop with clear											--
-- pin 1 clk 1																					--
-- pin 3 clr 1																					--
-- pin 14 qn																					--
-- pin 15 q 																					--
--																									--
-- Overall B4 and C4(pin 6-12)															--
-- Creates the frequency pulse trains that are the basis for the timing 	--
-- of explosion and collision events (such as rocket spinning, screen 		--
-- inversing/"flashing", explosion sound and removing saucer/rocket from	--	
-- the screen for a while after being hit )											--
-----------------------------------------------------------------------------
b4_1 <= d4_6; 	-- explosion clock
b4_3 <= a4_12; -- clrn

process (super_clk, b4_3)
begin
if b4_3 = '0' then -- clr active low
	b4_15 <= '0';
	b4_1_old <= '0';
elsif rising_edge (super_clk) then
	b4_1_old <= b4_1;
	if (b4_1_old = '1') and (b4_1 = '0') then
	-- data out on falling edge; j,k can be viewed as permanent high => toggle
		b4_15 <= not b4_15;
	end if;
end if;
end process;

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Frequency divider logic flipflop 2		--
-- 7476, B4, flip flop 2																	--	
-- dual master slave jk flip flop with clear											--
-- pin 6 clk 1																					--
-- pin 8 clr 1																					--
-- pin 10 qn																					--
-- pin 11 q 																					--
--																									--
-- Overall B4 and C4(pin 6-12)															--
-- Creates the frequency pulse trains that are the basis for the timing 	--
-- of explosion and collision events (such as rocket spinning, screen 		--
-- inversing/"flashing", explosion sound and removing saucer/rocket from	--	
-- the screen for a while after being hit )											--
-----------------------------------------------------------------------------
b4_6 <= b4_15; -- clk
b4_8 <= a4_12; --clrn

process (super_clk, b4_8)
begin
if b4_8 = '0' then
	b4_11 <= '0';
	b4_10 <= '1';
	b4_6_old <= '0';
elsif rising_edge (super_clk) then
	b4_6_old <= b4_6;
	if (b4_6_old = '1') and (b4_6 = '0') then
	-- data out on falling edge, j,k are permanent high => toggle 
		b4_11 <= not b4_11;
		b4_10 <= not b4_10;
	end if;
end if;
end process;

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION:  Frequency divider logic flipflop 3		--
-- 7476, B4, flip flop 3																	--
-- dual master slave jk flip flop with clear											--
-- pin 6 clk 1																					--
-- pin 8 clr 1																					--
-- pin 10 qn																					--
-- pin 11 q 																					--
--																									--
-- Overall B4 and C4(pin 6-12)															--
-- Creates the frequency pulse trains that are the basis for the timing 	--
-- of explosion and collision events (such as rocket spinning, screen 		--
-- inversing/"flashing", explosion sound and removing saucer/rocket from	--	
-- the screen for a while after being hit )											--
-----------------------------------------------------------------------------
c4_6 <= b4_11; -- clk
c4_8 <= a4_12; -- clrn

process (super_clk, c4_8)
begin
if c4_8 ='0' then
	c4_11 <= '0';
	c4_10 <= '1';
	c4_6_old <= '0';
elsif rising_edge (super_clk) then
	c4_6_old <= c4_6;
	if (c4_6_old = '1') and (c4_6 = '0') then
	-- data out on falling edge; j,k are permanent high => toggle 
		c4_11 <= not c4_11;
		c4_10 <= not c4_10;
	end if;
end if;
end process;

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Collision and Explosion Timer				--
-- is active for the duration of the rocket spin, the time the rocket		--
-- and/or saucer is not visible on the screen following collision or hit	--	
-----------------------------------------------------------------------------
a4_8 <= not (b4_15 and b4_11 and c4_11);

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: screen flash & sound timer					--
-- is active for the duration of screen flash (inverse the screen color)	--
-----------------------------------------------------------------------------
a4_6 <= not (b4_15 and b4_10 and c4_10);

-----------------------------------------------------------------------------
-- COLLISION DETECTION & EXPLOSION: Trigger explosion sound						--
-----------------------------------------------------------------------------
d4_8 <= not a4_6; -- inversing signal to fit sound unit's active level 
SB_L <= d4_8; 	

-----------------------------------------------------------------------------
-- Hyperspace Screen Management															--
-- Signals to video out unit to use inverse video signals (white becomes	--
-- black and black becomes white) 														--
-- Inversing happens either when game is in hyperspace mode (replay) or		--
-- when a collision or missile hit has occurred										--
-----------------------------------------------------------------------------
j1_6 <= d5_6 xor a4_6;	-- normal/hyperspace (nor/hyp)

-----------------------------------------------------------------------------
-- GAME TIME CLOCK																			--
-- provide clk input to the time keeping circuit									--
-----------------------------------------------------------------------------
c5_6 <=  seconds_clk nand d5_9;  -- seconds_clk is called "Game Speed
											-- Adjust" in the original schematics
											-- essentially the speed with which each 
											-- time unit progresses
											-- d5_9 is active high when a game is "on"
											-- and lets c5_6 pass through clock pulses

-----------------------------------------------------------------------------
-- SCORE & TIME KEEPING CIRCUITRY:  Keep and update time unit					--
-- E3, 7490																						--
-- decade counter TIME UNIT																--
-----------------------------------------------------------------------------
e3_14 <= c5_6;	-- clk a
e3_2 	<= e5_8;	-- reseet when high

process (super_clk, e3_2)
begin
if e3_2 = '1' then --- reset
	e3_count <= "0000";
elsif rising_edge (super_clk) then
	e3_14_old <= e3_14;
	if (e3_14_old = '1') and (e3_14 = '0') then  -- falling edge
		if e3_count = "1001" then -- decade counter, reset after reaching 9
			e3_count <= "0000";
		else
			e3_count <= e3_count+1;
		end if;
	end if;
end if;
end process;

e3_12 <= e3_count (0); -- qa
e3_11 <= e3_count (3); -- qd
e3_9 	<= e3_count (1); -- qb
e3_8 	<= e3_count (2); -- qc

-----------------------------------------------------------------------------
-- SCORE & TIME KEEPING CIRCUITRY: Keep and update time tens					--
-- D3, 7490																						--
-- decade counter TIME TENS																--
-----------------------------------------------------------------------------
d3_14 <= e3_11;	-- clk a
d3_2 	<= e5_8;		-- reseet when high

process (super_clk, d3_2)
begin
if d3_2 = '1' then --- reset
	d3_count <= "0000";
elsif rising_edge (super_clk) then
	d3_14_old <= d3_14;
	if (d3_14_old = '1') and (d3_14 = '0') then  -- falling edge
		if d3_count = "1001" then   -- decade counter, reset after reaching 9
			d3_count <= "0000";
		else
			d3_count <= d3_count+1;
		end if;
	end if;
end if;
end process;

d3_12 <= d3_count (0); -- qa
d3_11 <= d3_count (3); -- qd
d3_9 	<= d3_count (1); -- qb
d3_8 	<= d3_count (2); -- qc

-----------------------------------------------------------------------------
-- SCORE & TIME KEEPING CIRCUITRY: keep and update rocket score				--
-- C3, 7493																						--
-- BINARY COUNTER 																			--
-- interestingly they use a binary counter instead of decade					--
-- which results in "strange" symbols when rocket score goes beyond 9		--		
-----------------------------------------------------------------------------
c3_14 <= b5_6;	-- clk a, when rocket missile hits saucer
c3_2 	<= e5_8;	-- reset when high

process (super_clk, c3_2)
begin
if c3_2 = '1' then --- reset
	c3_count <= "0000";
elsif rising_edge (super_clk) then
	c3_14_old <= c3_14;
	if (c3_14_old = '1') and (c3_14 = '0') then  -- falling edge
		if c3_count = "1111" then   -- binary counter, reset after reaching 15
			c3_count <= "0000";
		else
			c3_count <= c3_count+1;
		end if;
	end if;
end if;
end process;

c3_12 <= c3_count (0); -- qa
c3_11 <= c3_count (3); -- qd
c3_9 	<= c3_count (1); -- qb
c3_8 	<= C3_count (2); -- qc

-----------------------------------------------------------------------------
-- SCORE & TIME KEEPING CIRCUITRY: Keep and update saucer score				--
-- B3, 7490																						--
-- decade counter 																			--
-----------------------------------------------------------------------------
b3_14 <= a5_6;	-- clk a,  when saucer missile hits rocket
b3_2 	<= e5_8;	-- reseet when high

process (super_clk, b3_2)
begin
if b3_2 = '1' then --- reset
	b3_count <= "0000";
elsif rising_edge (super_clk) then
	b3_14_old <= b3_14;
	if (b3_14_old = '1') and (b3_14 = '0') then  -- falling edge
		if b3_count = "1001" then   -- decade counter, reset after reaching 9
			b3_count <= "0000";
		else
			b3_count <= b3_count+1;
		end if;
	end if;
end if;
end process;

b3_12 <= b3_count (0); -- qa
b3_11 <= b3_count (3); -- qd
b3_9 	<= b3_count (1); -- qb
b3_8 	<= b3_count (2); -- qc

-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: TENS and Rocket Flag										--
-- This flag is a bit clever as it embeds the input from two unrelated 		--
-- "items":																						--
-- 1) TENS - signal whether the TV beam is within the TENS horizontal		--
-- position																						--
-- 2) Rocket - signal whether the TV beam is within the rocket score's		--
-- horizontal and vertical position														--
--																									--
--	The "dual-info" flag is decomposed in downstream logic to determine 		--	
-- whether to forward TIME TENS or UNITS value to the segment decoder		--
-- if TIME is to be displayed OR whether to forward the rocket's or the 	--
-- saucer's score value to the segment decoder if TIME is not to be			--
-- displayed	   																			--
-----------------------------------------------------------------------------
h1_6 <= e2_6 nand g2_8;

-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: Select score and time(tens/unit) to display			--
-- A3, 74153																					--
-- DUAL 4-LINE TO 1-LINE DATA SELECTOR/MULTIPLEXOR									--
-- (a,b) => output (y1 and y2)															--
-- (0,0) => c0																					--
-- (0,1) => c1																					--	
-- (1,0) => c2																					--
-- (1,1) => c3																					--
-- Depending on the current screen position, the two Selectors A3 and F3 	--
-- forwards the corresponding value from either rocket score,					--
-- saucer score, time tens or time unit to the binary-segment decoder.		--
-- A3 and F3 manages four bits in total, two bits each, from the score and	--
-- time tens/units - as each value has four bits.									--
--																									--
-- A3 forwards bit 0 and bit 1 from rocket/saucer/time unit/time tens		--
-- F3 fowards bit 2 and bit 3 from rocket/saucer/time unit/time tens			--
--																									--
-- When Time Display is enabled (f2_6: active low) then the data				--
-- selector forwards c1 or c2 (tens or units). If TENS flag is set (e2_6	--
-- cleverly embedded in h1_6) then c1(tens) is selected, otherwise unit.	--	
-- 																								--
-- When Time Display is	not enabled														--
-- either c2 or c3 (rocket score or saucer score) are in scope; which one	--
-- depends on whether Rocket Score Display is enabled (g2_8 cleverly			--
-- embedded in h1_6) or not.																--
-----------------------------------------------------------------------------
a3_3 	<= b3_9; 	-- 1c3: saucer score bit qb
a3_4 	<= c3_9; 	-- 1c2: rocket score bit qb
a3_5 	<= d3_9; 	-- 1c1: time tens bit qb
a3_6 	<= e3_9; 	-- 1c0: time units bit qb 

a3_10 <= e3_12; 	-- 2c0: time units bit qa
a3_11 <= d3_12;	-- 2c1: time tens bit qa
a3_12 <= c3_12; 	-- 2c2: rocket score bit qa
a3_13 <= b3_12; 	-- 2c3: saucer score bit qa

a3_14 <= h1_6;		-- a select
a3_2 	<= f2_6;		-- b select

a3_7 <= -- y1
	a3_6 when (a3_14 = '0' and a3_2 = '0') else
	a3_5 when (a3_14 = '1' and a3_2 = '0') else
	a3_4 when (a3_14 = '0' and a3_2 = '1') else
	a3_3; 

	
a3_9 <= -- y2
	a3_10 when (a3_14 = '0' and a3_2 = '0') else
	a3_11 when (a3_14 = '1' and a3_2 = '0') else
	a3_12 when (a3_14 = '0' and a3_2 = '1') else
	a3_13;

-----------------------------------------------------------------------------
-- DISPLAY SCORE & TIME: Select score and time (tens/unit) to display		--
-- F3, 74153																					--
-- DUAL 4-LINE TO 1-LINE DATA SELECTOR/MULTIPLEXOR									--
-- (a,b) => output (y1 and y2)															--
-- (0,0) => c0																					--
-- (0,1) => c1																					--	
-- (1,0) => c2																					--
-- (1,1) => c3																					--
-- Depending on the current screen position, the two Selectors A3 and F3 	--
-- forwards the corresponding value from either rocket score,					--
-- saucer score, time tens or time unit to the binary-segment decoder.		--
-- A3 and F3 manages four bits in total, two bits each, from the score and	--
-- time tens/units - as each value has four bits.									--
--																									--
-- A3 forwards bit 0 and bit 1 from rocket/saucer/time unit/time tens		--
-- F3 fowards bit 2 and bit 3 from rocket/saucer/time unit/time tens			--
--																									--
-- When Time Display is enabled (f2_6: active low) then the data				--
-- selector forwards c1 or c2 (tens or units). If TENS flag is set (e2_6	--
-- cleverly embedded in h1_6) then c1(tens) is selected, otherwise unit.	--	
-- 																								--
-- When Time Display is	not enabled														--
-- either c2 or c3 (rocket score or saucer score) are in scope; which one	--
-- depends on whether Rocket Score Display is enabled (g2_8 cleverly			--
-- embedded in h1_6) or not.																--
-----------------------------------------------------------------------------
f3_3 	<= b3_11; 	-- 1c3: saucer score bit qd
f3_4 	<= c3_11; 	-- 1c2: rocket score bit qd
f3_5 	<= d3_11; 	-- 1c1: time tens bit qd
f3_6 	<= e3_11; 	-- 1c0: time units bit qd 

f3_10 <= e3_8; 	-- 2c0: time units bit qc
f3_11 <= d3_8;		-- 2c1: time tens bit qc
f3_12 <= c3_8; 	-- 2c2: rocket score bit qc
f3_13 <= b3_8; 	-- 2c3: saucer score bit qc

f3_14 <= h1_6;		-- a select
f3_2 	<= f2_6; 	-- b select

f3_7 <= -- y1
	f3_6 when (f3_14 = '0' and f3_2 = '0') else
	f3_5 when (f3_14 = '1' and f3_2 = '0') else
	f3_4 when (f3_14 = '0' and f3_2 = '1') else
	f3_3; 
	
f3_9 <= -- y2
	f3_10 when (f3_14 = '0' and f3_2 = '0') else
	f3_11 when (f3_14 = '1' and f3_2 = '0') else
	f3_12 when (f3_14 = '0' and f3_2 = '1') else
	f3_13; 

-----------------------------------------------------------------------------
-- REPLAY CIRCUITRY: Compare Player/Rocket score with Saucer score			--
-- A2, 9324																						--
-- 5-Bit comparator																			--
-- comparing score between rocket and saucer											--
-- if player/rocket score is higher than saucer score then set a2_15 flag	--
-----------------------------------------------------------------------------	
a2_3 <= b3_12;
a2_4 <= b3_9;
a2_5 <= b3_8;
a2_6 <= b3_11;

a2_10 <= c3_11;
a2_11 <= c3_8;
a2_12 <= c3_9;
a2_13 <= c3_12;

a2_A (0) <=  a2_13;
a2_A (1) <=  a2_12;
a2_A (2) <=  a2_11;
a2_A (3) <=  a2_10;

a2_B (0) <=  a2_3;
a2_B (1) <=  a2_4;
a2_B (2) <=  a2_5;
a2_B (3) <=  a2_6;

-- checks if rocket score is higher than saucer score
a2_15 <= '1' when a2_A > a2_B else '0'; 

-----------------------------------------------------------------------------
-- REPLAY CIRCUITRY:	Set Replay or not													-- 
--																									--
-- SB_F = '1'; flag allows for replay													--
-----------------------------------------------------------------------------
SB_F <= '1';
c2_11 <= SB_F and a2_15; -- determine replay or not, depending on score

-----------------------------------------------------------------------------
-- START/END GAME: Start Game Process													--
--																									--
-- start game circuitry is not fully reproduced										--
-- a "state machine" represents the logic												--
--																									--	
-- SB_7 connected to Start button  on player control panel.						--
--																									--
-- SB_C connected to coin microswitch													--
-----------------------------------------------------------------------------	
process (super_clk, reset)
begin
if reset = '1' then
	state <= IDLE;
	e5_12 <= '0';
	d6_8 <= '0';
elsif rising_edge (super_clk) then
	--SB_7_old <= SB_7;
	SB_C_old <= SB_C;
	
	case state is
		when IDLE =>
			e5_12 <= '0';
			d6_8 <= '1';
			if SB_C_old = '0' and SB_C = '1' then
				e5_12 <= '1';
				state <= COIN_INSERTED;
			end if;
		
		when COIN_INSERTED =>   
			d6_8 <= '1';
			e5_12 <= '1';
			--if SB_7_old = '0' and SB_7 = '1' then 
				d6_8 <= '0';
				state <= GAME_ON;
			--end if;		
			
		when GAME_ON =>  
			d6_8 <= '1';
			e5_12 <= '1';
			if d5_9 = '0' then
				state <= IDLE;
				e5_12 <= '0';			
			end if;		

		when others =>          
			state <= IDLE;
			e5_12 <= '0';
			d6_8 <= '1';
				
	end case;
end if;	
end process;

-----------------------------------------------------------------------------
-- START/END GAME: Replay or not															--
-- will signal for replay if player score is greater than saucer score 		--
-- (c2_11) and if player is not already in replay mode (d5_6)					-- 
-----------------------------------------------------------------------------	
c2_8 <= c2_11 and d5_6;

-----------------------------------------------------------------------------
-- START/END GAME: Signal that Time = 99												--
-- signals that game time has reached 99												--
-- downstream logic will determine whether to stop the game or go for 		--
-- replay																						--
-----------------------------------------------------------------------------	
e5_10 <= not d3_11;

-----------------------------------------------------------------------------
-- START/END GAME: Replay Flag															--
-- D5, 7474, pin 1-6																			--
-- d5_6 signals whether game is in replay mode or not								--		
-----------------------------------------------------------------------------	
d5_1 <= e5_12; -- clrn
d5_3 <= e5_10; -- clk
d5_2 <= c2_8; 	-- d  : replay or not

process(super_clk, d5_1)
begin
	if d5_1 = '0' then
		d5_6 <= '1';	-- qn is cleared when clrn is active low
	elsif rising_edge (super_clk) then
		d5_3_old <= d5_3;
		if (d5_3_old = '0') and (d5_3 = '1') then
			d5_6 <= not d5_2;
		end if;
	end if;
end process;

-----------------------------------------------------------------------------
-- START/END GAME: Game On/Off Flag														--
-- D5, 7474, pin 8-13																		--
-- d5_9 signals whether game is on or off, 1-on, 0-off							--
-- d5_8 is the inverse of d5_9															--
-----------------------------------------------------------------------------
d5_13 <= e5_12; 	-- clrn
d5_11 <= e5_10;	-- clk
d5_12 <= c2_8; 	-- d
d5_10 <= d6_8; 	-- pren 

process(super_clk, d5_13, d5_10)
begin
	if d5_13 = '0' then
		d5_9 <= '0'; 	-- q is cleared when clrn is active low
		d5_8 <= '1';	-- qn is cleared when clrn is active low
	elsif d5_10 = '0' then 
		d5_9 <= '1'; 	-- q is set to high when pren is active low
		d5_8 <= '0';	-- qn is set to low when pren is active low
	elsif rising_edge (super_clk) then
		d5_11_old <= d5_11;
		if (d5_11_old = '0') and (d5_11 = '1') then
			d5_9 <= d5_12;
			d5_8 <= not d5_12;
		end if;
	end if;
end process;

-----------------------------------------------------------------------------
-- START/END GAME: Reset Score and Time (Unit and Tens)							--
-- signals to score and time keeping units to reset score and time			--
-----------------------------------------------------------------------------
e5_8 <= not d6_8; 

-----------------------------------------------------------------------------
-- START/END GAME: Audio On/Off															--
-- signals to audio unit to switch on the sound, incl backgrund noise, 		--	
-- when a game is playing, otherwise switch off										--
-----------------------------------------------------------------------------
SB_K <= d5_8; -- audio gate signal

end sync_star_board_architecture;