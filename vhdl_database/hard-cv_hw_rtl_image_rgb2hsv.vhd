----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    16:59:59 04/10/2012 
-- Design Name: 
-- Module Name:    rgb2hsv - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 6 
-- Tool versions: ISE 14.1 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- work on rgb555 values
entity rgb2hsv is
port( 
		clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pixel_r, pixel_g, pixel_b : in std_logic_vector(4 downto 0 ); 
 		pixel_h, pixel_s, pixel_v : out std_logic_vector(7 downto 0 )
);

end rgb2hsv;

architecture Behavioral of rgb2hsv is
	signal rmax, gmax, bmax : std_logic ;
	signal max, min, c : std_logic_vector(7 downto 0);
	signal Hpr, Hpg, Hpb, sixtyonc : signed(15 downto 0);
begin

rmax <= '1'  when pixel_r > pixel_g and pixel_r > pixel_b else
		  '0' ;

gmax <= '1' when pixel_g > pixel_r and pixel_g > pixel_b else
		  '0' ; 

bmax <= '1' when pixel_b > pixel_r and pixel_b > pixel_g else
		  '0' ;
		  
max <= pixel_r when rmax = '1' else
		 pixel_g when gmax = '1' else
		 pixel_b when bmax = '1' else
		 pixel_r ;
		 
min <= pixel_r when pixel_r < pixel_g and pixel_r < pixel_b else
		 pixel_g when pixel_g < pixel_r and pixel_g < pixel_b else
		 pixel_b when pixel_b < pixel_r and pixel_b < pixel_g else
		 pixel_r ;

c <= max - min ;

Hpr <=  (pixel_g - pixel_b) * sixtyonc; -- need to work on table implementation for the 32 values of C
Hpg <=  (pixel_b - pixel_r) * sixtyonc;
Hpb <=  (pixel_r - pixel_g) * sixtyonc;


pixel_h <= ("0000" & Hpr(15 downto 4)) when rmax else
		("0000" & Hpg(15 downto 4)) when gmax else
		("0000" & Hpb(15 downto 4)) when bmax else
		(others => '0') ;

pixel_v <= max ;
end Behavioral;

