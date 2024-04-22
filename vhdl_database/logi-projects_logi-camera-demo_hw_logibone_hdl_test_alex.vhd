----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:24:41 11/19/2013 
-- Design Name: 
-- Module Name:    test_alex - Behavioral 
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

entity test_alex is

port(
	E0, E1, E2, E3 : in std_logic_vector(3 downto 0);
	select_in : in std_logic_vector(1 downto 0);
	Sb, Sa : out std_logic_vector(3 downto 0) 
);
end test_alex;

architecture Behavioral of test_alex is
begin

process(select_in, E0, E1, E2, E3)
begin
case select_in is	
	when "00" => Sb <= E0;
	when "01" => Sb <= E1;
	when "10" => Sb <= E2;
	when others => Sb <= E3;
end case ;	
end process ;

Sa <= E0 when select_in = "00" else
		E1 when select_in = "01" else
		E2 when select_in = "10" else
		E3  ;

end Behavioral;

