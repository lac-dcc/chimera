
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm_audio_tb is
end entity pwm_audio_tb;

architecture RTL of pwm_audio_tb is

  component pwm_audio is
    port(
      CLK : in std_logic;
      RST : in std_logic;

      DATA_IN : in std_logic_vector(31 downto 0);
      DATA_IN_STB : in std_logic;
      DATA_IN_ACK : out std_logic;

      AUDIO : out std_logic

    );
  end component pwm_audio;

  signal CLK : std_logic;
  signal RST : std_logic;

  signal DATA : std_logic_vector(31 downto 0);
  signal DATA_STB : std_logic;
  signal DATA_ACK : std_logic;

  signal AUDIO : std_logic;

begin


  process
  begin
    while True loop
        CLK <= '0';
        wait for 10.0 ns;
        CLK <= '1';
        wait for 10.0 ns;
    end loop;
    wait;
  end process;

  process
  begin
    RST <= '1';
    wait for 100 ns;
    RST <= '0';
    wait;
  end process;


  pwm_audio_i1 : pwm_audio port map(
      CLK => CLK,
      RST => RST,

      DATA_IN => DATA,
      DATA_IN_STB => DATA_STB,
      DATA_IN_ACK => DATA_ACK,

      AUDIO => AUDIO

    );

  process
  begin

  wait for 200 ns;

  wait until rising_edge(CLK);
  DATA <= X"0000007F";
  DATA_STB <= '1';
  while True loop
    wait until rising_edge(CLK);
    if DATA_STB = '1' and DATA_ACK = '1' then
      DATA_STB <= '0';
      exit;
    end if;
  end loop;

  wait until rising_edge(CLK);
  DATA <= X"0000003F";
  DATA_STB <= '1';
  while True loop
    wait until rising_edge(CLK);
    if DATA_STB = '1' and DATA_ACK = '1' then
      DATA_STB <= '0';
      exit;
    end if;
  end loop;

  wait until rising_edge(CLK);
  DATA <= X"00000001";
  DATA_STB <= '1';
  while True loop
    wait until rising_edge(CLK);
    if DATA_STB = '1' and DATA_ACK = '1' then
      DATA_STB <= '0';
      exit;
    end if;
  end loop;

  end process;


end architecture RTL;

