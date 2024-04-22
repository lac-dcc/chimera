--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package graphic_pack is

component graphic_generator is
port(clk, resetn : in  std_logic ;
	  pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out		std_logic ;
	  pixel_r, pixel_g, pixel_b	:	out	 std_logic_vector(7 downto 0)
	  );
end component;

component draw_square is
port(
 		clk : in std_logic; 
 		resetn : in std_logic; 
		posx, posy, width, height : in unsigned(9 downto 0);
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pixel_in_data : in std_logic_vector(7 downto 0 ); 
 		pixel_out_data : out std_logic_vector(7 downto 0 )
	);
end component;


end graphic_pack;

package body graphic_pack is

end graphic_pack;
