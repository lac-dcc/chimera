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


-- Uses the FLI mechanism to send / receive uHAL UDP packets.
--
-- There are two modes of operation:
--
-- If MULTI_PACKET = false, there is a 'one-in, one-out' assumption, i.e.
-- multiple packets cannot be processed simultaneously. This allows the
-- simulator to be paused while waiting for a new packet, reducing the
-- number of cycles to be simulated. A timeout applies in case the firmware
-- decides not to reply to a packet.
--
-- If MULTI_PACKET = true, the simulator runs continuously, can receive
-- and transmit simultaneously, and can queue multiple input packets. This
-- will cause a large number of cycles to be simulated.
--
-- Dave Newbold, April 2019
--
-- $Id$

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ipbus_trans_decl.all;

entity ipbus_sim_udp is
	generic(
		MULTI_PACKET: boolean := false
	);
	port(
		clk_ipb: in std_logic;
  		rst_ipb: in std_logic;
		trans_out: out ipbus_trans_in;
		trans_in: in ipbus_trans_out
	);  
  
end ipbus_sim_udp;

architecture behavioural of ipbus_sim_udp is

	attribute FOREIGN: string;
	
	procedure get_pkt_data(
		variable del_return: in integer;
		variable data, valid, last: out integer) is
	begin
		report "ERROR: get_pkt_data can't get here";
	end;
	
	attribute FOREIGN of get_pkt_data : procedure is "get_pkt_data sim_udp_fli.so";
	
	procedure store_pkt_data(
		variable mac_data_in: in integer) is
	begin
		report "ERROR: store_pkt_data can't get here";
	end;
	
	attribute FOREIGN of store_pkt_data : procedure is "store_pkt_data sim_udp_fli.so";
	
	procedure send_pkt is
	begin
		report "ERROR: send_pkt can't get here";
	end;
	
	attribute FOREIGN of send_pkt : procedure is "send_pkt sim_udp_fli.so";
	
	constant TIMEOUT_VAL: integer := 32768;
	
	signal rxbuf_addr, txbuf_addr, rx_addr, tx_addr: std_logic_vector(9 downto 0);
	signal tx_len: std_logic_vector(9 downto 0) := (others => '0');
	signal rxbuf_data, txbuf_data: std_logic_vector(31 downto 0);
	signal timer: integer;
	signal rx_valid, rx_last, tx_done, timeout: std_logic;
	
	type state_type is (ST_IDLE, ST_WAIT_PKT, ST_RXPKT, ST_RXDEL, ST_WAIT, ST_TXDEL, ST_TXPKT);
	signal state: state_type;

begin

-- Buffers

	rxbuf: entity work.ipbus_udp_ram_buf
		port map(
			clk => clk_ipb,
			addr => rxbuf_addr,
			rd => trans_out.rdata,
			wd => rxbuf_data,
			wen => rx_valid
		);
	
	txbuf: entity work.ipbus_udp_ram_buf
		port map(
			clk => clk_ipb,
			addr => txbuf_addr,
			rd => txbuf_data,
			wd => trans_in.wdata,
			wen => trans_in.we
		);
		
-- Address lines

	rxbuf_addr <= trans_in.raddr(9 downto 0) when state = ST_WAIT or state = ST_RXDEL else rx_addr;
	txbuf_addr <= trans_in.waddr(9 downto 0) when state = ST_WAIT else tx_addr;
	
	process(clk_ipb)
	begin
		if rising_edge(clk_ipb) then
			if state = ST_IDLE then
				rx_addr <= (others => '0');
				tx_addr <= (others => '0');
			else
				if rx_valid = '1' then
					rx_addr <= std_logic_vector(unsigned(rx_addr) + 1);
				end if;
				if state = ST_TXPKT or state = ST_TXDEL then
					tx_addr <= std_logic_vector(unsigned(tx_addr) + 1);
				end if;
			end if;
		end if;
	end process;
		
-- State machine

	process(clk_ipb)
	begin
		if rising_edge(clk_ipb) then
			if rst_ipb = '1' then
				state <= ST_IDLE;
			else		
				case state is
-- Starting state
				when ST_IDLE =>
					state <= ST_WAIT_PKT;
-- Waiting for packet
				when ST_WAIT_PKT =>
					if rx_valid = '1' then
						state <= ST_RXPKT;
					end if;
-- Receiving packet			
				when ST_RXPKT =>
					if rx_last = '1' then
						state <= ST_RXDEL;
					end if;
-- Wait for RAM
				when ST_RXDEL =>
					state <= ST_WAIT;
-- Waiting for transactor
				when ST_WAIT =>
					if timeout = '1' then
						state <= ST_IDLE;
					elsif trans_in.pkt_done = '1' then
						state <= ST_TXDEL;
					end if;
-- Wait for RAM
				when ST_TXDEL =>
					state <= ST_TXPKT;
-- Transmitting packet
				when ST_TXPKT =>
					if tx_done = '1' then
						state <= ST_IDLE;
					end if;
				end case;
			end if;
			
		end if;
	end process;
	
-- Handshaking
	
	trans_out.pkt_rdy <= '1' when state = ST_WAIT else '0';	
	trans_out.busy <= '0';

-- Packet rx	

	packet_rx: process(clk_ipb)
		variable del, data, valid, last: integer;
	begin
		if MULTI_PACKET then
			del := 0;
		else
			del := 1;
		end if;
		if rising_edge(clk_ipb) then
			if state = ST_WAIT_PKT or (state = ST_RXPKT and rx_last = '0') then
				get_pkt_data(del_return => del, data => data, valid => valid, last => last);
				rxbuf_data <= std_logic_vector(to_signed(data, 32));
				if valid = 1 then
					rx_valid <= '1';
				else
					rx_valid <= '0';
				end if;
				if last = 1 then
					rx_last <= '1';
				else
					rx_last <= '0';
				end if;
			else
				rx_valid <= '0';
				rx_last <= '0';
			end if;
		end if;
	end process;

-- Packet tx

	packet_tx: process(clk_ipb)
		variable data: integer;
	begin
		if rising_edge(clk_ipb) then
			if trans_in.waddr = (trans_in.waddr'range => '0') and trans_in.we = '1' then
				tx_len <= std_logic_vector(unsigned(trans_in.wdata(25 downto 16)) + unsigned(trans_in.wdata(9 downto 0)) + 1);
			end if;
			if state = ST_TXPKT then
				data := to_integer(signed(txbuf_data));
				store_pkt_data(mac_data_in => data);
				if tx_done = '1' then
					send_pkt;
				end if;
			end if;
		end if;
	end process;
	
	tx_done <= '1' when tx_addr = tx_len else '0';

-- Timeout

	process(clk_ipb)
	begin
		if rising_edge(clk_ipb) then
			if state /= ST_WAIT then
				timer <= 0;
				timeout <= '0';
			elsif timeout = '0' then
				timer <= timer + 1;
				if timer = TIMEOUT_VAL then
					timeout <= '1';
				end if;
			end if;
		end if;
	end process;	
	
end behavioural;
