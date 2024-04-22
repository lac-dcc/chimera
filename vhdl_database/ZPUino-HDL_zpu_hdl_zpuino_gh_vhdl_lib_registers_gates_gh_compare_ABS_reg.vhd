-----------------------------------------------------------------------------
--	Filename:	gh_compare_ABS_reg.vhd
--
--	Description:
--		does an absolute value compare	 
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	10/20/07  	S A Dodd 	Initial register version
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY gh_compare_ABS_reg IS
	GENERIC (size: INTEGER := 16);
	PORT(	
		clk    : IN  STD_LOGIC;
		rst    : IN  STD_LOGIC;
		A      : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		B      : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		AGB    : OUT STD_LOGIC;
		AEB    : OUT STD_LOGIC;
		ALB    : OUT STD_LOGIC;
		AS     : OUT STD_LOGIC; -- A sign bit
		BS     : OUT STD_LOGIC; -- B sign bit
		ABS_A  : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		ABS_B  : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END entity ;

ARCHITECTURE a OF gh_compare_ABS_reg IS

	signal iAS :  STD_LOGIC;
	signal iBS :  STD_LOGIC;
	signal iA  :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iB  :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);

BEGIN

process(CLK,rst)
begin
	if (rst = '1') then		  
		iA <= (others => '0');
		iB <= (others => '0');
	elsif (rising_edge(CLK)) then
		if (A(size-1) = '0') then
			iA <= A;
		elsif (A(size-2 downto 0) > x"0") then
			iA <= x"0" - A;
		else 
			iA(size-1) <= '0';
			iA(size-2 downto 0) <= (others => '1');
		end if;
	------------------------------------------
		if (B(size-1) = '0') then
			iB <= B;
		elsif (B(size-2 downto 0) > x"0") then
			iB <= x"0" - B;
		else
			iB(size-1) <= '0';
			iB(size-2 downto 0) <= (others => '1');
		end if;
	end if;
end process;

process(CLK,rst)
begin
	if (rst = '1') then
		iAS <= '0';
		iBS <= '0';
		AS <= '0';
		BS <= '0';
		ABS_A <= (others => '0');
		ABS_B <= (others => '0');
	elsif (rising_edge(CLK)) then				 			
		iAS <= A(size-1);
		iBS <= B(size-1);
		AS <= iAS;
		BS <= iBS;
		ABS_A <= iA;
		ABS_B <= iB;
	end if;
end process;

process(CLK,rst)
begin
	if (rst = '1') then		  
		AGB <= '0';
		ALB <= '0';
		AEB <= '0';
	elsif (rising_edge(CLK)) then
		if (iA > iB) then
			AGB <= '1';
		else
			AGB <= '0';
		end if;
	-------------------------------
		if (iA < iB) then
			ALB <= '1';
		else
			ALB <= '0';
		end if;
	-----------------------------
		if (iA = iB) then
			AEB <= '1';
		else
			AEB <= '0';
		end if;
	end if;
end process;	

END a;
