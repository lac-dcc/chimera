library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_sere_non_len_matching_and is
  port (
    clk : in std_logic
  );
end entity psl_sere_non_len_matching_and;


architecture psl of psl_sere_non_len_matching_and is

  signal req, done0, done1, done2, ack : std_logic;

begin


  --                                  01234567890
  SEQ_REQ   : sequencer generic map ("_-_________") port map (clk, req);
  SEQ_DONE0 : sequencer generic map ("______-____") port map (clk, done0);
  SEQ_DONE1 : sequencer generic map ("________-__") port map (clk, done1);
  SEQ_DONE2 : sequencer generic map ("____-______") port map (clk, done2);
  SEQ_ACK   : sequencer generic map ("_________-_") port map (clk, ack);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- Non length matching AND three SERE
  -- Each of done0, done1 & done2 has to hold a cycle after
  -- req holded. Transfer is ended by ack holding one cycle
  -- after last done holded
  -- This assertion holds
  SERE_0_a : assert always {req} |=> {{done0[->] & done1[->] & done2[->]}; ack};

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 11);
  -- synthesis translate_on


end architecture psl;
