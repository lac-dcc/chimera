LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.common.ALL;

ENTITY coreout IS
  GENERIC (
    --g_reply_mac : STD_LOGIC_VECTOR(47 DOWNTO 0) := x"d3f0f3d6f694" -- Patrick's Mac Pro eth0 MAC
    --g_reply_mac : STD_LOGIC_VECTOR(47 DOWNTO 0) := x"7dce1feb27b8" -- Raspberry Pi 2 B eth0 MAC
    g_reply_mac : STD_LOGIC_VECTOR(47 DOWNTO 0) := x"06bd5332a6dc" -- Raspberry Pi 4 B eth0 MAC
  );
  PORT (
    clk : IN STD_LOGIC;
    -- Data received
    rcv_data : IN rcv_data_t;
    rcv_data_dv : IN STD_LOGIC;


    -- Data to send.
    el_snd_data : OUT snd_data_t;
    el_snd_en : OUT STD_LOGIC

  );
END coreout;

ARCHITECTURE rtl OF coreout IS
  TYPE state_t IS (
    -- MINDFUL: must have odd number of stages to slip in an update
    -- within TX clk cycles
    Idle,
    MetaInfo,
    ChecksumCalc,
    ChecksumPopulate,
    IPHeader,
    UDPHeader,
    Finalise,
    Send
  );

  TYPE ostate_t IS RECORD
    s : state_t;

    chksumbuf : UNSIGNED(31 DOWNTO 0);
  END RECORD;

  SIGNAL s, sin : ostate_t
  := ostate_t' (
  s => Idle,
  chksumbuf => x"00000000"
  );

  SIGNAL rd : rcv_data_t
  := rcv_data_t'(
  srcMAC => (OTHERS => '0'), dstMAC => (OTHERS => '0'),
  srcIP => (OTHERS => '0'), dstIP => (OTHERS => '0'),
  ipHeaderLength => 0, ipLength => 0,
  srcPort => (OTHERS => '0'), dstPort => (OTHERS => '0'),
  dnsLength => 0,
  dnsPkt => (OTHERS => '0')
  );

  SIGNAL sd : snd_data_t
  := snd_data_t'(
  srcMAC => (OTHERS => '0'), dstMAC => (OTHERS => '0'),
  srcIP => (OTHERS => '0'), dstIP => (OTHERS => '0'),
  ipLength => (OTHERS => '0'), ipTTL => (OTHERS => '0'),
  ipChecksum => (OTHERS => '0'),
  srcPort => (OTHERS => '0'), dstPort => (OTHERS => '0'),
  udpLength => (OTHERS => '0'), udpChecksum => (OTHERS => '0'),
  dnsPktCnt => 0, dnsPkt => (OTHERS => '0')
  );

