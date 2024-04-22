entity tb_iassoc11 is
end tb_iassoc11;

library ieee;
use ieee.std_logic_1164.all;

architecture behav of tb_iassoc11 is
  signal a : natural;
  signal b : natural;
  signal res : natural;
begin
  dut: entity work.iassoc11
    port map (a, b, res);

  process
  begin
    a <= 1;
    b <= 5;
    wait for 1 ns;
    assert res = 6 severity failure;

    a <= 197;
    b <= 203;
    wait for 1 ns;
    assert res = 400 severity failure;

    wait;
  end process;
end behav;
