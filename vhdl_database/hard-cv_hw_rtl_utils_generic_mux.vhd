----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    19:31:28 04/14/2012 
-- Design Name: 
-- Module Name:    generic_mux - Behavioral 
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
use work.generic_components.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity generic_mux is
	generic(NB_INPUTS : natural := 4 );
    Port ( s : in  STD_LOGIC_VECTOR(nbit(NB_INPUTS) - 1 downto 0);
           inputs : in  slv_array(0 to (NB_INPUTS - 1));
           output : out  STD_LOGIC_VECTOR(7 downto 0));
end generic_mux;

architecture Behavioral of generic_mux is
begin
	output <= inputs(to_integer(s));
end Behavioral;

