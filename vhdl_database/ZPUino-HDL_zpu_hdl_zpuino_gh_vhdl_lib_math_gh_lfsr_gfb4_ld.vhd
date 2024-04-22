-------------------------------------------------------------------- 
--	Filename:	gh_lfsr_gfb4_ld.vhd
--
--	Description:
--		a linear Feedback Shift Register with four feedback taps 
--		  with loadable seed
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	10/28/05  	h lefevre	Initial revision
--		 
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity gh_lfsr_gfb4_ld is
	GENERIC(size: INTEGER := 43; -- first feedback tap = size
	         fb2: INTEGER := 42; -- if feedback taps
	         fb3: INTEGER := 38;  --  are set to zero, that 
	         fb4: INTEGER := 37); --  tap will be null (not used)
	 port(
		CLK  : in STD_LOGIC;
		rst  : in STD_LOGIC;
		LOAD : in STD_LOGIC;
		seed : in STD_LOGIC_VECTOR(size downto 1); -- must be non zero!!!
		Q    : out STD_LOGIC_VECTOR(size downto 1)
	    );
end gh_lfsr_gfb4_ld;


architecture a of gh_lfsr_gfb4_ld is  

	signal lfsr : STD_LOGIC_VECTOR(size downto 0);
	signal ld_v : STD_LOGIC_VECTOR(size downto 1);

begin

	Q <= lfsr(size downto 1);

	ld_v <= seed;

	lfsr(0) <= '0'; -- so that feedback taps may be set to "do not use"
			
process(CLK,rst,ld_v)
begin
	if (rst = '1') then
		lfsr(size downto 1) <= ld_v;
	elsif (rising_edge(CLK)) then
		if (LOAD = '1') then
			lfsr(size downto 1) <= ld_v;
		else
			lfsr(1) <= (lfsr(size) xor lfsr(fb2)) xor (lfsr(fb3) xor lfsr(fb4));
			lfsr(size downto 2) <= lfsr(size-1 downto 1);
		end if;
	end if;
end process;

end a;
