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


-- Contains the instantiation of the Xilinx MAC & PHY interface for RGMII
--
-- Do not change signal names in here without corresponding alteration to the timing contraints file
--
-- Dave Newbold, October 2016

library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.VComponents.all;
use work.emac_hostbus_decl.all;

entity eth_7s_rgmii is
	port(
		clk125: in std_logic;
		clk125_90: in std_logic;
		clk200: in std_logic;
		rst: in std_logic;
		rgmii_txd: out std_logic_vector(3 downto 0);
		rgmii_tx_ctl: out std_logic;
		rgmii_txc: out std_logic;
		rgmii_rxd: in std_logic_vector(3 downto 0);
		rgmii_rx_ctl: in std_logic;
		rgmii_rxc: in std_logic;
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
		hostbus_out: out emac_hostbus_out;
		status: out std_logic_vector(3 downto 0)
	);

end eth_7s_rgmii;

architecture rtl of eth_7s_rgmii is

	COMPONENT temac_gbe_v9_0_rgmii
		PORT (
			gtx_clk : IN STD_LOGIC;
			gtx_clk90 : IN STD_LOGIC;
			glbl_rstn : IN STD_LOGIC;
			rx_axi_rstn : IN STD_LOGIC;
			tx_axi_rstn : IN STD_LOGIC;
			rx_statistics_vector : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
			rx_statistics_valid : OUT STD_LOGIC;
			rx_mac_aclk : OUT STD_LOGIC;
			rx_reset : OUT STD_LOGIC;
			rx_axis_mac_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			rx_axis_mac_tvalid : OUT STD_LOGIC;
			rx_axis_mac_tlast : OUT STD_LOGIC;
			rx_axis_mac_tuser : OUT STD_LOGIC;
			tx_ifg_delay : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			tx_statistics_vector : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			tx_statistics_valid : OUT STD_LOGIC;
			tx_mac_aclk : OUT STD_LOGIC;
			tx_reset : OUT STD_LOGIC;
			tx_axis_mac_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			tx_axis_mac_tvalid : IN STD_LOGIC;
			tx_axis_mac_tlast : IN STD_LOGIC;
			tx_axis_mac_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			tx_axis_mac_tready : OUT STD_LOGIC;
			pause_req : IN STD_LOGIC;
			pause_val : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			speedis100 : OUT STD_LOGIC;
			speedis10100 : OUT STD_LOGIC;
			rgmii_txd : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			rgmii_tx_ctl : OUT STD_LOGIC;
			rgmii_txc : OUT STD_LOGIC;
			rgmii_rxd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			rgmii_rx_ctl : IN STD_LOGIC;
			rgmii_rxc : IN STD_LOGIC;
			inband_link_status : OUT STD_LOGIC;
			inband_clock_speed : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			inband_duplex_status : OUT STD_LOGIC;
			rx_configuration_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0);
			tx_configuration_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mac_fifo_axi4
	  PORT (
		 m_aclk : IN STD_LOGIC;
		 s_aclk : IN STD_LOGIC;
		 s_aresetn : IN STD_LOGIC;
		 s_axis_tvalid : IN STD_LOGIC;
		 s_axis_tready : OUT STD_LOGIC;
		 s_axis_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 s_axis_tlast : IN STD_LOGIC;
		 s_axis_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		 m_axis_tvalid : OUT STD_LOGIC;
		 m_axis_tready : IN STD_LOGIC;
		 m_axis_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 m_axis_tlast : OUT STD_LOGIC;
		 m_axis_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
	  );
	END COMPONENT;
	
	signal rx_data_e: std_logic_vector(7 downto 0);
	signal rx_clk_e, rx_valid_e, rx_last_e, rx_user_e, rx_rst_e, rx_rst_en, rstn: std_logic;
	signal rx_user_f, rx_user_ef: std_logic_vector(0 downto 0);
	
begin

	idelayctrl0: idelayctrl port map(
		refclk => clk200,
		rst => rst
	);
	
	rstn <= not rst;

	emac0: temac_gbe_v9_0_rgmii
		port map(
			gtx_clk => clk125,
			gtx_clk90 => clk125_90,
			glbl_rstn => rstn,
			rx_axi_rstn => '1',
			tx_axi_rstn => '1',
			rx_statistics_vector => open,
			rx_statistics_valid => open,		
			rx_mac_aclk => rx_clk_e,
			rx_reset => rx_rst_e,
			rx_axis_mac_tdata => rx_data_e,
			rx_axis_mac_tvalid => rx_valid_e,
			rx_axis_mac_tlast => rx_last_e,
			rx_axis_mac_tuser => rx_user_e,
			tx_ifg_delay => X"00",
			tx_statistics_vector => open,
			tx_statistics_valid => open,	
			tx_mac_aclk => open, -- Internally connected to gtx_clk inside core
			tx_reset => open,
			tx_axis_mac_tdata => tx_data,
			tx_axis_mac_tvalid => tx_valid,
			tx_axis_mac_tlast => tx_last,
			tx_axis_mac_tuser(0) => tx_error,
			tx_axis_mac_tready => tx_ready,
			pause_req => '0',
			pause_val => X"0000",
			speedis100 => open,
			speedis10100 => open,
			rgmii_txd => rgmii_txd,
			rgmii_tx_ctl => rgmii_tx_ctl,
			rgmii_txc => rgmii_txc,
			rgmii_rxd => rgmii_rxd,
			rgmii_rx_ctl => rgmii_rx_ctl,
			rgmii_rxc => rgmii_rxc,
			inband_link_status => status(0),
			inband_clock_speed => status(3 downto 2),
			inband_duplex_status => status(1),
			rx_configuration_vector => X"0000_0000_0000_0000_0812",
			tx_configuration_vector => X"0000_0000_0000_0000_0012"
		);
	
	rx_user_ef(0) <= rx_user_e;
	rx_error <= rx_user_f(0);
	rx_rst_en <= not rx_rst_e;
	
	fifo: mac_fifo_axi4
		port map(
			m_aclk => clk125,
			s_aclk => rx_clk_e,
			s_aresetn => rx_rst_en,
			s_axis_tvalid => rx_valid_e,
			s_axis_tready => open,
			s_axis_tdata => rx_data_e,
			s_axis_tlast => rx_last_e,
			s_axis_tuser => rx_user_ef,
			m_axis_tvalid => rx_valid,
			m_axis_tready => '1',
			m_axis_tdata => rx_data,
			m_axis_tlast => rx_last,
			m_axis_tuser => rx_user_f
		); -- Clock domain crossing FIFO

	hostbus_out.hostrddata <= (others => '0');
	hostbus_out.hostmiimrdy <= '0';
	
end rtl;
