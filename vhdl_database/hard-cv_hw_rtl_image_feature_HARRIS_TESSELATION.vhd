----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    11:17:32 10/22/2012 
-- Design Name: 
-- Module Name:    HARRIS_TESSELATION - Behavioral 
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



library work ;
use work.utils_pack.all ;
use work.image_pack.all ;
use work.primitive_pack.all ;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HARRIS_TESSELATION is
	generic(WIDTH : positive := 640 ;
			HEIGHT : positive := 480; 
			TILE_NBX : positive := 8 ; 
			TILE_NBY : positive := 6 ; 
			IGNORE_STRIPES : positive := 5;
			DESCRIPTOR_SIZE :  positive :=  128);
	port (
			clk : in std_logic; 
			resetn : in std_logic; 
			pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
			feature_desc_in : in std_logic_vector(DESCRIPTOR_SIZE-1 downto 0);
			harris_score_in : in std_logic_vector(15 downto 0 ); 
			feature_coordx	:	out std_logic_vector(7 downto 0 ) ;
			feature_coordy	:	out std_logic_vector(7 downto 0 ) ;
			feature_desc_out : out std_logic_vector((DESCRIPTOR_SIZE -1) downto 0) ;
			harris_score_out	: 	out std_logic_vector(15 downto 0 );
			end_of_block	:	out std_logic 
	);
end HARRIS_TESSELATION;

architecture Behavioral of HARRIS_TESSELATION is

	signal pixel_count : std_logic_vector((nbit(WIDTH) - 1) downto 0);
	signal line_count : std_logic_vector((nbit(HEIGHT) - 1) downto 0);
	signal block_xaddress, block_xaddress_old : std_logic_vector((nbit(TILE_NBX) - 1) downto 0);
	signal block_xpos, high_score_xpos : std_logic_vector((nbit(WIDTH/TILE_NBX) - 1) downto 0);
	signal block_yaddress, block_yaddress_old : std_logic_vector((nbit(TILE_NBY) - 1) downto 0);
	signal block_ypos, high_score_ypos : std_logic_vector((nbit(HEIGHT/TILE_NBY) - 1) downto 0);
	
	
	signal ram_addr : std_logic_vector((nbit(TILE_NBX) - 1) downto 0);
	signal highest_score : std_logic_vector(15 downto 0);
	signal top_left_cornerx	:	std_logic_vector((nbit(WIDTH) - 1) downto 0);
	signal top_left_cornery : std_logic_vector((nbit(HEIGHT) - 1) downto 0);
	signal ram_in, ram_out : std_logic_vector((32+ DESCRIPTOR_SIZE)-1 downto 0);
	signal new_high_score : std_logic ;
	signal pixel_in_hsync_old,pixel_in_hsync_fe,pixel_in_hsync_re : std_logic ;
begin


-- detecting rising edge on block change and line change
process(clk, resetn)
begin
	if resetn ='0' then
		hsync_old <= '0' ;
		block_xaddress_old <= (others => '0') ;
		pixel_in_clk_old <= '0' ;
	elsif clk'event and clk = '1' then
		hsync_old <=pixel_in_hsync ;
		block_xaddress_old <= block_xaddress ;
		pixel_in_clk_old <= pixel_in_clk ;
	end if ;
end process ;
hsync_fe <=pixel_in_hsync_old and (notpixel_in_hsync) ;
hsync_re <= (NOT pixel_in_hsync_old) and pixel_in_hsync ;

pixel_in_clk_re <= (not pixel_in_clk_old) and pixel_in_clk ;
			 

ram_in((32+DESCRIPTOR_SIZE) - 1 downto 32) <=  		feature_desc_in ;
ram_in(31 downto 16) <= harris_score_in ;	 
ram_in(15 downto 8) <= std_logic_vector(RESIZE(unsigned(block_ypos), 8)) ;	 
ram_in(7 downto 0) <= std_logic_vector(RESIZE(unsigned(block_xpos), 8)) ;			 

