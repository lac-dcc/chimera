LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY work;
USE work.common.ALL;

LIBRARY work;
USE work.test_pkt_infra.ALL;

PACKAGE test_reply_pkts IS
  PROCEDURE reply_dns_test_suite
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END test_reply_pkts;

PACKAGE BODY test_reply_pkts IS
  PROCEDURE receive_reply_admin_dns_payload
  (E_RX_CLK_period : IN TIME;
  SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    FOR i IN 0 TO 167 LOOP
      E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    END LOOP;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"2"; WAIT FOR E_RX_CLK_period;

    FOR i IN 0 TO 69 LOOP
      E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    END LOOP;

    -- SipHash MAC
    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"9"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"6"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"7"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"b"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"6"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;

  END receive_reply_admin_dns_payload;


  PROCEDURE receive_reply_admin_dns_packet
    (E_RX_CLK_period : IN TIME;
     SIGNAL E_RX_DV : OUT STD_LOGIC;
     SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    E_RX_DV <= '1';
    receive_preamble(E_RX_CLK_period, E_RXD);
    receive_ethernet_header(E_RX_CLK_period, x"b043df1bb706", x"000a35ffffff", E_RXD);
    receive_ip_header(E_RX_CLK_period, x"0ac4e67a", x"0a6b1ba0", x"009c", E_RXD);
    receive_udp_header(E_RX_CLK_period, x"2ba3", x"2ebc", x"0088", E_RXD);
    receive_reply_admin_dns_payload(E_RX_CLK_period, E_RXD);
    receive_null_fcs(E_RX_CLK_period, E_RXD);
    E_RX_DV <= '0';
  END receive_reply_admin_dns_packet;

  PROCEDURE reply_dns_test_suite
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    receive_reply_admin_dns_packet(E_RX_CLK_period, E_RX_DV, E_RXD);
    WAIT FOR E_RX_CLK_period * 200;

    FOR i IN 0 TO 9 LOOP
      receive_any_random_packet(E_RX_CLK_period, E_RX_DV, E_RXD);
      WAIT FOR E_RX_CLK_period * 200;
      -- should receive first 16 bits copied
      -- followed by 0x84, 0x33
      -- then 8 bytes of 0x00
    END LOOP;

  END reply_dns_test_suite;

END test_reply_pkts;
