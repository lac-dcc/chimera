----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:39:25 09/01/2014 
-- Design Name: 
-- Module Name:    sseg - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sseg is
PORT(
clk,reset : in std_logic;
dp_in : in std_logic_vector(3 downto 0);
hex3,hex2,hex1,hex0 : in std_logic_vector(3 downto 0);
an : out std_logic_vector (3 downto 0);
seg : out std_logic_vector(0 to 7));
end sseg;

architecture arch of sseg is 
constant N:integer :=20;
signal q_reg,q_next : unsigned (N-1 downto 0);
signal hex : std_logic_vector(3 downto 0);
signal sel : std_logic_vector(1 downto 0);
signal dp : std_logic;
begin 
process (clk,reset)
begin
if(reset = '0')then 
q_reg <= (others => '0');
elsif(clk'event and clk='1')then
q_reg <= q_next;
end if;
end process;

q_next <= q_reg+1;
sel <= std_logic_vector(q_reg(N-1 downto N-2));

process (sel,hex0,hex1,hex2,hex3,dp_in)
begin
case sel is 
when "00" =>
an <= "1110";
hex <= hex0;
dp <= dp_in(0);
when "01" =>
an <= "1101";
hex <= hex1;
dp <= dp_in(1);
when "10" =>
an <= "1011";
hex <= hex2;
dp <= dp_in(2);
when others =>
an <= "0111";
hex <= hex3;
dp <= dp_in(3);
end case;
end process;

with hex select 

seg(0 to 6) <= 

"1111110" when "0000", -- 0
"0110000" when "0001", -- 1
"1101101" when "0010", -- 2
"1111001" when "0011", -- 3
"0110011" when "0100", -- 4
"1011011" when "0101", -- 5 
"1011111" when "0110", -- 6 
"1110000" when "0111", -- 7
"1111111" when "1000", -- 8
"1111011" when "1001", -- 9
"1110111" when "1010", -- a
"0011111" when "1011", -- b
"1001110" when "1100", -- c
"0111101" when "1101", -- d
"1001111" when "1110", -- e
"1000111" when others; -- f
seg(7) <= dp;
end arch;