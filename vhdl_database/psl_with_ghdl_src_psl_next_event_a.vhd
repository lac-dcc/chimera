library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use ieee.math_real.all;

use work.pkg.all;


entity psl_next_event_a is
  port (
    clk : in std_logic
  );
end entity psl_next_event_a;


architecture psl of psl_next_event_a is

  signal a, c : std_logic;
  signal b    : std_logic_vector(3 downto 0);

begin


  --                                  012345678901234567890123
  SEQ_A : sequencer generic map     ("_-______________-_______") port map (clk, a);
  SEQ_B : hex_sequencer generic map ("443334477444433355554555") port map (clk, b);
  SEQ_C : sequencer generic map     ("_____-___---______--_--_") port map (clk, c);



  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- Check for one possible value of b
  -- Both assertions hold (see ghdl/ghdl#2157)
  NEXT_EVENT_0_a : assert always ((a and b = x"4") -> next_event_a(c)[1 to 4](b = x"4"))
    report "NEXT_EVENT_0_a failed";
  NEXT_EVENT_1_a : assert always ((a and b = x"5") -> next_event_a(c)[1 to 4](b = x"5"))
    report "NEXT_EVENT_1_a failed";


  -- Check for all possible values of b
  -- Workaround for missing PSL forall in {i to j} statement
  -- This assertions should hold
  -- Assertions for i = 4 & i = 5 don't hold, assuming GHDL bug
  check_b : for i in 0 to 2**b'length-1 generate
    signal i_slv : std_logic_vector(b'range);
  begin
    i_slv <= std_logic_vector(to_unsigned(i, 4));
    NEXT_EVENT_a : assert always ((a and b = i_slv) -> next_event_a(c)[1 to 4](b = i_slv));
  end generate check_b;

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 24);
  -- synthesis translate_on


end architecture psl;
