----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    09:31:17 03/23/2012 
-- Design Name: 
-- Module Name:    pixel_counter - Behavioral 
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



library work ;
use work.utils_pack.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pixel_counter is
		generic(POL : std_logic := '0'; MAX : positive := 640);
		port(
			clk : in std_logic; 
			resetn : in std_logic; 
			pixel_in_clk,pixel_in_hsync : in std_logic; 
			pixel_count : out std_logic_vector((nbit(MAX) - 1) downto 0 )
			);
end pixel_counter;

architecture Behavioral of pixel_counter is
signal pixel_in_clk_old, pixel_in_clk_edge : std_logic ;
signal pixel_count_temp : std_logic_vector((nbit(MAX) - 1) downto 0 ) ;
begin

process(clk, resetn) 
begin
	if resetn = '0' then 
		pixel_in_clk_old <= '0' ;
	elsif clk'event and clk = '1'  then
		pixel_in_clk_old <= pixel_in_clk ;
end if ;
end process ;

gen_pol_pos : if POL = '1' generate
				pixel_in_clk_edge <= (NOT pixel_in_clk_old) AND pixel_in_clk ;
			 end generate ;
			 
gen_pol_neg : if POL = '0' generate
				pixel_in_clk_edge <= (pixel_in_clk_old) AND (NOT pixel_in_clk) ;
			 end generate ;

process(clk, resetn)
begin
if resetn = '0' then 
	pixel_count_temp <= (others => '0') ;
elsif clk'event and clk = '1'  then
		if pixel_in_hsync = '1' then
			pixel_count_temp <= (others => '0') ;
		elsif pixel_in_clk_edge = '1' then
			pixel_count_temp <= pixel_count_temp + 1 ;
		end if ;
end if ;
end process ;

pixel_count <= pixel_count_temp ;

end Behavioral;

