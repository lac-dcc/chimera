-- Martin Aberg 2015

library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end;

architecture behav of testbench is
  -- Clock frequency is 4 MHz
  -- x GRMON -freq parameter is in MHz
  -- x To allow for some GPTIMER to tick at 1 us, at least some MHz are needed.
  constant CLK_PERIOD : time := 250 ns;

  signal clk  : std_logic := '0';
  signal rstn : std_logic := '0';

begin
  clk <= not clk after CLK_PERIOD/2;
  rstn <= '0', '1' after 40*CLK_PERIOD;

  d3 : entity work.leon3mp
    port map (rstn, clk);

end;

