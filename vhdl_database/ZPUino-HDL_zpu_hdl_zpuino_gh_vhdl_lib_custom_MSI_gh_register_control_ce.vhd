-----------------------------------------------------------------------------
--	Filename:	gh_register_control_ce.vhd
--
--	Description:
--		Control register with clock enable
--			mode = "00" writes D to Q
--			mode = "01" sets D bits in Q
--			mode = "10" clears D bits in Q
--			mode = "11" inverts D bits in Q
--
--		 
--	Copyright (c) 2006, 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0     	01/21/06  	S A Dodd 	Initial revision
--	1.1     	06/24/06   	G Huber  	fix typo 
--	1.2     	01/20/07   	G Huber  	add iCE
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gh_register_control_ce IS
	GENERIC (size: INTEGER := 8);
	PORT(	
		clk  : IN		STD_LOGIC;
		rst  : IN		STD_LOGIC; 
		CE   : IN		STD_LOGIC; -- clock enable
		MODE : IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
		D    : IN		STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q    : OUT		STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END entity;

ARCHITECTURE a OF gh_register_control_ce IS

	signal iCE : STD_LOGIC; -- added 01/20/07
	signal iQ  : STD_LOGIC_VECTOR(size-1 DOWNTO 0);

BEGIN
	
	Q <= iQ;

PROCESS (clk,rst)
BEGIN
	if (rst = '1') then
		iCE <= '0';
		iQ <= (others =>'0');
	elsif (rising_edge (clk)) then
		iCE <= CE;
		if ((CE = '1') and (iCE = '0')) then
			if (MODE = "00") then
				iQ <= D;
			elsif (MODE = "01") then
				iQ <= D or iQ;
			elsif (MODE = "10") then
				iQ <= (not D) and iQ;
			else -- (MODE = "11") then
				iQ <= D xor iQ;
			end if;
		end if;
	end if;
END PROCESS;

END a;

