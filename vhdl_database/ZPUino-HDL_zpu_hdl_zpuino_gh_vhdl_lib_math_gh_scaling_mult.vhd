-----------------------------------------------------------------------------
--	Filename:	gh_scaling_mult.vhd
--
--	Description:
--		   Will Scale a signed number with a scale factor
--		   uses single clock multipliers
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	-------   	-----------
--	1.0      	06/06/07  	SA Dodd 	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;

ENTITY gh_scaling_mult IS
	GENERIC (size: INTEGER := 16; ssize: INTEGER := 16);
	PORT(	
		clk      : IN  STD_LOGIC; 
		scale    : IN  STD_LOGIC_VECTOR(ssize-1 DOWNTO 0); -- unsigned value
		I        : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q        : OUT STD_LOGIC_VECTOR(size+ssize-1 DOWNTO 0)
		);
END entity;

ARCHITECTURE a OF gh_scaling_mult IS

	signal iscale  :  STD_LOGIC_VECTOR(ssize DOWNTO 0);
	signal iI      :  STD_LOGIC_VECTOR(size+ssize DOWNTO 0);

BEGIN
	
	Q <= iI(size+ssize-1 downto 0);
	
	iscale(ssize) <= '0'; 
	iscale(ssize-1 downto 0) <= scale;
	
PROCESS (clk)
BEGIN			
	if (rising_edge (clk)) then		
		iI <= I * iscale;
	end if;
END PROCESS;


END a;

