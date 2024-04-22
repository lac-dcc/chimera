----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:39:05 12/16/2013 
-- Design Name: 
-- Module Name:    cumulative_histogram - Behavioral 
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

library work ;
use work.utils_pack.all ;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cumulative_histogram is
generic(image_height : positive := 240);
port(
	clk : in std_logic; 
	resetn : in std_logic; 
	pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
	pixel_in_data : in std_logic_vector(7 downto 0 ); 
	reset_chist : in std_logic ;
	chist_available : out std_logic ;
	chist_pixel_val : in std_logic_vector(7 downto 0);
	chist_val_amount : out std_logic_vector(31 downto 0)

);
end cumulative_histogram;

architecture Behavioral of cumulative_histogram is



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


component line_counter is
		generic(POL : std_logic := '1'; MAX : positive := 480);
		port(
			clk : in std_logic; 
			resetn : in std_logic; 
			hsync,pixel_in_vsync : in std_logic; 
			line_count : out std_logic_vector((nbit(MAX) - 1) downto 0 )
			);
end component;


signal delayed_pixel_val : std_logic_vector(7 downto 0);
signal line_counter_output : std_logic_vector(nbit(image_height)-1 downto 0);
signal hist_write_addr, hist_read_addr, cumulative_counter, cumulative_counter_delayed, reset_ram_counter : std_logic_vector(7 downto 0);
signal hist_val_m1, chist_val_in, updated_hist_val, hist_val_in, hist_val_out_dpo, hist_val_out : std_logic_vector(31 downto 0);
signal write_hist, delayed_pixel_in_clk, chist_available_d : std_logic ;
signal acc : std_logic_vector(31 downto 0) ;
begin


line_counter0:  line_counter
		generic map(POL => '1', MAX => image_height)
		port map(
			clk => clk,
			resetn => resetn,
			hsync =>pixel_in_hsync,pixel_in_vsync =>pixel_in_vsync, 
			line_count => line_counter_output
			);


-- handle ram inputs when computing histogram
process(clk, resetn)
begin
	if resetn = '0' then
		delayed_pixel_val <= (others => '0') ;
		updated_hist_val <= (others => '0') ;
		delayed_pixel_in_clk <= '0' ;
	elsif clk'event and clk= '1' then
		delayed_pixel_val <= pixel_in_data ;
		updated_hist_val <= hist_val_out_dpo + 1 ;
		if pixel_in_hsync = '0' then
			delayed_pixel_in_clk <= pixel_in_clk ;
		else
			delayed_pixel_in_clk <= '0' ;
		end if ;
	end if ;
end process ;

-- handle ram input when computing cumulative histogram
process(clk, resetn)
begin
	if resetn = '0' then
		cumulative_counter <= (others => '0') ;
		cumulative_counter_delayed <= (others => '0') ;
		acc <= (others => '0') ;
	elsif clk'event and clk= '1' then
		if line_counter_output = image_height and pixel_in_hsync = '1' and cumulative_counter < 255 then
			cumulative_counter <= cumulative_counter + 1 ;
		elsif pixel_in_hsync = '0' then
			cumulative_counter <= (others => '0') ;
		end if ;
		cumulative_counter_delayed <= cumulative_counter ;
		
		if cumulative_counter > 0 then
			acc <= hist_val_out_dpo + acc ;
		else
			acc <= (others => '0');
		end if ;
	end if ;
end process ; 
chist_val_in <= acc + hist_val_out_dpo ;

-- handle ram input when reseting ram
process(clk, resetn)
begin
	if resetn = '0' then
		reset_ram_counter <= (others => '0') ;
	elsif clk'event and clk= '1' then
		if reset_chist = '1' then
			reset_ram_counter <= X"01" ;
		elsif reset_ram_counter < 255  and reset_ram_counter > 0 then
			reset_ram_counter <= reset_ram_counter + 1 ;
		else
			reset_ram_counter <= (others => '0');
		end if ;
	end if ;
end process ;

-- handle chist available flag
process(clk, resetn)
begin
	if resetn = '0' then
		chist_available_d <= '0' ;
	elsif clk'event and clk ='1' then
		if cumulative_counter_delayed = 255 then
			chist_available_d <= '1' ;
		elsif pixel_in_hsync = '0' or reset_chist = '1' then
			chist_available_d <= '0' ;
		end if ;
	end if ;
end process ;
chist_available <= chist_available_d ;

hist_val_in <= (others => '0') when reset_chist = '1' or reset_ram_counter > 0 else
					updated_hist_val when pixel_in_hsync = '0' else
					chist_val_in when cumulative_counter > 0 else
					(others => '0')
					;
write_hist <=  '1' when reset_chist = '1' or reset_ram_counter > 0 else
				  delayed_pixel_in_clk when pixel_in_hsync = '0' else	
				  '1' when cumulative_counter > 1 and chist_available_d = '0' else
				  '0';

hist_write_addr <= reset_ram_counter when reset_chist = '1' or reset_ram_counter > 0 else
						 delayed_pixel_val when pixel_in_hsync= '0' else
						 cumulative_counter_delayed when cumulative_counter > 0 else
						 (others => '0') ;
						 
chist_val_amount <= 	hist_val_out_dpo when chist_available_d = '1' else
							(others => '0') ;

hist_read_addr <=  pixel_in_data when pixel_in_hsync= '0' else
						 cumulative_counter when chist_available_d = '0' else
						 chist_pixel_val when chist_available_d = '1' else
						 (others => '0') ;

hist_ram : dpram_NxN
	generic map(SIZE => 256 , NBIT => 32, ADDR_WIDTH => 8)
	port map(
 		clk => clk,
 		we => write_hist, 
 		di => hist_val_in ,
		a	=> hist_write_addr,
 		dpra => hist_read_addr,
		spo => hist_val_out,
		dpo => hist_val_out_dpo 	
	);
	



end Behavioral;

