----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    14:38:37 03/08/2012 
-- Design Name: 
-- Module Name:    block3X3 - Behavioral 
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
use WORK.image_pack.ALL ;
use WORK.utils_pack.ALL ;
use WORK.primitive_pack.ALL ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity block3X3_pixel_pipeline is
		generic(WIDTH: natural := 640;
		  HEIGHT: natural := 480);
		port(
			resetn : in std_logic; 
			pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic;
			pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic;
			pixel_in_data : in std_logic_vector(7 downto 0 ); 
			block_out : out matNM(0 to 2, 0 to 2));
end block3X3_pixel_pipeline;

architecture Behavioral of block3X3_pixel_pipeline is
type std_mat3 is array (0 to 2, 0 to 2) of std_logic_vector(8 downto 0);
type std_vec3 is array (0 to 2) of std_logic_vector(8 downto 0);


signal block3x3 :  matNM(0 to 2, 0 to 2) ;

signal std_block3x3	: std_mat3 ;					

signal line_wr: std_logic ;


signal LINE0_INPUT, LINE0_OUTPUT, LINE1_INPUT, LINE1_OUTPUT : std_logic_vector(7 downto 0) := X"00";

signal LINE_BUFFER : std_logic_vector(15 downto 0) ;
signal LINE_BUFFER_ADDR : std_logic_vector((nbit(WIDTH) - 1) downto 0) ;

signal INPUT_LINES, OUTPUT_LINES : std_logic_vector(15 downto 0) ;
signal final_res : signed(31 downto 0);
signal enable_line0_latches, enable_line1_latches : std_logic ;

signal nb_line : std_logic_vector((nbit(HEIGHT) - 1) downto 0) := (others => '0');
signal pixel_counterq, pixel_counterq_m : std_logic_vector((nbit(WIDTH) - 1) downto 0) := (others => '0');
signalpixel_in_hsync_delayed : std_logic ;

begin


lines0: dpram_NxN
	generic map(SIZE => WIDTH + 1 , NBIT => 16, ADDR_WIDTH => nbit(WIDTH))
	port map(
 		clk => pixel_in_clk, 
 		we => NOTpixel_in_hsync_delayed ,
 		spo => OUTPUT_LINES,
		dpo => 	LINE_BUFFER,
 		di => INPUT_LINES,
		dpra => LINE_BUFFER_ADDR,
 		a => (pixel_counterq)
	); 
	
LINE_BUFFER_ADDR <= (others => '0') whenpixel_in_hsync = '1' else
							pixel_counterq + 1 ;
	

LINE0_OUTPUT <= OUTPUT_LINES(15 downto 8);
LINE1_OUTPUT <= OUTPUT_LINES(7 downto 0);

--INPUT_LINES(7 downto 0) <=  std_logic_vector(block3x3(1)(0)(7 downto 0)); 
--INPUT_LINES(15 downto 8) <= std_logic_vector(block3x3(2)(0)(7 downto 0)); 

--LINE0_INPUT <= LINE1_OUTPUT;
LINE0_INPUT <= LINE_BUFFER(7 downto 0);
LINE1_INPUT <= pixel_in_data;

INPUT_LINES(15 downto 8) <= LINE0_INPUT ;
INPUT_LINES(7 downto 0) <=  LINE1_INPUT ; 
 

enable_line0_latches <= (NOTpixel_in_hsync) when nb_line > 0 else
								'0' ;
enable_line1_latches <= (NOTpixel_in_hsync) when nb_line > 1 else
								'0' ;



convert_cols_std : for C in 0 to 2 generate
	convert_rows_std : for L in 0 to 2 generate
		block3x3(L,C) <= signed(std_block3x3(L,C))  ;
	end generate convert_rows_std; 
end generate convert_cols_std; 


