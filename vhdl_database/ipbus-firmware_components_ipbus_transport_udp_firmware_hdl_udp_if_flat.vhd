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


-- UDP_if created from
-- VHDL Entity ipbus_v2_lib.UDP_if.symbol and
-- VHDL Entity ipbus_v2_lib.rxblock.symbol
--  Dave Sankey Sep 2012

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY UDP_if IS
	generic(
-- Number of address bits to select RX or TX buffer
-- Number of RX and TX buffers is 2**BUFWIDTH
	  BUFWIDTH: natural := 2;

-- Numer of address bits to select internal buffer
-- Number of internal buffers is 2**INTERNALWIDTH
	  INTERNALWIDTH: natural := 1;

-- Number of address bits within each buffer
-- Size of each buffer is 2**ADDRWIDTH
  	ADDRWIDTH: natural := 11;

-- Flag whether this instance ignores everything except IPBus traffic
  	SECONDARYPORT: std_logic := '0';

-- Switch between using DHCP or RARP as the protocol for external IP address management
-- '0' => RARP, '1' => DHCP
  	DHCP_RARP: std_logic := '0'
  );
  PORT( 
		mac_clk: IN std_logic;
		rst_macclk: IN std_logic;
		ipb_clk: IN std_logic;
		rst_ipb: IN std_logic;
		IP_addr: IN std_logic_vector(31 DOWNTO 0);
		MAC_addr: IN std_logic_vector(47 DOWNTO 0);
		ipbus_port: IN std_logic_vector(15 DOWNTO 0) := x"C351";
		enable: IN std_logic;
		ipam: IN std_logic;
		mac_rx_data: IN std_logic_vector(7 DOWNTO 0);
		mac_rx_error: IN std_logic;
		mac_rx_last: IN std_logic;
		mac_rx_valid: IN std_logic;
		mac_tx_ready: IN std_logic;
		pkt_done_read: IN std_logic;
		pkt_done_write: IN std_logic;
		raddr: IN std_logic_vector(15 DOWNTO 0);
		waddr: IN std_logic_vector(15 DOWNTO 0);
		wdata: IN std_logic_vector(31 DOWNTO 0);
		we: IN std_logic;
		busy: OUT std_logic;
		mac_tx_data: OUT std_logic_vector(7 DOWNTO 0);
		mac_tx_error: OUT std_logic;
		mac_tx_last: OUT std_logic;
		mac_tx_valid: OUT std_logic;
		My_IP_addr: OUT std_logic_vector(31 DOWNTO 0);
		Got_IP_addr: OUT std_logic;
		pkt_rdy: OUT std_logic;
		rdata: OUT std_logic_vector(31 DOWNTO 0);
		rxpacket_ignored: OUT std_logic;
		rxpacket_dropped: OUT std_logic
   );

END UDP_if;

ARCHITECTURE flat OF UDP_if IS

   SIGNAL addra: std_logic_vector(12 DOWNTO 0);
   SIGNAL addrb: std_logic_vector(12 DOWNTO 0);
   SIGNAL cksum: std_logic;
   SIGNAL clr_sum: std_logic;
   SIGNAL dia: std_logic_vector(7 DOWNTO 0);
   SIGNAL do_sum: std_logic;
   SIGNAL dob: std_logic_vector(7 DOWNTO 0);
   SIGNAL int_data: std_logic_vector(7 DOWNTO 0);
   SIGNAL int_valid: std_logic;
   SIGNAL outbyte: std_logic_vector(7 DOWNTO 0);
   SIGNAL payload_addr: std_logic_vector(12 DOWNTO 0);
   SIGNAL payload_data: std_logic_vector(7 DOWNTO 0);
   SIGNAL payload_send: std_logic;
   SIGNAL payload_we: std_logic;
   SIGNAL req_resend: std_logic;
   SIGNAL rx_reset: std_logic;
   SIGNAL rx_wea: std_logic;
   SIGNAL rxram_busy: std_logic;
   SIGNAL rxram_end_addr: std_logic_vector(12 DOWNTO 0);
   SIGNAL rxram_send: std_logic;
   SIGNAL udpaddrb: std_logic_vector(12 DOWNTO 0);
   SIGNAL udpdob: std_logic_vector(7 DOWNTO 0);
   SIGNAL udpram_busy: std_logic;
   SIGNAL udpram_send: std_logic;
   SIGNAL wea: std_logic;
