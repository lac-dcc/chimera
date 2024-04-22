-- Listing 13.5
library ieee;
use ieee.std_logic_1164.all;
entity text_screen_top is
   port(
      clk,reset: in std_logic;
      btn: in std_logic_vector (2 downto 0);
      sw: in std_logic_vector (6 downto 0);
      hsync, vsync: out  std_logic;
      rgb: out std_logic_vector(2 downto 0)
   );
end text_screen_top;

architecture arch of text_screen_top is
   signal pixel_x, pixel_y: std_logic_vector(9 downto 0);
   signal video_on, pixel_tick: std_logic;
   signal rgb_reg, rgb_next: std_logic_vector(2 downto 0);
begin
   -- instantiate VGA sync circuit
   vga_sync_unit: entity work.vga_sync
      port map(clk=>clk, reset=>reset,
               hsync=>hsync, vsync=>vsync,
               video_on=>video_on, p_tick=>pixel_tick,
               pixel_x=>pixel_x, pixel_y=>pixel_y);
   -- instantiate full-screen text generator
   text_gen_unit: entity work.text_screen_gen
      port map(clk=>clk, reset=>reset, btn=>btn, sw=>sw,
               video_on=>video_on, pixel_x=>pixel_x,
               pixel_y=>pixel_y, text_rgb=>rgb_next);
   -- rgb buffer
   process (clk)
   begin
      if (clk'event and clk='1') then
         if (pixel_tick='1') then
            rgb_reg <= rgb_next;
         end if;
      end if;
   end process;
   rgb <= rgb_reg;
end arch;