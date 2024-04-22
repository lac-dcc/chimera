-- Listing 9.2
library ieee;
use ieee.std_logic_1164.all;
entity ps2_rxtx is
   port (
      clk, reset: in std_logic;
      wr_ps2: std_logic;
      din: in std_logic_vector(7 downto 0);
      dout: out std_logic_vector(7 downto 0);
      rx_done_tick: out  std_logic;
      tx_done_tick: out std_logic;
      ps2d, ps2c: inout std_logic
   );
end ps2_rxtx;

architecture arch of ps2_rxtx is
   signal tx_idle: std_logic;
begin
   ps2_tx_unit: entity work.ps2_tx(arch)
      port map(clk=>clk, reset=>reset, wr_ps2=>wr_ps2,
               din=>din, ps2d=>ps2d, ps2c=>ps2c,
               tx_idle=>tx_idle, tx_done_tick=>tx_done_tick);
   ps2_rx_unit: entity work.ps2_rx(arch)
      port map(clk=>clk, reset=>reset, rx_en=>tx_idle,
               ps2d=>ps2d, ps2c=>ps2c,
               rx_done_tick=>rx_done_tick, dout=>dout);
end arch;