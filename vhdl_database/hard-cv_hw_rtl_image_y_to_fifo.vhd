----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    10:59:31 01/24/2013 
-- Design Name: 
-- Module Name:    pixel2fifo - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity y_to_fifo is
generic(ADD_SYNC : boolean := false);
port(
	clk, resetn : in std_logic ;
	pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
	pixel_in_data : in std_logic_vector(7 downto 0);
	fifo_data : out std_logic_vector(15 downto 0);
	fifo_wr : out std_logic 

);
end y_to_fifo;

architecture Behavioral of y_to_fifo is
signal pixel_in_hsync_rising_edge,pixel_in_vsync_rising_edge, pxclk_rising_edge,pixel_in_hsync_old,pixel_in_vsync_old, pxclk_old, write_pixel_old : std_logic ;
signal pixel_buffer : std_logic_vector(15 downto 0);	
signal pixel_count :std_logic_vector(7 downto 0);
signal write_pixel, write_pixel_re : std_logic ;
begin

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
		pixel_in_hsync_old <= '0' ;
	elsif clk'event and clk = '1' then
		pixel_in_hsync_old <=pixel_in_hsync ;
	end if ;
end process ;
pixel_in_hsync_rising_edge <= (NOT pixel_in_hsync_old) and pixel_in_hsync ;

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
		pixel_buffer(15 downto 0) <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if pixel_in_hsync_rising_edge = '1' then
			pixel_buffer(15 downto 0) <= (others => '0') ;
		elsif pxclk_rising_edge = '1' then
			pixel_buffer(7 downto 0) <= pixel_buffer(15 downto 8) ;
			pixel_buffer(15 downto 8)  <= pixel_in_data ;
		end if ;
	end if ;
end process ;

process(clk, resetn)
begin
	if resetn = '0' then
		pixel_count <= (others => '0'); 
	elsif clk'event and clk = '1' then
		if pixel_in_hsync_rising_edge = '1' then
			pixel_count <= (others => '0'); 
		elsif pxclk_rising_edge = '1'  and pixel_in_hsync = '0' then
			pixel_count <= pixel_count + 1 ;
		end if ;
	end if ;
end process ;
write_pixel <= pixel_count(0);

process(clk, resetn)
begin
	if resetn = '0' then
		write_pixel_old <= '0'; 
	elsif clk'event and clk = '1' then
		write_pixel_old <= write_pixel ;
	end if ;
end process ;
write_pixel_re <= (not write_pixel_old ) and write_pixel ;


gen_add_sync : if ADD_SYNC generate
	fifo_wr <= (write_pixel_re and (NOT write_pixel_old)) when pixel_in_vsync = '0' and pixel_in_hsync = '0' else
					pixel_in_vsync_rising_edge ;
	fifo_data <= pixel_buffer when pixel_in_vsync = '0' else
					  X"55AA" ;
end generate ;

gen_no_sync : if (NOT ADD_SYNC) generate
	fifo_wr <= (write_pixel_re and (NOT write_pixel_old)) when pixel_in_vsync = '0' and pixel_in_hsync = '0' else
					'0' ;
	fifo_data <= pixel_buffer ;
end generate ;


end Behavioral;

