---------------------------------------------------------------------
--	Filename:	gh_fasm_1wp_2rp_r.vhd
--
--			
--	Description:
--		FASM (FPGA and ASIC Subset Model)
--		Synchronous write port, Asynchronous read with reset
--              
--	Copyright (c) 2007, 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 								 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	06/09/07  	S A Dodd 	Initial revision
--	1.1     	09/20/08  	hlefevre 	add simulation init
--	        	          	          	  (to '0') to ram data 
--	
--------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity gh_fasm_1wp_2rp_r is
	GENERIC (size_add: INTEGER :=8 ;
	         size_data: INTEGER :=8 );
	port (					
		clk   : in STD_LOGIC;
		rst   : in STD_LOGIC;
		WE    : in STD_LOGIC;
		A_add : in STD_LOGIC_VECTOR(size_add-1 downto 0);
		B_add : in STD_LOGIC_VECTOR(size_add-1 downto 0);
		D     : in STD_LOGIC_VECTOR (size_data-1 downto 0);
		A_Q   : out STD_LOGIC_VECTOR (size_data-1 downto 0);
		B_Q   : out STD_LOGIC_VECTOR (size_data-1 downto 0));
end entity;

architecture a of gh_fasm_1wp_2rp_r is

	type ram_mem_type is array ((2**size_add-1) downto 0) 
	        of STD_LOGIC_VECTOR (size_data-1 downto 0);
	signal ram_mem : ram_mem_type := (others => (others => '0')); 

begin

process (clk,rst)
begin  
	if (rst = '1') then
		for i in 0 to 2**size_add-1 loop
			ram_mem(i) <= (others => '0');
		end loop;
	elsif (rising_edge(clk)) then
		if (WE = '1') then
			ram_mem(CONV_INTEGER(A_add)) <= D;
		end if;
	end if;		
end process;

	A_Q <= ram_mem(CONV_INTEGER(A_add));
	B_Q <= ram_mem(CONV_INTEGER(B_add));
	
end architecture;
