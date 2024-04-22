-----------------------------------------------------------------------------
--	Filename:	gh_Freq_Acc16.vhd
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
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY gh_Freq_Acc16 IS
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
		Q7       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q8       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q9       : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q10      : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q11      : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q12      : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q13      : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q14      : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q15      : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END entity ;

ARCHITECTURE a OF gh_Freq_Acc16 IS

	signal iF0  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF1  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF2  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF3  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF4  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF5  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF6  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF7  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF8  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF9  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF10 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF11 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF12 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF13 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF14 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iF15 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	
	signal iQ0  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ1  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ2  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ3  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ4  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ5  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ6  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ7  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ8  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ9  :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ10 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ11 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ12 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ13 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ14 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);
	signal iQ15 :  STD_LOGIC_VECTOR(A_size-1 DOWNTO 0);

BEGIN
	
	Q0 <= iQ0(A_size-1 downto A_size-size);
	Q1 <= iQ1(A_size-1 downto A_size-size);
	Q2 <= iQ2(A_size-1 downto A_size-size);
	Q3 <= iQ3(A_size-1 downto A_size-size);
	Q4 <= iQ4(A_size-1 downto A_size-size);
	Q5 <= iQ5(A_size-1 downto A_size-size);
	Q6 <= iQ6(A_size-1 downto A_size-size);
	Q7 <= iQ7(A_size-1 downto A_size-size);
	Q8 <= iQ8(A_size-1 downto A_size-size);
	Q9 <= iQ9(A_size-1 downto A_size-size);
	Q10 <= iQ10(A_size-1 downto A_size-size);
	Q11 <= iQ11(A_size-1 downto A_size-size);
	Q12 <= iQ12(A_size-1 downto A_size-size);
	Q13 <= iQ13(A_size-1 downto A_size-size);
	Q14 <= iQ14(A_size-1 downto A_size-size);
	Q15 <= iQ15(A_size-1 downto A_size-size);
	
PROCESS (clk,rst)
BEGIN
	if (rst = '1') then
		iF0 <= (others => '0');
		iF1 <= (others => '0');
		iF2 <= (others => '0');
		iF3 <= (others => '0');
		iF4 <= (others => '0');
		iF5 <= (others => '0');
		iF6 <= (others => '0');
		iF7 <= (others => '0');
		iF8 <= (others => '0');
		iF9 <= (others => '0');
		iF10 <= (others => '0');
		iF11 <= (others => '0');
		iF12 <= (others => '0');
		iF13 <= (others => '0');
		iF14 <= (others => '0');
		iF15 <= (others => '0');
		iQ0 <= (others => '0');
		iQ1 <= (others => '0');
		iQ2 <= (others => '0');
		iQ3 <= (others => '0');
		iQ4 <= (others => '0');
		iQ5 <= (others => '0');
		iQ6 <= (others => '0');
		iQ7 <= (others => '0');
		iQ8 <= (others => '0');
		iQ9 <= (others => '0');
		iQ10 <= (others => '0');
		iQ11 <= (others => '0');
		iQ12 <= (others => '0');
		iQ13 <= (others => '0');
		iQ14 <= (others => '0');
		iQ15 <= (others => '0');
	elsif (rising_edge(clk)) then
		if (srst = '1') then 
			iQ0 <= (others => '0');
			iQ1 <= (others => '0');
			iQ2 <= (others => '0');
			iQ3 <= (others => '0');
			iQ4 <= (others => '0');
			iQ5 <= (others => '0');
			iQ6 <= (others => '0');
			iQ7 <= (others => '0');
			iQ8 <= (others => '0');
			iQ9 <= (others => '0');
			iQ10 <= (others => '0');
			iQ11 <= (others => '0');
			iQ12 <= (others => '0');
			iQ13 <= (others => '0');
			iQ14 <= (others => '0');
			iQ15 <= (others => '0');
		else
			iF0 <= Freq(A_size-1 downto 0);
			iF1 <= (Freq(A_size-2 downto 0) & "0");
			iF2 <= (Freq(A_size-2 downto 0) & "0") + Freq(A_size-1 downto 0);
			iF3 <= (Freq(A_size-3 downto 0) & "00");
			iF4 <= (Freq(A_size-3 downto 0) & "00") + Freq(A_size-1 downto 0);
			iF5 <= (Freq(A_size-3 downto 0) & "00") + (Freq(A_size-2 downto 0) & "0");
			iF6 <= (Freq(A_size-3 downto 0) & "00") + (Freq(A_size-2 downto 0) & "0") + Freq(A_size-1 downto 0);
			iF7 <= (Freq(A_size-4 downto 0) & "000");
			iF8 <= (Freq(A_size-4 downto 0) & "000") + Freq(A_size-1 downto 0);
			iF9 <= (Freq(A_size-4 downto 0) & "000") + (Freq(A_size-2 downto 0) & "0");
			iF10 <= (Freq(A_size-4 downto 0) & "000") + (Freq(A_size-2 downto 0) & "0") + Freq(A_size-1 downto 0);
			iF11 <= (Freq(A_size-4 downto 0) & "000") + (Freq(A_size-3 downto 0) & "00");
			iF12 <= (Freq(A_size-4 downto 0) & "000") + (Freq(A_size-3 downto 0) & "00") + Freq(A_size-1 downto 0);
			iF13 <= (Freq(A_size-4 downto 0) & "000") + (Freq(A_size-3 downto 0) & "00") + (Freq(A_size-2 downto 0) & "0");
			iF14 <= (Freq(A_size-4 downto 0) & "000") + (Freq(A_size-3 downto 0) & "00") + (Freq(A_size-2 downto 0) & "0") + Freq(A_size-1 downto 0);
			iF15 <= (Freq(A_size-5 downto 0) & "0000");
			iQ0 <= iQ15 + iF0;
			iQ1 <= iQ15 + iF1;
			iQ2 <= iQ15 + iF2;
			iQ3 <= iQ15 + iF3;
			iQ4 <= iQ15 + iF4;
			iQ5 <= iQ15 + iF5;
			iQ6 <= iQ15 + iF6;
			iQ7 <= iQ15 + iF7;
			iQ8 <= iQ15 + iF8;
			iQ9 <= iQ15 + iF9;
			iQ10 <= iQ15 + iF10;
			iQ11 <= iQ15 + iF11;
			iQ12 <= iQ15 + iF12;
			iQ13 <= iQ15 + iF13;
			iQ14 <= iQ15 + iF14;
			iQ15 <= iQ15 + iF15;
		end if;
 	end if;
END PROCESS;

END architecture;
