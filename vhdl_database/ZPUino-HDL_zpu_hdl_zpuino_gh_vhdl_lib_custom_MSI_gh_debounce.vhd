-----------------------------------------------------------------------------
--	Filename:	gh_debounce.vhd
--
--	Description:
--		 a line (or switch) de-bouncer
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


entity gh_debounce is 
	GENERIC (min_pw: integer :=1;
	         hold: integer :=10); -- 2 is min useful value
	port(
		CLK : in STD_LOGIC;
		rst : in STD_LOGIC;
		D   : in STD_LOGIC;
		Q   : out STD_LOGIC
		);
end entity;



architecture a of gh_debounce is  
	
	signal iQ : std_logic;
	signal iD : std_logic;
	signal HD : std_logic;
	
begin

	Q <= iQ; 

process(CLK,rst)	
	VARIABLE pw_count : INTEGER RANGE 0 TO min_pw;
begin -- 
	if (rst = '1') then
		pw_count := 0;
		iD <= '0';
	elsif (rising_edge(CLK)) then
		if (iD = D) then 
			pw_count := 0;
			iD <= iD;
		else -- (iD /= D)
			if (pw_count = min_pw) then
				pw_count := 0;
				iD <= D; 
			else -- wait for pw_count
				pw_count := pw_count + 1;
				iD <= iD; 	
			end if;
		end if;
	end if;
end process;
	
process(CLK,rst)	
	VARIABLE hold_count : INTEGER RANGE 0 TO (hold + 2);
begin -- 
	if (rst = '1') then
		hold_count := 2;
		iQ <= '0';
		HD <= '0';
	elsif (rising_edge(CLK)) then
		if (HD = '1') then 
			if (hold_count >= hold) then
				hold_count := 2;
				iQ <= iQ;
				HD <= '0'; 
			else
				hold_count := hold_count + 1;
				iQ <= iQ;
				HD <= '1'; 
			end if;
		else
			if (iQ = iD) then 
				hold_count := 2;
				iQ <= iQ;
				HD <= '0';
			else -- (iQ /= iD)
				hold_count := 2;
				iQ <= iD;
				HD <= '1'; -- start of hold 
			end if;
		end if;
	end if;
end process;

end a;
