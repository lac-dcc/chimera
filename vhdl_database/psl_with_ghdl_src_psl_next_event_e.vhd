library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_next_event_e is
  port (
    clk : in std_logic
  );
end entity psl_next_event_e;


architecture psl of psl_next_event_e is

  signal a, b, c : std_logic;

begin


  --                              012345678901234
  SEQ_A : sequencer generic map ("_-______-______") port map (clk, a);
  SEQ_B : sequencer generic map ("___-__-___-__-_") port map (clk, b);
  SEQ_C : sequencer generic map ("______-___-____") port map (clk, c);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  NEXT_EVENT_0_a : assert always (a -> next_event_e(b)[1 to 2](c));

  -- This assertion doesn't hold at cycle 13
  -- This assert is similar to using next_event(b)[2](c)
  NEXT_EVENT_1_a : assert always (a -> next_event_e(b)[2 to 2](c));

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 15);
  -- synthesis translate_on


end architecture psl;
