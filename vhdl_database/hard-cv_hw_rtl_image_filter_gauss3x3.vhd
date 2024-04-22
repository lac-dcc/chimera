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
USE WORK.image_pack.ALL ;
USE WORK.utils_pack.ALL ;

-- clk must at least 4x faster than pixel clock
-- this limits pipeline depth and thus save resources
entity gauss3x3 is
generic(WIDTH: natural := 640;
		  HEIGHT: natural := 480);
port(
 		clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_in_clk,pixel_in_hsync, pixel_in_vsync: in std_logic; 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync: out std_logic; 
 		pixel_in_data : in std_logic_vector(7 downto 0 ); 
 		pixel_out_data : out std_logic_vector(7 downto 0 )

);
end gauss3x3;




architecture Arithmetic of gauss3x3 is
	signal new_conv : std_logic;
	signal busy : std_logic;
	signal pixel_from_conv, pixel_from_conv_latched : signed(15 downto 0);
	signal block3x3_sig : matNM(0 to 2, 0 to 2) ;
	signal new_block, pxclk_state : std_logic ;
	signal pixel_in_clk_old,pixel_in_hsync_old, new_conv_old, pixel_in_clk_en : std_logic ;
--	for block0 : block3X3 use entity block3X3(RTL) ;
--	for conv3x3_0 : conv3x3 use entity conv3x3(RTL) ;
begin

		block0:  block3X3 
		generic map(WIDTH =>  WIDTH, HEIGHT => HEIGHT)
		port map(
			clk => clk ,
			resetn => resetn , 
			pixel_in_clk => pixel_in_clk , pixel_in_hsync=> pixel_in_hsync, pixel_in_vsync=> pixel_in_vsync,
			pixel_in_data => pixel_in_data ,
			new_block => new_block,
			block_out => block3x3_sig);
		
		
		conv3x3_0 :  conv3x3 
		generic map(KERNEL =>((1, 2, 1),(2, 4, 2),(1, 2, 1)),
		  NON_ZERO	=> ((0, 0), (0, 1), (0, 2), (1, 0), (1, 1), (1, 2), (2, 0), (2, 1), (2, 2) ), -- (3, 3) indicate end  of non zero values
		  IS_POWER_OF_TWO => 0
		  )
		port map(
				clk => clk,
				resetn => resetn, 
				new_block => new_block,
				block3x3 => block3x3_sig,
				new_conv => new_conv,
				busy => busy,
				raw_res => pixel_from_conv
		);
	
		pixel_in_clk_en <= pixel_in_clk ;
		delay_sync: generic_delay
		generic map( WIDTH =>  3 , DELAY => 5)
		port map(
			clk => clk, resetn => resetn ,
			input(0) => pixel_in_hsync,
			input(1) => pixel_in_vsync,
			input(2) => pixel_in_clk_en ,
			output(0) => pixel_out_hsync,
			output(1) => pixel_out_vsync,
			output(2) => pixel_out_clk
		);	
		
		process(clk, resetn)
		begin
			if resetn = '0' then
				pixel_from_conv_latched <= (others => '0') ;
			elsif clk'event and clk = '1' then
				pixel_from_conv_latched <= pixel_from_conv ;
			end if ;
		end process ;
	
		--pixel_out_y_data <= std_logic_vector(pixel_from_conv(12 downto 5)) ; -- divide by 64
		pixel_out_data <= std_logic_vector(pixel_from_conv_latched(11 downto 4)) ; -- divide by 16

end Arithmetic;

architecture RTL of gauss3x3 is
	signal pixel_from_conv_latched : signed(15 downto 0);
	signal block3x3_sig : matNM(0 to 2, 0 to 2) ;
	signal new_block, pxclk_state : std_logic ;
	signal pixel_in_clk_old,pixel_in_hsync_old, new_conv_old, pixel_in_clk_en : std_logic ;
	type mat33_16s is array (0 to 2,0 to 2) of signed(15 downto 0);
	type vec3_16s is array (0 to 2) of signed(15 downto 0);
	
	signal mult_scal : mat33_16s ;
	signal add_vec, sum_step: vec3_16s ;
begin

		block0:  block3X3 
		generic map(WIDTH =>  WIDTH, HEIGHT => HEIGHT)
		port map(
			clk => clk ,
			resetn => resetn , 
			pixel_in_clk => pixel_in_clk , pixel_in_hsync=> pixel_in_hsync, pixel_in_vsync=> pixel_in_vsync,
			pixel_in_data => pixel_in_data ,
			new_block => new_block,
			block_out => block3x3_sig);
		
		mult_scal(0, 0) <= resize(block3x3_sig(0,0), 16);
		mult_scal(0, 1) <= SHIFT_LEFT(resize(block3x3_sig(0,1), 16),1);
		mult_scal(0, 2) <= resize(block3x3_sig(0,2), 16);
		
		mult_scal(1, 0) <= SHIFT_LEFT(resize(block3x3_sig(1,0), 16),1);
		mult_scal(1, 1) <= SHIFT_LEFT(resize(block3x3_sig(1,1), 16),2);
		mult_scal(1, 2) <= SHIFT_LEFT(resize(block3x3_sig(1,2), 16),1);
		
		mult_scal(2, 0) <= resize(block3x3_sig(2,0), 16);
		mult_scal(2, 1) <= SHIFT_LEFT(resize(block3x3_sig(2,1), 16),1);
		mult_scal(2, 2) <= resize(block3x3_sig(2,2), 16);
				
		add_vec(0) <= mult_scal(0, 0) + mult_scal(1, 0) + mult_scal(2, 0) ;
		add_vec(1) <=  mult_scal(0, 1) + mult_scal(1, 1) + mult_scal(2, 1) ;
		add_vec(2) <=  mult_scal(0, 2) + mult_scal(1, 2) + mult_scal(2, 2) ;
		
		process(clk, resetn)
		begin
			if resetn = '0' then
				sum_step(0) <= (others => '0') ;
				sum_step(1)<= (others => '0') ;
				sum_step(2)<= (others => '0') ;
			elsif clk'event and clk = '1' then
				sum_step(0) <= add_vec(0) ;
				sum_step(1) <= sum_step(0) + add_vec(1) ;
				sum_step(2) <= sum_step(1) + add_vec(2) ;
			end if ;
		end process;
	
		pixel_in_clk_en <= pixel_in_clk ;
		delay_sync: generic_delay
		generic map( WIDTH =>  3 , DELAY => 5)
		port map(
			clk => clk, resetn => resetn ,
			input(0) => pixel_in_hsync,
			input(1) => pixel_in_vsync,
			input(2) => pixel_in_clk_en ,
			output(0) => pixel_out_hsync,
			output(1) => pixel_out_vsync,
			output(2) => pixel_out_clk
		);	
		
		process(clk, resetn)
		begin
			if resetn = '0' then
				pixel_from_conv_latched <= (others => '0') ;
			elsif clk'event and clk = '1' then
				pixel_from_conv_latched <= sum_step(2) ;
			end if ;
		end process ;
		
		
		pixel_out_data <= std_logic_vector(pixel_from_conv_latched(11 downto 4)) ; -- divide by 16

end RTL;


