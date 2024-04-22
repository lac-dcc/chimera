----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    17:47:57 01/15/2013 
-- Design Name: 
-- Module Name:    hyst_threshold - Behavioral 
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
USE WORK.image_pack.ALL ;
USE WORK.utils_pack.ALL ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hyst_threshold is
generic(WIDTH: natural := 640;
		  HEIGHT: natural := 480; LOW_THRESH: positive := 100 ; HIGH_THRESH: positive := 180);
port(
 		clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pixel_in_data : in std_logic_vector(7 downto 0 ); 
 		pixel_out_data : out std_logic_vector(7 downto 0 )
);
end hyst_threshold;

architecture RTL of hyst_threshold is
	signal block3x3_sig : matNM(0 to 2, 0 to 2) ;
	signal pixel_in_clk_en, new_block : std_logic ;
	signal pixel_out_data_d : std_logic_vector(7 downto 0 );
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
		
		pixel_out_data_d <= X"FF" when block3x3_sig(1,1) > HIGH_THRESH else
								X"FF" when block3x3_sig(1,1) > LOW_THRESH and block3x3_sig(0,0) > HIGH_THRESH else
								X"FF" when block3x3_sig(1,1) > LOW_THRESH and block3x3_sig(0,1) > HIGH_THRESH else			
								X"FF" when block3x3_sig(1,1) > LOW_THRESH and block3x3_sig(0,2) > HIGH_THRESH else
								X"FF" when block3x3_sig(1,1) > LOW_THRESH and block3x3_sig(1,0) > HIGH_THRESH else
								X"FF" when block3x3_sig(1,1) > LOW_THRESH and block3x3_sig(1,2) > HIGH_THRESH else
								X"FF" when block3x3_sig(1,1) > LOW_THRESH and block3x3_sig(2,0) > HIGH_THRESH else
								X"FF" when block3x3_sig(1,1) > LOW_THRESH and block3x3_sig(2,1) > HIGH_THRESH else
								X"FF" when block3x3_sig(1,1) > LOW_THRESH and block3x3_sig(2,2) > HIGH_THRESH else
								X"00" ;
								
								
								
		pixel_in_clk_en <= pixel_in_clk;
		delay_sync: generic_delay
		generic map( WIDTH =>  3 , DELAY => 2)
		port map(
			clk => clk, resetn => resetn ,
			input(0) =>pixel_in_hsync ,
			input(1) =>pixel_in_vsync ,
			input(2) => pixel_in_clk_en ,
			output(0) => pixel_out_hsync ,
			output(1) => pixel_out_vsync,
			output(2) => pixel_out_clk
		);	

		process(clk, resetn)
		begin
			if resetn = '0' then
				pixel_out_data <= (others => '0') ;
			elsif clk'event and clk = '1' then
				pixel_out_data <= pixel_out_data_d ;
			end if ;
		end process ;
		
		
end RTL;

