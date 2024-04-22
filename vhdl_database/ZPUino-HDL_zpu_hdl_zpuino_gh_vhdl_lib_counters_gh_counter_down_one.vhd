-----------------------------------------------------------------------------
--	Filename:	gh_counter_down_one.vhd
--
--	Description:
--		Binary up/down counter with load, and count enable, and terminal count
--		   Includes a "one" flag -
--		       like TC, but is active at x"1", instead of x"0"
--		       (will still count like a normal down counter)
--		       Useful as an event counter
--
--	Copyright (c) 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author   	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	06/05/06  	S A Dodd	Initial revision
--	1.1     	09/16/06  	G Huber  	add TC
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

ENTITY gh_counter_down_one IS
	GENERIC (size: INTEGER :=8);
	PORT(
		CLK   : IN	STD_LOGIC;
		rst   : IN	STD_LOGIC;
		LOAD  : IN	STD_LOGIC;
		CE    : IN	STD_LOGIC;
		D     : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q     : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		TC    : OUT STD_LOGIC; -- added for flexibility
		one   : OUT STD_LOGIC
		);
END entity;

ARCHITECTURE a OF gh_counter_down_one IS 

	signal iQ    : STD_LOGIC_VECTOR (size-1 DOWNTO 0);
	signal iTC   : STD_LOGIC;
	signal ione  : STD_LOGIC;
	
BEGIN
	      
	Q <= iQ;
	TC <= (CE and iTC);
	one <= (CE and ione);


PROCESS (CLK,rst)
BEGIN
	if (rst = '1') then 
		ione <= '0';
		iTC <= '0';
	elsif (rising_edge(CLK)) then
		if (LOAD = '1') then
			if (D = x"1") then
				ione <= '1';
			else
				ione <= '0';
			end if;	
			if (D = x"0") then
				iTC <= '1';
			else
				iTC <= '0';
			end if;
		elsif (CE = '0') then  -- LOAD = '0'
				if (iQ = x"1") then
					ione <= '1';
				else
					ione <= '0';
				end if;	
				if (iQ = x"0") then
					iTC <= '1';
				else
					iTC <= '0';
				end if;
		else -- (CE = '1')	
			if (iQ = x"2") then
				ione <= '1';
			else
				ione <= '0';
			end if;
			if (iQ = x"1") then
				iTC <= '1';
			else
				iTC <= '0';
			end if;
		end if;			
	end if;
END PROCESS;

--------------------------------------------

PROCESS (CLK,rst)
BEGIN
	if (rst = '1') then 
		iQ <= (others => '0');
	elsif (rising_edge(CLK)) then
		if (LOAD = '1') then 
			iQ <= D;
		elsif (CE = '1') then
			iQ <= (iQ - "01");
		end if;			
	end if;
END PROCESS;

END a;
