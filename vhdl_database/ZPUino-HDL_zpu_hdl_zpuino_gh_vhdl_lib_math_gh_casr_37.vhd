-------------------------------------------------------------------- 
--	Filename:	gh_casr_37.vhd
--
--	Description:
--		a 37 bit Cellular Automata Shift Register	 
--
--	Copyright (c) 2005, 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	10/02/05  	h lefevre	Initial revision
--	1.1      	05/24/08  	h lefevre	use iload in process in place of load
--	        	          	         	  (an oops pointed out by Neal Galbo)
--
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity gh_casr_37 is 
	port(
		CLK  : in STD_LOGIC;
		rst  : in STD_LOGIC;
		load : in STD_LOGIC := '0';
		seed : in STD_LOGIC_VECTOR(37 DOWNTO 1) := "1111110000001111110000001111110001101";
		Q    : out STD_LOGIC_VECTOR(37 downto 1)
	    );
end gh_casr_37;


architecture a of gh_casr_37 is  

	signal casr : STD_LOGIC_VECTOR(37 downto 1);
	signal iload : STD_LOGIC;
	constant high : INTEGER := 37; 
	
begin

	Q <= casr;

	iload <= '1' when (load = '1') else
             '1' when (casr = "0000000000000000000000000000000000000") else
	         '0';

process(CLK,rst)
begin
	if (rst = '1') then
		casr <= seed;
	elsif (rising_edge(CLK)) then
		if (iload = '1') then
			casr <= seed;
		else
			for i in 1 to high loop
				if (i = 1) then
					casr(i) <= casr(i+1) xor casr(high);
				elsif (i = high) then
					casr(i) <= casr(1) xor casr(i-1);
				elsif (i = 28) then
					casr(i) <= casr(i-1) xor casr(i) xor casr(i+1);
				else
					casr(i) <= casr(i-1) xor casr(i+1);
				end if; 
			end loop;
		end if;
	end if;
end process;

end a;
