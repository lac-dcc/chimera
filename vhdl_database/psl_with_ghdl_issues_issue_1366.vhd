vunit issue_vunit (issue(psl)) {

  -- VHDL declaration seem to be working
  signal a_delayed  : std_logic := '0';
  signal prev_valid : boolean   := false;

  -- Other VHDL code not
  -- results in parser errors
  -- during synthesis
  -- EDIT: works since fix of ghdl issue #1366
  process is
  begin
    wait until rising_edge(clk);
    a_delayed <= a;
    prev_valid <= true;
  end process;


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  CHECK_0_a : assert always (a -> b);

  -- You can't do anything with the declared signal
  -- Can be synthesized with GHDL, however
  -- results in error in ghdl-yosys-plugin:
  -- ERROR: Assert `n.id != 0' failed in src/ghdl.cc:172
  -- EDIT: works since fix of ghdl issue #1366
  CHECK_1_a : assert always prev_valid -> a_delayed = prev(a);

}


library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;


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

  component sequencer is
    generic (
      seq : string
    );
    port (
      clk  : in  std_logic;
      data : out std_logic
    );
  end component sequencer;

  signal a, b : std_logic;

begin


  --                              0123456789
  SEQ_A : sequencer generic map ("__-__-____") port map (clk, a);
  SEQ_B : sequencer generic map ("__-__-____") port map (clk, b);


end architecture psl;
