----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:47:55 01/22/2016 
-- Design Name: 
-- Module Name:    gray2bin4 - Behavioral 
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

entity gray2bin4 is
	port(
		gray : in std_logic_vector(3 downto 0);
		bin : out std_logic_vector(3 downto 0)
	);
end gray2bin4;

architecture Behavioral of gray2bin4 is

	signal bin_out : std_logic_vector(3 downto 0);

begin

	bin <= bin_out;

	process(gray, bin_out)
	begin
		bin_out(3) <= gray(3);
		bin_out(2) <= gray(2) xor bin_out(3);
		bin_out(1) <= gray(1) xor bin_out(2);
		bin_out(0) <= gray(0) xor bin_out(1);
	end process;

end Behavioral;
