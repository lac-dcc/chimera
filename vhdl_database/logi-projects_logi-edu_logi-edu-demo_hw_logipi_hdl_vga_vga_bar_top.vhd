library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity vga_bar_top is
	--generic (COLOR_GRAY_SEL : std_logic := '0'); --color = 0 , gray = 1
   port (
      clk: in std_logic;
		reset: in std_logic;
		sel: in std_logic;
      hsync, vsync: out  std_logic;
      red: out std_logic_vector(2 downto 0);
		green: out std_logic_vector(2 downto 0);
		blue: out std_logic_vector(2 downto 0)
   );
end vga_bar_top;

architecture arch of vga_bar_top is
   signal pixel_x, pixel_y: std_logic_vector (9 downto 0);
   signal video_on, pixel_tick: std_logic;
   signal rgb_reg, rgb_next: std_logic_vector(2 downto 0);
	
	signal rgb: std_logic_vector(2 downto 0);	
	signal pix_x, pix_y: unsigned(9 downto 0);

	constant MAX_X: integer:=640;
	constant MAX_Y: integer:=480;
	--to view 8 grayslcae value split x into 8 segments.  Step = 640/8 = 80
	constant SEG_8_STEP: integer:=80;

begin

	pix_x <= unsigned(pixel_x);
   pix_y <= unsigned(pixel_y);

   -- instantiate VGA sync
   vga_sync_unit: entity work.vga_sync
   port map(clk=>clk, reset=>reset,
               video_on=>video_on, p_tick=>pixel_tick,
               hsync=>hsync, vsync=>vsync,
               pixel_x=>pixel_x, pixel_y=>pixel_y);
 
 	--switch between grayscale and color depending on swithc COLOR_GRAY value
--	red 	<= rgb(0) & rgb(1) & rgb(2) 	when COLOR_GRAY_SEL='1' else rgb(0) & rgb(0) & rgb(0);
--	green <= rgb(0) & rgb(1) & rgb(2) 	when COLOR_GRAY_SEL='1' else rgb(1) & rgb(1) & rgb(1);
--	blue 	<= rgb(0) & rgb(1) & rgb(2) 	when COLOR_GRAY_SEL='1' else rgb(2) & rgb(2) & rgb(2);

	--using the sw to select color vs greyscale
	red 	<= rgb(0) & rgb(1) & rgb(2) 	when sel='1' else rgb(0) & rgb(0) & rgb(0);
	green <= rgb(0) & rgb(1) & rgb(2) 	when sel='1' else rgb(1) & rgb(1) & rgb(1);
	blue 	<= rgb(0) & rgb(1) & rgb(2) 	when sel='1' else rgb(2) & rgb(2) & rgb(2);


	rgb_next <= "000" when pix_x>=0 and pix_x<(SEG_8_STEP-1) else
					"001" when pix_x>=SEG_8_STEP-1 and pix_x<(SEG_8_STEP*2-1) else
					"010" when pix_x>=(2*SEG_8_STEP)-1 and pix_x<(SEG_8_STEP*3-1) else
					"011" when pix_x>=(3*SEG_8_STEP)-1 and pix_x<(SEG_8_STEP*4-1) else
					"100" when pix_x>=(4*SEG_8_STEP)-1 and pix_x<(SEG_8_STEP*5-1) else
					"101" when pix_x>=(5*SEG_8_STEP)-1 and pix_x<(SEG_8_STEP*6-1) else
					"110" when pix_x>=(6*SEG_8_STEP)-1 and pix_x<(SEG_8_STEP*7-1) else
					"111";
 
	-- rgb buffer
   process (clk)
   begin
		if (reset = '1') then
			rgb_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         if (pixel_tick='1') then
            rgb_reg <= rgb_next;
         end if;
      end if;
   end process;
	rgb <= rgb_reg when video_on='1' else "000";
end arch;