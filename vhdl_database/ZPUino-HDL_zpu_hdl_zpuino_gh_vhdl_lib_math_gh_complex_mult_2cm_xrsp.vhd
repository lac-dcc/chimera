-----------------------------------------------------------------------------
--	Filename:	gh_complex_mult_2cm_xrsp.vhd
--
--	Description:
--		   general purpose complex multiplier
--		   uses two clock multipliers, has extra register in sum path
--
--	Copyright (c) 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	05/31/08  	SA Dodd  	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;

ENTITY gh_complex_mult_2cm_xrsp IS
	GENERIC (size: INTEGER := 16);
	PORT(
		clk      : IN  STD_LOGIC;
		IA       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		IB       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		QA       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		QB       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		I        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END entity;

ARCHITECTURE a OF gh_complex_mult_2cm_xrsp IS

	signal iIA   :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iIB   :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iQA   :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iQB   :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal IAIB  :  STD_LOGIC_VECTOR(2*size-1 DOWNTO 0);
	signal QAQB  :  STD_LOGIC_VECTOR(2*size-1 DOWNTO 0);
	signal IAQB  :  STD_LOGIC_VECTOR(2*size-1 DOWNTO 0);
	signal QAIB  :  STD_LOGIC_VECTOR(2*size-1 DOWNTO 0);
	
	signal dIAIB :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal dQAQB :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal dIAQB :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal dQAIB :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);

BEGIN

PROCESS (clk)
BEGIN			
	if (rising_edge (clk)) then	
		iIA <= IA;
		iIB <= IB;
		iQA <= QA;
		iQB <= QB;
		IAIB <= iIA * iIB;
		QAQB <= iQA * iQB;
		IAQB <= iIA * iQB;
		QAIB <= iQA * iIB;
		dIAIB <= IAIB(2*size-2 downto size-1);
		dQAQB <= QAQB(2*size-2 downto size-1);
		dIAQB <= IAQB(2*size-2 downto size-1);
		dQAIB <= QAIB(2*size-2 downto size-1);
		I <= dIAIB - dQAQB;
		Q <= dIAQB + dQAIB;
	end if;
END PROCESS;


END a;

