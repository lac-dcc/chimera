----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:39:14 12/20/2013 
-- Design Name: 
-- Module Name:    adaptive_pixel_class - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

entity adaptive_pixel_class is
generic(image_width : positive := 320; image_height : positive := 240; nb_class : positive := 16);
port(
	clk : in std_logic; 
	resetn : in std_logic; 
	pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
	pixel_in_data : in std_logic_vector(7 downto 0 ); 
	pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
	pixel_out_data : out std_logic_vector(7 downto 0 ); 
	chist_addr : out std_logic_vector(7 downto 0);
	chist_data : in std_logic_vector(31 downto 0);
	chist_available : in std_logic ;
	chist_reset : out std_logic
);
end adaptive_pixel_class;

architecture Behavioral of adaptive_pixel_class is

component dpram_NxN is
	generic(SIZE : natural := 64 ; NBIT : natural := 8; ADDR_WIDTH : natural := 6);
	port(
 		clk : in std_logic; 
 		we : in std_logic; 
 		
 		di : in std_logic_vector(NBIT-1 downto 0 ); 
		a	:	in std_logic_vector((ADDR_WIDTH - 1) downto 0 );
 		dpra : in std_logic_vector((ADDR_WIDTH - 1) downto 0 );
		spo : out std_logic_vector(NBIT-1 downto 0 );
		dpo : out std_logic_vector(NBIT-1 downto 0 ) 		
	); 
end component;

constant pixel_per_class : integer := (image_width*image_height)/nb_class;
signal chist_addr_d, chist_addr_dd : std_logic_vector(7 downto 0);
signal nb_pixel_threshold : std_logic_vector(31 downto 0) ;
signal pixel_class : std_logic_vector(7 downto 0);

signal write_lut : std_logic ;
signal lut_write_addr : std_logic_vector(7 downto 0);
signal chist_available_d, chist_available_old, chist_available_re : std_logic ;
signal done, old_done, done_re : std_logic ;
begin

-- one cycle delay on control signals
process(clk, resetn)
begin
	if resetn = '0' then
		pixel_out_clk <= '0' ;
		pixel_out_hsync <= '1' ;
		pixel_out_vsync <= '1' ;
	elsif clk'event and clk = '1' then
		pixel_out_clk <= pixel_in_clk ;
		pixel_out_hsync <=pixel_in_hsync ;
		pixel_out_vsync <=pixel_in_vsync ;
	end if ;
end process ;


-- pixel lut for classification
pixel_lut : dpram_NxN
	generic map(SIZE => 256 , NBIT => 8, ADDR_WIDTH => 8)
	port map(
		clk => clk,
		we => write_lut, 
		di => pixel_class ,
		a	=> lut_write_addr,
		dpra => pixel_in_data,
		spo => open,
		dpo => pixel_out_data 	
	);
	
	
process(clk, resetn)
begin
	if resetn = '0' then
		chist_addr_d <= (others => '0');
		lut_write_addr <= (others => '0');
		nb_pixel_threshold <= (others => '0');
		chist_available_d <= '0' ;
	elsif clk'event and clk = '1' then
		if chist_available = '1' and chist_addr_d < 255 and done = '0' and chist_data < nb_pixel_threshold then
			chist_addr_d <= chist_addr_d + 1 ;
		elsif chist_available = '0' then
			-- reset chist
			chist_addr_d <= (others => '0');
		end if ;
	

		chist_available_d <= chist_available ;
		lut_write_addr <= chist_addr_d ; -- delaying write address of one clock cycle
		
		if chist_data >= nb_pixel_threshold and chist_available_d = '1' then 
			pixel_class <= pixel_class + 1 ;
			nb_pixel_threshold <= nb_pixel_threshold + std_logic_vector(to_unsigned(pixel_per_class,32));
		elsif chist_available_d = '0' then
			nb_pixel_threshold <= std_logic_vector(to_unsigned(pixel_per_class,32));
			pixel_class <= (others => '0');
		end if ;
	end if ;
end process ;	
	
process(clk, resetn)
begin
	if resetn = '0' then
		done <= '0' ;
		old_done <= '0' ;
	elsif clk'event and clk = '1' then
		if lut_write_addr = 255 and chist_data <= nb_pixel_threshold then
			done <= '1' ;
		elsif chist_available_re = '1' then
			done <= '0' ;
		end if ;
		old_done <= done ;
	end if ;
end process ;		
chist_available_re <= (not chist_available_d) and chist_available ;
done_re <= (not old_done) and done ;
	
chist_reset <= '1' when done_re = '1' else
					'0' ;
write_lut <= '1' when (chist_available_d = '1' or lut_write_addr > 0)  and done='0' else -- wont write first class
				 '0' ;
	
chist_addr <= chist_addr_d ;

end Behavioral;

