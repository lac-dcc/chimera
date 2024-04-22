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


-- Sends packets to ethernet...
--
-- Default version reads from rxram and udpram,
-- with INTERNAL_ONLY = '1' only from rxram (for interFPGA FIFO)
--
-- Dave Sankey, July 2012, March 2015

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_tx_mux is
  generic(
-- Flag whether this instance only handles rxram
    INTERNAL_ONLY: std_logic := '0'
  );
  port (
    mac_clk: in std_logic;
    rst_macclk: in std_logic;
--
    rxram_end_addr: in std_logic_vector(12 downto 0);
    rxram_send: in std_logic;
    rxram_busy: out std_logic;
--
    addrb: out std_logic_vector(12 downto 0);
    dob: in std_logic_vector(7 downto 0);
--
    udpram_send: in std_logic;
    udpram_busy: out std_logic;
--
    udpaddrb: out std_logic_vector(12 downto 0);
    udpdob: in std_logic_vector(7 downto 0);
--
    do_sum: out std_logic;
    clr_sum: out std_logic;
    int_data: out std_logic_vector(7 downto 0);
    int_valid: out std_logic;
    cksum: out std_logic;
    outbyte: in std_logic_vector(7 downto 0);
--
    mac_tx_data: out std_logic_vector(7 downto 0);
    mac_tx_valid: out std_logic;
    mac_tx_last: out std_logic;
    mac_tx_error: out std_logic;
    mac_tx_ready: in std_logic;
--
    ipbus_out_hdr: out std_logic_vector(31 downto 0);
    ipbus_out_valid: out std_logic
  );
end udp_tx_mux;

architecture rtl of udp_tx_mux is

  signal rxram_busy_sig, rxram_active: std_logic;
  signal rxram_end_addr_sig: std_logic_vector(12 downto 0);
  signal udpram_busy_sig, udpram_active, low_addr: std_logic;
  signal udpram_end_addr_sig: std_logic_vector(12 downto 0);
  signal counting, set_addr, prefetch, send_special: std_logic;
  signal mac_tx_valid_sig, mac_tx_last_sig, mac_tx_ready_sig: std_logic;
  signal addr_to_set: std_logic_vector(12 downto 0);
  signal addr_sig: std_logic_vector(12 downto 0);
  signal special, mac_tx_data_sig: std_logic_vector(7 downto 0);
  signal ip_len, ip_cksum, udp_len: std_logic_vector(15 downto 0);
  signal udp_counter: unsigned(4 downto 0);
  signal udp_counting: std_logic;
  signal byteswap_sig, byteswapping: std_logic;
  signal udp_short_sig: std_logic;
  signal rst_macclk_sig: std_logic;

begin

  rxram_busy <= rxram_busy_sig;
  udpram_busy <= udpram_busy_sig;
  addrb <= addr_sig;
  mac_tx_data <= mac_tx_data_sig;
  mac_tx_last <= mac_tx_last_sig;
  mac_tx_valid <= mac_tx_valid_sig;
  mac_tx_ready_sig <= mac_tx_ready and mac_tx_valid_sig;
  mac_tx_error <= udp_short_sig and mac_tx_last_sig;

-- register reset...
	rst_macclk_block: process(mac_clk)
	begin
		if rising_edge(mac_clk) then
			rst_macclk_sig <= rst_macclk
-- pragma translate_off
			after 4 ns
-- pragma translate_on
			;
		end if;
	end process rst_macclk_block;

rx_event:  process(mac_clk)
  variable rxram_busy_int, last_rxram_active: std_logic;
  variable rxram_end_addr_int: std_logic_vector(12 downto 0);
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
        rxram_busy_int := '0';
	rxram_end_addr_int := (Others => '0');
      elsif rxram_send = '1' then 
        rxram_busy_int := '1';
	rxram_end_addr_int := rxram_end_addr;
      elsif last_rxram_active = '1' and rxram_active = '0' then 
        rxram_busy_int := '0';
	rxram_end_addr_int := (Others => '0');
      end if;
      last_rxram_active := rxram_active;
      rxram_busy_sig <= rxram_busy_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      rxram_end_addr_sig <= rxram_end_addr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process rx_event;

