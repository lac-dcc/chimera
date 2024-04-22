----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    10:25:52 03/03/2012 
-- Design Name: 
-- Module Name:    sobel3x3 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library WORK ;
USE work.image_pack.ALL ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity erode3x3 is
generic(INVERT : natural := 0; 
		  VALUE : std_logic_vector(7 downto 0) := X"FF";
		  WIDTH: natural := 640;
		  HEIGHT: natural := 480);
port(
 		clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pixel_in_data : in std_logic_vector(7 downto 0 ); 
 		pixel_out_data : out std_logic_vector(7 downto 0 )

);
end erode3x3;



architecture Behavioral of erode3x3 is
	signal block3x3_sig : matNM(0 to 2, 0 to 2) ;
	signal new_block: std_logic ;
	signal result : std_logic_vector(7 downto 0);
--	for block0 : block3X3 use entity block3X3(RTL) ;
begin

		block0:  block3X3 
		generic map(WIDTH =>  WIDTH, HEIGHT => HEIGHT)
		port map(
			clk => clk ,
			resetn => resetn , 
			pixel_in_clk => pixel_in_clk ,pixel_in_hsync =>pixel_in_hsync ,pixel_in_vsync =>pixel_in_vsync,
			pixel_in_data => pixel_in_data ,
			new_block => new_block,
			block_out => block3x3_sig);
		
		inv0 : IF INVERT = 0 generate 
			result <= VALUE when ((block3x3_sig(0,1) = "011111111" )AND (block3x3_sig(1,0) = "011111111") 
							AND (block3x3_sig(1,1) = "011111111") 
							AND (block3x3_sig(1,2) = "011111111")  
							AND (block3x3_sig(2,1) = "011111111")) else
							(others => '0');
		end generate inv0 ;
		
		ninv0 : IF INVERT = 1 generate 
			result <= (others => '0') when ((block3x3_sig(0,1) = "011111111")AND (block3x3_sig(1,0) = "011111111") 
							AND (block3x3_sig(1,1) = "011111111") 
							AND (block3x3_sig(1,2) = "011111111")  
							AND (block3x3_sig(2,1) = "011111111")) else
							VALUE ;
		end generate ninv0 ;
	
	
	process(clk, resetn)
	begin
		if resetn = '0' then
			pixel_out_data <= (others => '0') ;
		elsif clk'event and clk = '1' then
			if new_block = '1' then
				pixel_out_data <= result ;
			end if ;
		end if ;
	end process ;
	
	
		--sync signals latch
		process(clk, resetn)
		begin
			if resetn = '0' then 
				pixel_out_clk <= '0' ;
				pixel_out_hsync <= '0' ;
				pixel_out_vsync <= '0' ;
			elsif clk'event and clk = '1'  then
				pixel_out_clk <= pixel_in_clk ;
				pixel_out_hsync <=pixel_in_hsync ;
				pixel_out_vsync <=pixel_in_vsync ;
			end if ;
		end process ;

end Behavioral;

