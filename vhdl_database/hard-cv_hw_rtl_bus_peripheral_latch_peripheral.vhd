----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    14:26:11 12/18/2012 
-- Design Name: 
-- Module Name:    latch_peripheral - Behavioral 
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

library work ;
use work.utils_pack.all ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity latch_peripheral is
generic(ADDR_WIDTH : positive := 8; WIDTH	: positive := 16);
port(
	clk, resetn : in std_logic ;
	addr_bus : in std_logic_vector((ADDR_WIDTH - 1) downto 0);
	wr_bus, rd_bus, cs_bus : in std_logic ;
	data_bus_in	: in std_logic_vector((WIDTH - 1) downto 0); -- bus interface
	data_bus_out	: out std_logic_vector((WIDTH - 1) downto 0); -- bus interface
	latch_default : in  std_logic_vector((WIDTH - 1) downto 0); 
	latch_input : in  std_logic_vector((WIDTH - 1) downto 0);
	latch_output :out  std_logic_vector((WIDTH - 1) downto 0)
);
end latch_peripheral;

architecture Behavioral of latch_peripheral is
signal inputq, outputq : std_logic_vector((WIDTH - 1) downto 0);
begin

process(clk, resetn)
begin
	if resetn = '0' then
		inputq <= (others => '0');
	elsif clk'event and clk = '1' then
			inputq <= latch_input ;
	end if ;
end process; 
data_bus_out <= inputq when cs_bus = '1' else
					 (others => '1');

process(clk, resetn)
begin
	if resetn = '0' then
		outputq <= latch_default;
	elsif clk'event and clk = '1' then
		if wr_bus = '1' and cs_bus = '1' then
			outputq <= data_bus_in ;
		end if ;
	end if ;
end process; 
latch_output <= outputq;

end Behavioral;

