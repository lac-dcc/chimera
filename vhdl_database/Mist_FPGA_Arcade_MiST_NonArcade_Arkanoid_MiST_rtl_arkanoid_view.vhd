--Authors: Pietro Bassi, Marco Torsello

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.arkanoid_package.all;
use work.vga_package.all;

entity arkanoid_view is

port
	(  
		CLOCK						: in std_logic;			
		RESET_N					: in std_logic;
		BALL_X					: in integer;
		BALL_Y					: in integer;
		PADDLE_X					: in integer;
		PADDLE_WIDTH			: in integer;
		BRICK_MATRIX			: in brick_matrix_type(0 to BRICK_MAX_ROW-1, 0 to BRICK_MAX_COL-1);
		LIVES						: in natural;
		STATE						: in state_type;
		POWERUP_X				: in integer;
		POWERUP_Y				: in integer;
		POWERUP					: in powerup_type;
		VGA_HS					: out std_logic;
		VGA_VS					: out std_logic;
		VGA_R 					: out std_logic_vector(3 downto 0);
		VGA_G						: out std_logic_vector(3 downto 0);
		VGA_B						: out std_logic_vector(3 downto 0)
	);
end;
architecture RTL of arkanoid_view is

type light_state_type is (LS_DARKER_UP, LS_DARK_UP, LS_LIGHT_DN, LS_DARK_DN);

signal lightState					: light_state_type;
signal backgroundFlagX			: std_logic :='0';
signal backgroundFlagY			: std_logic :='0';
signal changeLight				: std_logic:='0';
signal lightColor					: color_type:=COLOR_LIGHTDARKER;
signal heartColor					: color_type:=COLOR_HEARTDARK;
	
