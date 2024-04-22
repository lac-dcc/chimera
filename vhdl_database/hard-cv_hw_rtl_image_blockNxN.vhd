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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blockNxN is
		generic(WIDTH: natural := 640;
		  HEIGHT: natural := 480;
		  N: natural :=3);
		port(
			clk : in std_logic; 
			resetn : in std_logic; 
			pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
			pixel_in_data : in std_logic_vector(7 downto 0 ); 
			new_block : out std_logic ;
			block_out : out matNM(0 to N-1, 0 to N-1));
end blockNxN;

architecture RTL of blockNxN is

type std_matN is array (0 to (N- 1), 0 to (N- 1)) of std_logic_vector(8 downto 0);
type std_vecN is array (0 to (N- 1)) of std_logic_vector(8 downto 0);



signal blockNxN : matNM(0 to N-1, 0 to N-1) ;

signal std_blockNxN	: std_matN ;					
signal LINEI_INPUT, LINEI_OUTPUT : std_vecN ;
signal lpixel_data : std_logic_vector(8 downto 0);

signal INPUT_LINES, OUTPUT_LINES : std_logic_vector((((N - 1)*8) - 1) downto 0) ;
signal enable_lines_latches : std_logic ;

signal nb_line : std_logic_vector((nbit(HEIGHT) - 1) downto 0) := (others => '0');
signal pixel_counterq, pixel_counterq_delayed : std_logic_vector((nbit(WIDTH) - 1) downto 0) := (others => '0');

signal old_pixel_in_clk, pixel_in_clk_rising_edge : std_logic ;

begin



linesn: dpram_NxN
	generic map(SIZE => WIDTH + 1 , NBIT => (((N - 1)*8)), ADDR_WIDTH => nbit(WIDTH))
	port map(
 		clk => clk, 
 		we => enable_lines_latches ,
		dpo => OUTPUT_LINES,
		dpra => pixel_counterq,
 		di => INPUT_LINES,
 		a => pixel_counterq_delayed
	); 

gen_mem_output_0 : for I in 0 to (N - 2) generate
	LINEI_OUTPUT(I)(7 downto 0) <= OUTPUT_LINES(((I*8)+7) downto (I*8));
	LINEI_OUTPUT(I)(8)  <= '0' ;
end generate gen_mem_output_0;	

gen_mem_input_0 : for I in 0 to (N - 2) generate
	INPUT_LINES(((I*8)+7) downto (I*8)) <= std_blockNxN(I+1, N-1)(7 downto 0) ;
end generate gen_mem_input_0;	

 
lpixel_data <= ( '0' & pixel_in_data) ;

process(clk, resetn)
begin
	if resetn = '0' then
		old_pixel_in_clk <= '0' ;
	elsif clk'event and clk = '1' then
		old_pixel_in_clk <= pixel_in_clk ;
	end if ;
end process ;
pixel_in_clk_rising_edge <= ((NOT old_pixel_in_clk) AND pixel_in_clk) ;
enable_lines_latches <= (NOT pixel_in_hsync and pixel_in_clk_rising_edge) ;
new_block <= enable_lines_latches ;

convert_cols_std : for C in 0 to (N-1) generate
	convert_rows_std : for L in 0 to (N-1) generate
		blockNxN(L,C) <= signed(std_blockNxN(L,C))  ;
	end generate convert_rows_std; 
end generate convert_cols_std; 


gen_latches_row : for I in 0 to (N-1) generate
	gen_latches_col : for J in 0 to (N-1) generate
	
	-- shift columns in the block
	shift_cols : if J < N-1 generate
		process(clk, resetn) 
		begin
			if resetn = '0' then
				std_blockNxN(I, J) <= (others => '0');
			elsif rising_edge(clk) then
				if enable_lines_latches = '1' then
					std_blockNxN(I, J) <= std_blockNxN(I, J+1);
				end if ;
			end if ;
		end process ;
	end generate ;
	
	-- fetch data from memory for rightmost column
	in_col : if J = N-1 and I /= N-1 generate
		process(clk, resetn) 
		begin
			if resetn = '0' then
				std_blockNxN(I, J) <= (others => '0');
			elsif rising_edge(clk) then
				if enable_lines_latches = '1' then
					std_blockNxN(I, J) <= LINEI_OUTPUT(I);
				end if ;
			end if ;
		end process ;
	end generate ;
	
	end generate gen_latches_col; 
end generate gen_latches_row; 

--Latch incoming pixel
process(clk, resetn) 
begin
	if resetn = '0' then
		std_blockNxN(N-1, N-1) <= (others => '0');
	elsif rising_edge(clk) then
		if enable_lines_latches = '1' then
			std_blockNxN(N-1, N-1) <= lpixel_data;
		end if ;
	end if ;
end process ;

pixel_counter0: pixel_counter
		generic map(MAX => WIDTH)
		port map(
			clk => clk,
			resetn => resetn, 
			pixel_in_clk => pixel_in_clk,pixel_in_hsync =>pixel_in_hsync,
			pixel_count => pixel_counterq
			);
			
--Delay pixel count to generate write address to memory
process(clk, resetn) 
begin
	if resetn = '0' then
		pixel_counterq_delayed <= (others => '0');
	elsif rising_edge(clk) then
		if enable_lines_latches = '1' then
			pixel_counterq_delayed <= pixel_counterq;
		end if ;
	end if ;
end process ;			
			
-- used to generate 0 pixels in block for the N-1 first lines
line_counter0: line_counter
		generic map(MAX => HEIGHT)
		port map(
			clk => clk,
			resetn => resetn, 
			pixel_in_hsync =>pixel_in_hsync,
			pixel_in_vsync => pixel_in_vsync,
			line_count => nb_line
			);
	
-- This make sure that on the image edge, the uninitialized pixels of the block are filled with zero	
zero_cols_std : for C in 0 to (N-1) generate
	zero_rows_std : for L in 0 to (N-1) generate
		block_out(L,C) <= blockNxN(L,C) when pixel_counterq > ((N-1) - C) and nb_line > ((N-2) - L) else
						 (others => '0');
	end generate zero_rows_std; 
end generate zero_cols_std; 	

end RTL;
