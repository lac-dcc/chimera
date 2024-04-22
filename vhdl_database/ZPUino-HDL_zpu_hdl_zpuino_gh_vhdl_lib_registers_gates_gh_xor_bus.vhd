-------------------------------------------------------------------- 
--	Filename:	gh_xor_bus.vhd
--
--	Description:
--		a bussed xor gate	 
--
--	Copyright (c) 2005, 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	10/02/05  	h lefevre	Initial revision
--	1.1      	05/07/06  	h lefevre	fix typo
--
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity gh_xor_bus is
	generic(size: INTEGER := 8);
	port(
		A : in STD_LOGIC_VECTOR(size downto 1);
		B : in STD_LOGIC_VECTOR(size downto 1);
		Q : out STD_LOGIC_VECTOR(size downto 1)
		);
end gh_xor_bus;

architecture a of gh_xor_bus is  
	
begin

process(A,B)
begin
	for i in 1 to size loop
		Q(i) <= A(i) xor B(i);
	end loop;
end process;

end a;
