-----------------------------------------------------------------------------
--	Filename:	gh_compare_BMM.vhd
--
--	Description:
--		checks if data vector is betten min and max values (uses unsigned math)
--
--	Copyright (c) 2005, 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	10/08/05  	G Huber 	Initial revision
--	1.1      	11/01/08  	hlefevre	Clarify the use of unsigned math 	
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY gh_compare_BMM IS
	GENERIC (size: INTEGER := 8);
	PORT(	
			min : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
			max : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0); 
			D   : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
			Y   : out STD_LOGIC
		);
END entity;

ARCHITECTURE a OF gh_compare_BMM IS

BEGIN

	Y <= '0' when (D < min) else
	     '0' when (D > max) else
	     '1';


END architecture;

