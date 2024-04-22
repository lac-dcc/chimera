-----------------------------------------------------------------------------
--	Filename:	gh_mult_gus.vhd
--
--	Description:
--		   An unsigned multiplier
--		   has single clock delay
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	-------   	-----------
--	1.0      	06/08/07  	SA Dodd 	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY gh_mult_gus IS
	GENERIC (asize: INTEGER := 16; bsize: INTEGER := 16);
	PORT(	
		clk  : IN  STD_LOGIC; 
		A    : IN  STD_LOGIC_VECTOR(asize-1 DOWNTO 0);
		B    : IN  STD_LOGIC_VECTOR(bsize-1 DOWNTO 0);
		Q    : OUT STD_LOGIC_VECTOR(asize+bsize-1 DOWNTO 0)
		);
END entity;

ARCHITECTURE a OF gh_mult_gus IS

BEGIN
	
PROCESS (clk)
BEGIN			
	if (rising_edge (clk)) then		
		Q <= A * B;
	end if;
END PROCESS;


END a;

