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


-- Builds outbound ping response
--
-- Dave Sankey, July 2012

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_build_ping is
  port (
    mac_clk: in std_logic;
    rx_reset: in std_logic;
    my_rx_data: in std_logic_vector(7 downto 0);
    my_rx_valid: in std_logic;
    my_rx_last: in std_logic;
    my_rx_error: in std_logic;
    pkt_drop_ping: in std_logic;
    outbyte: in std_logic_vector(7 downto 0);
    ping_data: out std_logic_vector(7 downto 0);
    ping_addr: out std_logic_vector(12 downto 0);
    ping_we: out std_logic;
    ping_end_addr: out std_logic_vector(12 downto 0);
    ping_send: out std_logic;
    do_sum_ping: out std_logic;
    clr_sum_ping: out std_logic;
    int_data_ping: out std_logic_vector(7 downto 0);
    int_valid_ping: out std_logic
  );
end udp_build_ping;

architecture rtl of udp_build_ping is

  signal ping_we_sig, set_addr, send_pending, good_packet: std_logic;
  signal send_buf, load_buf, low_addr: std_logic;
  signal buf_to_load: std_logic_vector(15 downto 0);
  signal address, addr_to_set: unsigned(12 downto 0);

begin

  ping_we <= ping_we_sig;
  ping_addr <= std_logic_vector(address);

  good_packet <= send_pending or not pkt_drop_ping;

send_packet:  process (mac_clk)
  variable send_pending_i, send_i, last_we: std_logic;
  variable end_addr_i: std_logic_vector(12 downto 0);
  variable state, next_state: integer range 0 to 2;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
	next_state := 0;
      end if;
      state := next_state;
      case state is
        when 0 =>
	  send_i := '0';
	  end_addr_i := (Others => '0');
	  if my_rx_last = '1' and good_packet = '1' and 
	  my_rx_error = '0' then
	    send_pending_i := '1';
	    next_state := 1;
	  else
	    send_pending_i := '0';
	  end if;
	when 1 =>
	  end_addr_i := std_logic_vector(address);
	  next_state := 2;
	when 2 =>
	  if ping_we_sig = '0' and last_we = '1' then
	    send_i := '1';
	    send_pending_i := '0';
	    next_state := 0;
	  end if;
      end case;
      last_we := ping_we_sig;
      ping_end_addr <= end_addr_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      ping_send <= send_i
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

-- Ping:
-- Ethernet DST_MAC(6), SRC_MAC(6), Ether_Type = x"0800"
-- IP VERS = x"4", HL = x"5", TOS = x"00"
-- IP LEN
-- IP ID
-- IP FLAG-FRAG = x"4000"
-- IP TTL, PROTO = x"01"
-- IP CKSUM
-- IP SPA(4)
-- IP DPA(4)
-- ICMP TYPE = "00", CODE = "00"
-- ICMP CKSUM
-- ICMP data...
address_block:  process (mac_clk)
  variable addr_to_set_int: unsigned(5 downto 0);
  variable set_addr_int: std_logic;
  begin
    if rising_edge(mac_clk) then
      if (rx_reset = '1') then
	set_addr_int := '1';
	addr_to_set_int := to_unsigned(6, 6);
      elsif good_packet = '1' then
	if my_rx_last = '1' then
-- ICMP cksum...
	  set_addr_int := '1';
	  addr_to_set_int := to_unsigned(36, 6);
	elsif my_rx_valid = '1' and low_addr = '1' then
-- Because address is buffered this logic needs to switch a byte early...
          case to_integer(address(5 downto 0)) is
-- RX Ethernet Dest MAC bytes 0 to 5 => TX copy to Source MAC bytes 6 to 11...
            when 10 =>
	      set_addr_int := '1';
	      addr_to_set_int := to_unsigned(0, 6);
-- RX Ethernet Source MAC bytes 6 to 11 => TX copy to Dest MAC bytes 0 to 5...
            when 4 =>
	      set_addr_int := '1';
	      addr_to_set_int := to_unsigned(12, 6);
-- RX Eth_Type tho' to IP cksum bytes 12 to 25 => TX copy data bytes 12 to 25...
-- as we're just rearranging words cksum stays the same...
            when 24 =>
	      set_addr_int := '1';
	      addr_to_set_int := to_unsigned(30, 6);
