library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_sere_non_overlapping_suffix_impl is
  port (
    clk : in std_logic
  );
end entity psl_sere_non_overlapping_suffix_impl;


architecture psl of psl_sere_non_overlapping_suffix_impl is

  signal a, b : std_logic;

begin


  --                              012345678
  SEQ_A : sequencer generic map ("--___-___") port map (clk, a);
  SEQ_B : sequencer generic map ("_-____-__") port map (clk, b);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  SERE_0_a : assert always {a; a} |=> {not a};

  -- This assertion doesn't hold at cycle 2
  SERE_1_a : assert always {a; a} |=> {a and b};

  -- This assertion holds
  SERE_2_a : assert always {not a; a} |=> {b};

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 9);
  -- synthesis translate_on


end architecture psl;
