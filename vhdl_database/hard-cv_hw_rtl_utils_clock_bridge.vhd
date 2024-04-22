----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    18:13:35 01/23/2013 
-- Design Name: 
-- Module Name:    clock_bridge - Behavioral 
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

entity clock_bridge is
	generic(SIZE : positive := 1);
	port(
			clk_fast, clk_slow, resetn : in std_logic ;
			clk_slow_out : out std_logic ;
			data_in : in std_logic_vector(SIZE-1 downto 0);
			data_out : out std_logic_vector(SIZE-1 downto 0)
			);
end clock_bridge;

architecture Behavioral of clock_bridge is
	signal data_bridge : std_logic_vector(SIZE-1 downto 0);
begin

process(clk_slow, resetn)
begin
	if resetn = '0' then
		data_bridge <= (others => '0') ;
	elsif clk_slow'event and clk_slow = '1' then
		data_bridge <= data_in ;
	end if ;
end process ;


process(clk_fast, resetn)
begin
	if resetn = '0' then
		data_out <= (others => '0') ;
		clk_slow_out <= '0' ;
	elsif clk_fast'event and clk_fast = '1' then
		data_out <= data_bridge ;
		clk_slow_out <= clk_slow ;
	end if ;
end process ;




end Behavioral;

