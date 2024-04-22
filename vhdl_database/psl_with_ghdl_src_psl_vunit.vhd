library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

use work.pkg.all;


entity psl_vunit is
  generic (
    formal : string := "ALL"
  );
  port (
    clk : in std_logic
  );
end entity psl_vunit;


architecture beh of psl_vunit is

  signal a, b : std_logic;
  signal c : std_logic_vector(3 downto 0);

begin


  --                              012345
  SEQ_A : sequencer generic map ("--____") port map (clk, a);
  SEQ_B : sequencer generic map ("_-____") port map (clk, b);
  --
  SEQ_C : hex_sequencer generic map ("0123456789ABCDEF") port map (clk, c);


  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 18);
  -- synthesis translate_on


end architecture beh;
