-----------------------------------------------------------------------------
--	Filename:	gh_stretch.vhd
--
--	Description:
--		pulse strecher - streches pulse by "strech_count" clocks
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	09/03/05   	G Huber 	Initial revision
--	2.0     	09/17/05  	h lefevre	name change to avoid conflict
--	        	          	         	  with other libraries
--	2.1      	05/21/06  	S A Dodd 	fix typo's
--
-----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity gh_stretch is 
	GENERIC (stretch_count: integer :=1023);
	 port(
		 CLK : in STD_LOGIC;
		 rst : in STD_LOGIC;
		 D : in STD_LOGIC;
		 Q : out STD_LOGIC
	     );
end gh_stretch;



architecture a of gh_stretch is  
	
	signal iQ : std_logic;
	
begin

	Q <= D or iQ; 
	
process(CLK,rst)	
	VARIABLE count : INTEGER RANGE 0 TO stretch_count;
begin -- 
	if (rst = '1') then
		count := 0;
		iQ <= '0';
	elsif (rising_edge(CLK)) then
		if (iQ = '0') then 
			count := 0;
			if (D = '1') then 
				iQ <= '1';
			else
				iQ <= '0';
			end if;
		else -- (iQ = '1')
			if (D = '0') then
				count := count + 1;
				if (count = stretch_count) then
					iQ <= '0';
				else
					iQ <= '1';
				end if;
			else -- wait for D to go low
				count := 0;
				iQ <= '1';
			end if;
		end if;
	end if;
end process;

end a;
