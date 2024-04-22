library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_clks is
end tb_clks;

architecture Behavioral of tb_clks is

signal clk_100m	: std_logic := '0';
signal s1_100	: std_logic := '0';
signal s1_133	: std_logic := '0';
signal clk_133m	: std_logic := '0';

constant c_clk100mperiod	: time := 10 ns;
constant c_clk133mperiod	: time := 7.5 ns;

begin

P_CLK100MGEN : process begin
clk_100m	<= '0';
wait for c_clk100mperiod/2;
clk_100m <= '1';
wait for c_clk100mperiod/2;
end process P_CLK100MGEN;

P_CLK133MGEN : process begin
clk_133m	<= '0';
wait for c_clk133mperiod/2;
clk_133m 	<= '1';
wait for c_clk133mperiod/2;
end process P_CLK133MGEN;

P_STIMULI : process begin

wait for 100 ns;

wait until rising_edge(clk_100m);
s1_100	<= not s1_100;
wait for c_clk100mperiod*5;
s1_100	<= not s1_100;
wait until rising_edge(clk_133m);
s1_133	<= not s1_133;
wait for c_clk133mperiod*5;
s1_133	<= not s1_133;
wait for 100 ns;

assert false
report "SIM DONE"
severity failure;

end process P_STIMULI;


end Behavioral;