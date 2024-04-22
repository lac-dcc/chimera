library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_logical_implication is
  port (
    clk : in std_logic
  );
end entity psl_logical_implication;


architecture psl of psl_logical_implication is

  signal a, b, c, d : std_logic;

begin


  --                              01234567890
  SEQ_A : sequencer generic map ("_-__-___-__") port map (clk, a);
  SEQ_B : sequencer generic map ("_-______-__") port map (clk, b);
  SEQ_C : sequencer generic map ("_-__-______") port map (clk, c);
  SEQ_D : sequencer generic map ("___________") port map (clk, d);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  IMPLICATION_0_a : assert always (a -> b or c);

  -- This assertion doesn't hold at cycle 4
  IMPLICATION_1_a : assert always (a -> b and c);

  -- This assertion holds because RHS of implication always holds
  IMPLICATION_2_a : assert always (a -> true);

  -- This assertion doesn't hold at cycle 1 because RHS of implication never holds
  IMPLICATION_3_a : assert always (a -> false);

  -- This assertion holds because LHS of implication never holds
  IMPLICATION_4_a : assert always (d -> (a and b and c));

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 11);
  -- synthesis translate_on


end architecture psl;
