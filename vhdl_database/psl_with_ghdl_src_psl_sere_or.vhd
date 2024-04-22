library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_sere_or is
  port (
    clk : in std_logic
  );
end entity psl_sere_or;


architecture psl of psl_sere_or is

  signal req2, req4, busy, valid, done : std_logic;
  signal req, wen, ends                : std_logic;

begin


  --                                  0123456789012345678
  SEQ_REQ2  : sequencer generic map ("_-_________________") port map (clk, req2);
  SEQ_REQ4  : sequencer generic map ("________-__________") port map (clk, req4);
  SEQ_BUSY  : sequencer generic map ("__----___--------__") port map (clk, busy);
  SEQ_VALID : sequencer generic map ("___-_-____-_-_-_-__") port map (clk, valid);
  SEQ_DONE  : sequencer generic map ("______-__________-_") port map (clk, done);

  --                                 01234567890123456789
  SEQ_REQ  : sequencer generic map ("_-_______-__________") port map (clk, req);
  SEQ_WEN  : sequencer generic map ("___-_-_____-_-_-_-__") port map (clk, wen);
  SEQ_ENDS : sequencer generic map ("_______-__________-_") port map (clk, ends);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- Transfer started by req2 with 2 valids has to be finished by done
  -- This assertion holds
  SERE_0_a : assert always {req2 ; {valid[->2]} && {busy and not done}[+]} |=> {not busy and done};

  -- Transfer started by req4 with 4 valids has to be finished by done
  -- This assertion holds
  SERE_1_a : assert always {req4 ; {valid[->4]} && {busy and not done}[+]} |=> {not busy and done};

  -- SERE or operator
  -- Combination of both assertions above
  -- This assertion holds
  SERE_2_a : assert always {{req2; {valid[->2]} && {busy and not done}[+]} |
                            {req4; {valid[->4]} && {busy and not done}[+]}} |=>
                            {not busy and done};

  -- SERE or operator
  -- Transfer started by req has to have 2 or 4 cycles write cycles, finished by ends
  -- This assertion holds
  SERE_3_a : assert always {req} |=>
                           {{{wen[=2]} && {not ends[+]}} |
                            {{wen[=4]} && {not ends[+]}}; ends};

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 20);
  -- synthesis translate_on


end architecture psl;
