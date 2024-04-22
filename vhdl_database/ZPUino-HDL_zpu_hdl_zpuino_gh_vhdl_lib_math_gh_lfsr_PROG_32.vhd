-------------------------------------------------------------------- 
--	Filename:	gh_lfsr_PROG_32.vhd
--
--	Description:
--		a linear Feedback Shift Register with four feedback taps
--
--	Copyright (c) 2005, 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	10/23/05  	G Huber  	Initial revision
--	1.1      	09/03/07  	G Huber  	fix 3 tap feedback (thanks to Neal Galbo)
--
-----------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity gh_lfsr_PROG_32 is
	 port(
		CLK  : in STD_LOGIC;
		rst  : in STD_LOGIC;	
		LOAD : in STD_LOGIC;
		TAPS : in STD_LOGIC_VECTOR(1 downto 0):= "11"; 
		  -- value for fb inputs: feedback tap-1
		fb1  : in STD_LOGIC_VECTOR(4 downto 0):= "11111";
		fb2  : in STD_LOGIC_VECTOR(4 downto 0):= "10111";
		fb3  : in STD_LOGIC_VECTOR(4 downto 0):= "00001";
		fb4  : in STD_LOGIC_VECTOR(4 downto 0):= "00000";
		D    : in STD_LOGIC_VECTOR(32 downto 1):= x"00000001";
		Q    : out STD_LOGIC_VECTOR(32 downto 1)
	    );
end gh_lfsr_PROG_32;


architecture a of gh_lfsr_PROG_32 is  

	signal lfsr : STD_LOGIC_VECTOR(31 downto 0);
	constant lfsr_cmp : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal iload : STD_LOGIC;
	signal feedback : STD_LOGIC;

begin

	Q <= lfsr(31 downto 0);

	iLOAD <= '1' when (LOAD = '1') else
	         '1' when (lfsr = lfsr_cmp) else
	         '0';

	feedback <= (lfsr(CONV_INTEGER(fb1))) when (TAPS = "00") else
	            (lfsr(CONV_INTEGER(fb1)) xor lfsr(CONV_INTEGER(fb2))) 
	               when (TAPS = "01") else
	            ((lfsr(CONV_INTEGER(fb1)) xor lfsr(CONV_INTEGER(fb2))) 
	               xor (lfsr(CONV_INTEGER(fb3))))  when (TAPS = "10") else -- 09/03/07
	            ((lfsr(CONV_INTEGER(fb1)) xor lfsr(CONV_INTEGER(fb2))) 
			       xor (lfsr(CONV_INTEGER(fb3)) xor lfsr(CONV_INTEGER(fb4))));
			 
process(CLK,rst,D)
begin
	if (rst = '1') then
		lfsr <= D;
	elsif (rising_edge(CLK)) then 
		if (iLOAD = '1') then
			lfsr <= D;
		else
			lfsr(0) <= feedback;
			lfsr(31 downto 1) <= lfsr(30 downto 0);
		end if;
	end if;
end process;

end a;
