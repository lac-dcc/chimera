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


-- Builds outbound payload header and copies payload
--
-- Dave Sankey, August 2012

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_build_payload is
  port (
    mac_clk: in std_logic;
    rx_reset: in std_logic;
    my_rx_data: in std_logic_vector(7 downto 0);
    my_rx_valid: in std_logic;
    my_rx_last: in std_logic;
    my_rx_error: in std_logic;
    pkt_drop_payload: in std_logic;
    pkt_byteswap: in std_logic;
    outbyte: in std_logic_vector(7 downto 0);
    payload_data: out std_logic_vector(7 downto 0);
    payload_addr: out std_logic_vector(12 downto 0);
    payload_we: out std_logic;
    payload_send: out std_logic;
    do_sum_payload: out std_logic;
    clr_sum_payload: out std_logic;
    int_data_payload: out std_logic_vector(7 downto 0);
    int_valid_payload: out std_logic;
    cksum: out std_logic;
    ipbus_in_hdr: out std_logic_vector(31 downto 0)
  );
end udp_build_payload;

architecture rtl of udp_build_payload is

  signal payload_we_sig, set_addr, send_pending, good_packet: std_logic;
  signal send_buf, load_buf, low_addr, next_low, byteswap: std_logic;
  signal buf_to_load: std_logic_vector(15 downto 0);
  signal address, addr_to_set, next_addr: unsigned(12 downto 0);
  signal payload_data_sig: std_logic_vector(7 downto 0);

begin

  payload_we <= payload_we_sig;
  payload_data <= payload_data_sig;

  good_packet <= send_pending or not pkt_drop_payload;

  With byteswap select payload_addr <=
  std_logic_vector(address(12 downto 2) & not address(1 downto 0)) when '1',
  std_logic_vector(address) when Others;

send_packet:  process (mac_clk)
  variable send_pending_i, send_i, last_we: std_logic;
  variable state, next_state: integer range 0 to 1;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
	next_state := 0;
      end if;
      state := next_state;
      case state is
        when 0 =>
	  send_i := '0';
	  if my_rx_last = '1' and good_packet = '1' and 
	  my_rx_error = '0' then
	    send_pending_i := '1';
	    next_state := 1;
	  else
	    send_pending_i := '0';
	  end if;
	when 1 =>
	  if payload_we_sig = '0' and last_we = '1' then
	    send_i := '1';
	    send_pending_i := '0';
	    next_state := 0;
	  else
	    send_i := '0';
	  end if;
      end case;
      last_we := payload_we_sig;
      payload_send <= send_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      send_pending <= send_pending_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

-- UDP payload:
-- Ethernet DST_MAC(6), SRC_MAC(6), Ether_Type = x"0800"
-- IP VERS = x"4", HL = x"5", TOS = x"00"
-- IP LEN
-- IP ID
-- IP FLAG-FRAG = x"4000"
-- IP TTL, PROTO = x"11"
-- IP CKSUM
-- IP SPA(4)
-- IP DPA(4)
-- UDP SRCPORT
-- UDP DSTPORT (50001)
-- UDP LEN
-- UDP CKSUM
-- UDP data...
set_address_block:  process(mac_clk)
  variable addr_to_set_int: unsigned(5 downto 0);
  variable set_addr_int, cksum_pending: std_logic;
  begin
    if rising_edge(mac_clk) then
      if (rx_reset = '1') then
	set_addr_int := '1';
	addr_to_set_int := to_unsigned(12, 6);
	cksum_pending := '0';
      elsif good_packet = '1' then
        if my_rx_last = '1' then
	  set_addr_int := '1';
	  addr_to_set_int := to_unsigned(4, 6);
	  cksum_pending := '1';
	elsif my_rx_valid = '1' and low_addr = '1' then
-- Because address is buffered this logic needs to switch a byte early...
-- But don't forget we're offset by 4 + 2 bytes for payload word alignment!
          case to_integer(address(5 downto 0)) is
