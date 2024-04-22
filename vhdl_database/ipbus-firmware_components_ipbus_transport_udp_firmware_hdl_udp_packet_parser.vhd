---------------------------------------------------------------------------------
--
--   Copyright 2017 - Rutherford Appleton Laboratory and University of Bristol
--
--   Licensed under the Apache License, Version 2.0 (the "License");
--   you may not use this file except in compliance with the License.
--   You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--   Unless required by applicable law or agreed to in writing, software
--   distributed under the License is distributed on an "AS IS" BASIS,
--   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--   See the License for the specific language governing permissions and
--   limitations under the License.
--
--                                     - - -
--
--   Additional information about ipbus-firmare and the list of ipbus-firmware
--   contacts are available at
--
--       https://ipbus.web.cern.ch/ipbus
--
---------------------------------------------------------------------------------


-- Parses up to first 74 bytes of incoming ethernet packet for supported protocols
--
-- Dave Sankey, June 2012, March 2013, Feb 2021

library ieee;
use ieee.std_logic_1164.all;

entity udp_packet_parser is
  generic(
    SECONDARYPORT: std_logic := '0';
    DHCP_RARP: std_logic := '0' -- '0' => RARP, '1' => DHCP
  );
  port (
    mac_clk: in std_logic;
    rx_reset: in std_logic;
    enable_125: in std_logic;
    my_rx_data: in std_logic_vector(7 downto 0);
    my_rx_last: in std_logic;
    my_rx_valid: in std_logic;
    My_MAC_addr: in std_logic_vector(47 downto 0);
    My_IP_addr: in std_logic_vector(31 downto 0);
    ipbus_port: in std_logic_vector(15 DOWNTO 0) := x"C351";
    next_pkt_id: in std_logic_vector(15 downto 0);
    pkt_broadcast: out std_logic;
    pkt_byteswap: out std_logic;
    pkt_drop_arp: out std_logic;
    pkt_drop_ipbus: out std_logic;
    pkt_drop_payload: out std_logic;
    pkt_drop_ping: out std_logic;
    pkt_drop_ipam: out std_logic;
    pkt_drop_resend: out std_logic;
    pkt_drop_status: out std_logic;
    pkt_runt: out std_logic;
    reliable_packet: out std_logic
  );
end udp_packet_parser;

architecture v3 of udp_packet_parser is

  signal pkt_drop_ip_sig, pkt_drop_ipbus_sig, pkt_broadcast_sig: std_logic;
  signal pkt_drop_payload_sig, pkt_payload_drop_sig: std_logic;
  signal pkt_drop_reliable_sig, pkt_reliable_drop_sig: std_logic;
  signal ipbus_status_mask, ipbus_hdr_mask: std_logic;

begin

  pkt_drop_ipbus <= pkt_drop_ipbus_sig;
  pkt_drop_payload <= pkt_drop_payload_sig and pkt_payload_drop_sig;
  pkt_byteswap <= pkt_drop_payload_sig;
  pkt_broadcast <= pkt_broadcast_sig;

secondary_mode: if SECONDARYPORT = '1' generate
-- Don't respond to arp or ping (but do capture rarp...)
  pkt_drop_arp <= '1';
  pkt_drop_ping <= '1';
end generate secondary_mode;

