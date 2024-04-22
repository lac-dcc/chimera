----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    13:58:21 05/26/2012 
-- Design Name: 
-- Module Name:    lcd_controller - Behavioral 
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
use work.image_pack.all ;
use work.utils_pack.all ;
use work.conf_pack.all ;
use work.interface_pack.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lcd_controller is
port(
 		clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
 		pixel_r, pixel_g, pixel_b : in std_logic_vector(7 downto 0 );
		lcd_rs, lcd_cs, lcd_rd, lcd_wr	:	 out std_logic;
	   lcd_data	:	out std_logic_vector(15 downto 0) 
	); 
end lcd_controller;

architecture Behavioral of lcd_controller is

constant delay : positive :=  1 ;

type lcd_state	is (LCD_INIT, WAIT_DONE, WAIT_DELAY, SET_X, WAIT_DONE_X, SET_Y, WAIT_DONE_Y, WAIT_VSYNC, LCD_VSYNC, LCD_HSYNC, LCD_VIDEO) ;
signal state, next_state : lcd_state  ;

signal en_rom, en_counter, sraz_counter, en_delay, sraz_delay, sraz_pixel_count : std_logic ;
signal wr_lcd, set_addr_lcd, lcd_busy : std_logic ;
signal register_addr, lcd_addr:	std_logic_vector(7 downto 0);
signal count	:	std_logic_vector(31 downto 0);
signal lcd_data_s	:	std_logic_vector(15 downto 0);
signal register_data	:	std_logic_vector(23 downto 0);
signal pxclk_old, pxclk_rising:	std_logic ;
signal pixel_count	:	std_logic_vector(8 downto 0);

begin


cl_interface0: lcd_interface
port map(clk => clk, resetn => resetn ,
	  addr => lcd_addr,
	  data => lcd_data_s ,
	  wr_data => wr_lcd,
	  set_addr => set_addr_lcd,
	  busy	=> lcd_busy,
	  lcd_rs => lcd_rs, lcd_cs => lcd_cs, lcd_rd => lcd_rd, lcd_wr => lcd_wr ,
	  lcd_data	=> lcd_data);

register0: lcd_register_rom 
	port map(
	   clk => clk, en => '1',
 		data => register_data, 
 		addr => register_addr
	); 
	

register_counter :  simple_counter
 generic map(NBIT => 8)
 port map( clk => clk,
		  resetn => resetn,
		  sraz => '0',
		  en => en_counter,
		  load => '0', 
		  E => std_logic_vector(to_unsigned(0, 8)),
		  Q => register_addr
		  );	

delay_counter :  simple_counter
 generic map(NBIT => 32)
 port map( clk => clk,
		  resetn => resetn,
		  sraz => sraz_delay,
		  en => en_delay,
		  load => '0', 
		  E => std_logic_vector(to_unsigned(0, 32)),
		  Q => count
		  );
		  
line_counter0 :  simple_counter
 generic map(NBIT => 9)
 port map( clk => clk,
		  resetn => resetn,
		  sraz => sraz_pixel_count,
		  en => pxclk_rising,
		  load => '0', 
		  E => std_logic_vector(to_unsigned(0, 9)),
		  Q => pixel_count
		  );	

process(clk, resetn)
begin
if resetn = '0' then
	pxclk_old <= '0' ;
	pxclk_rising <= '0' ;
elsif clk'event and clk = '1' then
	if pxclk_old /= pixel_in_clk and pixel_in_clk = '1' andpixel_in_hsync = '0' and pixel_count < 320 then
		pxclk_rising <= '1' ;
	else
		pxclk_rising <= '0' ;
	end if ;
	pxclk_old <= pixel_in_clk ;
end if ;
end process ;


process(clk, resetn)
begin
if resetn = '0' then
	state <= LCD_INIT ;
elsif clk'event and clk = '1' then
	state <= next_state ;
end if ;
end process ;


process(state,pixel_in_vsync, lcd_busy, register_data, count)
begin
next_state <= state ;
case state is
	WHEN LCD_INIT => 
			next_state <= WAIT_DONE ;	
	WHEN WAIT_DONE =>
		if lcd_busy = '0' then
			next_state <= WAIT_DELAY ;
		end if ;
	WHEN WAIT_DELAY => 
		if register_data = X"FFFFFF" then
			next_state <= WAIT_VSYNC ;
		elsif register_data(23 downto 16) = X"FF" and count(31 downto 16) = delay then -- only longer delay
			next_state <= LCD_INIT ;
		elsif register_data(23 downto 16) /= X"FF" and count = delay then
			next_state <= LCD_INIT ;
		end if;
	WHEN WAIT_VSYNC => 
		ifpixel_in_vsync = '1' then
			next_state <= LCD_VSYNC ;
		end if ;
	WHEN SET_X => 
		next_state <= WAIT_DONE_X ;
	WHEN WAIT_DONE_X => 
		if lcd_busy = '0' andpixel_in_vsync = '1' then
			next_state <= SET_Y ;
		elsif lcd_busy = '0' then
			next_state <= LCD_HSYNC ;
		end if ;
	WHEN SET_Y => 
		next_state <= WAIT_DONE_Y ;
	WHEN WAIT_DONE_Y => 
		if lcd_busy = '0' then
			next_state <= LCD_VSYNC ;
		end if ;
	WHEN LCD_VSYNC => 
		ifpixel_in_vsync = '0' then
			next_state <= LCD_VIDEO ;
		end if ;
	WHEN LCD_HSYNC => 
		ifpixel_in_hsync = '0' then
			next_state <= LCD_VIDEO ;
		end if ;
	WHEN LCD_VIDEO =>
		ifpixel_in_vsync = '1' then
			next_state <= SET_X ;
--		elsifpixel_in_hsync = '1' then
--			next_state <= SET_X ;
		end if ;
	WHEN others => 
		next_state <= LCD_INIT ;
end case ;
end process ;


-- control of register counter

with state select
	en_counter <= '1' when LCD_INIT,
					  '0' when others ;

-- control of delay counter
with state select 
	en_delay <= '1' when WAIT_DELAY,
					'0' when others ;
with state select 
	sraz_delay <= '1' when LCD_INIT,
					  '0' when others ;



-- control of LCD interface
with state select
	lcd_data_s <= pixel_r(7 downto 3) & pixel_g(7 downto 2) & pixel_b(7 downto 3) when LCD_VIDEO,
					X"0000" when SET_X,
					X"0000" when SET_Y,
					register_data(15 downto 0) when others ;
					
with state select
	lcd_addr <= X"22" when LCD_VSYNC,
					X"22" when LCD_HSYNC,
					X"21" when SET_X,
					X"20" when SET_Y,
					register_data(23 downto 16) when others ;		

wr_lcd <=  '1' when state = LCD_INIT and register_data(23 downto 16) /= X"FF" else
			  '1' when state = SET_X else
			  '1' when state = SET_Y else
			  pxclk_rising when state = LCD_VIDEO else
			  '0' ;	
			  
set_addr_lcd <= '1' when state = LCD_INIT and register_data(23 downto 16) /= X"FF" else
					 '1' when state = SET_X else
					 '1' when state = SET_Y else
					 (NOTpixel_in_vsync) when state = LCD_VSYNC else
					 (NOTpixel_in_hsync) when state = LCD_HSYNC else
					  '0' ;	

sraz_pixel_count <=pixel_in_hsync ;

end Behavioral;

