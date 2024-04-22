-----------------------------------------------------------------------------
--	Filename:	gh_compare.vhd
--
--	Description:
--		a standard, basic Comparator
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	10/08/05  	G Huber 	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gh_compare IS
	GENERIC (size: INTEGER := 8);
	PORT(	
		A     : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		B     : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0); 
		AGB   : out STD_LOGIC;
		AEB   : out STD_LOGIC;
		ALB   : out STD_LOGIC
		);
END gh_compare;

ARCHITECTURE a OF gh_compare IS

BEGIN

	AGB <= '1' when (A > B) else
	       '0';

	AEB <= '1' when (A = B) else
	       '0';
		   
	ALB <= '1' when (A < B) else
	       '0';
		
END a;

