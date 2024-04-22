----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    16:59:00 10/04/2012 
-- Design Name: 
-- Module Name:    BRIEF - Behavioral 
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


library work ;
use work.feature_pack.all ;
use work.utils_pack.all ;
use work.image_pack.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BRIEF is
generic(WIDTH: natural := 640;
		  HEIGHT: natural := 480;
		  WINDOW_SIZE : positive := 8;
		  DESCRIPTOR_LENGTH : positive := 64;
		  PATTERN : brief_pattern );
		port(
			clk : in std_logic; 
			resetn : in std_logic; 
			pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
			pixel_in_data : in std_logic_vector(7 downto 0 ); 
			pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
			descriptor :  out std_logic_vector((DESCRIPTOR_LENGTH - 1) downto 0) );
end BRIEF;

architecture Behavioral of BRIEF is

signal new_block : std_logic ;
signal window : matNM(0 to WINDOW_SIZE-1, 0 to WINDOW_SIZE-1) ;
signal desc : std_logic_vector((DESCRIPTOR_LENGTH - 1) downto 0) ;

begin


window_mgt : blockNxN
		generic map(WIDTH => WIDTH ,
		  HEIGHT => HEIGHT,
		  N => WINDOW_SIZE)
		port map(
			clk => clk ,
			resetn => resetn , 
			pixel_in_clk => pixel_in_clk,pixel_in_hsync =>pixel_in_hsync,pixel_in_vsync =>pixel_in_vsync , 
			pixel_in_data =>  pixel_in_data, 
			new_block => new_block ,
			block_out => window);

gen_pattern_comp : for I in 0 to (PATTERN'length-1) generate 
		desc(I) <= '1' when  window((PATTERN(I)(0)/WINDOW_SIZE), (PATTERN(I)(0) rem WINDOW_SIZE)) < window((PATTERN(I)(1)/WINDOW_SIZE), (PATTERN(I)(1) rem WINDOW_SIZE))  else '0' ;
end generate gen_pattern_comp ;


delay_sync: generic_delay
		generic map( WIDTH =>  2 , DELAY => 1)
		port map(
			clk => clk, resetn => resetn ,
			input(0) =>pixel_in_hsync ,
			input(1) =>pixel_in_vsync ,
			output(0) => pixel_out_hsync ,
			output(1) => pixel_out_vsync
		);

pixel_out_clk <= new_block ;

end Behavioral;

