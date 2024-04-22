-----------------------------------------------------------------------------
--	Filename:	gh_mult_ip_usus_mg.vhd
--
--	Description:
--		   an inplace multiplier unsigned inputs
--		   with modified gain
--
--	Copyright (c) 2006, 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	03/25/06  	H LeFevre	Initial revision
--	1.1     	11/04/06  	H LeFevre	modified to reduse area used
--	2.0      	06/18/07  	H LeFevre	add range to bit_count
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY gh_mult_ip_usus_mg IS
	generic(size : INTEGER :=8 );
	PORT(	
		clk    : IN  STD_LOGIC;
		rst    : IN  STD_LOGIC;
		start  : IN  STD_LOGIC;
		A      : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0); -- unsigned input
		B      : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0); -- unsigned input
		Q      : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		BUSYn  : OUT STD_LOGIC
		);
END entity ;

ARCHITECTURE a OF gh_mult_ip_usus_mg IS

COMPONENT gh_counter_integer_down is
	generic(max_count : integer := 8);
	PORT(	
		clk      : IN STD_LOGIC;
		rst      : IN STD_LOGIC; 
		LOAD     : in STD_LOGIC; -- load D
		CE       : IN STD_LOGIC; -- count enable
		D        : in integer RANGE 0 TO max_count;
		Q        : out integer RANGE 0 TO max_count
		);
END COMPONENT;

	signal istart    :  STD_LOGIC;
	signal busy      :  STD_LOGIC;
	signal bit_count :  integer range 0 to size:= 0;
	signal done      :  std_logic;
	signal ddone     :  std_logic;
	signal iA        :  STD_LOGIC_VECTOR(size+1 DOWNTO 0);
	signal iB        :  STD_LOGIC_VECTOR(size+1 DOWNTO 0);
	signal iQ        :  STD_LOGIC_VECTOR(size+1 DOWNTO 0);
	signal pQ        :  STD_LOGIC_VECTOR(size+1 DOWNTO 0);

BEGIN

	BUSYn <= (not busy);
	
	Q <= pQ(size downto 1);
		
	istart <= '1' when ((start = '1') and (busy = '0')) else
	          '0';

PROCESS (clk,rst)
BEGIN
	if (rst = '1') then
		busy <= '0';
		iA <= (others =>'0');
		iB <= (others =>'0');
		iQ <= (others =>'0');
		pQ <= (others => '0');
		done <= '0';
		ddone <= '0';
	elsif (rising_edge (clk)) then
-------------------------------------------------
		if (istart = '1') then -- starts Multiply
			busy <= '1';
		elsif (ddone = '1') then -- when product is ready
			busy <= '0';
		end if;
-------------------------------------------------
		if (istart = '1') then 
			iA <= '0' & A & (A(0) or B(0));
			iB <= '0' & B & '0';
			iQ <= (others =>'0');
		elsif (busy = '1') then
			iB <= ('0' & iB(size+1 downto 1));
			if (done = '1') then
				iQ <= (iQ + x"1"); -- modify gain
			elsif (iB(1) = '1') then -- shift and add
				iQ <= iA + ('0' & iQ(size+1 downto 1));
			else
				iQ <= ('0' & iQ(size+1 downto 1)); -- shift with out add
			end if;
		end if;	
-----------------------------------------------------
		if ((busy = '1') and (bit_count = 0)) then
			done <= '1'; -- Multiply done
		else
			done <= '0';
		end if;
		ddone <= done;
------------------------------------------------------
		if (ddone = '1') then -- output ready
			pQ <= iQ;
		end if;
-----------------------------------------------------
	end if;
END PROCESS;

U1 : gh_counter_integer_down 
	Generic Map (max_count => size)
	PORT MAP (
		clk => clk,
		rst => rst,
		LOAD => istart,
		CE => busy,
		D => size,
		Q => bit_count);

END a;

