library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_property is
  port (
    clk : in std_logic
  );
end entity psl_property;


architecture psl of psl_property is

  signal req, avalid, busy, adone, data, ddone : std_logic;

begin


  --                                   01234567890123
  SEQ_REQ    : sequencer generic map ("_-____________") port map (clk, req);
  SEQ_AVALID : sequencer generic map ("__-___________") port map (clk, avalid);
  SEQ_BUSY   : sequencer generic map ("___-_--_______") port map (clk, busy);
  SEQ_ADONE  : sequencer generic map ("_______-______") port map (clk, adone);
  SEQ_DATA   : sequencer generic map ("________---___") port map (clk, data);
  SEQ_DDONE  : sequencer generic map ("___________-__") port map (clk, ddone);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- Transfer property
  property transfer_3 is always (
    {req} |=> {{avalid; busy[->3]; adone}; {data[->3]; ddone}}
  );

  -- SERE concatenation operator
  -- RHS starts at one cycle cycle that the LHS ends
  -- This assertion holds
  PROP_0_a : assert transfer_3;

  -- Properties can have parameters
  -- This assertion holds
  property transfer_3_p (boolean v, ad, dd) is always (
    {req} |=> {{v; busy[->3]; ad}; {data[->3]; dd}}
  );

  -- SERE concatenation operator
  -- RHS starts at one cycle cycle that the LHS ends
  -- This assertion holds
  PROP_1_a : assert transfer_3_p(avalid, adone, ddone);

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 13);
  -- synthesis translate_on


end architecture psl;
