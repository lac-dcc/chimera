library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_until is
  port (
    clk : in std_logic
  );
end entity psl_until;


architecture psl of psl_until is

  signal a, b, c : std_logic;
  signal d, e, f : std_logic;
  signal g, h, i : std_logic;

begin


  --                              01234567890
  SEQ_A : sequencer generic map ("_-___-_____") port map (clk, a);
  SEQ_B : sequencer generic map ("__--__----_") port map (clk, b);
  SEQ_C : sequencer generic map ("____-_____-") port map (clk, c);

  --                              01234567890
  SEQ_D : sequencer generic map ("_-___-_____") port map (clk, d);
  SEQ_E : sequencer generic map ("__---_-----") port map (clk, e);
  SEQ_F : sequencer generic map ("____-_____-") port map (clk, f);

  --                              012345
  SEQ_G : sequencer generic map ("_-____") port map (clk, g);
  SEQ_H : sequencer generic map ("______") port map (clk, h);
  SEQ_I : sequencer generic map ("__-___") port map (clk, i);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  UNTIL_0_a : assert always (a -> next (b until c));

  -- This assertion holds
  UNTIL_1_a : assert always (d -> next (e until f));

  -- This assertion holds
  UNTIL_2_a : assert always (g -> next (h until i));

  -- This assertion doesn't hold at cycle 4
  UNTIL_3_a : assert always (a -> next (b until_ c));

  -- This assertion holds
  UNTIL_4_a : assert always (d -> next (e until_ f));

  -- This assertion doesn't hold at cycle 2
  UNTIL_5_a : assert always (g -> next (h until_ i));

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 11);
  -- synthesis translate_on


end architecture psl;
