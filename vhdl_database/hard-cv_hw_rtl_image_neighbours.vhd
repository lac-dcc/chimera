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

entity neighbours is
		generic(WIDTH : natural := 640; HEIGHT : natural := 480);
		port(
			clk : in std_logic; 
			resetn, sraz : in std_logic; 
			pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
			pixel_in_data : in std_logic_vector(7 downto 0 );
			neighbours : out pix_neighbours);
end neighbours;

architecture Behavioral of neighbours is

signal sraz_read_pixel_index, en_read_pixel_index, sraz_write_pixel_index : std_logic ;
signal line_count : std_logic_vector(nbit(HEIGHT)-1 downto 0);
signal pixel_counter_dec, pixel_counter : std_logic_vector(nbit(WIDTH)-1 downto 0);
signal neighbours_buffer : pix_neighbours ;
signal pixel_in_hsync_re,pixel_in_hsync_old : std_logic ;
signal pixel_in_clk_re, pixel_in_clk_old : std_logic ;
signal output_neighbour : std_logic_vector(7 downto 0);
begin


lines0: dpram_NxN
	generic map(SIZE => WIDTH , NBIT => 8, ADDR_WIDTH => nbit(WIDTH))
	port map(
 		clk => clk, 
 		we => pixel_in_clk_re ,
		dpo => output_neighbour,
		dpra => pixel_counter_dec,
 		di => pixel_in_data,
 		a => pixel_counter
	); 


-- read address is +1 compared to current pixel
-- 	
read_pixel_index0 : simple_counter 
	 generic map(NBIT => nbit(WIDTH))
    port map( clk => clk,
           resetn => resetn,
           sraz => sraz_read_pixel_index ,
           en => en_read_pixel_index,
			  load =>pixel_in_vsync,
			  E => std_logic_vector(to_unsigned(2, nbit(WIDTH))) ,
           Q => pixel_counter_dec
			  );

sraz_read_pixel_index <= '1' when pixel_counter_dec = (WIDTH-1) and pixel_in_clk_re = '1' else
							    '0' ;	
en_read_pixel_index <= pixel_in_clk_re when pixel_in_hsync = '0' else
							  '0' ;
	
write_pixel_index0 : simple_counter 
	 generic map(NBIT => nbit(WIDTH))
    port map( clk => clk,
           resetn => resetn,
           sraz => sraz_write_pixel_index ,
           en => pixel_in_clk_re,
			  load => '0',
			  E => (others => '0'),
           Q => pixel_counter
			  );

sraz_write_pixel_index <= pixel_in_clk_re when pixel_counter = (WIDTH-1) else
								  '1' when pixel_in_hsync =  '1' else -- should coincide ...
							     '0' ;
	
line_counter : simple_counter 
	 generic map(NBIT => nbit(HEIGHT))
    port map( clk => clk,
           resetn => resetn,
           sraz =>pixel_in_vsync ,
           en =>pixel_in_hsync_re,
			  load => '0',
			  E => (others => '0'),
           Q => line_count
			  );
	
process(clk, resetn)
begin
if resetn = '0' then 
	pixel_in_hsync_old <= '0' ;
	pixel_in_clk_old <= '0' ;
elsif clk'event and clk = '1' then
	pixel_in_hsync_old <=pixel_in_hsync ;
	pixel_in_clk_old <= pixel_in_clk ;
end if ;
end process ;		
pixel_in_hsync_re <= (NOT pixel_in_hsync_old) AND pixel_in_hsync ;
pixel_in_clk_re <= (NOT pixel_in_clk_old) and pixel_in_clk ;
		
process(clk, resetn)
begin
if resetn = '0' then 
	neighbours_buffer(0) <= (others => '0') ;
	neighbours_buffer(1) <= (others => '0') ;
	neighbours_buffer(2) <= (others => '0') ;
	neighbours_buffer(3) <= (others => '0') ;
elsif clk'event and clk = '1' then
	if pixel_in_clk_re = '1' then
		neighbours_buffer(0) <= neighbours_buffer(1);
		neighbours_buffer(1) <= neighbours_buffer(2);
		neighbours_buffer(2) <= output_neighbour;
		neighbours_buffer(3) <= pixel_in_data;
	end if ;
end if ;
end process;			


neighbours(0) <= (others => '0') when pixel_counter = 0 else
					  (others => '0') when line_count = 0 else
					  neighbours_buffer(0) ;
					  
neighbours(1) <= (others => '0')  when pixel_counter = (WIDTH-1) else
					  (others => '0')  when line_count = 0 else
					  neighbours_buffer(1) ;

neighbours(2) <= (others => '0')  when pixel_counter = (WIDTH-1) else
					  (others => '0')  when line_count = 0 else
						neighbours_buffer(2) ;

neighbours(3) <= (others => '0') when pixel_counter = 0  else
					  neighbours_buffer(3) ;


end Behavioral;

