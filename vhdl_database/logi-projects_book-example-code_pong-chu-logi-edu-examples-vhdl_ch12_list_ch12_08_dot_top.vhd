-- Listing 12.8
library ieee;
use ieee.std_logic_1164.all;
entity dot_top is
   port (
      clk,reset: in std_logic;
      btn: in std_logic_vector (1 downto 0);
      sw: in std_logic_vector (2 downto 0);
      hsync, vsync: out  std_logic;
      rgb: out std_logic_vector(2 downto 0)
   );
end dot_top;

architecture arch of dot_top is
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
   -- instantiate bit-map pixel generator
   bitmap_unit: entity work.bitmap_gen
      port map(clk=>clk, reset=>reset, btn=>btn, sw=>sw,
               video_on=>video_on, pixel_x=>pixel_x,
               pixel_y=>pixel_y, bit_rgb=>rgb_next);
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