--
   SIGNAL My_IP_addr_sig: std_logic_vector(31 DOWNTO 0);
   SIGNAL My_MAC_addr: std_logic_vector(47 DOWNTO 0);
   SIGNAL Server_IP_addr: std_logic_vector(31 DOWNTO 0);
   SIGNAL pkt_drop_ipam: std_logic;
   SIGNAL ipam_addr: std_logic_vector(12 DOWNTO 0);
   SIGNAL ipam_data: std_logic_vector(7 DOWNTO 0);
   SIGNAL ipam_end_addr: std_logic_vector(12 DOWNTO 0);
   SIGNAL ipam_mode, ipam_running: std_logic;
   SIGNAL ipam_send: std_logic;
   SIGNAL ipam_we: std_logic;
--
   SIGNAL arp_addr: std_logic_vector(12 DOWNTO 0);
   SIGNAL arp_data: std_logic_vector(7 DOWNTO 0);
   SIGNAL arp_end_addr: std_logic_vector(12 DOWNTO 0);
   SIGNAL arp_send: std_logic;
   SIGNAL arp_we: std_logic;
   SIGNAL rx_cksum: std_logic;
   SIGNAL rx_clr_sum: std_logic;
   SIGNAL clr_sum_payload: std_logic;
   SIGNAL clr_sum_ping: std_logic;
   SIGNAL rx_do_sum: std_logic;
   SIGNAL do_sum_payload: std_logic;
   SIGNAL do_sum_ping: std_logic;
   SIGNAL rx_int_data: std_logic_vector(7 DOWNTO 0);
   SIGNAL int_data_payload: std_logic_vector(7 DOWNTO 0);
   SIGNAL int_data_ping: std_logic_vector(7 DOWNTO 0);
   SIGNAL rx_int_valid: std_logic;
   SIGNAL int_valid_payload: std_logic;
   SIGNAL int_valid_ping: std_logic;
   SIGNAL rx_outbyte: std_logic_vector(7 DOWNTO 0);
   SIGNAL ping_addr: std_logic_vector(12 DOWNTO 0);
   SIGNAL ping_data: std_logic_vector(7 DOWNTO 0);
   SIGNAL ping_end_addr: std_logic_vector(12 DOWNTO 0);
   SIGNAL ping_send: std_logic;
   SIGNAL ping_we: std_logic;
   SIGNAL status_block: std_logic_vector(127 downto 0);
   SIGNAL status_request: std_logic;
   SIGNAL status_data: std_logic_vector(7 downto 0);
   SIGNAL status_addr: std_logic_vector(12 downto 0);
   SIGNAL status_we: std_logic;
   SIGNAL status_end_addr: std_logic_vector(12 downto 0);
   SIGNAL status_send: std_logic;
   SIGNAL pkt_drop_arp: std_logic;
   SIGNAL pkt_drop_payload: std_logic;
   SIGNAL pkt_drop_ping: std_logic;
   SIGNAL pkt_drop_resend: std_logic;
   SIGNAL pkt_drop_status: std_logic;
   signal pkt_runt: std_logic;
   signal rxpacket_ignored_sig: std_logic;
--
   signal my_rx_data: std_logic_vector(7 DOWNTO 0);
   signal my_rx_error: std_logic;
   signal my_rx_valid: std_logic;
   signal last_rx_last: std_logic;
   signal my_rx_last: std_logic;
--
   signal mac_tx_last_sig, mac_tx_error_sig, rst_macclk_reg : std_logic;
