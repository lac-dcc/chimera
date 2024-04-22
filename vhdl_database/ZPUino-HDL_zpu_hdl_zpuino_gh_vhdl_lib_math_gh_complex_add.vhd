-----------------------------------------------------------------------------
--	Filename:	gh_complex_add.vhd
--
--	Description:
--		   a Complex adder - Note: does not include overflow protection
--
--	Copyright (c) 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	09/23/06  	SA Dodd 	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;

ENTITY gh_complex_add IS
	GENERIC (size: INTEGER := 16);
	PORT(
		clk  : IN  STD_LOGIC;
		rst  : IN  STD_LOGIC;
		IA   : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		QA   : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		IB   : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		QB   : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		I    : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q    : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END entity;

ARCHITECTURE a OF gh_complex_add IS

BEGIN

PROCESS (clk,rst)
BEGIN			
	if (rst = '1') then
		I <= (others => '0');
		Q <= (others => '0');
	elsif (rising_edge (clk)) then	
		I <= (IA + IB);
		Q <= (QA + QB);
 	end if;
END PROCESS;
	
END a;

