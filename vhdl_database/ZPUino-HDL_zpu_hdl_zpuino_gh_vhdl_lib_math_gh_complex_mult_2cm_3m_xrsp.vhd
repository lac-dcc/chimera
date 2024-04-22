-----------------------------------------------------------------------------
--	Filename:	gh_complex_mult_2cm_3m_xrsp.vhd
--
--	Description:
--		   general purpose complex multiplier
--		   uses 3 (rather than 4) single clock multipliers
--		   (has one more clock delay that 4 multiplier version)
--		   this version has extra register in sum path
--
--	Copyright (c) 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	--------	--------	---------	-----------
--	1.0     	06/01/08  	h lefevre	Initial Revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;

ENTITY gh_complex_mult_2cm_3m_xrsp IS
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

ARCHITECTURE a OF gh_complex_mult_2cm_3m_xrsp IS

	signal iIA   :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iIB   :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iQA   :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iQB   :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	
	signal IAQA  :  STD_LOGIC_VECTOR(size DOWNTO 0);
	signal IBQB  :  STD_LOGIC_VECTOR(size DOWNTO 0);
	
	signal IAQB  :  STD_LOGIC_VECTOR(2*size-1 DOWNTO 0);
	signal QAIB  :  STD_LOGIC_VECTOR(2*size-1 DOWNTO 0);
	
	signal eSUM  :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal pSUM  :  STD_LOGIC_VECTOR(2*size+1 DOWNTO 0);
													   
	signal ISUM  :  STD_LOGIC_VECTOR(size DOWNTO 0);
	signal QSUM  :  STD_LOGIC_VECTOR(size-1 DOWNTO 0); -- mod data path width
	
	signal dpSUM :  STD_LOGIC_VECTOR(size DOWNTO 0);
	signal dIAQB :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal dQAIB :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	
BEGIN

	ISUM <= dpSUM + (eSUM(size-1) & eSUM);

PROCESS (clk)
BEGIN			
	if (rising_edge (clk)) then	
		iIA <= IA;
		iIB <= IB;
		iQA <= QA;
		iQB <= QB;
		pSUM <= IAQA * IBQB;
		IAQB <= iIA * iQB;
		QAIB <= iQA * iIB;
		dpSUM <= pSUM(2*size-1 downto size-1);
		dIAQB <= IAQB(2*size-2 downto size-1);
		dQAIB <= QAIB(2*size-2 downto size-1);
		IAQA <= (iIA(size-1) & iIA) + (iQA(size-1) & iQA);
		IBQB <= (iIB(size-1) & iIB) - (iQB(size-1) & iQB);
		eSUM <= dIAQB - dQAIB;
		QSUM <= dIAQB + dQAIB;
		I <= ISUM(size-1 downto 0);
		Q <= QSUM;
	end if;
END PROCESS;


END a;

