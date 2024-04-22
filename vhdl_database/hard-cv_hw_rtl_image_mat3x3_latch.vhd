----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    15:00:44 09/06/2012 
-- Design Name: 
-- Module Name:    mat3x3_latch - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;


library WORK ;
use WORK.image_pack.ALL ;
use WORK.utils_pack.ALL ;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mat3x3_latch is
    Port ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
           sraz : in  STD_LOGIC;
           en : in  STD_LOGIC;
           d : in  mat3;
           q : out mat3);
end mat3x3_latch;

architecture Behavioral of mat3x3_latch is

type std_row3 is array (0 to 2) of std_logic_vector(8 downto 0);
type std_mat3 is array (0 to 2) of std_row3;
signal std_block3x3	: std_mat3 ;	

begin

convert_cols_std : for C in 0 to 2 generate
	convert_rows_std : for L in 0 to 2 generate
		q(L)(C) <= signed(std_block3x3(L)(C))  ;
	end generate convert_rows_std; 
end generate convert_cols_std; 

gen_latches_row : for I in 0 to 2 generate
	gen_latches_col : for J in 0 to 2 generate
			latch_i_i: generic_latch
						  generic map(NBIT => 9)
						  port map(
							clk => clk ,
							resetn => resetn ,
							sraz => sraz ,
							en => en,
							d => std_logic_vector(d(I)(J)), 
							q => std_block3x3(I)(J)
						  );
	end generate gen_latches_col; 
end generate gen_latches_row; 

end Behavioral;

