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


----------------------------------------------------------------------------------
-- University of Sussex, I. Xiotidis, A. Cerri
-- Email: I.Xiotidis@sussex.ac.uk
--
-- Create Date: 10/02/2020
-- Design Name: eth_vc707_sgmii
-- Module Name: 
-- Version: 1.0
-- Project Name: HTT (ATLAS)
-- Target Devices: VC707
-- Tool Versions: Vivado 2017.2
-- Description: This is the ethernet block that instantiates the 
-- gigabit ethernet and the tri-speed mac layer cores for the VC707
-- board. Modifications in the clock module are required in order to have
-- the proper clock frequencies for the two cores
--
-- Dependencies: emac_hostbus_decl.vhd obtained from the IPbus github repository
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- Credits:
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.VComponents.all;
use work.emac_hostbus_decl.all;

entity eth_7s_sgmii is
  port(
    gt_clkp, gt_clkn: in std_logic;
    gt_txp, gt_txn: out std_logic;
    gt_rxp, gt_rxn: in std_logic;
    sfp_los: in std_logic;
    clk125_out: out std_logic; -- 125MHz coming from ipbus clock module
    refclk_out: out std_logic; -- MGT refclk IO pin towards Marvel chip
    indep_clk_in: in std_logic; -- 50MHz(OLD) Changed by Ioannis to 100MHz for reasons according to documentation
    rsti: in std_logic;
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

end eth_7s_sgmii;

architecture rtl of eth_7s_sgmii is
    
  COMPONENT temac_gbe_v9_0
    PORT (
      gtx_clk : IN STD_LOGIC;
      glbl_rstn : IN STD_LOGIC;
      rx_axi_rstn : IN STD_LOGIC;
      tx_axi_rstn : IN STD_LOGIC;
      rx_statistics_vector : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
      rx_statistics_valid : OUT STD_LOGIC;
      rx_mac_aclk : OUT STD_LOGIC;
      rx_reset : OUT STD_LOGIC;
      --clk_enable: in std_logic;
      --rx_usr_clk2: in std_logic;
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
      gmii_txd : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      gmii_tx_en : OUT STD_LOGIC;
      gmii_tx_er : OUT STD_LOGIC;
      gmii_rxd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      gmii_rx_dv : IN STD_LOGIC;
      gmii_rx_er : IN STD_LOGIC;
      rx_configuration_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0);
      tx_configuration_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0)
      );
  END COMPONENT;
	
  component gig_ethernet_pcs_pma_basex_156_25
    port(
      gmii_rx_dv: out std_logic;
      gmii_rx_er: out std_logic;
      gmii_rxd: out std_logic_vector(7 downto 0);
      gmii_tx_en: in std_logic;
      gmii_tx_er: in std_logic;
      gmii_txd: in std_logic_vector(7 downto 0);
      gtrefclk_n: in std_logic;
      gtrefclk_p: in std_logic;
      independent_clock_bufg: in std_logic;
      configuration_vector: in std_logic_vector(4 downto 0);
      speed_is_10_100: in std_logic;
      speed_is_100: in std_logic;
      reset: in std_logic;
      signal_detect: in std_logic;
      rxn: in std_logic;
      rxp: in std_logic;
      txn: out std_logic;
      txp: out std_logic;
      gtrefclk_out: out std_logic;
      gtrefclk_bufg_out: out std_logic;
      userclk_out: out std_logic;
      userclk2_out: out std_logic;
      rxuserclk_out: out std_logic;
      rxuserclk2_out: out std_logic;
      resetdone: out std_logic;
      pma_reset_out: out std_logic;
      mmcm_locked_out: out std_logic;
      sgmii_clk_r: out std_logic;
      sgmii_clk_f: out std_logic;
      sgmii_clk_en: out std_logic;
      gmii_isolate: out std_logic;
      status_vector: out std_logic_vector(15 downto 0);
      gt0_qplloutclk_out: out std_logic;
      gt0_qplloutrefclk_out: out std_logic;
      an_adv_config_vector: in std_logic_vector(15 downto 0);
      an_restart_config: in std_logic
      );
  end component;

  signal gmii_txd_mac, gmii_txd_phy, gmii_rxd_mac, gmii_rxd_phy: std_logic_vector(7 downto 0);
  signal gmii_tx_en, gmii_tx_er, gmii_rx_dv, gmii_rx_er: std_logic;
  signal gmii_txd, gmii_rxd: std_logic_vector(7 downto 0);
  signal gmii_rx_clk: std_logic;
  signal sig_det: std_logic;
  signal clk125, resetdone, mmcm_locked, locked_i, rstn: std_logic;
  signal speedis100_int: std_logic;
  signal speedis10100_int: std_logic;
  signal mdc_int, mdio_i_int, mdio_o_int: std_logic;
  signal rx_data_int, tx_data_int: std_logic_vector(7 downto 0);
  signal rx_valid_int, rx_last_int, rx_error_int, tx_valid_int, tx_last_int, tx_error_int, tx_ready_int: std_logic;
  signal sgmii_clk_en: std_logic;
  signal status_vector_ila: std_logic_vector(15 downto 0);
  signal tx_data_ila, rx_data_ila: std_logic_vector(7 downto 0);
  signal rsti_ila, rstn_ila: std_logic;
  signal rx_clk_e: std_logic;
  
  attribute mark_debug: string;
  attribute mark_debug of gmii_rxd: signal is "true";
  attribute mark_debug of gmii_txd: signal is "true";
  attribute mark_debug of sgmii_clk_en: signal is "true";
  attribute mark_debug of tx_data_ila: signal is "true";
  attribute mark_debug of rx_data_ila: signal is "true";
  attribute mark_debug of status_vector_ila: signal is "true";

  signal rx_rst_e, rx_rst_en: std_logic;
  signal rx_user_ef, rx_user_f: std_logic_vector(0 downto 0);
  