begin 
	DrawProcess : process(CLOCK,RESET_N)
	
	variable old_x					: integer range 0 to TOTAL_W:=0;
	variable old_y					: integer range 0 to TOTAL_H:=0;
	variable x						: integer range 0 to VISIBLE_WIDTH:=0;
	variable y						: integer range 0 to VISIBLE_HEIGHT:=0;
	
	variable brickX				: integer;
	variable brickY				: integer;
	
	variable brickColor			: color_type;
	
	alias R_BRICK is brickColor(0 to 3);
	alias G_BRICK is brickColor(4 to 7);
	alias B_BRICK is brickColor(8 to 11);
	
	variable powerupColor		: powerup_color_type;
	alias R_POWERUP_LIGHT is powerupColor(0 to 3);
	alias G_POWERUP_LIGHT is powerupColor(4 to 7);
	alias B_POWERUP_LIGHT is powerupColor(8 to 11);
	alias R_POWERUP_DARK is powerupColor(12 to 15);
	alias G_POWERUP_DARK is powerupColor(16 to 19);
	alias B_POWERUP_DARK is powerupColor(20 to 23);
	
	begin
		if(RESET_N='0') then
			old_x:=0;
			old_y:=0;
			x:=0;
			y:=0;
			VGA_HS<='0';
			VGA_VS<='0';
			VGA_R <= X"0";
			VGA_G <= X"0";
			VGA_B <= X"0";
			backgroundFlagX<='0';
			backgroundFlagY<='0';
		elsif rising_edge(CLOCK) then
		
			if(changeLight = '1') then
				case lightState is
					when LS_DARKER_UP=>
						lightState<=LS_DARK_UP;
					when LS_DARK_UP=>
						lightState<=LS_LIGHT_DN;
					when LS_LIGHT_DN=>
						lightState<=LS_DARK_DN;
					when LS_DARK_DN=>
						lightState<=LS_DARKER_UP;
				end case;
			end if;
		
			--Vertical sync
			if (old_y<VERTICAL_SYNC_PULSE) then 
				VGA_VS <='0';
			else
				VGA_VS <='1';
			end if;
			
			--Horizontal sync
			if (old_x<HORIZONTAL_SYNC_PULSE) then 
				VGA_HS <='0';
			else
				VGA_HS <='1';
			end if;
			
			--inside the visible window
			if(old_x>=WINDOW_HORIZONTAL_START and old_x<WINDOW_HORIZONTAL_END and old_y>=WINDOW_VERTICAL_START and old_y<WINDOW_VERTICAL_END) then
				x:=old_x-WINDOW_HORIZONTAL_START;
				y:=old_y-WINDOW_VERTICAL_START;
				
				--draw background
				if(x>=0 and x<VISIBLE_WIDTH) then
					if(x mod BKG_RECT_WIDTH = 0) then
						backgroundFlagX<=NOT backgroundFlagX;
					end if;
					if(x=0) then
						backgroundFlagX<='0';
					end if;
					if(y mod BKG_RECT_HEIGHT = 0 and x=0) then
						backgroundFlagY<=NOT backgroundFlagY;
					end if;
					if(y=0) then
						backgroundFlagY<='0';
					end if;
					
					if(backgroundFlagX=backgroundFlagY) then
						VGA_R <= COLOR_BKGBLUE(0 to 3);
						VGA_G <= COLOR_BKGBLUE(4 to 7);
						VGA_B <= COLOR_BKGBLUE(8 to 11);
						if(STATE=S_GAMELOST) then
							VGA_R <= COLOR_BKGRED(0 to 3);
							VGA_G <= COLOR_BKGRED(4 to 7);
							VGA_B <= COLOR_BKGRED(8 to 11);
						elsif(STATE=S_GAMEWON) then
							VGA_R <= COLOR_BKGGREEN(0 to 3);
							VGA_G <= COLOR_BKGGREEN(4 to 7);
							VGA_B <= COLOR_BKGGREEN(8 to 11);
						end if;
					else
						VGA_R <= COLOR_BKGDARKBLUE(0 to 3);
						VGA_G <= COLOR_BKGDARKBLUE(4 to 7);
						VGA_B <= COLOR_BKGDARKBLUE(8 to 11);
						if(STATE=S_GAMELOST) then
							VGA_R <= COLOR_BKGDARKRED(0 to 3);
							VGA_G <= COLOR_BKGDARKRED(4 to 7);
							VGA_B <= COLOR_BKGDARKRED(8 to 11);
						elsif(STATE=S_GAMEWON) then
							VGA_R <= COLOR_BKGDARKGREEN(0 to 3);
							VGA_G <= COLOR_BKGDARKGREEN(4 to 7);
							VGA_B <= COLOR_BKGDARKGREEN(8 to 11);
						end if;
					end if;
				end if;
				--end draw background
				
				--draw bounds
				if(x<BOUND_LEFT/UNIT or x>=BOUND_RIGHT/UNIT or y<BOUND_TOP/UNIT) then
					VGA_R <= X"3";
					VGA_G <= X"3";
					VGA_B <= X"3";
					if(x>=BOUND_LEFT/UNIT-2 and x<BOUND_RIGHT/UNIT+2 and y>=BOUND_TOP/UNIT-2) then
						VGA_R <= X"0";
						VGA_G <= X"0";
						VGA_B <= X"0";
					end if;
				end if;
				--end draw bounds
				
				--draw lives
				if(y<=LIVES_Y+24) then
					for i in 0 to MAX_LIVES-1 loop	
						if(i+1<=LIVES) then
							if
							(
								(x>=LIVES_X+i*32+4 and x<LIVES_X+i*32+10 and y>=LIVES_Y+0 and y<LIVES_Y+16) or
								(x>=LIVES_X+i*32+16 and x<LIVES_X+i*32+22 and y>=LIVES_Y+0 and y<LIVES_Y+16) or
								(x>=LIVES_X+i*32+2 and x<LIVES_X+i*32+12 and y>=LIVES_Y+2 and y<LIVES_Y+14) or
								(x>=LIVES_X+i*32+14 and x<LIVES_X+i*32+24 and y>=LIVES_Y+2 and y<LIVES_Y+14) or
								(x>=LIVES_X+i*32+0 and x<LIVES_X+i*32+26 and y>=LIVES_Y+4 and y<LIVES_Y+12) or
								(x>=LIVES_X+i*32+2 and x<LIVES_X+i*32+24 and y>=LIVES_Y+12 and y<LIVES_Y+14) or
								(x>=LIVES_X+i*32+4 and x<LIVES_X+i*32+22 and y>=LIVES_Y+14 and y<LIVES_Y+16) or
								(x>=LIVES_X+i*32+6 and x<LIVES_X+i*32+20 and y>=LIVES_Y+16 and y<LIVES_Y+18) or
								(x>=LIVES_X+i*32+8 and x<LIVES_X+i*32+18 and y>=LIVES_Y+18 and y<LIVES_Y+20) or
								(x>=LIVES_X+i*32+10 and x<LIVES_X+i*32+16 and y>=LIVES_Y+20 and y<LIVES_Y+22) or
								(x>=LIVES_X+i*32+12 and x<LIVES_X+i*32+14 and y>=LIVES_Y+22 and y<LIVES_Y+24)
							) then
								VGA_R <= heartColor(0 to 3);
								VGA_G <= heartColor(4 to 7);
								VGA_B <= heartColor(8 to 11);
							end if;
							if
							(
								(x>=LIVES_X+i*32+4 and x<LIVES_X+i*32+6 and y>=LIVES_Y+10 and y<LIVES_Y+12) or
								(x>=LIVES_X+i*32+4 and x<LIVES_X+i*32+6 and y>=LIVES_Y+4 and y<LIVES_Y+8) or
								(x>=LIVES_X+i*32+6 and x<LIVES_X+i*32+8 and y>=LIVES_Y+4 and y<LIVES_Y+6)
							) then
								VGA_R <= X"E";
								VGA_G <= X"E";
								VGA_B <= X"E";
							end if;
						end if;
					end loop;
				--end draw lives
				
				--draw brick
				elsif(y>=BRICK_MATRIX_Y/UNIT and y<BRICK_HEIGHT/UNIT*BRICK_MAX_ROW+BRICK_MATRIX_Y/UNIT) then
					for i in 0 to BRICK_MAX_ROW-1 loop
						for k in 0 to BRICK_MAX_COL-1 loop
							if(brick_matrix(i,k)/=0) then
								brickX:=k*BRICK_WIDTH/UNIT+BRICK_MATRIX_X/UNIT;
								brickY:=i*BRICK_HEIGHT/UNIT+BRICK_MATRIX_Y/UNIT;
								brickColor:=get_brick_color(brick_matrix(i,k));
								
								if(x>=brickX and x<brickX+BRICK_WIDTH/UNIT and y>=brickY and y<brickY+BRICK_HEIGHT/UNIT) then
									VGA_R<=X"0";
									VGA_G<=X"0";
									VGA_B<=X"0";
									if(x<brickX+BRICK_WIDTH/UNIT-2 and y<brickY+BRICK_HEIGHT/UNIT-2) then
										VGA_R<=R_BRICK;
										VGA_G<=G_BRICK;
										VGA_B<=B_BRICK;
									end if;
								end if;
							end if;
						end loop;
					end loop;
				--end draw brick
				else
				--draw paddle
					if(x>=PADDLE_X and x<PADDLE_X+PADDLE_WIDTH and y>=PADDLE_STARTING_POSY/UNIT and y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT) then
						--paddle black connections
						if(x>=PADDLE_X+12 and x<PADDLE_X+PADDLE_WIDTH-12 and y>=PADDLE_STARTING_POSY/UNIT+2 and y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT-2) then
							VGA_R <= X"0";
							VGA_G <= X"0";
							VGA_B <= X"0";
						end if;
						
						--paddle center
						if(x>=PADDLE_X+14 and x<PADDLE_X+PADDLE_WIDTH-14) then
							VGA_R <= X"0";
							VGA_G <= X"0";
							VGA_B <= X"0";
							if(y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT-2) then
								VGA_R <= X"6";
								VGA_G <= X"6";
								VGA_B <= X"6";
							end if;
							if(y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT-6) then
								VGA_R <= X"A";
								VGA_G <= X"A";
								VGA_B <= X"A";
							end if;
							if(y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT-12) then
								VGA_R <= X"E";
								VGA_G <= X"E";
								VGA_B <= X"E";
							end if;
							if(y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT-16) then
								VGA_R <= X"6";
								VGA_G <= X"6";
								VGA_B <= X"6";
							end if;
						end if;
						
						--paddle red sides
						if((x>=PADDLE_X+6 and x<PADDLE_X+12) or (x>=PADDLE_X+PADDLE_WIDTH-12 and x<PADDLE_X+PADDLE_WIDTH-6) or
						(x>=PADDLE_X+4 and x<PADDLE_X+6 and y>=PADDLE_STARTING_POSY/UNIT+2 and y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT-2) or
						(x>=PADDLE_X+PADDLE_WIDTH-6 and x<PADDLE_X+PADDLE_WIDTH-4 and y>=PADDLE_STARTING_POSY/UNIT+2 and y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT-2)) then
							VGA_R <= X"8";
							VGA_G <= X"0";
							VGA_B <= X"0";
						end if;
						
						if((x>=PADDLE_X+4 and x<PADDLE_X+12 and y>=PADDLE_STARTING_POSY/UNIT+4 and y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT-4) or
						(x>=PADDLE_X+PADDLE_WIDTH-12 and x<PADDLE_X+PADDLE_WIDTH-4 and y>=PADDLE_STARTING_POSY/UNIT+4 and y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT-4)) then
							VGA_R <= X"E";
							VGA_G <= X"0";
							VGA_B <= X"0";
						end if;
						
						--paddle lights
						if
						(
							(x>=PADDLE_X and x<PADDLE_X+2 and y>=PADDLE_STARTING_POSY/UNIT+6 and y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT-6) or
							(x>=PADDLE_X+2 and x<PADDLE_X+4 and y>=PADDLE_STARTING_POSY/UNIT+4 and y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT-4) or
							(x>=PADDLE_X+PADDLE_WIDTH-2 and x<PADDLE_X+PADDLE_WIDTH and y>=PADDLE_STARTING_POSY/UNIT+6 and y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT-6) or
							(x>=PADDLE_X+PADDLE_WIDTH-4 and x<PADDLE_X+PADDLE_WIDTH-2 and y>=PADDLE_STARTING_POSY/UNIT+4 and y<PADDLE_STARTING_POSY/UNIT+PADDLE_HEIGHT/UNIT-4)
						) 	
						then					
							VGA_R <= lightColor(0 to 3);
							VGA_G <= lightColor(4 to 7);
							VGA_B <= lightColor(8 to 11);
						end if;
						
						--paddle bright spots
						if
						(
							(x>=PADDLE_X+6 and x<PADDLE_X+12 and y>=PADDLE_STARTING_POSY/UNIT+2 and y<PADDLE_STARTING_POSY/UNIT+4) or
							(x>=PADDLE_X+4 and x<PADDLE_X+6 and y>=PADDLE_STARTING_POSY/UNIT+4 and y<PADDLE_STARTING_POSY/UNIT+6) or
							(x>=PADDLE_X+PADDLE_WIDTH-12 and x<PADDLE_X+PADDLE_WIDTH-6 and y>=PADDLE_STARTING_POSY/UNIT+2 and y<PADDLE_STARTING_POSY/UNIT+4) or
							(x>=PADDLE_X and x<PADDLE_X+2 and y>=PADDLE_STARTING_POSY/UNIT+6 and y<PADDLE_STARTING_POSY/UNIT+8) or
							(x>=PADDLE_X+PADDLE_WIDTH-4 and x<PADDLE_X+PADDLE_WIDTH-2 and y>=PADDLE_STARTING_POSY/UNIT+6 and y<PADDLE_STARTING_POSY/UNIT+8)
						) then
							VGA_R <= X"E";
							VGA_G <= X"E";
							VGA_B <= X"E";
						end if;
					end if; 
					--end draw paddle
				end if;
				
				--draw powerup
				case POWERUP is
					when P_LIFE 		=> powerUpColor:=get_powerup_color(P_LIFE);
					when P_SLOW			=> powerUpColor:=get_powerup_color(P_SLOW);
					when P_ENLARGE		=> powerUpColor:=get_powerup_color(P_ENLARGE);
					when P_DEATH		=> powerUpColor:=get_powerup_color(P_DEATH);
					when P_FAST			=> powerUpColor:=get_powerup_color(P_FAST);
						
					when others =>	
				end case;
				
				if(x>=POWERUP_X and x<POWERUP_X+POWERUP_WIDTH/UNIT and y>=POWERUP_Y and y<POWERUP_Y+POWERUP_HEIGHT/UNIT and POWERUP/=P_NULL) then
					if((x>=POWERUP_X+2 and x<POWERUP_X+POWERUP_WIDTH/UNIT-2) or (y>=POWERUP_Y+2 and y<POWERUP_Y+POWERUP_HEIGHT/UNIT-2)) then
						VGA_R<=R_POWERUP_DARK;
						VGA_G<=G_POWERUP_DARK;
						VGA_B<=B_POWERUP_DARK;
					end if;
					if((x>=POWERUP_X+4 and x<POWERUP_X+POWERUP_WIDTH/UNIT-4 and y>=POWERUP_Y+2 and y<POWERUP_Y+POWERUP_HEIGHT/UNIT-2) or
					(x>=POWERUP_X+2 and x<POWERUP_X+POWERUP_WIDTH/UNIT-2 and y>=POWERUP_Y+4 and y<POWERUP_Y+POWERUP_HEIGHT/UNIT-4)) then
						VGA_R<=R_POWERUP_LIGHT;
						VGA_G<=G_POWERUP_LIGHT;
						VGA_B<=B_POWERUP_LIGHT;
					end if;
					if((x>=POWERUP_X+2 and x<POWERUP_X+POWERUP_WIDTH/UNIT-4 and y>=POWERUP_Y+2 and y<POWERUP_Y+4) or
					(x>=POWERUP_X+0 and x<POWERUP_X+2 and y>=POWERUP_Y+4 and y<POWERUP_Y+6)) then
						VGA_R<=X"E";
						VGA_G<=X"E";
						VGA_B<=X"E";
					end if;
				end if;
				--end draw powerup
				
				--draw ball
				if(x>=BALL_X and x<BALL_X+BALL_SIZE/UNIT and y>=BALL_Y and y<BALL_Y+BALL_SIZE/UNIT) then
					if
					(
						(x>=BALL_X+4 and x<BALL_X+9 and y>=BALL_Y+0 and y<BALL_Y+13) or
						(x>=BALL_X+2 and x<BALL_X+11 and y>=BALL_Y+1 and y<BALL_Y+12) or
						(x>=BALL_X+1 and x<BALL_X+12 and y>=BALL_Y+2 and y<BALL_Y+11) or
						(x>=BALL_X+0 and x<BALL_X+13 and y>=BALL_Y+4 and y<BALL_Y+9)
					)
					then
						VGA_R <= COLOR_BALLBORDER(0 to 3);
						VGA_G <= COLOR_BALLBORDER(4 to 7);
						VGA_B <= COLOR_BALLBORDER(8 to 11);
					end if;
					if
					(
						(x>=BALL_X+5 and x<BALL_X+8 and y>=BALL_Y+2 and y<BALL_Y+11) or
						(x>=BALL_X+3 and x<BALL_X+10 and y>=BALL_Y+3 and y<BALL_Y+10) or
						(x>=BALL_X+2 and x<BALL_X+11 and y>=BALL_Y+5 and y<BALL_Y+8)
					)
					then
						VGA_R <= COLOR_BALLFILL(0 to 3);
						VGA_G <= COLOR_BALLFILL(4 to 7);
						VGA_B <= COLOR_BALLFILL(8 to 11);
					end if;
				end if;
				--end draw ball
				
			--outside visible screen	
			else
				VGA_R <= X"0";
				VGA_G <= X"0";
				VGA_B <= X"0";
			end if;

			--update coordinates
			if(old_x = TOTAL_W-1) then			
				if(old_y = TOTAL_H-1) then 
					old_y := 0;
				else
					old_y := old_y + 1;
				end if;
				old_x := 0;
			else
				old_x := old_x + 1;
			end if;
			
		end if;
	end process;
	
	AnimationProcess : process(lightState)
	begin		
		case lightState is
			when LS_DARKER_UP=>
				lightColor<=COLOR_LIGHTDARKER;
				heartColor<=COLOR_HEARTDARK;
			when LS_DARK_UP=>
				lightColor<=COLOR_LIGHTDARK;
				heartColor<=COLOR_HEARTDARK;
			when LS_LIGHT_DN=>
				lightColor<=COLOR_LIGHTLIGHT;
				heartColor<=COLOR_HEARTLIGHT;
			when LS_DARK_DN=>
				lightColor<=COLOR_LIGHTDARK;
				heartColor<=COLOR_HEARTLIGHT;
		end case;
	end process;
	
	animation_time_generator : process(CLOCK, RESET_N)
		variable counter : integer range 0 to (ANIMATION_RATE-1);
	begin
		if (RESET_N = '0') then
			counter := 0;
			changeLight <= '0';
		elsif (rising_edge(CLOCK)) then
			if(counter = counter'high) then
				counter := 0;
				changeLight <= '1';
			else
				counter := counter+1;
				changeLight <= '0';
			end if;
		end if;
	end process;
	
end architecture;