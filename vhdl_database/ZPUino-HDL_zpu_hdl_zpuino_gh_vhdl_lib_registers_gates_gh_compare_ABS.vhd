-----------------------------------------------------------------------------
--	Filename:	gh_compare_ABS.vhd
--
--	Description:
--		does an absolute value compare	 
--
--	Copyright (c) 2005, 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	09/10/05  	S A Dodd 	Initial revision
--	2.0     	09/17/05  	h lefevre	name change to avoid conflict
--	        	          	         	  with other libraries
--	2.1      	05/21/06  	S A Dodd 	fix typo's
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY gh_compare_ABS IS
	GENERIC (size: INTEGER := 16);
	PORT(	
		A      : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		B      : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		AGB    : OUT STD_LOGIC;
		AEB    : OUT STD_LOGIC;
		ALB    : OUT STD_LOGIC;
		AS     : OUT STD_LOGIC; -- A sign bit
		BS     : OUT STD_LOGIC; -- B sign bit
		ABS_A  : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		ABS_B  : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END gh_compare_ABS ;

ARCHITECTURE a OF gh_compare_ABS IS

	signal iA  :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iB  :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	
	
BEGIN


	AS <= A(size-1);
	BS <= B(size-1);
	ABS_A <= iA;
	ABS_B <= iB;
	
	iA <= A when (A(size-1) = '0') else
	      x"0" - A;

	iB <= B when (B(size-1) = '0') else
	      x"0" - B;		  

	AGB <= '1' when (iA > iB) else
	       '0';

	ALB <= '1' when (iA < iB) else
	       '0';
		  
	AEB <= '1' when (iA = iB) else
	       '0';
		   
END a;

