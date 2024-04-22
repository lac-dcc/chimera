----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    11:45:31 03/14/2012 
-- Design Name: 
-- Module Name:    blob_detection - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.log2;
use ieee.math_real.ceil;

library work;
use work.image_pack.all ;
use work.utils_pack.all ;
use work.blob_pack.all ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blob_detection is
generic(LINE_SIZE : natural := 640);
port(
 		clk : in std_logic; 
 		resetn: in std_logic; 
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic;
 		pixel_in_data : in std_logic_vector(7 downto 0 );
		blob_data : out std_logic_vector(7 downto 0);
		
		--memory_interface to copy results onpixel_in_vsync
		mem_addr : out std_logic_vector(15 downto 0);
		mem_data : inout std_logic_vector(15 downto 0);
		mem_wr : out std_logic
		);
end blob_detection;

architecture Behavioral of blob_detection is

signal pixel_x, pixel_y : std_logic_vector(9 downto 0);
signal pixel_in_hsync_old: std_logic := '0';
signal sraz_neighbours, sraz_blobs : std_logic ;
signal neighbours0 : pix_neighbours;
signal new_line, add_neighbour, add_pixel, merge_blob, new_blob, oe_blob : std_logic ;
signal current_pixel, current_blob : std_logic_vector(7 downto 0) ;
signal new_blob_index, blob_index_to_merge, true_blob_index : std_logic_vector(7 downto 0) ;
signal has_neighbour : std_logic ;
signal is_blob_pixel : std_logic ;
signal pixel_in_clk_old, pixel_in_clk_re : std_logic ;
signal pixel_in_vsync_fe,pixel_in_vsync_re,pixel_in_vsync_old : std_logic ;
signal blob_class : std_logic_vector(7 downto 0) ;
begin


sraz_blobs <=pixel_in_vsync_fe ;

blobs0: blob_manager 
	generic map(NB_BLOB => 32)
	port map(
		clk => clk, resetn => resetn,
		blob_class => blob_class ,
		blob_index => current_blob,
		next_blob_index => new_blob_index,
		blob_index_to_merge => blob_index_to_merge ,
		merge_blob => merge_blob,
		new_blob => new_blob, 
		add_pixel => add_pixel,
		pixel_posx => pixel_x, pixel_posy => pixel_y,
		
		send_blobs =>pixel_in_vsync_re,
		--memory_interface to copy results onpixel_in_vsync
		mem_addr => mem_addr,
		mem_data => mem_data,
		mem_wr => mem_wr
	);
	
update_neighbours : neighbours
		generic map(WIDTH => LINE_SIZE )
		port map(
			clk => clk, 
			resetn => resetn , sraz => sraz_neighbours, 
			pixel_in_clk => pixel_in_clk,pixel_in_hsync =>pixel_in_hsync, 
        pixel_in_vsync =>pixel_in_vsync,			
			pixel_in_data => current_blob,
			neighbours => neighbours0);
			
pixel_counter0: pixel_counter
		port map(
			clk => clk,
			resetn => resetn, 
			pixel_in_clk => pixel_in_clk,
			pixel_in_hsync =>pixel_in_hsync,
			pixel_count => pixel_x
			);
			
line_counter0: line_counter
		generic map(MAX => 480)
		port map(
			clk => clk,
			resetn => resetn, 
			pixel_in_hsync =>pixel_in_hsync,
			pixel_in_vsync =>pixel_in_vsync, 
			line_count => pixel_y(8 downto 0)
			);
pixel_y(9) <= '0' ;

current_blob <= neighbours0(3) when is_blob_pixel='1' and neighbours0(3) /= 0 else
					 neighbours0(0) when is_blob_pixel='1' and neighbours0(0) /= 0 else
					 neighbours0(1) when is_blob_pixel='1' and neighbours0(1) /= 0 else
					 neighbours0(2) when is_blob_pixel='1' and neighbours0(2) /= 0 else
					 new_blob_index when is_blob_pixel='1'  else
					 (others => '0') ;

has_neighbour <= '1' when (neighbours0(3) /= 0) or (neighbours0(2) /= 0) or (neighbours0(1) /= 0) or (neighbours0(0) /= 0) else
						'0' ;

sraz_neighbours <= pixel_in_vsync_re ;
is_blob_pixel <= 	'1' when pixel_in_data /= x"00" and pixel_in_hsync = '0' else
						'0';
blob_class <= 	pixel_in_data ;				

new_blob <= pixel_in_clk_re when is_blob_pixel = '1' and has_neighbour = '0' else
				'0' ;
add_pixel <= pixel_in_clk_re when is_blob_pixel='1' and has_neighbour /= '0' else
				 '0' ;
					 
add_neighbour <= pixel_in_clk when pixel_in_hsync = '0' else
					  '0' ;
merge_blob <= pixel_in_clk_re when neighbours0(0) /= 0 and neighbours0(2) /= 0 and neighbours0(0) /= neighbours0(2) and is_blob_pixel='1' else
				  pixel_in_clk_re when neighbours0(3) /= 0 and neighbours0(2) /= 0 and neighbours0(3) /= neighbours0(2) and is_blob_pixel='1' else
				  '0' ;
				  
blob_index_to_merge <= neighbours0(2) ;


process(clk, resetn)
begin
	if resetn = '0' then
		pixel_in_clk_old <= '0' ;
		pixel_in_vsync_old <= '0' ;
	elsif clk'event and clk = '1' then
		pixel_in_clk_old <= pixel_in_clk ;
		pixel_in_vsync_old <=pixel_in_vsync ;
	end if ;
end process ;
pixel_in_clk_re <= (NOT pixel_in_clk_old) and pixel_in_clk ;
pixel_in_vsync_fe <= pixel_in_vsync_old and (NOT pixel_in_vsync) ;
pixel_in_vsync_re <= (NOT pixel_in_vsync_old) and pixel_in_vsync ;

end Behavioral;

