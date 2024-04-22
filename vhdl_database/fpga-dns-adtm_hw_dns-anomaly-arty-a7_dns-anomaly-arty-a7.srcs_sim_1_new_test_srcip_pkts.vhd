LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY work;
USE work.common.ALL;

LIBRARY work;
USE work.test_pkt_infra.ALL;

PACKAGE test_srcip_pkts IS
  PROCEDURE srcip_empty_test_suite
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));

  PROCEDURE srcip_admin_black_test_suite
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));

  PROCEDURE srcip_admin_white_test_suite
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END test_srcip_pkts;

PACKAGE BODY test_srcip_pkts IS

  PROCEDURE receive_srcip_admin_black_payload
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) is
  BEGIN
    FOR i IN 0 TO 49 LOOP
      E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    END LOOP;

    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

    FOR i IN 0 TO 107 LOOP
      E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    END LOOP;

    -- HASH
    E_RXD <= x"2"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"6"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"b"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"9"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;
  END receive_srcip_admin_black_payload;

  PROCEDURE receive_srcip_admin_white_payload
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) is
  BEGIN
    FOR i IN 0 TO 47 LOOP
      E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    END LOOP;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"b"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"6"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"7"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;

    FOR i IN 0 TO 109 LOOP
      E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    END LOOP;

    -- HASH
    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"6"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"2"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"6"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"b"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;
  END receive_srcip_admin_white_payload;

  PROCEDURE receive_srcip_admin_black_packet
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    E_RX_DV <= '1';
    receive_preamble(E_RX_CLK_period, E_RXD);
    receive_ethernet_header(E_RX_CLK_period, x"b043df1bb706", x"000a35ffffff", E_RXD);
    receive_ip_header(E_RX_CLK_period, x"0ac4e67a", x"0a6b1ba0", x"0078", E_RXD);
    receive_udp_header(E_RX_CLK_period, x"2ba3", x"2ebc", x"0064", E_RXD);
    receive_srcip_admin_black_payload(E_RX_CLK_period, E_RXD);
    receive_null_fcs(E_RX_CLK_period, E_RXD);
    E_RX_DV <= '0';
  END receive_srcip_admin_black_packet;

  PROCEDURE receive_srcip_admin_white_packet
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    E_RX_DV <= '1';
    receive_preamble(E_RX_CLK_period, E_RXD);
    receive_ethernet_header(E_RX_CLK_period, x"b043df1bb706", x"000a35ffffff", E_RXD);
    receive_ip_header(E_RX_CLK_period, x"0aee28fc", x"0a6b1ba0", x"0078", E_RXD);
    receive_udp_header(E_RX_CLK_period, x"2ba3", x"2ebc", x"0064", E_RXD);
    receive_srcip_admin_white_payload(E_RX_CLK_period, E_RXD);
    receive_null_fcs(E_RX_CLK_period, E_RXD);
    E_RX_DV <= '0';
  END receive_srcip_admin_white_packet;

  PROCEDURE receive_srcip_blacklist_one_packet
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    E_RX_DV <= '1';
    receive_preamble(E_RX_CLK_period, E_RXD);
    receive_ethernet_header(E_RX_CLK_period, x"d60c2706b70a", x"e4ce33abdab0", E_RXD);
    receive_ip_header(E_RX_CLK_period, x"0ac728aa", x"0a6b1ba0", x"0078", E_RXD);
    receive_udp_header(E_RX_CLK_period, x"2ba3", x"2ebc", x"0064", E_RXD);
    receive_any_random_payload(E_RX_CLK_period, E_RXD);
    receive_null_fcs(E_RX_CLK_period, E_RXD);
    E_RX_DV <= '0';
  END receive_srcip_blacklist_one_packet;

  PROCEDURE receive_srcip_blacklist_two_packet
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    E_RX_DV <= '1';
    receive_preamble(E_RX_CLK_period, E_RXD);
    receive_ethernet_header(E_RX_CLK_period, x"cd9783f7189a", x"f827353ef560", E_RXD);
    receive_ip_header(E_RX_CLK_period, x"0aee28fc", x"0a6b1ba0", x"0078", E_RXD);
    receive_udp_header(E_RX_CLK_period, x"2ba3", x"2ebc", x"0064", E_RXD);
    receive_any_random_payload(E_RX_CLK_period, E_RXD);
    receive_null_fcs(E_RX_CLK_period, E_RXD);
    E_RX_DV <= '0';
  END receive_srcip_blacklist_two_packet;

  PROCEDURE receive_srcip_whitelist_one_packet
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    E_RX_DV <= '1';
    receive_preamble(E_RX_CLK_period, E_RXD);
    receive_ethernet_header(E_RX_CLK_period, x"b9b9331d2000", x"514950422ebb", E_RXD);
    receive_ip_header(E_RX_CLK_period, x"0a3c8747", x"0a6b1ba0", x"0078", E_RXD);
    receive_udp_header(E_RX_CLK_period, x"2ba3", x"2ebc", x"0064", E_RXD);
    receive_any_random_payload(E_RX_CLK_period, E_RXD);
    receive_null_fcs(E_RX_CLK_period, E_RXD);
    E_RX_DV <= '0';
  END receive_srcip_whitelist_one_packet;

  PROCEDURE receive_srcip_whitelist_two_packet
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    E_RX_DV <= '1';
    receive_preamble(E_RX_CLK_period, E_RXD);
    receive_ethernet_header(E_RX_CLK_period, x"6ae1c34da084", x"e76e2d19f507", E_RXD);
    receive_ip_header(E_RX_CLK_period, x"0ae865b0", x"0a6b1ba0", x"0078", E_RXD);
    receive_udp_header(E_RX_CLK_period, x"2ba3", x"2ebc", x"0064", E_RXD);
    receive_any_random_payload(E_RX_CLK_period, E_RXD);
    receive_null_fcs(E_RX_CLK_period, E_RXD);
    E_RX_DV <= '0';
  END receive_srcip_whitelist_two_packet;

  PROCEDURE receive_srcip_empty_admin_packet
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    E_RX_DV <= '1';
    receive_preamble(E_RX_CLK_period, E_RXD);
    receive_ethernet_header(E_RX_CLK_period, x"b043df1bb706", x"000a35ffffff", E_RXD);
    receive_ip_header(E_RX_CLK_period, x"0ac4e67a", x"0a6b1ba0", x"0078", E_RXD);
    receive_udp_header(E_RX_CLK_period, x"2ba3", x"2ebc", x"0064", E_RXD);
    receive_empty_admin_payload(E_RX_CLK_period, E_RXD);
    receive_null_fcs(E_RX_CLK_period, E_RXD);
    E_RX_DV <= '0';
  END receive_srcip_empty_admin_packet;

  PROCEDURE srcip_empty_test_suite
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    receive_srcip_empty_admin_packet(E_RX_CLK_period, E_RX_DV, E_RXD);
    WAIT FOR E_RX_CLK_period * 200;

    FOR i IN 0 TO 9 LOOP
      receive_any_random_packet(E_RX_CLK_period, E_RX_DV, E_RXD);
      WAIT FOR E_RX_CLK_period * 200;
    END LOOP;

  END srcip_empty_test_suite;

  PROCEDURE srcip_admin_black_test_suite
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    receive_srcip_admin_black_packet(E_RX_CLK_period, E_RX_DV, E_RXD);
    WAIT FOR E_RX_CLK_period * 200;

    FOR i IN 0 TO 9 LOOP
      receive_any_random_packet(E_RX_CLK_period, E_RX_DV, E_RXD);
      WAIT FOR E_RX_CLK_period * 200;
    END LOOP;

    FOR i IN 0 TO 4 LOOP
      -- Black list 1
      receive_srcip_blacklist_one_packet(E_RX_CLK_period, E_RX_DV, E_RXD);
      WAIT FOR E_RX_CLK_period * 200;
    END LOOP;

    FOR i IN 0 TO 4 LOOP
      -- Black list 2
      receive_srcip_blacklist_two_packet(E_RX_CLK_period, E_RX_DV, E_RXD);
      WAIT FOR E_RX_CLK_period * 200;
    END LOOP;

  END srcip_admin_black_test_suite;

  PROCEDURE srcip_admin_white_test_suite
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    receive_srcip_admin_white_packet(E_RX_CLK_period, E_RX_DV, E_RXD);
    WAIT FOR E_RX_CLK_period * 200;

    FOR i IN 0 TO 9 LOOP
      receive_any_random_packet(E_RX_CLK_period, E_RX_DV, E_RXD);
      WAIT FOR E_RX_CLK_period * 200;
    END LOOP;

    FOR i IN 0 TO 4 LOOP
      -- White list 1
      receive_srcip_whitelist_one_packet(E_RX_CLK_period, E_RX_DV, E_RXD);
      WAIT FOR E_RX_CLK_period * 200;
    END LOOP;

    FOR i IN 0 TO 4 LOOP
      -- White list 2
      receive_srcip_whitelist_two_packet(E_RX_CLK_period, E_RX_DV, E_RXD);
      WAIT FOR E_RX_CLK_period * 200;
    END LOOP;

  END srcip_admin_white_test_suite;

END test_srcip_pkts;
