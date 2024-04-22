----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:25 04/30/2013 
-- Design Name: 
-- Module Name:    threshold_decomposition - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;
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

entity threshold_decomposition is
port(	block_in : in matNM(0 to 2, 0 to 2); 
		blocks_out : out binary_block_array
		);
end threshold_decomposition;

architecture Behavioral of threshold_decomposition is
begin
generate_com : for level in 0 to 255 generate
	generate_col : for i in 0 to 2 generate
			generate_row : for j in 0 to 2 generate
				blocks_out(level)(i, j) <= '1' when block_in(i, j) > level else
													'0' ;
		end generate ;
	end generate ;	
end generate ;
end Behavioral;

