LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY work;
USE work.common.ALL;

PACKAGE test_pkt_infra IS
  PROCEDURE receive_preamble
  (E_RX_CLK_period : IN TIME;
  SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));

  PROCEDURE receive_ethernet_header
  (E_RX_CLK_period : IN TIME;
  SRC_MAC : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
  DST_MAC : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));

  PROCEDURE receive_ip_header
  (E_RX_CLK_period : IN TIME;
   SRC_IP : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   DST_IP : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIZE : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
   SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));

  PROCEDURE receive_udp_header
  (E_RX_CLK_period : IN TIME;
  SRC_PORT : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  DST_PORT : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  LENGTH : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));

  PROCEDURE receive_empty_admin_payload
  (E_RX_CLK_period : IN TIME;
   SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));

  PROCEDURE receive_null_fcs
  (E_RX_CLK_period : IN TIME;
   SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));

  PROCEDURE receive_any_random_payload
  (E_RX_CLK_period : IN TIME;
  SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));

  PROCEDURE receive_any_random_packet
  (E_RX_CLK_period : IN TIME;
   SIGNAL E_RX_DV : OUT STD_LOGIC;
   SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));

END test_pkt_infra;

PACKAGE BODY test_pkt_infra IS

PROCEDURE receive_preamble
  (E_RX_CLK_period : IN TIME;
  SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
BEGIN

  FOR i IN 0 TO 14 LOOP
    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;
  END LOOP;
  E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;
END receive_preamble;


PROCEDURE receive_ethernet_header
  (E_RX_CLK_period : IN TIME;
  SRC_MAC : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
  DST_MAC : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
BEGIN

  FOR i IN 5 DOWNTO 0 LOOP
    FOR j IN 0 TO 1 LOOP
      E_RXD <= DST_MAC(i * 8 + j * 4 + 3 DOWNTO i * 8 + j * 4);
      WAIT FOR E_RX_CLK_period;
    END LOOP;
  END LOOP;

  FOR i IN 5 DOWNTO 0 LOOP
    FOR j IN 0 TO 1 LOOP
      E_RXD <= SRC_MAC(i * 8 + j * 4 + 3 DOWNTO i * 8 + j * 4);
      WAIT FOR E_RX_CLK_period;
    END LOOP;
  END LOOP;

  E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
END receive_ethernet_header;


PROCEDURE receive_ip_header
  (E_RX_CLK_period : IN TIME;
   SRC_IP : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   DST_IP : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIZE : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
   SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
BEGIN
  E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

  FOR i IN 1 DOWNTO 0 LOOP
    FOR j IN 0 TO 1 LOOP
      E_RXD <= SIZE(i * 8 + j * 4 + 3 DOWNTO i * 8 + j * 4);
      WAIT FOR E_RX_CLK_period;
    END LOOP;
  END LOOP;

  -- ID
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

  -- FLAGS
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

  -- Fragment Offset
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

  -- TTL
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;

  -- Protocol
  E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;

  -- Checksum UNUSED
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

  -- Src IP
  FOR i IN 3 DOWNTO 0 LOOP
    FOR j IN 0 TO 1 LOOP
      E_RXD <= SRC_IP(i * 8 + j * 4 + 3 DOWNTO i * 8 + j * 4);
      WAIT FOR E_RX_CLK_period;
    END LOOP;
  END LOOP;

  -- Dst IP
  FOR i IN 3 DOWNTO 0 LOOP
    FOR j IN 0 TO 1 LOOP
      E_RXD <= DST_IP(i * 8 + j * 4 + 3 DOWNTO i * 8 + j * 4);
      WAIT FOR E_RX_CLK_period;
    END LOOP;
  END LOOP;

END receive_ip_header;


PROCEDURE receive_udp_header
  (E_RX_CLK_period : IN TIME;
  SRC_PORT : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  DST_PORT : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  LENGTH : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
BEGIN
  FOR i IN 1 DOWNTO 0 LOOP
    FOR j IN 0 TO 1 LOOP
      E_RXD <= SRC_PORT(i * 8 + j * 4 + 3 DOWNTO i * 8 + j * 4);
      WAIT FOR E_RX_CLK_period;
    END LOOP;
  END LOOP;

  FOR i IN 1 DOWNTO 0 LOOP
    FOR j IN 0 TO 1 LOOP
      E_RXD <= DST_PORT(i * 8 + j * 4 + 3 DOWNTO i * 8 + j * 4);
      WAIT FOR E_RX_CLK_period;
    END LOOP;
  END LOOP;

  FOR i IN 1 DOWNTO 0 LOOP
    FOR j IN 0 TO 1 LOOP
      E_RXD <= LENGTH(i * 8 + j * 4 + 3 DOWNTO i * 8 + j * 4);
      WAIT FOR E_RX_CLK_period;
    END LOOP;
  END LOOP;

  -- CHECKSUM
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

END receive_udp_header;


PROCEDURE receive_empty_admin_payload
  (E_RX_CLK_period : IN TIME;
   SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
BEGIN
  FOR i IN 0 TO 175 LOOP
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  END LOOP;

  -- HASH
  E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;

END receive_empty_admin_payload;

PROCEDURE receive_null_fcs
  (E_RX_CLK_period : IN TIME;
   SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
BEGIN
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
END receive_null_fcs;

PROCEDURE receive_any_random_payload
(E_RX_CLK_period : IN TIME;
 SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
BEGIN
  E_RXD <= x"7"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"6"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"2"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"9"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"b"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"3"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;

  FOR i IN 0 TO 159 LOOP
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
  END LOOP;

  E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"b"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"3"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"9"; WAIT FOR E_RX_CLK_period;
  E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;
END receive_any_random_payload;

PROCEDURE receive_any_random_packet
(E_RX_CLK_period : IN TIME;
 SIGNAL E_RX_DV : OUT STD_LOGIC;
 SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
BEGIN
  E_RX_DV <= '1';
  receive_preamble(E_RX_CLK_period, E_RXD);
  receive_ethernet_header(E_RX_CLK_period, x"afbf61691caa", x"54cb4503dbab", E_RXD);
  receive_ip_header(E_RX_CLK_period, x"0a5ea9b0", x"0aeb963e", x"0078", E_RXD);
  receive_udp_header(E_RX_CLK_period, x"cc1c", x"f2fb", x"0064", E_RXD);
  receive_any_random_payload(E_RX_CLK_period, E_RXD);
  receive_null_fcs(E_RX_CLK_period, E_RXD);
  E_RX_DV <= '0';
END receive_any_random_packet;

END test_pkt_infra;
