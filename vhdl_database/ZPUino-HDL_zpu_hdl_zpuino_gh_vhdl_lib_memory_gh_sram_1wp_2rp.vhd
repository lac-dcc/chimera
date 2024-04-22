---------------------------------------------------------------------
--	Filename:	gh_sram_1wp_2rp.vhd
--
--			
--	Description:
--		SRAM 1 write port, 2 read ports
--              
--	Copyright (c) 2005, 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 								 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	09/03/05  	G Huber  	Initial revision
--	2.0     	09/17/05  	h lefevre	name change to avoid conflict
--	        	          	         	  with other libraries
--	2.1      	05/21/06  	S A Dodd 	fix typo's
--	2.2     	09/20/08  	hlefevre 	add simulation init
--	        	          	          	  (to '0') to ram data 
--	
--------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity gh_sram_1wp_2rp is
	GENERIC (size_add: INTEGER :=8 ;
	         size_data: INTEGER :=8 );
	port (					
		A_clk  : in STD_LOGIC;
		B_clk  : in STD_LOGIC;
		WE     : in STD_LOGIC;
		A_add  : in STD_LOGIC_VECTOR(size_add-1 downto 0);
		B_add  : in STD_LOGIC_VECTOR(size_add-1 downto 0);
		D      : in STD_LOGIC_VECTOR (size_data-1 downto 0);
		A_Q    : out STD_LOGIC_VECTOR (size_data-1 downto 0);
		B_Q    : out STD_LOGIC_VECTOR (size_data-1 downto 0));
end entity;

architecture a of gh_sram_1wp_2rp is

	type ram_mem_type is array ((2**size_add-1) downto 0) 
	        of STD_LOGIC_VECTOR (size_data-1 downto 0);
	signal ram_mem : ram_mem_type := (others => (others => '0')); 
	signal iWR : STD_LOGIC;
	signal iA_add : STD_LOGIC_VECTOR(size_add-1 downto 0);
	signal iB_add : STD_LOGIC_VECTOR(size_add-1 downto 0);
	signal iD  : STD_LOGIC_VECTOR(size_data-1 downto 0);

begin

process (A_clk)
begin
	if (rising_edge(A_clk)) then
		if (iWR = '1') then
			ram_mem(CONV_INTEGER(iA_add)) <= iD;
		end if;
	end if;		
end process;

process (A_clk)
begin
	if (rising_edge(A_clk)) then
		iWR <= WE;
		iA_add <= A_add;
		iD <= D;
		A_Q <= ram_mem(CONV_INTEGER(iA_add));
	end if;		
end process;

process (B_clk)
begin
	if (rising_edge(B_clk)) then 
		iB_add <= B_add;
		B_Q <= ram_mem(CONV_INTEGER(iB_add));
	end if;		
end process;
	
end architecture;
