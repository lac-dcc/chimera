----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    15:23:24 10/11/2012 
-- Design Name: 
-- Module Name:    HARRIS - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.image_pack.all ;
use work.filter_pack.all ;
use work.utils_pack.all ;
use work.feature_pack.all ;


entity HARRIS_FINAL is
generic(WIDTH : positive := 640 ; HEIGHT : positive := 480; WINDOW_SIZE : positive := 5; DS_FACTOR : natural := 1);
port (
		clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pixel_in_data : in std_logic_vector(7 downto 0 ); 
 		harris_out : out std_logic_vector(15 downto 0 )
);
end HARRIS_FINAL;

architecture Behavioral of HARRIS_FINAL is

	signal pixel_from_sobel : std_logic_vector(7 downto 0);
	signal pixel_from_gauss : std_logic_vector(7 downto 0);
	
	signal pxclk_from_gauss, href_from_gauss,pixel_in_vsync_from_gauss : std_logic ;
	signal pxclk_from_sobel, href_from_sobel,pixel_in_vsync_from_sobel : std_logic ;


	signal xgrad, ygrad : signed(7 downto 0);
	signal xgrad_square, ygrad_square, xygrad : signed(15 downto 0);
	signal gradx_square_lines, grady_square_lines, gradxy_lines: vec_16s(0 to (WINDOW_SIZE-1));
	signal gradx_square_sum_col, grady_square_sum_col, gradxy_sum_col: vec_16s(0 to (WINDOW_SIZE-1));
	signal gradx_square_sum_line, grady_square_sum_line, gradxy_sum_line : signed(15 downto 0);
	
	signal xgrad_square_sum, ygrad_square_sum, xygrad_sum : signed(15 downto 0);
	signal xgrad_square_sum_divn, ygrad_square_sum_divn, xygrad_sum_divn : signed(15 downto 0);

	signal pixel_count : std_logic_vector((nbit(WIDTH) - 1) downto 0);
	signal line_count : std_logic_vector((nbit(HEIGHT) - 1) downto 0);
	signal sample_index :  std_logic_vector((nbit(WINDOW_SIZE) - 1) downto 0) ;

	
	signal pxclk_from_sobel_old, pxclk_from_sobel_re : std_logic ;
	signal href_from_sobel_old, href_from_sobel_re : std_logic ;
	signal pxclk_from_sobel_re_delayed, pxclk_from_sobel_re_delayed_bis : std_logic ;
	signal end_of_window : std_logic ;
	

	
	signal pixel_in_hsync_delayed,pixel_in_vsync_delayed : std_logic ;
	
	for all : sobel3x3 use entity work.sobel3x3(RTL) ;
	for all : gauss3x3 use entity work.gauss3x3(RTL) ;
	
begin

	gauss3x3_0	: gauss3x3 
		generic map(WIDTH => WIDTH,
				  HEIGHT => HEIGHT)
		port map(
					clk => clk ,
					resetn => resetn ,
					pixel_in_clk => pixel_in_clk,pixel_in_hsync =>pixel_in_hsync,pixel_in_vsync => pixel_in_vsync,
					pixel_out_clk => pxclk_from_gauss, pixel_out_hsync => href_from_gauss, pixel_out_vsync =>pixel_in_vsync_from_gauss, 
					pixel_in_data => pixel_in_data,  
					pixel_out_data => pixel_from_gauss
		);		
		
		