--
   signal ipbus_in_hdr, ipbus_out_hdr: std_logic_vector(31 downto 0);
   signal pkt_broadcast, ipbus_out_valid: std_logic;
   signal rxram_dropped_sig, rxpayload_dropped_sig: std_logic;
   signal pkt_drop_ipbus, reliable_packet, pkt_byteswap: std_logic;
   signal next_pkt_id: std_logic_vector(15 downto 0); -- Next expected packet ID
--
   signal we_125: std_logic;
   signal rst_ipb_125: std_logic;
--
   SIGNAL rxram_write_buf, rxram_send_buf: std_logic_vector(INTERNALWIDTH - 1 downto 0);
   SIGNAL rxram_sent, internal_busy, rxram_req_send, rxram_send_x: std_logic;
   SIGNAL rxram_end_addr_x: std_logic_vector(12 downto 0);
   SIGNAL rxram_addra, rxram_addrb: std_logic_vector(INTERNALWIDTH + ADDRWIDTH - 1 downto 0);
--
   SIGNAL rx_read_buffer, rx_read_buffer_125: std_logic_vector(BUFWIDTH - 1 downto 0);
   SIGNAL rx_write_buffer, tx_read_buffer: std_logic_vector(BUFWIDTH - 1 downto 0);
   SIGNAL tx_write_buffer, tx_write_buffer_125, resend_buf: std_logic_vector(BUFWIDTH - 1 downto 0);
   SIGNAL rx_full_addra, tx_full_addrb: std_logic_vector(BUFWIDTH + ADDRWIDTH - 1 downto 0);
   SIGNAL rx_full_addrb, tx_full_addra: std_logic_vector(BUFWIDTH + ADDRWIDTH - 3 downto 0);
   signal pkt_resend, pkt_rcvd, rx_ram_busy, rx_req_send_125, udpram_sent: std_logic;
   signal busy_125, enable_125, ipam_125, rx_ram_sent, tx_ram_written: std_logic;
   signal rxreq_not_found: std_logic;
   signal resend_pkt_id: std_logic_vector(15 downto 0);
   signal clean_buf: std_logic_vector(2**BUFWIDTH - 1 downto 0);
   
BEGIN

	rxpacket_dropped <= rxram_dropped_sig or rxpayload_dropped_sig or rxreq_not_found;
	rxpacket_ignored_sig <= my_rx_last and pkt_drop_arp and pkt_drop_ping and
	pkt_drop_payload and pkt_drop_ipam and pkt_drop_resend and pkt_drop_status;
	rxpacket_ignored <= rxpacket_ignored_sig;
	
	mac_tx_last <= mac_tx_last_sig;
	mac_tx_error <= '0';
	
	rxram_addra <= rxram_write_buf & addra(ADDRWIDTH - 1 downto 0);
	rxram_addrb <= rxram_send_buf & addrb(ADDRWIDTH - 1 downto 0);
	
	rx_full_addra <= rx_write_buffer & payload_addr(ADDRWIDTH - 1 downto 0);
	rx_full_addrb <= rx_read_buffer & raddr(ADDRWIDTH - 3 downto 0);
	
	tx_full_addra <= tx_write_buffer & waddr(ADDRWIDTH - 3 downto 0);
	tx_full_addrb <= tx_read_buffer & udpaddrb(ADDRWIDTH - 1 downto 0);

-- Register rx signals and force rx_last to match documentation...
	rx_reg_block: process(mac_clk)
	begin
	  if rising_edge(mac_clk) then
	    my_rx_last <= mac_rx_last and not last_rx_last
-- pragma translate_off
after 4 ns
-- pragma translate_on
;
	    last_rx_last <= mac_rx_last
-- pragma translate_off
after 4 ns
-- pragma translate_on
;
	    my_rx_data <= mac_rx_data
-- pragma translate_off
after 4 ns
-- pragma translate_on
;
	    my_rx_error <= mac_rx_error
