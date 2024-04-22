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


-- Handles source of MAC and IP address...
-- Parses incoming RARP response to capture real MAC and IP address
--
-- Dave Sankey, July 2012 and September 2015

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_ipaddr_ipam is
  generic(
-- Switch between using DHCP or RARP as the protocol for external IP address management
-- '0' => RARP, '1' => DHCP
  	DHCP_RARP: std_logic := '0'
  );
  port (
    mac_clk: in std_logic;
    rst_macclk: in std_logic;
    rx_reset: in std_logic;
    enable_125: in std_logic;
    ipam_125: in std_logic;
    MAC_addr: in std_logic_vector(47 DOWNTO 0);
    IP_addr: in std_logic_vector(31 downto 0);
    my_rx_data: in std_logic_vector(7 downto 0);
    my_rx_error: in std_logic;
    my_rx_last: in std_logic;
    my_rx_valid: in std_logic;
    pkt_drop_ipam: in std_logic;
    My_MAC_addr: out std_logic_vector(47 downto 0);
    My_IP_addr: out std_logic_vector(31 downto 0);
    Server_IP_addr: out std_logic_vector(31 downto 0);
    ipam_running: out std_logic
  );
end udp_ipaddr_ipam;

architecture rtl of udp_ipaddr_ipam is

  TYPE STATE_TYPE IS (
    Option,
    Length,
	Payload
  );

  signal MAC_IP_addr_rx_vld, DHCP_vld: std_logic;
  signal MAC_addr_rx: std_logic_vector(47 downto 0);
  signal IP_addr_rx, Server_IP_addr_rx: std_logic_vector(31 downto 0);
  signal address: unsigned(8 downto 0);

begin

MAC_IP_addr_rx_vld_block:  process (mac_clk)
  begin
    if rising_edge(mac_clk) then
-- Valid RARP/DHCP response received.
      if my_rx_last = '1' and pkt_drop_ipam = '0' and 
      my_rx_error = '0' then
        MAC_IP_addr_rx_vld <= DHCP_vld
-- pragma translate_off
        after 4 ns
-- pragma translate_on
        ;
      else
        MAC_IP_addr_rx_vld <= '0'
-- pragma translate_off
        after 4 ns
-- pragma translate_on
        ;
      end if;
    end if;
  end process;

rarp_reply: if DHCP_RARP = '0' generate
Server_IP_addr_rx <= (Others => '0');
DHCP_vld <= '1';

MAC_IP_addr_rx_rarp: process(mac_clk)
  variable pkt_mask: std_logic_vector(41 downto 0);
  variable MAC_IP_addr_rx_int: std_logic_vector(79 downto 0);
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        pkt_mask := "111111" & "111111" & "11" &
        "11" & "11" & "11" & "11" & "111111" &
        "1111" & "000000" & "0000";
	MAC_IP_addr_rx_int := (Others => '0');
      elsif my_rx_valid = '1' then
        if pkt_drop_ipam = '1' then
	  MAC_IP_addr_rx_int := (Others => '0');
        elsif pkt_mask(41) = '0' then
          MAC_IP_addr_rx_int := MAC_IP_addr_rx_int(71 downto 0) & my_rx_data;
        end if;
        pkt_mask := pkt_mask(40 downto 0) & '1';
      end if;
      MAC_addr_rx <= MAC_IP_addr_rx_int(79 downto 32)
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      IP_addr_rx <= MAC_IP_addr_rx_int(31 downto 0)
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;
end generate rarp_reply;

dhcp_offer: if DHCP_RARP = '1' generate
MAC_IP_addr_rx_dhcp: process(mac_clk)
  variable pkt_mask: std_logic_vector(5 downto 0);
  variable Parse_DHCP, Good_DHCP: std_logic;
  variable DHCP_state: STATE_TYPE;
  variable bytes_to_skip: unsigned(7 downto 0);
  variable MAC_IP_addr_rx_int: std_logic_vector(111 downto 0);
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        pkt_mask := (Others => '1');
        MAC_IP_addr_rx_int := (Others => '0');
        Parse_DHCP := '0';
        Good_DHCP := '0';
      elsif my_rx_valid = '1' then
        case to_integer(address) is
          when 58 => -- IP address
            pkt_mask := "000011";
          when 70 => -- MAC address
            pkt_mask := (Others => '0');
          when 282 =>
            Parse_DHCP := '1';
            DHCP_state := Option;
          when Others =>
        end case;
        if pkt_drop_ipam = '1' then
          MAC_IP_addr_rx_int := (Others => '0');
        elsif Parse_DHCP = '1' then
          case DHCP_state is
            when Option =>
              if my_rx_data = x"36" then -- get ready to capture server address
                Parse_DHCP := '0';
                Good_DHCP := '1';
                pkt_mask := "110000";
              elsif my_rx_data = x"FF" then -- Oops, didn't find server address
                Parse_DHCP := '0';
                MAC_IP_addr_rx_int := (Others => '0');
              elsif my_rx_data /= x"00" then
                DHCP_state := Length;
              end if;
            when Length =>
              bytes_to_skip := unsigned(my_rx_data);
              DHCP_state := Payload;
            when Payload =>
              bytes_to_skip := bytes_to_skip - 1;
              if bytes_to_skip = x"00" then
                DHCP_state := Option;
              end if;
          end case;
        elsif pkt_mask(5) = '0' then
          MAC_IP_addr_rx_int := MAC_IP_addr_rx_int(103 downto 0) & my_rx_data;
        end if;
        pkt_mask := pkt_mask(4 downto 0) & '1';
      end if;
      MAC_addr_rx <= MAC_IP_addr_rx_int(79 downto 32)
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      IP_addr_rx <= MAC_IP_addr_rx_int(111 downto 80)
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      Server_IP_addr_rx <= MAC_IP_addr_rx_int(31 downto 0)
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      DHCP_vld <= Good_DHCP
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

next_addr:  process(mac_clk)
  variable addr_int, next_addr: unsigned(8 downto 0);
  begin
    if rising_edge(mac_clk) then
      if rx_reset = '1' then
        addr_int := (Others => '0');
      elsif (my_rx_valid = '1') and (pkt_drop_ipam = '0') then
        addr_int := next_addr;
      end if;
      address <= addr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      next_addr := addr_int + 1;
    end if;
  end process;
end generate dhcp_offer;

My_MAC_IP_addr_block:  process (mac_clk)
  variable Got_MAC_IP_addr_rx, last_enable_125: std_logic;
  variable MAC_addr_int: std_logic_vector(47 downto 0);
  variable IP_addr_int, Server_IP_addr_int: std_logic_vector(31 downto 0);
  begin
    if rising_edge(mac_clk) then
-- Sample MAC_addr & IP_addr on reset or enable going high...
      if (rst_macclk = '1') or
      (enable_125 = '1' and last_enable_125 = '0') then
        Got_MAC_IP_addr_rx := '0';
		MAC_addr_int := MAC_addr;
		IP_addr_int := IP_addr;
		Server_IP_addr_int := (Others => '0');
      elsif MAC_IP_addr_rx_vld = '1' and ipam_125 = '1' then
        Got_MAC_IP_addr_rx := '1';
		MAC_addr_int := MAC_addr_rx;
		IP_addr_int := IP_addr_rx;
		Server_IP_addr_int := Server_IP_addr_rx;
      end if;
      last_enable_125 := enable_125;
      My_IP_addr <= IP_addr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      My_MAC_addr <= MAC_addr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      Server_IP_addr <= Server_IP_addr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      ipam_running <= enable_125 and ipam_125 and not Got_MAC_IP_addr_rx
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

end rtl;
