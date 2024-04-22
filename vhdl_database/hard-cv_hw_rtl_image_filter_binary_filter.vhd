----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:38:24 04/30/2013 
-- Design Name: 
-- Module Name:    binary_filter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.image_pack.all ;
use work.filter_pack.all ;

entity binary_filter is
generic(N : positive := 3);
port(
	blocks_in : in binary_block_array;
	coeffs_in : in binary_block_array;
	pixel_out : out std_logic_vector(7 downto 0)
	);
end binary_filter;

architecture Behavioral of binary_filter is
type s8_array is array(0 to 255) of signed(8 downto 0) ;
signal thresholds_vector : s8_array;
signal sum_vector : s8_array;
begin
sum_vector(0) <= thresholds_vector(0) ;
generate_sum : for level in 0 to 255 generate
	generate_col : for i in 0 to (N-1) generate
			generate_row : for j in 0 to (N-1) generate
				thresholds_vector(level) <= to_signed(1, 9) when blocks_in(level)(i, j) = '1' and coeffs_in(level)(i, j) = '1' else
										to_signed(1, 9) when blocks_in(level)(i, j) = '0' and coeffs_in(level)(i, j) = '0' else
										to_signed(-1, 9) when blocks_in(level)(i, j) /= coeffs_in(level)(i, j);
		end generate ;
	end generate ;	
	
	gen_0 : if level /= 0 generate
		sum_vector(level) <= sum_vector(level-1) + thresholds_vector(level);
	end generate ;
	
end generate ;
pixel_out <= std_logic_vector(sum_vector(255)(8 downto 1));
end Behavioral;

