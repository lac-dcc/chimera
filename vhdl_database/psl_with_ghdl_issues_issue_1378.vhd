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

  signal a, b, c : std_logic;

begin

  --                              01234567890123
  SEQ_A : sequencer generic map ("_-_____-______") port map (clk, a);
  SEQ_B : sequencer generic map ("__--____---___") port map (clk, b);
  SEQ_C : sequencer generic map ("____-______-__") port map (clk, c);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- Doesn't work with inline PSL
  -- endpoint ENDPOINT_0_e is {a; b[*2]; c};

  -- endpoint in psl comment works
  -- psl endpoint ENDPOINT_1_e is {a; b[*3]; c};

  assert not ENDPOINT_1_e
    report "Endpoint hit"
    severity note;

end architecture psl;
