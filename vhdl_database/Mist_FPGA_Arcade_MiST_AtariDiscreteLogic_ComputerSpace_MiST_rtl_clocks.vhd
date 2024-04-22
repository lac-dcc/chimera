-----------------------------------------------------------------------------
-- CLOCKS																						--
-- For use with Computer Space FPGA emulator.										--
-- Generates the clocks required to run the CS game,								--
-- to emulate analogue timers and pulse trains,										--	
-- and to run implementation specifics such as:										--
-- sigma-delta audio and interlaced composite video.								--
-- 																								--
-- In the real game; capacitors, NOT gates and schmitt trigger ICs 			--
-- create timers and "pulse trains" that are used for:							--
-- thrust impact(acceleration/deceleration), engine flame motion,				--
-- rotation speed, duration of explosion, rotation speed during explosion,	--
-- duration of missiles, and seconds counters for game time.  					--
--																									--
-- The FPGA emulation "replaces" the analogue parts with digital				--
-- clocks and counters.																		--
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

entity clocks is 
	port(
	clock_50 										: in std_logic;

	thrust_and_rotate_clk 						: out std_logic:='0';

	explosion_clk, explosion_rotate_clk 	: out std_logic;

	timer_base_clk 								: out std_logic;
	rocket_missile_life_time_duration,
	saucer_missile_life_time_duration, 
	saucer_missile_hold_duration,
	signal_delay_duration 						: out integer;
	
	seconds_clk 									: out std_logic			
	);
	
end clocks;

architecture clocks_architecture
				 of clocks is 

-- signals to generate clock
-- that controls:
-- rocket flame motion freq,
-- acceleration/deceleration and
-- rocket rotation speed 
signal thrust_and_rotate_clk_count			: integer:=0; 
signal thrust_and_rotate_clk_buffer 		: std_logic:='0';

-- signals for explosion
-- circuitry logic
signal explosion_clk_count 					: integer:=0; 
signal explosion_clk_buffer 					: std_logic:='0';

-- signals to generate clock used for
-- rotating the rocket rapdily
-- during explosion
signal explosion_rotate_clk_count 			: integer:=0; 
signal explosion_rotate_clk_buffer 			: std_logic:='0';

-- signals used for generating 
-- seconds clock (game time)
signal seconds_clk_count 						: integer :=0;
signal seconds_clk_buffer 						: std_logic:='0';

-----------------------------------------------------------------------------//
begin

-----------------------------------------------------------------------------	
-- creating clock  for thrust, rocket engine flame and rotation				--
-- (based on the 50MHz clock )															--
--	count of 2777778  @ 50 MhZ=> 18 Hz													--
-- measured to 18.2 Hz at real Memory Board											--
-----------------------------------------------------------------------------
process (clock_50)
begin
if clock_50'event and clock_50='1' then
	if thrust_and_rotate_clk_count = 2777778 then  
		thrust_and_rotate_clk_count <= 0;
		thrust_and_rotate_clk_buffer <=  not (thrust_and_rotate_clk_buffer);
	else
		thrust_and_rotate_clk_count <= thrust_and_rotate_clk_count+1;
	end if;
end if;
end process;

-- buffer required
thrust_and_rotate_clk <= thrust_and_rotate_clk_buffer;

-----------------------------------------------------------------------------
-- creating clock  for explosion circuitry; 											--
-- (based on the 50MHz clock )															--
-- use count of 4166667 @ 50 MhZ => 6 Hz 												--
-- measured to 6.13 - 6.19 Hz at real Sync Star Board								--
-----------------------------------------------------------------------------
process (clock_50)
begin
if clock_50'event and clock_50='1' then
	if explosion_clk_count = 4166667 then  
		explosion_clk_count <= 0;
		explosion_clk_buffer <=  not (explosion_clk_buffer);
	else
		explosion_clk_count <= explosion_clk_count+1;
	end if;
end if;
end process;

-- buffer required
explosion_clk <= explosion_clk_buffer;

-----------------------------------------------------------------------------	
-- creating clock to rotate the ship at explosion;									--
-- (based on the 50MHz clock)																--	
-- 147 @ 50 Mhz gives the fundamental explosion clock: 340KHz					--
-- as measured on real Memory Board														--
-----------------------------------------------------------------------------
process (clock_50)
begin
if clock_50'event and clock_50='1' then
	if explosion_rotate_clk_count = 147 then
		explosion_rotate_clk_count <= 0;
		explosion_rotate_clk_buffer <=  not (explosion_rotate_clk_buffer);
	else
		explosion_rotate_clk_count <= explosion_rotate_clk_count+1;
	end if;
end if;
end process;

-- buffer required
explosion_rotate_clk <= explosion_rotate_clk_buffer;

-----------------------------------------------------------------------------
-- creating clock second pulses from the 50 Mhz clock 							--
-- 25.000.000 gives second long clock pulse with 50MHz clock => 1Hz			--
----------------------------------------------------------------------------- 
process (clock_50)
begin
if clock_50'event and clock_50='1' then
	if seconds_clk_count = 25000000 then 
		seconds_clk_count <= 0;
		seconds_clk_buffer <=  not (seconds_clk_buffer);
	else
		seconds_clk_count <= seconds_clk_count+1;
	end if;
end if;
end process;		

-- buffer required
seconds_clk <= seconds_clk_buffer;

-----------------------------------------------------------------------------
-- Creating clock and timer duration used by Motion Board:						--
-- 	> rocket missile life time															--
-- 	> saucer missile life time and duration between missile launches		--
-- 	> signal delay emulation															--
-- Replaces the disrete/analogue timer solutions on the board					--
-- Values set to closely match values measured on real CS boards				--	
-----------------------------------------------------------------------------	
timer_base_clk <= clock_50;
	
rocket_missile_life_time_duration <= 115000000; -- 2,3s
-- calculate rocket_missile_life_time_duration as:
-- rocket_missile_life_time_duration / timer_base_clk  = 2,3s
-- reaching a life time of 2.3 seconds
-- as measured on real CS board set

saucer_missile_life_time_duration <= 115000000; -- 2,3 s
-- calculate saucer_missile_life_time_duration as:
-- saucer_missile_life_time_duration / timer_base_clk = 2.3s
-- reaching a life time of 2.3 seconds
-- as measured on real CS board set

saucer_missile_hold_duration <= 10000000; -- 0.2s
-- calculate saucer_missile_hold_duration as:
-- saucer_missile_hold_duration / timer_base_clk = 0,2s
-- reaching a hold time of 0.2 seconds
-- as measured on real CS board set

signal_delay_duration <= 150000; -- 0,003s (should actually be only 3us)
-- calculate signal_delay_duration as:
-- signal_delay_duration / timer_base_clk = 0,003s
-- reaching a signal delay time of 0.003 seconds
-- measured to 3us on real CS board set

end clocks_architecture;