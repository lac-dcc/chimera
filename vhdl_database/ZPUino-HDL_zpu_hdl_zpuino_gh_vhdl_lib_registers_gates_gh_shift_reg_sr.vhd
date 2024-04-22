-----------------------------------------------------------------------------
--	Filename:	gh_shift_reg_sr.vhd
--
--	Description:
--		a shift register with async and sync reset/preset
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	10/01/05  	G Huber 	Initial revision
--
-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY gh_shift_reg_sr IS
	GENERIC (size: INTEGER := 16;
	         make_reset_preset: boolean := false); 
	PORT(
		clk      : IN STD_logic;
		rst      : IN STD_logic;
		srst     : IN STD_logic;
		D        : IN STD_LOGIC;
		Q        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END gh_shift_reg_sr ;

ARCHITECTURE a OF gh_shift_reg_sr IS

	signal iQ :  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal rs : STD_logic;
	
BEGIN
 
	Q <= iQ;
	
	rs <= '1' when (make_reset_preset = true) else
	      '0';	

process(clk,rst)
begin
	if (rst = '1') then 
		iQ <= (others => rs);
	elsif (rising_edge(clk)) then
		if (srst = '1') then 
			iQ <= (others => rs);
		else
			iQ(0) <= D;
			iQ(size-1 downto 1) <= iQ(size-2 downto 0);
		end if;
	end if;
end process;


END a;

