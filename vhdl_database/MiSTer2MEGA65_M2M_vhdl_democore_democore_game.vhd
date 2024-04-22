library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity democore_game is
   generic  (
      G_VGA_DX       : natural;
      G_VGA_DY       : natural
   );
   port (
      clk_i          : in  std_logic;
      rst_i          : in  std_logic;
      paddle_speed_i : in  std_logic_vector(3 downto 0);      
      update_i       : in  std_logic;
      player_left_i  : in  std_logic;
      player_right_i : in  std_logic;
      player_start_i : in  std_logic;
      ball_pos_x_o   : out std_logic_vector(15 downto 0);
      ball_pos_y_o   : out std_logic_vector(15 downto 0);
      paddle_pos_x_o : out std_logic_vector(15 downto 0);
      paddle_pos_y_o : out std_logic_vector(15 downto 0);
      score_o        : out std_logic_vector(15 downto 0);
      lives_o        : out std_logic_vector( 3 downto 0)
   );
end entity democore_game;

architecture synthesis of democore_game is

   constant C_BORDER      : integer :=   4;  -- Number of pixels
   constant C_SIZE_BALL   : integer :=  20; -- Number of pixels
   constant C_SIZE_PADDLE : integer := 100; -- Number of pixels

   signal paddle_speed : natural range 0 to 15;

   signal ball_pos_x   : integer range 0 to G_VGA_DX-1;
   signal ball_pos_y   : integer range 0 to G_VGA_DY-1;
   signal ball_vel_x   : integer range -7 to 7;
   signal ball_vel_y   : integer range -7 to 7;
   signal paddle_pos_x : integer range 0 to G_VGA_DX-1;
   signal paddle_pos_y : integer range 0 to G_VGA_DY-1;

   signal score : integer range 0 to 9999;
   signal lives : std_logic_vector(3 downto 0);
   signal ended : boolean;

begin
   paddle_speed <= to_integer(unsigned(paddle_speed_i));

   -- Move the ball
   p_move_ball : process (clk_i)
   begin
      if rising_edge(clk_i) then
         if update_i = '1' and not ended then
            ball_pos_x <= ball_pos_x + ball_vel_x;
            ball_pos_y <= ball_pos_y + ball_vel_y;

            -- Collision with right wall
            if ball_pos_x + ball_vel_x >= G_VGA_DX - C_SIZE_BALL - C_BORDER and ball_vel_x > 0 then
               ball_pos_x <= G_VGA_DX - C_SIZE_BALL - C_BORDER;
               ball_vel_x <= -ball_vel_x;
            end if;

            -- Collision with left wall
            if ball_pos_x + ball_vel_x < C_BORDER and ball_vel_x < 0 then
               ball_pos_x <= C_BORDER;
               ball_vel_x <= -ball_vel_x;
            end if;

            -- Collision with top wall
            if ball_pos_y + ball_vel_y < C_BORDER and ball_vel_y < 0 then
               ball_pos_y <= C_BORDER;
               ball_vel_y <= -ball_vel_y;
            end if;

            -- Collision with paddle
            if ball_pos_y + ball_vel_y >= G_VGA_DY - 2*C_SIZE_BALL - C_BORDER
               and ball_pos_x >= paddle_pos_x and ball_pos_x < paddle_pos_x + C_SIZE_PADDLE
               and ball_vel_y > 0 then
               ball_pos_y <= G_VGA_DY - 2*C_SIZE_BALL - C_BORDER;
               ball_vel_y <= -ball_vel_y;
               score <= score + 1;
            end if;

            -- Drop off bottom of screen
            if ball_pos_y + ball_vel_y >= G_VGA_DY - C_SIZE_BALL - C_BORDER then
               if lives /= "0000" then
                  -- ball_pos_x <= G_VGA_DX/2;
                  ball_pos_y <= G_VGA_DY/2;
                  -- ball_vel_x <= 1;
                  ball_vel_y <= 1;
                  lives <= "0" & lives(3 downto 1);
               else
                  ended <= true;
               end if;
            end if;
         end if;

         if ended = true and player_start_i = '1' then
            ended <= false;
         end if;

         if rst_i = '1' then
            score <= 0;
            lives <= "1111";
            ended <= true;
            ball_pos_x <= G_VGA_DX/2;
            ball_pos_y <= G_VGA_DY/2;
            ball_vel_x <= 1;
            ball_vel_y <= 1;
         end if;
      end if;
   end process p_move_ball;


   -- Move the paddle
   p_move_paddle : process (clk_i)
   begin
      if rising_edge(clk_i) then
         if update_i = '1' then

            if paddle_pos_x + paddle_speed <= G_VGA_DX - C_SIZE_PADDLE - C_BORDER and player_right_i = '1' then
               paddle_pos_x <= paddle_pos_x + paddle_speed;
            end if;

            if paddle_pos_x - paddle_speed >= C_BORDER and player_left_i = '1' then
               paddle_pos_x <= paddle_pos_x - paddle_speed;
            end if;
         end if;

         if rst_i = '1' then
            paddle_pos_x <= G_VGA_DX/2;
            paddle_pos_y <= G_VGA_DY-C_SIZE_BALL-C_BORDER;
         end if;
      end if;
   end process p_move_paddle;


   paddle_pos_x_o <= std_logic_vector(to_unsigned(paddle_pos_x, 16));
   paddle_pos_y_o <= std_logic_vector(to_unsigned(paddle_pos_y, 16));

   ball_pos_x_o <= std_logic_vector(to_unsigned(ball_pos_x, 16));
   ball_pos_y_o <= std_logic_vector(to_unsigned(ball_pos_y, 16));

   score_o <= std_logic_vector(to_unsigned(score, 16));
   lives_o <= lives;

end architecture synthesis;

