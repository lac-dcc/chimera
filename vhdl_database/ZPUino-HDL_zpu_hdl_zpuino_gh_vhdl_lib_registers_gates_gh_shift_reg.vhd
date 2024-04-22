-----------------------------------------------------------------------------
--	Filename:	gh_shift_reg.vhd
--
--	Description:
--		a shift register with async reset
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	09/03/05  	G Huber  	Initial revision
--	2.0     	09/17/05  	h lefevre	name change to avoid conflict
--	        	          	         	  with other libraries 
--	2.1     	05/05/06  	G Huber  	fix typo
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY gh_shift_reg IS
	GENERIC (size: INTEGER := 16); 
	PORT(
		clk      : IN STD_logic;
		rst      : IN STD_logic;
		D        : IN STD_LOGIC;
		Q        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END gh_shift_reg ;

ARCHITECTURE a OF gh_shift_reg IS

	signal iQ :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	
BEGIN
 
	Q <= iQ;

process(clk,rst)
begin
	if (rst = '1') then 
		iQ <= (others => '0');
	elsif (rising_edge(clk)) then 
		iQ(0) <= D;
		iQ(size-1 downto 1) <= iQ(size-2 downto 0);
	end if;
end process;


END a;

