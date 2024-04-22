-- Listing 12.2
-- notes to run on logi:
-- * converting book 3 color bits to the edu 9 color bits.
-- * the rgb values are controlled with sw(1:0) & btn(1).  
-- * reset = btn(0);

library ieee;
use ieee.std_logic_1164.all;
entity vga_test is
   port (
		clk: in std_logic;
      btn_n: in std_logic_vector(1 downto 0);
      sw_n: in std_logic_vector(1 downto 0);
      hsync, vsync: out  std_logic;
      red: out std_logic_vector(2 downto 0);
		green: out std_logic_vector(2 downto 0);
		blue: out std_logic_vector(2 downto 0)
   );
end vga_test;

architecture arch of vga_test is
   signal rgb_reg: std_logic_vector(2 downto 0);
   signal video_on: std_logic;
	signal reset: std_logic;
	signal sw, btn : std_logic_vector(1 downto 0);
	
begin
	reset <= btn(0);
	sw <= not(sw_n);
	btn <= not(btn_n);

   -- instantiate VGA sync circuit
   vga_sync_unit: entity work.vga_sync
      port map(clk=>clk, 
					reset=>reset, 
					hsync=>hsync,
               vsync=>vsync, 
					video_on=>video_on,
               p_tick=>open,
					pixel_x=>open, 
					pixel_y=>open);
   -- rgb buffer
   process (clk,reset)
   begin
      if reset='1' then
         rgb_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         rgb_reg <= sw & btn(1);
      end if;
   end process;
   --rgb <= rgb_reg when video_on='1' else "000";
	red <= "111" when (rgb_reg(2) = '1' and video_on='1') else "000";
	green <= "111" when (rgb_reg(1) = '1' and video_on='1') else "000";
	blue <= "111" when (rgb_reg(0) = '1' and video_on='1') else "000";
	
	
end arch;

