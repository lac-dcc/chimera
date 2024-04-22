library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_sequence is
  port (
    clk : in std_logic
  );
end entity psl_sequence;


architecture psl of psl_sequence is

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

  -- Address phase sequence
  sequence a_phase is {avalid; busy[->3]; adone};

  -- Data phase sequence
  -- Sequences can have parameters
  sequence d_phase (boolean done) is {data[->3]; done};

  -- SERE concatenation operator
  -- RHS starts at one cycle cycle that the LHS ends
  -- This assertion holds
  SERE_0_a : assert always {req} |=> {a_phase; d_phase(ddone)};

  -- SERE concatenation operator
  -- RHS starts at one cycle cycle that the LHS ends
  -- This cover holds at cycle 7
  SERE_0_c : cover {req; a_phase} report "Address phase completed";

  -- SERE concatenation operator
  -- RHS starts at one cycle cycle that the LHS ends
  -- This cover holds at cycle 11
  SERE_1_c : cover {d_phase(ddone)} report "Data phase completed";

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 13);
  -- synthesis translate_on


end architecture psl;
