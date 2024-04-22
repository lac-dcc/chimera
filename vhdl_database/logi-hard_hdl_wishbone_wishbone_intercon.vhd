-- ----------------------------------------------------------------------
--LOGI-hard
--Copyright (c) 2013, Jonathan Piat, Michael Jones, All rights reserved.
--
--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 3.0 of the License, or (at your option) any later version.
--
--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
--Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public
--License along with this library.
-- ----------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.logi_wishbone_pack.all ;

entity wishbone_intercon is
generic(memory_map : array_of_addr );
port(
		-- Syscon signals
		gls_reset    : in std_logic ;
		gls_clk      : in std_logic ;
		
		
		-- Wishbone slave signals
		wbs_address       : in std_logic_vector(15 downto 0) ;
		wbs_writedata : in std_logic_vector(15 downto 0);
		wbs_readdata  : out std_logic_vector(15 downto 0);
		wbs_strobe    : in std_logic ;
		wbs_cycle      : in std_logic ;
		wbs_write     : in std_logic ;
		wbs_ack       : out std_logic;
		
		-- Wishbone master signals
		wbm_address       : out array_of_slv16((memory_map'length-1) downto 0) ;
		wbm_writedata : out array_of_slv16((memory_map'length-1) downto 0);
		wbm_readdata  : in array_of_slv16((memory_map'length-1) downto 0);
		wbm_strobe    : out std_logic_vector((memory_map'length-1) downto 0) ;
		wbm_cycle     : out std_logic_vector((memory_map'length-1) downto 0) ;
		wbm_write     : out std_logic_vector((memory_map'length-1) downto 0) ;
		wbm_ack       : in std_logic_vector((memory_map'length-1) downto 0)
		
);
end wishbone_intercon;

architecture Behavioral of wishbone_intercon is

signal cs_vector : std_logic_vector(0 to (memory_map'length-1));
signal ack_vector : std_logic_vector(0 to (memory_map'length-1));

begin


gen_cs : for i in 0 to (memory_map'length-1) generate
	
	cs_vector(i) <= '1' when wbs_address(wbs_address'length-1 downto find_X(memory_map(i))) = memory_map(i)(wbs_address'length-1 downto find_X(memory_map(i))) else
					    '0' ;
	ack_vector(i) <= wbm_ack(i) and cs_vector(i) ;	
	
	wbm_address(i)(wbs_address'length-1 downto find_X(memory_map(i))) <= (others => '0') ;
	wbm_address(i)(find_X(memory_map(i))-1 downto 0) <= wbs_address(find_X(memory_map(i))-1 downto 0) ;

	wbm_writedata(i) <= wbs_writedata ;
	wbm_write(i) <= wbs_write and cs_vector(i) ;
	wbm_strobe(i) <= wbs_strobe and cs_vector(i) ;
	wbm_cycle(i) <= wbs_cycle and cs_vector(i) ;
	
	wbs_readdata <= wbm_readdata(i) when cs_vector(i) = '1' else
						(others => 'Z') ;
	
end generate ;

wbs_ack <= '1' when ack_vector /= 0 else
			  '0' ;
wbs_readdata <= wbs_address when cs_vector = 0 else
					(others => 'Z') ;

end Behavioral;

