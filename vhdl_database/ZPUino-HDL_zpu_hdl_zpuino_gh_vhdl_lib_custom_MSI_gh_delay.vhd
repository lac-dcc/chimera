-----------------------------------------------------------------------------
--	Filename:	gh_delay.vhd
--
--	Description:
--		fixed register delay line
--
--	Copyright (c) 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	01/14/06   	G Huber 	Initial revision
--	1.1      	06/24/06   	G Huber 	fix typo
--
-----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY gh_delay IS
	GENERIC (clock_delays : INTEGER := 16); 
	PORT(
		clk  : IN STD_logic;
		rst  : IN STD_logic;
		srst : IN STD_logic := '0';
		D    : IN STD_LOGIC;
		Q    : OUT STD_LOGIC
		);
END entity;

ARCHITECTURE a OF gh_delay IS

	signal iQ :  STD_LOGIC_VECTOR(clock_delays-1 DOWNTO 0);
	
BEGIN
 
	Q <= iQ(clock_delays-1);

process(clk,rst)
begin
	if (rst = '1') then 
		iQ <= (others => '0');
	elsif (rising_edge(clk)) then  
		if (srst = '1') then
			iQ <= (others => '0');
		else
			iQ(0) <= D;
			iQ(clock_delays-1 downto 1) <= iQ(clock_delays-2 downto 0);
		end if;
	end if;
end process;


END a;

