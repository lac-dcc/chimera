-----------------------------------------------------------------------------
--	Filename:	gh_Freq_Acc.vhd
--
--	Description:
--		an accumulator - 
--		   adds the input data (D) to the output (Q) value with sync reset
--
--	Copyright (c) 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	----------	--------	-----------
--	1.0      	06/03/08  	G Huber 	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY gh_Freq_Acc IS
	GENERIC(A_size: INTEGER := 32;
	        size: INTEGER := 12);
	PORT(	
		clk      : IN  STD_LOGIC;
		rst      : IN  STD_LOGIC := '0';
		srst     : IN  STD_LOGIC := '0';
		Freq     : IN  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
		Q        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END entity ;

ARCHITECTURE a OF gh_Freq_Acc IS

	signal iF0 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0); 
	signal iQ0 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);

BEGIN
	
	Q <= iQ0(A_size-1 downto A_size-size);	
	
PROCESS (clk,rst)
BEGIN
	if (rst = '1') then
		iF0 <= (others => '0');	
		iQ0 <= (others => '0');	
	elsif (rising_edge(clk)) then
		if (srst = '1') then
			iF0 <= (others => '0');	
			iQ0 <= (others => '0');	
		else
			iF0 <= Freq(A_size-1 downto 0);	
			iQ0 <= iQ0 + iF0; 
		end if;
 	end if;
END PROCESS;

END architecture;
