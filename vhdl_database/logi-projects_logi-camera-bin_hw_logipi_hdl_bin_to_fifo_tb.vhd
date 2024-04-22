--------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com>
--
-- Create Date:   09:17:22 10/12/2012
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/projects/fpga-cam/hdl/test_benches/HARRIS_tb.vhd
-- Project Name:  SPARTCAM
-- Target Device:  
-- Tool versions: ISE 14.1  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: HARRIS
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
USE ieee.std_logic_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
library work ;
use work.utils_pack.all ; 
use work.camera_pack.all ;
 
 
ENTITY bin_to_fifo_tb IS
END bin_to_fifo_tb;
 
ARCHITECTURE behavior OF bin_to_fifo_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
		component bin_to_fifo is
			generic(ADD_SYNC : boolean := false);
			port(
			clk, resetn : in std_logic ;
			sreset : in std_logic ;

			pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
			pixel_in_data : in std_logic_vector(7 downto 0);
			fifo_data : out std_logic_vector(15 downto 0);
			fifo_wr : out std_logic 

			);
		end component;

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal pixel_in_clk : std_logic := '0';
   signal pixel_in_hsync : std_logic := '0';
   signal pixel_in_vsync : std_logic := '0';
   signal pixel_in_data : std_logic_vector(7 downto 0) := (others => '0');

	signal fifo_wr : std_logic ;
	signal fifo_data : std_logic_vector(15 downto 0);
   -- Clock period definitions
	constant clk_period : time := 5 ns ;
	constant pclk_period : time := 40 ns ;
 
 
	signal px_count, line_count, byte_count : integer := 0 ;
BEGIN
 
	v_cam : virtual_camera 
		generic map(IMAGE_PATH => "/home/jpiat/Pictures/OpenCV_Chessboard.pgm", PERIOD => pclk_period)
		port map(
				clk => clk, 
				resetn => resetn,
				pixel_data =>  pixel_in_data,
				pixel_out_clk => pixel_in_clk, pixel_out_hsync =>pixel_in_hsync, pixel_out_vsync =>pixel_in_vsync );
 
 
 
		UUT : bin_to_fifo
			generic map(ADD_SYNC =>true)
			port map(
				clk => clk, resetn => resetn,
				sreset => '0',

				pixel_in_clk => pixel_in_clk,
				pixel_in_hsync => pixel_in_hsync,
				pixel_in_vsync => pixel_in_vsync,
				pixel_in_data => pixel_in_data,
				fifo_data => fifo_data,
				fifo_wr => fifo_wr
		);
   -- Clock process definitions
   clk_process :process
   begin
		resetn <= '0';
		wait for clk_period * 10;
		resetn <= '1' ;
		wait ;
   end process;


   reset_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;



END;
