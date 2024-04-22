library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity tb is
end entity;

architecture sim of tb is

  constant PERIOD: time := 20 ns;
  signal clk: std_logic := '0';

begin

  clk <= not clk after PERIOD / 2;


  uut: entity work.coreep4ce6_top
  port map (
    CLK         => clk,
    SPI_MISO    => '1',
    RXD         => '1'
  );

end sim;