next_addr:  process(mac_clk)
  variable addr_int, next_addr: unsigned(12 downto 0);
  variable low_addr_int, byteswapping_int: std_logic;
  begin
    if rising_edge(mac_clk) then
      if set_addr = '1' then
        addr_int := unsigned(addr_to_set);
	byteswapping_int := '0';
      elsif mac_tx_ready_sig = '1' or counting = '1' then 
        addr_int := next_addr;
      end if;
      addr_sig <= std_logic_vector(addr_int)
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      if addr_int(12 downto 6) = "0000000" then
        low_addr_int := '1';
	if addr_int(5 downto 0) = to_unsigned(52, 6) then
	  byteswapping_int := byteswap_sig;
	end if;
      else
	low_addr_int := '0';
      end if;
      low_addr <= low_addr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      byteswapping <= byteswapping_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      next_addr := addr_int + 1;
    end if;
  end process next_addr;

send_data:  process(mac_clk)
  variable mac_tx_data_int, next_mac_tx_data, next_mac_tx_buf: std_logic_vector(7 downto 0);
  variable ready_buf: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
	mac_tx_data_int := (Others => '0');
	next_mac_tx_data := (Others => '0');
	ready_buf := '0';
      end if;
      if send_special = '1' then
        next_mac_tx_buf := special;
      elsif rxram_active = '1' then
        next_mac_tx_buf := dob;
      elsif udpram_active = '1' then
        next_mac_tx_buf := udpdob;
      else
        next_mac_tx_buf := (Others => '0');
      end if;
      if ready_buf = '1' then
        next_mac_tx_data := next_mac_tx_buf;
      end if;
      if mac_tx_ready_sig = '1' and mac_tx_last_sig = '1' then
	mac_tx_data_int := (Others => '0');
      elsif mac_tx_ready_sig = '1' or prefetch = '1' then
        ready_buf := '1';
        mac_tx_data_int := next_mac_tx_data;
      else
        ready_buf := '0';
      end if;
      mac_tx_data_sig <= mac_tx_data_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process send_data;

state_machine:  process(mac_clk)
  variable rxram_active_int, udpram_active_int: std_logic;
  variable counting_int, set_addr_int, prefetch_int: std_logic;
  variable mac_tx_valid_int, mac_tx_last_int: std_logic;
  variable state, next_state: integer range 0 to 7;
  variable addr_to_set_int, end_addr_int: unsigned(12 downto 0);
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
	state := 0;
      end if;
      case state is
        when 0 =>
          rxram_active_int := '0';
	  udpram_active_int := '0';
	  counting_int := '0';
	  prefetch_int := '0';
	  mac_tx_valid_int := '0';
	  mac_tx_last_int := '0';
	  set_addr_int := '1';
	  addr_to_set_int := (Others => '0');
	  next_state := 1;
        when 1 =>
	  if rxram_busy_sig = '1' then
	    set_addr_int := '0';
	    rxram_active_int := '1';
	    end_addr_int := unsigned(rxram_end_addr_sig);
	    next_state := 3;
	  elsif udpram_busy_sig = '1' then
	    udpram_active_int := '1';
	    set_addr_int := '1';
	    counting_int := '1';
	    addr_to_set_int := to_unsigned(2, 13);
	    next_state := 2;
	  else
	    set_addr_int := '0';
	  end if;
        when 2 =>
	  set_addr_int := '0';
	  if unsigned(addr_sig) = to_unsigned(4, 13) then
	    next_state := 3;
	  end if;
        when 3 =>
	  counting_int := '1';
	  prefetch_int := '1';
	  next_state := 4;
        when 4 =>
	  next_state := 5;
        when 5 =>
	  if udpram_active_int = '1' then
	    end_addr_int := unsigned(udpram_end_addr_sig);
	  end if;
	  counting_int := '0';
	  prefetch_int := '0';
	  mac_tx_valid_int := '1';
	  if unsigned(addr_sig) = end_addr_int and mac_tx_ready_sig = '1' then
	    set_addr_int := '1';
	    addr_to_set_int := (Others => '0');
            next_state := 6;
	  end if;
        when 6 =>
	  set_addr_int := '0';
	  if mac_tx_ready_sig = '1' then
            mac_tx_last_int := '1';
            rxram_active_int := '0';
	    udpram_active_int := '0';
	    next_state := 7;
	  end if;
        when 7 =>
	  if mac_tx_ready_sig = '1' then
	    mac_tx_valid_int := '0';
	    mac_tx_last_int := '0';
	    next_state := 0;
	  end if;
      end case;
      state := next_state;
      rxram_active <= rxram_active_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      udpram_active <= udpram_active_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      counting <= counting_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      prefetch <= prefetch_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      mac_tx_last_sig <= mac_tx_last_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      mac_tx_valid_sig <= mac_tx_valid_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      set_addr <= set_addr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      addr_to_set <= std_logic_vector(addr_to_set_int)
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process state_machine;

