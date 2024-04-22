-----------------------------------------------------------------------------
--	Filename:	gh_counter_modulo.vhd
--
--	Description:
--		an up counter with an arbitrary step size.
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author   	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	09/03/05  	S A Dodd	Initial revision
--	2.0     	09/17/05  	h lefevre	name change to avoid conflict
--	        	          	         	  with other libraries
--	2.1      	05/21/06  	S A Dodd 	fix typo's
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

ENTITY gh_counter_modulo IS
	GENERIC (size : INTEGER :=7;
	         modulo :INTEGER :=100 );
	PORT
	(
		CLK   : IN	STD_LOGIC;
		rst   : IN	STD_LOGIC; -- active high reset
		CE    : IN	STD_LOGIC; -- clock enable
		N     : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0); -- counter step size 
		Q     : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		TC    : OUT STD_LOGIC
	);
END gh_counter_modulo;

ARCHITECTURE a OF gh_counter_modulo IS
	signal iQ   : STD_LOGIC_VECTOR (size+1 DOWNTO 0);
	signal iNQ  : STD_LOGIC_VECTOR (size+1 DOWNTO 0);
	signal NQ   : STD_LOGIC_VECTOR (size+1 DOWNTO 0);
	signal iTC  : STD_LOGIC;
	
BEGIN

	Q <= iQ(size-1 DOWNTO 0);

------------------------------------------------------------

	iTC <= '0' when (CE = '0') else
	       '0' when (iNQ < modulo) else
	       '1';
	      
	iNQ <= (iQ + ('0' & N));
		
	NQ <= iNQ when (iNQ < modulo) else
	      (iNQ - modulo);
	
	
PROCESS (CLK,rst)
BEGIN			 
	if (rst = '1') then
		iQ <= (others => '0');
		TC <= '0';
	elsif (rising_edge(CLK)) then
		TC <= iTC;
		if (CE = '1') then
			iQ <= NQ;
		end if;			
	end if;
END PROCESS;

END a;
