-----------------------------------------------------------------------------
--	Filename:	gh_complex_mult_2cm.vhd
--
--	Description:
--		   general purpose complex multiplier
--		   uses two clock multipliers
--
--	Copyright (c) 2007, 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	08/16/07  	SA Dodd  	Initial revision
--	1.1      	05/20/08  	h lefevre	change bit with for I/Q SUM to improve timing
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;

ENTITY gh_complex_mult_2cm IS
	GENERIC (size: INTEGER := 16);
	PORT(
		clk      : IN  STD_LOGIC; 
		rst      : IN  STD_LOGIC;
		IA       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		IB       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		QA       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		QB       : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		I        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END entity;

ARCHITECTURE a OF gh_complex_mult_2cm IS

	signal iIA   :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iIB   :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iQA   :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iQB   :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal IAIB  :  STD_LOGIC_VECTOR(2*size-1 DOWNTO 0);
	signal QAQB  :  STD_LOGIC_VECTOR(2*size-1 DOWNTO 0);
	signal IAQB  :  STD_LOGIC_VECTOR(2*size-1 DOWNTO 0);
	signal QAIB  :  STD_LOGIC_VECTOR(2*size-1 DOWNTO 0);

BEGIN

PROCESS (clk,rst)
BEGIN			
	if (rst = '1') then
		I <= (others => '0');
		Q <= (others => '0');
	elsif (rising_edge (clk)) then		
		I <= IAIB(2*size-2 downto size-1) - QAQB(2*size-2 downto size-1);
		Q <= IAQB(2*size-2 downto size-1) + QAIB(2*size-2 downto size-1);
	end if;
END PROCESS;

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
	end if;
END PROCESS;


END a;

