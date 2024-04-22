----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    17:12:12 03/16/2012 
-- Design Name: 
-- Module Name:    draw_square - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity draw_square is
port(
 		clk : in std_logic; 
 		resetn : in std_logic; 
		posx, posy, width, height : in unsigned(9 downto 0);
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pixel_in_data : in std_logic_vector(7 downto 0 ); 
 		pixel_out_data : out std_logic_vector(7 downto 0 )
	);
end draw_square;

architecture Behavioral of draw_square is
signal pixel_x, pixel_y : unsigned(9 downto 0);
signal last_hsync, last_pxclk : std_logic := '0';
begin

pixel_out_data <= X"00" when pixel_x > posx and pixel_x < (posx + width) and pixel_y > posy and pixel_y < (posy + height)  else
						pixel_in_data ;



process(clk, resetn)
begin
	if resetn = '0' then
		pixel_out_clk <= '0' ;
		pixel_out_hsync <= '0' ;
		pixel_out_vsync <= '0' ;
	elsif clk'event and clk = '1' then
		if pixel_in_clk = '1' then
			pixel_out_clk <= '1' ;
		else
			pixel_out_clk <= '0' ;
		end if;
		ifpixel_in_hsync = '1' then
			pixel_out_hsync <= '1' ;
		else
			pixel_out_hsync <= '0' ;
		end if;
		ifpixel_in_vsync = '1' then
			pixel_out_vsync <= '1' ;
		else
			pixel_out_vsync <= '0' ;
		end if;
	end if;
end process ;

process(clk, resetn)
begin
	if resetn = '0' then
		pixel_x <= (others => '0');
		pixel_y <= (others => '0');
	elsif clk'event and clk = '1' then
		ifpixel_in_vsync = '1' then
			pixel_x <= (others => '0');
			pixel_y <= (others => '0');
		elsifpixel_in_hsync = '1' and last_hsync /=pixel_in_hsync then
			pixel_x <= (others => '0');
			pixel_y <= pixel_y + 1 ;
		elsif last_pxclk /= pixel_in_clk and pixel_in_clk = '0' andpixel_in_hsync = '0' then --increasing on falling edge of clock
			pixel_x <= pixel_x + 1;
		end if;
		last_hsync <=pixel_in_hsync ;
		last_pxclk <= pixel_in_clk ;
	end if;
end process ;

end Behavioral;

