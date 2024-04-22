----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    11:48:01 03/12/2012 
-- Design Name: 
-- Module Name:    binarization - Behavioral 
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
use IEEE.NUMERIC_STD.ALL ;
use IEEE.STD_LOGIC_UNSIGNED.ALL ;

library work;
use work.image_pack.all ;
use work.utils_pack.all ;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity synced_binarization is
port( clk	:	in std_logic ;
		resetn	:	in std_logic ;
		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pixel_data_1 : in std_logic_vector(7 downto 0) ;
		pixel_data_2 : in std_logic_vector(7 downto 0) ;
		pixel_data_3 : in std_logic_vector(7 downto 0) ;
		upper_bound_1	:	in std_logic_vector(7 downto 0);
		upper_bound_2	:	in std_logic_vector(7 downto 0);
		upper_bound_3	:	in std_logic_vector(7 downto 0);
		lower_bound_1	:	in std_logic_vector(7 downto 0);
		lower_bound_2	:	in std_logic_vector(7 downto 0);
		lower_bound_3	:	in std_logic_vector(7 downto 0);
		pixel_out_data : out std_logic_vector(7 downto 0) 
);
end synced_binarization;

architecture Behavioral of synced_binarization is
signal pixel_out_data_temp : std_logic_vector(7 downto 0);
signal pixel_data1_bin, pixel_data2_bin, pixel_data3_bin, pixels_and : std_logic ;
begin


pixel_data1_bin <= '0' when pixel_data_1 >= upper_bound_1 else
						'0' when pixel_data_1 < lower_bound_1 else
						'1' ;

pixel_data2_bin <= '0' when pixel_data_2 >= upper_bound_2 else
						'0' when pixel_data_2 < lower_bound_2 else
						'1' ;

pixel_data3_bin <= '0' when pixel_data_3 >= upper_bound_3 else
						'0' when pixel_data_3 < lower_bound_3 else
						'1' ;
						
						
pixels_and <=  pixel_data1_bin AND pixel_data2_bin AND pixel_data3_bin ;


pixel_out_data_temp <= X"FF" when pixels_and = '1' else
							  X"00" ;

pixel_out_data_latch0 : edge_triggered_latch 
		 generic map( NBIT => 8)
		 port map( clk =>clk,
				  resetn => resetn ,
				  sraz => '0' ,
				  en => pixel_in_clk ,
				  d => pixel_out_data_temp , 
				  q => pixel_out_data);
				  

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

end Behavioral;

