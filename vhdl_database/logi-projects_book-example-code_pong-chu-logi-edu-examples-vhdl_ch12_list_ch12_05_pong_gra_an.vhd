-- Listing 12.5
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity pong_graph_animate is
   port(
        clk, reset: std_logic;
        btn: std_logic_vector(1 downto 0);
        video_on: in std_logic;
        pixel_x,pixel_y: in std_logic_vector(9 downto 0);
        graph_rgb: out std_logic_vector(2 downto 0)
   );
end pong_graph_animate;

architecture arch of pong_graph_animate is
   signal refr_tick: std_logic;
   -- x, y coordinates (0,0) to (639,479)
   signal pix_x, pix_y: unsigned(9 downto 0);
   constant MAX_X: integer:=640;
   constant MAX_Y: integer:=480;
   ----------------------------------------------
   -- vertical strip as a wall
   ----------------------------------------------
   -- wall left, right boundary
   constant WALL_X_L: integer:=32;
   constant WALL_X_R: integer:=35;
   ----------------------------------------------
   -- right paddle bar
   ----------------------------------------------
   -- bar left, right boundary
   constant BAR_X_L: integer:=600;
   constant BAR_X_R: integer:=603;
   -- bar top, bottom boundary
   signal bar_y_t, bar_y_b: unsigned(9 downto 0);
   constant BAR_Y_SIZE: integer:=72;
   -- reg to track top boundary  (x position is fixed)
   signal bar_y_reg, bar_y_next: unsigned(9 downto 0);
   -- bar moving velocity when the button are pressed
   constant BAR_V: integer:=4;
   ----------------------------------------------
   -- square ball
   ----------------------------------------------
   constant BALL_SIZE: integer:=8; -- 8
   -- ball left, right boundary
   signal ball_x_l, ball_x_r: unsigned(9 downto 0);
   -- ball top, bottom boundary
   signal ball_y_t, ball_y_b: unsigned(9 downto 0);
   -- reg to track left, top boundary
   signal ball_x_reg, ball_x_next: unsigned(9 downto 0);
   signal ball_y_reg, ball_y_next: unsigned(9 downto 0);
   -- reg to track ball speed
   signal x_delta_reg, x_delta_next: unsigned(9 downto 0);
   signal y_delta_reg, y_delta_next: unsigned(9 downto 0);
   -- ball velocity can be pos or neg)
   constant BALL_V_P: unsigned(9 downto 0)
            :=to_unsigned(2,10);
   constant BALL_V_N: unsigned(9 downto 0)
            :=unsigned(to_signed(-2,10));
   ----------------------------------------------
   -- round ball image ROM
   ----------------------------------------------
   type rom_type is array (0 to 7)
        of std_logic_vector(0 to 7);
   -- ROM definition
   constant BALL_ROM: rom_type :=
   (
      "00111100", --   ****
      "01111110", --  ******
      "11111111", -- ********
      "11111111", -- ********
      "11111111", -- ********
      "11111111", -- ********
      "01111110", --  ******
      "00111100"  --   ****
   );
   signal rom_addr, rom_col: unsigned(2 downto 0);
   signal rom_data: std_logic_vector(7 downto 0);
   signal rom_bit: std_logic;
   ----------------------------------------------
   -- object output signals
   ----------------------------------------------
   signal wall_on, bar_on, sq_ball_on, rd_ball_on: std_logic;
   signal wall_rgb, bar_rgb, ball_rgb:
          std_logic_vector(2 downto 0);