-- RX Ethernet Dest MAC bytes 0 to 5 => TX copy to Source MAC bytes 12 to 17...
            when 16 =>
	      set_addr_int := '1';
	      addr_to_set_int := to_unsigned(6, 6);
-- RX Ethernet Source MAC bytes 6 to 11 => TX copy to Dest MAC bytes 6 to 11...
            when 10 =>
	      set_addr_int := '1';
	      addr_to_set_int := to_unsigned(18, 6);
-- RX Eth_Type tho' to IP cksum bytes 12 to 25 => TX copy data bytes 18 to 31...
            when 30 =>
	      set_addr_int := '1';
	      addr_to_set_int := to_unsigned(36, 6);
-- RX IP sender addr bytes 26 to 29 => TX copy to target addr bytes 36 to 39...
            when 38 =>
	      set_addr_int := '1';
	      addr_to_set_int := to_unsigned(32, 6);
-- RX IP target addr bytes 30 to 33 => TX write sender addr bytes 32 to 35...
            when 34 =>
	      set_addr_int := '1';
	      addr_to_set_int := to_unsigned(42, 6);
-- RX UDP source port bytes 34 to 35 => TX copy to dest port bytes 42 to 43...
            when 42 =>
	      set_addr_int := '1';
	      addr_to_set_int := to_unsigned(40, 6);
-- RX UDP dest port bytes 36 to 37 => TX write source port bytes 40 to 41...
            when 40 =>
	      set_addr_int := '1';
	      addr_to_set_int := to_unsigned(44, 6);
-- RX UDP length and cksum bytes 38 to 41 => TX write zeros bytes 44 to 47...
            when Others =>
	      set_addr_int := '0';
	      addr_to_set_int := (Others => '0');
          end case;
        elsif cksum_pending = '1' and low_addr = '1' and
	address(5 downto 0) = "000100" then
-- No more data => write cksum and length info...
          set_addr_int := '1';
	  addr_to_set_int := to_unsigned(0, 6);
	  cksum_pending := '0';
        else
	  set_addr_int := '0';
	  addr_to_set_int := (Others => '0');
        end if;
      else
	set_addr_int := '0';
	addr_to_set_int := (Others => '0');
      end if;
      set_addr <= set_addr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      addr_to_set <= "0000000" & addr_to_set_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

build_packet:  process(mac_clk)
  variable cksum_pending: std_logic;
  variable buf_to_load_int: std_logic_vector(15 downto 0);
  variable load_buf_int, send_buf_int, payload_we_i: std_logic;
  variable payload_len: std_logic_vector(15 downto 0);
  begin
    if rising_edge(mac_clk) then
      if (rx_reset = '1') then
	send_buf_int := '0';
	load_buf_int := '0';
	cksum_pending := '0';
	payload_len := (Others => '0');
	buf_to_load_int := (Others => '0');
      elsif good_packet = '1' then
        payload_we_i := my_rx_valid or cksum_pending;
	if my_rx_last = '1' then
	  load_buf_int := '1';
	  send_buf_int := '1';
	  cksum_pending := '1';
	elsif my_rx_valid = '1' and low_addr = '1' then
-- Because address is buffered this logic needs to switch a byte early...
-- But don't forget we're offset by 4 + 2 bytes for payload word alignment!
          case to_integer(address(5 downto 0)) is
            when 20 =>
	      load_buf_int := '1';
	      send_buf_int := '1';
-- RX IP length => ignore for cksum, write zeros, capture packet length
            when 22 =>
	      send_buf_int := '0';
            when 28 =>
	      send_buf_int := '1';
-- RX IP cksum => ignore for cksum calc and write zeros
            when 30 =>
	      send_buf_int := '0';
-- RX IP sender addr bytes 26 to 29 => TX copy to target addr bytes 36 to 39...
            when 40 =>
	      send_buf_int := '1';
-- RX UDP length and cksum bytes 38 to 41 => TX write zeros bytes 44 to 47...
            when 44 =>
	      buf_to_load_int(7 downto 0) := outbyte;
