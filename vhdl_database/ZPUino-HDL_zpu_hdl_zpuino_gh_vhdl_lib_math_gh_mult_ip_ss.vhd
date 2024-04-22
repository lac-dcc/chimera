-----------------------------------------------------------------------------
--	Filename:	gh_mult_ip_ss.vhd
--
--	Description:
--		   an inplace multiplier with signed inputs
--
--	Copyright (c) 2006, 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	02/11/06  	H LeFevre	Initial revision
--	2.0      	06/18/07  	H LeFevre	add range to bit_count
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;

ENTITY gh_mult_ip_ss IS
	generic(size : INTEGER :=8 );
	PORT(	
		clk    : IN  STD_LOGIC;
		rst    : IN  STD_LOGIC;
		start  : IN  STD_LOGIC;
		A      : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0); -- signed input
		B      : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0); -- signed input
		Q      : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		BUSYn  : OUT STD_LOGIC
		);
END entity ;

ARCHITECTURE a OF gh_mult_ip_ss IS

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
	signal bit_count :  integer range 0 to size;
	signal neg       :  std_logic;
	signal done      :  std_logic;
	signal iA        :  STD_LOGIC_VECTOR(size+1 DOWNTO 0);
	signal iiA       :  STD_LOGIC_VECTOR(size+1 DOWNTO 0);
	signal iiB       :  STD_LOGIC_VECTOR(size+1 DOWNTO 0);
	signal iB        :  STD_LOGIC_VECTOR(size+1 DOWNTO 0);
	signal iQ        :  STD_LOGIC_VECTOR(size+1 DOWNTO 0);
	signal pQ        :  STD_LOGIC_VECTOR(size+1 DOWNTO 0);

	signal pos_max : STD_LOGIC_VECTOR(size-1 downto 0);
	constant ones : STD_LOGIC_VECTOR(size-2 DOWNTO 0) := (others => '1');
	
BEGIN

	BUSYn <= (not busy);

	pos_max <= ('0' & ones);
	
	Q <= pos_max when (pQ(size+1 downto size) = "01") else -- prevents overflow when
	     pQ(size downto 1);                                -- A and B are max neg
	
PROCESS (clk,rst)
BEGIN
	if (rst = '1') then
		pQ <= (others => '0');
		done <= '0';
	elsif (rising_edge (clk)) then
		if ((busy = '1') and (bit_count = 0)) then
			done <= '1';
		else
			done <= '0';
		end if;
		if (done = '1') then
			if (neg = '0') then
				pQ <= iQ + x"1";
			else -- does 2's comp if neg bit is set
				pQ <= ((not iQ) + x"1");
			end if;
		end if;
	end if;
END PROCESS;		
		
	istart <= '1' when ((start = '1') and (busy = '0')) else
	          '0';

PROCESS (clk,rst)
BEGIN
	if (rst = '1') then
		busy <= '0';
	elsif (rising_edge (clk)) then
		if (istart = '1') then
			busy <= '1';
		elsif (done = '1') then
			busy <= '0';
		end if;
	end if;
END PROCESS;

-------------------------------------------------------
-- does 2's comp if input is neg  ---------------------

	iiA <= (A & "00") when (A(size-1) = '0') else
	       ((not (A & "00")) + x"1");

	iiB <= (B & "00") when (B(size-1) = '0') else
	       ((not (B & "00")) + x"1");
		   
--------------------------------------------------------
		   
PROCESS (clk,rst)
BEGIN
	if (rst = '1') then
		neg <= '0';
		iA <= (others =>'0');
		iB <= (others =>'0');
		iQ <= (others =>'0');
	elsif (rising_edge (clk)) then
		if (istart = '1') then 
			neg <= (A(size-1) xor B(size-1));
			iA <= iiA;
			iB <= iiB;
			iQ <= (others =>'0');
		elsif (busy = '1') then -- 
			iB <= ('0' & iB(size+1 downto 1));
			if (iB(2) = '1') then 
				iQ <= iA + ('0' & iQ(size+1 downto 1));
			else
				iQ <= ('0' & iQ(size+1 downto 1));
			end if;
		end if;
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

