-----------------------------------------------------------------------------
--	Filename:	gh_latch.vhd
--
--	Description:
--		transparent latch
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	01/28/06  	H LeFevre	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gh_latch IS
	GENERIC (size: INTEGER := 8);
	PORT(	
		LE  : IN STD_LOGIC; 
		D   : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q   : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END entity;

ARCHITECTURE a OF gh_latch IS

	signal iQ : STD_LOGIC_VECTOR(size-1 DOWNTO 0);

BEGIN

	Q <= iQ;
	
	iQ <= D when (LE = '1') else
	      iQ;

END a;

