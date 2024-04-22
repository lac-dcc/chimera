library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_logical_iff is
  port (
    clk : in std_logic
  );
end entity psl_logical_iff;


architecture psl of psl_logical_iff is

  signal a, b, c : std_logic;

begin


  --                              01234567890
  SEQ_A : sequencer generic map ("_-__-___-__") port map (clk, a);
  SEQ_B : sequencer generic map ("_-______-__") port map (clk, b);
  SEQ_C : sequencer generic map ("_-__-______") port map (clk, c);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  IFF_0_a : assert always (a <-> b or c);

  -- Equivalent but with logical implication operator
  -- This assertion holds
  IFF_1_a : assert always (a -> b or c) and (b or c -> a);

  -- This assertion doesn't hold at cycle 4
  IFF_2_a : assert always (a <-> b and c);

  -- This assertion doesn't hold at cycle 0
  IFF_3_a : assert always (a <-> true);

  -- This assertion doesn't hold at cycle 1
  IFF_4_a : assert always (a -> false);


  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 11);
  -- synthesis translate_on


end architecture psl;