primary_mode: if SECONDARYPORT = '0' generate
-- ARP:
-- Ethernet DST_MAC(6), SRC_MAC(6), Ether_Type = x"0806"
-- HTYPE = x"0001"
-- PTYPE = x"0800"
-- HLEN = x"06", PLEN = x"04"
-- OPER = x"0001"
-- SHA(6)
-- SPA(4)
-- THA(6)
-- TPA(4) = MY_IP(4)
arp:  process (mac_clk)
  variable pkt_data: std_logic_vector(111 downto 0);
  variable pkt_mask: std_logic_vector(41 downto 0);
  variable pkt_drop: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        pkt_mask := "111111" & "111111" & "00" &
        "00" & "00" & "00" & "00" & "111111" &
        "1111" & "111111" & "0000";
        pkt_data := x"0806" & x"0001" & x"0800" & x"0604" & x"0001" & My_IP_addr;
        pkt_drop := not enable_125;
      elsif my_rx_last = '1' then
        pkt_drop := '1';
      elsif my_rx_valid = '1' then
        if pkt_mask(41) = '0' then
          if pkt_data(111 downto 104) /= my_rx_data then
            pkt_drop := '1';
          end if;
          pkt_data := pkt_data(103 downto 0) & x"00";
        end if;
        pkt_mask := pkt_mask(40 downto 0) & '1';
      end if;
      pkt_drop_arp <= pkt_drop
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

-- Ping:
-- Ethernet
-- IP VERS, HL, TOS
-- IP LEN
-- IP ID
-- IP FLAG-FRAG
-- IP TTL, PROTO = x"01"
-- IP CKSUM
-- IP SPA(4)
-- IP DPA(4)
-- ICMP TYPE = "08", CODE = "00"
-- ICMP CKSUM
-- ICMP data...
ping:  process (mac_clk)
  variable pkt_data: std_logic_vector(23 downto 0);
  variable pkt_mask: std_logic_vector(35 downto 0);
  variable pkt_drop: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        pkt_mask := "111111" & "111111" & "11" &
        "11" & "11" & "11" & "11" & "1" & "0" & "11" &
        "1111" & "1111" & "00";
        pkt_data := x"01" & x"0800";
        pkt_drop := not enable_125;
      elsif my_rx_last = '1' then
        pkt_drop := '1';
      elsif my_rx_valid = '1' then
        if pkt_drop_ip_sig = '1' then
	  pkt_drop := '1';
        elsif pkt_mask(35) = '0' then
          if pkt_data(23 downto 16) /= my_rx_data then
            pkt_drop := '1';
          end if;
          pkt_data := pkt_data(15 downto 0) & x"00";
        end if;
        pkt_mask := pkt_mask(34 downto 0) & '1';
      end if;
      pkt_drop_ping <= pkt_drop
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

end generate primary_mode;

rarp_reply: if DHCP_RARP = '0' generate
-- RARP:
-- Ethernet DST_MAC(6) = My_MAC_addr, SRC_MAC(6), Ether_Type = x"8035"
-- HTYPE = x"0001"
-- PTYPE = x"0800"
-- HLEN = x"06", PLEN = x"04"
-- OPER = x"0004"
-- SHA(6)
-- SPA(4)
-- THA(6) = My_MAC_addr
-- TPA(4) = MY_IP(4)
rarp:  process (mac_clk)
  variable pkt_data: std_logic_vector(127 downto 0);
  variable pkt_mask: std_logic_vector(21 downto 0);
  variable pkt_drop: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        pkt_mask := "000000" & "111111" & "00" & "00" & "00" & "00" & "00";
        pkt_data := My_MAC_addr & x"8035" & x"0001" & x"0800" & x"0604" & x"0004";
        pkt_drop := not enable_125;
      elsif my_rx_last = '1' then
        pkt_drop := '1';
      elsif my_rx_valid = '1' then
        if pkt_mask(21) = '0' then
          if pkt_data(127 downto 120) /= my_rx_data then
            pkt_drop := '1';
          end if;
          pkt_data := pkt_data(119 downto 0) & x"00";
        end if;
        pkt_mask := pkt_mask(20 downto 0) & '1';
      end if;
      pkt_drop_ipam <= pkt_drop
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;
end generate rarp_reply;

