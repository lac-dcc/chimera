library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PWM is
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
end entity PWM;

architecture RTL of PWM is

  signal TIMER : integer range 0 to CLOCK_DIVIDER - 1 := CLOCK_DIVIDER - 1;
  signal COUNT : integer range 0 to MAX_VAL - 1 := 0;
  signal PWM_VAL : integer range 0 to MAX_VAL := 0;

begin

  DATA_ACK <= '1';

  process
  begin
    wait until rising_edge(CLK);

    if DATA_STB = '1' then
      PWM_VAL <= to_integer(unsigned(DATA));
    end if;

    if TIMER = 0 then
      if COUNT = MAX_VAL - 1 then
        COUNT <= 0;
      else
        COUNT <= COUNT + 1;
      end if;
      TIMER <= CLOCK_DIVIDER-1;
    else
      TIMER <= TIMER-1;
    end if;

    if COUNT >= PWM_VAL then
      OUT_BIT <= '0';
    else
      OUT_BIT <= '1';
    end if;

  end process;

end architecture RTL;

