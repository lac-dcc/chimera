-----------------------------------------------------------------------------
--	Filename:	gh_stretch_low.vhd
--
--	Description:
--		active low pulse strecher - streches pulse by "strech_count" clocks
--
--	Copyright (c) 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	05/26/06   	G Huber 	Initial revision
--
-----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity gh_stretch_low is 
	GENERIC (stretch_count: integer :=10);
	port(
		CLK : in STD_LOGIC;
		rst : in STD_LOGIC;
		Dn  : in STD_LOGIC;
		Qn  : out STD_LOGIC
		);
end entity;



architecture a of gh_stretch_low is  
	
	signal iQn : std_logic;
	
begin

	Qn <= Dn and iQn; 
	
process(CLK,rst)	
	VARIABLE count : INTEGER RANGE 0 TO stretch_count;
begin -- 
	if (rst = '1') then
		count := 0;
		iQn <= '1';
	elsif (rising_edge(CLK)) then
		if (iQn = '1') then 
			count := 0;
			if (Dn = '0') then 
				iQn <= '0';
			else
				iQn <= '1';
			end if;
		else -- (iQ = '0')
			if (Dn = '1') then
				count := count + 1;
				if (count = stretch_count) then
					iQn <= '1';
				else
					iQn <= '0';
				end if;
			else -- wait for Dn to go high
				count := 0;
				iQn <= '0';
			end if;
		end if;
	end if;
end process;

end a;
