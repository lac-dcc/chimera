----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    13:45:14 09/26/2012 
-- Design Name: 
-- Module Name:    fx2_interface - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work;
use work.generic_components.ALL;


entity fx2_interface is
port(
	-- logic interface
	clk, resetn : in std_logic ;
	wr, rd, cs	: in std_logic ;
	dv, busy	: out std_logic ;
	data_in : in std_logic_vector(7 downto 0 ); 
	data_out : out std_logic_vector(7 downto 0 );
	
	-- fx2 interface
	fx2_clk	: in std_logic ;
	fx2_wr, fx2_rd, fx2_oe : out std_logic ;
	fx2_full, fx2_empty : in std_logic ;
	fx2_data	: inout	std_logic_vector(7 downto 0 );
	
	--debug signals
	latch_enable : out std_logic 
);

end fx2_interface;

architecture Behavioral of fx2_interface is

signal data_int : std_logic_vector(7 downto 0 ); 
signal wrt, rdt, cst	: std_logic ;
signal fx2_wrt, fx2_rdt, fx2_oet : std_logic ;
signal fx2_data_out, fx2_data_in, fx2_data_int : std_logic_vector(7 downto 0 ); 

signal int_latch_input, ext_latch_input, ext_latch_output : std_logic_vector(18 downto 0 ); 
signal en_input_latch : std_logic ;
signal fx2_clk_rising_edge, fx2_clk_falling_edge, fx2_clk_old : std_logic ;
signal wr_rising_edge, wr_falling_edge, wr_old : std_logic ;

signal dv_t : std_logic ;
begin


int_latch_input <= (wr_rising_edge & rd & cs & data_in & fx2_data_int ) ;

in_clk_latch: generic_latch 
	 generic map(NBIT => 19)
    port map ( clk => clk,
           resetn => resetn ,
           sraz => '0' ,
           en => (en_input_latch) ,
           d => int_latch_input ,
           q => ext_latch_input);
			  
wrt <= ext_latch_input(18) ;
rdt <= ext_latch_input(17) ;
cst <= ext_latch_input(16) ;
data_int <= ext_latch_input(15 downto 8) ;			  
fx2_data_in <=  ext_latch_input(7 downto 0) ;	  
	
ext_clk_data_latch: generic_latch 
	 generic map(NBIT => 19)
    port map ( clk => (NOT fx2_clk),
           resetn => resetn ,
           sraz => '0' ,
           en => '1' ,
           d => ext_latch_input ,
           q => ext_latch_output) ;
			  
fx2_wrt <= ext_latch_output(18) ;
fx2_rdt <= ext_latch_output(17) ;
fx2_oet <= ext_latch_output(16) ;
fx2_data_out <= ext_latch_output(15 downto 8) ;
fx2_data_int <= 	ext_latch_output(7 downto 0) ;		  
			  

fx2_wr <= (NOT fx2_wrt) when fx2_full = '1' else
			'1' ;
fx2_rd <= (NOT fx2_rdt) ;	
--fx2_oe <= (NOT fx2_oet) ;
fx2_oe <= '1' ;		  
			  
fx2_data <=  fx2_data_out when fx2_wrt = '1'  else
				 (others => 'Z') ;
				 
data_out <=  fx2_data_in when  fx2_rdt = '1' else
				 (others => 'Z') ;


process(clk, resetn)
begin
if resetn = '0' then
	fx2_clk_old <= '0' ;
elsif clk'event and clk = '1' then
	fx2_clk_old <= fx2_clk ;
end if ;
end process ;
fx2_clk_rising_edge <= fx2_clk and (NOT fx2_clk_old) ;
fx2_clk_falling_edge <= (NOT fx2_clk) and fx2_clk_old ;

process(clk, resetn)
begin
	if resetn = '0' then
		wr_old <= '0' ;
	elsif  clk'event and clk = '1' then
		wr_old <= wr ;
	end if ;
end process ;
wr_rising_edge <= wr and (not wr_old) ;
wr_falling_edge <= (NOT wr) and wr_old ;


process(clk, resetn)
begin
	if resetn = '0' then
		en_input_latch <= '1' ;
	elsif clk'event and clk = '1' then
		if wr_rising_edge = '1' then
			en_input_latch <= '0' ;
		elsif fx2_clk_rising_edge = '1' then
			en_input_latch <= '1' ;
		end if ;
	end if ;
end process ;


latch_enable <= en_input_latch ;
busy <= (NOT en_input_latch) ;

end Behavioral;