-- pragma translate_off
after 4 ns
-- pragma translate_on
;
	    my_rx_valid <= mac_rx_valid
-- pragma translate_off
after 4 ns
-- pragma translate_on
;
	  end if;
	end process rx_reg_block;

-- register reset...
	rst_macclk_block: process(mac_clk)
	begin
		if rising_edge(mac_clk) then
			rst_macclk_reg <= rst_macclk
-- pragma translate_off
			after 4 ns
-- pragma translate_on
			;
		end if;
	end process rst_macclk_block;

	My_IP_addr <= My_IP_addr_sig;
	Got_IP_addr <= not ipam_mode;

-- Instance port mappings.

secondary_mode: if SECONDARYPORT = '1' generate
-- null signals for RARP, ARP and ping packets...
    arp_addr <= (Others => '0');
    arp_data <= (Others => '0');
    arp_end_addr <= (Others => '0');
    arp_send <= '0';
    arp_we <= '0';
    ping_addr <= (Others => '0');
    ping_data <= (Others => '0');
    ping_end_addr <= (Others => '0');
    ping_send <= '0';
    ping_we <= '0';
    ipam_addr <= (Others => '0');
    ipam_data <= (Others => '0');
    ipam_end_addr <= (Others => '0');
    ipam_send <= '0';
    ipam_we <= '0';
    rx_do_sum <= do_sum_payload;
    rx_clr_sum <= clr_sum_payload;
    rx_int_valid <= int_valid_payload;
    rx_int_data <= int_data_payload;
-- end IPAM mode as soon as we've got IP address!
    ipam_mode <= ipam_running;

end generate secondary_mode;

primary_mode: if SECONDARYPORT = '0' generate

	rx_do_sum <= do_sum_ping or do_sum_payload;
	rx_clr_sum <= clr_sum_ping or clr_sum_payload;
	rx_int_valid <= int_valid_ping or int_valid_payload;
	rx_int_data <= int_data_payload when int_valid_payload = '1' else int_data_ping;
	
	IPAM_block: entity work.udp_ipam_block
		GENERIC MAP (
			DHCP_RARP => DHCP_RARP
		)
		PORT MAP (
			mac_clk => mac_clk,
			rst_macclk => rst_macclk_reg,
			enable_125 => enable_125,
			MAC_addr => MAC_addr,
			My_IP_addr => My_IP_addr_sig,
			Server_IP_addr => Server_IP_addr,
			ipam_running => ipam_running,
			ipam_mode => ipam_mode,
			ipam_addr => ipam_addr,
			ipam_data => ipam_data,
			ipam_end_addr => ipam_end_addr,
			ipam_send => ipam_send,
			ipam_we => ipam_we
		);

	ARP: entity work.udp_build_arp
		PORT MAP (
			mac_clk => mac_clk,
			rx_reset => rx_reset,
			my_rx_data => my_rx_data,
			my_rx_valid => my_rx_valid,
			my_rx_last => my_rx_last,
			my_rx_error => my_rx_error,
			pkt_drop_arp => pkt_drop_arp,
			My_MAC_addr => My_MAC_addr,
			My_IP_addr => My_IP_addr_sig,
			arp_data => arp_data,
			arp_addr => arp_addr,
			arp_we => arp_we,
			arp_end_addr => arp_end_addr,
			arp_send => arp_send
		);

	ping: entity work.udp_build_ping
		PORT MAP (
			mac_clk => mac_clk,
			rx_reset => rx_reset,
			my_rx_data => my_rx_data,
			my_rx_valid => my_rx_valid,
			my_rx_last => my_rx_last,
			my_rx_error => my_rx_error,
			pkt_drop_ping => pkt_drop_ping,
			outbyte => rx_outbyte,
			ping_data => ping_data,
			ping_addr => ping_addr,
			ping_we => ping_we,
			ping_end_addr => ping_end_addr,
			ping_send => ping_send,
			do_sum_ping => do_sum_ping,
			clr_sum_ping => clr_sum_ping,
			int_data_ping => int_data_ping,
			int_valid_ping => int_valid_ping
		);

