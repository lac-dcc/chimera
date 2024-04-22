library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_onehot is
  port (
    clk : in std_logic
  );
end entity psl_onehot;


architecture psl of psl_onehot is

  signal a, b : std_logic_vector(3 downto 0);

begin


  --                                  012345678901234
  SEQ_A : hex_sequencer generic map ("111222444888888") port map (clk, a);
  SEQ_B : hex_sequencer generic map ("111222444888999") port map (clk, b);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  ONEHOT_0_a : assert always onehot(a);

  -- This assertion fails at cycle 12
  ONEHOT_1_a : assert always onehot(b);

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 15);
  -- synthesis translate_on


end architecture psl;
