-----------------------------------------------------------------------------
--	Filename:	gh_shift_reg_PL_SLR.vhd
--
--	Description:
--		a shift register with Parallel Load, shift left/right
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	10/08/05  	G Huber 	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY gh_shift_reg_PL_SLR IS
	GENERIC (size: INTEGER := 16);
	PORT(
		clk      : IN STD_logic;
		rst      : IN STD_logic;
		MODE     : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
		            --  00  Hold, do nothing
		            --  01  shift right
		            --  10  shift left
		            --  11  Parallel Load
		DSL      : IN STD_logic := '0'; -- data in for shift left
		DSR      : IN STD_logic := '0'; -- data in for shift right
		D        : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0) := (others => '0');
		Q        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END gh_shift_reg_PL_SLR;

ARCHITECTURE a OF gh_shift_reg_PL_SLR IS

	signal iQ :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	
BEGIN
 
	Q <= iQ;
	

process(clk,rst)
begin
	if (rst = '1') then 
		iQ <= (others => '0');
	elsif (rising_edge(clk)) then
		if (MODE = "11") then 
			iQ <= D;
		elsif (MODE = "10") then -- shift left
			iQ(size-1) <= DSL;
			iQ(size-2 downto 0) <= iQ(size-1 downto 1);
		elsif (MODE = "01") then -- shift right
			iQ(0) <= DSR;
			iQ(size-1 downto 1) <= iQ(size-2 downto 0);
		else -- (MODE = "00") then
			iQ <= iQ;
		end if;
	end if;
end process;


END a;

