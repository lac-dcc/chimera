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
use work.image_pack.all ; 
use work.utils_pack.all ; 
use work.feature_pack.all ;
use work.camera_pack.all ;
 
 
ENTITY HARRIS_tb IS
END HARRIS_tb;
 
ARCHITECTURE behavior OF HARRIS_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal pixel_in_clk : std_logic := '0';
   signal pixel_in_hsync : std_logic := '0';
   signal pixel_in_vsync : std_logic := '0';
   signal pixel_in_data : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal pixel_out_clk : std_logic;
   signal pixel_out_hsync : std_logic;
   signal pixel_out_vsync : std_logic;
   signal harris_out : std_logic_vector(15 downto 0);

	signal end_of_block, latch_max : std_logic ;
	signal coordx :	std_logic_vector(8 downto 0);
	signal coordy	:	std_logic_vector(7 downto 0);
	signal harris_max : std_logic_vector(15 downto 0);

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
 
 
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HARRIS_FINAL
		generic map(WIDTH =>  320 , HEIGHT => 240, WINDOW_SIZE => 5)
		PORT MAP (
          clk => clk,
          resetn => resetn,
          pixel_in_clk => pixel_in_clk,
         pixel_in_hsync =>pixel_in_hsync,
         pixel_in_vsync =>pixel_in_vsync,
          pixel_out_clk => pixel_out_clk,
          pixel_out_hsync => pixel_out_hsync,
          pixel_out_vsync => pixel_out_vsync,
          pixel_in_data => pixel_in_data,
          harris_out => harris_out
        );

	uut2: HARRIS_TESSELATION 
	generic map(WIDTH => 320 , HEIGHT => 240, TILE_NBX => 10 , TILE_NBY => 10 )
	port map(
			clk => clk,
			resetn => resetn, 
			pixel_in_clk => pixel_out_clk ,pixel_in_hsync => pixel_out_hsync,pixel_in_vsync => pixel_out_vsync, 
			harris_score_in =>  harris_out,
			feature_coordx => coordx,
			feature_coordy	=> coordy,
			end_of_block	=> end_of_block,
			harris_score_out	=> harris_max,
			latch_maxima =>  latch_max
	);

	writer0: pgm_writer 
	generic map(WRITE_PATH =>  "/home/jpiat/Pictures/slam_vue_scaled_harris.pgm", HEIGHT => 240, WIDTH => 320)
		port map(
		clk => clk,
		resetn=> resetn , 
		pixel_in_clk => pixel_out_clk,pixel_in_hsync => pixel_out_hsync,pixel_in_vsync => pixel_out_vsync, 
		value_in => harris_out
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
 
--
--process
--	begin
--		pixel_in_clk <= '0';
--		if px_count < 320 and line_count >= 20 and line_count < 257 then
--				hsync <= '0' ;
--		else
--				hsync <= '1' ;
--		end if ;
--
--		if line_count < 3 then
--			vsync <= '1' ;
--		 else 
--			vsync <= '0' ;
--		end if ;
--		wait for pclk_period;
--		
--		pixel_in_clk <= '1';
--		if (px_count = 460 ) then
--			px_count <= 0 ;
--			if (line_count > 270) then
--			   line_count <= 0;
--		  else
--		    line_count <= line_count + 1 ;
--		  end if ;
--		else
--		  px_count <= px_count + 1 ;
--		end if ;
--		pixel_in_data <= pixel_in_data + 10 ;
--		wait for pclk_period;
--
--	end process;

END;