dhcp_offer: if DHCP_RARP = '1' generate
-- DHCPOFFER:
-- Ethernet DST_MAC(6) = Broadcast, SRC_MAC(6), Ether_Type = x"0800"
-- IP VERS = x"4", HL = x"5"
-- TOS/DSCP, IP LEN, IP ID, IP FLAG-FRAG, IP TTL, PROTO = UDP (x"11")
-- IP CKSUM, IP SPA(4), IP DPA(4)
-- UDP SRCPORT = 67 (x"0043")
-- UDP DSTPORT = 68 (x"0044")
-- UDP length, cksum
-- DHCP Boot reply = x"02", Hardware Ethernet = x"01", length = x"06"
-- DHCP Hops, transaction ID, seconds, flags, IP addresses (4*4)
-- DHCP Client MAC address = My_MAC_addr
dhcp:  process (mac_clk)
  variable pkt_data: std_logic_vector(135 downto 0);
  variable pkt_mask: std_logic_vector(75 downto 0);
  variable pkt_drop: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        pkt_mask := "111111" & "111111" & "00" & "01" & "1111" & "1110" &
		"11" & "1111" & "1111" & "0000" & "1111" & "0001" &
		"11111111" & "1111" & "1111" & "1111" & "1111" & "000000";
        pkt_data := x"0800" & x"45" & x"11" & x"0043" & x"0044" & x"020106" & My_MAC_addr;
        pkt_drop := not enable_125;
      elsif my_rx_last = '1' then
        pkt_drop := '1';
      elsif my_rx_valid = '1' then
        if pkt_broadcast_sig = '0' then
        	pkt_drop := '1';
        elsif pkt_mask(75) = '0' then
          if pkt_data(135 downto 128) /= my_rx_data then
            pkt_drop := '1';
          end if;
          pkt_data := pkt_data(127 downto 0) & x"00";
        end if;
        pkt_mask := pkt_mask(74 downto 0) & '1';
      end if;
      pkt_drop_ipam <= pkt_drop
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;
end generate dhcp_offer;

-- IP packet:
-- Ethernet DST_MAC(6) = My_MAC_addr, SRC_MAC(6), Ether_Type = x"0800"
-- IP VERS = x"4", HL = x"5"
-- TOS/DSCP
-- IP LEN
-- IP ID
-- IP FLAG-FRAG = x"4000" or x"0000"
-- IP TTL, PROTO
-- IP CKSUM
-- IP SPA(4)
-- IP DPA(4)
ip_pkt:  process (mac_clk)
  variable pkt_data: std_logic_vector(119 downto 0);
  variable pkt_mask: std_logic_vector(33 downto 0);
  variable frag_mask: std_logic_vector(9 downto 0);
  variable pkt_drop: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        pkt_mask := "000000" & "111111" & "00" &
        "01" & "11" & "11" & "00" & "1" & "1" & "11" &
        "1111" & "0000";
        frag_mask := "111111" & "11" & "10";
        pkt_data := My_MAC_addr & x"0800" & x"45" & x"0000" & My_IP_addr;
        pkt_drop := not enable_125;
      elsif my_rx_last = '1' then
        pkt_drop := '1';
      elsif my_rx_valid = '1' then
        if pkt_mask(33) = '0' then
-- ignore 'don't fragment' bit on IP FLAG-FRAG test (x"4000" or x"0000")...
          if pkt_data(119 downto 112) /=
	  (my_rx_data(7) & (my_rx_data(6) and frag_mask(9)) &
	  my_rx_data(5 downto 0)) then
            pkt_drop := '1';
          end if;
          pkt_data := pkt_data(111 downto 0) & x"00";
	  frag_mask := frag_mask(8 downto 0) & '1';
        end if;
        pkt_mask := pkt_mask(32 downto 0) & '1';
      end if;
      pkt_drop_ip_sig <= pkt_drop
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

