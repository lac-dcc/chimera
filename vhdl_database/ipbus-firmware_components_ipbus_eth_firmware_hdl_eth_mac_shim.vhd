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


-- eth_mac_shim
--
-- Converts a MAC core with old-style (virtex 5) interface to the
-- new-style (AXI4-stream) interface. Note that user error signals are
-- not converted.
--
-- Works for serdes physical layer, for which reclocking of received data
-- into tx clock domain is not required.
--
-- Dave Newbold, Feb 2013
--
-- $Id$

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.VComponents.all;
use work.emac_hostbus_decl.all;

entity eth_mac_shim is
	port(
		clk125: in std_logic;
		rst: in std_logic;
		axi_tx_data: in std_logic_vector(7 downto 0);
		axi_tx_valid: in std_logic;
		axi_tx_last: in std_logic;
		axi_tx_error: in std_logic;
		axi_tx_ready: out std_logic;
		axi_rx_data: out std_logic_vector(7 downto 0);
		axi_rx_valid: out std_logic;
		axi_rx_last: out std_logic;
		axi_rx_error: out std_logic;
		v5_txd: out std_logic_vector(7 downto 0);
		v5_txdvld: out std_logic;
		v5_txack: in std_logic;
		v5_rxd: in std_logic_vector(7 downto 0);
		v5_rxdvld: in std_logic;
		v5_rxgoodframe: in std_logic;
		v5_rxbadframe: in std_logic
	);

end eth_mac_shim;

architecture rtl of eth_mac_shim is

	signal tx_ready: std_logic;

begin

	axi_rx_data <= v5_rxd;
	axi_rx_valid <= v5_rxdvld;
	axi_rx_last <= v5_rxgoodframe or v5_rxbadframe;
	axi_rx_error <= v5_rxbadframe;
	
	v5_txd <= axi_tx_data;
	v5_txdvld <= axi_tx_valid;
	
	process(clk)
	begin
		if rising_edge(clk125) then
			tx_ready <= tx_ready or v5_txack and not (axi_tx_last or rst);
		end if;
	end process;

	axi_tx_ready <= tx_ready;

end rtl;

