library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

use work.pkg.all;


entity psl_vunit_inherit is
  port (
    clk : in std_logic
  );
end entity psl_vunit_inherit;


architecture beh of psl_vunit_inherit is

  signal a, b : std_logic;

begin


  --                              012345
  SEQ_A : sequencer generic map ("--____") port map (clk, a);
  SEQ_B : sequencer generic map ("_-____") port map (clk, b);

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 6);
  -- synthesis translate_on


end architecture beh;
