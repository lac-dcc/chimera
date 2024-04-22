
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pdm_mic is
  generic(
    CLOCK_FREQUENCY : integer := 50000000;
    SAMPLE_RATE : integer := 11025;
    AUDIO_BITS : integer := 8
  );
  port(
    CLK : in std_logic;
    RST : in std_logic;

    DATA_OUT : out std_logic_vector(31 downto 0);
    DATA_OUT_STB : out std_logic;
    DATA_OUT_ACK : in std_logic;

    PDM_DATA : in std_logic;
    PDM_CLK : out std_logic

  );
end entity pdm_mic;

architecture RTL of pdm_mic is

  constant MAX_COUNT : integer := 2**AUDIO_BITS - 1;
  constant MAX_TIMER : integer := (CLOCK_FREQUENCY/(SAMPLE_RATE * (2**AUDIO_BITS) * 2))-1;

  type state_type is (INITIALISE, CAPTURE_SAMPLE, SEND_SAMPLE);
  signal STATE : STATE_TYPE;

  signal S_DATA_OUT_STB : std_logic;
  signal S_PDM_CLK      : std_logic;

  signal COUNT : integer range 0 to MAX_COUNT;
  signal SAMPLE : integer range 0 to MAX_COUNT;
  signal TIMER : integer range 0 to MAX_TIMER;

begin


  process
  begin
    wait until rising_edge(CLK);

    case STATE is

      when INITIALISE =>
        SAMPLE <= 0;
        COUNT <= MAX_COUNT;
        TIMER <= MAX_TIMER;
        STATE <= CAPTURE_SAMPLE;

      when CAPTURE_SAMPLE =>

        if TIMER = 0 then
          TIMER <= MAX_TIMER;

          if COUNT = 0 then
            STATE <= SEND_SAMPLE;
          else
            COUNT <= COUNT - 1;
          end if;

          s_PDM_CLK <= not s_PDM_CLK;
          if PDM_DATA = '1' then
            SAMPLE <= SAMPLE + 1;
          end if;

        else
          TIMER <= TIMER - 1;
        end if;

      when SEND_SAMPLE =>

       S_DATA_OUT_STB <= '1';
       DATA_OUT <= std_logic_vector(to_unsigned(SAMPLE, AUDIO_BITS));
       if S_DATA_OUT_STB = '1' and DATA_OUT_ACK = '1' then
          S_DATA_OUT_STB <= '0';
          STATE <= CAPTURE_SAMPLE;
          SAMPLE <= 0;
          COUNT <= MAX_COUNT;
          TIMER <= MAX_TIMER;
       end if;

    end case;

    if RST = '1' then
      STATE <= INITIALISE;
      S_DATA_OUT_STB <= '0';
      s_PDM_CLK <= '0';
    end if;

  end process;
  
  DATA_OUT_STB <= S_DATA_OUT_STB;
  PDM_CLK <= s_PDM_CLK;

end architecture RTL;

