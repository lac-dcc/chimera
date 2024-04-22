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

entity block3X3 is
		generic(WIDTH: natural := 640;
		  HEIGHT: natural := 480);
		port(
			clk : in std_logic; 
			resetn : in std_logic; 
			pixel_in_clk, pixel_in_hsync, pixel_in_vsync : in std_logic; 
			pixel_in_data : in std_logic_vector(7 downto 0 ); 
			new_block : out std_logic ;
			block_out : out matNM(0 to 2, 0 to 2));
end block3X3;


architecture RTL of block3X3 is

type std_mat3 is array (0 to 2, 0 to 2) of std_logic_vector(8 downto 0);
type std_vec3 is array (0 to 2) of std_logic_vector(8 downto 0);




signal block3x3 : matNM(0 to 2, 0 to 2) ;

signal std_block3x3	: std_mat3 ;					



signal LINE0_INPUT, LINE0_OUTPUT, LINE1_INPUT, LINE1_OUTPUT, lpixel_data : std_logic_vector(8 downto 0) := "000000000";

signal LINE_BUFFER : std_logic_vector(15 downto 0) ;
signal LINE_BUFFER_ADDR : std_logic_vector((nbit(WIDTH) - 1) downto 0) ;

signal INPUT_LINES, OUTPUT_LINES : std_logic_vector(15 downto 0) ;
signal final_res : signed(31 downto 0);
signal enable_line0_latches, enable_line1_latches, enable_lines_latches : std_logic ;

signal nb_line : std_logic_vector((nbit(HEIGHT) - 1) downto 0) := (others => '0');
signal pixel_counterq, pixel_counterq_delayed : std_logic_vector((nbit(WIDTH) - 1) downto 0) := (others => '0');

signal old_pixel_in_clk, pixel_in_clk_rising_edge, new_blockq : std_logic ;

begin



lines0: dpram_NxN
	generic map(SIZE => WIDTH + 1 , NBIT => 16, ADDR_WIDTH => nbit(WIDTH))
	port map(
 		clk => clk, 
 		we => new_blockq ,
		dpo => OUTPUT_LINES,
		dpra => pixel_counterq,
 		di => INPUT_LINES,
 		a => pixel_counterq_delayed
	); 
	
	
LINE0_OUTPUT(8) <= '0' ;
LINE0_OUTPUT(7 downto 0) <= OUTPUT_LINES(15 downto 8);
LINE1_OUTPUT(8) <= '0' ;
LINE1_OUTPUT(7 downto 0) <= OUTPUT_LINES(7 downto 0);

LINE0_INPUT(8) <= '0' ;
LINE0_INPUT(7 downto 0) <= std_block3x3(1,2)(7 downto 0);
LINE1_INPUT(8) <= '0' ;
LINE1_INPUT(7 downto 0) <= std_block3x3(2,2)(7 downto 0);

INPUT_LINES(15 downto 8) <= LINE0_INPUT(7 downto 0) ;
INPUT_LINES(7 downto 0) <=  LINE1_INPUT(7 downto 0) ; 
 
lpixel_data <= ( '0' & pixel_in_data) ;

enable_lines_latches <= (NOT pixel_in_hsync and pixel_in_clk) ;

enable_line0_latches <= enable_lines_latches when nb_line > 0 else
								'0' ;
enable_line1_latches <= enable_lines_latches when nb_line > 1 else
								'0' ;

process(clk, resetn)
begin
	if resetn = '0' then
		old_pixel_in_clk <= '0' ;
	elsif clk'event and clk = '1' then
		old_pixel_in_clk <= pixel_in_clk ;
		if pixel_in_hsync = '1' then
			new_blockq <= '0' ;
		else
			new_blockq <= pixel_in_clk_rising_edge ;
		end if ;		
	end if ;
end process ;
pixel_in_clk_rising_edge <= ((NOT old_pixel_in_clk) AND pixel_in_clk) ;
--new_blockq <= pixel_in_clk_rising_edge when pixel_in_hsync = '0' else -- would rise too early
--				 '0' ;
new_block <= new_blockq ;


