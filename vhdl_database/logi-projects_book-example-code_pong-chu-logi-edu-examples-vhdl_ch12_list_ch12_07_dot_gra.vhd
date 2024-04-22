--Listing 12.7
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity bitmap_gen is
   port(
        clk, reset: std_logic;
        btn: std_logic_vector(1 downto 0);
        sw: std_logic_vector(2 downto 0);
        video_on: in std_logic;
        pixel_x,pixel_y: in std_logic_vector(9 downto 0);
        bit_rgb: out std_logic_vector(2 downto 0)
   );
end bitmap_gen;

architecture dual_port_ram_arch of bitmap_gen is
   signal pix_x, pix_y: unsigned(9 downto 0);
   signal refr_tick: std_logic;
   signal load_tick: std_logic;
   ----------------------------------------------
   -- video sram
   ----------------------------------------------
   signal we: std_logic;
   signal addr_r, addr_w: std_logic_vector(13 downto 0);
   signal din, dout: std_logic_vector(2 downto 0);
   ----------------------------------------------
   -- dot location and velocity
   ----------------------------------------------
   constant MAX_X: integer:=128;
   constant MAX_Y: integer:=128;
   -- dot velocity can be pos or neg
   constant DOT_V_P: unsigned(6 downto 0)
            :=to_unsigned(1,7);
   constant DOT_V_N: unsigned(6 downto 0)
            :=unsigned(to_signed(-1,7));
   -- reg to keep track of dot location
   signal dot_x_reg, dot_x_next: unsigned(6 downto 0);
   signal dot_y_reg, dot_y_next: unsigned(6 downto 0);
   -- reg to keep track of dot veolocity
   signal v_x_reg, v_x_next: unsigned(6 downto 0);
   signal v_y_reg, v_y_next: unsigned(6 downto 0);
   ----------------------------------------------
   -- object output signals
   ----------------------------------------------
   signal bitmap_on: std_logic;
   signal bitmap_rgb: std_logic_vector(2 downto 0);
begin
    -- instantiate debounce circuit for a button
    debounce_unit: entity work.debounce
      port map(clk=>clk, reset=>reset, sw=>btn(0),
               db_level=>open, db_tick=>load_tick);
   -- instantiate dual port video RAM (2^12-by-7)
   video_ram: entity work.xilinx_dual_port_ram_sync
      generic map(ADDR_WIDTH=>14, DATA_WIDTH=>3)
      port map(clk=>clk, we=>we,
               addr_a=>addr_w, addr_b=>addr_r,
               din_a=>din, dout_a=>open, dout_b=>dout);
   -- video ram interface
   addr_w <= std_logic_vector(dot_y_reg & dot_x_reg);
   addr_r <=
      std_logic_vector(pix_y(6 downto 0) & pix_x(6 downto 0));
   we <= '1';
   din <= sw;
   bitmap_rgb <= dout;
   -- registers
   process (clk,reset)
   begin
      if reset='1' then
         dot_x_reg <= (others=>'0');
         dot_y_reg <= (others=>'0');
         v_x_reg <= DOT_V_P;
         v_y_reg <= DOT_V_P;
      elsif (clk'event and clk='1') then
         dot_x_reg <= dot_x_next;
         dot_y_reg <= dot_y_next;
         v_x_reg <= v_x_next;
         v_y_reg <= v_y_next;
      end if;
   end process;
   -- misc. signals
   pix_x <= unsigned(pixel_x);
   pix_y <= unsigned(pixel_y);
   refr_tick <= '1' when (pix_y=481) and (pix_x=0) else
                '0';
   -- pixel within bit map area
   bitmap_on <=
      '1' when (pix_x<=127) and (pix_y<=127) else
      '0';
   -- dot position
   -- "randomly" load dot location when btn(0) pressed
   dot_x_next <=
       pix_x(6 downto 0) when load_tick='1' else
       dot_x_reg + v_x_reg when refr_tick='1' else
       dot_x_reg ;
   dot_y_next <=
       pix_y(6 downto 0) when load_tick='1' else
       dot_y_reg + v_y_reg when refr_tick='1' else
   dot_y_reg ;
   -- dot x velocity
   process(v_x_reg,dot_x_reg)
   begin
      v_x_next <= v_x_reg;
      if dot_x_reg =1 then           -- reach left
         v_x_next <= DOT_V_P;        -- bounce back
      elsif dot_x_reg=(MAX_Y-2) then -- reach right
         v_x_next <= DOT_V_N;        -- bounce back
      end if;
   end process;
   -- dot y velocity
   process(v_y_reg,dot_y_reg)
   begin
      v_y_next <= v_y_reg;
      if dot_y_reg =1 then             -- reach top
         v_y_next <= DOT_V_P;
      elsif dot_y_reg = (MAX_Y-2) then -- reach bottom
         v_y_next <= DOT_V_N;
      end if;
   end process;
   -- rgb multiplexing circuit
   process(video_on,bitmap_on,bitmap_rgb)
   begin
      if video_on='0' then
          bit_rgb <= "000"; --blank
      else
         if bitmap_on='1' then
            bit_rgb <= bitmap_rgb;
         else
            bit_rgb <= "110"; -- yellow background
         end if;
      end if;
   end process;
end dual_port_ram_arch;

