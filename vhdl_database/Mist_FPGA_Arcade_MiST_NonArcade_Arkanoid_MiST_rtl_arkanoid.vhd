--Authors: Pietro Bassi, Marco Torsello

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use work.arkanoid_package.all;

entity arkanoid is
port
	(
		CLOCK 	            			: in  std_logic;--50
		CLOCKVGA            				: in  std_logic;--25
		RESET              				: in  std_logic;
		K_LEFT             				: in  std_logic;
		K_RIGHT            				: in  std_logic;
		K_PAUSE            				: in  std_logic;
		K_START            				: in  std_logic;
		VGA_R             				: out std_logic_vector(3 downto 0);
		VGA_G               				: out std_logic_vector(3 downto 0);
		VGA_B               				: out std_logic_vector(3 downto 0);
		VGA_HS              				: out std_logic;
		VGA_VS              				: out std_logic;
		audio								   : out std_logic
	);

end;

architecture RTL of arkanoid is

signal ballX            	: integer range -BALL_MAX_SPEED to GAME_WIDTH+BALL_MAX_SPEED := BALL_STARTING_POSX;
signal ballY            	: integer range -BALL_MAX_SPEED to GAME_HEIGHT+BALL_MAX_SPEED := BALL_STARTING_POSY;
signal powerUpX            : natural range 0 to GAME_WIDTH;
signal powerUpY            : natural range 0 to GAME_HEIGHT+100;
signal paddleX            	: integer range -PADDLE_SPEED_X to GAME_WIDTH+PADDLE_SPEED_X := PADDLE_STARTING_POSX;
signal paddleWidth         : natural range PADDLE_STARTING_WIDTH to 2*PADDLE_STARTING_WIDTH := PADDLE_STARTING_WIDTH;
signal currentLevel        : natural range 0 to LEVELS;
signal state            	: state_type;
signal gameTime          	: std_logic;
signal paddleMoveDir			: integer range -1 to 1;
signal brickMatrix			: brick_matrix_type(0 to BRICK_MAX_ROW-1, 0 to BRICK_MAX_COL-1);
signal resetSyncReg     	: std_logic;
signal RESET_N            	: std_logic;
signal bricksForNextLevel	: unsigned(0 to 7);
signal levelComplete			: std_logic;
signal lives					: natural range 0 to MAX_LIVES;
signal lifeLost				: std_logic;
signal levelLoaded			: std_logic;
signal romAddr					: std_logic_vector(10 downto 0);
signal romQ						: std_logic_vector(3 downto 0);
signal powerUpType			: powerup_type;
signal sound					: sound_type;
signal squaredX				: std_logic_vector(15 downto 0);
signal squaredY				: std_logic_vector(15 downto 0);
signal rootX					: std_logic_vector(7 downto 0);
signal rootY					: std_logic_vector(7 downto 0);
signal clear					: std_logic;

begin

	datapath : entity work.arkanoid_datapath
		port map 
		(
			CLOCK					=> clock,
			GAME_LOGIC_UPDATE	=> gameTime,				
			RESET_N				=> RESET_N,				
			PADDLE_MOVE_DIR   => paddleMoveDir,  
			STATE					=> state,    	
			BALL_X				=> ballX,
			BALL_Y				=> ballY,
			PADDLE_X				=> paddleX,
			PADDLE_WIDTH		=> paddleWidth,
			BRICK_MATRIX		=> brickMatrix,
			LEVEL_COMPLETE 	=> levelComplete,
			LIVES					=> lives,
			LIFE_LOST			=> lifeLost,
			LEVEL_LOADED		=> levelLoaded,
			ROM_ADDR				=> romAddr,
			ROM_Q					=> romQ,
			SQUARED_X			=> squaredX,
			SQUARED_Y			=> squaredY,
			ROOT_X				=> rootX,
			ROOT_Y				=> rootY,
			SQRT_CLEAR			=> clear,
			POWERUP_X			=> powerUpX,
			POWERUP_Y			=> powerUpY,
			POWERUP				=> powerUpType,
			SOUND					=> sound
		);	
		
	controller : entity work.arkanoid_controller
		port map 
		(
			CLOCK					=> clock,
			RESET_N				=> RESET_N,
			BUTTON_LEFT       => K_LEFT,
			BUTTON_RIGHT      => K_RIGHT,
			BUTTON_PAUSE      => K_PAUSE,
			BUTTON_START      => K_START,
			PADDLE_MOVE_DIR   => paddleMoveDir,
			STATE             => state,
			LEVEL_COMPLETE		=> levelComplete,
			LIVES					=> lives,
			LIFE_LOST			=> lifeLost,
			LEVEL_LOADED		=> levelLoaded
		);
		
	view : entity work.arkanoid_view
		port map 
		(
			CLOCK						=> clockVGA,			
			RESET_N					=> RESET_N,
			VGA_R						=> VGA_R,
			VGA_G						=> VGA_G,
			VGA_B						=> VGA_B,
			VGA_HS					=> VGA_HS,
			VGA_VS					=> VGA_VS,
			BALL_X					=> ballX/UNIT,
			BALL_Y					=> ballY/UNIT,
			PADDLE_X					=> paddleX/UNIT,
			PADDLE_WIDTH			=> paddleWidth/UNIT,
			BRICK_MATRIX			=> brickMatrix,
			LIVES						=> lives,
			STATE						=> state,
			POWERUP_X				=> powerUpX/UNIT,
			POWERUP_Y				=> powerUpY/UNIT,
			POWERUP					=> powerUpType
		);	
		
	arkanoid_levels_rom : entity work.arkanoid_levels_rom
		port map 
		(
			address					=> romAddr,
			clock						=> clock,
			q							=> romQ
		);
		
	sqrtX : entity work.sqrt
		port map 
		(
			CLOCK 					=> clock,
			CLEAR 					=> clear,	
			DATA_IN 					=> squaredX,
			DATA_OUT 				=> rootX
		);	
	
	sqrtY : entity work.sqrt
		port map 
		(
			CLOCK 					=> clock,
			CLEAR 					=> clear,	
			DATA_IN 					=> squaredY,
			DATA_OUT 				=> rootY
		);
	
	arkanoid_sound : entity work.arkanoid_sound
		port map 
		(
			CLOCK					=> clock,
			RESET_N				=> RESET_N,
			SOUND_PIN 			=> audio,		
			SOUND_CODE			=> sound
		);	
	
	reset_sync : process(clock)
	begin
		if (rising_edge(clock)) then
			resetSyncReg <= RESET;
			RESET_N <= resetSyncReg;
		end if;
	end process;
	
	game_time_generator : process(clock, RESET_N)
		variable counter : integer range 0 to (GAME_LOGIC_UPDATE_RATE-1);
	begin
		if (RESET_N = '0') then
			counter := 0;
			gameTime <= '0';
		elsif (rising_edge(clock)) then
			if(counter = counter'high) then
				counter := 0;
				gameTime <= '1';
			else
				counter := counter+1;
				gameTime <= '0';
			end if;
		end if;
	end process;
		
end architecture;