-- UDP packet to IPbus port:
-- Ethernet
-- IP VERS, HL, TOS
-- IP LEN
-- IP ID
-- IP FLAG-FRAG
-- IP TTL, PROTO = x"11"
-- IP CKSUM
-- IP SPA(4)
-- IP DPA(4)
-- UDP SRCPORT
-- UDP DSTPORT (50001)
ipbus_pkt:  process (mac_clk)
  variable pkt_data: std_logic_vector(23 downto 0);
  variable pkt_mask: std_logic_vector(37 downto 0);
  variable pkt_drop: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        pkt_mask := "111111" & "111111" & "11" &
        "11" & "11" & "11" & "11" & "1" & "0" & "11" &
        "1111" & "1111" & "11" & "00";
        pkt_data := x"11" & ipbus_port;
        pkt_drop := not enable_125;
      elsif my_rx_last = '1' then
        pkt_drop := '1';
      elsif my_rx_valid = '1' then
        if pkt_drop_ip_sig = '1' then
	  pkt_drop := '1';
        elsif pkt_mask(37) = '0' then
          if pkt_data(23 downto 16) /= my_rx_data then
            pkt_drop := '1';
          end if;
          pkt_data := pkt_data(15 downto 0) & x"00";
        end if;
        pkt_mask := pkt_mask(36 downto 0) & '1';
      end if;
      pkt_drop_ipbus_sig <= pkt_drop
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

-- IPbus header parsers (switch 1 tick earlier...)
-- Also kludge a runt packet signal
ipbus_mask: process(mac_clk)
  variable pkt_mask: std_logic_vector(44 downto 0);
  variable last_mask, header_sel: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        pkt_mask := "111111" & "111111" & "11" &
        "11" & "11" & "11" & "11" & "1" & "1" & "11" &
        "1111" & "1111" & "11" & "1" & "00" & "11" & "0000";
        last_mask := '1';
	header_sel := '1';
      elsif my_rx_valid = '1' then
        if pkt_mask(44) = '1' and last_mask = '0' then
          header_sel := '0';
        end if;
	last_mask := pkt_mask(44);
        pkt_mask := pkt_mask(43 downto 0) & '1';
      end if;
      ipbus_status_mask <= last_mask
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      ipbus_hdr_mask <= last_mask or header_sel
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      pkt_runt <= header_sel
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

-- UDP payload:
-- IPBus packet header x"20nnnnF0" or x"200000F0"
-- IPBus data...
bigendian:  process (mac_clk)
  variable reliable_data: std_logic_vector(31 downto 0);
  variable unreliable_data: std_logic_vector(31 downto 0);
  variable pkt_drop_reliable_i, pkt_drop_unreliable: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        reliable_data := x"20" & next_pkt_id & x"F0";
        unreliable_data := x"200000F0";
        pkt_drop_reliable_i := not enable_125;
        pkt_drop_unreliable := not enable_125;
      elsif my_rx_last = '1' then
	pkt_drop_reliable_i := '1';
	pkt_drop_unreliable := '1';
      elsif my_rx_valid = '1' then
        if pkt_drop_ipbus_sig = '1' then
	  pkt_drop_reliable_i := '1';
	  pkt_drop_unreliable := '1';
        elsif ipbus_hdr_mask = '0' then
          if reliable_data(31 downto 24) /= my_rx_data then
            pkt_drop_reliable_i := '1';
          end if;
          if unreliable_data(31 downto 24) /= my_rx_data then
            pkt_drop_unreliable := '1';
          end if;
          reliable_data := reliable_data(23 downto 0) & x"00";
          unreliable_data := unreliable_data(23 downto 0) & x"00";
        end if;
      end if;
      pkt_drop_reliable_sig <= pkt_drop_reliable_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      pkt_drop_payload_sig <= pkt_drop_reliable_i and pkt_drop_unreliable
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

