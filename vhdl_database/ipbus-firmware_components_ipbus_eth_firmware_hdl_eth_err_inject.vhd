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


-- eth_err_inject
--
-- Ranomly drops ethernet packets at a configurable rate
-- Sits between the MAC and the ipbus control block, and can drop
-- incoming or outgoing packets, or both
-- 
-- Packets are dropped by forcing dest mac address to 02:00:00:00:00:00
--
-- rate_r: number of packets to drop per 64k received (0 turns off packet loss)
-- force_r: drop next received packet *only* as a one-off
-- reset_r: reset random generator and counter for received packets
-- rate_t: number of packets to drop per 64k sent (0 turns off packet loss)
-- force_t: drop next-but-one sent packet *only* as a one-off
-- reset_t: reset random generator and counter for sent packets
--
-- count_r: number of received packets dropped
-- count_t: number of sent packets dropped
--
-- Dave Newbold, March 2012
--
-- $Id: mac_arbiter.vhd 350 2011-04-28 17:52:45Z phdmn $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity eth_err_inject is
	port(
		clk: in std_logic;
		rst: in std_logic;
		rate_r: in std_logic_vector(15 downto 0);
		force_r: in std_logic;
		reset_r: in std_logic;
		count_r: out std_logic_vector(23 downto 0);
		rate_t: in std_logic_vector(15 downto 0);
		force_t: in std_logic;
		reset_t: in std_logic;
		count_t: out std_logic_vector(23 downto 0);
		mac_tx_data: out std_logic_vector(7 downto 0);
		mac_tx_valid: out std_logic;
		mac_tx_last: out std_logic;
		mac_tx_error: out std_logic;
		mac_tx_ready: in std_logic;
		mac_rx_data: in std_logic_vector(7 downto 0);
		mac_rx_valid: in std_logic;
		mac_rx_last: in std_logic;
		mac_rx_error: in std_logic;
		ipb_tx_data: in std_logic_vector(7 downto 0);
		ipb_tx_valid: in std_logic;
		ipb_tx_last: in std_logic;
		ipb_tx_error: in std_logic;
		ipb_tx_ready: out std_logic;
		ipb_rx_data: out std_logic_vector(7 downto 0);
		ipb_rx_valid: out std_logic;
		ipb_rx_last: out std_logic;
		ipb_rx_error: out std_logic
	);
	
end eth_err_inject;

architecture rtl of eth_err_inject is

begin

	mac_tx_data <= ipb_tx_data;
	mac_tx_valid <= ipb_tx_valid;
	mac_tx_last <= ipb_tx_last;
	mac_tx_error <= ipb_tx_error;
	ipb_tx_ready <= mac_tx_ready;
	ipb_rx_data <= mac_rx_data;
	ipb_rx_valid <= mac_rx_valid;
	ipb_rx_last <= mac_rx_last;
	ipb_rx_error <= mac_rx_error;

end rtl;

