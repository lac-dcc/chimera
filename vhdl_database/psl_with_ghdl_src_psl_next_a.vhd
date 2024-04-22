library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_next_a is
  port (
    clk : in std_logic
  );
end entity psl_next_a;


architecture psl of psl_next_a is

  signal a, b : std_logic;
  signal c, d : std_logic;
  signal e, f : std_logic;
  signal g, h : std_logic;
  signal i, j : std_logic;
  signal k, l : std_logic;

begin


  --                              01234567890
  SEQ_A : sequencer generic map ("__-_-______") port map (clk, a);
  SEQ_B : sequencer generic map ("_____-_-___") port map (clk, b);

  --                              01234567890
  SEQ_C : sequencer generic map ("__-_-______") port map (clk, c);
  SEQ_D : sequencer generic map ("_____-_____") port map (clk, d);

  --                              01234567890
  SEQ_E : sequencer generic map ("__-_-______") port map (clk, e);
  SEQ_F : sequencer generic map ("_____-----_") port map (clk, f);

  --                              01234567890
  SEQ_G : sequencer generic map ("__-_-______") port map (clk, g);
  SEQ_H : sequencer generic map ("_____-_---_") port map (clk, h);

  --                              012345678901
  SEQ_I : sequencer generic map ("__-_-_______") port map (clk, i);
  SEQ_J : sequencer generic map ("_____-__-___") port map (clk, j);

  --                              0123456789
  SEQ_K : sequencer generic map ("__-_-_____") port map (clk, k);
  SEQ_L : sequencer generic map ("_______-__") port map (clk, l);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion doesn't hold at cycle 6
  NEXT_0_a : assert always (a -> next_a[3 to 5] (b));

  -- This assertion doesn't hold at cycle 6
  NEXT_1_a : assert always (c -> next_a[3 to 5] (d));

  -- This assertion holds
  NEXT_2_a : assert always (e -> next_a[3 to 5] (f));

  -- This assertion doesn't hold at cycle 6
  NEXT_3_a : assert always (g -> next_a[3 to 5] (h));

   -- This assertion doesn't hold at cycle 6
  NEXT_4_a : assert always (i -> next_a[3 to 5] (j));

  -- This assertion doesn't hold at cycle 5
  NEXT_5_a : assert always (k -> next_a[3 to 5] (l));

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 12);
  -- synthesis translate_on


end architecture psl;
