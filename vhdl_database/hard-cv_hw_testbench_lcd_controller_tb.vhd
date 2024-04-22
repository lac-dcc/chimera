--------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com>
--
-- Create Date:   16:29:52 03/15/2012
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/projects/fpga-cam/platform/papilio/SPARTCAM/blob_detection_tb.vhd
-- Project Name:  SPARTCAM
-- Target Device:  
-- Tool versions: ISE 14.1  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: blob_detection
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
 
 
library work ;
use work.camera.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY lcd_controller_tb IS
END lcd_controller_tb;
 
ARCHITECTURE behavior OF lcd_controller_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)

    
	constant clk_period : time := 5 ns ;
	constant pclk_period : time := 150 ns ;
	
	signal clk, resetn : std_logic ;
	signal pxclk,pixel_in_hsync,pixel_in_vsync : std_logic ;
	signal pixel : std_logic_vector(7 downto 0 ) := (others => '0');
	signal px_count, line_count, byte_count : integer := 0 ;
	
	
	signal lcd_data : std_logic_vector(15 downto 0);
	signal lcd_rs, lcd_wr, lcd_cs, lcd_rd : std_logic ;
	
 
BEGIN
 
stimuli : graphic_generator 
port map(clk => clk, resetn => resetn,
	  pixel_out_clk => pxclk, pixel_out_hsync =>pixel_in_hsync, pixel_out_vsync =>pixel_in_vsync ,
	  pixel_r => pixel
	  );
 
 
uut : lcd_controller
port map(
 		clk => clk,
 		resetn => resetn,
 		pixel_in_clk => pxclk,pixel_in_hsync =>pixel_in_hsync,pixel_in_vsync =>pixel_in_vsync, 
 		pixel_r => pixel, pixel_g => pixel, pixel_b => pixel,
		lcd_rs => lcd_rs, lcd_cs => lcd_cs, lcd_rd => lcd_rd, lcd_wr => lcd_wr,
	   lcd_data => lcd_data
	); 

process
variable a : integer := 0 ;
begin
	while a < 10 loop
		resetn <= '0' ;
		clk <= '0';
		wait for clk_period;
		clk <= '1';
		wait for clk_period; 
		a := a + 1 ;
	end loop ;
	while true loop
		resetn <= '1' ;
		clk <= '0';
		wait for clk_period;
		clk <= '1';
		wait for clk_period; 
	end loop ;
end process;
	


END;
