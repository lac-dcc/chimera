library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_sere_concat is
  port (
    clk : in std_logic
  );
end entity psl_sere_concat;


architecture psl of psl_sere_concat is

  signal req, avalid, busy, adone, data, ddone : std_logic;

begin


  --                                   01234567890123
  SEQ_REQ    : sequencer generic map ("_-____________") port map (clk, req);
  SEQ_AVALID : sequencer generic map ("__-___________") port map (clk, avalid);
  SEQ_BUSY   : sequencer generic map ("___-_--_______") port map (clk, busy);
  SEQ_ADONE  : sequencer generic map ("_______-______") port map (clk, adone);
  SEQ_DATA   : sequencer generic map ("________---___") port map (clk, data);
  SEQ_DDONE  : sequencer generic map ("___________-__") port map (clk, ddone);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- SERE concatenation operator
  -- RHS starts at one cycle cycle that the LHS ends
  -- This assertion holds
  SERE_0_a : assert always {req} |=> {{avalid; busy[->3]; adone}; {data[->3]; ddone}};

  -- SERE concatenation operator
  -- RHS starts at one cycle cycle that the LHS ends
  -- This cover holds at cycle 7
  SERE_0_c : cover {req; avalid; busy[->3]; adone} report "Address phase completed";

  -- SERE concatenation operator
  -- RHS starts at one cycle cycle that the LHS ends
  -- This cover holds at cycle 11
  SERE_1_c : cover {data[->3]; ddone} report "Data phase completed";

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 13);
  -- synthesis translate_on


end architecture psl;
