-----------------------------------------------------------------------------
--	Filename:	gh_clk_ce_div.vhd
--
--	Description:
--		clock divider for use with the clock enable
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	09/18/05   	G Huber 	Initial revision
--
-----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity gh_clk_ce_div is 
	GENERIC (divide_ratio : integer :=8);
	 port(
		 CLK : in STD_LOGIC;
		 rst : in STD_LOGIC;
		 Q : out STD_LOGIC
	     );
end gh_clk_ce_div;



architecture a of gh_clk_ce_div is  
	

begin

process(CLK,rst)	
	VARIABLE count : INTEGER RANGE 0 TO divide_ratio;
begin -- 
	if (rst = '1') then
		count := 0;
		Q <= '0';
	elsif (rising_edge(CLK)) then
		if (count = (divide_ratio -1)) then 
			count := 0;
			Q <= '1';
		else
			count := count + 1;
			Q <= '0';
		end if;
	end if;
end process;

end a;
