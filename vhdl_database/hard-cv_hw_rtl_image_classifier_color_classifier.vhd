----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:58:56 04/20/2013 
-- Design Name: 
-- Module Name:    color_classifier - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity color_classifier is
port( clk	:	in std_logic ;
		resetn	:	in std_logic ;
		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pixel_y : in std_logic_vector(7 downto 0) ;
		pixel_u : in std_logic_vector(7 downto 0) ;
		pixel_v : in std_logic_vector(7 downto 0) ;
		pixel_class : out std_logic_vector(7 downto 0);
		
		--color lut interface 
		color_index : out std_logic_vector(11 downto 0);
		lut_in : in std_logic_vector(7 downto 0)
);
end color_classifier;

architecture Behavioral of color_classifier is

begin

color_index <= pixel_y(7 downto 4) & pixel_u(7 downto 4) & pixel_v(7 downto 4) ;

process(clk, resetn)
begin
	if resetn = '0' then
		pixel_out_clk <= '0';
		pixel_out_hsync <= '0' ;
		pixel_out_vsync <= '0' ;
	elsif clk'event and clk = '1' then
		pixel_out_clk <= pixel_in_clk;
		pixel_out_hsync <=pixel_in_hsync ;
		pixel_out_vsync <=pixel_in_vsync ;
	end if ;
end process ;

pixel_class <= lut_in ;

end Behavioral;

