----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:02:53 04/20/2013 
-- Design Name: 
-- Module Name:    yuv_pixel2fifo - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity yuv_to_fifo is
port(
	clk, resetn, sreset : in std_logic ;
	pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
	pixel_in_y_data, pixel_in_u_data, pixel_in_v_data : in std_logic_vector(7 downto 0);
	fifo_data : out std_logic_vector(15 downto 0);
	fifo_wr : out std_logic 

);
end yuv_to_fifo;

architecture Behavioral of yuv_to_fifo is
signal pixel_in_hsync_rising_edge,pixel_in_vsync_rising_edge, pxclk_rising_edge,pixel_in_hsync_old,pixel_in_vsync_old, pxclk_old: std_logic ;
signal pixel_count :std_logic_vector(1 downto 0);
signal write_pixel : std_logic ;
signal enabled : std_logic ;
begin


process(clk, resetn)
begin
	if resetn = '0' then
		enabled <= '0' ;
	elsif clk'event and clk = '1' then
		if sreset = '1' then
			enabled <= '0' ;
		elsif pixel_in_vsync_rising_edge = '1' then
			enabled <= '1' ;
		end if ;
	end if ;
end process ;

process(clk, resetn)
begin
	if resetn = '0' then
		pixel_in_vsync_old <= '0' ;
	elsif clk'event and clk = '1' then
		pixel_in_vsync_old <=pixel_in_vsync ;
	end if ;
end process ;
pixel_in_vsync_rising_edge <= (NOT pixel_in_vsync_old) and pixel_in_vsync ;

process(clk, resetn)
begin
	if resetn = '0' then
		pxclk_old <= '0' ;
	elsif clk'event and clk = '1' then
		pxclk_old <= pixel_in_clk ;
	end if ;
end process ;
pxclk_rising_edge <= (NOT pxclk_old) and pixel_in_clk ;


process(clk, resetn)
begin
	if resetn = '0' then
		pixel_count <= (others => '0'); 
	elsif clk'event and clk = '1' then
		if pixel_in_hsync = '1' or sreset = '1' then
			pixel_count <= (others => '0'); 
		elsif pxclk_rising_edge = '1'  and pixel_in_hsync = '0' then
			pixel_count <= pixel_count + 1 ;
		end if ;
	end if ;
end process ;
write_pixel <= pxclk_rising_edge;

fifo_wr <= write_pixel when pixel_in_vsync = '0' and pixel_in_hsync = '0' and enabled = '1' else
			 pixel_in_vsync_rising_edge when sreset = '0' else
			 '0';
				
fifo_data <= (pixel_in_v_data & pixel_in_y_data ) when pixel_count(0) = '0' and pixel_in_vsync = '0' else
				 (pixel_in_u_data & pixel_in_y_data ) when pixel_count(0) = '1' and pixel_in_vsync = '0'  else
				  X"55AA" ;
end Behavioral;

