---------------------------------------------------------------------
--	Filename:	gh_4byte_dpram_x16_be.vhd
--
--			
--	Description:
--		4 byte write port, 2nd read port 16 bits - big endian
--		SRAM 1 write port, 2 read ports	
--		Single clock write/read data
--              
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 								 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	10/21/07  	G Huber  	Initial revision
--	
--------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity gh_4byte_dpram_x16_be is
	GENERIC (size_add: INTEGER :=8); -- size of 2nd port read address bus
	port (					
		A_clk  : in STD_LOGIC;
		B_clk  : in STD_LOGIC;
		CSn	   : in STD_LOGIC;
		WE     : in STD_LOGIC;
		BE     : in STD_LOGIC_VECTOR(3 downto 0);
		A_add  : in STD_LOGIC_VECTOR(size_add-2 downto 0);
		B_add  : in STD_LOGIC_VECTOR(size_add-1 downto 0);
		D      : in STD_LOGIC_VECTOR(31 downto 0);
		A_Q    : out STD_LOGIC_VECTOR(31 downto 0);
		B_Q    : out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture a of gh_4byte_dpram_x16_be is

	type ram_mem_type is array ((2**size_add-1) downto 0) 
	        of STD_LOGIC_VECTOR (7 downto 0);
	signal mem0, mem1, mem2, mem3 : ram_mem_type; 

	signal iBQ  : STD_LOGIC_VECTOR(31 downto 0);
	signal ADD0 : STD_LOGIC;
	
begin

process (A_clk)
begin
	if (rising_edge(A_clk)) then
		A_Q(31 downto 24) <= mem3(CONV_INTEGER(A_add));
		A_Q(23 downto 16) <= mem2(CONV_INTEGER(A_add));
		A_Q(15 downto 8) <= mem1(CONV_INTEGER(A_add));
		A_Q(7 downto 0) <= mem0(CONV_INTEGER(A_add));
	---------------------------------------------------------------
		if ((CSn = '0') and (WE = '1') and (BE(3) = '1')) then
			mem3(CONV_INTEGER(A_add)) <= D(31 downto 24);
		end if;
	---------------------------------------------------------------
		if ((CSn = '0') and (WE = '1') and (BE(2) = '1')) then
			mem2(CONV_INTEGER(A_add)) <= D(23 downto 16);
		end if;
	---------------------------------------------------------------
		if ((CSn = '0') and (WE = '1') and (BE(1) = '1')) then
			mem1(CONV_INTEGER(A_add)) <= D(15 downto 8);
		end if;
	---------------------------------------------------------------
		if ((CSn = '0') and (WE = '1') and (BE(0) = '1')) then
			mem0(CONV_INTEGER(A_add)) <= D(7 downto 0);
		end if;
	---------------------------------------------------------------
	end if;		
end process;

process (B_clk)
begin
	if (rising_edge(B_clk)) then 
		ADD0 <= B_add(0);
		iBQ(31 downto 24) <= mem3(CONV_INTEGER(B_add(size_add-1 downto 1)));
		iBQ(23 downto 16) <= mem2(CONV_INTEGER(B_add(size_add-1 downto 1)));
		iBQ(15 downto 8) <= mem1(CONV_INTEGER(B_add(size_add-1 downto 1)));
		iBQ(7 downto 0) <= mem0(CONV_INTEGER(B_add(size_add-1 downto 1)));
	end if;		
end process;

	B_Q <= iBQ(31 downto 16) when (ADD0 = '0') else
	       iBQ(15 downto 0);

end architecture;
