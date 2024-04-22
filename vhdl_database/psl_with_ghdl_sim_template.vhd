library ieee;
  use ieee.std_logic_1164.all;


entity tb___DUT__ is
end entity tb___DUT__;


architecture sim of tb___DUT__ is

  signal clk   : std_logic := '1';
  signal cycle : natural   := 0;

begin


  clk <= not clk after 500 ps;

  cycle <= cycle + 1 when rising_edge(clk);

  DUT : entity work.__DUT__(psl) port map (clk);


end architecture sim;
