library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_sere_len_matching_and is
  port (
    clk : in std_logic
  );
end entity psl_sere_len_matching_and;


architecture psl of psl_sere_len_matching_and is

  signal req, busy, valid, done : std_logic;

begin


  --                                  0123456789
  SEQ_REQ   : sequencer generic map ("_-________") port map (clk, req);
  SEQ_BUSY  : sequencer generic map ("__------__") port map (clk, busy);
  SEQ_VALID : sequencer generic map ("___-_-_-__") port map (clk, valid);
  SEQ_DONE  : sequencer generic map ("________-_") port map (clk, done);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- Length matching AND two SERE
  -- valid has to hold 3 times between req & done.
  -- busy has to hold each cycle between req & done.
  -- This assertion holds
  SERE_0_a : assert always {req} |=> {{valid[->3]} && {(busy and not done)[+]}; not busy and done};

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 10);
  -- synthesis translate_on


end architecture psl;
