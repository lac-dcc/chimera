-- (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:mii_to_rmii:2.0
-- IP Revision: 17

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY mii_to_rmii_v2_0_17;
USE mii_to_rmii_v2_0_17.mii_to_rmii;

ENTITY design_1_mii_to_rmii_0_0 IS
  PORT (
    rst_n : IN STD_LOGIC;
    ref_clk : IN STD_LOGIC;
    mac2rmii_tx_en : IN STD_LOGIC;
    mac2rmii_txd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    mac2rmii_tx_er : IN STD_LOGIC;
    rmii2mac_tx_clk : OUT STD_LOGIC;
    rmii2mac_rx_clk : OUT STD_LOGIC;
    rmii2mac_col : OUT STD_LOGIC;
    rmii2mac_crs : OUT STD_LOGIC;
    rmii2mac_rx_dv : OUT STD_LOGIC;
    rmii2mac_rx_er : OUT STD_LOGIC;
    rmii2mac_rxd : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    phy2rmii_crs_dv : IN STD_LOGIC;
    phy2rmii_rx_er : IN STD_LOGIC;
    phy2rmii_rxd : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    rmii2phy_txd : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    rmii2phy_tx_en : OUT STD_LOGIC
  );
END design_1_mii_to_rmii_0_0;

ARCHITECTURE design_1_mii_to_rmii_0_0_arch OF design_1_mii_to_rmii_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_mii_to_rmii_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT mii_to_rmii IS
    GENERIC (
      C_INSTANCE : STRING;
      C_FIXED_SPEED : STD_LOGIC;
      C_INCLUDE_BUF : INTEGER;
      C_SPEED_100 : STD_LOGIC;
      C_FAMILY : STRING
    );
    PORT (
      rst_n : IN STD_LOGIC;
      ref_clk : IN STD_LOGIC;
      mac2rmii_tx_en : IN STD_LOGIC;
      mac2rmii_txd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      mac2rmii_tx_er : IN STD_LOGIC;
      rmii2mac_tx_clk : OUT STD_LOGIC;
      rmii2mac_rx_clk : OUT STD_LOGIC;
      rmii2mac_col : OUT STD_LOGIC;
      rmii2mac_crs : OUT STD_LOGIC;
      rmii2mac_rx_dv : OUT STD_LOGIC;
      rmii2mac_rx_er : OUT STD_LOGIC;
      rmii2mac_rxd : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      phy2rmii_crs_dv : IN STD_LOGIC;
      phy2rmii_rx_er : IN STD_LOGIC;
      phy2rmii_rxd : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      rmii2phy_txd : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      rmii2phy_tx_en : OUT STD_LOGIC
    );
  END COMPONENT mii_to_rmii;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF rmii2phy_tx_en: SIGNAL IS "xilinx.com:interface:rmii:1.0 RMII_PHY_M TX_EN";
  ATTRIBUTE X_INTERFACE_INFO OF rmii2phy_txd: SIGNAL IS "xilinx.com:interface:rmii:1.0 RMII_PHY_M TXD";
  ATTRIBUTE X_INTERFACE_INFO OF phy2rmii_rxd: SIGNAL IS "xilinx.com:interface:rmii:1.0 RMII_PHY_M RXD";
  ATTRIBUTE X_INTERFACE_INFO OF phy2rmii_rx_er: SIGNAL IS "xilinx.com:interface:rmii:1.0 RMII_PHY_M RX_ER";
  ATTRIBUTE X_INTERFACE_PARAMETER OF phy2rmii_crs_dv: SIGNAL IS "XIL_INTERFACENAME RMII_PHY_M, BOARD.ASSOCIATED_PARAM RMII_BOARD_INTERFACE";
  ATTRIBUTE X_INTERFACE_INFO OF phy2rmii_crs_dv: SIGNAL IS "xilinx.com:interface:rmii:1.0 RMII_PHY_M CRS_DV";
  ATTRIBUTE X_INTERFACE_INFO OF rmii2mac_rxd: SIGNAL IS "xilinx.com:interface:mii:1.0 MII RXD";
  ATTRIBUTE X_INTERFACE_INFO OF rmii2mac_rx_er: SIGNAL IS "xilinx.com:interface:mii:1.0 MII RX_ER";
  ATTRIBUTE X_INTERFACE_INFO OF rmii2mac_rx_dv: SIGNAL IS "xilinx.com:interface:mii:1.0 MII RX_DV";
  ATTRIBUTE X_INTERFACE_INFO OF rmii2mac_crs: SIGNAL IS "xilinx.com:interface:mii:1.0 MII CRS";
  ATTRIBUTE X_INTERFACE_INFO OF rmii2mac_col: SIGNAL IS "xilinx.com:interface:mii:1.0 MII COL";
  ATTRIBUTE X_INTERFACE_INFO OF rmii2mac_rx_clk: SIGNAL IS "xilinx.com:interface:mii:1.0 MII RX_CLK";
  ATTRIBUTE X_INTERFACE_INFO OF rmii2mac_tx_clk: SIGNAL IS "xilinx.com:interface:mii:1.0 MII TX_CLK";
  ATTRIBUTE X_INTERFACE_INFO OF mac2rmii_tx_er: SIGNAL IS "xilinx.com:interface:mii:1.0 MII TX_ER";
  ATTRIBUTE X_INTERFACE_INFO OF mac2rmii_txd: SIGNAL IS "xilinx.com:interface:mii:1.0 MII TXD";
  ATTRIBUTE X_INTERFACE_INFO OF mac2rmii_tx_en: SIGNAL IS "xilinx.com:interface:mii:1.0 MII TX_EN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ref_clk: SIGNAL IS "XIL_INTERFACENAME clock, BOARD.ASSOCIATED_PARAM REF_CLK_BOARD_INTERFACE, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1";
  ATTRIBUTE X_INTERFACE_INFO OF ref_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clock CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF rst_n: SIGNAL IS "XIL_INTERFACENAME rst, BOARD.ASSOCIATED_PARAM RESET_BOARD_INTERFACE, POLARITY ACTIVE_LOW";
  ATTRIBUTE X_INTERFACE_INFO OF rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 rst RST";
BEGIN
  U0 : mii_to_rmii
    GENERIC MAP (
      C_INSTANCE => "design_1_mii_to_rmii_0_0",
      C_FIXED_SPEED => '1',
      C_INCLUDE_BUF => 0,
      C_SPEED_100 => '1',
      C_FAMILY => "artix7"
    )
    PORT MAP (
      rst_n => rst_n,
      ref_clk => ref_clk,
      mac2rmii_tx_en => mac2rmii_tx_en,
      mac2rmii_txd => mac2rmii_txd,
      mac2rmii_tx_er => mac2rmii_tx_er,
      rmii2mac_tx_clk => rmii2mac_tx_clk,
      rmii2mac_rx_clk => rmii2mac_rx_clk,
      rmii2mac_col => rmii2mac_col,
      rmii2mac_crs => rmii2mac_crs,
      rmii2mac_rx_dv => rmii2mac_rx_dv,
      rmii2mac_rx_er => rmii2mac_rx_er,
      rmii2mac_rxd => rmii2mac_rxd,
      phy2rmii_crs_dv => phy2rmii_crs_dv,
      phy2rmii_rx_er => phy2rmii_rx_er,
      phy2rmii_rxd => phy2rmii_rxd,
      rmii2phy_txd => rmii2phy_txd,
      rmii2phy_tx_en => rmii2phy_tx_en
    );
END design_1_mii_to_rmii_0_0_arch;
