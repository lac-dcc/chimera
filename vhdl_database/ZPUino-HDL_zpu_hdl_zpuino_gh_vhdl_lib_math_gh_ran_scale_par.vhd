---------------------------------------------------------------------
--	Filename:	gh_ran_scale_par.vhd
--
--
--	Description:
--		Scales a random number, uses a parallel multiplier
--		  data rate through put same as sample rate
--              
--	Copyright (c) 2008 by George Huber  
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 								 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	05/04/08  	h lefevre	Initial revision
--	
--------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

entity gh_ran_scale_par is 
	generic(size : INTEGER :=8 );
	port(
		clk    : in STD_LOGIC;
		Max    : in STD_LOGIC_VECTOR(size-1 downto 0);
		Min    : in STD_LOGIC_VECTOR(size-1 downto 0);
		random : in STD_LOGIC_VECTOR(size-1 downto 0);
		Sran   : out STD_LOGIC_VECTOR(size-1 downto 0)
		);
end entity;

architecture a of gh_ran_scale_par is


	signal scale  : STD_LOGIC_vector(size downto 0);
	signal iiSran : STD_LOGIC_vector(size*2 downto 0);
	signal iSran  : STD_LOGIC_vector(size downto 0);
	signal iRAND  : STD_LOGIC_vector(size-1 downto 0);
	
begin
	
process (clk)
begin
	if (rising_edge(clk)) then
		scale <= (Max & '1') - (Min & '0');	
		iRAND <= random; 
		iiSran <= scale * iRAND;
		iSran <= iiSran(2*size downto size) + x"1";
		Sran <= iSran(size downto 1) + Min;
	end if;		
end process;

end architecture;
