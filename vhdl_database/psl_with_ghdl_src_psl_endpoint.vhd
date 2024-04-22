library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_endpoint is
  port (
    clk : in std_logic
  );
end entity psl_endpoint;


architecture psl of psl_endpoint is

  signal a, b : std_logic;
  signal c, d : std_logic;

begin


  --                              01234567890123
  SEQ_A : sequencer generic map ("_-_____-______") port map (clk, a);
  SEQ_B : sequencer generic map ("__--____---___") port map (clk, b);
  SEQ_C : sequencer generic map ("____-______-__") port map (clk, c);
  SEQ_D : sequencer generic map ("____________-_") port map (clk, d);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- only endpoint in psl comment works
  -- psl endpoint ENDPOINT_1_e is {a; b[*3]; c};

  -- This assertion holds
  ASSERT_a : assert always (ENDPOINT_1_e <-> d);

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 14);
  -- synthesis translate_on


end architecture psl;
