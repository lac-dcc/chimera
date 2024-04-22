--Authors: Pietro Bassi, Marco Torsello

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
library work;
use work.arkanoid_package.all;

entity arkanoid_datapath is
port
	(
		CLOCK									: in std_logic;
		GAME_LOGIC_UPDATE					: in std_logic;
		RESET_N								: in std_logic;
		PADDLE_MOVE_DIR              	: in integer;
		STATE									: in state_type;
		ROM_Q									: in std_logic_vector(3 downto 0);
		ROOT_X								: in std_logic_vector (7 downto 0);
		ROOT_Y								: in std_logic_vector (7 downto 0);
		LIFE_LOST							: inout std_logic;
		LEVEL_LOADED						: inout std_logic;
		ROM_ADDR								: inout std_logic_vector(10 downto 0);
		SQUARED_X							: out std_logic_vector (15 downto 0);
		SQUARED_Y							: out std_logic_vector (15 downto 0);
		SQRT_CLEAR							: out std_logic;
		POWERUP								: out powerup_type;
		SOUND									: out sound_type;	
		LEVEL_COMPLETE         			: out std_logic;
		BALL_X								: out integer;
		BALL_Y								: out integer;
		POWERUP_X							: out integer;
		POWERUP_Y							: out integer;
		PADDLE_X								: out integer;
		PADDLE_WIDTH						: out integer;
		LIVES									: out natural;
		BRICK_MATRIX						: out brick_matrix_type(0 to BRICK_MAX_ROW-1, 0 to BRICK_MAX_COL-1)
	);
end arkanoid_datapath;

architecture RTL of arkanoid_datapath is

--ball signals
signal ballX								: integer range -BALL_MAX_SPEED to GAME_WIDTH+BALL_MAX_SPEED := BALL_STARTING_POSX;
signal ballY								: integer range -BALL_MAX_SPEED to GAME_HEIGHT+BALL_MAX_SPEED := BALL_STARTING_POSY;
signal X										: integer range ballX'low to ballX'high;
signal Y										: integer range ballY'low to ballY'high;

signal ballTopX							: integer range ballX'low to ballX'high;
signal ballBotX							: integer range ballX'low to ballX'high;
signal ballLeftX							: integer range ballX'low to ballX'high;
signal ballRightX							: integer range ballX'low to ballX'high;
signal ballTopLeftX						: integer range ballX'low to ballX'high;
signal ballTopRightX						: integer range ballX'low to ballX'high;
signal ballBotLeftX						: integer range ballX'low to ballX'high;
signal ballBotRightX						: integer range ballX'low to ballX'high;
signal ballTopY							: integer range ballX'low to ballX'high;
signal ballBotY							: integer range ballX'low to ballX'high;
signal ballLeftY							: integer range ballX'low to ballX'high;
signal ballRightY							: integer range ballX'low to ballX'high;
signal ballTopLeftY						: integer range ballX'low to ballX'high;
signal ballTopRightY						: integer range ballX'low to ballX'high;
signal ballBotLeftY						: integer range ballX'low to ballX'high;
signal ballBotRightY						: integer range ballX'low to ballX'high;

signal ballAngleX							: integer range -UNIT to UNIT:=0;
signal ballAngleY							: integer range -UNIT to UNIT:=0;
signal signX								: integer range -1 to 1;
signal signY								: integer range -1 to 1;
signal squaredSpeed						: natural range 0 to BALL_MAX_SPEED**2;

--paddle signals
signal paddleX								: integer range -PADDLE_SPEED_X to GAME_WIDTH+PADDLE_SPEED_X := PADDLE_STARTING_POSX;
signal paddleWidth						: natural range PADDLE_STARTING_WIDTH to 2*PADDLE_STARTING_WIDTH := PADDLE_STARTING_WIDTH;
signal nextPaddleX						: integer range paddleX'low to paddleX'high;
shared variable paddleEnlarged		: std_logic:='0';

--powerup signals
signal powerUpX							: natural range 0 to GAME_WIDTH;
signal powerUpY							: natural range 0 to GAME_HEIGHT+100;
signal powerUpFalling					: std_logic:='0';
signal powerUpType						: powerup_type;
signal powerUpCounter					: unsigned(0 to 4);
signal powerUpCaught						: powerup_type;

