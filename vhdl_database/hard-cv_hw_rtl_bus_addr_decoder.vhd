----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    10:04:35 06/19/2012 
-- Design Name: 
-- Module Name:    addr_decoder - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 6 
-- Tool versions: ISE 14.1 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addr_decoder is
generic(ADDR_WIDTH	: positive := 16 ; BASE_ADDR	: natural := 0 ; ADDR_OUT_WIDTH	: positive	:= 2);
port(addr_bus_in	: in	std_logic_vector((ADDR_WIDTH - 1) downto 0 );
	  addr_bus_out	:	out std_logic_vector((ADDR_OUT_WIDTH - 1) downto 0 );
	  cs	:	out std_logic
);	
end addr_decoder;

architecture Behavioral of addr_decoder is
constant std_base_addr : std_logic_vector((ADDR_WIDTH - 1)  downto 0 ) :=  std_logic_vector(to_unsigned(BASE_ADDR, ADDR_WIDTH));
begin

				 
cs <= '1' when  addr_bus_in((ADDR_WIDTH - 1) downto ADDR_OUT_WIDTH) = std_base_addr((ADDR_WIDTH - 1) downto ADDR_OUT_WIDTH)  else
		'0';


addr_bus_out <= addr_bus_in((ADDR_OUT_WIDTH - 1) downto 0) ;


end Behavioral;

