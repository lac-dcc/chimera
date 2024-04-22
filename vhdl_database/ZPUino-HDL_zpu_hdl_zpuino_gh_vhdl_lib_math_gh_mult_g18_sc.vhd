-----------------------------------------------------------------------------
--	Filename:	gh_Mult_g18_sc.vhd
--
--	Description:
--		   general purpose 18 bit multiplier with single clock delsy
--
--	Copyright (c) 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	-------   	-----------
--	1.0      	09/16/06  	G Huber 	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;

ENTITY gh_Mult_g18_sc IS
	PORT(	
		clk      : IN  STD_LOGIC;
		DA       : IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
		DB       : IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
		Q        : OUT STD_LOGIC_VECTOR(35 DOWNTO 0)
		);
END entity;

ARCHITECTURE a OF gh_Mult_g18_sc IS

BEGIN

PROCESS (clk)
BEGIN
	if (rising_edge (clk)) then
		Q <= (DA * DB);
	end if;
END PROCESS;

END a;

