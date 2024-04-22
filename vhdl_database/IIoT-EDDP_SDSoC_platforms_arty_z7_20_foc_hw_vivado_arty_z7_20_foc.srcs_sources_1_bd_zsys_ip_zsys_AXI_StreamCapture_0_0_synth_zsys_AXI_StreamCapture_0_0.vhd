-- (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: trenz.biz:user:AXI_StreamCapture:1.0
-- IP Revision: 12

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY zsys_AXI_StreamCapture_0_0 IS
  PORT (
    axi_aclk : IN STD_LOGIC;
    axi_aresetn : IN STD_LOGIC;
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axis_s2mm_tvalid : OUT STD_LOGIC;
    m_axis_s2mm_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axis_s2mm_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axis_s2mm_tlast : OUT STD_LOGIC;
    m_axis_s2mm_tready : IN STD_LOGIC;
    m_axis_s2mm_cmd_tvalid : OUT STD_LOGIC;
    m_axis_s2mm_cmd_tdata : OUT STD_LOGIC_VECTOR(71 DOWNTO 0);
    m_axis_s2mm_cmd_tready : IN STD_LOGIC;
    s_axis_s2mm_sts_tready : OUT STD_LOGIC;
    s_axis_s2mm_sts_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_s2mm_sts_tkeep : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axis_s2mm_sts_tlast : IN STD_LOGIC;
    s_axis_s2mm_sts_tvalid : IN STD_LOGIC;
    s_axi_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi_awvalid : IN STD_LOGIC;
    s_axi_awready : OUT STD_LOGIC;
    s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_wvalid : IN STD_LOGIC;
    s_axi_wready : OUT STD_LOGIC;
    s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_bvalid : OUT STD_LOGIC;
    s_axi_bready : IN STD_LOGIC;
    s_axi_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi_arvalid : IN STD_LOGIC;
    s_axi_arready : OUT STD_LOGIC;
    s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_rvalid : OUT STD_LOGIC;
    s_axi_rready : IN STD_LOGIC
  );
END zsys_AXI_StreamCapture_0_0;

ARCHITECTURE zsys_AXI_StreamCapture_0_0_arch OF zsys_AXI_StreamCapture_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF zsys_AXI_StreamCapture_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT AXI_StreamCapture_v1_0 IS
    GENERIC (
      C_S_AXI_DATA_WIDTH : INTEGER; -- Width of S_AXI data bus
      C_S_AXI_ADDR_WIDTH : INTEGER; -- Width of S_AXI address bus
      C_BLOCK_SIZE : INTEGER;
      C_USE_TRIG : BOOLEAN;
      C_DATA_SYNC_TRIG : BOOLEAN;
      C_PRETRIG : BOOLEAN;
      C_S_AXIS_DATA_WIDTH : INTEGER
    );
    PORT (
      axi_aclk : IN STD_LOGIC;
      axi_aresetn : IN STD_LOGIC;
      rd_data_count : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_trig : OUT STD_LOGIC;
      m_ack : IN STD_LOGIC;
      s_trig : IN STD_LOGIC;
      s_ack : OUT STD_LOGIC;
      s_axis_tvalid : IN STD_LOGIC;
      s_axis_tready : OUT STD_LOGIC;
      s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axis_s2mm_tvalid : OUT STD_LOGIC;
      m_axis_s2mm_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axis_s2mm_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axis_s2mm_tlast : OUT STD_LOGIC;
      m_axis_s2mm_tready : IN STD_LOGIC;
      m_axis_s2mm_cmd_tvalid : OUT STD_LOGIC;
      m_axis_s2mm_cmd_tdata : OUT STD_LOGIC_VECTOR(71 DOWNTO 0);
      m_axis_s2mm_cmd_tready : IN STD_LOGIC;
      s_axis_s2mm_sts_tready : OUT STD_LOGIC;
      s_axis_s2mm_sts_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axis_s2mm_sts_tkeep : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axis_s2mm_sts_tlast : IN STD_LOGIC;
      s_axis_s2mm_sts_tvalid : IN STD_LOGIC;
      s_axi_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_awvalid : IN STD_LOGIC;
      s_axi_awready : OUT STD_LOGIC;
      s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_wvalid : IN STD_LOGIC;
      s_axi_wready : OUT STD_LOGIC;
      s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_bvalid : OUT STD_LOGIC;
      s_axi_bready : IN STD_LOGIC;
      s_axi_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_arvalid : IN STD_LOGIC;
      s_axi_arready : OUT STD_LOGIC;
      s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_rvalid : OUT STD_LOGIC;
      s_axi_rready : IN STD_LOGIC
    );
  END COMPONENT AXI_StreamCapture_v1_0;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF zsys_AXI_StreamCapture_0_0_arch: ARCHITECTURE IS "AXI_StreamCapture_v1_0,Vivado 2017.1_sdx";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF zsys_AXI_StreamCapture_0_0_arch : ARCHITECTURE IS "zsys_AXI_StreamCapture_0_0,AXI_StreamCapture_v1_0,{}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF axi_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 axi_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF axi_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 axi_aresetn RST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_s2mm_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_s2mm TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_s2mm_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_s2mm TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_s2mm_tkeep: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_s2mm TKEEP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_s2mm_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_s2mm TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_s2mm_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_s2mm TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_s2mm_cmd_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_s2mm_cmd TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_s2mm_cmd_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_s2mm_cmd TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_s2mm_cmd_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_s2mm_cmd TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_s2mm_sts_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis_s2mm_sts TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_s2mm_sts_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis_s2mm_sts TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_s2mm_sts_tkeep: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis_s2mm_sts TKEEP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_s2mm_sts_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis_s2mm_sts TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_s2mm_sts_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis_s2mm_sts TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
BEGIN
  U0 : AXI_StreamCapture_v1_0
    GENERIC MAP (
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI_ADDR_WIDTH => 5,
      C_BLOCK_SIZE => 8192,
      C_USE_TRIG => false,
      C_DATA_SYNC_TRIG => false,
      C_PRETRIG => false,
      C_S_AXIS_DATA_WIDTH => 64
    )
    PORT MAP (
      axi_aclk => axi_aclk,
      axi_aresetn => axi_aresetn,
      rd_data_count => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      m_ack => '1',
      s_trig => '0',
      s_axis_tvalid => s_axis_tvalid,
      s_axis_tready => s_axis_tready,
      s_axis_tdata => s_axis_tdata,
      m_axis_s2mm_tvalid => m_axis_s2mm_tvalid,
      m_axis_s2mm_tdata => m_axis_s2mm_tdata,
      m_axis_s2mm_tkeep => m_axis_s2mm_tkeep,
      m_axis_s2mm_tlast => m_axis_s2mm_tlast,
      m_axis_s2mm_tready => m_axis_s2mm_tready,
      m_axis_s2mm_cmd_tvalid => m_axis_s2mm_cmd_tvalid,
      m_axis_s2mm_cmd_tdata => m_axis_s2mm_cmd_tdata,
      m_axis_s2mm_cmd_tready => m_axis_s2mm_cmd_tready,
      s_axis_s2mm_sts_tready => s_axis_s2mm_sts_tready,
      s_axis_s2mm_sts_tdata => s_axis_s2mm_sts_tdata,
      s_axis_s2mm_sts_tkeep => s_axis_s2mm_sts_tkeep,
      s_axis_s2mm_sts_tlast => s_axis_s2mm_sts_tlast,
      s_axis_s2mm_sts_tvalid => s_axis_s2mm_sts_tvalid,
      s_axi_awaddr => s_axi_awaddr,
      s_axi_awprot => s_axi_awprot,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_awready => s_axi_awready,
      s_axi_wdata => s_axi_wdata,
      s_axi_wstrb => s_axi_wstrb,
      s_axi_wvalid => s_axi_wvalid,
      s_axi_wready => s_axi_wready,
      s_axi_bresp => s_axi_bresp,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_bready => s_axi_bready,
      s_axi_araddr => s_axi_araddr,
      s_axi_arprot => s_axi_arprot,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_arready => s_axi_arready,
      s_axi_rdata => s_axi_rdata,
      s_axi_rresp => s_axi_rresp,
      s_axi_rvalid => s_axi_rvalid,
      s_axi_rready => s_axi_rready
    );
END zsys_AXI_StreamCapture_0_0_arch;
