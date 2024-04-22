LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.common.ALL;

ENTITY corein IS
  GENERIC (
    g_admin_mac : STD_LOGIC_VECTOR(47 DOWNTO 0) := x"ffffff350a00";
    g_admin_key : STD_LOGIC_VECTOR(127 DOWNTO 0) := x"decaface1eadf1a91713440219990927";
    g_query_mac : STD_LOGIC_VECTOR(47 DOWNTO 0) := x"ad91be350a00";
    g_normal_mac : STD_LOGIC_VECTOR(47 DOWNTO 0) := x"000000350a00";
    g_dns_rcode : STD_LOGIC_VECTOR(3 DOWNTO 0) := x"3"
  );
  PORT (
    clk : IN STD_LOGIC;
    -- Data received.
    el_rcv_data : IN rcv_data_t;
    el_rcv_dv : IN STD_LOGIC;
    el_rcv_ack : OUT STD_LOGIC;

    -- rcved data to snd
    snd_rcv_data : OUT rcv_data_t;
    snd_en : OUT STD_LOGIC;

    -- LEDs.
    LED : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END corein;

ARCHITECTURE rtl OF corein IS

  COMPONENT siphasher IS
    PORT (
      clk : IN STD_LOGIC;
      in_key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      in_data : IN STD_LOGIC_VECTOR(959 DOWNTO 0);
      in_start : IN STD_LOGIC;
      out_data : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      out_ready : OUT STD_LOGIC
    );
  END COMPONENT;

  TYPE state_t IS (
    -- MINDFUL: must have odd number of stages to slip in an update
    -- within TX clk cycles

    Idle,

    Read,
    CheckAdmin,
    CheckQuery,

    -- Query Stages
    ReplyQueryHeader,
    ReplyQuerySrcMACMeta,
    ReplyQuerySrcMACList,
    ReplyQueryDstMACMeta,
    ReplyQueryDstMACList,
    ReplyQuerySrcIPMeta,
    ReplyQuerySrcIPList,
    ReplyQueryDstIPMeta,
    ReplyQueryDstIPList,
    ReplyQuerySrcPortMeta,
    ReplyQuerySrcPortList,
    ReplyQueryDstPortMeta,
    ReplyQueryDstPortList,
    ReplyQueryDNSMeta,
    ReplyQueryDNSList,
    ReplyQueryReplyType,
    ReplyQueryCountersTot,
    ReplyQueryCountersSeg,

    -- Admin Stages
    StartHash,
    WaitHash,
    HashAuth,
    UpdateFilterSrcMACMeta,
    UpdateFilterSrcMACList,
    UpdateFilterDstMACMeta,
    UpdateFilterDstMACList,
    UpdateFilterSrcIPMeta,
    UpdateFilterSrcIPList,
    UpdateFilterDstIPMeta,
    UpdateFilterDstIPList,
    UpdateFilterSrcPortMeta,
    UpdateFilterSrcPortList,
    UpdateFilterDstPortMeta,
    UpdateFilterDstPortList,
    UpdateFilterDNSMeta,
    UpdateFilterDNSList,
    UpdateReplyType,

    -- Filtering Stages
    CheckSrcMAC,
    CmpSrcMAC,
    FilterSrcMACMatch,
    CheckDstMAC,
    CmpDstMAC,
    FilterDstMACMatch,
    CheckSrcIP,
    CmpSrcIP,
    FilterSrcIPMatch,
    CheckDstIP,
    CmpDstIP,
    FilterDstIPMatch,
    CheckSrcPort,
    CmpSrcPort,
    FilterSrcPortMatch,
    CheckDstPort,
    CmpDstPort,
    FilterDstPortMatch,
    CheckPkt,
    CmpPktCheck,
    CmpPktArea32,
    CmpPktArea24,
    CmpPktArea16,
    CmpPktArea8,
    CmpPktDone,
    FilterPkt,

    SetDNSReplyHeader,
    SetDNSReplyCount,
    SetDefaultMAC,

    Send
  );

  TYPE istate_t IS RECORD
    s : state_t;

    led : STD_LOGIC_VECTOR(3 DOWNTO 0); -- LED register.
    pc : NATURAL RANGE 0 TO 15; -- packet counter

    ahv : STD_LOGIC_VECTOR(63 DOWNTO 0); -- hash value;
    amc : NATURAL RANGE 0 TO 15; -- admin MAC counter
    aic : NATURAL RANGE 0 TO 15; -- admin IP counter
    apc : NATURAL RANGE 0 TO 15; -- admin UDP counter
    adc : NATURAL RANGE 0 TO 15; -- admin DNS counter

    fsmc : NATURAL RANGE 0 TO 15; -- filter srcMAC counter
    fdmc : NATURAL RANGE 0 TO 15; -- filter dstMAC counter
    fsic : NATURAL RANGE 0 TO 15; -- filter srcIP counter
    fdic : NATURAL RANGE 0 TO 15; -- filter dstIP counter
    fspc : NATURAL RANGE 0 TO 15; -- filter srcUDP counter
    fdpc : NATURAL RANGE 0 TO 15; -- filter dstUDP counter
    fdnsc : NATURAL RANGE 0 TO 15; -- filter dns item counter
    fpktsc : NATURAL RANGE 0 TO 1023; -- filter pkt start position counter
    fpktc : NATURAL RANGE 0 TO 128; -- filter pkt bits left counter
    fpktmf : STD_LOGIC; -- filter pkt match flag

    stc : UNSIGNED(63 DOWNTO 0); -- total valid pkts received
    sfc : UNSIGNED(63 DOWNTO 0); -- total filter passed pkts
    smc : UNSIGNED(63 DOWNTO 0); -- total filter passed mac pkts
    sic : UNSIGNED(63 DOWNTO 0); -- total filter passed ip pkts
    spc : UNSIGNED(63 DOWNTO 0); -- total filter passed port pkts

  END RECORD;

  SIGNAL s, sin : istate_t
  := istate_t'(
  s => Idle,

  led => x"0",
  pc => 0,

  ahv => x"0000000000000000",
  amc => 0,
  aic => 0,
  apc => 0,
  adc => 0,

  fsmc => 0,
  fdmc => 0,
  fsic => 0,
  fdic => 0,
  fspc => 0,
  fdpc => 0,
  fdnsc => 0,
  fpktsc => 0,
  fpktc => 0,
  fpktmf => '0',

  stc => (OTHERS => '0'),
  sfc => (OTHERS => '0'),
  smc => (OTHERS => '0'),
  sic => (OTHERS => '0'),
  spc => (OTHERS => '0')

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

  SIGNAL f : filter_t
  := filter_t'(
  --whitelist only VMWare MAC
  srcMACBW => '1',
  srcMACLength => 1,
  srcMACList => (x"ae295f290c00", x"000000000000"),

  --blacklist 00:0a:35:ff:ff:ff
  dstMACBW => '0',
  dstMACLength => 1,
  dstMACList => (x"ffffff350a00", x"000000000000"),

  --whitelist 0.0.0.0, 192.168.255.255
  srcIPBW => '1',
  srcIPLength => 2,
  srcIPList => (x"00000000", x"ffffa8c0"),

  --blacklist 1.2.3.4, 255.255.255.255
  dstIPBW => '0',
  dstIPLength => 2,
  dstIPList => (x"04030201", x"ffffffff"),

  --whitelist port 53 (0x35), 12345(0x3039)
  srcPortBW => '1',
  srcPortLength => 2,
  srcPortList => (x"3500", x"3930"),

  --whitelist port 53 (0x35), 23456(0x5ba0)
  dstPortBW => '1',
  dstPortLength => 2,
  dstPortList => (x"3500", x"a05b"),

  --blakclist apple.com (length 9 bytes), google.com(length 10 bytes)
  dnsBW => '0',
  dnsLength => 2,
  dnsItemEndPtr => (72, 80),
  dnsList => (x"000000000000006d6f632e656c707061", x"0000000000006d6f632e656c676f6f67"),

  replyType => '0'
  );

  SIGNAL siphash_start : STD_LOGIC := '0';
  SIGNAL siphash_ready : STD_LOGIC := '0';
