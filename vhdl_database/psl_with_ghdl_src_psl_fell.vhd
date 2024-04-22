library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_fell is
  port (
    clk : in std_logic
  );
end entity psl_fell;


architecture psl of psl_fell is

  signal a, b, c : std_logic;

begin


  --                              01234567890
  SEQ_A : sequencer generic map ("--__-_---__") port map (clk, a);
  SEQ_B : sequencer generic map ("_-__-_---__") port map (clk, b);
  SEQ_C : sequencer generic map ("__-__-___-_") port map (clk, c);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  FELL_0_a : assert always (fell(a) -> c);

  -- This assertion holds
  FELL_1_a : assert always {a; not a} |-> fell(a);

  -- This assertion holds
  FELL_2_a : assert always (fell(a) -> (prev(a) and not a));

  -- Workaround needed before fell() is implemented
  -- With VHDL glue logic generating the
  -- previous value of a and simple comparing the two values
  d_reg : block is
    signal a_prev : std_logic := '0';
  begin
    process (clk) is
    begin
      if rising_edge(clk) then
        a_prev <= a;
      end if;
    end process;
    FELL_3_a : assert always (not a and a_prev -> c);
  end block d_reg;

  -- Another workaround by using simple SERE concatenation on LHS
  FELL_4_a : assert always {a; not a} |-> c;

  -- This assertion doesn't in formal tests
  -- in the 1st cycle. Problem is the value of
  -- a in the 0th cycle. So fell() can be safely
  -- used from the 2nd cycle on only
  FELL_5_a : assert always (fell(b) -> c);

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 11);
  -- synthesis translate_on


end architecture psl;
