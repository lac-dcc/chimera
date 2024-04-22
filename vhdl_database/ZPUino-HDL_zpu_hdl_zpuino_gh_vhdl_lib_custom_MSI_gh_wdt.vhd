-----------------------------------------------------------------------------
--	Filename:	gh_wdt.vhd
--
--	Description:
--		watch dog timer
--
--	Copyright (c) 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	12/13/08   	h lefevre	Initial revision
--
-----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_signed.all;


entity gh_wdt is 
	GENERIC (ticks : integer :=1023); -- number of clock ticks Q <= '1'
	 port(
		 clk  : in STD_LOGIC;
		 rst  : in STD_LOGIC;
		 T_en : in STD_LOGIC:='1';
		 t    : in STD_LOGIC; -- either edge will reset count
		 Q    : out STD_LOGIC
	     );
end entity;


architecture a of gh_wdt is  

	signal it : std_logic;
	
begin
	
process(clk,rst)	
	VARIABLE count : INTEGER RANGE 1 TO ticks;
begin -- 
	if (rst = '1') then
		it <= '0';
		count := 1;
		Q <= '0';
	elsif (rising_edge(clk)) then
		it <= t;
		if (((it xor t) = '1') or (T_en = '0'))then 
			count := 1;
			Q <= '0';
		elsif (count = ticks) then
			count := count;
			Q <= '1';
		else 
			count := count + 1;
			Q <= '0';
		end if;
	end if;
end process;

end architecture;
