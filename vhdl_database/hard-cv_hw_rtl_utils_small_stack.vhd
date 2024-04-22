----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    15:31:55 03/22/2013 
-- Design Name: 
-- Module Name:    smal_stack - Behavioral 
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

entity small_stack is
generic( WIDTH : positive := 8 ; DEPTH : positive := 8);
port(clk, resetn : in std_logic ;
	  push, pop : in std_logic ;
	  full, empty : out std_logic ;
	  data_in : in std_logic_vector( WIDTH-1 downto 0);
	  data_out : out std_logic_vector(WIDTH-1 downto 0)
	  );
end small_stack;

architecture Behavioral of small_stack is
 type stack_array is array(0 to DEPTH-1) of std_logic_vector(WIDTH-1 downto 0);
 signal stack : stack_array ;
 signal stack_ptr : integer range 0 to DEPTH-1 ; 
 signal full_t, empty_t : std_logic ;
begin

process(clk, resetn)
begin
	if resetn = '0' then
		stack_ptr <= (DEPTH - 1) ;
	elsif clk'event and clk = '1' then
		if push = '1' and full_t = '0' then
			stack_ptr <= (stack_ptr - 1) ;
			stack(stack_ptr) <= data_in ;
		elsif pop = '1' and empty_t = '0' then
			stack_ptr <= stack_ptr + 1 ;
		end if ;
	end if ;
end process ;
full_t <= '1' when stack_ptr = 0 else
			 '0' ;
empty_t <= '1' when stack_ptr = (DEPTH - 1) else
			 '0' ;
data_out <= stack(stack_ptr+1) when empty_t = '0' else
				(others => '0');

end Behavioral;

