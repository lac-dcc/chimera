--Authors: Pietro Bassi, Marco Torsello

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;
library work;
use work.arkanoid_package.all;

entity arkanoid_sound is
port
	(
		CLOCK					: in std_logic;
		RESET_N				: in std_logic;
		SOUND_CODE			: in sound_type;
		SOUND_PIN 			: out std_logic	
	);
end arkanoid_sound;

architecture RTL of arkanoid_sound is
	constant CLOCK_FREQUENCY : integer := 50000000;
	constant SOUND_PADDLE_FREQUENCY : integer := 494; -- Si4 (B4)
	constant SOUND_BRICK_FREQUENCY : integer := 740; -- Fa#5 (F#5)
	constant SOUND_BOUND_FREQUENCY : integer := 247; -- Si3 (B3)
	constant CLOCK_DIVIDER_PADDLE : integer := CLOCK_FREQUENCY / SOUND_PADDLE_FREQUENCY /2 - 1;
	constant CLOCK_DIVIDER_BRICK : integer := CLOCK_FREQUENCY / SOUND_BRICK_FREQUENCY /2 - 1;
	constant CLOCK_DIVIDER_BOUND : integer := CLOCK_FREQUENCY / SOUND_BOUND_FREQUENCY /2 - 1;
	constant COUNTER_SIZE : integer := 32;
	constant SOUND_DURATION : integer := CLOCK_FREQUENCY/12;	
	signal soundPaddle :std_logic;
	signal soundBrick :std_logic;		
	signal soundBound :std_logic;		
	signal counterSoundPaddle : std_logic_vector (COUNTER_SIZE - 1 downto 0);
	signal counterSoundBrick : std_logic_vector (COUNTER_SIZE - 1 downto 0);
	signal counterSoundBound : std_logic_vector (COUNTER_SIZE - 1 downto 0);	
	signal lengthCounter : std_logic_vector (COUNTER_SIZE - 1 downto 0);
	
begin
	
	SoundProcess: process(CLOCK)  	
	begin
		if( rising_edge(CLOCK) )then
			if(counterSoundPaddle = 0) then
				counterSoundPaddle <= std_logic_vector(to_unsigned(CLOCK_DIVIDER_PADDLE,COUNTER_SIZE));
				soundPaddle <= not soundPaddle;
			else
				counterSoundPaddle <= counterSoundPaddle - 1 ;
			end if;
			
			if(counterSoundBrick = 0) then
				counterSoundBrick <= std_logic_vector(to_unsigned(CLOCK_DIVIDER_BRICK,COUNTER_SIZE));
				soundBrick <= not soundBrick;
			else
				counterSoundBrick <= counterSoundBrick - 1 ;
			end if;
			
			if(counterSoundBound = 0) then
				counterSoundBound <= std_logic_vector(to_unsigned(CLOCK_DIVIDER_BOUND,COUNTER_SIZE));
				soundBound <= not soundBound;
			else
				counterSoundBound <= counterSoundBound - 1 ;
			end if;
		end if;		
	end process; 

	SoundCoordinator: process(CLOCK,RESET_N,SOUND_CODE)  
	variable sound :sound_type := PLAY_NULL;
	begin
		if( rising_edge(CLOCK) )then		
			if( RESET_N = '0' ) then
				lengthCounter <= std_logic_vector(to_unsigned(SOUND_DURATION,COUNTER_SIZE));
				SOUND_PIN<= '0';
				sound:=PLAY_NULL;
			else 				
				if(SOUND_CODE/=PLAY_NULL) then
					lengthCounter <= std_logic_vector(to_unsigned(SOUND_DURATION,COUNTER_SIZE));
					sound := SOUND_CODE;
				else 
					lengthCounter <= lengthCounter  - 1;		
				end if;
				
				if(lengthCounter > 0) then 	
				
					case sound is
						when PLAY_PADDLE 	=> SOUND_PIN<= soundPaddle;
						when PLAY_BRICK 	=> SOUND_PIN<= soundBrick;
						when PLAY_BOUND 	=> SOUND_PIN<= soundBound;	
						when others =>	SOUND_PIN<= '0';
					end case;
				else
					SOUND_PIN<= '0';			
					sound:=PLAY_NULL;
				end if;
			end if;
		end if;
	end process;


end architecture;