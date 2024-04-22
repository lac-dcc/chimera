library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity yosys_anyconst is
  port (
    clk : in std_logic
  );
end entity yosys_anyconst;


architecture psl of yosys_anyconst is

  attribute anyconst : boolean;

  signal a: std_logic;
  signal b: natural;

  attribute anyconst of a : signal is true;
  attribute anyconst of b : signal is true;

begin


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- a should always be high 
  ANY_ASSUME_0_a : assume always a;

  -- This assertion holds
  ANY_ASSERT_0_a : assert always a;

  -- a should always be high 
  ANY_ASSUME_1_a : assume always b = 42;

  -- This assertion holds
  ANY_ASSERT_1_a : assert always b = 42;


end architecture psl;
