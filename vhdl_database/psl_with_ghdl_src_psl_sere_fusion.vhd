library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_sere_fusion is
  port (
    clk : in std_logic
  );
end entity psl_sere_fusion;


architecture psl of psl_sere_fusion is

  signal req, avalid, busy, adone, data, ddone : std_logic;

begin


  --                                   0123456789012
  SEQ_REQ    : sequencer generic map ("_-___________") port map (clk, req);
  SEQ_AVALID : sequencer generic map ("__-__________") port map (clk, avalid);
  SEQ_BUSY   : sequencer generic map ("___-_--______") port map (clk, busy);
  SEQ_ADONE  : sequencer generic map ("_______-_____") port map (clk, adone);
  SEQ_DATA   : sequencer generic map ("_______---___") port map (clk, data);
  SEQ_DDONE  : sequencer generic map ("__________-__") port map (clk, ddone);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- SERE fusion operator
  -- SERE fusion is like concatenation (;) but starts at
  -- the same cycle that the LHS ends
  -- This assertion holds
  SERE_0_a : assert always {req} |=> {{avalid; busy[->3]; adone} : {data[->3]; ddone}};

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 13);
  -- synthesis translate_on


end architecture psl;
