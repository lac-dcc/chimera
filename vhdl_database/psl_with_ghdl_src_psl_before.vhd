library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_before is
  port (
    clk : in std_logic
  );
end entity psl_before;


architecture psl of psl_before is

  signal a, b : std_logic;
  signal c, d : std_logic;
  signal e, f : std_logic;

begin


  --                              01234567890
  SEQ_A : sequencer generic map ("_-____-____") port map (clk, a);
  SEQ_B : sequencer generic map ("___-_____-_") port map (clk, b);

  --                              01234567890
  SEQ_C : sequencer generic map ("_-___-_____") port map (clk, c);
  SEQ_D : sequencer generic map ("_____-___-_") port map (clk, d);

  --                              01234567890
  SEQ_E : sequencer generic map ("_-____-____") port map (clk, e);
  SEQ_F : sequencer generic map ("_-_______-_") port map (clk, f);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  BEFORE_0_a : assert always (a -> next (b before a))
    report "BEFORE_0_a failed";

  -- This assertion doesn't hold at cycle 5
  BEFORE_1_a : assert always (c -> next (d before c))
    report "BEFORE_1_a failed";

  -- This assertion doesn't hold at cycle 6
  BEFORE_2_a : assert always (e -> next (f before e))
    report "BEFORE_2_a failed";

  -- This is flawed variant of the former assertion
  -- because even in cycle 1 the b before a property has
  -- to hold, which is clearly not what we want
  -- This assertion doesn't hold at cycle 1
  -- Furthermore this assertion leads to a GHDL crash with bug report
  -- BEFORE_3_a : assert always (a -> (b before a))
  --  report "BEFORE_3_a failed";

  -- This assertion holds (see ghdl/ghdl#2153)
  BEFORE_4_a : assert always (a -> next (b before_ a))
    report "BEFORE_4_a failed";

  -- This assertion holds (see ghdl/ghdl#2153)
  BEFORE_5_a : assert always (c -> next (d before_ c))
    report "BEFORE_5_a failed";

  -- This assertion doesn't at cycle 6
  BEFORE_6_a : assert always (e -> next (f before_ e))
    report "BEFORE_6_a failed";

  -- This assertion holds
  BEFORE_7_a : assert always (a -> (b or next (b before a)))
    report "BEFORE_7_a failed";

  -- This assertion doesn't hold at cycle 5
  BEFORE_8_a : assert always (c -> (d or next (d before c)))
    report "BEFORE_8_a failed";

  -- This assertion holds
  BEFORE_9_a : assert always (e -> (f or next (f before e)))
    report "BEFORE_9_a failed";

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 11);
  -- synthesis translate_on


end architecture psl;
