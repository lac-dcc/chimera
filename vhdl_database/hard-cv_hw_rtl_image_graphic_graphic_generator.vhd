----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    12:00:39 05/29/2012 
-- Design Name: 
-- Module Name:    graphic_generator - Behavioral 
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

library work ;
use work.generic_components.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity graphic_generator is
port(clk, resetn : in  std_logic ;
	  pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out		std_logic ;
	  pixel_r, pixel_g, pixel_b	:	out	 std_logic_vector(7 downto 0)
	  );
end graphic_generator;

architecture Behavioral of graphic_generator is
constant div_factor	:	positive := 4 ;
signal line_count, pixel_count : std_logic_vector(9 downto 0) ;
signal clock_div : std_logic_vector(9 downto 0) ;
signal pxclk, new_line , pxclk_rising, pxclk_old	: std_logic ;
signal sraz_pixel_count, sraz_line_count, valid_pixel  : std_logic ;
begin


clock_div_3mhz :  simple_counter
 generic map(NBIT => 10)
 port map( clk => clk,
		  resetn => resetn,
		  sraz => '0',
		  en => '1',
		  load => '0', 
		  E => std_logic_vector(to_unsigned(0, 10)),
		  Q => clock_div
		  );	

pxclk <= clock_div(div_factor) ;


process(clk, resetn)
begin
if resetn = '0' then
	pxclk_old <= '0' ;
elsif clk'event and clk ='1' then
	if pxclk_old /= pxclk and pxclk = '1' then
		pxclk_rising <= '1' ;
	else
		pxclk_rising <= '0' ;
	end if ;
	pxclk_old <= pxclk ;
end if ;
end process ;

line_counter :  simple_counter
 generic map(NBIT => 10)
 port map( clk => clk,
		  resetn => resetn,
		  sraz => sraz_line_count,
		  en => sraz_pixel_count,
		  load => '0', 
		  E => std_logic_vector(to_unsigned(0, 10)),
		  Q => line_count
		  );	
		  
		  
pixel_counter :  simple_counter
 generic map(NBIT => 10)
 port map( clk => clk,
		  resetn => resetn,
		  sraz => sraz_pixel_count,
		  en => pxclk_rising,
		  load => '0', 
		  E => std_logic_vector(to_unsigned(0, 10)),
		  Q => pixel_count
		  );	


sraz_pixel_count <= '1' when pixel_count >= 460 else
						  '0';
sraz_line_count <= '1' when line_count >= 270 else
						 '0';


valid_pixel <= '1' when pixel_count < 320 and line_count >= 20 and line_count < 257 else
					'0' ; 

pixel_out_hsync <= NOT valid_pixel ;
			
pixel_out_vsync <= '1' when line_count < 3 else
			'0' ;

pixel_out_clk <= clock_div(div_factor) and valid_pixel ;


pixel_r <= line_count(9 downto 2);
pixel_g <= line_count(9 downto 2);
pixel_b <= line_count(9 downto 2);

end Behavioral;