--	sobel0: sobel3x3
--		generic map(
--		  WIDTH => WIDTH,
--		  HEIGHT => HEIGHT)
--		port map(
--			clk => clk ,
--			resetn => resetn ,
--			pixel_in_clk => pxclk_from_gauss,pixel_in_hsync => href_from_gauss,pixel_in_vsync => pixel_in_vsync_from_gauss,
--			pixel_out_clk => pxclk_from_sobel, pixel_out_hsync => href_from_sobel, pixel_out_vsync =>pixel_in_vsync_from_sobel, 
--			pixel_in_data => pixel_from_gauss,  
--			pixel_out_data => pixel_from_sobel,
--			x_grad => xgrad ,
--			y_grad => ygrad
--		);	

   -- sobel is used to compuet gradient in Harris response Ix and Iy
	sobel0: sobel3x3
		generic map(
		  WIDTH => WIDTH,
		  HEIGHT => HEIGHT)
		port map(
			clk => clk ,
			resetn => resetn ,
			pixel_in_clk => pixel_in_clk,pixel_in_hsync =>pixel_in_hsync,pixel_in_vsync => pixel_in_vsync,
			pixel_out_clk => pxclk_from_sobel, pixel_out_hsync => href_from_sobel, pixel_out_vsync =>pixel_in_vsync_from_sobel, 
			pixel_in_data => pixel_in_data,  
			pixel_out_data => pixel_from_sobel,
			x_grad => xgrad ,
			y_grad => ygrad
		);	
	
	
	
	xgrad_square <= xgrad * xgrad ; -- Ix²
	ygrad_square <= ygrad * ygrad ; -- Iy²
	xygrad <= xgrad * ygrad ; -- IxIy
	
	
	-- Here start suming over the Harris window
	
	-- This component takes the Ix², Iy², IxIy and store them to have them available
	-- to compute summing over the window
	gen_square_acc:  HARRIS_LINE_ACC_SMALL
		generic map(NB_LINE => (WINDOW_SIZE - 1), WIDTH => 320) 
		port map(clk => clk, resetn => resetn,
		  rewind_acc => href_from_sobel,
		  wr_acc	=> pxclk_from_sobel_re,
		  gradx_square_in => xgrad_square, grady_square_in => ygrad_square, gradxy_in => xygrad,
		  gradx_square_out => gradx_square_lines(1 to (WINDOW_SIZE-1)), grady_square_out => grady_square_lines(1 to (WINDOW_SIZE-1)), gradxy_out => gradxy_lines(1 to (WINDOW_SIZE-1))
		  );	
	process(clk)
		begin
			if clk'event and clk = '1' then 
				if pxclk_from_sobel_re = '1' then
					gradx_square_lines(0) <= xgrad_square ;
					grady_square_lines(0) <= ygrad_square ;
					gradxy_lines(0) <= xygrad ;
				end if ;
			end if ;
	end process ;
	
	-- this component adds the Ix for a window line
	add_lines_gradx : HARRIS_16SADDER -- latency NB_LINE
		generic map(NB_VAL => WINDOW_SIZE)
		port map(
				clk => clk, resetn => resetn,
				val_array => gradx_square_lines ,
				result => gradx_square_sum_line
		);

	-- this component adds the Iy for a window line
	add_lines_grady : HARRIS_16SADDER  -- latency NB_LINE
		generic map(NB_VAL => WINDOW_SIZE)
		port map(
				clk => clk, resetn => resetn,
				val_array => grady_square_lines ,
				result => grady_square_sum_line
		);
	-- this component adds the IxIy for a window line
	add_lines_gradxy : HARRIS_16SADDER  -- latency NB_LINE
		generic map(NB_VAL => WINDOW_SIZE)
		port map(
				clk => clk, resetn => resetn,
				val_array => gradxy_lines ,
				result => gradxy_sum_line
		);
		
		
		delay_pclk: generic_delay
		generic map( WIDTH =>  1 , DELAY => WINDOW_SIZE - 2)
		port map(
			clk => clk, resetn => resetn ,
			input(0) => pxclk_from_sobel_re,
			output(0) => pxclk_from_sobel_re_delayed 
		);	
		
		
		
		process(clk)
		begin
			if clk'event and clk = '1' then 
				if pxclk_from_sobel_re_delayed = '1' then
					gradx_square_sum_col(0) <= SHIFT_RIGHT(gradx_square_sum_line, DS_FACTOR) ; 
				end if ;
			end if ;
		end process ;
		gen_window_gradx: for i in 1 to (WINDOW_SIZE - 1) generate
			process(clk)
			begin
				if clk'event and clk = '1' then 
					if pxclk_from_sobel_re_delayed = '1' then
						gradx_square_sum_col(i) <= gradx_square_sum_col(i-1) ; 
					end if ;
				end if ;
			end process ;
		end generate ;
		
		
		process(clk)
		begin
			if clk'event and clk = '1' then 
				if pxclk_from_sobel_re_delayed = '1' then
					grady_square_sum_col(0) <= SHIFT_RIGHT(grady_square_sum_line, DS_FACTOR) ; 
				end if ;
			end if ;
		end process ;
		gen_window_grady: for i in 1 to (WINDOW_SIZE - 1) generate
			process(clk)
			begin
				if clk'event and clk = '1' then 
					if pxclk_from_sobel_re_delayed = '1' then
						grady_square_sum_col(i) <= grady_square_sum_col(i-1) ; 
					end if ;
				end if ;
			end process ;
		end generate ;
	
	
		process(clk)
		begin
			if clk'event and clk = '1' then 
				if pxclk_from_sobel_re_delayed = '1' then
					gradxy_sum_col(0) <= SHIFT_RIGHT(gradxy_sum_line, DS_FACTOR) ; 
				end if ;
			end if ;
		end process ;
		gen_window_gradxy: for i in 1 to (WINDOW_SIZE - 1) generate
			process(clk)
			begin
				if clk'event and clk = '1' then 
					if pxclk_from_sobel_re_delayed = '1' then
						gradxy_sum_col(i) <= gradxy_sum_col(i-1) ; 
					end if ;
				end if ;
			end process ;
		end generate ;
	
	
	-- This component sums the window columns for Ix (using the sum over the line)
	add_cols_gradx : HARRIS_16SADDER -- latency NB_LINE
		generic map(NB_VAL => WINDOW_SIZE)
		port map(
				clk => clk, resetn => resetn,
				val_array => gradx_square_sum_col,
				result => xgrad_square_sum
		);

	-- This component sums the window columns for Iy (using the sum over the line)
	add_cols_grady : HARRIS_16SADDER  -- latency NB_LINE
		generic map(NB_VAL => WINDOW_SIZE)
		port map(
				clk => clk, resetn => resetn,
				val_array => grady_square_sum_col,
				result => ygrad_square_sum
		);
	
	-- This component sums the window columns for IxIy (using the sum over the line)
	add_cols_gradxy : HARRIS_16SADDER  -- latency NB_LINE
		generic map(NB_VAL => WINDOW_SIZE)
		port map(
				clk => clk, resetn => resetn,
				val_array => gradxy_sum_col,
				result => xygrad_sum
		);
		
		
		delay_pclk_bis: generic_delay
		generic map( WIDTH =>  1 , DELAY => WINDOW_SIZE - 2)
		port map(
			clk => clk, resetn => resetn ,
			input(0) => pxclk_from_sobel_re_delayed,
			output(0) => pxclk_from_sobel_re_delayed_bis 
		);	
		

		process(clk, resetn)
		begin
			if resetn = '0' then
				pxclk_from_sobel_old <= '0' ;
				href_from_sobel_old <= '0' ;
			elsif clk'event and clk = '1' then 
				pxclk_from_sobel_old <= pxclk_from_sobel ;
				href_from_sobel_old <= href_from_sobel ;
			end if ;
		end process ;
		pxclk_from_sobel_re <= pxclk_from_sobel AND (NOT pxclk_from_sobel_old);
		href_from_sobel_re <= href_from_sobel AND (NOT href_from_sobel_old);	
		
		
		-- Summing is divided to remain on 16-bits
		xgrad_square_sum_divn <= SHIFT_RIGHT(xgrad_square_sum, DS_FACTOR) ;
		ygrad_square_sum_divn <= SHIFT_RIGHT(ygrad_square_sum, DS_FACTOR) ;
		xygrad_sum_divn <= SHIFT_RIGHT(xygrad_sum, DS_FACTOR);
		
		
		-- Harris response is computed using equation
		-- det(A)+ k*trace(A)²
		harris_rep0: HARRIS_RESPONSE 
		port map(
				clk => clk, resetn => resetn,
				en => pxclk_from_sobel_re_delayed_bis,
				xgrad_square_sum => xgrad_square_sum_divn, ygrad_square_sum => ygrad_square_sum_divn, xygrad_sum => xygrad_sum_divn,
				dv	=> pixel_out_clk,
				harris_response => harris_out
		);
			
		pixel_out_vsync <=pixel_in_vsync_delayed ;
		pixel_out_hsync <=pixel_in_hsync_delayed ;
		
		delay_sync: generic_delay
		generic map( WIDTH =>  2 , DELAY => ((2*(WINDOW_SIZE - 2))+3))
		port map(
			clk => clk, resetn => resetn ,
			input(0) => href_from_sobel ,
			input(1) =>pixel_in_vsync_from_sobel ,
			output(0) =>pixel_in_hsync_delayed ,
			output(1) =>pixel_in_vsync_delayed
		);	
		

end Behavioral;

