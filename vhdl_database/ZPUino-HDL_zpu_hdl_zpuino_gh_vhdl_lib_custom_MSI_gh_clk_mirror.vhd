-----------------------------------------------------------------------------
--	Filename:	gh_clk_mirror.vhd
--
--	Description:
--		In systems with 1x and 2x clocks, will create a 
--		logic "mirror" of the lower rate clock.
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

entity gh_clk_mirror is 
	port(
		clk_2x    : in std_logic;
		clk_1x    : in std_logic;
		rst       : in std_logic;
		mirror    : out std_logic		
		);
end entity;

architecture a of gh_clk_mirror is

	signal hclk      : std_logic;
	signal q0, q1    : std_logic;
	
begin

process (clk_1x,rst)
begin
	if (rst = '1') then
		hclk <= '0';
	elsif (rising_edge(clk_1x)) then
		hclk <= (not hclk);
	end if;
end process;

process (clk_2x,rst)
begin
	if (rst = '1') then
		q0 <= '0';
		q1 <= '0';
		mirror <= '0';
	elsif (rising_edge(clk_2x)) then
		q0 <= hclk;
		q1 <= q0;
		mirror <= q0 xor q1;
	end if;
end process;

end architecture;
