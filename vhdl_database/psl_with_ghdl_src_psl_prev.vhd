library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

use work.pkg.all;


entity psl_prev is
  port (
    clk : in std_logic
  );
end entity psl_prev;


architecture psl of psl_prev is

  signal valid  : std_logic;
  signal a      : std_logic;
  signal di, do : std_logic_vector(3 downto 0);
  signal cnt    : std_logic_vector(3 downto 0);

begin


  --                                   01234567890123
  SEQ_VALID  : sequencer generic map ("____-_-_-_-_-_") port map (clk, valid);
  SEQ_A      : sequencer generic map ("-__--__--__--_") port map (clk, a);
  SEQ_DI : hex_sequencer generic map ("00011223344556") port map (clk, di);
  SEQ_DO : hex_sequencer generic map ("00001020304050") port map (clk, do);

  SEQ_CNT : hex_sequencer generic map ("0123456789ABCDEF") port map (clk, cnt);



  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  PREV_0_a : assert always (valid -> a = prev(a));

  -- This assertion should hold
  PREV_1_a : assert always (valid -> di = prev(di));

  -- Workaround needed before prev() was implemented
  -- With VHDL glue logic generating the
  -- previous value of di and simple comparing the two values
  d_reg : block is
    signal di_prev : std_logic_vector(di'range);
  begin
    process (clk) is
    begin
      if rising_edge(clk) then
        di_prev <= di;
      end if;
    end process;
    PREV_2_a : assert always (valid -> di = di_prev);
  end block d_reg;

  -- Using prev() with additional parameter i, should return
  -- the value of the expression in the i-th previous cycle
  -- prev(a) = prev(a, 1)
  -- This assertion holds
  PREV_3_a : assert always (valid -> a = prev(a, 1));

  -- Using prev() with additional parameter i, should return
  -- the value of the expression in the i-th previous cycle
  -- This assertion holds
  PREV_4_a : assert always (valid -> a = prev(a, 4));

  -- Some kind of pipeline data check, checks if do is
  -- equal to di one cycle before when valid holds
  -- This assertion holds
  PREV_5_a : assert always (valid -> do = prev(di, 1));

  -- Example for a simple counter check
  -- This assertion holds
  PREV_6_a : assert always ((cnt /= x"F") -> next (unsigned(cnt) = unsigned(prev(cnt)) + 1));

  -- Check parts of a vector
  -- This assertion should hold
  PREV_7_a : assert always (valid -> di(1 downto 0) = prev(di(1 downto 0)));

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 14);
  -- synthesis translate_on


end architecture psl;
