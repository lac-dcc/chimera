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


-- Builds outbound status packet
--
-- Dave Sankey, Jan 2013

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_build_status is
  port (
    mac_clk: in std_logic;
    rx_reset: in std_logic;
    my_rx_data: in std_logic_vector(7 downto 0);
    my_rx_valid: in std_logic;
    my_rx_last: in std_logic;
    my_rx_error: in std_logic;
    pkt_drop_status: in std_logic;
    status_block: in std_logic_vector(127 downto 0);
    status_request: out std_logic;
    status_data: out std_logic_vector(7 downto 0);
    status_addr: out std_logic_vector(12 downto 0);
    status_we: out std_logic;
    status_end_addr: out std_logic_vector(12 downto 0);
    status_send: out std_logic
  );
end udp_build_status;

architecture rtl of udp_build_status is

  signal set_addr: std_logic;
  signal send_pending, send_buf, load_buf: std_logic;
  signal address, addr_to_set: unsigned(6 downto 0);

begin

  status_addr <= std_logic_vector("000000" & address);

send_packet:  process (mac_clk)
  variable end_addr_i: std_logic_vector(12 downto 0);
  begin
    if rising_edge(mac_clk) then
      if send_pending = '1' then
        end_addr_i := std_logic_vector(to_unsigned(105, 13));
      else
        end_addr_i := (Others => '0');
      end if;
      status_end_addr <= end_addr_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      status_send <= send_pending
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      send_pending <= my_rx_last and not (pkt_drop_status or my_rx_error)
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

good_packet_block:  process (mac_clk)
  begin
    if rising_edge(mac_clk) then
      status_we <= my_rx_valid and not pkt_drop_status
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

-- UDP status packet:
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
-- UDP DSTPORT (50002)
-- UDP LEN
-- UDP CKSUM
-- UDP data...
address_block:  process (mac_clk)
  variable addr_to_set_int: unsigned(6 downto 0);
  variable set_addr_int: std_logic;
  begin
    if rising_edge(mac_clk) then
      if (rx_reset = '1') then
	set_addr_int := '1';
	addr_to_set_int := to_unsigned(6, 7);
      elsif (my_rx_valid = '1') and (pkt_drop_status = '0') then
-- Because address is buffered this logic needs to switch a byte early...
        case to_integer(address) is
-- RX Ethernet Dest MAC bytes 0 to 5 => TX copy to Source MAC bytes 6 to 11...
          when 10 =>
	    set_addr_int := '1';
	    addr_to_set_int := to_unsigned(0, 7);
-- RX Ethernet Source MAC bytes 6 to 11 => TX copy to Dest MAC bytes 0 to 5...
          when 4 =>
	    set_addr_int := '1';
	    addr_to_set_int := to_unsigned(12, 7);
-- RX Eth_Type tho' to IP cksum bytes 12 to 25 => TX copy data bytes 12 to 25...
          when 24 =>
	    set_addr_int := '1';
	    addr_to_set_int := to_unsigned(30, 7);
-- RX IP sender addr bytes 26 to 29 => TX copy to target addr bytes 30 to 33...
          when 32 =>
	    set_addr_int := '1';
	    addr_to_set_int := to_unsigned(26, 7);
-- RX IP target addr bytes 30 to 33 => TX write sender addr bytes 26 to 29...
          when 28 =>
	    set_addr_int := '1';
	    addr_to_set_int := to_unsigned(36, 7);
-- RX UDP source port bytes 34 to 35 => TX copy to dest port bytes 36 to 37...
          when 36 =>
	    set_addr_int := '1';
	    addr_to_set_int := to_unsigned(34, 7);
-- RX UDP dest port bytes 36 to 37 => TX write source port bytes 34 to 35...
          when 34 =>
	    set_addr_int := '1';
	    addr_to_set_int := to_unsigned(38, 7);
-- RX rest of packet => TX copy rest of packet...
          when Others =>
	    addr_to_set_int := (Others => '0');
	    set_addr_int := '0';
        end case;
      else
        addr_to_set_int := (Others => '0');
        set_addr_int := '0';
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

next_addr:  process(mac_clk)
  variable addr_int, next_addr, addr_to_set_buf: unsigned(6 downto 0);
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
	elsif pkt_drop_status = '0' then
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

load_data:  process (mac_clk)
  variable load_buf_int, next_load, send_buf_int, request_int: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        request_int := '0';
	send_buf_int := '0';
	next_load := '0';
      elsif (my_rx_valid = '1') and (pkt_drop_status = '0') then
        load_buf_int := next_load;
-- Because address is buffered this logic needs to switch a byte early...
        case to_integer(address) is
-- End of header, start sending (zeros for cksum)...
          when 38 =>
            request_int := '0';
	    send_buf_int := '1';
	    next_load := '0';
-- And prepare to load header buffer...
          when 39 =>
            request_int := '0';
	    next_load := '1';
-- request history buffer...
          when 55 =>
	    request_int := '1';
	    next_load := '1';
-- request ipbus_in buffer...
          when 71 =>
	    request_int := '1';
	    next_load := '1';
-- request ipbus_out buffer...
          when 87 =>
	    request_int := '1';
	    next_load := '1';
          when Others =>
            request_int := '0';
	    next_load := '0';
        end case;
      else
        request_int := '0';
	load_buf_int := '0';
      end if;
      load_buf <= load_buf_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      send_buf <= send_buf_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      status_request <= request_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

write_data:  process(mac_clk)
  variable shift_buf: std_logic_vector(127 downto 0);
  variable data_to_send: std_logic_vector(7 downto 0);
  begin
    if rising_edge(mac_clk) then
      if load_buf = '1' then
        shift_buf := status_block;
      end if;
      if my_rx_valid = '1' and pkt_drop_status = '0' then
	if send_buf = '1' then
	  data_to_send := shift_buf(127 downto 120);
	else
	  data_to_send := my_rx_data;
	end if;
	shift_buf := shift_buf(119 downto 0) & x"00";
      else
        data_to_send := (Others => '0');
      end if;
      status_data <= data_to_send
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

end rtl;
