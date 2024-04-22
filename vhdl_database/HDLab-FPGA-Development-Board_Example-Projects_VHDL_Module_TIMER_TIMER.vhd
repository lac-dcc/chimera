library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is 
generic (N:integer :=32);
PORT( 
clk,reset: in std_logic;
Q : out std_logic_vector(N-1 downto 0)
);
end timer;

architecture arch of timer is 
signal r_reg : unsigned (N-1 downto 0);
signal n_reg : unsigned (N-1 downto 0);
begin
process(clk,reset)
begin 
if (reset='0')then
r_reg <=(others =>'0');
elsif (clk'event and clk='1')then
r_reg <= n_reg;
end if;
end process;
n_reg <= r_reg+1;
Q <= std_logic_vector(r_reg);
end arch;