----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:03:48 08/31/2014 
-- Design Name: 
-- Module Name:    DFF - Behavioral 
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

entity DFF is
PORT (
 D:  in std_logic_vector(7 downto 0);
 Q:  out std_logic_vector(7 downto 0);
 clk: in std_logic;
 reset: in std_logic;
 rx_done_tick : in std_logic );
end DFF;

architecture Behavioral of DFF is

begin
process (clk,reset,rx_done_tick)
begin 
if reset = '0' then
Q <= (others=>'0');
elsif(clk'event and clk='1') then 
if rx_done_tick = '1' then
Q <= D;
end if;
end if;
end process;


end Behavioral;

