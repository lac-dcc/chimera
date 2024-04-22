----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:35 09/03/2014 
-- Design Name: 
-- Module Name:    TIMERBR - Behavioral 
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
use ieee.numeric_std.all;

entity I2C_CLK is
generic(
N :integer := 9;
M :integer := 480);
PORT(
clk,reset: in std_logic;
max_tick: out std_logic;
clk_out : out std_logic);

end I2C_CLK;

architecture arch of I2C_CLK is
signal r_next : unsigned (N-1 downto 0);
signal r_reg : unsigned (N-1 downto 0);
begin
process (clk,reset)
begin
if(reset= '0')then 
r_reg <= (others => '0');
elsif(clk'event and clk='1')then
r_reg <= r_next;
end if;
end process;
r_next <= (others => '0') when r_reg = (M-1) else r_reg+1;
max_tick <= '1' when r_reg = (M-1) else '0';
clk_out <= '0' when r_reg < (M/2) else '1';  
end arch;