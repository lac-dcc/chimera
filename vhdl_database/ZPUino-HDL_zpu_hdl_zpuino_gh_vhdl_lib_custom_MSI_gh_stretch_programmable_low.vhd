-----------------------------------------------------------------------------
--	Filename:	gh_stretch_programmable_low.vhd
--
--	Description:
--		programmable pulse (active low) stretcher 
--
--	Copyright (c) 2008, 2009 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--	
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	09/20/08   	hlefevre	Initial revision
--	1.1      	01/17/09   	hlefevre	mod to match changes made by jguerrero 
--	         	          	        	   to gh_stretch_programmable.vhd
--	         	          	        	   to solve implementation problem
--
-----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity gh_stretch_programmable_low is
	GENERIC (size : INTEGER := 8);
	port(
		CLK     : in STD_LOGIC;
		rst     : in STD_LOGIC;
		Dn      : in STD_LOGIC;
		stretch : in STD_LOGIC_VECTOR(size-1 downto 0);
		Qn      : out STD_LOGIC
		);
END entity;

architecture a of gh_stretch_programmable_low is


	signal count  : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	constant zero : STD_LOGIC_VECTOR(size-1 DOWNTO 0):= (others => '0');
	
begin
		

process(clk,rst)
begin
	if (rst = '1') then 
		count <= (others => '0');
		Qn <= '1';
	elsif (rising_edge(clk)) then
		if( stretch = zero ) then
			Qn <= Dn;
		else
			if (Dn = '0') then
				count <= stretch;
				Qn <= '0';
			elsif (count /= zero) then
				count <= count - "01";
				Qn <= '0';
			else
				Qn <= '1';
			end if;
		end if;
	end if;
end process;
		
end architecture;