-- RX IP sender addr bytes 26 to 29 => TX copy to target addr bytes 30 to 33...
            when 32 =>
	      set_addr_int := '1';
	      addr_to_set_int := to_unsigned(26, 6);
-- RX IP target addr bytes 30 to 33 => TX write sender addr bytes 26 to 29...
            when 28 =>
	      set_addr_int := '1';
	      addr_to_set_int := to_unsigned(34, 6);
            when Others =>
	      set_addr_int := '0';
	      addr_to_set_int := (Others => '0');
	  end case;
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

build_packet:  process (mac_clk)
  variable cksum_pending: std_logic;
  variable buf_to_load_int: std_logic_vector(15 downto 0);
  variable load_buf_int, send_buf_int, ping_we_i: std_logic;
  begin
    if rising_edge(mac_clk) then
      if (rx_reset = '1') then
	send_buf_int := '0';
	load_buf_int := '0';
	ping_we_i := '0';
	buf_to_load_int := (Others => '0');
	cksum_pending := '0';
      elsif good_packet = '1' then
        ping_we_i := my_rx_valid or cksum_pending;
	if my_rx_last = '1' then
-- End of packet, prepare to send cksum
	  load_buf_int := '1';
	  send_buf_int := '1';
	  cksum_pending := '1';
	elsif my_rx_valid = '1' and low_addr = '1' then
-- Because address is buffered this logic needs to switch a byte early...
          case to_integer(address(5 downto 0)) is
-- RX ICMP type code bytes 34 to 35 => TX write reply bytes 34 to 35...
-- ICMP TYPE = "00", CODE = "00", NB address switch at 28!
            when 28 =>
	      load_buf_int := '1';
	      send_buf_int := '1';
	      buf_to_load_int := (Others => '0');
            when 36 =>
-- RX cksum bytes 36 to 37...
	      send_buf_int := '0';
-- RX rest of packet => TX copy rest of packet...
            when 43 =>
-- capture ICMP cksum value
              buf_to_load_int(15 downto 8) := outbyte;
            when 44 =>
-- capture ICMP cksum value
              buf_to_load_int(7 downto 0) := outbyte;
            when Others =>
	      load_buf_int := '0';
          end case;
-- No more data => write cksum...
        elsif cksum_pending = '1' then
          load_buf_int := '0';
	  if address = 36 then
	    cksum_pending := '0';
	  end if;
        end if;
      else
        ping_we_i := '0';
      end if;
      ping_we_sig <= ping_we_i
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

do_cksum:  process (mac_clk)
  variable do_sum_int, clr_sum_int, int_valid_int: std_logic;
  variable int_data_int: std_logic_vector(7 downto 0);
  begin
    if rising_edge(mac_clk) then
      if (rx_reset = '1') then
	do_sum_int := '0';
	clr_sum_int := '1';
	int_valid_int := '0';
	int_data_int := (Others => '0');
      elsif my_rx_valid = '1' and good_packet = '1' and low_addr = '1' then
-- Because address is buffered this logic needs to switch a byte early...
        case to_integer(address(5 downto 0)) is
-- RX ICMP type code bytes 34 to 35 => TX write reply bytes 34 to 35...
-- ICMP TYPE = "00", CODE = "00", NB address switch at 28!
-- zeros and start cksum calc...
-- we want -(-cksum - x"0800") = cksum + x"0800"...
          when 28 =>
	    do_sum_int := '1';
	    clr_sum_int := '1';
	    int_valid_int := '1';
	    int_data_int := x"08";   
          when 29 =>
	    clr_sum_int := '0';
	    int_valid_int := '1';
	    int_data_int := (Others => '0');
          when 36 =>
	    do_sum_int := '0';
	    clr_sum_int := '0';
	    int_valid_int := '0';
	    int_data_int := (Others => '0');
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
      do_sum_ping <= do_sum_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      clr_sum_ping <= clr_sum_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      int_data_ping <= int_data_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      int_valid_ping <= int_valid_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

next_addr:  process(mac_clk)
  variable addr_int, next_addr, addr_to_set_buf: unsigned(12 downto 0);
  variable set_addr_buf, low_addr_i, next_low: std_logic;
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
      next_addr := addr_int + 1;
      if next_addr(12 downto 6) = "0000000" then
        next_low := '1';
      else
        next_low := '0';
      end if;
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
      ping_data <= data_to_send
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

end rtl;