no_udp_mode: if INTERNAL_ONLY = '1' generate

-- Default values when just reading from RXRAM...

  udpram_busy_sig <= '0';
  udp_short_sig <= '0';
  udpaddrb <= (Others => '0');
  send_special <= '0';
  special <= (Others => '0');
  do_sum <= '0';
  clr_sum <= '0';
  int_data <= (Others => '0');
  int_valid <= '0';
  cksum <= '0';
  ipbus_out_valid <= '0';
  ipbus_out_hdr <= (Others => '0');
  byteswap_sig <= '0';
  
end generate no_udp_mode;

default_mode: if INTERNAL_ONLY = '0' generate

  With byteswapping select udpaddrb <=
  addr_sig(12 downto 2) & not addr_sig(1 downto 0) when '1',
  addr_sig when Others;

udp_event:  process(mac_clk)
  variable udpram_busy_int, last_udpram_active: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
        udpram_busy_int := '0';
      elsif udpram_send = '1' then 
        udpram_busy_int := '1';
      elsif last_udpram_active = '1' and udpram_active = '0' then 
        udpram_busy_int := '0';
      end if;
      last_udpram_active := udpram_active;
      udpram_busy_sig <= udpram_busy_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process udp_event;

udp_short_block: process(mac_clk)
-- catch packet length too short...
  variable short_int: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
	short_int := '0';
      end if;
      if udpram_active = '1' and low_addr = '1' then
        case to_integer(unsigned(addr_sig(5 downto 0))) is
	  when 2 =>
	    short_int := '1';
	  when 52 =>
	    short_int := '0';
	  when Others =>
	end case;
      else
        short_int := '0';
      end if;
      udp_short_sig <= short_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process udp_short_block;

udp_send_data:  process(mac_clk)
  variable send_special_int: std_logic;
  variable special_int: std_logic_vector(7 downto 0);
  variable flip_cksum: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
	send_special_int := '0';
	special_int := (Others => '0');
      end if;
      if udpram_active = '1' and low_addr = '1' then
        case to_integer(unsigned(addr_sig(5 downto 0))) is
	  when 22 =>
	    send_special_int := '1';
	    special_int := ip_len(15 downto 8);
	  when 23 =>
	    send_special_int := '1';
	    special_int := ip_len(7 downto 0);
	  when 28 =>
	    if ip_cksum(15 downto 8) = x"FF" then
	      flip_cksum := '1';
	    else
	      flip_cksum := '0';
	    end if;
	  when 29 =>
	    if ip_cksum(7 downto 0) /= x"FF" then
	      flip_cksum := '0';
	    end if;
	  when 30 =>
	    send_special_int := '1';
	    if flip_cksum = '1' then
	      special_int := (Others => '0');
	    else
	      special_int := ip_cksum(15 downto 8);
	    end if;
	  when 31 =>
	    send_special_int := '1';
	    if flip_cksum = '1' then
	      special_int := (Others => '0');
	    else
	      special_int := ip_cksum(7 downto 0);
	    end if;
	  when 44 =>
	    send_special_int := '1';
	    special_int := udp_len(15 downto 8);
	  when 45 =>
	    send_special_int := '1';
	    special_int := udp_len(7 downto 0);
	  when Others =>
	    send_special_int := '0';
	end case;
      else
        send_special_int := '0';
      end if;
      send_special <= send_special_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      special <= special_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process udp_send_data;

