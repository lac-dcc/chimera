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

entity matNxM_latch is
	generic (N : natural := 3 ; M : natural := 3);
    Port ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
           sraz : in  STD_LOGIC;
           en : in  STD_LOGIC;
           d : in  matNM(0 to N-1, 0 to  M-1);
           q : out matNM(0 to N-1, 0 to  M-1));
end matNxM_latch;

architecture Behavioral of matNxM_latch is

type std_matN is array (0 to (N- 1), 0 to (M- 1)) of std_logic_vector(8 downto 0);
signal std_block3x3	: std_matN ;	

begin

convert_cols_std : for C in 0 to (M -1) generate
	convert_rows_std : for L in 0 to (M -1) generate
		q(L,C) <= signed(std_block3x3(L,C))  ;
	end generate convert_rows_std; 
end generate convert_cols_std; 

gen_latches_row : for I in 0 to (N - 1) generate
	gen_latches_col : for J in 0 to (M - 1) generate
			latch_i_i: generic_latch
						  generic map(NBIT => 9)
						  port map(
							clk => clk ,
							resetn => resetn ,
							sraz => sraz ,
							en => en,
							d => std_logic_vector(d(I,J)), 
							q => std_block3x3(I,J)
						  );
	end generate gen_latches_col; 
end generate gen_latches_row; 

end Behavioral;

