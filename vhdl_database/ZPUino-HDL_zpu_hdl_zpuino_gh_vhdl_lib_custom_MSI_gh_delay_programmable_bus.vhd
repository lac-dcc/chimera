-----------------------------------------------------------------------------
--	Filename:	gh_delay_programmable_bus.vhd
--
--	Description:
--		a bussed, programmable delay line
--		uses generics for data size and delay time 
--		        (address size for a 2 clock RAM - min delay is 3 clocks)
--
--	Copyright (c) 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	05/27/08   	G Huber 	Initial revision
--
-----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity gh_delay_programmable_bus is
	GENERIC (size_data : INTEGER := 8;
	         size_add : INTEGER := 8);
	port(
		CLK   : in STD_LOGIC;
		rst   : in STD_LOGIC;
		D     : in STD_LOGIC_VECTOR(size_data-1 DOWNTO 0);
		DELAY : in STD_LOGIC_VECTOR(size_add-1 downto 0);
		Q     : out STD_LOGIC_VECTOR(size_data-1 DOWNTO 0)
		);
END entity;

architecture a of gh_delay_programmable_bus is

	type ram_mem_type is array ((2**size_add-1) downto 0) 
	        of STD_LOGIC_VECTOR (size_data-1 downto 0);
	signal ram_mem : ram_mem_type; 
	signal iD      : STD_LOGIC_VECTOR (size_data-1 downto 0);
	signal w_add   : STD_LOGIC_VECTOR(size_add-1 DOWNTO 0);
	signal iw_add  : STD_LOGIC_VECTOR(size_add-1 DOWNTO 0);
	signal r_add   : STD_LOGIC_VECTOR(size_add-1 DOWNTO 0);
	signal ir_add  : STD_LOGIC_VECTOR(size_add-1 DOWNTO 0);
	
begin
		
process (clk)
begin
	if (rising_edge(clk)) then
		iD <= D;
		iw_add <= w_add;
		ram_mem(CONV_INTEGER(iw_add)) <= iD;
		ir_add <= r_add;
		Q <= ram_mem(CONV_INTEGER(ir_add));
	end if;		
end process;

process(clk,rst)
begin
	if (rst = '1') then 
		w_add <= (others => '0');
		r_add <= (others => '0');
	elsif (rising_edge(clk)) then
		w_add <= w_add + "01";
		r_add <= w_add - DELAY;
	end if;
end process;
		
end architecture;
