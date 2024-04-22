-----------------------------------------------------------------------------
--	Filename:	gh_stretch_programmable.vhd
--
--	Description:
--		programmable pulse stretcher
--
--	Copyright (c) 2008, 2009 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--	
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	09/20/08   	hlefevre	Initial revision
--	1.1			01/15/09	jguerrero	Added path for "0" stretch(line 51)
--										improved readability(line 57)
--
-----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity gh_stretch_programmable is
	generic (size : INTEGER := 8);
	port(
		CLK     : in STD_LOGIC;
		rst     : in STD_LOGIC;
		D       : in STD_LOGIC;
		stretch : in STD_LOGIC_VECTOR(size-1 downto 0);
		Q       : out STD_LOGIC
		);
END entity;

architecture a of gh_stretch_programmable is

	signal count  : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	constant zero : STD_LOGIC_VECTOR(size-1 DOWNTO 0):= (others => '0');
	
begin
		

process(clk,rst)
begin
	if (rst = '1') then 
		count <= (others => '0');
		Q <= '0';
	elsif (rising_edge(clk)) then
		if( stretch = zero ) then
			Q <= D;
		else
			if (D = '1') then
				count <= stretch;
				Q <= '1';
			elsif (count /= zero) then
				count <= count - "01";
				Q <= '1';
			else
				Q <= '0';
			end if;
		end if;	
	end if;
end process;
		
end architecture;
