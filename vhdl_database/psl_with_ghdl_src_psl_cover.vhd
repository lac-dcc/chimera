library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_cover is
  port (
    clk : in std_logic
  );
end entity psl_cover;


architecture psl of psl_cover is

  signal req, busy, done : std_logic;

begin


  --                                 0123456789
  SEQ_REQ  : sequencer generic map ("_-________") port map (clk, req);
  SEQ_BUSY : sequencer generic map ("__-_-_-___") port map (clk, busy);
  SEQ_DONE : sequencer generic map ("________-_") port map (clk, done);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- Covers a transfer request
  -- This cover directive holds at cycle 1
  COVER_0_c : cover {req}
    report "Transfer requested";

  -- Covers started processing of transfers
  -- This cover directive holds at cycle 2
  COVER_1_c : cover {req; {{busy[=1]} && {not done[+]}}}
    report "Transfer in progress";

  -- Covers each transfer with length in range 1 to 8
  -- This cover directive holds at cycle 8
  COVER_2_c : cover {req; {{busy[=1 to 8]} && {not done[+]}}; done}
    report "Transfer done";

  -- Cover transfers with length in range 1 to 8 separately
  cover_transfer_lengths : for i in 1 to 8 generate
  begin
    -- Don't works with GHDL, but should? Is a defined as static in the
    -- generate body?
    --COVER_TRANSFER_LENGTH_c : cover {req; {{busy[=i]} && {not done[+]}}; done};
  end generate cover_transfer_lengths;

  -- Workaround: writing separate cover directives for
  -- each length, very tedious
  -- Only length 3 holds at cycle 8, all others not
  COVER_LENGTH_1_c : cover {req; {{busy[=1]} && {not done[+]}}; done};
  COVER_LENGTH_2_c : cover {req; {{busy[=2]} && {not done[+]}}; done};
  COVER_LENGTH_3_c : cover {req; {{busy[=3]} && {not done[+]}}; done};
  COVER_LENGTH_4_c : cover {req; {{busy[=4]} && {not done[+]}}; done};
  COVER_LENGTH_5_c : cover {req; {{busy[=5]} && {not done[+]}}; done};
  COVER_LENGTH_6_c : cover {req; {{busy[=6]} && {not done[+]}}; done};
  COVER_LENGTH_7_c : cover {req; {{busy[=7]} && {not done[+]}}; done};
  COVER_LENGTH_8_c : cover {req; {{busy[=8]} && {not done[+]}}; done};

  -- BTW: GHDL synthesis creates a cover directive for each assert directive
  -- which is really nice. So you can run SymbiYosys in cover mode
  -- to see if your assertions can actually be active.
  -- This assertion checks for the final done at the end of transfer.
  -- In cover mode, the LHS side of the property has to hold.
  -- This cover directive holds at cycle 7
  ASSERT_a : assert always {req; {{busy[=3]} && {not done[+]}}; not done} |=> {done};

  -- For simulation, you have to write a separate cover directive when
  -- you want to check if your assertion can be active
  -- Simply use the LHS of the asserts property
  COVER_A : cover {req; {{busy[=3]} && {not done[+]}}; not done}
    report "Transfer of length 3";

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 10);
  -- synthesis translate_on


end architecture psl;
