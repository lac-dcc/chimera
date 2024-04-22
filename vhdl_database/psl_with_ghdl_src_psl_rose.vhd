library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_rose is
  port (
    clk : in std_logic
  );
end entity psl_rose;


architecture psl of psl_rose is

  signal a, b : std_logic;

begin


  --                              01234567890
  SEQ_A : sequencer generic map ("_--__-_---_") port map (clk, a);
  SEQ_B : sequencer generic map ("_-___-_-___") port map (clk, b);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  ROSE_0_a : assert always (rose(a) -> b);

  -- This assertion holds
  ROSE_1_a : assert always {not a; a} |-> rose(a);

  -- This assertion holds
  ROSE_2_a : assert always (rose(a) -> (not prev(a) and a));

  -- Workaround needed before rose() is implemented
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
    ROSE_3_a : assert always (a and not a_prev -> b);
  end block d_reg;

  -- Another workaround by using simple SERE concatenation on LHS
  ROSE_4_a : assert always {not a; a} |-> b;

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 11);
  -- synthesis translate_on


end architecture psl;