begin
   -- registers
   process (clk,reset)
   begin
      if reset='1' then
         bar_y_reg <= (others=>'0');
         ball_x_reg <= (others=>'0');
         ball_y_reg <= (others=>'0');
         x_delta_reg <= ("0000000100");
         y_delta_reg <= ("0000000100");
      elsif (clk'event and clk='1') then
         bar_y_reg <= bar_y_next;
         ball_x_reg <= ball_x_next;
         ball_y_reg <= ball_y_next;
         x_delta_reg <= x_delta_next;
         y_delta_reg <= y_delta_next;
      end if;
   end process;
   pix_x <= unsigned(pixel_x);
   pix_y <= unsigned(pixel_y);
   -- refr_tick: 1-clock tick asserted at start of v-sync
   --       i.e., when the screen is refreshed (60 Hz)
   refr_tick <= '1' when (pix_y=481) and (pix_x=0) else
                '0';
   ----------------------------------------------
   -- (wall) left vertical strip
   ----------------------------------------------
   -- pixel within wall
   wall_on <=
      '1' when (WALL_X_L<=pix_x) and (pix_x<=WALL_X_R) else
      '0';
   -- wall rgb output
   wall_rgb <= "001"; -- blue
   ----------------------------------------------
   -- right vertical bar
   ----------------------------------------------
   -- boundary
   bar_y_t <= bar_y_reg;
   bar_y_b <= bar_y_t + BAR_Y_SIZE - 1;
   -- pixel within bar
   bar_on <=
      '1' when (BAR_X_L<=pix_x) and (pix_x<=BAR_X_R) and
               (bar_y_t<=pix_y) and (pix_y<=bar_y_b) else
      '0';
   -- bar rgb output
   bar_rgb <= "010"; --green
   -- new bar y-position
   process(bar_y_reg,bar_y_b,bar_y_t,refr_tick,btn)
   begin
      bar_y_next <= bar_y_reg; -- no move
      if refr_tick='1' then
         if btn(1)='1' and bar_y_b<(MAX_Y-1-BAR_V) then
            bar_y_next <= bar_y_reg + BAR_V; -- move down
         elsif btn(0)='1' and bar_y_t > BAR_V then
            bar_y_next <= bar_y_reg - BAR_V; -- move up
         end if;
      end if;
   end process;

   ----------------------------------------------
   -- square ball
   ----------------------------------------------
   -- boundary
   ball_x_l <= ball_x_reg;
   ball_y_t <= ball_y_reg;
   ball_x_r <= ball_x_l + BALL_SIZE - 1;
   ball_y_b <= ball_y_t + BALL_SIZE - 1;
   -- pixel within ball
   sq_ball_on <=
      '1' when (ball_x_l<=pix_x) and (pix_x<=ball_x_r) and
               (ball_y_t<=pix_y) and (pix_y<=ball_y_b) else
      '0';
   -- map current pixel location to ROM addr/col
   rom_addr <= pix_y(2 downto 0) - ball_y_t(2 downto 0);
   rom_col <= pix_x(2 downto 0) - ball_x_l(2 downto 0);
   rom_data <= BALL_ROM(to_integer(rom_addr));
   rom_bit <= rom_data(to_integer(rom_col));
   -- pixel within ball
   rd_ball_on <=
      '1' when (sq_ball_on='1') and (rom_bit='1') else
      '0';
   -- ball rgb output
   ball_rgb <= "100";   -- red
   -- new ball position
   ball_x_next <= ball_x_reg + x_delta_reg
                     when refr_tick='1' else
                  ball_x_reg ;
   ball_y_next <= ball_y_reg + y_delta_reg
                     when refr_tick='1' else
                  ball_y_reg ;
   -- new ball velocity
   process(x_delta_reg,y_delta_reg,ball_y_t,ball_x_l,ball_x_r,
           ball_y_t,ball_y_b,bar_y_t,bar_y_b)
   begin
      x_delta_next <= x_delta_reg;
      y_delta_next <= y_delta_reg;
      if ball_y_t < 1 then -- reach top
         y_delta_next <= BALL_V_P;
      elsif ball_y_b > (MAX_Y-1) then   -- reach bottom
         y_delta_next <= BALL_V_N;
      elsif ball_x_l <= WALL_X_R  then -- reach wall
         x_delta_next <= BALL_V_P;     -- bounce back
      elsif (BAR_X_L<=ball_x_r) and (ball_x_r<=BAR_X_R) then
         -- reach x of right bar
         if (bar_y_t<=ball_y_b) and (ball_y_t<=bar_y_b) then
            x_delta_next <= BALL_V_N; --hit, bounce back
         end if;
      end if;
   end process;
   ----------------------------------------------
   -- rgb multiplexing circuit
   ----------------------------------------------
   process(video_on,wall_on,bar_on,rd_ball_on,
           wall_rgb, bar_rgb, ball_rgb)
   begin
      if video_on='0' then
          graph_rgb <= "000"; --blank
      else
         if wall_on='1' then
            graph_rgb <= wall_rgb;
         elsif bar_on='1' then
            graph_rgb <= bar_rgb;
         elsif rd_ball_on='1' then
            graph_rgb <= ball_rgb;
         else
            graph_rgb <= "110"; -- yellow background
         end if;
      end if;
   end process;
end arch;