-- capture IP cksum value and start payload length calculation...
            when 45 =>
	      buf_to_load_int(15 downto 8) := outbyte;
-- capture IP cksum value and continue payload length calculation...
            when 46 =>
	      send_buf_int := '0';
            when 52 =>
-- capture payload length calculation...
              payload_len(7 downto 0) := outbyte;
            when 53 =>
-- capture payload length calculation...
              payload_len(15 downto 8) := outbyte;
-- RX rest of packet => TX copy rest of packet...
            when Others =>
	      load_buf_int := '0';
          end case;
-- No more data => write cksum and length info...
        elsif cksum_pending = '1' and low_addr = '1' then
	  case to_integer(address(5 downto 0)) is
	    when 4 =>
	      load_buf_int := '1';
	      buf_to_load_int := std_logic_vector(to_unsigned(12, 16));
	    when 0 =>
	      load_buf_int := '1';
	      buf_to_load_int := payload_len;
	    when 2 =>
	      cksum_pending := '0';
	    when Others =>
	      load_buf_int := '0';
	  end case;
	else
	  load_buf_int := '0';
        end if;
      else
	payload_we_i := '0';
      end if;
      payload_we_sig <= payload_we_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      load_buf <= load_buf_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      buf_to_load <= buf_to_load_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      send_buf <= send_buf_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

do_cksum:  process(mac_clk)
  variable do_sum_int, clr_sum_int, cksum_int, int_valid_int: std_logic;
  variable int_data_int: std_logic_vector(7 downto 0);
  variable payload_len: std_logic_vector(15 downto 0);
  begin
    if rising_edge(mac_clk) then
      if (rx_reset = '1') then
	do_sum_int := '0';
	clr_sum_int := '1';
	int_valid_int := '0';
	cksum_int := '1';
	int_data_int := (Others => '0');
	payload_len := (Others => '0');
      elsif my_rx_valid = '1' and good_packet = '1' and low_addr = '1' then
-- Because address is buffered this logic needs to switch a byte early...
-- But don't forget we're offset by 4 + 2 bytes for payload word alignment!
        case to_integer(address(5 downto 0)) is
-- RX Ethernet Dest MAC bytes 0 to 5 => TX copy to Source MAC bytes 12 to 17...
          when 18 =>
	    do_sum_int := '1';
	    clr_sum_int := '1';
	    cksum_int := '1';
-- RX IP header => start cksum calc - we'll redo length and cksum when we send...
          when 20 =>
	    do_sum_int := '0';
-- RX IP length => ignore for cksum, write zeros, capture packet length
          when 21 =>
	    payload_len(15 downto 6) := "00" & my_rx_data;
-- RX IP length => ignore for cksum, write zeros, capture packet length
          when 22 =>
	    payload_len(5 downto 0) := my_rx_data(7 downto 2);
	    do_sum_int := '1';
          when 28 =>
	    do_sum_int := '0';
-- RX IP cksum => ignore for cksum calc and write zeros
          when 30 =>
	    do_sum_int := '1';
-- RX IP sender addr bytes 26 to 29 => TX copy to target addr bytes 36 to 39...
          when 34 =>
	    do_sum_int := '0';
-- cksum calculation complete...
-- RX UDP source port bytes 34 to 35 => TX copy to dest port bytes 42 to 43...
          when 44 =>
-- capture IP cksum value and start payload length calculation...
	    do_sum_int := '1';
	    clr_sum_int := '1';
	    cksum_int := '0';
	    int_valid_int := '1';
	    int_data_int := payload_len(15 downto 8);
-- RX UDP length and cksum bytes 38 to 41 => TX write zeros bytes 44 to 47...
          when 45 =>
-- capture IP cksum value and continue payload length calculation...
	    clr_sum_int := '0';
            int_valid_int := '1';
	    int_data_int := payload_len(7 downto 0);
          when 46 =>
-- continue payload length calculation (loading -8)...
	    int_valid_int := '1';
	    int_data_int := x"FF";
          when 47 =>
