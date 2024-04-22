----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/04/2017 08:25:10 PM
-- Design Name: 
-- Module Name: counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use ieee.std_logic_unsigned.all;

entity counter is

generic(n: natural :=2);
port(clk :	in std_logic;
	rst:	in std_logic;
	counter_out :	out std_logic_vector(n-1 downto 0)
);
end counter;


architecture Behavioral of counter is		 	  
	
    signal count_reg: std_logic_vector(n-1 downto 0):= (others => '0');

begin

    process(clk, rst,count_reg)
    begin
	if rst = '1' then
 	    count_reg <= (others => '0');
	elsif (clk'event and clk = '1') then 
		count_reg <= count_reg + 1;
	end if;
    end process;	
	
    counter_out <= count_reg;

end Behavioral;
