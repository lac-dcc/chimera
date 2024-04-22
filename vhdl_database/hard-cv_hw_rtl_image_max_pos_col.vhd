----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    10:25:52 03/03/2012 
-- Design Name: 
-- Module Name:    sobel3x3 - Behavioral 
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

library work;
use work.image_pack.ALL;
use work.logi_utils_pack.ALL;
use work.logi_primitive_pack.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity max_pos_col is
generic(
		WIDTH : positive := 640;
		HEIGHT : positive := 480;
		VALUE_WIDTH : positive := 8;
		VALUE_SIGNED : boolean := true
		  );
port(

		clk : in std_logic; 
 		resetn : in std_logic;
		
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
		pixel_in_data	: in std_logic_vector(7 downto 0);
 		value_in : in std_logic_vector(VALUE_WIDTH-1 downto 0);
		
		mem_out : out std_logic_vector(15 downto 0);
		mem_write_addr : out std_logic_vector(15 downto 0);
		mem_write : out std_logic 
);
end max_pos_col;


architecture RTL of max_pos_col is

signal value_in_signed, score_read_signed : signed(VALUE_WIDTH downto 0);
signal pixel_in_clk_re, pixel_in_clk_old : std_logic ;

signal pixel_read_addr, pixel_write_addr, pixel_read_addr_temp, pixel_write_addr_temp : std_logic_vector(nbit(WIDTH)-1 downto 0);

signal write_score, write_score_temp : std_logic ;
signal new_score,score_write,score_read   : std_logic_vector(VALUE_WIDTH-1 downto 0);
signal new_score_signed : signed(VALUE_WIDTH downto 0);

signal line_pos, line_pos_delayed, new_score_pos, score_pos_read : std_logic_vector(nbit(HEIGHT)-1 downto 0);
signal pixel_in_hsync_old : std_logic ;

begin


mem_0: dpram_NxN
	generic map(SIZE => WIDTH+1 , NBIT => VALUE_WIDTH+nbit(HEIGHT), ADDR_WIDTH => nbit(WIDTH))
	port map(
 		clk => clk, 
 		we => write_score ,
		di(VALUE_WIDTH-1 downto 0) => new_score,
		di(VALUE_WIDTH+nbit(HEIGHT)-1 downto VALUE_WIDTH) => new_score_pos,
		a	=> pixel_write_addr,
 		dpra => pixel_read_addr,
		spo => open ,
		dpo(VALUE_WIDTH-1 downto 0) => score_read,
		dpo(VALUE_WIDTH+nbit(HEIGHT)-1 downto VALUE_WIDTH) => score_pos_read
	); 

gen_signed : if value_signed generate
	value_in_signed <= signed(value_in(value_in'high) & value_in) ;
	score_read_signed <= signed(score_read(score_read'high) & score_read) ;
end generate ;

gen_not_signed : if not value_signed generate
	value_in_signed <= signed('0' & value_in) ;
	score_read_signed <= signed('0' & score_read) ;
end generate ;


process(clk, resetn)
begin
	if resetn = '0' then
		pixel_in_clk_old <= '0' ;
	elsif clk'event and clk = '1' then
		pixel_in_clk_old <= pixel_in_clk ;
	end if ;
end process ;
pixel_in_clk_re <= (not pixel_in_clk_old) and pixel_in_clk ;


process(clk, resetn)
begin
	if resetn = '0' then
		pixel_read_addr_temp <= (others => '0') ;
		pixel_write_addr_temp <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if pixel_in_vsync = '1' and pixel_read_addr_temp < WIDTH-1 then
			pixel_read_addr_temp <= pixel_read_addr_temp  + 1 ;
		elsif pixel_in_hsync = '1' and pixel_in_vsync = '0' then
			pixel_read_addr_temp <= (others => '0') ;
		elsif pixel_in_clk_re = '1' and pixel_in_vsync = '0' then
			pixel_read_addr_temp <= pixel_read_addr_temp  + 1 ;
		end if ;
		pixel_write_addr_temp <= pixel_read_addr_temp ;
	end if ;
end process ;
pixel_read_addr <= pixel_read_addr_temp ;
pixel_write_addr <= pixel_write_addr_temp ;


process(clk, resetn)
begin
	if resetn = '0' then
		line_pos <= (others => '0');
		pixel_in_hsync_old <= '0' ;
		line_pos_delayed <= (others => '0');
	elsif clk'event and clk = '1' then
		if pixel_in_vsync = '1' then
			line_pos <= (others => '0');
		elsif pixel_in_hsync = '1' and pixel_in_hsync_old = '0' then
			line_pos <= line_pos + 1 ;
		end if ;
		line_pos_delayed <= line_pos ;
		pixel_in_hsync_old <= pixel_in_hsync ;
	end if ;
end process ;


mem_out(score_pos_read'high downto 0) <= score_pos_read ;
mem_out(mem_out'high downto score_pos_read'high+1) <= (others => '0');
mem_write_addr(pixel_write_addr'high downto 0) <= pixel_write_addr ;
mem_write_addr(15 downto pixel_write_addr'high+1) <= (others => '0');
mem_write <= '1' when pixel_in_vsync = '1' and  pixel_read_addr_temp < WIDTH else
				 '0' ;

process(clk, resetn)
begin
	if resetn = '0' then
		write_score_temp <= '0';
	elsif clk'event and clk = '1' then
		if pixel_in_hsync = '0' or pixel_in_vsync = '0' then
			write_score_temp <= pixel_in_clk_re ;
		else
			write_score_temp <= '0';
		end if ;
	end if ;
end process ;



new_score_signed <= value_in_signed when value_in_signed > score_read_signed else
						  score_read_signed ;

new_score <= std_logic_vector(new_score_signed(new_score'high downto 0)) when pixel_in_vsync = '0' else
				 (others => '0');
new_score_pos <=  line_pos_delayed when value_in_signed > score_read_signed and pixel_in_vsync = '0' else
						score_pos_read when pixel_in_vsync = '0' else
						(others => '0');				 
				 
write_score <= write_score_temp when pixel_in_vsync = '0' and pixel_in_hsync = '0' else
					'1' when pixel_in_vsync = '1' else
					'0' ;
end RTL;





