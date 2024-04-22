library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity yosys_anyseq is
  port (
    clk : in std_logic
  );
end entity yosys_anyseq;


architecture psl of yosys_anyseq is

  attribute anyseq : boolean;

  signal a: std_logic;
  signal b: natural;

  attribute anyseq of a : signal is true;
  attribute anyseq of b : signal is true;

begin


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- a should always be high 
  ANY_ASSUME_0_a : assume always a;

  -- This assertion holds
  ANY_ASSERT_0_a : assert always a;

  -- b should always be in range 23...42 
  ANY_ASSUME_1_a : assume always b >= 23 and b <= 42;

  -- This assertion holds
  ANY_ASSERT_1_a : assert always b >= 23 and b <= 42;

  -- This assertion fails in cycle 1
  -- Solver chosen value can change from one to next cycle
  ANY_ASSERT_2_a : assert b >= 23 -> next b = prev(b);


end architecture psl;
