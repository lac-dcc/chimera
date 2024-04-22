LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY work;
USE work.common.ALL;

LIBRARY work;
USE work.test_pkt_infra.ALL;

PACKAGE test_siphash_pkts IS
  PROCEDURE siphash_test_suite
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END test_siphash_pkts;

PACKAGE BODY test_siphash_pkts IS
  PROCEDURE receive_siphash_admin_payload
  (E_RX_CLK_period : IN TIME;
  SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    E_RXD <= x"3"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"6"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"9"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"7"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

    FOR i IN 0 TO 9 LOOP
      E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    END LOOP;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"2"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"7"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"3"; WAIT FOR E_RX_CLK_period;

    FOR i IN 0 TO 9 LOOP
      E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    END LOOP;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

    FOR i IN 0 TO 5 LOOP
      E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    END LOOP;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"9"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"2"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"3"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"f"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"9"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"9"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"2"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"6"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"2"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"9"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;

    FOR i IN 0 TO 15 LOOP
      E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    END LOOP;

    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"6"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;

    E_RXD <= x"d"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;

    FOR i IN 0 TO 81 LOOP
      E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    END LOOP;

    -- SipHash MAC
    E_RXD <= x"e"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"3"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"2"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"c"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"7"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"5"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"a"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"0"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"4"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"1"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"8"; WAIT FOR E_RX_CLK_period;
    E_RXD <= x"3"; WAIT FOR E_RX_CLK_period;

  END receive_siphash_admin_payload;


  PROCEDURE receive_siphash_admin_packet
    (E_RX_CLK_period : IN TIME;
     SIGNAL E_RX_DV : OUT STD_LOGIC;
     SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    E_RX_DV <= '1';
    receive_preamble(E_RX_CLK_period, E_RXD);
    receive_ethernet_header(E_RX_CLK_period, x"b043df1bb706", x"000a35ffffff", E_RXD);
    receive_ip_header(E_RX_CLK_period, x"0ac4e67a", x"0a6b1ba0", x"009c", E_RXD);
    receive_udp_header(E_RX_CLK_period, x"2ba3", x"2ebc", x"0088", E_RXD);
    receive_siphash_admin_payload(E_RX_CLK_period, E_RXD);
    receive_null_fcs(E_RX_CLK_period, E_RXD);
    E_RX_DV <= '0';
  END receive_siphash_admin_packet;

  PROCEDURE siphash_test_suite
    (E_RX_CLK_period : IN TIME;
    SIGNAL E_RX_DV : OUT STD_LOGIC;
    SIGNAL E_RXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) IS
  BEGIN
    receive_siphash_admin_packet(E_RX_CLK_period, E_RX_DV, E_RXD); WAIT FOR E_RX_CLK_period * 200;
    receive_siphash_admin_packet(E_RX_CLK_period, E_RX_DV, E_RXD); WAIT FOR E_RX_CLK_period * 200;
  END siphash_test_suite;

END test_siphash_pkts;