BEGIN

  siphash : siphasher PORT MAP (
    clk => clk,
    in_key => g_admin_key,
    in_data => rd.dnsPkt(959 DOWNTO 0),
    in_start => siphash_start,
    out_data => sin.ahv,
    out_ready => siphash_ready
  );

  rcv : PROCESS (clk)
    VARIABLE filterPktEndPtr : NATURAL RANGE 0 TO 1024 := 0;
    VARIABLE filterPktAreaEndPtr : NATURAL RANGE 0 TO 1024 := 0;
    VARIABLE filterPktItemEndPtr : NATURAL RANGE 0 TO 128 := 0;
    VARIABLE filterPktItemPtr : NATURAL RANGE 0 TO 2 := 0;
  BEGIN

    IF rising_edge(clk) THEN
      snd_en <= '0';
      el_rcv_ack <= '0';
      siphash_start <= '0';

      CASE s.s IS
        WHEN Idle =>
          IF (el_rcv_dv = '1') THEN
            sin.s <= Read;
          ELSE
            sin.s <= Idle;
          END IF;
          --DEBUG
          --sin.led <= STD_LOGIC_VECTOR(to_unsigned(f.srcMACLength, sin.led'length));

        WHEN Read =>
          rd <= el_rcv_data;
          el_rcv_ack <= '1';
          sin.s <= CheckAdmin;

        WHEN CheckAdmin =>
          IF (rd.dstMAC = g_admin_mac) THEN
            -- SIGNALS recognition of admin pkt
            sin.led <= x"f";
            sin.s <= StartHash;
            sin.pc <= 0;
          ELSE
            sin.s <= CheckQuery;
          END IF;

        WHEN CheckQuery =>
          IF (rd.dstMAC = g_query_mac) THEN
            -- SIGNALS recognition of admin pkt
            sin.s <= ReplyQueryHeader;
          ELSE
            sin.s <= CheckSrcMAC;
            sin.stc <= s.stc + 1;
            sin.fsmc <= 0;
          END IF;

        WHEN ReplyQueryHeader =>
          rd.ipLength <= 201; -- 201 -> 0x00c9 -> 0x009c = 156
          rd.dnsLength <= 128;
          sin.s <= ReplyQuerySrcMacMeta;

        WHEN ReplyQuerySrcMACMeta =>
          rd.dnsPkt(0) <= f.srcMACBW;
          rd.dnsPkt(2 DOWNTO 1) <= STD_LOGIC_VECTOR(to_unsigned(f.srcMACLength, 2));
          sin.s <= ReplyQuerySrcMACList;
          sin.amc <= 0;

        WHEN ReplyQuerySrcMACList =>
          IF (s.amc = 0) THEN
            rd.dnsPkt(50 DOWNTO 3) <= f.srcMACList(0);
            sin.amc <= s.amc + 1;
          ELSIF (s.amc = 1) THEN
            rd.dnsPkt(98 DOWNTO 51) <= f.srcMACList(1);
            sin.amc <= s.amc + 1;
          ELSE
            sin.s <= ReplyQueryDstMACMeta;
          END IF;

        WHEN ReplyQueryDstMACMeta =>
          rd.dnsPkt(99) <= f.dstMACBW;
          rd.dnsPkt(101 DOWNTO 100) <= STD_LOGIC_VECTOR(to_unsigned(f.dstMACLength, 2));
          sin.s <= ReplyQueryDstMACList;
          sin.amc <= 0;

        WHEN ReplyQueryDstMACList =>
          IF (s.amc = 0) THEN
            rd.dnsPkt(149 DOWNTO 102) <= f.dstMACList(0);
            sin.amc <= s.amc + 1;
          ELSIF (s.amc = 1) THEN
            rd.dnsPkt(197 DOWNTO 150) <= f.dstMACList(1);
            sin.amc <= s.amc + 1;
          ELSE
            sin.s <= ReplyQuerySrcIPMeta;
          END IF;

        WHEN ReplyQuerySrcIPMeta =>
          rd.dnsPkt(198) <= f.srcIPBW;
          rd.dnsPkt(200 DOWNTO 199) <= STD_LOGIC_VECTOR(to_unsigned(f.srcIPLength, 2));
          sin.s <= ReplyQuerySrcIPList;
          sin.aic <= 0;

        WHEN ReplyQuerySrcIPList =>
          IF (s.aic = 0) THEN
            rd.dnsPkt(232 DOWNTO 201) <= f.srcIPList(0);
            sin.aic <= s.aic + 1;
          ELSIF (s.aic = 1) THEN
            rd.dnsPkt(264 DOWNTO 233) <= f.srcIPList(1);
            sin.aic <= s.aic + 1;
          ELSE
            sin.s <= ReplyQueryDstIPMeta;
          END IF;

        WHEN ReplyQueryDstIPMeta =>
          rd.dnsPkt(265) <= f.dstIPBW;
          rd.dnsPkt(267 DOWNTO 266) <= STD_LOGIC_VECTOR(to_unsigned(f.dstIPLength, 2));
          sin.s <= ReplyQueryDstIPList;
          sin.aic <= 0;

        WHEN ReplyQueryDstIPList =>
          IF (s.aic = 0) THEN
            rd.dnsPkt(299 DOWNTO 268) <= f.dstIPList(0);
            sin.aic <= s.aic + 1;
          ELSIF (s.aic = 1) THEN
            rd.dnsPkt(331 DOWNTO 300) <= f.dstIPList(1);
            sin.aic <= s.aic + 1;
          ELSE
            sin.s <= ReplyQuerySrcPortMeta;
          END IF;

        WHEN ReplyQuerySrcPortMeta =>
          rd.dnsPkt(332) <= f.srcPortBW;
          rd.dnsPkt(334 DOWNTO 333) <= STD_LOGIC_VECTOR(to_unsigned(f.srcPortLength, 2));
          sin.s <= ReplyQuerySrcPortList;
          sin.apc <= 0;

        WHEN ReplyQuerySrcPortList =>
          IF (s.apc = 0) THEN
            rd.dnsPkt(350 DOWNTO 335) <= f.srcPortList(0);
            sin.apc <= s.apc + 1;
          ELSIF (s.apc = 1) THEN
            rd.dnsPkt(366 DOWNTO 351) <= f.srcPortList(1);
            sin.apc <= s.apc + 1;
          ELSE
            sin.s <= ReplyQueryDstPortMeta;
          END IF;

        WHEN ReplyQueryDstPortMeta =>
          rd.dnsPkt(367) <= f.dstPortBW;
          rd.dnsPkt(369 DOWNTO 368) <= STD_LOGIC_VECTOR(to_unsigned(f.dstPortLength, 2));
          sin.s <= ReplyQueryDstPortList;
          sin.apc <= 0;

        WHEN ReplyQueryDstPortList =>
          IF (s.apc = 0) THEN
            rd.dnsPkt(385 DOWNTO 370) <= f.dstPortList(0);
            sin.apc <= s.apc + 1;
          ELSIF (s.apc = 1) THEN
            rd.dnsPkt(401 DOWNTO 386) <= f.dstPortList(1);
            sin.apc <= s.apc + 1;
          ELSE
            sin.s <= ReplyQueryDNSMeta;
          END IF;

        WHEN ReplyQueryDNSMeta =>
          rd.dnsPkt(402) <= f.dnsBW;
          rd.dnsPkt(404 DOWNTO 403) <= STD_LOGIC_VECTOR(to_unsigned(f.dnsLength, 2));
          rd.dnsPkt(412 DOWNTO 405) <= STD_LOGIC_VECTOR(to_unsigned(f.dnsItemEndPtr(0), 8));
          rd.dnsPkt(420 DOWNTO 413) <= STD_LOGIC_VECTOR(to_unsigned(f.dnsItemEndPtr(1), 8));
          sin.s <= ReplyQueryDNSList;
          sin.adc <= 0;

        WHEN ReplyQueryDNSList =>
          IF (s.adc = 0) THEN
            rd.dnsPkt(548 DOWNTO 421) <= f.dnsList(0);
            sin.adc <= s.adc + 1;
          ELSIF (s.adc = 1) THEN
            rd.dnsPkt(676 DOWNTO 549) <= f.dnsList(1);
            sin.adc <= s.adc + 1;
          ELSE
            sin.s <= ReplyQueryReplyType;
          END IF;

        WHEN ReplyQueryReplyType =>
          rd.dnsPkt(677) <= f.replyType;
          sin.s <= ReplyQueryCountersTot;

        WHEN ReplyQueryCountersTot =>
          rd.dnsPkt(741 DOWNTO 678) <= STD_LOGIC_VECTOR(s.stc);
          rd.dnsPkt(805 DOWNTO 742) <= STD_LOGIC_VECTOR(s.sfc);
          rd.dstMAC <= g_query_mac;
          sin.s <= ReplyQueryCountersSeg;

        WHEN ReplyQueryCountersSeg =>
          rd.dnsPkt(869 DOWNTO 806) <= STD_LOGIC_VECTOR(s.smc);
          rd.dnsPkt(933 DOWNTO 870) <= STD_LOGIC_VECTOR(s.sic);
          rd.dnsPkt(997 DOWNTO 934) <= STD_LOGIC_VECTOR(s.spc);
          sin.s <= Send;

        --------ADMIN ROUTE--------
        WHEN StartHash =>
          siphash_start <= '1';
          sin.s <= WaitHash;

        WHEN WaitHash =>
          IF (siphash_ready = '1') THEN
            sin.s <= HashAuth;
          ELSE
            sin.s <= WaitHash;
          END IF;

        WHEN HashAuth =>
          IF (s.ahv = rd.dnsPkt(1023 DOWNTO 960)) THEN
            sin.s <= UpdateFilterSrcMACMeta;
          ELSE
            sin.led <= x"8";
            sin.s <= Idle;
          END IF;

        WHEN UpdateFilterSrcMACMeta =>
          -- ALL filter elements shall be supplied, check against common.vhd
          -- SRC MAC
          f.srcMACBW <= rd.dnsPkt(0);
          -- filter depth affected this length here
          f.srcMACLength <= to_integer(unsigned(rd.dnsPkt(2 DOWNTO 1)));
          sin.s <= UpdateFilterSrcMACList;
          sin.amc <= 0;

        WHEN UpdateFilterSrcMACList =>
          --f.srcMACList(0) <= rd.dnsPkt(50 DOWNTO 3); --f.srcMACList(1) <= rd.dnsPkt(98 DOWNTO 51);
          -- 50 DOWNTO 3, 98 DOWNTO 51, s.c < 2 here is constant, filter_depth
          IF (s.amc = 0) THEN
            f.srcMACList(0) <= rd.dnsPkt(50 DOWNTO 3);
            sin.amc <= s.amc + 1;
          ELSIF (s.amc = 1) THEN
            f.srcMACList(1) <= rd.dnsPkt(98 DOWNTO 51);
            sin.amc <= s.amc + 1;
          ELSE
            sin.s <= UpdateFilterDstMACMeta;
          END IF;

        WHEN UpdateFilterDstMACMeta =>
          -- DST MAC
          f.dstMACBW <= rd.dnsPkt(99);
          -- filter depth affected this length here
          f.dstMACLength <= to_integer(unsigned(rd.dnsPkt(101 DOWNTO 100)));
          sin.s <= UpdateFilterDstMACList;
          sin.amc <= 0;

        WHEN UpdateFilterDstMACList =>
          --f.dstMACList(0) <= rd.dnsPkt(149 DOWNTO 102); --f.dstMACList(1) <= rd.dnsPkt(197 DOWNTO 150);
          -- 149 DOWNTO 102, 197 DOWNTO 150, s.c < 2 here is constant, filter_depth
          IF (s.amc = 0) THEN
            f.dstMACList(0) <= rd.dnsPkt(149 DOWNTO 102);
            sin.amc <= s.amc + 1;
          ELSIF (s.amc = 1) THEN
            f.dstMACList(1) <= rd.dnsPkt(197 DOWNTO 150);
            sin.amc <= s.amc + 1;
          ELSE
            sin.s <= UpdateFilterSrcIPMeta;
          END IF;

        WHEN UpdateFilterSrcIPMeta =>
          -- SRC IP
          f.srcIPBW <= rd.dnsPkt(198);
          -- filter depth affected this length here
          f.srcIPLength <= to_integer(unsigned(rd.dnsPkt(200 DOWNTO 199)));
          sin.s <= UpdateFilterSrcIPList;
          sin.aic <= 0;

        WHEN UpdateFilterSrcIPList =>
          --f.srcIPList(0) <= rd.dnsPkt(232 DOWNTO 201); --f.srcIPList(1) <= rd.dnsPkt(264 DOWNTO 233);
          -- 232 DOWNTO 201, 264 DOWNTO 233, s.c < 2 here is constant, filter_depth
          IF (s.aic = 0) THEN
            f.srcIPList(0) <= rd.dnsPkt(232 DOWNTO 201);
            sin.aic <= s.aic + 1;
          ELSIF (s.aic = 1) THEN
            f.srcIPList(1) <= rd.dnsPkt(264 DOWNTO 233);
            sin.aic <= s.aic + 1;
          ELSE
            sin.s <= UpdateFilterDstIPMeta;
          END IF;

        WHEN UpdateFilterDstIPMeta =>
          -- DST IP
          f.dstIPBW <= rd.dnsPkt(265);
          -- filter depth affected this length here
          f.dstIPLength <= to_integer(unsigned(rd.dnsPkt(267 DOWNTO 266)));
          sin.s <= UpdateFilterDstIPList;
          sin.aic <= 0;

        WHEN UpdateFilterDstIPList =>
          --f.dstIPList(0) <= rd.dnsPkt(299 DOWNTO 268); --f.dstIPList(1) <= rd.dnsPkt(331 DOWNTO 300);
          -- 299 DOWNTO 268, 331 DOWNTO 300, s.c < 2 here is constant, filter_depth
          IF (s.aic = 0) THEN
            f.dstIPList(0) <= rd.dnsPkt(299 DOWNTO 268);
            sin.aic <= s.aic + 1;
          ELSIF (s.aic = 1) THEN
            f.dstIPList(1) <= rd.dnsPkt(331 DOWNTO 300);
            sin.aic <= s.aic + 1;
          ELSE
            sin.s <= UpdateFilterSrcPortMeta;
          END IF;

        WHEN UpdateFilterSrcPortMeta =>
          -- SRC Port
          f.srcPortBW <= rd.dnsPkt(332);
          -- filter depth affected this length here
          f.srcPortLength <= to_integer(unsigned(rd.dnsPkt(334 DOWNTO 333)));
          sin.s <= UpdateFilterSrcPortList;
          sin.apc <= 0;

        WHEN UpdateFilterSrcPortList =>
          IF (s.apc = 0) THEN
            f.srcPortList(0) <= rd.dnsPkt(350 DOWNTO 335);
            sin.apc <= s.apc + 1;
          ELSIF (s.apc = 1) THEN
            f.srcPortList(1) <= rd.dnsPkt(366 DOWNTO 351);
            sin.apc <= s.apc + 1;
          ELSE
            sin.s <= UpdateFilterDstPortMeta;
          END IF;

        WHEN UpdateFilterDstPortMeta =>
          -- DST Port
          f.dstPortBW <= rd.dnsPkt(367);
          -- filter depth affected this length here
          f.dstPortLength <= to_integer(unsigned(rd.dnsPkt(369 DOWNTO 368)));
          sin.s <= UpdateFilterDstPortList;
          sin.apc <= 0;

        WHEN UpdateFilterDstPortList =>
          IF (s.apc = 0) THEN
            f.dstPortList(0) <= rd.dnsPkt(385 DOWNTO 370);
            sin.apc <= s.apc + 1;
          ELSIF (s.apc = 1) THEN
            f.dstPortList(1) <= rd.dnsPkt(401 DOWNTO 386);
            sin.apc <= s.apc + 1;
          ELSE
            sin.s <= UpdateFilterDNSMeta;
          END IF;

        WHEN UpdateFilterDNSMeta =>
          f.dnsBW <= rd.dnsPkt(402);
          f.dnsLength <= to_integer(unsigned(rd.dnsPkt(404 DOWNTO 403)));
          -- 0 to 128 (127 + 1), 8 bits
          f.dnsItemEndPtr(0) <= to_integer(unsigned(rd.dnsPkt(412 DOWNTO 405)));
          f.dnsItemEndPtr(1) <= to_integer(unsigned(rd.dnsPkt(420 DOWNTO 413)));
          sin.s <= UpdateFilterDNSList;
          sin.adc <= 0;

        WHEN UpdateFilterDNSList =>
          IF (s.adc = 0) THEN
            f.dnsList(0) <= rd.dnsPkt(548 DOWNTO 421);
            sin.adc <= s.adc + 1;
          ELSIF (s.adc = 1) THEN
            f.dnsList(1) <= rd.dnsPkt(676 DOWNTO 549);
            sin.adc <= s.adc + 1;
          ELSE
            sin.s <= UpdateReplyType;
          END IF;

        WHEN UpdateReplyType =>
          f.replyType <= rd.dnsPkt(677);
          sin.s <= Idle;

        --------FILTER ROUTE--------
        --SRCMAC
        WHEN CheckSrcMAC =>
          IF (s.fsmc = f.srcMACLength) THEN
            IF (f.srcMACBW = '0') THEN
              -- exhaust blacklist, no ban
              sin.s <= CheckDstMAC;
              sin.fdmc <= 0;
            ELSE
              -- exhaust whitelist, ban
              sin.s <= Idle;
              sin.fsmc <= 0;
            END IF;
          ELSE
            sin.s <= CmpSrcMAC;
            sin.fsmc <= s.fsmc;
          END IF;

        WHEN CmpSrcMAC =>
          -- check if srcMAC is on list
          IF (rd.srcMAC = f.srcMACList(s.fsmc)) THEN
            sin.s <= FilterSrcMACMatch;
            sin.fsmc <= s.fsmc;
          ELSE
            sin.s <= CheckSrcMAC;
            sin.fsmc <= s.fsmc + 1;
          END IF;

        WHEN FilterSrcMACMatch =>
          IF (f.srcMACBW = '0') THEN
            --it's on blacklist
            sin.s <= Idle;
            sin.fsmc <= 0;
          ELSE
            --it's on whitelist, move on to next step
            sin.s <= CheckDstMAC;
            sin.fdmc <= 0;
          END IF;

          --DSTMAC
        WHEN CheckDstMAC =>
          IF (s.fdmc = f.dstMACLength) THEN
            IF (f.dstMACBW = '0') THEN
              -- exhaust blacklist, no ban
              sin.s <= CheckSrcIP;
              sin.smc <= s.smc + 1;
              sin.fsic <= 0;
            ELSE
              -- exhaust whitelist, ban
              sin.s <= Idle;
              sin.fdmc <= 0;
            END IF;
          ELSE
            sin.s <= CmpDstMAC;
            sin.fdmc <= s.fdmc;
          END IF;

        WHEN CmpDstMAC =>
          -- check if srcMAC is on list
          IF (rd.dstMAC = f.dstMACList(s.fdmc)) THEN
            sin.s <= FilterDstMACMatch;
            sin.fdmc <= s.fdmc;
          ELSE
            sin.s <= CheckDstMAC;
            sin.fdmc <= s.fdmc + 1;
          END IF;

        WHEN FilterDstMACMatch =>
          IF (f.dstMACBW = '0') THEN
            --it's on blacklist
            sin.s <= Idle;
            sin.fdmc <= 0;
          ELSE
            --it's on whitelist, move on to next step
            sin.s <= CheckSrcIP;
            sin.smc <= s.smc + 1;
            sin.fsic <= 0;
          END IF;

          --SRCIP
        WHEN CheckSrcIP =>
          IF (s.fsic = f.srcIPLength) THEN
            IF (f.srcIPBW = '0') THEN
              -- exhaust blacklist, no ban
              sin.s <= CheckDstIP;
              sin.fdic <= 0;
            ELSE
              -- exhaust whitelist, ban
              sin.s <= Idle;
              sin.fsic <= 0;
            END IF;
          ELSE
            sin.s <= CmpSrcIP;
            sin.fsic <= s.fsic;
          END IF;

        WHEN CmpSrcIP =>
          -- check if srcIP is on list
          IF (rd.srcIP = f.srcIPList(s.fsic)) THEN
            sin.s <= FilterSrcIPMatch;
            sin.fsic <= s.fsic;
          ELSE
            sin.s <= CheckSrcIP;
            sin.fsic <= s.fsic + 1;
          END IF;

        WHEN FilterSrcIPMatch =>
          IF (f.srcIPBW = '0') THEN
            --it's on blacklist
            sin.s <= Idle;
            sin.fsic <= 0;
          ELSE
            --it's on whitelist, move on to next step
            sin.s <= CheckDstIP;
            sin.fdic <= 0;
          END IF;

          --DSTIP
        WHEN CheckDstIP =>
          IF (s.fdic = f.dstIPLength) THEN
            IF (f.dstIPBW = '0') THEN
              -- exhaust blacklist, no ban
              sin.s <= CheckSrcPort;
              sin.sic <= s.sic + 1;
              sin.fspc <= 0;
            ELSE
              -- exhaust whitelist, ban
              sin.s <= Idle;
              sin.fdic <= 0;
            END IF;
          ELSE
            sin.s <= CmpDstIP;
            sin.fdic <= s.fdic;
          END IF;

        WHEN CmpDstIP =>
          -- check if dstIP is on list
          IF (rd.dstIP = f.dstIPList(s.fdic)) THEN
            sin.s <= FilterDstIPMatch;
            sin.fdic <= s.fdic;
          ELSE
            sin.s <= CheckDstIP;
            sin.fdic <= s.fdic + 1;
          END IF;

        WHEN FilterDstIPMatch =>
          IF (f.dstIPBW = '0') THEN
            --it's on blacklist
            sin.s <= Idle;
            sin.fdic <= 0;
          ELSE
            --it's on whitelist, move on to next step
            sin.s <= CheckSrcPort;
            sin.sic <= s.sic + 1;
            sin.fspc <= 0;
          END IF;

          --SRCPORT
        WHEN CheckSrcPort =>
          IF (s.fspc = f.srcPortLength) THEN
            IF (f.srcPortBW = '0') THEN
              -- exhaust blacklist, no ban
              sin.s <= CheckDstPort;
              sin.fdpc <= 0;
            ELSE
              -- exhaust whitelist, ban
              sin.s <= Idle;
              sin.fspc <= 0;
            END IF;
          ELSE
            sin.s <= CmpSrcPort;
            sin.fspc <= s.fspc;
          END IF;

        WHEN CmpSrcPort =>
          -- check if srcPort is on list
          IF (rd.srcPort = f.srcPortList(s.fspc)) THEN
            sin.s <= FilterSrcPortMatch;
            sin.fspc <= s.fspc;
          ELSE
            sin.s <= CheckSrcPort;
            sin.fspc <= s.fspc + 1;
          END IF;

        WHEN FilterSrcPortMatch =>
          IF (f.srcPortBW = '0') THEN
            --it's on blacklist
            sin.s <= Idle;
            sin.fspc <= 0;
          ELSE
            --it's on whitelist, move on to next step
            sin.s <= CheckDstPort;
            sin.fdpc <= 0;
          END IF;

          --DSTPORT
        WHEN CheckDstPort =>
          IF (s.fdpc = f.dstPortLength) THEN
            IF (f.dstPortBW = '0') THEN
              -- exhaust blacklist, no ban
              sin.s <= CheckPkt;
              sin.spc <= s.spc + 1;
              sin.fdnsc <= 0;
            ELSE
              -- exhaust whitelist, ban
              sin.s <= Idle;
              sin.fdpc <= 0;
            END IF;
          ELSE
            sin.s <= CmpDstPort;
            sin.fdpc <= s.fdpc;
          END IF;

        WHEN CmpDstPort =>
          -- check if dstPort is on list
          IF (rd.dstPort = f.dstPortList(s.fdpc)) THEN
            sin.s <= FilterDstPortMatch;
            sin.fdpc <= s.fdpc;
          ELSE
            sin.s <= CheckDstPort;
            sin.fdpc <= s.fdpc + 1;
          END IF;

        WHEN FilterDstPortMatch =>
          IF (f.dstPortBW = '0') THEN
            --it's on blacklist
            sin.s <= Idle;
            sin.fdpc <= 0;
          ELSE
            --it's on whitelist, move on to next step
            sin.s <= CheckPkt;
            sin.spc <= s.spc + 1;
            sin.fdnsc <= 0;
          END IF;

          --PKT
        WHEN CheckPkt =>
          IF (s.fdnsc = f.dnsLength) THEN
            IF (f.dnsBW = '0') THEN
              -- exhaust blacklist, no ban
              sin.s <= SetDNSReplyHeader;
              sin.sfc <= s.sfc + 1;
            ELSE
              -- exhaust whitelist, ban
              sin.s <= Idle;
              sin.fpktsc <= 0;
            END IF;
          ELSE
            sin.s <= CmpPktCheck;
            sin.fpktsc <= 0;
            sin.fpktc <= f.dnsItemEndPtr(s.fdnsc);
            sin.fpktmf <= '0';
            sin.fdnsc <= s.fdnsc;
            -- change with pkt size
            IF (rd.dnsLength > 128) THEN -- bytes
              filterPktEndPtr := 1024; -- bits
            ELSE
              filterPktEndPtr := rd.dnsLength * 8;
            END IF;
          END IF;

        WHEN CmpPktCheck =>
          filterPktAreaEndPtr := s.fpktsc + s.fpktc;
          filterPktItemEndPtr := s.fpktc;
          filterPktItemPtr := s.fdnsc;
          IF (s.fpktc >= 32) THEN
            sin.s <= CmpPktArea32;
          ELSIF (s.fpktc >= 24) THEN
            sin.s <= CmpPktArea24;
          ELSIF (s.fpktc >= 16) THEN
            sin.s <= CmpPktArea16;
          ELSIF (s.fpktc >= 8) THEN
            sin.s <= CmpPktArea8;
          ELSE
            sin.s <= CmpPktDone;
            sin.fpktsc <= s.fpktsc;
            sin.fpktmf <= '1';
            sin.fdnsc <= s.fdnsc;
          END IF;

        WHEN CmpPktArea32 =>
          IF (rd.dnsPkt((filterPktAreaEndPtr - 1) DOWNTO (filterPktAreaEndPtr - 32))
            = f.dnsList(filterPktItemPtr)((filterPktItemEndPtr - 1) DOWNTO (filterPktItemEndPtr - 32))) THEN
            sin.s <= CmpPktCheck;
            sin.fpktsc <= s.fpktsc;
            sin.fpktc <= s.fpktc - 32;
            sin.fdnsc <= s.fdnsc;
          ELSE
            sin.s <= CmpPktDone;
            sin.fpktsc <= s.fpktsc;
            sin.fpktmf <= '0';
            sin.fdnsc <= s.fdnsc;
          END IF;

        WHEN CmpPktArea24 =>
          IF (rd.dnsPkt((filterPktAreaEndPtr - 1) DOWNTO (filterPktAreaEndPtr - 24))
            = f.dnsList(filterPktItemPtr)((filterPktItemEndPtr - 1) DOWNTO (filterPktItemEndPtr - 24))) THEN
            sin.s <= CmpPktCheck;
            sin.fpktsc <= s.fpktsc;
            sin.fpktc <= s.fpktc - 24;
            sin.fdnsc <= s.fdnsc;
          ELSE
            sin.s <= CmpPktDone;
            sin.fpktsc <= s.fpktsc;
            sin.fpktmf <= '0';
            sin.fdnsc <= s.fdnsc;
          END IF;

        WHEN CmpPktArea16 =>
          IF (rd.dnsPkt((filterPktAreaEndPtr - 1) DOWNTO (filterPktAreaEndPtr - 16))
            = f.dnsList(filterPktItemPtr)((filterPktItemEndPtr - 1) DOWNTO (filterPktItemEndPtr - 16))) THEN
            sin.s <= CmpPktCheck;
            sin.fpktsc <= s.fpktsc;
            sin.fpktc <= s.fpktc - 16;
            sin.fdnsc <= s.fdnsc;
          ELSE
            sin.s <= CmpPktDone;
            sin.fpktsc <= s.fpktsc;
            sin.fpktmf <= '0';
            sin.fdnsc <= s.fdnsc;
          END IF;

        WHEN CmpPktArea8 =>
          IF (rd.dnsPkt((filterPktAreaEndPtr - 1) DOWNTO (filterPktAreaEndPtr - 8))
            = f.dnsList(filterPktItemPtr)((filterPktItemEndPtr - 1) DOWNTO (filterPktItemEndPtr - 8))) THEN
            sin.s <= CmpPktCheck;
            sin.fpktsc <= s.fpktsc;
            sin.fpktc <= s.fpktc - 8;
            sin.fdnsc <= s.fdnsc;
          ELSE
            sin.s <= CmpPktDone;
            sin.fpktsc <= s.fpktsc;
            sin.fpktmf <= '0';
            sin.fdnsc <= s.fdnsc;
          END IF;

        WHEN CmpPktDone =>
          IF (s.fpktmf = '1') THEN
            -- there's a match
            sin.s <= FilterPkt;
            sin.fdnsc <= s.fdnsc;
            -- update this line for pkt size change
          ELSIF (s.fpktsc + f.dnsItemEndPtr(s.fdnsc) >= filterPktEndPtr) THEN
            -- all check done
            sin.s <= CheckPkt;
            sin.fdnsc <= s.fdnsc + 1;
          ELSE
            -- increment pkt counter
            sin.s <= CmpPktCheck;
            sin.fpktsc <= s.fpktsc + 8;
            sin.fpktc <= f.dnsItemEndPtr(s.fdnsc);
            sin.fpktmf <= '0';
            sin.fdnsc <= s.fdnsc;
          END IF;

        WHEN FilterPkt =>
          IF (f.dnsBW = '0') THEN
            --it's on blacklist
            sin.s <= Idle;
            sin.fdnsc <= 0;
          ELSE
            --it's on whitelist, move on to next step
            sin.s <= SetDNSReplyHeader;
            sin.sfc <= s.sfc + 1;
          END IF;

        WHEN SetDNSReplyHeader =>
          IF (f.replyType = '0') THEN
            sin.s <= SetDefaultMAC;
          ELSE
            -- Copying 15 DOWNTO 0 as unique ID
            -- Byte 2
            rd.dnsPkt(27 DOWNTO 24) <= g_dns_rcode; -- RCODE 3 NameError (not exist)
            rd.dnsPkt(28) <= '1'; -- CD Do not check DNSSEC
            rd.dnsPkt(29) <= '1'; -- AD Answer authenticated
            rd.dnsPkt(30) <= '0'; -- Z
            rd.dnsPkt(31) <= '0'; -- Recursion Available No
            -- Byte 1
            rd.dnsPkt(16) <= '0'; -- Recursion Desired No (it's a reply)
            rd.dnsPkt(17) <= '0'; -- Not Truncated Pkt
            rd.dnsPkt(18) <= '1'; -- Authoritative Answer
            rd.dnsPkt(22 DOWNTO 19) <= x"0"; -- OPCode Standard Query
            rd.dnsPkt(23) <= '1'; -- QR Response
            sin.s <= SetDNSReplyCount;
          END IF;

        WHEN SetDNSReplyCount =>
          rd.ipLength <= 130; -- 130 -> 0x0082 -> 0x0028 -> 40
          rd.dnsLength <= 12;
          rd.dnsPkt(47 DOWNTO 32) <= x"0000"; -- QDCOUNT 0
          rd.dnsPkt(63 DOWNTO 48) <= x"0000"; -- ANCOUNT 0
          rd.dnsPkt(79 DOWNTO 64) <= x"0000"; -- NSCOUNT 0
          rd.dnsPkt(95 DOWNTO 80) <= x"0000"; -- ARCOUNT 0
          sin.s <= SetDefaultMAC;

        WHEN SetDefaultMAC =>
          rd.dstMAC <= g_normal_mac;
          sin.s <= Send;

        WHEN Send =>
          snd_en <= '1'; -- Send Ethernet packet.
          IF (s.pc = 15) THEN
            sin.pc <= 0;
          ELSE
            sin.pc <= s.pc + 1;
          END IF;
          sin.led <= STD_LOGIC_VECTOR(to_unsigned(s.pc + 1, sin.led'length));
          sin.s <= Idle;

      END CASE;
    END IF;
  END PROCESS;

  LED <= s.led;
  snd_rcv_data <= rd;

  reg : PROCESS (clk)
  BEGIN
    IF falling_edge(clk) THEN
      s <= sin;
    END IF;
  END PROCESS;
END rtl;