end generate primary_mode;

	IPADDR: entity work.udp_ipaddr_ipam
		GENERIC MAP (
			DHCP_RARP => DHCP_RARP
		)
		PORT MAP (
			mac_clk => mac_clk,
			rst_macclk => rst_macclk_reg,
			rx_reset => rx_reset,
			enable_125 => enable_125,
			ipam_125 => ipam_125,
			MAC_addr => MAC_addr,
			IP_addr => IP_addr,
			my_rx_data => my_rx_data,
			my_rx_error => my_rx_error,
			my_rx_last => my_rx_last,
			my_rx_valid => my_rx_valid,
			pkt_drop_ipam => pkt_drop_ipam,
			My_MAC_addr => My_MAC_addr,
			My_IP_addr => My_IP_addr_sig,
			Server_IP_addr => Server_IP_addr,
			ipam_running => ipam_running
		);

	payload: entity work.udp_build_payload
		PORT MAP (
			mac_clk => mac_clk,
			rx_reset => rx_reset,
			my_rx_data => my_rx_data,
			my_rx_valid => my_rx_valid,
			my_rx_last => my_rx_last,
			my_rx_error => my_rx_error,
			pkt_drop_payload => pkt_drop_payload,
			pkt_byteswap => pkt_byteswap,
			outbyte => rx_outbyte,
			payload_data => payload_data,
			payload_addr => payload_addr,
			payload_we => payload_we,
			payload_send => payload_send,
			do_sum_payload => do_sum_payload,
			clr_sum_payload => clr_sum_payload,
			int_data_payload => int_data_payload,
			int_valid_payload => int_valid_payload,
			cksum => rx_cksum,
			ipbus_in_hdr => ipbus_in_hdr
		);

	resend: entity work.udp_build_resend
		PORT MAP (
			mac_clk => mac_clk,
			rx_reset => rx_reset,
			my_rx_data => my_rx_data,
			my_rx_error => my_rx_error,
			my_rx_last => my_rx_last,
			my_rx_valid => my_rx_valid,
			pkt_drop_resend => pkt_drop_resend,
			pkt_resend => pkt_resend,
			resend_pkt_id => resend_pkt_id
		);
      
	status: entity work.udp_build_status
		PORT MAP (
			mac_clk => mac_clk,
			rx_reset => rx_reset,
			my_rx_data => my_rx_data,
			my_rx_valid => my_rx_valid,
			my_rx_last => my_rx_last,
			my_rx_error => my_rx_error,
			pkt_drop_status => pkt_drop_status,
			status_block => status_block,
			status_request => status_request,
			status_data => status_data,
			status_addr => status_addr,
			status_we => status_we,
			status_end_addr => status_end_addr,
			status_send => status_send
		);
      
	status_buffer: entity work.udp_status_buffer
		GENERIC MAP (
			BUFWIDTH => BUFWIDTH,
			ADDRWIDTH => ADDRWIDTH
		)
		PORT MAP (
			mac_clk => mac_clk,
			rst_macclk => rst_macclk_reg,
			rst_ipb_125 => rst_ipb_125,
			rx_reset => rx_reset,
			ipbus_in_hdr => ipbus_in_hdr,
			ipbus_out_hdr => ipbus_out_hdr,
			ipbus_out_valid => ipbus_out_valid,
			my_rx_error => my_rx_error,
			my_rx_last => my_rx_last,
			mac_tx_error => mac_tx_error_sig,
			mac_tx_last => mac_tx_last_sig,
			pkt_broadcast => pkt_broadcast,
			pkt_drop_arp => pkt_drop_arp,
			pkt_drop_ipbus => pkt_drop_ipbus,
			pkt_drop_payload => pkt_drop_payload,
			pkt_drop_ping => pkt_drop_ping,
			pkt_drop_ipam => pkt_drop_ipam,
			pkt_drop_resend => pkt_drop_resend,
			pkt_drop_status => pkt_drop_status,
			pkt_rcvd => pkt_rcvd,
			reliable_packet => reliable_packet,
			req_not_found => rxreq_not_found,
			rx_ram_sent => rx_ram_sent,
			rx_req_send_125 => rx_req_send_125,
			rxpayload_dropped => rxpayload_dropped_sig,
			rxram_dropped => rxram_dropped_sig,
			status_request => status_request,
			tx_ram_written => tx_ram_written,
			udpram_send => udpram_send,
			next_pkt_id => next_pkt_id,
			status_block => status_block
		);
      
	rx_byte_sum: entity work.udp_byte_sum
		PORT MAP (
			mac_clk => mac_clk,
			do_sum => rx_do_sum,
			clr_sum => rx_clr_sum,
			my_rx_data => my_rx_data,
			my_rx_valid => my_rx_valid,
			int_data => rx_int_data,
			int_valid => rx_int_valid,
			run_byte_sum => '0',
			cksum => rx_cksum,
			outbyte => rx_outbyte
		);
      
	rx_reset_block: entity work.udp_do_rx_reset
		PORT MAP (
			mac_clk => mac_clk,
			rst_macclk => rst_macclk_reg,
			my_rx_last => my_rx_last,
			my_rx_valid => my_rx_valid,
			rxpacket_ignored_sig => rxpacket_ignored_sig,
			rx_reset => rx_reset
		);

	rx_packet_parser: entity work.udp_packet_parser
		GENERIC MAP (
			SECONDARYPORT => SECONDARYPORT,
			DHCP_RARP => DHCP_RARP
		)
		PORT MAP (
			mac_clk => mac_clk,
			rx_reset => rx_reset,
			enable_125 => enable_125,
			my_rx_data => my_rx_data,
			my_rx_last => my_rx_last,
			my_rx_valid => my_rx_valid,
			My_MAC_addr => My_MAC_addr,
			My_IP_addr => My_IP_addr_sig,
			ipbus_port => ipbus_port,
			next_pkt_id => next_pkt_id,
			pkt_broadcast => pkt_broadcast,
			pkt_byteswap => pkt_byteswap,
			pkt_drop_arp => pkt_drop_arp,
			pkt_drop_ipbus => pkt_drop_ipbus,
			pkt_drop_payload => pkt_drop_payload,
			pkt_drop_ping => pkt_drop_ping,
			pkt_drop_ipam => pkt_drop_ipam,
			pkt_drop_resend => pkt_drop_resend,
			pkt_drop_status => pkt_drop_status,
			pkt_runt => pkt_runt,
			reliable_packet => reliable_packet
		);

	rx_ram_mux: entity work.udp_rxram_mux
		PORT MAP (
			mac_clk => mac_clk,
			rx_reset => rx_reset,
			ipam_mode => ipam_mode,
			ipam_addr => ipam_addr,
			ipam_data => ipam_data,
			ipam_end_addr => ipam_end_addr,
			ipam_send => ipam_send,
			ipam_we => ipam_we,
			pkt_drop_arp => pkt_drop_arp,
			arp_data => arp_data,
			arp_addr => arp_addr,
			arp_we => arp_we,
			arp_end_addr => arp_end_addr,
			arp_send => arp_send,
			pkt_drop_ping => pkt_drop_ping,
			ping_data => ping_data,
			ping_addr => ping_addr,
			ping_we => ping_we,
			ping_end_addr => ping_end_addr,
			ping_send => ping_send,
			pkt_drop_status => pkt_drop_status,
			status_data => status_data,
			status_addr => status_addr,
			status_we => status_we,
			status_end_addr => status_end_addr,
			status_send => status_send,
			my_rx_valid => my_rx_valid,
			my_rx_last => my_rx_last,
			rxram_busy => internal_busy,
			pkt_runt => pkt_runt,
			dia => dia,
			addra => addra,
			wea => wea,
			rxram_end_addr => rxram_end_addr,
			rxram_send => rxram_send,
			rxram_dropped => rxram_dropped_sig
		);

	internal_ram: entity work.udp_DualPortRAM
		GENERIC MAP (
			BUFWIDTH => INTERNALWIDTH,
			ADDRWIDTH => ADDRWIDTH
		)
		PORT MAP (
			ClkA => mac_clk,
			ClkB => mac_clk,
			wea => wea,
			addra => rxram_addra,
			addrb => rxram_addrb,
			dia => dia,
			dob => dob
		);

	internal_ram_selector: entity work.udp_buffer_selector
		GENERIC MAP (
			BUFWIDTH => INTERNALWIDTH
		)
		PORT MAP (
			mac_clk => mac_clk,
			rst_macclk => rst_macclk_reg,
			written => rxram_send,
			we => wea,
			sent => rxram_sent,
			req_resend => '0',
			resend_buf => (Others => '0'),
			busy => internal_busy,
			write_buf => rxram_write_buf,
			req_send => rxram_req_send,
			send_buf => rxram_send_buf,
			clean_buf => open
		);
      
	internal_ram_shim: entity work.udp_rxram_shim
		GENERIC MAP (
			BUFWIDTH => INTERNALWIDTH
		)
		PORT MAP (
			mac_clk => mac_clk,
			rst_macclk => rst_macclk_reg,
			rxram_end_addr => rxram_end_addr,
			rxram_send => rxram_send,
			rxram_write_buf => rxram_write_buf,
			rxram_req_send => rxram_req_send,
			rxram_send_buf => rxram_send_buf,
			rxram_busy => rxram_busy,
			rxram_end_addr_x => rxram_end_addr_x,
			rxram_send_x => rxram_send_x,
			rxram_sent => rxram_sent
		);

	ipbus_rx_ram: entity work.udp_DualPortRAM_rx
		GENERIC MAP (
			BUFWIDTH => BUFWIDTH,
			ADDRWIDTH => ADDRWIDTH
		)
		PORT MAP (
			clk125 => mac_clk,
			clk => ipb_clk,
			rx_wea => rx_wea,
			rx_addra => rx_full_addra,
			rx_addrb => rx_full_addrb,
			rx_dia => payload_data,
			rx_dob => rdata
		);

	rx_ram_selector: entity work.udp_buffer_selector
		GENERIC MAP (
			BUFWIDTH => BUFWIDTH
		)
		PORT MAP (
			mac_clk => mac_clk,
			rst_macclk => rst_macclk_reg,
			written => pkt_rcvd,
			we => rx_wea,
			sent => rx_ram_sent,
			req_resend => '0',
			resend_buf => (Others => '0'),
			busy => rx_ram_busy,
			write_buf => rx_write_buffer,
			req_send => rx_req_send_125,
			send_buf => rx_read_buffer_125,
			clean_buf => open
		);

	rx_transactor: entity work.udp_rxtransactor_if
		PORT MAP (
			mac_clk => mac_clk,
			rx_reset => rx_reset,
			payload_send => payload_send,
			payload_we => payload_we,
			rx_ram_busy => rx_ram_busy,
			pkt_rcvd => pkt_rcvd,
			rx_wea => rx_wea,
			rxpayload_dropped => rxpayload_dropped_sig
		);
      
	ipbus_tx_ram: entity work.udp_DualPortRAM_tx
		GENERIC MAP (
			BUFWIDTH => BUFWIDTH,
			ADDRWIDTH => ADDRWIDTH
		)
		PORT MAP (
			clk => ipb_clk,
			clk125 => mac_clk,
			tx_wea => we,
			tx_addra => tx_full_addra,
			tx_addrb => tx_full_addrb,
			tx_dia => wdata,
			tx_dob => udpdob
		);

	tx_ram_selector: entity work.udp_buffer_selector
		GENERIC MAP (
			BUFWIDTH => BUFWIDTH
		)
		PORT MAP (
			mac_clk => mac_clk,
			rst_macclk => rst_macclk_reg,
			written => tx_ram_written,
			we => we_125,
			sent => udpram_sent,
			req_resend => req_resend,
			resend_buf => resend_buf,
			busy => busy_125,
			write_buf => tx_write_buffer_125,
			req_send => udpram_send,
			send_buf => tx_read_buffer,
			clean_buf => clean_buf
		);

	tx_byte_sum: entity work.udp_byte_sum
		PORT MAP (
			mac_clk => mac_clk,
			do_sum => do_sum,
			clr_sum => clr_sum,
			my_rx_data => udpdob,
			my_rx_valid => udpram_busy,
			int_data => int_data,
			int_valid => int_valid,
			run_byte_sum => int_valid,
			cksum => cksum,
			outbyte => outbyte
		);

	tx_main: entity work.udp_tx_mux
		PORT MAP (
			mac_clk => mac_clk,
			rst_macclk => rst_macclk_reg,
			rxram_end_addr => rxram_end_addr_x,
			rxram_send => rxram_send_x,
			rxram_busy => rxram_busy,
			addrb => addrb,
			dob => dob,
			udpram_send => udpram_send,
			udpram_busy => udpram_busy,
			udpaddrb => udpaddrb,
			udpdob => udpdob,
			do_sum => do_sum,
			clr_sum => clr_sum,
			int_data => int_data,
			int_valid => int_valid,
			cksum => cksum,
			outbyte => outbyte,
			mac_tx_data => mac_tx_data,
			mac_tx_valid => mac_tx_valid,
			mac_tx_last => mac_tx_last_sig,
			mac_tx_error => mac_tx_error_sig,
			mac_tx_ready => mac_tx_ready,
			ipbus_out_hdr => ipbus_out_hdr,
			ipbus_out_valid => ipbus_out_valid
		);

	tx_transactor: entity work.udp_txtransactor_if
		GENERIC MAP (
			BUFWIDTH => BUFWIDTH
		)
		PORT MAP (
			mac_clk => mac_clk,
			rst_macclk => rst_macclk_reg,
			pkt_resend => pkt_resend,
			resend_pkt_id => resend_pkt_id,
			ipbus_out_hdr => ipbus_out_hdr,
			ipbus_out_valid => ipbus_out_valid,
			tx_read_buffer => tx_read_buffer,
			udpram_busy => udpram_busy,
			clean_buf => clean_buf,
			req_not_found => rxreq_not_found,
			req_resend => req_resend,
			resend_buf => resend_buf,
			udpram_sent => udpram_sent
		);

	clock_crossing_if: entity work.udp_clock_crossing_if
		GENERIC MAP (
			BUFWIDTH => BUFWIDTH
		)
		PORT MAP (
			mac_clk => mac_clk,
			rst_macclk => rst_macclk_reg,
			busy_125 => busy_125,
			rx_read_buffer_125 => rx_read_buffer_125,
			rx_req_send_125 => rx_req_send_125,
			tx_write_buffer_125 => tx_write_buffer_125,
			enable_125 => enable_125,
			ipam_125 => ipam_125,
			rst_ipb_125 => rst_ipb_125,
			rx_ram_sent => rx_ram_sent,
			tx_ram_written => tx_ram_written,
			we_125 => we_125,
			ipb_clk => ipb_clk,
			rst_ipb => rst_ipb,
			enable => enable,
			pkt_done_read => pkt_done_read,
			pkt_done_write => pkt_done_write,
			ipam => ipam,
			we => we,
			busy => busy,
			pkt_rdy => pkt_rdy,
			rx_read_buffer => rx_read_buffer,
			tx_write_buffer => tx_write_buffer
		);

END flat;
