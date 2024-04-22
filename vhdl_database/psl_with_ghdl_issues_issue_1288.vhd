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
  signal ch    : character;

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

  ch <= seq(index);

  data <= to_bit(ch);


end architecture rtl;


library ieee;
  use ieee.std_logic_1164.all;


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
  signal c, d : std_logic;
  signal e, f : std_logic;

begin


  --                              01234567890
  SEQ_A : sequencer generic map ("__-_-______") port map (clk, a);
  SEQ_B : sequencer generic map ("_____-_-___") port map (clk, b);

  --                              01234567890
  SEQ_C : sequencer generic map ("__-_-______") port map (clk, c);
  SEQ_D : sequencer generic map ("_____-_____") port map (clk, d);

  --                              01234567890
  SEQ_E : sequencer generic map ("__-_-______") port map (clk, e);
  SEQ_F : sequencer generic map ("_____-----_") port map (clk, f);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  NEXT_0_a : assert always (a -> next_e[3 to 5] (b));

  -- This assertion doesn't hold at cycle 9
  NEXT_1_a : assert always (c -> next_e[3 to 5] (d));

  -- This assertion holds
  NEXT_2_a : assert always (e -> next_e[3 to 5] (f));


end architecture psl;
