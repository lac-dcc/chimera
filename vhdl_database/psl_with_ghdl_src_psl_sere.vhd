library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_sere is
  port (
    clk : in std_logic
  );
end entity psl_sere;


architecture psl of psl_sere is

  signal a, b : std_logic;

begin


  --                              012345
  SEQ_A : sequencer generic map ("--____") port map (clk, a);
  SEQ_B : sequencer generic map ("_-____") port map (clk, b);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  SERE_0_a : assert {a};

  -- This assertion holds
  SERE_1_a : assert {a; a};

  -- This assertion holds
  SERE_2_a : assert {a; a and b};

  -- This assertion doesn't hold at cycle 2
  SERE_3_a : assert always {a; a};

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 6);
  -- synthesis translate_on


end architecture psl;
