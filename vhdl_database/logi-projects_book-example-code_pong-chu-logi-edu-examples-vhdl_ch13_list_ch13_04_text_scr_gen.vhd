-- Listing 13.4
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity text_screen_gen is
   port(
      clk, reset: std_logic;
      btn: std_logic_vector(2 downto 0);
      sw: std_logic_vector(6 downto 0);
      video_on: in std_logic;
      pixel_x, pixel_y: in std_logic_vector(9 downto 0);
      text_rgb: out std_logic_vector(2 downto 0)
   );
end text_screen_gen;

architecture arch of text_screen_gen is
   -- font ROM
   signal char_addr: std_logic_vector(6 downto 0);
   signal rom_addr: std_logic_vector(10 downto 0);
   signal row_addr: std_logic_vector(3 downto 0);
   signal bit_addr: unsigned(2 downto 0);
   signal font_word: std_logic_vector(7 downto 0);
   signal font_bit: std_logic;
   -- tile RAM
   signal we: std_logic;
   signal addr_r, addr_w: std_logic_vector(11 downto 0);
   signal din, dout: std_logic_vector(6 downto 0);
   -- 80-by-30 tile map
   constant MAX_X: integer:=80;
   constant MAX_Y: integer:=30;
   -- cursor
   signal cur_x_reg, cur_x_next: unsigned(6 downto 0);
   signal cur_y_reg, cur_y_next: unsigned(4 downto 0);
   signal move_x_tick, move_y_tick: std_logic;
   signal cursor_on: std_logic;
   -- delayed pixel count
   signal pix_x1_reg, pix_y1_reg: unsigned(9 downto 0);
   signal pix_x2_reg, pix_y2_reg: unsigned(9 downto 0);
   -- object output signals
   signal font_rgb, font_rev_rgb:
            std_logic_vector(2 downto 0);
begin
    -- instantiate debounce circuit for two buttons
    debounce_unit0: entity work.debounce
       port map(clk=>clk, reset=>reset, sw=>btn(0),
               db_level=>open, db_tick=>move_x_tick);
    debounce_unit1: entity work.debounce
       port map(clk=>clk, reset=>reset, sw=>btn(1),
               db_level=>open, db_tick=>move_y_tick);
   -- instantiate font ROM
   font_unit: entity work.font_rom
      port map(clk=>clk, addr=>rom_addr, data=>font_word);
   -- instantiate dual port tile RAM (2^12-by-7)
   video_ram: entity work.xilinx_dual_port_ram_sync
      generic map(ADDR_WIDTH=>12, DATA_WIDTH=>7)
      port map(clk=>clk, we=>we,
               addr_a=>addr_w, addr_b=>addr_r,
               din_a=>din, dout_a=>open, dout_b=>dout);
   -- registers
   process (clk)
   begin
     if (clk'event and clk='1') then
         cur_x_reg <= cur_x_next;
         cur_y_reg <= cur_y_next;
         pix_x1_reg <= unsigned(pixel_x); -- 2 clock delay
         pix_x2_reg <= pix_x1_reg;
         pix_y1_reg <= unsigned(pixel_y);
         pix_y2_reg <= pix_y1_reg;
     end if;
   end process;
   -- tile RAM write
   addr_w <=std_logic_vector(cur_y_reg & cur_x_reg);
   we <= btn(2);
   din <= sw;
   -- tile RAM read
   -- use non-delayed coordinates to form tile RAM address
   addr_r <=pixel_y(8 downto 4) & pixel_x(9 downto 3);
   char_addr <= dout;
   -- font ROM
   row_addr<=pixel_y(3 downto 0);
   rom_addr <= char_addr & row_addr;
   -- use delayed coordinate to select a bit
   bit_addr<=pix_x2_reg(2 downto 0);
   font_bit <= font_word(to_integer(not bit_addr));
   -- new cursor position
   cur_x_next <=
      (others=>'0') when move_x_tick='1' and -- wrap around
                         cur_x_reg=MAX_X-1 else
      cur_x_reg + 1  when move_x_tick='1' else
      cur_x_reg ;
   cur_y_next <=
      (others=>'0') when move_y_tick='1' and -- wrap around
                         cur_y_reg=MAX_Y-1 else
      cur_y_reg + 1  when move_y_tick='1' else
      cur_y_reg;
   -- object signals
   -- green over black and reversed video for courser
   font_rgb <="010" when font_bit='1' else "000";
   font_rev_rgb <="000" when font_bit='1' else "010";
   -- use delayed coordinates for comparison
   cursor_on <='1' when pix_y2_reg(8 downto 4)=cur_y_reg and
                        pix_x2_reg(9 downto 3)=cur_x_reg else
               '0';
   -- rgb multiplexing circuit
   process(video_on,cursor_on,font_rgb,font_rev_rgb)
   begin
      if video_on='0' then
         text_rgb <= "000"; --blank
      else
         if cursor_on='1' then
            text_rgb <= font_rev_rgb;
         else
            text_rgb <= font_rgb;
         end if;
      end if;
   end process;
end arch;