BEGIN

  snd : PROCESS (clk)
    VARIABLE ipLengthbuf : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    VARIABLE udpLengthbuf : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    VARIABLE srcIPchecksumbuf : UNSIGNED(31 DOWNTO 0) := (OTHERS => '0');
    VARIABLE dstIPchecksumbuf : UNSIGNED(31 DOWNTO 0) := (OTHERS => '0');
    VARIABLE dnsLengthbuf : NATURAL RANGE 0 TO 65535 := 0;
  BEGIN
    IF rising_edge(clk) THEN
      el_snd_en <= '0';

      CASE s.s IS
        WHEN Idle =>
          IF (rcv_data_dv = '1') THEN
            sin.s <= MetaInfo;
            rd <= rcv_data;
          ELSE
            sin.s <= Idle;
          END IF;

        ---------SEND PACKET STAGE----------
        WHEN MetaInfo =>
          sd.srcIP <= rd.dstIP;
          sd.dstIP <= rd.srcIP;
          sd.srcPort <= rd.dstPort;
          sd.dstPort <= rd.srcPort;
          sd.ipTTL <= x"40";
          ipLengthbuf := STD_LOGIC_VECTOR(to_unsigned(rd.ipLength, ipLengthbuf'length));
          dnsLengthbuf := rd.dnsLength;
          srcIPchecksumbuf := unsigned(STD_LOGIC_VECTOR'(x"0000" & rd.dstIP(23 DOWNTO 16) & rd.dstIP(31 DOWNTO 24))) +
            unsigned(STD_LOGIC_VECTOR'(x"0000" & rd.dstIP(7 DOWNTO 0) & rd.dstIP(15 DOWNTO 8)));
          dstIPchecksumbuf := unsigned(STD_LOGIC_VECTOR'(x"0000" & rd.srcIP(23 DOWNTO 16) & rd.srcIP(31 DOWNTO 24))) +
            unsigned(STD_LOGIC_VECTOR'(x"0000" & rd.srcIP(7 DOWNTO 0) & rd.srcIP(15 DOWNTO 8)));
          sin.s <= ChecksumCalc;

        WHEN ChecksumCalc =>
          sin.chksumbuf <= x"00004500" +
          unsigned(STD_LOGIC_VECTOR'(x"0000" & ipLengthbuf(3 DOWNTO 0) & ipLengthbuf(7 DOWNTO 4))) +
          unsigned(STD_LOGIC_VECTOR'(x"0000" & sd.ipTTL & x"11")) +
          srcIPchecksumbuf + dstIPchecksumbuf;
          IF (dnsLengthbuf >= 128) THEN  --bytes
            sd.dnsPktCnt <= 1020;
            udpLengthbuf := STD_LOGIC_VECTOR(to_unsigned(136, udpLengthbuf'length)); -- 128 + 8 = 136
          ELSE
            sd.dnsPktCnt <= rd.dnsLength * 8 - 4;
            udpLengthbuf := STD_LOGIC_VECTOR(to_unsigned(rd.dnsLength + 8, udpLengthbuf'length));
          END IF;
          sin.s <= ChecksumPopulate;

        WHEN ChecksumPopulate =>
          sin.chksumbuf <= NOT resize(s.chksumbuf(31 DOWNTO 16) + s.chksumbuf(15 DOWNTO 0), sin.chksumbuf'length);
          sd.udpChecksum <= x"0000";
          sin.s <= IPHeader;

        WHEN IPHeader =>
          sd.ipLength(3 DOWNTO 0) <= ipLengthbuf(15 DOWNTO 12);
          sd.ipLength(7 DOWNTO 4) <= ipLengthbuf(11 DOWNTO 8);
          sd.ipLength(11 DOWNTO 8) <= ipLengthbuf(7 DOWNTO 4);
          sd.ipLength(15 DOWNTO 12) <= ipLengthbuf(3 DOWNTO 0);
          sd.ipChecksum(15 DOWNTO 8) <= STD_LOGIC_VECTOR(s.chksumbuf(7 DOWNTO 0));
          sd.ipChecksum(7 DOWNTO 0) <= STD_LOGIC_VECTOR(s.chksumbuf(15 DOWNTO 8));
          sin.s <= UDPHeader;

        WHEN UDPHeader =>
          sd.udpLength(15 DOWNTO 8) <= udpLengthbuf(7 DOWNTO 0);
          sd.udpLength(7 DOWNTO 0) <= udpLengthbuf(15 DOWNTO 8);

          sin.s <= Finalise;

        WHEN Finalise =>
          sd.srcMAC <= rd.dstMAC;
          sd.dstMAC <= g_reply_mac;
          sd.dnsPkt <= rd.dnsPkt;
          sin.s <= Send;

        WHEN Send =>
          el_snd_en <= '1';
          sin.s <= Idle;

      END CASE;
    END IF;
  END PROCESS;

  el_snd_data <= sd;

  reg : PROCESS (clk)
  BEGIN
    IF falling_edge(clk) THEN
      s <= sin;
    END IF;
  END PROCESS;

END rtl;