begin

  clk125_out <= clk125;
  
  rstn <= not (rsti or not locked_i);
  
  --rx_data <= rx_data_int;
  --tx_data_int <= tx_data;
  rx_data <= rx_data_ila;
  tx_data_ila <= tx_data;
  rsti_ila <= rsti;
  rstn_ila <= rstn;
  
  mac: temac_gbe_v9_0
    port map(
      gtx_clk => clk125,
      glbl_rstn => rstn,
      rx_axi_rstn => '1',
      tx_axi_rstn => '1',
      rx_statistics_vector => open,
      rx_statistics_valid => open,
      rx_mac_aclk => rx_clk_e,
      rx_reset => rx_rst_e,
      --clk_enable => sgmii_clk_en,
      --rx_usr_clk2 => '1',
      rx_axis_mac_tdata => rx_data_ila,--rx_data_int,
      rx_axis_mac_tvalid => rx_valid,
      rx_axis_mac_tlast => rx_last,
      rx_axis_mac_tuser => rx_error,
      tx_ifg_delay => X"00",
      tx_statistics_vector => open,
      tx_statistics_valid => open,
      tx_mac_aclk => open,
      tx_reset => open,
      tx_axis_mac_tdata => tx_data,--tx_data_int,
      tx_axis_mac_tvalid => tx_valid,
      tx_axis_mac_tlast => tx_last,
      tx_axis_mac_tuser(0) => tx_error,
      tx_axis_mac_tready => tx_ready,
      pause_req => '0',
      pause_val => X"0000",
      speedis100 => speedis100_int,
      speedis10100 => speedis10100_int,
      gmii_txd => gmii_txd,--gmii_txd_mac,
      gmii_tx_en => gmii_tx_en,
      gmii_tx_er => gmii_tx_er,
      gmii_rxd => gmii_rxd,--gmii_rxd_mac,
      gmii_rx_dv => gmii_rx_dv,
      gmii_rx_er => gmii_rx_er,
      rx_configuration_vector => X"0000_0000_0000_0000_0812",
      tx_configuration_vector => X"0000_0000_0000_0000_0012"
      );
  
  hostbus_out.hostrddata <= (others => '0');
  hostbus_out.hostmiimrdy <= '0';
  
  phy: gig_ethernet_pcs_pma_basex_156_25
    port map(
      gtrefclk_p => gt_clkp,
      gtrefclk_n => gt_clkn,
      gtrefclk_out => refclk_out,
      txn => gt_txn,
      txp => gt_txp,
      rxn => gt_rxn,
      rxp => gt_rxp,
      independent_clock_bufg => indep_clk_in, -- 50MHz
      userclk_out => open,
      userclk2_out => clk125,
      rxuserclk_out => open,
      rxuserclk2_out => open,
      resetdone => resetdone,
      pma_reset_out => open,
      mmcm_locked_out => mmcm_locked,
      gmii_txd => gmii_txd, --gmii_txd_phy,
      gmii_tx_en => gmii_tx_en,
      gmii_tx_er => gmii_tx_er,
      gmii_rxd => gmii_rxd, --gmii_rxd_phy,
      gmii_rx_dv => gmii_rx_dv,
      gmii_rx_er => gmii_rx_er,
      sgmii_clk_en => sgmii_clk_en,
      sgmii_clk_f => open,
      sgmii_clk_r => open,
      gmii_isolate => open,
      configuration_vector => "10000",
      status_vector => status_vector_ila,
      reset => rsti, 
      gt0_qplloutclk_out => open,
      gt0_qplloutrefclk_out => open,
      speed_is_100 => '0',--speedis100_int,
      speed_is_10_100 => '0',--speedis10100_int,
      signal_detect => sig_det,
      an_adv_config_vector => "0000000000100001",--"1101100000000001",--[15]: Link Status, [14]: Acknowledge, [13]: Reserved, [12]: Duplex Mode, [11]: Speed, [10]: Speed, [9]-[1]: Reserved, [0]: SGMII
      an_restart_config => '0' --This may cause an issue
      );
  
  locked_i <= resetdone and mmcm_locked;
  locked <= locked_i;
  
  sig_det <= not sfp_los;
   
end rtl;
