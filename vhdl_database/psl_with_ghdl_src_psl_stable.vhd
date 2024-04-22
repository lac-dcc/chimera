library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_stable is
  port (
    clk : in std_logic
  );
end entity psl_stable;


architecture psl of psl_stable is

  signal valid, ack, a : std_logic;
  signal b             : std_logic_vector(3 downto 0);

begin


  --                                  0123456789
  SEQ_VALID : sequencer generic map ("_--__---__") port map (clk, valid);
  SEQ_ACK   : sequencer generic map ("__-____-__") port map (clk, ack);
  SEQ_A     : sequencer generic map ("_--_______") port map (clk, a);
  SEQ_B : hex_sequencer generic map ("0110066600") port map (clk, b);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  STABLE_0_a : assert always {not valid; valid} |=> (stable(a) until_ ack);

  -- This assertion holds
  STABLE_1_a : assert always rose(valid) -> next (stable(b) until_ ack);

  -- Workaround needed before stable() was implemented
  -- With VHDL glue logic generating the
  -- previous value of a and simple comparing the two values
  a_reg : block is
    signal a_prev : std_logic;
    signal b_prev : std_logic_vector(b'range);
  begin
    process (clk) is
    begin
      if rising_edge(clk) then
        a_prev <= a;
        b_prev <= b;
      end if;
    end process;
    STABLE_2_a : assert always {not valid; valid} |=> (a = a_prev until_ ack);
    STABLE_3_a : assert always {not valid; valid} |=> (b = b_prev until_ ack);
  end block a_reg;

  -- Check parts of a vector
  -- This assertion holds
  STABLE_4_a : assert always rose(valid) -> next (stable(b(1 downto 0)) until_ ack);


  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 10);
  -- synthesis translate_on


end architecture psl;
