-----------------------------------------------------------------------------
--	Filename:	gh_Freq_Acc4p.vhd
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

ENTITY gh_Freq_Acc4p IS
	GENERIC(A_size: INTEGER := 32;
	        size: INTEGER := 12);
	PORT(	
		clk      : IN  STD_LOGIC;
		rst      : IN  STD_LOGIC := '0';
		srst     : IN  STD_LOGIC := '0';
		Freq     : IN  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
		phase0   : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		phase1   : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		phase2   : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		phase3   : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q0       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q1       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q2       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q3       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END entity ;

ARCHITECTURE a OF gh_Freq_Acc4p IS

	signal iF0 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF1 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF2 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF3 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	
	signal iQ0 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ1 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ2 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ3 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);

BEGIN

	
	
PROCESS (clk,rst)
BEGIN
	if (rst = '1') then
		iF0 <= (others => '0');
		iF1 <= (others => '0');
		iF2 <= (others => '0');
		iF3 <= (others => '0');
		iQ0 <= (others => '0');
		iQ1 <= (others => '0');
		iQ2 <= (others => '0');
		iQ3 <= (others => '0');
		Q0 <= (others => '0');
		Q1 <= (others => '0');
		Q2 <= (others => '0');
		Q3 <= (others => '0');
	elsif (rising_edge(clk)) then
		if (srst = '1') then -- init output phase to input phase
			iQ0 <= (others => '0');
			iQ1 <= (others => '0');
			iQ2 <= (others => '0');
			iQ3 <= (others => '0');
		else
			iF0 <= Freq(A_size-1 downto 0);
			iF1 <= (Freq(A_size-2 downto 0) & "0");
			iF2 <= Freq(A_size-1 downto 0) + (Freq(A_size-2 downto 0) & "0");
			iF3 <= (Freq(A_size-3 downto 0) & "00");
			iQ0 <= iQ3 + iF0;
			iQ1 <= iQ3 + iF1;
			iQ2 <= iQ3 + iF2;
			iQ3 <= iQ3 + iF3;
			Q0 <= iQ0(A_size-1 downto A_size-size) + phase0;
			Q1 <= iQ1(A_size-1 downto A_size-size) + phase1;
			Q2 <= iQ2(A_size-1 downto A_size-size) + phase2;
			Q3 <= iQ3(A_size-1 downto A_size-size) + phase3;
		end if;
	end if;
END PROCESS;

END architecture;

