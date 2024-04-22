-----------------------------------------------------------------------------
--	Filename:	gh_complex_mult_3m.vhd
--
--	Description:
--		   general purpose complex multiplier
--		   uses 3 (rather than 4) single clock multipliers
--		   (has one more clock delay that 4 multiplier version)
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	--------	--------	---------	-----------
--	1.0     	12/30/07	h lefevre	Initial revision
--	1.1      	05/20/08  	h lefevre	change bit with for QSUM to improve timing
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;

ENTITY gh_complex_mult_3m IS
	GENERIC (size: INTEGER := 16);
	PORT(
		clk      : IN  STD_LOGIC; 
		rst		 : IN  STD_LOGIC;
		IA       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		IB       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		QA       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		QB       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		I        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END entity;

ARCHITECTURE a OF gh_complex_mult_3m IS

	signal IAQA  :  STD_LOGIC_VECTOR(size DOWNTO 0);
	signal IBQB  :  STD_LOGIC_VECTOR(size DOWNTO 0);
	
	signal IAQB  :  STD_LOGIC_VECTOR(2*size-1 DOWNTO 0);
	signal QAIB  :  STD_LOGIC_VECTOR(2*size-1 DOWNTO 0);
	
	signal eSUM  :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal pSUM  :  STD_LOGIC_VECTOR(2*size+1 DOWNTO 0);
													   
	signal ISUM  :  STD_LOGIC_VECTOR(size DOWNTO 0);
	signal QSUM  :  STD_LOGIC_VECTOR(size-1 DOWNTO 0); -- mod data path width

BEGIN

PROCESS (clk,rst)
BEGIN			
	if (rst = '1') then
		IAQA <= (others => '0');
		IBQB <= (others => '0');
		I <= (others => '0');
		Q <= (others => '0');
	elsif (rising_edge (clk)) then
		IAQA <= (IA(size-1) & IA) + (QA(size-1) & QA);
		IBQB <= (IB(size-1) & IB) - (QB(size-1) & QB);
		eSUM <= IAQB(2*size-2 downto size-1) - QAIB(2*size-2 downto size-1);
		QSUM <= IAQB(2*size-2 downto size-1) + QAIB(2*size-2 downto size-1);
		I <= ISUM(size-1 downto 0);
		Q <= QSUM;
	end if;
END PROCESS;

	ISUM <= pSUM(2*size-1 downto size-1)+ (eSUM(size-1) & eSUM);

PROCESS (clk)
BEGIN			
	if (rising_edge (clk)) then	
		pSUM <= IAQA * IBQB;
		IAQB <= IA * QB;
		QAIB <= QA * IB;
	end if;
END PROCESS;


END a;

