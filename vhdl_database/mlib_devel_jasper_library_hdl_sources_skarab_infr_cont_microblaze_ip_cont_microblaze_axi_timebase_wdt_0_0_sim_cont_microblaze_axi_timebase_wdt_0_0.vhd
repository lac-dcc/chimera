-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: xilinx.com:ip:axi_timebase_wdt:3.0
-- IP Revision: 11

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY axi_timebase_wdt_v3_0_11;
USE axi_timebase_wdt_v3_0_11.axi_timebase_wdt_top;

ENTITY cont_microblaze_axi_timebase_wdt_0_0 IS
  PORT (
    s_axi_araddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_arready : OUT STD_LOGIC;
    s_axi_arvalid : IN STD_LOGIC;
    s_axi_awaddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_awready : OUT STD_LOGIC;
    s_axi_awvalid : IN STD_LOGIC;
    s_axi_bready : IN STD_LOGIC;
    s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_bvalid : OUT STD_LOGIC;
    s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_rready : IN STD_LOGIC;
    s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_rvalid : OUT STD_LOGIC;
    s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_wready : OUT STD_LOGIC;
    s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_wvalid : IN STD_LOGIC;
    freeze : IN STD_LOGIC;
    s_axi_aclk : IN STD_LOGIC;
    s_axi_aresetn : IN STD_LOGIC;
    timebase_interrupt : OUT STD_LOGIC;
    wdt_interrupt : OUT STD_LOGIC;
    wdt_reset : OUT STD_LOGIC
  );
END cont_microblaze_axi_timebase_wdt_0_0;

ARCHITECTURE cont_microblaze_axi_timebase_wdt_0_0_arch OF cont_microblaze_axi_timebase_wdt_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF cont_microblaze_axi_timebase_wdt_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT axi_timebase_wdt_top IS
    GENERIC (
      C_FAMILY : STRING;
      C_WDT_INTERVAL : INTEGER;
      C_WDT_ENABLE_ONCE : INTEGER;
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_ENABLE_WINDOW_WDT : INTEGER;
      C_SST_COUNT_WIDTH : INTEGER;
      C_MAX_COUNT_WIDTH : INTEGER
    );
    PORT (
      s_axi_araddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_arready : OUT STD_LOGIC;
      s_axi_arvalid : IN STD_LOGIC;
      s_axi_awaddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_awready : OUT STD_LOGIC;
      s_axi_awvalid : IN STD_LOGIC;
      s_axi_bready : IN STD_LOGIC;
      s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_bvalid : OUT STD_LOGIC;
      s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_rready : IN STD_LOGIC;
      s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_rvalid : OUT STD_LOGIC;
      s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_wready : OUT STD_LOGIC;
      s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_wvalid : IN STD_LOGIC;
      freeze : IN STD_LOGIC;
      s_axi_aclk : IN STD_LOGIC;
      s_axi_aresetn : IN STD_LOGIC;
      timebase_interrupt : OUT STD_LOGIC;
      wdt_interrupt : OUT STD_LOGIC;
      wdt_reset : OUT STD_LOGIC;
      wdt_reset_pending : OUT STD_LOGIC;
      wdt_state_vec : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
  END COMPONENT axi_timebase_wdt_top;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF wdt_reset: SIGNAL IS "XIL_INTERFACENAME WDT_RESET, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF wdt_reset: SIGNAL IS "xilinx.com:signal:reset:1.0 WDT_RESET RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF wdt_interrupt: SIGNAL IS "XIL_INTERFACENAME WDT_INTERRUPT, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  ATTRIBUTE X_INTERFACE_INFO OF wdt_interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 WDT_INTERRUPT INTERRUPT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF timebase_interrupt: SIGNAL IS "XIL_INTERFACENAME TIMEBASE_INTERRUPT, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  ATTRIBUTE X_INTERFACE_INFO OF timebase_interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 TIMEBASE_INTERRUPT INTERRUPT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_aresetn: SIGNAL IS "XIL_INTERFACENAME S_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_aclk: SIGNAL IS "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn:wdt_reset, FREQ_HZ 39062500, PHASE 0.000, CLK_DOMAIN cont_microblaze_Clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_araddr: SIGNAL IS "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 39062500, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN cont_microblaze_Clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1" & 
", RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
BEGIN
  U0 : axi_timebase_wdt_top
    GENERIC MAP (
      C_FAMILY => "virtex7",
      C_WDT_INTERVAL => 29,
      C_WDT_ENABLE_ONCE => 1,
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI_ADDR_WIDTH => 4,
      C_ENABLE_WINDOW_WDT => 0,
      C_SST_COUNT_WIDTH => 8,
      C_MAX_COUNT_WIDTH => 32
    )
    PORT MAP (
      s_axi_araddr => s_axi_araddr,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr => s_axi_awaddr,
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp => s_axi_bresp,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata => s_axi_rdata,
      s_axi_rready => s_axi_rready,
      s_axi_rresp => s_axi_rresp,
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata => s_axi_wdata,
      s_axi_wready => s_axi_wready,
      s_axi_wstrb => s_axi_wstrb,
      s_axi_wvalid => s_axi_wvalid,
      freeze => freeze,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      timebase_interrupt => timebase_interrupt,
      wdt_interrupt => wdt_interrupt,
      wdt_reset => wdt_reset
    );
END cont_microblaze_axi_timebase_wdt_0_0_arch;
