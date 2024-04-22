library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity I2C_TB is
end entity I2C_TB;
architecture RTL of I2C_TB is
  component I2C is
  generic(
    CLOCKS_PER_SECOND : integer := 50000000;
    SPEED : integer := 100000
  );
  port(
    CLK : in std_logic;
    RST : in std_logic;
 
    SDA : inout std_logic;
    SCL : inout std_logic;

    I2C_IN : in std_logic_vector(31 downto 0);
    I2C_IN_STB : in std_logic;
    I2C_IN_ACK : out std_logic;
 
    I2C_OUT : out std_logic_vector(31 downto 0);
    I2C_OUT_STB : out std_logic;
    I2C_OUT_ACK : in std_logic
  );
  end component I2C;

  type STATE_TYPE is(GET_COMMAND, EXECUTE_COMMAND, WRITE, READ);
  signal STATE : STATE_TYPE;

  type OPERATION_TYPE is(WRITE, READ);
  type COMMAND_TYPE is 
    record
    OPERATION : OPERATION_TYPE;
    DATA : std_logic_vector(31 downto 0);
  end record;

  signal COMMAND : COMMAND_TYPE;
  type COMMANDS_TYPE is array (integer range 0 to 5) of COMMAND_TYPE;
  signal COMMANDS : COMMANDS_TYPE := (
    0 => (OPERATION => WRITE, DATA => X"000000AA"),
    1 => (OPERATION => READ,  DATA => X"00000001"),
    2 => (OPERATION => WRITE, DATA => X"000001AA"),
    3 => (OPERATION => READ,  DATA => X"000000FF"),
    4 => (OPERATION => WRITE, DATA => X"00000DAA"),
    5 => (OPERATION => READ,  DATA => X"000000FF")
  );
  signal PROGRAM_COUNTER : integer := 0;

  signal CLK : std_logic;
  signal RST : std_logic;

  signal SDA : std_logic;
  signal SCL : std_logic;

  signal I2C_IN : std_logic_vector(31 downto 0);
  signal I2C_IN_STB : std_logic;
  signal I2C_IN_ACK : std_logic;

  signal I2C_OUT : std_logic_vector(31 downto 0);
  signal I2C_OUT_STB : std_logic;
  signal I2C_OUT_ACK : std_logic;

begin

  UUT : I2C generic map(
    CLOCKS_PER_SECOND => 50000000,
    SPEED => 5000000
  )
  port map(
    CLK => CLK,
    RST => RST,
 
    SDA => SDA,
    SCL => SCL,

    I2C_IN => I2C_IN,
    I2C_IN_STB => I2C_IN_STB,
    I2C_IN_ACK => I2C_IN_ACK,
 
    I2C_OUT => I2C_OUT,
    I2C_OUT_STB => I2C_OUT_STB,
    I2C_OUT_ACK => I2C_OUT_ACK
  );

  process
  begin
    while True loop
      CLK <= '0';
      wait for 10 ns;
      CLK <= '1';
      wait for 10 ns;
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

  process
  begin
    wait until rising_edge(CLK);
    case STATE is

      when GET_COMMAND =>
        report integer'image(PROGRAM_COUNTER);
        COMMAND <= COMMANDS(PROGRAM_COUNTER);
        if PROGRAM_COUNTER < 5 then
          PROGRAM_COUNTER <= PROGRAM_COUNTER + 1;
        end if;
        STATE <= EXECUTE_COMMAND;

      when EXECUTE_COMMAND =>
        if COMMAND.OPERATION = WRITE then
          STATE <= WRITE;
        elsif COMMAND.OPERATION = READ then
          STATE <= READ;
        end if;

      when WRITE =>
        I2C_IN <= COMMAND.DATA;
        I2C_IN_STB <= '1';
        if I2C_IN_STB = '1' and I2C_IN_ACK = '1' then
          I2C_IN_STB <= '0';
          STATE <= GET_COMMAND;
        end if;

      when READ =>
        I2C_OUT_ACK <= '1';
        if I2C_OUT_STB = '1' and I2C_OUT_ACK = '1' then
          I2C_OUT_ACK <= '0';
          STATE <= GET_COMMAND;
          report integer'image(to_integer(unsigned(I2C_OUT)));
          assert I2C_OUT = COMMAND.DATA;
        end if;

    end case;
    if RST = '1' then
      STATE <= GET_COMMAND;
      PROGRAM_COUNTER <= 0;
      I2C_IN_STB <= '0';
      I2C_OUT_ACK <= '0';
    end if;
  end process;

end RTL;

