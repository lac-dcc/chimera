-----------------------------------------------------------------------------
--	Filename:	gh_compare_BMM_s.vhd
--
--	Description:
--		checks if data vector is betten min and max values (uses signed math) 
--
--	Copyright (c) 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	11/01/08  	hlefevre 	Initial signed math revision	
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;

ENTITY gh_compare_BMM_s IS
	GENERIC (size: INTEGER := 8);
	PORT(	
			min : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
			max : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0); 
			D   : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
			Y   : out STD_LOGIC
		);
END entity;

ARCHITECTURE a OF gh_compare_BMM_s IS

BEGIN

	Y <= '0' when (D < min) else
	     '0' when (D > max) else
	     '1';


END architecture;

