library ieee;
  use ieee.std_logic_1164.all;

entity sequencer is
  generic (
    seq : string
  );
  port (
    clk  : in  std_logic;
    data : out std_logic
  );
end entity sequencer;

architecture rtl of sequencer is

  signal index : natural := seq'low;

  function to_bit (a : in character) return std_logic is
    variable ret : std_logic;
  begin
    case a is
      when '0' | '_' => ret := '0';
      when '1' | '-' => ret := '1';
      when others    => ret := 'X';
    end case;
    return ret;
  end function to_bit;

begin

  process (clk) is
  begin
    if rising_edge(clk) then
      if (index < seq'high) then
        index <= index + 1;
      end if;
    end if;
  end process;

  data <= to_bit(seq(index));

end architecture rtl;


library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity issue is
  port (
    clk : in std_logic
  );
end entity issue;

architecture psl of issue is

  signal a, b : std_logic;

begin

  --                                          012345678
  SEQ_A : entity work.sequencer generic map ("_-____-__") port map (clk, a);
  SEQ_B : entity work.sequencer generic map ("__-____-_") port map (clk, b);

  default clock is rising_edge(clk);

  -- This  works, but it's not that useful as even a simple negation
  -- leads to an error (see seq1)
  sequence seq (boolean d0, d1) is {d0; d1};

  TEST_0 : cover seq(a, b) report "TEST_0 hit";

  -- One could negate the parameter when calling the
  -- sequence, but this is not very intuitive
  TEST_1 : assert never seq(a, not b);

  -- This doesnt work:
  -- error: PSL declaration "a" not allowed in an expression
  sequence seq1 (boolean d0) is {not d0; d0 = true};
  
  TEST_2 : cover seq1(a) report "TEST_1 hit";

end architecture psl;

library ieee;
  use ieee.std_logic_1164.all;

use std.env.all;


entity test_issue is
end entity test_issue;


architecture sim of test_issue is

  signal clk   : std_logic := '1';

begin

  clk <= not clk after 500 ps;

  DUT : entity work.issue(psl) port map (clk);

  -- stop simulation after 10 cycles
  process
    variable index : natural := 10;
  begin
    loop
      wait until rising_edge(clk);
      index := index - 1;
      exit when index = 0;
    end loop;
    stop(0);
  end process;

end architecture sim;