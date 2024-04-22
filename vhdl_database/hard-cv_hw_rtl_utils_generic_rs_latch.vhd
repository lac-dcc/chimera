----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    17:17:17 06/18/2012 
-- Design Name: 
-- Module Name:    generic_rs_latch - Behavioral 
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

entity generic_rs_latch is
	port(clk, resetn : in std_logic ;
		  s, r : in std_logic ;
		  q : out std_logic );
end generic_rs_latch;

architecture Behavioral of generic_rs_latch is
signal Qp : std_logic ;
begin

process(clk, resetn)
begin
	if resetn = '0' then
		Qp <= '0' ;
	elsif clk'event and clk = '1' then
		if s = '1' then
			Qp <= '1' ;
		elsif r = '1' then
			Qp <= '0' ;
		end if ;
	end if ;
end process ;


q <= Qp ;
end Behavioral;

