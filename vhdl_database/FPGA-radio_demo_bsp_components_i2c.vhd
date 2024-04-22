--- COMMAND
--- =======
---
--- Bits (7:0)
--- ----------
--- (For write byte only) data payload byte
---
--- Bit (8)
--- -------
--- 1 = read byte
--- 0 = write byte
---
--- Bit (9)
--- -------
--- 1 = SEND_START
---
--- Bit (10)
--- --------
--- 1 = SEND_STOP
---
--- Bit (11)
--- --------
--- (For read byte only) 1 = SEND_ACK
---
--- RESPONSE
--- ========
---
--- Bits (7:0)
--- ----------
--- (For read byte only) data payload byte
---
--- Bit (0)
--- -------
--- (For write byte only) 1 = NACK, 0 = ACK
---

library ieee;
use ieee.std_logic_1164.all;
 
entity I2C is
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
end entity I2C;
 
architecture RTL of I2C is
 
  constant I2C_DELAY : integer := CLOCKS_PER_SECOND / (2*SPEED);
 
  type STATE_TYPE is (
    MAIN_0, MAIN_1, MAIN_2, MAIN_3, GET_BYTE_0, GET_BYTE_1, GET_BYTE_2,
    GET_BYTE_3, SEND_BYTE_0, SEND_BYTE_1, SEND_BYTE_2, SEND_BYTE_3, SEND_BYTE_4,
    SEND_BIT_0, SEND_BIT_1, SEND_BIT_2, GET_BIT_0, GET_BIT_1, GET_BIT_2,
    SEND_START_0, SEND_START_1, SEND_START_2, SEND_START_3, SEND_START_4,
    SEND_STOP_0, SEND_STOP_1, SEND_STOP_2, SEND_STOP_3, SEND_STOP_4
  );
 
  signal STATE, GET_BYTE_RETURN, SEND_BYTE_RETURN, SEND_BIT_RETURN, GET_BIT_RETURN,
  SEND_STOP_RETURN, SEND_START_RETURN : STATE_TYPE;
  signal TIMER : integer range 0 to I2C_DELAY;
  signal COUNT : integer range 0 to 7;
 
  signal COMMAND : std_logic_vector(31 downto 0);
  signal RESPONSE : std_logic_vector(31 downto 0);
  signal STARTED : std_logic;
 
  signal S_I2C_IN_ACK : std_logic;
  signal S_I2C_OUT_STB : std_logic;
 
  signal SDA_I_D, SDA_I_SYNCH, SDA_I, SDA_O : std_logic;
  signal SCL_I_D, SCL_I_SYNCH, SCL_I, SCL_O : std_logic;
  signal BIT : std_logic;
 
