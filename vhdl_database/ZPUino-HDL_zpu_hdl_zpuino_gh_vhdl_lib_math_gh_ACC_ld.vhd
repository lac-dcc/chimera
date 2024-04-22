-----------------------------------------------------------------------------
--	Filename:	gh_Acc_ld.vhd
--
--	Description:
--		an accumulator - 
--		   adds the input data (D) to the output (Q) value	with a LOAD
--
--	Copyright (c) 2005, 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	----------	--------	-----------
--	1.0      	09/10/05  	G Huber 	Initial revision
--	2.0     	09/17/05  	h lefevre	name change to avoid conflict
--	        	          	         	  with other libraryslibraries
--	2.1      	05/21/06  	S A Dodd 	fix typo's
--	2.2      	06/24/06  	G Huber 	fix typo's
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY gh_ACC_ld IS
	GENERIC (size: INTEGER := 16);
	PORT(	
		CLK      : IN  STD_LOGIC;
		rst      : IN  STD_LOGIC := '0';
		LOAD     : IN  STD_LOGIC := '0'; 
		CE       : IN  STD_LOGIC := '1';
		D        : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END gh_ACC_ld ;

ARCHITECTURE a OF gh_ACC_ld IS

	signal iQ :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);

BEGIN

	Q <= iQ;

PROCESS (CLK,rst)
BEGIN
	if (rst = '1') then
		iQ <= (others =>'0');
	elsif (rising_edge(CLK)) then
		if (LOAD = '1') then
			iQ <= D; -- load data
		elsif (CE = '1') then
			iQ <= iQ + D;
		else
			iQ <= iQ;
		end if;
	end if;
END PROCESS;

END a;