-- continue payload length calculation (loading -8)...
	    int_valid_int := '1';
	    int_data_int := x"F8";
          when 48 =>
	    int_valid_int := '0';
	    do_sum_int := '0';
          when Others =>
	    clr_sum_int := '0';
	    int_valid_int := '0';
	    int_data_int := (Others => '0');
        end case;
      else
        clr_sum_int := '0';
	int_valid_int := '0';
	int_data_int := (Others => '0');
      end if;
      do_sum_payload <= do_sum_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      clr_sum_payload <= clr_sum_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      int_data_payload <= int_data_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      int_valid_payload <= int_valid_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      cksum <= cksum_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

next_addr_block:  process(mac_clk)
  variable addr_int, next_addr_int, addr_to_set_buf: unsigned(12 downto 0);
  variable set_addr_buf, next_low_int: std_logic;
  begin
    if rising_edge(mac_clk) then
      if set_addr = '1' then
        addr_to_set_buf := addr_to_set;
	set_addr_buf := '1';
      end if;
      if rx_reset = '1' or my_rx_valid = '1' or send_pending = '1' then
        if set_addr_buf = '1' then
          addr_int := addr_to_set_buf;
	  set_addr_buf := '0';
	elsif good_packet = '1' then
          addr_int := next_addr_int;
	end if;
      end if;
      next_addr_int := addr_int + 1;
      if next_addr(12 downto 6) = "0000000" then
        next_low_int := '1';
      else
        next_low_int := '0';
      end if;
      next_addr <= next_addr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      next_low <= next_low_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

address_block:  process(mac_clk)
  variable addr_int, addr_to_set_buf: unsigned(12 downto 0);
  variable set_addr_buf, low_addr_i: std_logic;
  begin
    if rising_edge(mac_clk) then
      if set_addr = '1' then
        addr_to_set_buf := addr_to_set;
	set_addr_buf := '1';
      end if;
      if rx_reset = '1' or my_rx_valid = '1' or send_pending = '1' then
        if set_addr_buf = '1' then
          addr_int := addr_to_set_buf;
	  low_addr_i := '1';
	  set_addr_buf := '0';
	elsif good_packet = '1' then
          addr_int := next_addr;
	  low_addr_i := next_low;
	end if;
      end if;
      address <= addr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      low_addr <= low_addr_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

byteswap_block:  process(mac_clk)
  variable set_addr_buf, byteswap_int: std_logic;
  begin
    if rising_edge(mac_clk) then
      if set_addr = '1' then
 	set_addr_buf := '1';
      end if;
      if rx_reset = '1' or my_rx_valid = '1' or send_pending = '1' then
        if set_addr_buf = '1' then
	  byteswap_int := '0';
	  set_addr_buf := '0';
	elsif next_low = '1' and next_addr(5 downto 0) = to_unsigned(52, 6) then
	  byteswap_int := pkt_byteswap;
	end if;
      end if;
      byteswap <= byteswap_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

write_data:  process(mac_clk)
  variable shift_buf: std_logic_vector(15 downto 0);
  variable data_to_send: std_logic_vector(7 downto 0);
  begin
    if rising_edge(mac_clk) then
      data_to_send := (Others => '0');
      if load_buf = '1' then
        shift_buf := buf_to_load;
      end if;
      if (my_rx_valid = '1' or send_pending = '1') and good_packet = '1' then
	if send_buf = '1' then
	  data_to_send := shift_buf(15 downto 8);
	else
	  data_to_send := my_rx_data;
	end if;
	shift_buf := shift_buf(7 downto 0) & x"00";
      end if;
      payload_data_sig <= data_to_send
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

do_ipbus_hdr: process(mac_clk)
  variable ipbus_hdr_int: std_logic_vector(31 downto 0);
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
	ipbus_hdr_int := (Others => '0');
      elsif low_addr = '1' and payload_we_sig = '1' and address(5 downto 2) = "1100" then
        ipbus_hdr_int := ipbus_hdr_int(23 downto 0) & payload_data_sig;
      end if;
      ipbus_in_hdr <= ipbus_hdr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;
    
end rtl;
