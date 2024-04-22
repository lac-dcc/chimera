-----------------------------------------------------------------------------
--	Filename:	gh_complex_scaling_mult_2cm.vhd
--
--	Description:
--		   Will Scale a complex number with a scale factor
--		   uses two clock multipliers
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	-------   	-----------
--	1.0      	08/16/07  	SA Dodd 	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;

ENTITY gh_complex_scaling_mult_2cm IS
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

ARCHITECTURE a OF gh_complex_scaling_mult_2cm IS

	signal iiI     :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iiQ     :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iscale  :  STD_LOGIC_VECTOR(ssize DOWNTO 0);
	signal mI      :  STD_LOGIC_VECTOR(size+ssize DOWNTO 0);
	signal mQ      :  STD_LOGIC_VECTOR(size+ssize DOWNTO 0);

BEGIN
	
	I <= mI(size+ssize-1 downto ssize);
	Q <= mQ(size+ssize-1 downto ssize);
	
	iscale(ssize) <= '0';
	
PROCESS (clk)
BEGIN			
	if (rising_edge (clk)) then	
		iscale(ssize-1 downto 0) <= scale;
		iiI <= iI;
		iiQ <= iQ;
		mI <= iiI * iscale;
		mQ <= iiQ * iscale;
	end if;
END PROCESS;


END a;

