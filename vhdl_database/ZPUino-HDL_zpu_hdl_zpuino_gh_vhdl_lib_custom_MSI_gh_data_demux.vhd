-----------------------------------------------------------------------------
--	Filename:	gh_data_demux.vhd
--
--	Description:
--		A Data demux - the output data has half the rate 
--		of the input data, with twice the data bits.
--		Qa is the 1st data sample, Qb is the 2nd
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

entity gh_data_demux is 
	GENERIC (size: INTEGER := 16);
	port(
		clk_2x    : in std_logic;
		clk_1x    : in std_logic;
		rst       : in std_logic;
		mux_cnt   : in std_logic;
		D         : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Qa        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0);		
		Qb        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end entity;

architecture a of gh_data_demux is


	signal id0, id1    : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal iqa, iqb    : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	
begin

process (clk_1x,rst)
begin
	if (rst = '1') then
		Qa <= (others => '0');
		Qb <= (others => '0');
	elsif (rising_edge(clk_1x)) then
		Qa <= iqa;
		Qb <= iqb;
	end if;
end process;

process (clk_2x,rst)
begin
	if (rst = '1') then
		id0 <= (others => '0');
		id1 <= (others => '0');
		iqa <= (others => '0');
		iqb <= (others => '0'); 
	elsif (rising_edge(clk_2x)) then
		id0 <= id1;
		id1 <= D;
		if (mux_cnt = '1') then
			iqa <= id0;
			iqb <= id1;
		end if;
	end if;
end process;

end architecture;
