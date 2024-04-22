-- Listing 12.4
library ieee;
use ieee.std_logic_1164.all;
entity pong_top_st is
   port (
      clk,reset_n: in std_logic;
      hsync, vsync: out  std_logic;
      red, green, blue: out std_logic_vector(2 downto 0)
   );
end pong_top_st;

architecture arch of pong_top_st is
   signal pixel_x, pixel_y: std_logic_vector (9 downto 0);
   signal video_on, pixel_tick: std_logic;
   signal rgb_reg, rgb_next: std_logic_vector(2 downto 0);
	signal reset: std_logic;
begin
	reset <= not(reset_n);
	
   -- instantiate VGA sync
   vga_sync_unit: entity work.vga_sync
      port map(clk=>clk, 
					reset=>reset,
               video_on=>video_on, 
					p_tick=>pixel_tick,
               hsync=>hsync, 
					vsync=>vsync,
               pixel_x=>pixel_x, 
					pixel_y=>pixel_y
					);
   -- instantiate graphic generator
   pong_grf_st_unit: entity work.pong_graph_st(sq_ball_arch)
      port map (video_on=>video_on,
                pixel_x=>pixel_x, 
					 pixel_y=>pixel_y,
                graph_rgb=>rgb_next);
   -- rgb buffer
   process (clk)
   begin
      if (clk'event and clk='1') then
         if (pixel_tick='1') then
            rgb_reg <= rgb_next;
         end if;
      end if;
   end process;
	
   --rgb <= rgb_reg when video_on='1' else "000";
	red <= "111" when (rgb_reg(0) = '1' and video_on='1') else "000";
	green <= "111" when (rgb_reg(1) = '1' and video_on='1') else "000";
	blue <= "111" when (rgb_reg(2) = '1' and video_on='1') else "000";
	
	
end arch;