gen_latches_row : for I in 0 to 2 generate
	gen_latches_col : for J in 0 to 2 generate
		
		left_cols : if j < 2 generate
			latch_i_i: generic_latch
						  generic map(NBIT => 9)
						  port map(
							clk => pixel_in_clk ,
							resetn => resetn ,
							sraz =>pixel_in_vsync ,
							en => NOTpixel_in_hsync,
							d => std_block3x3(I,J+1), 
							q => std_block3x3(I,J)
						  );
		end generate left_cols;
		
		right_col_0 : if i = 0 and j = 2 generate
			std_block3x3(0,2) <= ('0' & LINE0_OUTPUT) ;
		end generate right_col_0;
		
		right_col_1 : if i = 1 and j = 2 generate
			std_block3x3(1,2) <= ('0' & LINE1_OUTPUT) ;
		end generate right_col_1;
		
		right_col_2 : if i = 2 and j = 2 generate
			latch_i_i: generic_latch
						  generic map(NBIT => 9)
						  port map(
							clk => pixel_in_clk ,
							resetn =>resetn ,
							sraz =>pixel_in_vsync,
							en => NOTpixel_in_hsync,
							d => ( '0' & pixel_in_data), 
							q => std_block3x3(2,2)
						  );
		end generate right_col_2;
	end generate gen_latches_col; 
end generate gen_latches_row; 


pixel_counter0: simple_counter
		generic map(NBIT => nbit(WIDTH))
		port map(
			clk => pixel_in_clk,
			resetn => resetn, 
			sraz =>pixel_in_hsync ,
			en => NOTpixel_in_hsync , 
			load => '0',
			E => (others => '0'), 
			Q => pixel_counterq
			);
			
delay_sync_signals: generic_latch
			  generic map(NBIT => 2)
			  port map(
				clk => (pixel_in_clk) ,
				resetn =>resetn ,
				sraz => '0' ,
				en => '1',
				d =>pixel_in_hsync &pixel_in_vsync, 
				q(1) =>pixel_in_hsync_delayed, 
				q(0) => pixel_out_vsync
			  );
pixel_out_hsync <=pixel_in_hsync_delayed ;
pixel_out_clk <= pixel_in_clk ;
	
line_counter0: simple_counter
		generic map(NBIT => nbit(HEIGHT))
		port map(
			clk =>pixel_in_hsync,
			resetn => resetn, 
			sraz =>pixel_in_vsync ,
			en => NOTpixel_in_vsync , 
			load => '0',
			E => (others => '0'), 
			Q => nb_line
			);

--block_out(0,0) <= block3x3(0,0) when pixel_counterq > 2 and nb_line > 1 else
--						 (others => '0');
--block_out(0,1) <= block3x3(0,1) when pixel_counterq > 1 and nb_line > 1 else
--						(others => '0');
--block_out(0,2) <= block3x3(0,2) when nb_line > 1 else 
--						(others => '0');
--						
--block_out(1,0) <= block3x3(1,0) when pixel_counterq > 2 and nb_line > 0 else
--						 (others => '0');
--block_out(1,1) <= block3x3(1,1) when pixel_counterq > 1 and nb_line > 0 else
--						(others => '0');
--block_out(1,2) <= block3x3(1,2) when nb_line > 0 else 
--						(others => '0');
--
--block_out(2,0) <= block3x3(2,0) when pixel_counterq > 2 else
--						 (others => '0');
--block_out(2,1) <= block3x3(2,1) when pixel_counterq > 1  else
--						(others => '0');
--
--block_out(2,2) <= block3x3(2,2) ;



block_out(0,0) <= block3x3(0,0);
block_out(0,1) <= block3x3(0,1) ;
block_out(0,2) <= block3x3(0,2)  ;
block_out(1,0) <= block3x3(1,0) ;
block_out(1,1) <= block3x3(1,1);
block_out(1,2) <= block3x3(1,2) ;
block_out(2,0) <= block3x3(2,0) ;
block_out(2,1) <= block3x3(2,1) ;
block_out(2,2) <= block3x3(2,2) ;

end Behavioral;

