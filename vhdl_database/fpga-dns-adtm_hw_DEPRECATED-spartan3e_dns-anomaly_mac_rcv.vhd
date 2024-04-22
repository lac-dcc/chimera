LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.common.ALL;

ENTITY mac_rcv IS
  PORT (
    E_RX_CLK : IN STD_LOGIC; -- Receiver Clock.
    E_RX_DV : IN STD_LOGIC; -- Received Data Valid.
    E_RXD : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Received Nibble.
    el_data : OUT rcv_data_t; -- Channel data.
    el_dv : OUT STD_LOGIC -- Data valid.
    --LED : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    --el_ack : IN STD_LOGIC -- Packet reception ACK.
  );
END mac_rcv;

ARCHITECTURE rtl OF mac_rcv IS

  TYPE state_t IS (
    Preamble, StartOfFrame, -- 7 Bytes 0x55, 1 Byte 0x5d.
    EtherMACDST, -- 6 Byte MAC address DST
    EtherMACSRC, -- 6 Byte MAC address SRC
    EtherType, -- Next Protocol 0x0800
    IPVersion, -- 4 bits IP Version 0x4
    IPIHL, -- 4 bits IP IHL 0x5
    IPDSCPECN, -- 1 byte DSCP 6 bits + ECN 2 bits 0x?0
    IPLength, -- 2 byte IP Length
    IPID, -- 2 byte IPID
    IPFlagsFragment, -- 2 byte Flags 3 bits + Fragment Offset 13 bits 0x00
    IPTTL, -- 1 byte
    IPProtocol, -- 1 byte 0x11 UDP, 0x06 TCP
    IPChecksum, -- 2 byte
    IPAddrSRC, -- 4 byte IP Addr SRC
    IPAddrDST, -- 4 byte IP Addr DST
    IPOptions, -- dependent on IPIHL size > 5
    UDPPortSRC, -- 2 byte UDP Port SRC
    UDPPortDST, -- 2 byte UDP Port DST
    UDPLength,  -- 2 byte UDP Length
    UDPChecksum, -- 2 byte
    DNSMsg, -- 1472 bytes 1500 MTU - 20 IP - 8 UDP = 1472
    Notify -- Inform other hardware components.
  );

  TYPE rcv_t IS RECORD
    s : state_t; -- Receiver Parse State
    d : rcv_data_t;  -- Parse Data
    c : NATURAL RANGE 0 TO 65535; -- Counter MAX 65535
  END RECORD;

  SIGNAL r, rin : rcv_t
    := rcv_t'(
      s => Preamble,
      d => (
        srcMAC => (OTHERS => '1'), dstMAC => (OTHERS => '1'),
        srcIP  => (OTHERS => '1'), dstIP => (OTHERS => '1'),
        ipHeaderLength => 0, ipLength => 0,
        srcPort => (OTHERS => '1'), dstPort => (OTHERS => '1'),
        dnsLength => 0
        --dns => (OTHERS => '1')
      ),
      c => 0
    );

