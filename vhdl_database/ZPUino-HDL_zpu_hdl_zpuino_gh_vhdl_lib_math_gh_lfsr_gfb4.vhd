-------------------------------------------------------------------- 
--	Filename:	gh_lfsr_gfb4.vhd
--
--	Description:
--		a linear Feedback Shift Register with four feedback taps
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	10/04/05  	h lefevre	Initial revision
--	1.1      	10/16/05  	h lefevre	mod lfsr_cmp
--
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity gh_lfsr_gfb4 is
	GENERIC(size: INTEGER := 43; -- first feedback tap = size
	         fb2: INTEGER := 42; -- if feedback taps
	         fb3: INTEGER := 38;  --  are set to zero, that 
	         fb4: INTEGER := 37); --  tap will be null (not used)
	 port(
		CLK : in STD_LOGIC;
		rst : in STD_LOGIC;
		Q   : out STD_LOGIC_VECTOR(size downto 1)
	    );
end gh_lfsr_gfb4;


architecture a of gh_lfsr_gfb4 is  

	signal lfsr : STD_LOGIC_VECTOR(size downto 0);
	signal ld_v : STD_LOGIC_VECTOR(size downto 1);
	constant lfsr_cmp : STD_LOGIC_VECTOR(size downto 0) := (others => '0');
	signal load : STD_LOGIC;

begin

	Q <= lfsr(size downto 1);

	ld_v(size downto 2) <= (others => '0');
	ld_v(1) <= '1';
	
	load <= '1' when (lfsr = lfsr_cmp) else
	        '0';

	lfsr(0) <= '0'; -- so that feedback taps may be set to "do not use"
			
process(CLK,rst)
begin
	if (rst = '1') then
		lfsr(size downto 1) <= ld_v;
	elsif (rising_edge(CLK)) then
		if (load = '1') then
			lfsr(size downto 1) <= ld_v;
		else
			lfsr(1) <= (lfsr(size) xor lfsr(fb2)) xor (lfsr(fb3) xor lfsr(fb4));
			lfsr(size downto 2) <= lfsr(size-1 downto 1);
		end if;
	end if;
end process;

end a;