begin
 
  SDA <= 'Z' when SDA_O = '1' else '0';
  SDA_I <= '1' when SDA /= '0' else '0';
 
  SCL <= 'Z' when SCL_O = '1' else '0';
  SCL_I <= '1' when SCL /= '0' else '0';
 
  process
  begin
    wait until rising_edge(CLK);
    SDA_I_D <= SDA_I;
    SDA_I_SYNCH <= SDA_I_D;
    SCL_I_D <= SCL_I;
    SCL_I_SYNCH <= SCL_I_D;
    case STATE is
 
      --MAIN SUBROUTINE
      when MAIN_0 =>

        COUNT <= 7;
        TIMER <= I2C_DELAY;
        STATE <= MAIN_1;
        STARTED <= '0';
 
      when MAIN_1 =>
 
        S_I2C_IN_ACK <= '1';
        if I2C_IN_STB = '1' and S_I2C_IN_ACK = '1' then
          S_I2C_IN_ACK <= '0';
          COMMAND <= I2C_IN;
          STATE <= MAIN_2;
        end if;
 
      when MAIN_2 =>
 
        if COMMAND(8) = '1' then
          RESPONSE <= (others => '0');
          STATE <= GET_BYTE_0;
          GET_BYTE_RETURN <= MAIN_3;
        else
          RESPONSE <= (others => '0');
          STATE <= SEND_BYTE_0;
          SEND_BYTE_RETURN <= MAIN_3;
        end if;
 
      when MAIN_3 =>
 
        S_I2C_OUT_STB <= '1';
        I2C_OUT <= RESPONSE;
        if I2C_OUT_ACK = '1' and S_I2C_OUT_STB = '1' then
          S_I2C_OUT_STB <= '0';
          STATE <= MAIN_1;
        end if;
 
 
      --GET BYTE SUBROUTINE
 
      when GET_BYTE_0 =>
        STATE <= GET_BIT_0;
        GET_BIT_RETURN <= GET_BYTE_1;
 
      when GET_BYTE_1 =>
        RESPONSE(COUNT) <= BIT;
        if COUNT = 0 then
          COUNT <= 7;
          STATE <= GET_BYTE_2;
        else
          COUNT <= COUNT - 1;
          STATE <= GET_BYTE_0;
        end if;
 
      when GET_BYTE_2 =>
        --SEND NACK ACK = 0 NACK = 1
        BIT <= COMMAND(11);
        STATE <= SEND_BIT_0;
        SEND_BIT_RETURN <= GET_BYTE_3;
 
      when GET_BYTE_3 =>
        if COMMAND(10) = '1' then
          STATE <= SEND_STOP_0;
          SEND_STOP_RETURN <= GET_BYTE_RETURN;
        else
          STATE <= GET_BYTE_RETURN;
        end if;
 
 
      --SEND BYTE SUBROUTINE
 
      when SEND_BYTE_0 =>
        if COMMAND(9) = '1' then
          STATE <= SEND_START_0;
          SEND_START_RETURN <= SEND_BYTE_1;
        else
          STATE <= SEND_BYTE_1;
        end if;

      when SEND_BYTE_1 =>
        BIT <= COMMAND(COUNT);
        STATE <= SEND_BIT_0;
        SEND_BIT_RETURN <= SEND_BYTE_2;
 
      when SEND_BYTE_2 =>
        if COUNT = 0 then
          COUNT <= 7;
          STATE <= SEND_BYTE_3;
        else
          COUNT <= COUNT - 1;
          STATE <= SEND_BYTE_1;
        end if;
 
      when SEND_BYTE_3 =>
        --GET ACK
        STATE <= GET_BIT_0;
        GET_BIT_RETURN <= SEND_BYTE_4;
 
      when SEND_BYTE_4 =>
        --1 = NACK, 0 = ACK
        RESPONSE(0) <= BIT;
        if COMMAND(10) = '1' then
            STATE <= SEND_STOP_0;
            SEND_START_RETURN <= SEND_BYTE_RETURN;
        else
            STATE <= SEND_BYTE_RETURN;
        end if;
 
      --SEND START SUBROUTINE
 
      when SEND_START_0 =>

        if STARTED = '0' then
            STATE <= SEND_START_1;
        else
            STATE <= SEND_START_4;
        end if;

      when SEND_START_1 =>
        SDA_O <= '1';
        if TIMER = 0 then
          TIMER <= I2C_DELAY;
          STATE <= SEND_START_2;
        else
          TIMER <= TIMER - 1;
        end if;

      when SEND_START_2 =>
        SCL_O <= '1';
        if SCL_I_SYNCH = '1' then
          STATE <= SEND_START_3;
        end if;

      when SEND_START_3 =>
        if TIMER = 0 then
          TIMER <= I2C_DELAY;
          STATE <= SEND_START_4;
        else
          TIMER <= TIMER - 1;
        end if;
 
      when SEND_START_4 =>
        SDA_O <= '0';
        if TIMER = 0 then
          TIMER <= I2C_DELAY;
          STATE <= SEND_START_RETURN;
          SCL_O <= '0';
          STARTED <= '1';
        else
          TIMER <= TIMER - 1;
        end if;
 
      --SEND STOP SUBROUTINE
 
      when SEND_STOP_0 =>
 
        SDA_O <= '0';
        if TIMER = 0 then
          TIMER <= I2C_DELAY;
         STATE <= SEND_STOP_1;
        else
          TIMER <= TIMER - 1;
        end if;

      when SEND_STOP_1 =>
        SCL_O <= '1';
        if SCL_I_SYNCH = '1' then
          STATE <= SEND_STOP_2;
        end if;
 
      when SEND_STOP_2 =>
        if TIMER = 0 then
          TIMER <= I2C_DELAY;
          STATE <= SEND_STOP_3;
          SDA_O <= '1';
        else
          TIMER <= TIMER - 1;
        end if;

      when SEND_STOP_3 =>
        if TIMER = 0 then
          TIMER <= I2C_DELAY;
          STATE <= SEND_STOP_4;
        else
          TIMER <= TIMER - 1;
        end if;

      when SEND_STOP_4 =>
        if TIMER = 0 then
          TIMER <= I2C_DELAY;
          STATE <= SEND_STOP_RETURN;
          STARTED <= '0';
        else
          TIMER <= TIMER - 1;
        end if;
 
      --SEND BIT SUBROUTINE
 
      when SEND_BIT_0 =>
 
        SDA_O <= BIT;
        SCL_O <= '0';
        if TIMER = 0 then
          TIMER <= I2C_DELAY;
          STATE <= SEND_BIT_1;
        else
          TIMER <= TIMER - 1;
        end if;
 
      when SEND_BIT_1 =>
 
        --CLOCK STRETCHING
        SCL_O <= '1';
        if SCL_I_SYNCH = '1' then
          STATE <= SEND_BIT_2;
        end if;
 
      when SEND_BIT_2 =>
 
        if TIMER = 0 then
          TIMER <= I2C_DELAY;
          SCL_O <= '0';
          STATE <= SEND_BIT_RETURN;
        else
          TIMER <= TIMER - 1;
        end if;
 
      --GET BIT SUBROUTINE
 
      when GET_BIT_0 =>
 
        SDA_O <= '1';
        if TIMER = 0 then
          TIMER <= I2C_DELAY;
          STATE <= GET_BIT_1;
        else
          TIMER <= TIMER - 1;
        end if;
 
      when GET_BIT_1 =>
 
        --CLOCK STRETCHING
        SCL_O <= '1';
        if SCL_I_SYNCH = '1' then
          STATE <= GET_BIT_2;
        end if;
 
      when GET_BIT_2 =>
 
        BIT <= SDA_I_SYNCH;
        if TIMER = 0 then
          TIMER <= I2C_DELAY;
          STATE <= GET_BIT_RETURN;
          SCL_O <= '0';
        else
          TIMER <= TIMER - 1;
        end if;

    end case;
 
    if RST = '1' then
      STATE <= MAIN_0;
      S_I2C_OUT_STB <= '0';
      SDA_O <= '1';
      SCL_O <= '1';
    end if;
 
  end process;
 
  I2C_OUT_STB <= S_I2C_OUT_STB;
  I2C_IN_ACK <= S_I2C_IN_ACK;

end RTL;
