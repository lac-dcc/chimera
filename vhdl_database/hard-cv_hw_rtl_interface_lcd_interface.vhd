----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    10:39:27 05/26/2012 
-- Design Name: 
-- Module Name:    lcd_interface - Behavioral 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lcd_interface is
port(clk, resetn	:	in std_logic ;
	  addr	:	in std_logic_vector(7 downto 0) ;
	  data	:	in std_logic_vector(15 downto 0);
	  wr_data	:	in std_logic ;
	  set_addr	:	in std_logic ;
	  busy	:	out std_logic ;
	  lcd_rs, lcd_cs, lcd_rd, lcd_wr	:	 out std_logic;
	  lcd_data	:	out std_logic_vector(15 downto 0) );
end lcd_interface;

architecture Behavioral of lcd_interface is
type lcd_state is (WAIT_DATA, WRITE_ADDR, WRITE_DATA);
constant rs_set	: positive := 1 ;
constant wr_lw_pw	: positive := 6 ;
constant wr_hw_pw	: positive := 6 ;
constant wr_period	: positive := rs_set + wr_lw_pw + wr_hw_pw ;
signal state, next_state	:	lcd_state ;
signal sraz_counter, en_counter : std_logic ;
signal count, addr_latched	:	std_logic_vector(7 downto 0);
signal data_latched	:	std_logic_vector(15 downto 0);
signal write_t, rs_t	:	std_logic ;
signal sraz_wr, latch_wr, wr_latched : std_logic ;
begin


addr_latch0: generic_latch
	 generic map(NBIT => 8)
    port map( clk => clk,
           resetn => resetn ,
           sraz => '0' ,
           en => set_addr ,
           d => addr,
           q => addr_latched );

data_latch0: generic_latch
	 generic map(NBIT => 16)
    port map( clk => clk,
           resetn => resetn ,
           sraz => '0' ,
           en => wr_data ,
           d => data,
           q => data_latched );
			  
wr_latch0: generic_latch
	 generic map(NBIT => 1)
    port map( clk => clk,
           resetn => resetn ,
           sraz => '0' ,
           en => latch_wr ,
           d(0) => wr_data,
           q(0) => wr_latched );




delay_counter :  simple_counter
 generic map(NBIT => 8)
 port map( clk => clk,
		  resetn => resetn,
		  sraz => sraz_counter,
		  en => en_counter,
		  load => '0', 
		  E => std_logic_vector(to_unsigned(0, 8)),
		  Q => count
		  );


process(clk,resetn)
begin
if resetn = '0' then
	state <= WAIT_DATA ;
elsif clk'event and clk = '1' then
	state <= next_state ;
end if ;
end process ;




process(state, count, set_addr, wr_data)
begin
next_state <= state ;
case state is
	when WAIT_DATA =>
		if set_addr = '1' then
			next_state <= WRITE_ADDR ;
		elsif wr_data = '1' then
			next_state <= WRITE_DATA ;
		end if ;
	when WRITE_ADDR =>
		if count > (wr_period - 1) and wr_latched = '1' then
			next_state <= WRITE_DATA ;
		elsif count > (wr_period - 1) then
			next_state <= WAIT_DATA ;
		end if ;
	when WRITE_DATA =>
		if count > (wr_period - 1) then
			next_state <= WAIT_DATA ;
		end if ;
	when others => 
		 next_state <= WAIT_DATA ;
end case ;
end process ;

with state select
	lcd_data <= (X"00" & addr_latched) when WRITE_ADDR ,
					data_latched when others ;
					
with state select
	lcd_rs <= '0' when WRITE_ADDR ,
				 '1' when others ;
				 
lcd_wr <= '0' when count > (rs_set - 1)  and count < (rs_set + wr_lw_pw) else
		  '1' ;

lcd_rd <= '1' ;

with state select
	lcd_cs <= '1' when WAIT_DATA,
				 '0' when others ;

with state select
	busy <= '1' when WRITE_DATA,
			  '1' when WRITE_ADDR,
			  '0' when others ;

with state select
	en_counter <= '1' when WRITE_DATA,
					  '1' when WRITE_ADDR,
					  '0' when others ;
					  
sraz_counter <= '1' when (count > (wr_period - 1) OR state = WAIT_DATA) else
					 '0' ;


with state select
	latch_wr <= '1' when WAIT_DATA,
					'0' when others ;

end Behavioral;