-- UDP payload:
-- IPBus packet header x"F0nnnn20" or x"F0000020"
-- IPBus data...
littleendian:  process (mac_clk)
  variable reliable_data: std_logic_vector(31 downto 0);
  variable unreliable_data: std_logic_vector(31 downto 0);
  variable pkt_drop_reliable_i, pkt_drop_unreliable: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        reliable_data := x"F0" & next_pkt_id(7 downto 0) &
	next_pkt_id(15 downto 8)  & x"20";
        unreliable_data := x"F0000020";
        pkt_drop_reliable_i := not enable_125;
        pkt_drop_unreliable := not enable_125;
      elsif my_rx_last = '1' then
	pkt_drop_reliable_i := '1';
	pkt_drop_unreliable := '1';
      elsif my_rx_valid = '1' then
        if pkt_drop_ipbus_sig = '1' then
	  pkt_drop_reliable_i := '1';
	  pkt_drop_unreliable := '1';
        elsif ipbus_hdr_mask = '0' then
          if reliable_data(31 downto 24) /= my_rx_data then
            pkt_drop_reliable_i := '1';
          end if;
          if unreliable_data(31 downto 24) /= my_rx_data then
            pkt_drop_unreliable := '1';
          end if;
          reliable_data := reliable_data(23 downto 0) & x"00";
          unreliable_data := unreliable_data(23 downto 0) & x"00";
        end if;
      end if;
      pkt_reliable_drop_sig <= pkt_drop_reliable_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      pkt_payload_drop_sig <= pkt_drop_reliable_i and pkt_drop_unreliable
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

-- Reliable payload signal
reliable_payload: process(mac_clk)
  variable IsReliable: std_logic;
  Begin
    if rising_edge(mac_clk) then
      If rx_reset = '1' then
        IsReliable := '0';
      ElsIf my_rx_last = '1' then
        IsReliable := not (pkt_drop_reliable_sig and pkt_reliable_drop_sig);
      End If;
      reliable_packet <= IsReliable
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process reliable_payload;

-- UDP status request:
-- UDP LEN (72 = x"48")
-- IPBus packet header x"200000F1"
status_request:  process (mac_clk)
  variable pkt_data: std_logic_vector(47 downto 0);
  variable pkt_drop: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        pkt_data := x"0048200000F1";
        pkt_drop := not enable_125;
      elsif my_rx_last = '1' then
        pkt_drop := '1';
      elsif my_rx_valid = '1' then
        if pkt_drop_ipbus_sig = '1' then
	  pkt_drop := '1';
        elsif ipbus_status_mask = '0' then
          if pkt_data(47 downto 40) /= my_rx_data then
            pkt_drop := '1';
          end if;
          pkt_data := pkt_data(39 downto 0) & x"00";
        end if;
      end if;
      pkt_drop_status <= pkt_drop
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

-- UDP resend request:
-- IPBus packet header x"20XXXXF2"
resend:  process (mac_clk)
  variable pkt_data: std_logic_vector(15 downto 0);
  variable pkt_mask: std_logic_vector(3 downto 0);
  variable pkt_drop: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        pkt_data := x"20F2";
	pkt_mask := "0110";
        pkt_drop := not enable_125;
      elsif my_rx_last = '1' then
        pkt_drop := '1';
      elsif my_rx_valid = '1' then
        if pkt_drop_ipbus_sig = '1' then
	  pkt_drop := '1';
        elsif ipbus_hdr_mask = '0' then
	  if pkt_mask(3) = '0' then
	    if pkt_data(15 downto 8) /= my_rx_data then
              pkt_drop := '1';
            end if;
            pkt_data := pkt_data(7 downto 0) & x"00";
	  end if;
	  pkt_mask := pkt_mask(2 downto 0) & '1';
        end if;
      end if;
      pkt_drop_resend <= pkt_drop
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

broadcast:  process (mac_clk)
  variable pkt_mask: std_logic_vector(5 downto 0);
  variable broadcast_int: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
	pkt_mask := (Others => '0');
        broadcast_int := '1';
      elsif my_rx_valid = '1' and pkt_mask(5) = '0' then
        if my_rx_data /= x"FF" then
          broadcast_int := '0';
        end if;
        pkt_mask := pkt_mask(4 downto 0) & '1';
      end if;
      pkt_broadcast_sig <= broadcast_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

end v3;
