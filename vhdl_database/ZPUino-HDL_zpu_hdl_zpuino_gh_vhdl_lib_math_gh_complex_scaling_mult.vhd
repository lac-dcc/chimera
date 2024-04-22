-----------------------------------------------------------------------------
--	Filename:	gh_complex_scaling_mult.vhd
--
--	Description:
--		   Will Scale a complex number with a scale factor
--		   uses single clock multipliers
--
--	Copyright (c) 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	-------   	-----------
--	1.0      	09/30/06  	SA Dodd 	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;

ENTITY gh_complex_scaling_mult IS
	GENERIC (size: INTEGER := 16; ssize: INTEGER := 16);
	PORT(	
		clk      : IN  STD_LOGIC; 
		scale    : IN  STD_LOGIC_VECTOR(ssize-1 DOWNTO 0); -- unsigned value
		iI       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		iQ       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		I        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END entity;

ARCHITECTURE a OF gh_complex_scaling_mult IS

	signal iscale  :  STD_LOGIC_VECTOR(ssize DOWNTO 0);
	signal mI      :  STD_LOGIC_VECTOR(size+ssize DOWNTO 0);
	signal mQ      :  STD_LOGIC_VECTOR(size+ssize DOWNTO 0);

BEGIN
	
	I <= mI(size+ssize-1 downto ssize);
	Q <= mQ(size+ssize-1 downto ssize);
	
	iscale(ssize) <= '0'; 
	iscale(ssize-1 downto 0) <= scale;
	
PROCESS (clk)
BEGIN			
	if (rising_edge (clk)) then		
		mI <= iI * iscale;
		mQ <= iQ * iscale;
	end if;
END PROCESS;


END a;

