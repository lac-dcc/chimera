---------------------------------------------------------------------
--	Filename:	gh_FIR_pcoef_prom.vhd
--			
--	Description:
--		Sample Coefficient set for gh_FIR_pfilter.vhd
--
--		prom for 16th order FIR Equiripple filter
--		  Fs = 100 MHz, Fpass = 10 MHz, Fstop = 20 MHz
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	02/03/07  	H LeFevre	Initial revision
--	
------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity gh_FIR_pcoef_prom is
	port (
		Q : out std_logic_vector(127 downto 0)
	);
end entity;


architecture a of gh_FIR_pcoef_prom is


begin


	Q <= x"251119fb0a4dfe2af9cafba5ff1b0220"; 


end architecture;
