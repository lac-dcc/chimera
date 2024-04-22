-----------------------------------------------------------------------------
--	Filename:	gh_DECODE_4to16.vhd
--
--	Description:
--		a 4 to 16 decoder	 
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	09/17/05  	G Huber  	Initial revision
--	1.1     	05/05/06  	G Huber  	fix typo
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gh_decode_4to16 IS
	PORT(	
		A   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- address
		G1  : IN  STD_LOGIC; -- enable positive
		G2n : IN  STD_LOGIC; -- enable negative
		G3n : IN  STD_LOGIC; -- enable negative
		Y   : out STD_LOGIC_VECTOR(15 downto 0)
		);
END gh_decode_4to16 ;

ARCHITECTURE a OF gh_decode_4to16 IS	  


BEGIN

	Y <= x"0000" when (G3n = '1') else
	     x"0000" when (G2n = '1') else
	     x"0000" when (G1 = '0') else
	     x"8000" when (A= x"f") else
	     x"4000" when (A= x"e") else
	     x"2000" when (A= x"d") else
	     x"1000" when (A= x"c") else
	     x"0800" when (A= x"b") else
	     x"0400" when (A= x"a") else
	     x"0200" when (A= x"9") else
	     x"0100" when (A= x"8") else
		 x"0080" when (A= x"7") else
	     x"0040" when (A= x"6") else
	     x"0020" when (A= x"5") else
	     x"0010" when (A= x"4") else
	     x"0008" when (A= x"3") else
	     x"0004" when (A= x"2") else
	     x"0002" when (A= x"1") else
	     x"0001";-- when (A= o"0")


END a;

