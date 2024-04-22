-----------------------------------------------------------------------------
--	Filename:	gh_Freq_Acc8.vhd
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
--	1.0      	07/04/08  	G Huber 	Initial revision
--	2.0      	08/07/08  	hlefevre	mod to improve timeing
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY gh_Freq_Acc8 IS
	GENERIC(A_size: INTEGER := 32;
	        size: INTEGER := 12);
	PORT(	
		clk      : IN  STD_LOGIC;
		rst      : IN  STD_LOGIC := '0';
		srst     : IN  STD_LOGIC := '0';
		Freq     : IN  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
		Q0       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q1       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q2       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q3       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q4       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q5       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q6       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q7       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END entity ;

ARCHITECTURE a OF gh_Freq_Acc8 IS

	signal iFreq :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iiFreq :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iiF6 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	
	signal iF0 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF1 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF2 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF3 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF4 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF5 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF6 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF7 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	
	signal iQ0 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ1 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ2 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ3 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ4 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ5 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ6 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ7 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);

BEGIN
	
	Q0 <= iQ0(A_size-1 downto A_size-size);
	Q1 <= iQ1(A_size-1 downto A_size-size);
	Q2 <= iQ2(A_size-1 downto A_size-size);
	Q3 <= iQ3(A_size-1 downto A_size-size);
	Q4 <= iQ4(A_size-1 downto A_size-size);
	Q5 <= iQ5(A_size-1 downto A_size-size);
	Q6 <= iQ6(A_size-1 downto A_size-size);
	Q7 <= iQ7(A_size-1 downto A_size-size);
	
PROCESS (clk,rst)
BEGIN
	if (rst = '1') then
		iFREQ <= (others => '0');
		iiFREQ <= (others => '0');
		iiF6 <= (others => '0');
		
		iF0 <= (others => '0');
		iF1 <= (others => '0');
		iF2 <= (others => '0');
		iF3 <= (others => '0');
		iF4 <= (others => '0');
		iF5 <= (others => '0');
		iF6 <= (others => '0');
		iF7 <= (others => '0');
		iQ0 <= (others => '0');
		iQ1 <= (others => '0');
		iQ2 <= (others => '0');
		iQ3 <= (others => '0');
		iQ4 <= (others => '0');
		iQ5 <= (others => '0');
		iQ6 <= (others => '0');
		iQ7 <= (others => '0');
	elsif (rising_edge(clk)) then
		iFREQ <= FREQ;
		iiFREQ <= iFREQ;
		if (srst = '1') then
			iQ0 <= (others => '0');
			iQ1 <= (others => '0');
			iQ2 <= (others => '0');
			iQ3 <= (others => '0');
			iQ4 <= (others => '0');
			iQ5 <= (others => '0');
			iQ6 <= (others => '0');
			iQ7 <= (others => '0');
		else
			iF0 <= iiFreq(A_size-1 downto 0);
			iF1 <= (iiFreq(A_size-2 downto 0) & "0");
			iF2 <= (iiFreq(A_size-2 downto 0) & "0") + iiFreq(A_size-1 downto 0);
			iF3 <= (iiFreq(A_size-3 downto 0) & "00");
			iF4 <= (iiFreq(A_size-3 downto 0) & "00") + iiFreq(A_size-1 downto 0);
			iF5 <= (iiFreq(A_size-3 downto 0) & "00") + (iiFreq(A_size-2 downto 0) & "0");
			iiF6 <= (iFreq(A_size-2 downto 0) & "0") + iFreq(A_size-1 downto 0);
			iF6 <= (iiFreq(A_size-3 downto 0) & "00") + iiF6;
			iF7 <= (iiFreq(A_size-4 downto 0) & "000");
			iQ0 <= iQ7 + iF0;
			iQ1 <= iQ7 + iF1;
			iQ2 <= iQ7 + iF2;
			iQ3 <= iQ7 + iF3;
			iQ4 <= iQ7 + iF4;
			iQ5 <= iQ7 + iF5;
			iQ6 <= iQ7 + iF6;
			iQ7 <= iQ7 + iF7;
		end if;
 	end if;
END PROCESS;

END architecture;
