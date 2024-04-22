----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    19:19:26 01/10/2013 
-- Design Name: 
-- Module Name:    fifo2pixel - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library work ;
use work.utils_pack.all ;


entity fifo_to_y is
	generic(WIDTH : positive := 320 ; HEIGHT : positive := 240);
	port(
		clk, resetn : in std_logic ;
		
	
		fifo_rd : out std_logic ;
		fifo_data : in std_logic_vector(15 downto 0);
		
		-- 
      line_available : in std_logic ;		

		
		-- pixel side 
		pixel_out_data : out std_logic_vector(7 downto 0 );  
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic
	
	);
end fifo_to_y;

architecture Behavioral of fifo_to_y is

signal pixel_count,pixel_in_hsync_count : std_logic_vector(9 downto 0);
signal sraz_pixel_count, en_pixel_count, sraz_hsync_count, en_hsync_count : std_logic ;
signal pixel_out_hsyncq, pixel_out_vsyncq : std_logic ;
signal pixel_value : std_logic_vector(7 downto 0);

signal cycle_counter : std_logic_vector(2 downto 0);
signal pixel_clk, pixel_clk_old, pixel_clk_fe, pixel_clk_re : std_logic ;
begin


process(clk, resetn)
begin	
	if resetn = '0' then
		cycle_counter <= (others => '0') ;
		pixel_clk_old <= '0' ;
	elsif clk'event and clk = '1' then
		cycle_counter <= cycle_counter + 1 ;
		pixel_clk_old <= pixel_clk ;
	end if ;
end process ;
pixel_clk <= cycle_counter(1);
		
		
pixel_clk_re <= pixel_clk and (not pixel_clk_old);
pixel_clk_fe <= (not pixel_clk) and (pixel_clk_old);

		
process(clk, resetn)
begin	
	if resetn = '0' then
		pixel_out_data <= (others => '0') ;
		pixel_out_clk <= '0' ;
		pixel_out_hsync <= '1' ;
		pixel_out_vsync <= '1' ;
	elsif clk'event and clk = '1' then
		pixel_out_data <= pixel_value ;
		pixel_out_hsync <= pixel_out_hsyncq ;
		pixel_out_vsync <= pixel_out_vsyncq ;
		pixel_out_clk <= pixel_clk ;
	end if ;
end process ;

			  
pixel_out_hsyncq <= '1' when pixel_in_hsync_count < 20 else
				'1' when pixel_count > (WIDTH - 1) else
 				'1' when pixel_in_hsync_count > (HEIGHT + 19) else
				'0' ;
				
pixel_out_vsyncq <= '1' when pixel_in_hsync_count < 4   else 
				'0' ;
						
en_pixel_count <= '0' when line_available = '0' and pixel_out_hsyncq = '1' else
						pixel_clk_fe ;
						
sraz_pixel_count <= pixel_clk_fe when pixel_count = (WIDTH + 22)else
						  '0' ;
						
sraz_hsync_count <= '1' when pixel_in_hsync_count = (HEIGHT + 22 ) else
						  '0' ;
	
fifo_rd <= 	(pixel_clk_fe) when pixel_out_hsyncq = '0' and pixel_count(0) =  '1' else 
				'0' ; -- to read first data ...

				
pixel_counter : simple_counter
	 generic map(NBIT => 10)
    port map( clk => clk ,
           resetn => resetn ,
           sraz => sraz_pixel_count ,
           en => en_pixel_count,
			  load => '0' ,
			  E => (others => '0'),
           Q => pixel_count
			  );
			  
en_hsync_count <= sraz_pixel_count ;	
		  
hsync_counter : simple_counter
	 generic map(NBIT => 10)
    port map( clk => clk ,
           resetn => resetn ,
           sraz => sraz_hsync_count ,
           en => en_hsync_count,
			  load => '0' ,
			  E => (others => '0'),
           Q =>pixel_in_hsync_count
			  );

pixel_value <= fifo_data(7 downto 0) when pixel_count(0) = '0' else
					fifo_data(15 downto 8) ;

end Behavioral;

