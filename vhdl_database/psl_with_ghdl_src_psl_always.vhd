library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_always is
  port (
    clk : in std_logic
  );
end entity psl_always;


architecture psl of psl_always is

  signal a : std_logic;

begin


  --                            012345
  SEQ : sequencer generic map ("--____") port map (clk, a);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- Beware: potential pitfall!
  -- Every time a PSL assertion is similar to a concurrent
  -- VHDL assertion at that place, it is interpreted as such
  -- This assert is considered as VHDL assert statement,
  -- so it is active every cycle
  -- This assertion doesn't hold at cycle 2
  VHDL_ASSERT_a : assert a;

  -- The PSL comment helps to mark this as PSL assert
  -- This assertion holds
  -- psl WITHOUT_ALWAYS_a : assert a;

  -- This assertion doesn't hold at cycle 2
  WITH_ALWAYS_a : assert always a;

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 6);
  -- synthesis translate_on


end architecture psl;
