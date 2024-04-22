-----------------------------------------------------------------------------
--	Filename:	gh_MUX_2to1.vhd
--
--	Description:
--		a 2 to 1 mux 	 
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	09/17/05  	G Huber  	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gh_MUX_2to1 IS	
	GENERIC (size: INTEGER := 8);
	PORT(	
		sel : IN  STD_LOGIC; -- select control
		A   : IN  STD_LOGIC; 
		B   : IN  STD_LOGIC;
		Y   : out STD_LOGIC
		);
END gh_MUX_2to1;

ARCHITECTURE a OF gh_MUX_2to1 IS	  

BEGIN

	Y <= A when (sel = '0') else
	     B;

END a;

