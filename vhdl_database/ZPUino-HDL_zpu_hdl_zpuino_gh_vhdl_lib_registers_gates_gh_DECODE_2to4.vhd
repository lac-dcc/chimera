-----------------------------------------------------------------------------
--	Filename:	gh_DECODE_2to4.vhd
--
--	Description:
--		a 2 to 4 decoder	 
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	10/29/05  	G Huber  	Initial revision
--	1.1     	05/05/06  	G Huber  	fix typo
--	
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gh_decode_2to4 IS
	PORT(	
		A   : IN  STD_LOGIC_VECTOR(1 DOWNTO 0); -- address
		G1  : IN  STD_LOGIC; -- enable positive
		G2n : IN  STD_LOGIC; -- enable negative
		G3n : IN  STD_LOGIC; -- enable negative
		Y   : out STD_LOGIC_VECTOR(3 downto 0)
		);
END gh_decode_2to4 ;

ARCHITECTURE a OF gh_decode_2to4 IS	  


BEGIN

	Y <= x"0" when (G3n = '1') else
	     x"0" when (G2n = '1') else
	     x"0" when (G1 = '0') else
	     x"8" when (A= "11") else
	     x"4" when (A= "10") else
	     x"2" when (A= "01") else
	     x"1";-- when (A= "00")


END a;

