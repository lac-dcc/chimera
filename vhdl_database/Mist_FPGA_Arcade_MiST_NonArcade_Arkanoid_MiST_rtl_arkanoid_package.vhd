--Authors: Pietro Bassi, Marco Torsello

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

package arkanoid_package is
	--CONSTANTS
	
	--game
	constant UNIT								: positive := 16;
	constant GAME_LOGIC_UPDATE_RATE		: positive := 416667;
	constant GAME_WIDTH						: natural := 640*UNIT;
	constant GAME_HEIGHT						: natural := 480*UNIT;
	constant LEVELS							: positive := 13;
	constant STARTING_LIVES					: positive := 3;
	constant MAX_LIVES						: positive := 4;
	
	--bounds
	constant BOUND_TOP_THICKNESS			: natural := 50*UNIT;
	constant BOUND_LAT_THICKNESS			: natural := 20*UNIT;
	constant BOUND_TOP						: natural := BOUND_TOP_THICKNESS;
	constant BOUND_LEFT						: natural := BOUND_LAT_THICKNESS;
	constant BOUND_RIGHT						: natural := GAME_WIDTH-BOUND_LAT_THICKNESS;
	constant BOUND_BOTTOM					: natural := GAME_HEIGHT;
	
	--ball
	constant BALL_SIZE						: natural := 13*UNIT;
	constant BALL_STARTING_POSX			: natural := GAME_WIDTH/2-BALL_SIZE;
	constant BALL_STARTING_POSY			: natural := 340*UNIT;
	constant BALL_STARTING_SPEED			: integer := 13*UNIT/4;
	constant BALL_MAX_SPEED					: integer := 5*UNIT;
	constant BALL_SPEEDUP_RATE				: integer := 15000000;

	--paddle
	constant PADDLE_HEIGHT					: natural := 18*UNIT;
	constant PADDLE_STARTING_WIDTH		: natural := 104*UNIT;
	constant PADDLE_STARTING_POSX			: natural := GAME_WIDTH/2-PADDLE_STARTING_WIDTH/2;
	constant PADDLE_STARTING_POSY			: natural := GAME_HEIGHT-PADDLE_HEIGHT-16*UNIT;
	constant PADDLE_SPEED_X					: natural := 5*UNIT;
	constant PADDLE_SIDE_SIZE				: natural := 12*UNIT;

	--brick
	constant BRICK_WIDTH						: natural := 40*UNIT;
	constant BRICK_HEIGHT					: natural := 20*UNIT;
	constant BRICK_MATRIX_X					: natural := BOUND_LEFT;
	constant BRICK_MATRIX_Y					: natural := BOUND_TOP+BRICK_HEIGHT*3;
	constant BRICK_MAX_ROW					: natural := 10;
	constant BRICK_MAX_COL					: natural := 15;
	constant BRICK_TOTAL						: natural := BRICK_MAX_ROW*BRICK_MAX_COL;
	
	--powerup
	constant POWERUP_WIDTH					: natural := 32*UNIT;
	constant POWERUP_HEIGHT					: natural := 14*UNIT;
	constant POWERUP_SPEED_Y				: natural := 5*UNIT/2;
	constant POWERUP_OFF_Y					: natural := GAME_HEIGHT;
	constant POWERUP_SPEED_MOD				: natural := 4*UNIT;
	
	--types definition
	type state_type is (S_INIT, S_PAUSED, S_PLAYING, S_CHANGELEVEL, S_LIFELOST, S_GAMELOST, S_GAMEWON);	
	type powerup_type is (P_NULL, P_LIFE, P_SLOW, P_FAST, P_ENLARGE, P_DEATH);
	type brickhit_type is (B_NULL, B_BOUNCE, B_DESTROYED);
	type sound_type is (PLAY_NULL, PLAY_PADDLE, PLAY_BRICK, PLAY_BOUND);
	subtype brick_type is unsigned(0 to 3);
	type brick_matrix_type is array(natural range <>, natural range <>) of brick_type;
	
	--bricks constants
	constant B_EMPTY			: brick_type := X"0";
	constant B_WHITE			: brick_type := X"1";
	constant B_ORANGE			: brick_type := X"2";
	constant B_CYAN			: brick_type := X"3";
	constant B_GREEN			: brick_type := X"4";
	constant B_RED				: brick_type := X"5";
	constant B_BLUE			: brick_type := X"6";
	constant B_PINK			: brick_type := X"7";
	constant B_PURPLE			: brick_type := X"8";
	constant B_YELLOW			: brick_type := X"9";
	constant B_GREY1			: brick_type := X"A";
	constant B_GREY2			: brick_type := X"B";
	constant B_GREY3			: brick_type := X"C";
	constant B_GREY4			: brick_type := X"D";
	constant B_GREY5			: brick_type := X"E";
	constant B_GOLD			: brick_type := X"F";
	
	--FUNCTIONS
	function  brick_collision_result  ( brick : brick_type ) return brick_type;
	function  is_colliding ( pointX : integer; pointY : integer; brickX : integer; brickY : integer ) return boolean;

end package;

package body arkanoid_package is
	
	function brick_collision_result ( brick : brick_type ) return brick_type is
	begin
		if (brick<=B_GREY1) then
			return B_EMPTY;
		elsif (brick>=B_GREY2 and brick<=B_GREY5) then
			return brick-1;
		else
			return brick;
		end if;
	end brick_collision_result;
	
	function is_colliding ( pointX : integer; pointY : integer; brickX : integer; brickY : integer ) return boolean is
	begin
		if (pointX>=brickX and pointX<brickX+BRICK_WIDTH and pointY>=brickY and pointY<brickY+BRICK_HEIGHT) then
			return true;
		else
			return false;
		end if;
	end is_colliding;
	
end arkanoid_package;


