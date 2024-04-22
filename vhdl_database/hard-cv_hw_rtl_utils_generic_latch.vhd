----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    20:17:12 04/14/2012 
-- Design Name: 
-- Module Name:    generic_latch - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity generic_latch is
	 generic(NBIT : positive := 8);
    Port ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
           sraz : in  STD_LOGIC;
           en : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR((NBIT - 1) downto 0);
           q : out  STD_LOGIC_VECTOR((NBIT - 1) downto 0));
end generic_latch;

architecture Behavioral of generic_latch is
signal Qp : std_logic_vector((NBIT - 1) downto 0);
begin

process(clk, resetn)
begin
if resetn = '0' then
	Qp <= (others => '0');
elsif clk'event and clk = '1' then
	if sraz = '1' then
		Qp <= (others => '0');
	elsif en = '1' then
		Qp <= d ;
	end if ;
end if ;
end process ;


q  <= Qp;


end Behavioral;

