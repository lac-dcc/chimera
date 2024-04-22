----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:45:24 01/22/2016 
-- Design Name: 
-- Module Name:    bin2gray4 - Behavioral 
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

entity bin2gray4 is
	port(
		bin  : in std_logic_vector(3 downto 0);
		gray : out std_logic_vector(3 downto 0)
	);
end bin2gray4;

architecture Behavioral of bin2gray4 is

begin

	process(bin)
	begin
		gray(3) <= bin(3);
		gray(2) <= bin(3) xor bin(2);
		gray(1) <= bin(2) xor bin(1);
		gray(0) <= bin(1) xor bin(0);
	end process;

end Behavioral;
