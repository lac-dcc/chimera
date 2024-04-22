----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:34:01 03/09/2012 
-- Design Name: 
-- Module Name:    x_shifter - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity x_shifter is
port(
			clk, input, EN : in std_logic;
			output : out std_logic
		);

end x_shifter;

architecture Behavioral of x_shifter is

signal shifter : std_logic_vector(9 downto 0) := (others => '0');

begin

process(clk)
begin
   if clk'event and clk='1' then  
      if EN = '1' then 
         shifter <= shifter(8 downto 0) & input;
      end if; 
   end if;
end process;
output <= shifter(9);


end Behavioral;
