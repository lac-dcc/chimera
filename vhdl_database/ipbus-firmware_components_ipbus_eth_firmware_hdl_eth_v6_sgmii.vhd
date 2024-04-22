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


-- Contains the instantiation of the Xilinx MAC IP plus the SGMII PHY interface
--
-- Do not change signal names in here without corresponding alteration to the timing contraints file
--
-- Dave Newbold, April 2011
--
-- $Id$

library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.VComponents.all;
use work.emac_hostbus_decl.all;

entity eth_v6_sgmii is
	port(
		sgmii_clkp, sgmii_clkn: in std_logic;
		sgmii_txp, sgmii_txn: out std_logic;
		sgmii_rxp, sgmii_rxn: in std_logic;
		sync_acq: out std_logic;
		clk125_o: out std_logic;
		clk125_fr: out std_logic;
		rst: in std_logic;
		locked: out std_logic;
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

end eth_v6_sgmii;

architecture rtl of eth_v6_sgmii is

	signal clkin, clk125, clk125_out: std_logic;
	signal clkp, clkn, rstn, resetdone, syncacqstatus: std_logic;

begin

   clkbuf: ibufds_gtxe1 port map(
      i => sgmii_clkp,
      ib => sgmii_clkn,
      ceb => '0',
      o => clkin,
      odiv2 => open
    );
	 
	bufg_d: bufg port map(
		i => clkin,
		o => clk125_fr
	);

	bufg0: bufg port map(
		i => clk125_out,
		o => clk125
	);

	clk125_o <= clk125;
	
	locked <= resetdone and syncacqstatus;
	
	rstn <= not rst;

	sgmii: entity work.v6_emac_v2_3_sgmii_block port map(
      clk125_out => clk125_out,
      gtx_clk => clk125,
      rx_statistics_vector => open,
      rx_statistics_valid => open,
      user_mac_aclk => open,
      rx_reset => open,
      rx_axis_mac_tdata => rx_data,
      rx_axis_mac_tvalid => rx_valid,
      rx_axis_mac_tlast => rx_last,
      rx_axis_mac_tuser => rx_error,
      tx_ifg_delay => (others => '0'),
      tx_statistics_vector => open,
      tx_statistics_valid => open,
      tx_reset => open,
      tx_axis_mac_tdata => tx_data,
      tx_axis_mac_tvalid => tx_valid,
      tx_axis_mac_tlast => tx_last,
      tx_axis_mac_tuser => tx_error,
      tx_axis_mac_tready => tx_ready,
      tx_collision => open,
      tx_retransmit => open,
      pause_req => '0',
      pause_val => (others => '0'),
      txp => sgmii_txp,
      txn => sgmii_txn,
      rxp => sgmii_rxp,
      rxn => sgmii_rxn,
      phyad => (others => '0'),
      resetdone => resetdone,
      syncacqstatus => syncacqstatus,
      clk_ds => clkin,
      mdio_i => '1',
      mdio_o => open,
      mdio_t => open,
      mdc_in => '0',
      glbl_rstn => rstn,
      rx_axi_rstn => '1',
      tx_axi_rstn => '1'
   );
   
  hostbus_out.hostrddata <= (others => '0');
	hostbus_out.hostmiimrdy <= '0';

end rtl;

