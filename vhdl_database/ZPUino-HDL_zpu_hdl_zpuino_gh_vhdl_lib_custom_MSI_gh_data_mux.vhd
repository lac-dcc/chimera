-----------------------------------------------------------------------------
--	Filename:	gh_data_mux.vhd
--
--	Description:
--		A Data mux - the output data has twice the rate 
--		of the input data, with half the data bits.
--		Da is the 1st data sample, Db is the 2nd
--
--	Copyright (c) 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	--------	--------	---------	-----------
--	1.0     	06/01/08  	S A Dodd 	Initial Revision
--
-----------------------------------------------------------------------------

library ieee ;
use ieee.std_logic_1164.all ;

entity gh_data_mux is 
	GENERIC (size: INTEGER := 16);
	port(
		clk_2x    : in std_logic;
		rst       : in std_logic;
		mux_cnt   : in std_logic;
		Da        : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Db        : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);		
		Q         : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end entity;

architecture a of gh_data_mux is

	signal iqa, iqb    : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	
begin

process (clk_2x,rst)
begin
	if (rst = '1') then
		iqa <= (others => '0');
		iqb <= (others => '0'); 
		Q <= (others => '0');
	elsif (rising_edge(clk_2x)) then
		if (mux_cnt = '1') then
			iqa <= Da;
			iqb <= Db;
			Q <= iqb;
		else
			Q <= iqa;
		end if;
	end if;
end process;

end architecture;
