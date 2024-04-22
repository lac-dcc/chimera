
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm_audio is
  generic(
    CLOCK_FREQUENCY : integer := 50000000;
    SAMPLE_RATE : integer := 44000;
    AUDIO_BITS : integer := 8
  );
  port(
    CLK : in std_logic;
    RST : in std_logic;

    DATA_IN : in std_logic_vector(31 downto 0);
    DATA_IN_STB : in std_logic;
    DATA_IN_ACK : out std_logic;

    AUDIO : out std_logic

  );
end entity pwm_audio;

architecture RTL of pwm_audio is

  constant MAX_COUNT : integer := (clock_frequency/sample_rate)-1;

  type state_type is (GET_SAMPLE, PLAY_SAMPLE);
  signal STATE : STATE_TYPE;

  signal S_DATA_IN_ACK : std_logic;
  signal COUNT : integer range 0 to MAX_COUNT;

  signal SAMPLE : unsigned (audio_bits-1 downto 0);
  signal SIGMA : unsigned (audio_bits downto 0);
  signal DELTA : unsigned (audio_bits downto 0);
  signal COMPARATOR : unsigned (audio_bits downto 0);

begin


  process
  begin
    wait until rising_edge(CLK);

    case STATE is

      when GET_SAMPLE =>

       S_DATA_IN_ACK <= '1';
       if S_DATA_IN_ACK = '1' and DATA_IN_STB = '1' then
          S_DATA_IN_ACK <= '0';
          SAMPLE <= unsigned(DATA_IN(AUDIO_BITS-1 downto 0));
          STATE <= PLAY_SAMPLE;
          COUNT <= 0;
        end if;

      when PLAY_SAMPLE =>

        if COUNT = MAX_COUNT then
          STATE <= GET_SAMPLE;
        else
          COUNT <= COUNT + 1;
        end if;

    end case;

    SIGMA <= SIGMA + DELTA;

    if RST = '1' then
      STATE <= GET_SAMPLE;
      SIGMA <= (others => '0');
      SAMPLE <= (others => '0');
      S_DATA_IN_ACK <= '0';
    end if;
  end process;
  
  DELTA <= SAMPLE - COMPARATOR;
  COMPARATOR <= SIGMA(AUDIO_BITS) & to_unsigned(0, audio_bits);
  AUDIO <= SIGMA(AUDIO_BITS);
  DATA_IN_ACK <= S_DATA_IN_ACK;

end architecture RTL;

