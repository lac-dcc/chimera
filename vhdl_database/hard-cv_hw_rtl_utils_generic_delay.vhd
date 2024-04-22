----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    09:30:41 10/03/2012 
-- Design Name: 
-- Module Name:    generic_delay - Behavioral 
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


library work ;
use work.utils_pack.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity generic_delay is
	generic( WIDTH : positive := 1; DELAY : positive := 1);
	port(
		clk, resetn : std_logic ;
		input	:	in std_logic_vector((WIDTH - 1) downto 0);
		output	:	out std_logic_vector((WIDTH - 1) downto 0)
);		
end generic_delay;

architecture Behavioral of generic_delay is
	type delay_array is array (0 to(DELAY -1)) of std_logic_vector((WIDTH - 1) downto 0) ;
	signal delay_line : delay_array ;
begin

process(clk, resetn)
begin
	if resetn = '0' then
		delay_line <= (others => (others => '0'));
	elsif clk'event and clk = '1' then
		delay_line(0) <= input ;
		delay_line(1 to delay_line'high) <= delay_line(0 to delay_line'high-1);
		output <= delay_line(delay_line'high);
	end if ;
end process ;

end Behavioral;

