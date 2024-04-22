library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_next_event_4 is
  port (
    clk : in std_logic
  );
end entity psl_next_event_4;


architecture psl of psl_next_event_4 is

  signal a, b, c : std_logic;
  signal d, e, f : std_logic;

begin

  --                              0123456789012345
  SEQ_A : sequencer generic map ("_-_____-________") port map (clk, a);
  SEQ_B : sequencer generic map ("__----___--__-_-") port map (clk, b);
  SEQ_C : sequencer generic map ("_____-_________-") port map (clk, c);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  NEXT_EVENT_0_a : assert always (a -> next_event(b)[4](c));

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 16);
  -- synthesis translate_on


end architecture psl;
