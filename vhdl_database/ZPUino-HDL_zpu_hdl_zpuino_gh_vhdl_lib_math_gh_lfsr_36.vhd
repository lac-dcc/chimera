-------------------------------------------------------------------- 
--	Filename:	gh_lfsr_36.vhd
--
--	Description:
--		a 36 bit linear Feedback Shift Register	 
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	09/17/05  	h lefevre	Initial revision
--
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity gh_lfsr_36 is
	 port(
		CLK : in STD_LOGIC;
		rst : in STD_LOGIC;
		Q   : out STD_LOGIC_VECTOR(36 downto 1)
	    );
end gh_lfsr_36;


architecture a of gh_lfsr_36 is  

	signal lfsr : STD_LOGIC_VECTOR(36 downto 1);
	signal load : STD_LOGIC;

begin

	Q <= lfsr;

	load <= '1' when (lfsr = x"000000000") else
	        '0';

process(CLK,rst)
begin
	if (rst = '1') then
		lfsr(36 downto 2) <= (others => '0');
		lfsr(1) <= '1';
	elsif (rising_edge(CLK)) then
		if (load = '1') then
			lfsr <= x"000000001";
		else
			lfsr(1) <= (lfsr(36) xor lfsr(25));
			lfsr(36 downto 2) <= lfsr(35 downto 1);
		end if;
	end if;
end process;

end a;
