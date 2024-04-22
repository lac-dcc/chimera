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


-- Contains the instantiation of the Xilinx MAC & 1000baseX pcs/pma & GTP transceiver cores
--
-- Do not change signal names in here without correspondig alteration to the timing contraints file
--
-- Dave Newbold, April 2011
--
-- $Id$

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.VComponents.all;
use work.emac_hostbus_decl.all;

entity eth_s6_1000basex is
	port(
		gtp_clkp, gtp_clkn: in std_logic;
		gtp_txp, gtp_txn: out std_logic;
		gtp_rxp, gtp_rxn: in std_logic;
		clk125_out: out std_logic;
		rst: in std_logic;
		locked: in std_logic;
		tx_data: in std_logic_vector(7 downto 0);
		tx_valid: in std_logic;
		tx_last: in std_logic;
		tx_error: in std_logic;
		tx_ready: out std_logic;
		rx_data: out std_logic_vector(7 downto 0);
		rx_valid: out std_logic;
		rx_last: out std_logic;
		rx_error: out std_logic;
		hostbus_in: in emac_hostbus_in := ('0', "00", "0000000000", X"00000000", '0', '0', '0');
		hostbus_out: out emac_hostbus_out
	);

end eth_s6_1000basex;

architecture rtl of eth_s6_1000basex is

	signal gmii_txd, gmii_rxd: std_logic_vector(7 downto 0);
	signal gmii_tx_en, gmii_tx_er, gmii_rx_dv, gmii_rx_er: std_logic;
	signal gmii_rx_clk: std_logic;
	signal clkin, clk125, gtpclkout, gtpclkout_buf, rstn: std_logic;
	signal status: std_logic_vector(15 downto 0);

	COMPONENT tri_mode_eth_mac_v5_4
	  PORT (
		 glbl_rstn : IN STD_LOGIC;
		 rx_axi_rstn : IN STD_LOGIC;
		 tx_axi_rstn : IN STD_LOGIC;
		 rx_axi_clk : IN STD_LOGIC;
		 rx_reset_out : OUT STD_LOGIC;
		 rx_axis_mac_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 rx_axis_mac_tvalid : OUT STD_LOGIC;
		 rx_axis_mac_tlast : OUT STD_LOGIC;
		 rx_axis_mac_tuser : OUT STD_LOGIC;
		 rx_statistics_vector : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
		 rx_statistics_valid : OUT STD_LOGIC;
		 tx_axi_clk : IN STD_LOGIC;
		 tx_reset_out : OUT STD_LOGIC;
		 tx_axis_mac_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 tx_axis_mac_tvalid : IN STD_LOGIC;
		 tx_axis_mac_tlast : IN STD_LOGIC;
		 tx_axis_mac_tuser : IN STD_LOGIC;
		 tx_axis_mac_tready : OUT STD_LOGIC;
		 tx_ifg_delay : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 tx_statistics_vector : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 tx_statistics_valid : OUT STD_LOGIC;
		 pause_req : IN STD_LOGIC;
		 pause_val : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 speed_is_100 : OUT STD_LOGIC;
		 speed_is_10_100 : OUT STD_LOGIC;
		 gmii_txd : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 gmii_tx_en : OUT STD_LOGIC;
		 gmii_tx_er : OUT STD_LOGIC;
		 gmii_rxd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 gmii_rx_dv : IN STD_LOGIC;
		 gmii_rx_er : IN STD_LOGIC;
		 rx_mac_config_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0);
		 tx_mac_config_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0)
	  );
	END COMPONENT;

begin
	
	ibuf0: IBUFDS port map(
		i => gtp_clkp,
		ib => gtp_clkn,
		o => clkin
	);
	
	bufio0: BUFIO2
		generic map(
			divide => 1,
			divide_bypass => true
		)
		port map(
			divclk => gtpclkout_buf,
			i => gtpclkout,
			ioclk => open,
			serdesstrobe => open
		);

   bufg0: BUFG port map(
      i => gtpclkout_buf,
      o => clk125
   );

	clk125_out <= clk125;

	rstn <= not rst;

	mac: tri_mode_eth_mac_v5_4 port map(
		glbl_rstn => rstn,
		rx_axi_rstn => '1',
		tx_axi_rstn => '1',
		rx_axi_clk => clk125,
		rx_reset_out => open,
		rx_axis_mac_tdata => rx_data,
		rx_axis_mac_tvalid => rx_valid,
		rx_axis_mac_tlast => rx_last,
		rx_axis_mac_tuser => rx_error,
		rx_statistics_vector => open,
		rx_statistics_valid => open,
		tx_axi_clk => clk125,
		tx_reset_out => open,
		tx_axis_mac_tdata => tx_data,
		tx_axis_mac_tvalid => tx_valid,
		tx_axis_mac_tlast => tx_last,
		tx_axis_mac_tuser => tx_error,
		tx_axis_mac_tready => tx_ready,
		tx_ifg_delay => X"00",
		tx_statistics_vector => open,
		tx_statistics_valid => open,
		pause_req => '0',
		pause_val => X"0000",
		speed_is_100 => open,
		speed_is_10_100 => open,
		gmii_txd => gmii_txd,
		gmii_tx_en => gmii_tx_en,
		gmii_tx_er => gmii_tx_er,
		gmii_rxd => gmii_rxd,
		gmii_rx_dv => gmii_rx_dv,
		gmii_rx_er => gmii_rx_er,
		rx_mac_config_vector => X"0000_0000_0000_0000_0812",
		tx_mac_config_vector => X"0000_0000_0000_0000_0012"
	);

	hostbus_out.hostrddata <= (others => '0');
	hostbus_out.hostmiimrdy <= '0';

	phy: entity work.gig_eth_pcs_pma_v11_4_block port map(
		gtpclkout => gtpclkout,
		gtpreset0 => '0',  -- rely upon powerup reset for now
		gmii_txd0 => gmii_txd,
		gmii_tx_en0 => gmii_tx_en,
		gmii_tx_er0 => gmii_tx_er,
		gmii_rxd0 => gmii_rxd,
		gmii_rx_dv0 => gmii_rx_dv,
		gmii_rx_er0 => gmii_rx_er,
		gmii_isolate0 => open,
		configuration_vector0 => "00000",
		status_vector0 => status,
		reset0 => rst,
		signal_detect0 => '1',
		clkin => clkin,
		userclk2 => clk125,
		txp0 => gtp_txp,
		txn0 => gtp_txn,
		rxp0 => gtp_rxp,
		rxn0 => gtp_rxn,
		txp1 => open,
		txn1 => open,
		rxp1 => '0',
		rxn1 => '0'
	);
	  
end rtl;
