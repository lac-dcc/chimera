----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:29:06 03/24/2015 
-- Design Name: 
-- Module Name:    bof - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

entity bof is
port(
bi : inout std_logic;
dir : in std_logic;
sig_out : in std_logic;
sig_in : out std_logic);

end bof;

architecture Behavioral of bof is
begin
bi <= sig_out when dir = '1' else 'Z';
sig_in <= bi; 
end Behavioral;