do_udp_counter: process(mac_clk)
  variable counting, last_udpram_active: std_logic;
  variable counter: unsigned(4 downto 0);
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
        counting := '0';
	counter := (Others => '0');
      elsif counting = '1' then
        if counter = to_unsigned(27, 5) then
          counting := '0';
	  counter := (Others => '0');
        else
	  counter := counter + 1;
	end if;
      elsif udpram_active = '1' and last_udpram_active = '0' then
        counting := '1';
	counter := (Others => '0');
      end if;
      last_udpram_active := udpram_active;
      udp_counting <= counting
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      udp_counter <= counter
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process do_udp_counter;

udp_control_build:  process(mac_clk)
  variable do_sum_int, clr_sum_int: std_logic;
  variable int_valid_int, cksum_int: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
	cksum_int := '0';
	clr_sum_int := '0';
	do_sum_int := '0';
	int_valid_int := '0';
      end if;
      if udp_counting = '1' then
	case to_integer(udp_counter) is
	  when 0 =>
-- Finish IP cksum calculation
	    cksum_int := '1';
	    clr_sum_int := '1';
	    do_sum_int := '1';
	    int_valid_int := '1';
	  when 1 =>
	    clr_sum_int := '0';
	    do_sum_int := '1';
	  when 2 =>
	    do_sum_int := '1';
	    int_valid_int := '0';
	  when 3 =>
	    do_sum_int := '1';
	  when 4 =>
	    do_sum_int := '1';
	    int_valid_int := '1';
	  when 5 =>
	    do_sum_int := '1';
	  when 12 =>
-- now start on IP length, 20 + 8...
	    cksum_int := '0';
	    clr_sum_int := '1';
	    do_sum_int := '1';
	  when 13 =>
	    clr_sum_int := '0';
	    do_sum_int := '1';
	  when 14 =>
	    do_sum_int := '1';
	  when 15 =>
	    do_sum_int := '1';
	  when 18 =>
-- then end address 14 + 5...
	    do_sum_int := '1';
	  when 19 =>
	    do_sum_int := '1';
	  when 22 =>
-- finally UDP length when bytes are reversed -39...
	    do_sum_int := '1';
	  when 23 =>
	    do_sum_int := '1';
	  when 27 =>
	    int_valid_int := '0';
	  when Others =>
	    clr_sum_int := '0';
	    do_sum_int := '0';
	end case;
      end if;
      cksum <= cksum_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      clr_sum <= clr_sum_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      do_sum <= do_sum_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      int_valid <= int_valid_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process udp_control_build;

udp_build_data:  process(mac_clk)
  variable udpram_end_addr_int: std_logic_vector(12 downto 0);
  variable int_data_int: std_logic_vector(7 downto 0);
  variable pay_len: std_logic_vector(15 downto 0);
  variable ip_len_int, ip_cksum_int, udp_len_int: std_logic_vector(15 downto 0);
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
	udpram_end_addr_int := (Others => '0');
	int_data_int := (Others => '0');
      end if;
      if udp_counting = '1' then
	case to_integer(udp_counter) is
	  when 0 =>