BEGIN

  rcv_nsl : PROCESS (r, E_RX_DV, E_RXD) --, el_ack)
  VARIABLE udpPayloadLength : NATURAL RANGE 0 TO 65535 := 0;
  BEGIN

    rin <= r;
    el_dv <= '0';

    IF E_RX_DV = '1' THEN
      CASE r.s IS

        -- Ethernet II - Preamble and Start Of Frame
        WHEN Preamble =>
          IF E_RXD = x"5" THEN
            IF r.c = 14 THEN
              rin.c <= 0;
              rin.s <= StartOfFrame;
            ELSE
              rin.c <= r.c + 1;
            END IF;
          ELSIF E_RXD = x"d" AND r.c >= 12 THEN
            -- could we miss the first few signals?
            rin.c <= 0;
            rin.s <= EtherMACDST;
          ELSE
            rin.c <= 0;
          END IF;

        WHEN StartOfFrame =>
          IF E_RXD = x"d" THEN
            rin.s <= EtherMACDST;
          ELSE
            rin.s <= Preamble;
          END IF;

        -- Ethernet II - MAC DST and MAC SRC
        WHEN EtherMACDST =>
          rin.d.dstMAC((r.c + 3) DOWNTO (r.c)) <= E_RXD;
          IF r.c = 44 THEN
            rin.c <= 0;
            rin.s <= EtherMACSRC;
          ELSE
            rin.c <= r.c + 4;
          END IF;

        WHEN EtherMACSRC =>
          rin.d.srcMAC((r.c + 3) DOWNTO (r.c)) <= E_RXD;
          IF r.c = 44 THEN
            rin.c <= 0;
            rin.s <= EtherType;
          ELSE
            rin.c <= r.c + 4;
          END IF;

        -- Ethernet II - Ethertype 0x0800
        WHEN EtherType =>
          IF E_RXD = x"8" THEN
            IF r.c = 0 THEN
              rin.c <= r.c + 1;
            ELSE
              rin.c <= 0;
              rin.s <= Preamble;
            END IF;
          ELSIF E_RXD = x"0" THEN
            IF r.c = 3 THEN
              rin.c <= 0;
              rin.s <= IPIHL;
              rin.d.ipHeaderLength <= 0;
            ELSIF r.c = 0 THEN
              rin.c <= 0;
              rin.s <= Preamble;
            ELSE
              rin.c <= r.c + 1;
            END IF;
          ELSE
            rin.c <= 0;
            rin.s <= Preamble;
          END IF;

        -- IP - IHL 0x5
        WHEN IPIHL =>
          rin.d.ipHeaderLength <= to_integer(unsigned(E_RXD));
          IF (E_RXD >= x"5") THEN
            rin.c <= 0;
            rin.s <= IPVersion;
          ELSE
            rin.c <= 0;
            rin.d.ipHeaderLength <= 0;
            rin.s <= Preamble;
          END IF;

        -- IP - Version 0x4                                                 --
        WHEN IPVersion =>
          IF E_RXD = x"4" THEN
            rin.c <= 0;
            rin.s <= IPDSCPECN;
          ELSE
            rin.c <= 0;
            rin.s <= Preamble;
          END IF;

        -- IP - DSCP ECN 0x?0
        WHEN IPDSCPECN =>
          IF r.c = 1 THEN
            rin.c <= 0;
            rin.s <= IPLength;
            rin.d.ipLength <= 0;
          ELSE
            rin.c <= r.c + 1;
          END IF;

        -- IP - Length
        WHEN IPLength =>
          rin.d.ipLength <= r.d.ipLength * 16 + to_integer(unsigned(E_RXD));
          IF r.c = 3 THEN
            rin.c <= 0;
            rin.s <= IPID;
          ELSE
            rin.c <= r.c + 1;
          END IF;

        -- IP - ID
        WHEN IPID =>
          IF r.c = 3 THEN
            rin.c <= 0;
            rin.s <= IPFlagsFragment;
          ELSE
            rin.c <= r.c + 1;
          END IF;

        -- IP Flags Fragment Offset 0x00
        WHEN IPFlagsFragment =>
          IF E_RXD = x"0" THEN
            IF r.c = 3 THEN
              rin.c <= 0;
              rin.s <= IPTTL;
            ELSE
              rin.c <= r.c + 1;
            END IF;
          ELSE
            rin.c <= 0;
            rin.s <= Preamble;
          END IF;

        -- IP TTL
        WHEN IPTTL =>
          IF r.c = 1 THEN
            rin.c <= 0;
            rin.s <= IPProtocol;
          ELSE
            rin.c <= r.c + 1;
          END IF;

        -- IP Protocol UDP 0x11
        WHEN IPProtocol =>
          IF E_RXD = x"1" THEN
            IF r.c = 1 THEN
              rin.c <= 0;
              rin.s <= IPChecksum;
            ELSE
              rin.c <= r.c + 1;
            END IF;
          ELSE
            rin.c <= 0;
            rin.s <= Preamble;
          END IF;

        -- IP Checksum
        WHEN IPChecksum =>
          IF r.c = 3 THEN
            rin.c <= 0;
            rin.s <= IPAddrSRC;
          ELSE
            rin.c <= r.c + 1;
          END IF;

        -- IP addr src
        WHEN IPAddrSRC =>
          rin.d.srcIP((r.c + 3) DOWNTO (r.c)) <= E_RXD;
          IF r.c = 28 THEN
            rin.c <= 0;
            rin.s <= IPAddrDST;
          ELSE
            rin.c <= r.c + 4;
          END IF;

        -- IP addr dst
        WHEN IPAddrDST =>
          rin.d.dstIP((r.c + 3) DOWNTO (r.c)) <= E_RXD;
          IF r.c = 28 THEN
            rin.c <= 0;
            IF r.d.ipHeaderLength = 5 THEN
              rin.s <= UDPPortSRC;
            ELSE
              rin.s <= IPOptions;
            END IF;
          ELSE
            rin.c <= r.c + 4;
          END IF;

        -- IP Options, dependent on IPIHL > 5
        WHEN IPOptions =>
          IF (r.c = (r.d.ipHeaderLength - 5) * 8 - 1) THEN
            rin.c <= 0;
            rin.s <= UDPPortSRC;
          ELSE
            rin.c <= r.c + 1;
          END IF;

        -- UDP port src
        WHEN UDPPortSRC =>
          rin.d.srcPort((r.c + 3) DOWNTO (r.c)) <= E_RXD;
          IF r.c = 12 THEN
            rin.c <= 0;
            rin.s <= UDPPortDST;
          ELSE
            rin.c <= r.c + 4;
          END IF;

        -- UDP port dst
        WHEN UDPPortDST =>
          rin.d.dstPort((r.c + 3) DOWNTO (r.c)) <= E_RXD;
          IF r.c = 12 THEN
            rin.c <= 0;
            rin.s <= UDPLength;
            rin.d.dnsLength <= 0;
          ELSE
            rin.c <= r.c + 4;
          END IF;

        -- UDP payload length
        WHEN UDPLength =>
          rin.d.dnsLength <= r.d.dnsLength * 16 + to_integer(unsigned(E_RXD));
          IF r.c = 3 THEN
            rin.c <= 0;
            rin.d.dnsLength <= r.d.dnsLength - 8; -- deduct UDP header 8
            rin.s <= UDPChecksum;
          ELSE
            rin.c <= r.c + 1;
          END IF;

        -- UDP Checksum
        WHEN UDPChecksum =>
          IF r.c = 3 THEN
            rin.c <= 0;
            udpPayloadLength := r.d.dnsLength * 2 - 1;
            rin.s <= DNSMsg;
            --rin.d.dns <= (OTHERS => '1');
          ELSE
            rin.c <= r.c + 1;
          END IF;

        -- DNS Msg
        WHEN DNSMsg =>
          --IF r.c <= 508 THEN
          --  rin.d.dns((r.c + 3) DOWNTO (r.c)) <= E_RXD;
          --END IF;
          IF r.c = udpPayloadLength THEN
            rin.c <= 0;
            rin.s <= Notify;
          ELSE
            rin.c <= r.c + 1;
          END IF;

        -- Notification                                                   --
        WHEN Notify =>
          el_dv <= '1';
          rin.s <= Preamble;
          rin.c <= 0;

      END CASE;
    END IF;
  END PROCESS;

  el_data <= r.d;

  snd_reg : PROCESS (E_RX_CLK)
  BEGIN
    IF rising_edge(E_RX_CLK) THEN
      r <= rin;
    END IF;
  END PROCESS;

END rtl;