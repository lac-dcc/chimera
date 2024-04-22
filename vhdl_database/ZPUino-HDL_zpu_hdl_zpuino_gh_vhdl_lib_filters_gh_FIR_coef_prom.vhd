---------------------------------------------------------------------
--	Filename:	gh_FIR_coef_prom.vhd
--			
--	Description:
--		Coefficient prom for 16th order FIR Equiripple filter
--		  Fs = 100 MHz, Fpass = 10 MHz, Fstop = 20 MHz
--
--	Copyright (c) 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	05/13/06  	S A Dodd 	Initial revision
--	
------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity gh_FIR_coef_prom is
	port (
		CLK : in std_logic;
		ADD : in std_logic_vector(3 downto 0);
		Q : out std_logic_vector(15 downto 0)
	);
end entity;


architecture a of gh_FIR_coef_prom is

	signal iADD :  STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal iQ :  STD_LOGIC_VECTOR(15 DOWNTO 0);

begin

PROCESS (CLK)
BEGIN
	if (rising_edge(clk)) then
		iADD <= ADD;
	end if;
END PROCESS;

PROCESS (CLK)
BEGIN
	if (rising_edge (clk)) then
		Q <= iQ;
	end if;
END PROCESS;

process(iADD)
begin
    case (iADD) is
          when x"0" => iQ <= x"0220"; 
          when x"1" => iQ <= x"ff1b"; 
          when x"2" => iQ <= x"fba5"; 
          when x"3" => iQ <= x"f9ca"; 
          when x"4" => iQ <= x"fe2a"; 
          when x"5" => iQ <= x"0a4d"; 
          when x"6" => iQ <= x"19fb"; 
          when x"7" => iQ <= x"2511"; 
          when x"8" => iQ <= x"2511"; 
          when x"9" => iQ <= x"19fb"; 
          when x"A" => iQ <= x"0a4d"; 
          when x"B" => iQ <= x"fe2a"; 
          when x"C" => iQ <= x"f9ca"; 
          when x"D" => iQ <= x"fba5"; 
          when x"E" => iQ <= x"ff1b"; 
		  when others => iQ <= x"0220"; 
	end case;
end process;

end architecture;
