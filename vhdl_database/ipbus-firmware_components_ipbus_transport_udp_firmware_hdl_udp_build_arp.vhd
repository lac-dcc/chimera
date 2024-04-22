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


-- Builds outbound ARP response
--
-- Dave Sankey, July 2012

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_build_arp is
  port (
    mac_clk: in std_logic;
    rx_reset: in std_logic;
    my_rx_data: in std_logic_vector(7 downto 0);
    my_rx_valid: in std_logic;
    my_rx_last: in std_logic;
    my_rx_error: in std_logic;
    pkt_drop_arp: in std_logic;
    My_MAC_addr: in std_logic_vector(47 downto 0);
    My_IP_addr: in std_logic_vector(31 downto 0);
    arp_data: out std_logic_vector(7 downto 0);
    arp_addr: out std_logic_vector(12 downto 0);
    arp_we: out std_logic;
    arp_end_addr: out std_logic_vector(12 downto 0);
    arp_send: out std_logic
  );
end udp_build_arp;

architecture rtl of udp_build_arp is

  signal arp_we_sig, set_addr: std_logic;
  signal send_buf, load_buf: std_logic;
  signal buf_to_load: std_logic_vector(47 downto 0);
  signal address, addr_to_set: unsigned(5 downto 0);

begin

  arp_we <= arp_we_sig;
  arp_addr <= std_logic_vector("0000000" & address);

send_packet:  process (mac_clk)
  variable send_pending, send_i: std_logic;
  variable end_addr_i: std_logic_vector(12 downto 0);
  begin
    if rising_edge(mac_clk) then
      send_i := send_pending;
      if send_pending = '1' then
        end_addr_i := std_logic_vector(to_unsigned(41, 13));
      else
        end_addr_i := (Others => '0');
      end if;
      send_pending := my_rx_last and not (pkt_drop_arp or my_rx_error);
      arp_end_addr <= end_addr_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      arp_send <= send_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

-- ARP:
-- Ethernet DST_MAC(6), SRC_MAC(6), Ether_Type = x"0806"
-- HTYPE = x"0001"
-- PTYPE = x"0800"
-- HLEN = x"06", PLEN = x"04"
-- OPER = x"0002"
-- SHA(6)
-- SPA(4)
-- THA(6)
-- TPA(4)
address_block:  process(mac_clk)
  variable addr_to_set_int: unsigned(5 downto 0);
  variable set_addr_int: std_logic;
  begin
    if rising_edge(mac_clk) then
      if (rx_reset = '1') then
	set_addr_int := '1';
	addr_to_set_int := to_unsigned(6, 6);
      elsif (my_rx_valid = '1') and (pkt_drop_arp = '0') then
-- Because address is buffered this logic needs to switch a byte early...
        case to_integer(address) is
-- RX Ethernet Dest MAC bytes 0 to 5 => TX write Source MAC bytes 6 to 11...
          when 10 =>
	    set_addr_int := '1';
	    addr_to_set_int := to_unsigned(0, 6);
-- RX Ethernet Source MAC bytes 6 to 11 => TX copy to Dest MAC bytes 0 to 5...
          when 4 =>
	    set_addr_int := '1';
	    addr_to_set_int := to_unsigned(12, 6);
-- RX Eth_Type tho' to ARP Op Code hi bytes 12 to 20 => TX copy data bytes 12 to 20...
          when 20 =>
            set_addr_int := '1';
            addr_to_set_int := to_unsigned(32, 6);
-- RX ARP sender MAC and IP addr bytes 22 to 31 => TX copy to target MAC 
-- and IP addr bytes 32 to 41...
          when 40 =>
	    set_addr_int := '1';
	    addr_to_set_int := to_unsigned(22, 6);
-- RX ARP target MAC and IP addr bytes 32 to 41 => TX copy to sender...
          when 30 =>
	    set_addr_int := '1';
	    addr_to_set_int := to_unsigned(42, 6);
-- RX end of packet, just copy safely...
          when Others =>
	    set_addr_int := '0';
	    addr_to_set_int := (Others => '0');
        end case;
      else
        set_addr_int := '0';
	addr_to_set_int := (Others => '0');
      end if;
      set_addr <= set_addr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      addr_to_set <= addr_to_set_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

build_packet:  process (mac_clk)
  variable buf_to_load_int: std_logic_vector(47 downto 0);
  variable load_buf_int, send_buf_int, arp_we_i: std_logic;
  begin
    if rising_edge(mac_clk) then
      if (rx_reset = '1') then
	send_buf_int := '1';
	load_buf_int := '1';
	buf_to_load_int := My_MAC_addr;
      elsif (my_rx_valid = '1') and (pkt_drop_arp = '0') then
-- Because address is buffered this logic needs to switch a byte early...
        case to_integer(address) is
-- RX Ethernet Dest MAC bytes 0 to 5 => TX write Source MAC bytes 6 to 11...
          when 10 =>
            send_buf_int := '0';
-- RX Eth_Type tho' to ARP Op Code hi bytes 12 to 20 => TX copy data bytes 12 to 20...
          when 19 =>
	    send_buf_int := '1';
	    load_buf_int := '1';
	    buf_to_load_int := x"020000000000";
-- RX ARP Op Code lo byte 21 => TX send '2' byte 21...
          when 20 =>
            send_buf_int := '0';
-- RX ARP sender MAC and IP addr bytes 22 to 31 => TX copy to target MAC 
-- and IP addr bytes 32 to 41...
          when 40 =>
	    send_buf_int := '1';
	    load_buf_int := '1';
	    buf_to_load_int := My_MAC_addr;
-- RX ARP target MAC bytes 32 to 37 => TX write sender MAC bytes 22 to 27...
          when 26 =>
	    load_buf_int := '1';
	    buf_to_load_int := My_IP_addr & x"0000";
-- RX ARP target IP addr bytes 38 to 41 => TX write sender IP addr bytes 28 to 31...
          when Others =>
	    load_buf_int := '0';
        end case;
        arp_we_i := '1';
      else
	load_buf_int := '0';
	arp_we_i := '0';
      end if;
      arp_we_sig <= arp_we_i
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

next_addr:  process(mac_clk)
  variable addr_int, next_addr, addr_to_set_buf: unsigned(5 downto 0);
  variable set_addr_buf: std_logic;
  begin
    if rising_edge(mac_clk) then
      if set_addr = '1' then
        addr_to_set_buf := addr_to_set;
	set_addr_buf := '1';
      end if;
      if rx_reset = '1' or my_rx_valid = '1' then
        if set_addr_buf = '1' then
          addr_int := addr_to_set_buf;
	  set_addr_buf := '0';
	elsif pkt_drop_arp = '0' then
          addr_int := next_addr;
	end if;
      end if;
      address <= addr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      next_addr := addr_int + 1;
    end if;
  end process;

write_data:  process(mac_clk)
  variable shift_buf: std_logic_vector(47 downto 0);
  variable data_to_send: std_logic_vector(7 downto 0);
  begin
    if rising_edge(mac_clk) then
      data_to_send := (Others => '0');
      if load_buf = '1' then
        shift_buf := buf_to_load;
      end if;
      if my_rx_valid = '1' and pkt_drop_arp = '0' then
	if send_buf = '1' then
	  data_to_send := shift_buf(47 downto 40);
	else
	  data_to_send := my_rx_data;
	end if;
	shift_buf := shift_buf(39 downto 0) & x"00";
      end if;
      arp_data <= data_to_send
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

end rtl;
