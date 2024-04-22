----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    17:31:14 10/04/2012 
-- Design Name: 
-- Module Name:    HAMMING_DIST - Behavioral 
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

entity HAMMING_DIST4 is
		port(
			clk : in std_logic; 
			resetn : in std_logic; 
			en : in std_logic ;
			vec1, vec2 :  in std_logic_vector(3 downto 0);
			distance : out std_logic_vector(3 downto 0));
end HAMMING_DIST4;

architecture Behavioral of HAMMING_DIST4 is
signal comp : std_logic_vector(3 downto 0) ;



begin
 
 comp <= vec1 XOR vec2 ;
 
 with comp select
		distance <= X"0" when "0000",
						X"1" when "0001",
						X"1" when "0010",
						X"2" when "0011",
						X"1" when "0100",
						X"2" when "0101",
						X"2" when "0110",
						X"3" when "0111",
						X"1" when "1000",
						X"2" when "1001",
						X"2" when "1010",
						X"3" when "1011",
						X"2" when "1100",
						X"3" when "1101",
						X"3" when "1110",
						X"4" when others;

end Behavioral;