convert_cols_std : for C in 0 to 2 generate
	convert_rows_std : for L in 0 to 2 generate
		block3x3(L,C) <= signed(std_block3x3(L,C))  ;
	end generate convert_rows_std; 
end generate convert_cols_std; 


gen_latches_row : for I in 0 to 2 generate
	gen_latches_col : for J in 0 to 2 generate
		
		left_cols : if j < 2 generate
			latch_i_i: edge_triggered_latch
						  generic map(NBIT => 9)
						  port map(
							clk => clk ,
							resetn => resetn ,
							sraz => pixel_in_vsync ,
							en => enable_lines_latches,
							d => std_block3x3(I,J+1), 
							q => std_block3x3(I,J)
						  );
		end generate left_cols;
		right_col_0 : if i = 0 and j = 2 generate
			latch_0_2: edge_triggered_latch
						  generic map(NBIT => 9)
						  port map(
							clk => clk ,
							resetn => resetn ,
							sraz => pixel_in_vsync ,
							en => enable_lines_latches,
							d => LINE0_OUTPUT, 
							q => std_block3x3(0,2)
						  );
		end generate right_col_0;
		
		right_col_1 : if i = 1 and j = 2 generate
			latch_1_2: edge_triggered_latch
						  generic map(NBIT => 9)
						  port map(
							clk => clk ,
							resetn => resetn ,
							sraz => pixel_in_vsync ,
							en => enable_lines_latches,
							d => LINE1_OUTPUT, 
							q => std_block3x3(1,2)
						  );
		end generate right_col_1;
		
		right_col_2 : if i = 2 and j = 2 generate
			latch_i_i: edge_triggered_latch
						  generic map(NBIT => 9)
						  port map(
							clk => clk ,
							resetn =>resetn ,
							sraz => pixel_in_vsync,
							en => enable_lines_latches,
							d => lpixel_data, 
							q => std_block3x3(2,2)
						  );
		end generate right_col_2;
	end generate gen_latches_col; 
end generate gen_latches_row; 


pixel_counter0: pixel_counter
		generic map(MAX => WIDTH)
		port map(
			clk => clk,
			resetn => resetn, 
			pixel_in_clk => pixel_in_clk, pixel_in_hsync => pixel_in_hsync,
			pixel_count => pixel_counterq
			);
			
delay_counter: edge_triggered_latch
		generic map(NBIT => nbit(WIDTH))
		port map(
			clk => clk ,
			resetn =>resetn ,
			sraz => pixel_in_hsync,
			en => enable_lines_latches,
			d => pixel_counterq, 
			q => pixel_counterq_delayed
			);
			
line_counter0: line_counter
		generic map(MAX => HEIGHT)
		port map(
			clk => clk,
			resetn => resetn, 
			pixel_in_hsync => pixel_in_hsync, pixel_in_vsync => pixel_in_vsync, 
			line_count => nb_line
			);
			
	
	

block_out(0,0) <= block3x3(0,0) when pixel_counterq > 2 and nb_line > 1 else
						 (others => '0');
block_out(0,1) <= block3x3(0,1) when pixel_counterq > 1 and nb_line > 1 else
						(others => '0');
block_out(0,2) <= block3x3(0,2) when nb_line > 1 else 
						(others => '0');
						
block_out(1,0) <= block3x3(1,0) when pixel_counterq > 2 and nb_line > 0 else
						 (others => '0');
block_out(1,1) <= block3x3(1,1) when pixel_counterq > 1 and nb_line > 0 else
						(others => '0');
block_out(1,2) <= block3x3(1,2) when nb_line > 0 else 
						(others => '0');

block_out(2,0) <= block3x3(2,0) when pixel_counterq > 2 else
						 (others => '0');
block_out(2,1) <= block3x3(2,1) when pixel_counterq > 1  else
						(others => '0');

block_out(2,2) <= block3x3(2,2) ;

end RTL;
