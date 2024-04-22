LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.common.ALL;
ENTITY FIFO_snd IS
  GENERIC (
    g_depth : NATURAL := 8
  );
  PORT (
    wclk : IN STD_LOGIC; -- Write Clock
    rclk : IN STD_LOGIC; -- Read Clock

    w_en : IN STD_LOGIC; -- Write Enable
    w_data : IN snd_data_t; -- Ethernet Send Data in

    r_en : IN STD_LOGIC; -- Read Enable
    r_data : OUT snd_data_t; -- Ethernet Send Data out
    buf_not_empty : OUT STD_LOGIC -- Buffer NOT Empty
  );
END FIFO_snd;

ARCHITECTURE rtl OF FIFO_snd IS

  TYPE buf_t IS ARRAY (0 TO g_depth - 1) OF snd_data_t;

  SIGNAL buf : buf_t := (OTHERS => (
  srcMAC => (OTHERS => '0'), dstMAC => (OTHERS => '0'),
  srcIP => (OTHERS => '0'), dstIP => (OTHERS => '0'),
  ipLength => (OTHERS => '0'), ipTTL => (OTHERS => '0'),
  ipChecksum => (OTHERS => '0'),
  srcPort => (OTHERS => '0'), dstPort => (OTHERS => '0'),
  udpLength => (OTHERS => '0'),
  udpChecksum => (OTHERS => '0'),
  dnsPktCnt => 0, dnsPkt => (OTHERS => '0')));

  SIGNAL w_index, win_index : NATURAL RANGE 0 TO g_depth - 1 := 0;
  SIGNAL r_index, rin_index : NATURAL RANGE 0 TO g_depth - 1 := 0;

BEGIN

  fifo_wnsl : PROCESS (wclk)
  BEGIN
    IF (rising_edge(wclk)) THEN

      IF (w_en = '1') THEN
        buf(w_index) <= w_data;
        IF (w_index = g_depth - 1) THEN
          win_index <= 0;
        ELSE
          win_index <= w_index + 1;
        END IF;
      ELSE
        win_index <= w_index;
      END IF;

    END IF;
  END PROCESS;

  fifo_wreg : PROCESS (wclk)
  BEGIN
    IF falling_edge(wclk) THEN
      w_index <= win_index;
    END IF;
  END PROCESS;

  r_data <= buf(r_index);

  fifo_rnsl : PROCESS (rclk)
  BEGIN
    IF (rising_edge(rclk)) THEN

      IF (r_en = '1') THEN
        IF (r_index = g_depth - 1) THEN
          rin_index <= 0;
        ELSE
          rin_index <= r_index + 1;
        END IF;
      ELSE
        rin_index <= r_index;
      END IF;
    END IF;
  END PROCESS;

  fifo_rreg : PROCESS (rclk)
  BEGIN
    IF falling_edge(rclk) THEN
      r_index <= rin_index;
    END IF;
  END PROCESS;

  buf_not_empty <= '0' WHEN w_index = r_index ELSE
    '1';

END rtl;