-- Finish IP cksum calculation, adding headers and ipbus payload length
	    udpram_end_addr_int := (Others => '0');
	    int_data_int := (Others => '0');
	  when 1 =>
-- IP, UDP, ipbus header length, 20 + 8 + 4 = 32
	    int_data_int := x"20";
-- convert payload word length to bytes
	    pay_len(15 downto 10) := "000" & udpdob(2 downto 0);
	  when 2 =>
	    pay_len(9 downto 0) := udpdob & "00";
	  when 4 =>
	    int_data_int := pay_len(15 downto 8);
	  when 5 =>
	    int_data_int := pay_len(7 downto 0);
	  when 12 =>
-- capture cksum...
	    ip_cksum_int(7 downto 0) := not outbyte;
-- now start on IP length, first headers 20 + 8 + 4...
	    int_data_int := (Others => '0');
	  when 13 =>
	    ip_cksum_int(15 downto 8) := not outbyte;
	    int_data_int := x"20";
	  when 14 =>
-- then payload length...
	    int_data_int := pay_len(15 downto 8);
	  when 15 =>
	    int_data_int := pay_len(7 downto 0);
	  when 18 =>
	    ip_len_int(7 downto 0) := outbyte;
-- then end address 14 (ethernet length) + 5 (mem offset)...
	    int_data_int := (Others => '0');
	  when 19 =>
	    ip_len_int(15 downto 8) := outbyte;
	    int_data_int := x"13";
	  when 22 =>
-- finally UDP length when bytes are reversed -39 (= 20 + 14 + 5)...
	    int_data_int := (Others => '1');
	  when 23 =>
-- capture high byte of end address first, to avoid glitch at length 15...
	    udpram_end_addr_int(12 downto 8) := outbyte(4 downto 0);
	    int_data_int := x"D9";
	  when 24 =>
-- then low byte of end address...
	    udpram_end_addr_int(7 downto 0) := outbyte;
	  when 26 =>
	    udp_len_int(7 downto 0) := outbyte;
	  when 27 =>
	    udp_len_int(15 downto 8) := outbyte;
	  when Others =>
	    int_data_int := (Others => '0');
	end case;
      end if;
      udpram_end_addr_sig <= udpram_end_addr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      int_data <= int_data_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      ip_len <= ip_len_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      ip_cksum <= ip_cksum_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      udp_len <= udp_len_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process udp_build_data;

do_ipbus_hdr: process(mac_clk)
  variable ipbus_hdr_int: std_logic_vector(31 downto 0);
  variable ipbus_out_valid_int, byteswap_int: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
	ipbus_hdr_int := (Others => '0');
	ipbus_out_valid_int := '0';
	byteswap_int := '0';
      elsif udpram_active = '1' and low_addr = '1' and mac_tx_ready_sig = '1' then
        case to_integer(unsigned(addr_sig(5 downto 0))) is
	  when 50 =>
	    ipbus_hdr_int(31 downto 24) := mac_tx_data_sig;
	    ipbus_out_valid_int := '0';
	    if mac_tx_data_sig = x"F0" then
	      byteswap_int := '1';
	    else
	      byteswap_int := '0';
	    end if;
	  when 51 =>
	    ipbus_hdr_int(23 downto 16) := mac_tx_data_sig;
	    ipbus_out_valid_int := '0';
	  when 52 =>
	    ipbus_hdr_int(15 downto 8) := mac_tx_data_sig;
	    ipbus_out_valid_int := '0';
	  when 53 =>
	    ipbus_hdr_int(7 downto 0) := mac_tx_data_sig;
	    ipbus_out_valid_int := '1';
	  when Others =>
	    ipbus_out_valid_int := '0';
	end case;
      else
	ipbus_out_valid_int := '0';
      end if;
      ipbus_out_valid <= ipbus_out_valid_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      ipbus_out_hdr <= ipbus_hdr_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      byteswap_sig <= byteswap_int
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process do_ipbus_hdr;

end generate default_mode;

end rtl;