highest_score <= ram_out(31 downto 16) ;
high_score_xpos <= std_logic_vector(RESIZE(unsigned(ram_out(7 downto 0)), nbit(WIDTH/TILE_NBX)));
high_score_ypos <= std_logic_vector(RESIZE(unsigned(ram_out(15 downto 8)), nbit(HEIGHT/TILE_NBY)));


-- score is out is highest score or new high score
harris_score_out <= harris_score_in when unsigned(harris_score_in) > unsigned(highest_score) else	
						  highest_score ;
-- feature coord x, is high score pos in block + block coord 						  
feature_coordx <= std_logic_vector(RESIZE(unsigned(high_score_xpos), 8)) ;
feature_coordy <= std_logic_vector(RESIZE(unsigned(high_score_ypos), 8)) ;


-- new high score is latched if we enter new block or if current socre is higher than igher score
new_high_score <= '1' when block_xaddress_old /= block_xaddress and block_ypos = 0	 else
						'0' when ((unsigned(pixel_count) < IGNORE_STRIPES) OR (unsigned(line_count) < IGNORE_STRIPES)) else
						'1' when unsigned(harris_score_in) > unsigned(highest_score) else				
						'0' ;


-- contains current line of blocks maxima
score_ram : dpram_NxN
	generic map(SIZE => TILE_NBX , NBIT => 32+DESCRIPTOR_SIZE , ADDR_WIDTH => nbit(TILE_NBX))
	port map(
 		clk => clk,  
 		we => new_high_score,
 		di => ram_in,
		a	=> ram_addr, 
 		dpra => (others => '0'),
		spo => ram_out,
		dpo => open 		
	); 
ram_addr <=  block_xaddress when block_xaddress < TILE_NBX else
				  (others => '0') ;

end_of_block <= '1' when block_xpos = (WIDTH/TILE_NBX - 1) and block_ypos = (HEIGHT/TILE_NBY - 1) else
					 '0' ;


-- generates block y address with line counter%block_size
pixel_counter0 : pixel_counter
		generic map(MAX => WIDTH)
		port map(
			clk => clk,
			resetn => resetn,
			pixel_in_clk => pixel_in_clk,pixel_in_hsync =>pixel_in_hsync,
			pixel_count => pixel_count
			);
	
		process(clk, resetn)
		begin
			if resetn = '0' then
				block_xaddress <= (others => '0') ;
				block_xpos <= (others => '0') ;
				top_left_cornerx <= (others => '0') ;
			elsif clk'event and clk = '1' then
				if pixel_in_hsync = '1' then
					block_xaddress <= (others => '0') ;
					top_left_cornerx <= (others => '0') ;
					block_xpos <= (others => '0') ;
				elsif pixel_in_clk_re = '1'  then
						if block_xpos = (WIDTH/TILE_NBX - 1) then
							block_xaddress <= block_xaddress  + 1  ;
							top_left_cornerx <= pixel_count ;
							block_xpos <= (others => '0');
						else
							block_xpos <= block_xpos + 1 ;
						end if;
				end if ;
			end if ;
		end process ;

-- generates block y address with line counter%block_size	
	line_counter0: line_counter 
		generic map(MAX => HEIGHT)
		port map(
			clk => clk, 
			resetn => resetn, 
			hsync =>pixel_in_hsync,pixel_in_vsync =>pixel_in_vsync,
			line_count => line_count );
	
	
		process(clk, resetn)
		begin
			if resetn = '0' then
				block_yaddress <= (others => '0') ;
				block_ypos <= (others => '0') ;
				top_left_cornery <= (others => '0') ;
			elsif clk'event and clk = '1' then
				if pixel_in_vsync = '1' then
					block_yaddress <= (others => '0') ;
					top_left_cornery <= (others => '0') ;
					block_ypos <= (others => '0') ;
				elsif pixel_in_hsync_re = '1' then
					if  block_ypos = (HEIGHT/TILE_NBY - 1) then
						block_yaddress <= block_yaddress  + 1  ;
						top_left_cornery <= line_count ;
						block_ypos <= (others => '0');
					else
						block_ypos <= block_ypos + 1;
					end if ;
				end if ;
			end if ;
		end process ;	
		
		

end Behavioral;

