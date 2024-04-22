----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 27.11.2014 15:51:19
-- Design Name: 
-- Module Name: ARRAY_REVERSE_ORDER - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ARRAY_REVERSE_ORDER is
	Generic(
		NUMBER_OF_BITS : Natural := 32
	);
	Port(
		DATA_IN  : in  std_logic_vector(NUMBER_OF_BITS - 1 downto 0);
		DATA_OUT : out std_logic_vector(NUMBER_OF_BITS - 1 downto 0)
	);
end ARRAY_REVERSE_ORDER;

architecture Behavioral of ARRAY_REVERSE_ORDER is
begin
	lanes : for i in 0 to NUMBER_OF_BITS - 1 generate
	begin
		DATA_OUT(i) <= DATA_IN(NUMBER_OF_BITS - 1 - i);
	end generate lanes;

end Behavioral;
