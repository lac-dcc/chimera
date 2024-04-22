--Authors: Pietro Bassi, Marco Torsello

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
library work;
use work.arkanoid_package.all;

entity arkanoid_controller is
port
	(
		CLOCK									: in  std_logic;
		RESET_N								: in  std_logic;
		BUTTON_LEFT                 	: in  std_logic;
		BUTTON_RIGHT                 	: in  std_logic;
		BUTTON_PAUSE                 	: in  std_logic;
		BUTTON_START                 	: in  std_logic;
		LEVEL_COMPLETE						: in  std_logic;
		LEVEL_LOADED						: in  std_logic;
		LIVES        						: in natural;
		LIFE_LOST       					: in std_logic;
		PADDLE_MOVE_DIR        			: out integer;			
		STATE                 			: out state_type	
	);
end arkanoid_controller;

architecture RTL of arkanoid_controller is

constant DIR_LEFT							: integer := -1;
constant DIR_RIGHT						: integer := 1;

signal currState							: state_type := S_INIT;

signal startRegister						: std_logic:='0';

begin

	StateSwitcher : process(CLOCK, RESET_N)
	
	variable currentLevel				: natural range 0 to LEVELS :=0;
	
	begin		
		if (RESET_N='0') then
			currState<=S_INIT;
		elsif (rising_edge(CLOCK)) then	
			--in order to register the "key down" event only
			startRegister<=BUTTON_START;
		
			case currState is
				--INIT
				when S_INIT=>
						currentLevel:=0;
						currState <= S_CHANGELEVEL;
				--PAUSED
				when S_PAUSED=>
					if (BUTTON_START = '1' and startRegister='0') then
						currState <= S_PLAYING;
					else
						currState <= S_PAUSED;
					end if;
				--PLAYING
				when S_PLAYING=>
					if (BUTTON_PAUSE = '1') then
						currState <= S_PAUSED;
					elsif(LEVEL_COMPLETE='1') then
						currentLevel:=currentLevel+1;
						if(currentLevel/=currentLevel'high) then
							currState <= S_CHANGELEVEL;
						else							
							currState <= S_GAMEWON;
						end if;
					elsif(LIFE_LOST='1') then
						if(LIVES>0) then
							currState <= S_LIFELOST;
						else
							currState <= S_GAMELOST;
						end if;
					end if;
				--CHANGELEVEL
				when S_CHANGELEVEL=>
					if(LEVEL_LOADED='1') then
						currState <= S_PAUSED;
					else
						currState <= S_CHANGELEVEL;
					end if;
				--LIFELOST
				when S_LIFELOST=>
					currState <= S_PAUSED;
				--GAMELOST
				when S_GAMELOST=>
					if (BUTTON_START='1' and startRegister='0') then
						currState <= S_INIT;
					else
						currState <= S_GAMELOST;
					end if;
				--GAMEWON
				when S_GAMEWON=>
					if (BUTTON_START='1' and startRegister='0') then
						currState <= S_INIT;
					else
						currState <= S_GAMEWON;
					end if;
			end case;
		end if;
	end process;
	
	StateOutput : process(currState)
	begin		
		case currState is
			when S_INIT =>
				STATE <= S_INIT;
			when S_PAUSED =>
				STATE <= S_PAUSED;
			when S_PLAYING =>
				STATE <= S_PLAYING;
			when S_CHANGELEVEL =>
				STATE <= S_CHANGELEVEL;
			when S_LIFELOST =>
				STATE <= S_LIFELOST;
			when S_GAMELOST =>
				STATE <= S_GAMELOST;
			when S_GAMEWON =>
				STATE <= S_GAMEWON;
		end case;
	end process;
	
	
	InputProcess : process(CLOCK, RESET_N)
	
	begin
		if (rising_edge(CLOCK)) then	
			--process signals from arkanoid_keyboard and send PADDLE_MOVE_DIR to arkanoid_datapath
			if (BUTTON_LEFT='1') then
					PADDLE_MOVE_DIR<=DIR_LEFT;
				elsif (BUTTON_RIGHT='1') then
					PADDLE_MOVE_DIR<=DIR_RIGHT;
				elsif (BUTTON_LEFT='0' and BUTTON_RIGHT='0') then
					PADDLE_MOVE_DIR<=0;
			end if;
				
		end if;

	end process;
	
end architecture;