library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_next_event is
  port (
    clk : in std_logic
  );
end entity psl_next_event;


architecture psl of psl_next_event is

  signal a, b, c : std_logic;
  signal d, e, f : std_logic;

begin

  --                              012345678901234
  SEQ_A : sequencer generic map ("_-________-____") port map (clk, a);
  SEQ_B : sequencer generic map ("____-_-____-__-") port map (clk, b);
  SEQ_C : sequencer generic map ("____-______-___") port map (clk, c);

  --                              012345678901234
  SEQ_D : sequencer generic map ("_-______-_-____") port map (clk, d);
  SEQ_E : sequencer generic map ("____-_-_--_-__-") port map (clk, e);
  SEQ_F : sequencer generic map ("____-___-__-___") port map (clk, f);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  NEXT_EVENT_0_a : assert always (a -> next_event(b)(c));

  -- This assertion holds
  NEXT_EVENT_1_a : assert always (d -> next_event(e)(f));

  -- This assertion holds
  NEXT_EVENT_2_a : assert always (a -> next next_event(b)(c));

  -- This assertion doesn't hold at cycle 9
  NEXT_EVENT_3_a : assert always (d -> next next_event(e)(f));

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 15);
  -- synthesis translate_on


end architecture psl;
