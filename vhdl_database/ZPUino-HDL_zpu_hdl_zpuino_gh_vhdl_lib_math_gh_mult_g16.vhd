-----------------------------------------------------------------------------
--	Filename:	gh_Mult_g16.vhd
--
--	Description:
--		   general purpose 16 bit multiplier
--
--	Copyright (c) 2005, 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	-------   	-----------
--	1.0      	09/03/05  	G Huber 	Initial revision
--	1.1      	02/18/06  	G Huber 	add gh_ to name
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;

ENTITY gh_Mult_g16 IS
	PORT(	
		clk      : IN  STD_LOGIC;
		DA       : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		DB       : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		Q        : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END entity;

ARCHITECTURE a OF gh_Mult_g16 IS

	signal iDA :  STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal iDB :  STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal iQ :  STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN


	Q <= iQ;

PROCESS (clk)
BEGIN
	if (rising_edge (clk)) then
		iDA <= DA;
		iDB <= DB;
		iQ <= iDA * iDB;
	end if;
END PROCESS;

END a;

