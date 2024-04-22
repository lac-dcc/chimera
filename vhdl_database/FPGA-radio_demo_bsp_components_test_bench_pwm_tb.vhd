library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PWM_TB is
end entity;

architecture RTL of PWM_TB is

  component PWM is
    generic(
      MAX_VAL : integer := 256;
      CLOCK_DIVIDER : integer := 256
    );
    port(
      CLK : in std_logic;

      DATA : in std_logic_vector(31 downto 0);
      DATA_STB : in std_logic;
      DATA_ACK : out std_logic;

      OUT_BIT : out std_logic
    );
  end component PWM;

  signal CLK : std_logic;
  signal DATA : std_logic_vector(31 downto 0);
  signal DATA_STB : std_logic;
  signal DATA_ACK : std_logic;
  signal OUT_BIT : std_logic;

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

  PWM_INST_1 : PWM generic map(
      MAX_VAL => 255,
      CLOCK_DIVIDER => 10
  ) port map(
      CLK => CLK,

      DATA => DATA,
      DATA_STB => DATA_STB,
      DATA_ACK => DATA_ACK,

      OUT_BIT => OUT_BIT
  );

  process
  begin

  wait for 200 ns;

  wait until rising_edge(CLK);
  DATA <= X"000000FF";
  DATA_STB <= '1';
  wait until rising_edge(CLK);
  DATA_STB <= '0';

  wait for 200 us;

  wait until rising_edge(CLK);
  DATA <= X"0000007F";
  DATA_STB <= '1';
  wait until rising_edge(CLK);
  DATA_STB <= '0';

  wait for 200 us;

  wait until rising_edge(CLK);
  DATA <= X"0000003F";
  DATA_STB <= '1';
  wait until rising_edge(CLK);
  DATA_STB <= '0';

  wait for 200 us;

  wait until rising_edge(CLK);
  DATA <= X"00000000";
  DATA_STB <= '1';
  wait until rising_edge(CLK);
  DATA_STB <= '0';
  wait;

  end process;

end architecture RTL;

