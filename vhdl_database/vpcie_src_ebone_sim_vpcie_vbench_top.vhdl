library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity vbench_top is end vbench_top;

architecture vbench_top_arch of vbench_top is
 signal rst: std_ulogic;
 signal clk: std_ulogic;
begin

 rst_clk_entity:
 entity work.rst_clk
 port map
 (
  rst => rst,
  clk => clk
 );

 rashpa_top_entity:
 entity work.rashpa_top
 port map
 (
  rst => rst,
  clk => clk
 );

end vbench_top_arch;