--current level signals
signal brickMatrix						: brick_matrix_type(0 to BRICK_MAX_ROW-1, 0 to BRICK_MAX_COL-1);
shared variable i							: natural range 0 to BRICK_MAX_ROW:=BRICK_MAX_ROW;
shared variable k							: natural range 0 to BRICK_MAX_COL:=BRICK_MAX_COL;
signal romRdy								: unsigned(3 downto 0):="0000";
signal romAddr								: unsigned(10 downto 0);
signal bricksForNextLevel				: natural range 0 to BRICK_MAX_ROW*BRICK_MAX_COL*UNIT:=1;
signal i_rom								: natural range 0 to BRICK_MAX_ROW;
signal k_rom								: natural range 0 to BRICK_MAX_COL;	
shared variable brickHit				: brickhit_type;
shared variable brickX					: natural range 0 to BOUND_RIGHT;
shared variable brickY					: natural range 0 to BOUND_BOTTOM;
signal brickCollisionCheckEnded		: std_logic;

--game signals
signal gameLogicEnded					: std_logic:='1';
signal currentLevel						: natural range 0 to LEVELS-1;
signal livesLeft							: natural range 0 to MAX_LIVES;

begin
		
	LevelProcess : process(CLOCK, RESET_N, brickMatrix)
		
	begin		
		if(rising_edge(CLOCK)) then	
			--INIT
			if(STATE=S_INIT) then
				currentLevel<=0;
				romAddr<="00000000000";
				romRdy<="0000";
				LEVEL_LOADED<='0';
				i_rom<=0;
				k_rom<=0;
				bricksForNextLevel<=0;
			--CHANGELEVEL
			elsif(STATE=S_CHANGELEVEL) then
				LEVEL_COMPLETE<='0';
				--load level
				if(LEVEL_LOADED='0') then
					ROM_ADDR<=std_logic_vector(romAddr(ROM_ADDR'range)); 
					romAddr<=romAddr+"00000000001";
					if(i_rom/=BRICK_MAX_ROW) then
						brickMatrix(i_rom,k_rom) <= unsigned(ROM_Q);
						if(unsigned(ROM_Q)>=B_WHITE and unsigned(ROM_Q)<=B_GREY5 and romRdy="0011") then
							bricksForNextLevel<=bricksForNextLevel+1;
						end if;
						if(romRdy<"0011") then
							romRdy<=romRdy+1;
						else
							if(k_rom/=BRICK_MAX_COL-1)then
								k_rom<=k_rom+1;
							else
								k_rom<=0;		
								i_rom<=i_rom+1;
							end if;
						end if;
					else
						LEVEL_LOADED<='1';
					end if;
				--when level has been loaded
				else
					romRdy<="0000";
					i_rom<=0;
					k_rom<=0;
					LEVEL_LOADED<='0';
					LEVEL_COMPLETE<='0';						
				end if;
			--PLAYING
			elsif(STATE=S_PLAYING) then	
				--update brick matrix if a collision has happened
				if((brickHit=B_BOUNCE or brickHit=B_DESTROYED) and brickCollisionCheckEnded='1') then
					brickMatrix(i,k)<=brick_collision_result(brickMatrix(i,k));
					if(brickMatrix(i,k)>=B_WHITE and brickMatrix(i,k)<=B_GREY1) then
						bricksForNextLevel<=bricksForNextLevel-1;
					end if;
				end if;
				
				--game logic update
				if(GAME_LOGIC_UPDATE='1') then
					--check if there are no bricks left
					if(bricksForNextLevel=0) then
						if(currentLevel=LEVELS-1) then
							currentLevel<=0;
						else
							currentLevel<=currentLevel+1;
							romAddr<=romAddr+"00000000100";
						end if;
						LEVEL_COMPLETE<='1';
					end if;
				end if;
			end if;

		end if; --clock if
			
		BRICK_MATRIX<=brickMatrix;

	end process;
	
	
	BallProcess : process(CLOCK, RESET_N, ballX, ballY, livesLeft)
	
	variable hitPoint								: integer range -1 to 9;
	
	begin		
		if(rising_edge(CLOCK)) then	
			--INIT
			if(STATE=S_INIT) then
				livesLeft<=STARTING_LIVES;
				LIFE_LOST<='0';
			--CHANGELEVEL
			elsif(STATE=S_CHANGELEVEL) then
				if(LEVEL_LOADED='1') then
					ballX<=BALL_STARTING_POSX;
					ballY<=BALL_STARTING_POSY;
					ballAngleX<=0;
					ballAngleY<=UNIT;
					signX<=1;
					signY<=1;
					
					i:=BRICK_MAX_ROW;
					k:=BRICK_MAX_COL;
				end if;	
			--PAUSED
			elsif(STATE=S_PAUSED) then
				LIFE_LOST<='0';
			--LIFELOST
			elsif(STATE=S_LIFELOST) then
				ballX<=BALL_STARTING_POSX;
				ballY<=BALL_STARTING_POSY;
				ballAngleX<=0;
				ballAngleY<=UNIT;
				signX<=1;
				signY<=1;
			--PLAYING
			elsif(STATE=S_PLAYING) then
				SOUND<=PLAY_NULL;
				brickCollisionCheckEnded<='0';
				--after game logic phase, send squares of x and y speed components to sqrt entities
				if(gameLogicEnded='1') then
					SQRT_CLEAR<='1';
					SQUARED_X<=std_logic_vector(to_unsigned(squaredSpeed*ballAngleX, SQUARED_X'length));
					SQUARED_Y<=std_logic_vector(to_unsigned(squaredSpeed*ballAngleY, SQUARED_Y'length));
					gameLogicEnded<='0';
					--reset i and k values so the bounce check can start
					i:=0;
					k:=0;
				else
					SQRT_CLEAR<='0';
				end if;
				
				--store in X and Y the prediction of ball position, based on square roots of x and y speed components
				X<=ballX+to_integer(unsigned(ROOT_X))*signX;
				Y<=ballY+to_integer(unsigned(ROOT_Y))*signY;
				ballTopX			<=	X+BALL_SIZE/2;
				ballTopY			<= Y;
				ballBotX			<= X+BALL_SIZE/2;
				ballBotY			<=	Y+BALL_SIZE-1*UNIT;
				ballLeftX		<=	X;
				ballLeftY		<=	Y+BALL_SIZE/2;
				ballRightX		<=	X+BALL_SIZE-1*UNIT;
				ballRightY		<=	Y+BALL_SIZE/2;
				ballTopLeftX	<=	X+2*UNIT;
				ballTopLeftY	<=	Y+2*UNIT;
				ballTopRightX	<=	X+BALL_SIZE-3*UNIT;
				ballTopRightY	<=	Y+2*UNIT;
				ballBotLeftX	<=	X+2*UNIT;
				ballBotLeftY	<=	Y+BALL_SIZE-3*UNIT;
				ballBotRightX	<=	X+BALL_SIZE-3*UNIT;
				ballBotRightY	<=	Y+BALL_SIZE-3*UNIT;
			
				--brick matrix bounce
				if(i/=BRICK_MAX_ROW and brickHit=B_NULL) then
					brickX:=k*BRICK_WIDTH+BRICK_MATRIX_X;
					brickY:=i*BRICK_HEIGHT+BRICK_MATRIX_Y;
					--if there is a collision with a non-empty brick
					if(brickMatrix(i,k)>B_EMPTY) then
						--ball hits the LEFT side of the brick
						if(is_colliding(ballRightX,ballRightY,brickX,brickY)) then
							signX<=-1;
							if(brick_collision_result(brickMatrix(i,k))=B_EMPTY) then
								brickHit:=B_DESTROYED;
							else
								brickHit:=B_BOUNCE;
							end if;
							ballX<=2*brickX-2*BALL_SIZE-X;
						--ball hits the RIGHT side of the brick
						elsif(is_colliding(ballLeftX,ballLeftY,brickX,brickY)) then
							signX<=1;
							if(brick_collision_result(brickMatrix(i,k))=B_EMPTY) then
								brickHit:=B_DESTROYED;
							else
								brickHit:=B_BOUNCE;
							end if;
							ballX<=2*brickX+2*BRICK_WIDTH-X;
						--ball hits the TOP side of the brick
						elsif(is_colliding(ballBotX,ballBotY,brickX,brickY)) then
							signY<=-1;
							if(brick_collision_result(brickMatrix(i,k))=B_EMPTY) then
								brickHit:=B_DESTROYED;
							else
								brickHit:=B_BOUNCE;
							end if;
							ballY<=2*brickY-2*BALL_SIZE-Y;
						--ball hits the BOT side of the brick
						elsif(is_colliding(ballTopX,ballTopY,brickX,brickY)) then
							signY<=1;
							if(brick_collision_result(brickMatrix(i,k))=B_EMPTY) then
								brickHit:=B_DESTROYED;
							else
								brickHit:=B_BOUNCE;
							end if;
							ballY<=2*brickY+2*BRICK_HEIGHT-Y;
							
						--ball hits the BOTTOM-LEFT edge of the brick
						elsif(is_colliding(ballTopRightX,ballTopRightY,brickX,brickY)) then
							signX<=-1;
							signY<=1;
							if(brick_collision_result(brickMatrix(i,k))=B_EMPTY) then
								brickHit:=B_DESTROYED;
							else
								brickHit:=B_BOUNCE;
							end if;
						--ball hits the BOTTOM-RIGHT edge of the brick
						elsif(is_colliding(ballTopLeftX,ballTopLeftY,brickX,brickY)) then
							signX<=1;
							signY<=1;
							if(brick_collision_result(brickMatrix(i,k))=B_EMPTY) then
								brickHit:=B_DESTROYED;
							else
								brickHit:=B_BOUNCE;
							end if;
						--ball hits the TOP-LEFT edge of the brick
						elsif(is_colliding(ballBotRightX,ballBotRightY,brickX,brickY)) then
							signX<=-1;
							signY<=-1;
							if(brick_collision_result(brickMatrix(i,k))=B_EMPTY) then
								brickHit:=B_DESTROYED;
							else
								brickHit:=B_BOUNCE;
							end if;
						--ball hits the TOP-RIGHT edge of the brick
						elsif(is_colliding(ballBotLeftX,ballBotLeftY,brickX,brickY)) then
							signX<=1;
							signY<=-1;
							if(brick_collision_result(brickMatrix(i,k))=B_EMPTY) then
								brickHit:=B_DESTROYED;
							else
								brickHit:=B_BOUNCE;
							end if;
						end if;
					end if;
					
					if(brickHit=B_NULL) then
						k:=k+1;
						if(k=BRICK_MAX_COL) then
							k:=0;
							i:=i+1;
						end if;
					else
						brickCollisionCheckEnded<='1';
						SOUND<=PLAY_BRICK;
					end if;
				end if;
			
				--game logic update (and playing)
				if(GAME_LOGIC_UPDATE='1') then
					gameLogicEnded<='1';
					brickHit:=B_NULL;
					
					--right bound bounce
					if (ballRightX>BOUND_RIGHT) then
						ballX<=2*BOUND_RIGHT-2*BALL_SIZE-X;
						signX<=-1;
						SOUND<=PLAY_BOUND;
					--left bound bounce	
					elsif (ballLeftX<=BOUND_LEFT) then
						ballX<=2*BOUND_LEFT-X;
						signX<=1;
						SOUND<=PLAY_BOUND;
					--top bound bounce
					elsif (ballTopY<BOUND_TOP) then
						ballY<=2*BOUND_TOP-Y;
						signY<=1;
						SOUND<=PLAY_BOUND;
					--ball under bottom bound
					elsif (ballTopY>BOUND_BOTTOM) then
						livesLeft<=livesLeft-1;
						LIFE_LOST<='1';
					--paddle bounce
					elsif (ballBotY>=PADDLE_STARTING_POSY and ballBotY<PADDLE_STARTING_POSY+PADDLE_HEIGHT and ballRightX>=paddleX and ballLeftX<=paddleX+paddleWidth) then	
						if(ballBotX>=paddleX+PADDLE_SIDE_SIZE and ballBotX<=paddleX+paddleWidth-PADDLE_SIDE_SIZE) then
							if(paddleEnlarged='0') then
								hitPoint:=((ballBotX)-(paddleX+PADDLE_SIDE_SIZE))/(10*UNIT); --total sections: 104-24=80/10=8
							else
								hitPoint:=((ballBotX)-(paddleX+PADDLE_SIDE_SIZE))/(30*UNIT/2);
							end if;
							case hitPoint is
								when 0 		=> ballAngleX<=6;		ballAngleY<=10;		signX<=-1;	signY<=-1;
								when 1		=> ballAngleX<=4;		ballAngleY<=12;		signX<=-1;	signY<=-1;
								when 2		=> ballAngleX<=2;		ballAngleY<=14;		signX<=-1;	signY<=-1;
								when 3		=> ballAngleX<=1; 	ballAngleY<=15;		signX<=-1;	signY<=-1;
								when 4		=> ballAngleX<=1;		ballAngleY<=15;		signX<=1;	signY<=-1;
								when 5		=> ballAngleX<=2;		ballAngleY<=14;		signX<=1;	signY<=-1;
								when 6		=> ballAngleX<=4;		ballAngleY<=12;		signX<=1;	signY<=-1;
								when 7		=> ballAngleX<=6;		ballAngleY<=10;		signX<=1;	signY<=-1;
								
								when others =>	ballAngleX<=6;		ballAngleY<=10;		signX<=1;	signY<=-1;
							end case;
							ballY<=(PADDLE_STARTING_POSY-BALL_SIZE)-(Y+BALL_SIZE-PADDLE_STARTING_POSY);
						else
							--left side bounce
							if(ballBotX<paddleX+PADDLE_SIDE_SIZE) then
								if(ballRightY>=PADDLE_STARTING_POSY) then
									ballAngleX<=10;	ballAngleY<=6;		signX<=-1;	signY<=-1;
									ballX<=(paddleX-BALL_SIZE)-(X+BALL_SIZE-paddleX)+PADDLE_SPEED_X*PADDLE_MOVE_DIR-2;
								else
									ballAngleX<=8;		ballAngleY<=8;		signX<=-1;	signY<=-1;
									ballY<=(PADDLE_STARTING_POSY-BALL_SIZE)-(Y+BALL_SIZE-PADDLE_STARTING_POSY);
								end if;
							--right side bounce
							else						
								if(ballLeftY>=PADDLE_STARTING_POSY) then
									ballAngleX<=10;	ballAngleY<=6;		signX<=1;	signY<=-1;
									ballX<=paddleX+paddleWidth+(paddleX+paddleWidth-X)+PADDLE_SPEED_X*PADDLE_MOVE_DIR+2;
								else
									ballAngleX<=8;		ballAngleY<=8;		signX<=1;	signY<=-1;
									ballY<=(PADDLE_STARTING_POSY-BALL_SIZE)-(Y+BALL_SIZE-PADDLE_STARTING_POSY);
								end if;
							end if;
						end if; --paddle middle if
						SOUND<=PLAY_PADDLE;
					else
						ballX<=X;
						ballY<=Y;
					end if; --bounce if
					--powerup: death
					if(powerUpCaught=P_DEATH) then
						livesLeft<=livesLeft-1;
						LIFE_LOST<='1';
					--powerup: life
					elsif(powerUpCaught=P_LIFE and livesLeft<MAX_LIVES) then
						livesLeft<=livesLeft+1;
					end if;
				end if; --game logic if
			end if; --playing if
		end if; --clock if
		
		BALL_X <= ballX; 
		BALL_Y <= ballY;
		LIVES<=livesLeft;
	end process;
	
	
	PaddleProcess : process(CLOCK, RESET_N, paddleX, paddleWidth)

	begin		
		if (rising_edge(CLOCK)) then	
			--INIT, CHANGELEVEL, LIFELOST
			if(STATE=S_INIT or STATE=S_CHANGELEVEL or STATE=S_LIFELOST) then
				paddleX<=PADDLE_STARTING_POSX;
				paddleWidth<=PADDLE_STARTING_WIDTH;
				paddleEnlarged:='0';
			--PLAYING
			elsif(STATE=S_PLAYING) then
			
				nextPaddleX<=paddleX+PADDLE_SPEED_X*PADDLE_MOVE_DIR;
				
				--game logic update
				if(GAME_LOGIC_UPDATE='1') then
					--paddle movement
					if (nextPaddleX<BOUND_LEFT) then
						paddleX<=BOUND_LEFT;
					elsif (nextPaddleX+paddleWidth>BOUND_RIGHT) then
						paddleX<=BOUND_RIGHT-paddleWidth;
					else
						paddleX<=nextPaddleX;
					end if;
					--powerup: enlarge
					if(powerUpCaught=P_ENLARGE) then
						paddleEnlarged:='1';
						paddleWidth<=(3*(PADDLE_STARTING_WIDTH-2*PADDLE_SIDE_SIZE))/2+2*PADDLE_SIDE_SIZE;
					elsif(powerUpCaught=P_LIFE) then
						paddleEnlarged:='0';
						paddleWidth<=PADDLE_STARTING_WIDTH;
					end if;
				end if;
			end if;
		end if;
		PADDLE_X <= paddleX;
		PADDLE_WIDTH <= paddleWidth;
	end process;
	
	
	
	PowerupProcess : process(CLOCK, RESET_N, powerUpX, powerUpY, powerUpType)
	
	begin		
		if (rising_edge(CLOCK)) then	
			powerUpCounter<=powerUpCounter+1;
			--INIT, CHANGELEVEL, LIFELOST
			if(STATE=S_INIT or STATE=S_CHANGELEVEL or STATE=S_LIFELOST) then
				powerUpType<=P_NULL;
				powerUpY<=POWERUP_OFF_Y;
				powerUpCaught<=P_NULL;
			--PLAYING
			elsif(STATE=S_PLAYING) then
				--game logic update
				if(GAME_LOGIC_UPDATE='1') then
					powerUpCaught<=P_NULL;
					--if a brick has just been hit and the powerup is not active
					if(brickHit=B_DESTROYED and powerUpY>=POWERUP_OFF_Y) then
						powerUpX<=brickX+4*UNIT;
						powerUpY<=brickY+3*UNIT;
						case powerUpCounter is
							when "00000"		
													=> powerUpType<=P_LIFE;
							when "00001"	
													=> powerUpType<=P_SLOW;
							when "00010"		
													=> powerUpType<=P_ENLARGE;
							when "00011"|"10011"
													=> powerUpType<=P_DEATH;
							when "11000"|"11100"	
													=> powerUpType<=P_FAST;
							
							when others =>	powerUpType<=P_NULL;
						end case;
					end if;
					
					--if the powerup is active
					if(powerUpY<POWERUP_OFF_Y) then
						powerUpY<=powerUpY+POWERUP_SPEED_Y;
						--if caught by paddle
						if(powerUpX>=paddleX-POWERUP_WIDTH and powerUpX<paddleX+paddleWidth and powerUpY+POWERUP_HEIGHT/2>=PADDLE_STARTING_POSY and powerUpY+POWERUP_HEIGHT/2<PADDLE_STARTING_POSY+PADDLE_HEIGHT) then
							powerUpCaught<=powerUpType;
							powerUpY<=POWERUP_OFF_Y;
							powerUpType<=P_NULL;
						end if;
					end if;
				end if;
			end if;
		end if;
		
		POWERUP_X<=powerUpX;
		POWERUP_Y<=powerUpY;
		POWERUP<=powerUpType;
		
	end process;
	
	
	
	SpeedProcess : process(CLOCK, RESET_N)
		variable counter : integer range 0 to (BALL_SPEEDUP_RATE-1);
	begin
		if (RESET_N = '0') then
			counter := 0;
		elsif (rising_edge(CLOCK)) then
			--INIT, CHANGELEVEL, LIFELOST
			if(STATE=S_INIT or STATE=S_CHANGELEVEL or LIFE_LOST='1') then
				squaredSpeed <= (BALL_STARTING_SPEED**2)/UNIT;
			--PLAYING
			elsif(STATE=S_PLAYING and squaredSpeed<(BALL_MAX_SPEED**2)/UNIT) then
				if(counter = counter'high) then
					counter := 0;
					squaredSpeed <= squaredSpeed+1; 
				else 
					counter := counter+1; 
					squaredSpeed <= squaredSpeed;
				end if;
				--game logic update
				if(GAME_LOGIC_UPDATE='1') then
					--powerup: slow
					if(powerUpCaught=P_SLOW) then
						if(squaredSpeed-POWERUP_SPEED_MOD<(BALL_STARTING_SPEED**2)/UNIT) then
							squaredSpeed<=(BALL_STARTING_SPEED**2)/UNIT;
						else
							squaredSpeed<=squaredSpeed-POWERUP_SPEED_MOD;
						end if;
					--powerup: fast
					elsif(powerUpCaught=P_FAST) then
						if(squaredSpeed+POWERUP_SPEED_MOD>(BALL_MAX_SPEED**2)/UNIT) then
							squaredSpeed<=(BALL_MAX_SPEED**2)/UNIT;
						else
							squaredSpeed<=squaredSpeed+POWERUP_SPEED_MOD;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
	
end architecture;