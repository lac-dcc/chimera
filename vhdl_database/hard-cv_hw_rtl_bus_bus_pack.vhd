--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package bus_pack is

component addr_decoder is
generic(ADDR_WIDTH	: positive := 16 ; BASE_ADDR	: natural := 0 ; ADDR_OUT_WIDTH	: positive	:= 2);
port(addr_bus_in	: in	std_logic_vector((ADDR_WIDTH - 1) downto 0 );
	  addr_bus_out	:	out std_logic_vector((ADDR_OUT_WIDTH - 1) downto 0 );
	  cs	:	out std_logic
);	
end component;

end bus_pack;

package body bus_pack is

 
end bus_pack;
