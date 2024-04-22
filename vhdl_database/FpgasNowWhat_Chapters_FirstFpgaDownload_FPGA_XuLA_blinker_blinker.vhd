----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:43 06/22/2011 
-- Design Name: 
-- Module Name:    blinker - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blinker is
    Port ( clk_i : in  STD_LOGIC;
           blinker_o : out  STD_LOGIC);
end blinker;

architecture Behavioral of blinker is
signal cnt_r : std_logic_vector(22 downto 0) := (others=>'0');
begin

process(clk_i) is
begin
  if rising_edge(clk_i) then
    cnt_r <= cnt_r + 1;
  end if;  
end process;

blinker_o <= cnt_r(22);

end Behavioral;

