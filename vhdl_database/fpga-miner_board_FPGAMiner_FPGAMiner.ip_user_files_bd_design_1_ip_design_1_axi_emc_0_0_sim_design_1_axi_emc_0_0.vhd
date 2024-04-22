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

-- IP VLNV: xilinx.com:ip:axi_emc:3.0
-- IP Revision: 15

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY axi_emc_v3_0_15;
USE axi_emc_v3_0_15.axi_emc;

ENTITY design_1_axi_emc_0_0 IS
  PORT (
    s_axi_aclk : IN STD_LOGIC;
    s_axi_aresetn : IN STD_LOGIC;
    rdclk : IN STD_LOGIC;
    s_axi_mem_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_mem_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axi_mem_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi_mem_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_mem_awlock : IN STD_LOGIC;
    s_axi_mem_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_mem_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi_mem_awvalid : IN STD_LOGIC;
    s_axi_mem_awready : OUT STD_LOGIC;
    s_axi_mem_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_mem_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_mem_wlast : IN STD_LOGIC;
    s_axi_mem_wvalid : IN STD_LOGIC;
    s_axi_mem_wready : OUT STD_LOGIC;
    s_axi_mem_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_mem_bvalid : OUT STD_LOGIC;
    s_axi_mem_bready : IN STD_LOGIC;
    s_axi_mem_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_mem_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axi_mem_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi_mem_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_mem_arlock : IN STD_LOGIC;
    s_axi_mem_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_mem_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi_mem_arvalid : IN STD_LOGIC;
    s_axi_mem_arready : OUT STD_LOGIC;
    s_axi_mem_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_mem_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_mem_rlast : OUT STD_LOGIC;
    s_axi_mem_rvalid : OUT STD_LOGIC;
    s_axi_mem_rready : IN STD_LOGIC;
    mem_dq_i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    mem_dq_o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    mem_dq_t : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    mem_a : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    mem_ce : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    mem_cen : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    mem_oen : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    mem_wen : OUT STD_LOGIC;
    mem_ben : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    mem_qwen : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    mem_rpn : OUT STD_LOGIC;
    mem_adv_ldn : OUT STD_LOGIC;
    mem_lbon : OUT STD_LOGIC;
    mem_cken : OUT STD_LOGIC;
    mem_rnw : OUT STD_LOGIC;
    mem_cre : OUT STD_LOGIC;
    mem_wait : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END design_1_axi_emc_0_0;

ARCHITECTURE design_1_axi_emc_0_0_arch OF design_1_axi_emc_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_axi_emc_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT axi_emc IS
    GENERIC (
      C_FAMILY : STRING;
      C_INSTANCE : STRING;
      C_AXI_CLK_PERIOD_PS : INTEGER;
      C_LFLASH_PERIOD_PS : INTEGER;
      C_LINEAR_FLASH_SYNC_BURST : INTEGER;
      C_USE_STARTUP : INTEGER;
      C_PORT_DIFF : INTEGER;
      C_S_AXI_REG_ADDR_WIDTH : INTEGER;
      C_S_AXI_REG_DATA_WIDTH : INTEGER;
      C_S_AXI_EN_REG : INTEGER;
      C_S_AXI_MEM_ADDR_WIDTH : INTEGER;
      C_S_AXI_MEM_DATA_WIDTH : INTEGER;
      C_S_AXI_MEM_ID_WIDTH : INTEGER;
      C_S_AXI_MEM0_BASEADDR : STD_LOGIC_VECTOR;
      C_S_AXI_MEM0_HIGHADDR : STD_LOGIC_VECTOR;
      C_S_AXI_MEM1_BASEADDR : STD_LOGIC_VECTOR;
      C_S_AXI_MEM1_HIGHADDR : STD_LOGIC_VECTOR;
      C_S_AXI_MEM2_BASEADDR : STD_LOGIC_VECTOR;
      C_S_AXI_MEM2_HIGHADDR : STD_LOGIC_VECTOR;
      C_S_AXI_MEM3_BASEADDR : STD_LOGIC_VECTOR;
      C_S_AXI_MEM3_HIGHADDR : STD_LOGIC_VECTOR;
      C_INCLUDE_NEGEDGE_IOREGS : INTEGER;
      C_NUM_BANKS_MEM : INTEGER;
      C_MEM0_TYPE : INTEGER;
      C_MEM1_TYPE : INTEGER;
      C_MEM2_TYPE : INTEGER;
      C_MEM3_TYPE : INTEGER;
      C_MEM0_WIDTH : INTEGER;
      C_MEM1_WIDTH : INTEGER;
      C_MEM2_WIDTH : INTEGER;
      C_MEM3_WIDTH : INTEGER;
      C_MAX_MEM_WIDTH : INTEGER;
      C_PAGE_SIZE : INTEGER;
      C_MEM_A_MSB : INTEGER;
      C_MEM_A_LSB : INTEGER;
      C_PARITY_TYPE_MEM_0 : INTEGER;
      C_PARITY_TYPE_MEM_1 : INTEGER;
      C_PARITY_TYPE_MEM_2 : INTEGER;
      C_PARITY_TYPE_MEM_3 : INTEGER;
      C_INCLUDE_DATAWIDTH_MATCHING_0 : INTEGER;
      C_INCLUDE_DATAWIDTH_MATCHING_1 : INTEGER;
      C_INCLUDE_DATAWIDTH_MATCHING_2 : INTEGER;
      C_INCLUDE_DATAWIDTH_MATCHING_3 : INTEGER;
      C_SYNCH_PIPEDELAY_0 : INTEGER;
      C_TCEDV_PS_MEM_0 : INTEGER;
      C_TAVDV_PS_MEM_0 : INTEGER;
      C_TPACC_PS_FLASH_0 : INTEGER;
      C_THZCE_PS_MEM_0 : INTEGER;
      C_THZOE_PS_MEM_0 : INTEGER;
      C_TWC_PS_MEM_0 : INTEGER;
      C_TWP_PS_MEM_0 : INTEGER;
      C_TWPH_PS_MEM_0 : INTEGER;
      C_TLZWE_PS_MEM_0 : INTEGER;
      C_WR_REC_TIME_MEM_0 : INTEGER;
      C_SYNCH_PIPEDELAY_1 : INTEGER;
      C_TCEDV_PS_MEM_1 : INTEGER;
      C_TAVDV_PS_MEM_1 : INTEGER;
      C_TPACC_PS_FLASH_1 : INTEGER;
      C_THZCE_PS_MEM_1 : INTEGER;
      C_THZOE_PS_MEM_1 : INTEGER;
      C_TWC_PS_MEM_1 : INTEGER;
      C_TWP_PS_MEM_1 : INTEGER;
      C_TWPH_PS_MEM_1 : INTEGER;
      C_TLZWE_PS_MEM_1 : INTEGER;
      C_WR_REC_TIME_MEM_1 : INTEGER;
      C_SYNCH_PIPEDELAY_2 : INTEGER;
      C_TCEDV_PS_MEM_2 : INTEGER;
      C_TAVDV_PS_MEM_2 : INTEGER;
      C_TPACC_PS_FLASH_2 : INTEGER;
      C_THZCE_PS_MEM_2 : INTEGER;
      C_THZOE_PS_MEM_2 : INTEGER;
      C_TWC_PS_MEM_2 : INTEGER;
      C_TWP_PS_MEM_2 : INTEGER;
      C_TWPH_PS_MEM_2 : INTEGER;
      C_TLZWE_PS_MEM_2 : INTEGER;
      C_WR_REC_TIME_MEM_2 : INTEGER;
      C_SYNCH_PIPEDELAY_3 : INTEGER;
      C_TCEDV_PS_MEM_3 : INTEGER;
      C_TAVDV_PS_MEM_3 : INTEGER;
      C_TPACC_PS_FLASH_3 : INTEGER;
      C_THZCE_PS_MEM_3 : INTEGER;
      C_THZOE_PS_MEM_3 : INTEGER;
      C_TWC_PS_MEM_3 : INTEGER;
      C_TWP_PS_MEM_3 : INTEGER;
      C_TWPH_PS_MEM_3 : INTEGER;
      C_TLZWE_PS_MEM_3 : INTEGER;
      C_WR_REC_TIME_MEM_3 : INTEGER
    );
    PORT (
      s_axi_aclk : IN STD_LOGIC;
      s_axi_aresetn : IN STD_LOGIC;
      rdclk : IN STD_LOGIC;
      s_axi_reg_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_reg_awvalid : IN STD_LOGIC;
      s_axi_reg_awready : OUT STD_LOGIC;
      s_axi_reg_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_reg_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_reg_wvalid : IN STD_LOGIC;
      s_axi_reg_wready : OUT STD_LOGIC;
      s_axi_reg_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_reg_bvalid : OUT STD_LOGIC;
      s_axi_reg_bready : IN STD_LOGIC;
      s_axi_reg_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_reg_arvalid : IN STD_LOGIC;
      s_axi_reg_arready : OUT STD_LOGIC;
      s_axi_reg_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_reg_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_reg_rvalid : OUT STD_LOGIC;
      s_axi_reg_rready : IN STD_LOGIC;
      s_axi_mem_awid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s_axi_mem_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_mem_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axi_mem_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_mem_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_mem_awlock : IN STD_LOGIC;
      s_axi_mem_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_mem_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_mem_awvalid : IN STD_LOGIC;
      s_axi_mem_awready : OUT STD_LOGIC;
      s_axi_mem_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_mem_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_mem_wlast : IN STD_LOGIC;
      s_axi_mem_wvalid : IN STD_LOGIC;
      s_axi_mem_wready : OUT STD_LOGIC;
      s_axi_mem_bid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s_axi_mem_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_mem_bvalid : OUT STD_LOGIC;
      s_axi_mem_bready : IN STD_LOGIC;
      s_axi_mem_arid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s_axi_mem_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_mem_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axi_mem_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_mem_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_mem_arlock : IN STD_LOGIC;
      s_axi_mem_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_mem_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_mem_arvalid : IN STD_LOGIC;
      s_axi_mem_arready : OUT STD_LOGIC;
      s_axi_mem_rid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s_axi_mem_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_mem_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_mem_rlast : OUT STD_LOGIC;
      s_axi_mem_rvalid : OUT STD_LOGIC;
      s_axi_mem_rready : IN STD_LOGIC;
      mem_dq_i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      mem_dq_o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      mem_dq_t : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      mem_dq_parity_i : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      mem_dq_parity_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      mem_dq_parity_t : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      mem_a : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      mem_ce : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      mem_cen : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      mem_oen : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      mem_wen : OUT STD_LOGIC;
      mem_ben : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      mem_qwen : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      mem_rpn : OUT STD_LOGIC;
      mem_adv_ldn : OUT STD_LOGIC;
      mem_lbon : OUT STD_LOGIC;
      mem_cken : OUT STD_LOGIC;
      mem_rnw : OUT STD_LOGIC;
      mem_cre : OUT STD_LOGIC;
      mem_wait : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      cfgclk : OUT STD_LOGIC;
      cfgmclk : OUT STD_LOGIC;
      eos : OUT STD_LOGIC;
      gsr : IN STD_LOGIC;
      gts : IN STD_LOGIC;
      keyclearb : IN STD_LOGIC;
      usrcclkts : IN STD_LOGIC;
      usrdoneo : IN STD_LOGIC;
      usrdonets : IN STD_LOGIC
    );
  END COMPONENT axi_emc;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF mem_wait: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF WAIT";
  ATTRIBUTE X_INTERFACE_INFO OF mem_cre: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF CRE";
  ATTRIBUTE X_INTERFACE_INFO OF mem_rnw: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF RNW";
  ATTRIBUTE X_INTERFACE_INFO OF mem_cken: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF CLKEN";
  ATTRIBUTE X_INTERFACE_INFO OF mem_lbon: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF LBON";
  ATTRIBUTE X_INTERFACE_INFO OF mem_adv_ldn: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF ADV_LDN";
  ATTRIBUTE X_INTERFACE_INFO OF mem_rpn: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF RPN";
  ATTRIBUTE X_INTERFACE_INFO OF mem_qwen: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF QWEN";
  ATTRIBUTE X_INTERFACE_INFO OF mem_ben: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF BEN";
  ATTRIBUTE X_INTERFACE_INFO OF mem_wen: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF WEN";
  ATTRIBUTE X_INTERFACE_INFO OF mem_oen: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF OEN";
  ATTRIBUTE X_INTERFACE_INFO OF mem_cen: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF CE_N";
  ATTRIBUTE X_INTERFACE_INFO OF mem_ce: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF CE";
  ATTRIBUTE X_INTERFACE_INFO OF mem_a: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF ADDR";
  ATTRIBUTE X_INTERFACE_INFO OF mem_dq_t: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF DQ_T";
  ATTRIBUTE X_INTERFACE_INFO OF mem_dq_o: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF DQ_O";
  ATTRIBUTE X_INTERFACE_PARAMETER OF mem_dq_i: SIGNAL IS "XIL_INTERFACENAME EMC_INTF, BOARD.ASSOCIATED_PARAM EMC_BOARD_INTERFACE";
  ATTRIBUTE X_INTERFACE_INFO OF mem_dq_i: SIGNAL IS "xilinx.com:interface:emc:1.0 EMC_INTF DQ_I";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_mem_awaddr: SIGNAL IS "XIL_INTERFACENAME S_AXI_MEM, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 4, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_mem_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF rdclk: SIGNAL IS "XIL_INTERFACENAME rdclk, ASSOCIATED_BUSIF EMC_INTF, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1";
  ATTRIBUTE X_INTERFACE_INFO OF rdclk: SIGNAL IS "xilinx.com:signal:clock:1.0 rdclk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_aresetn: SIGNAL IS "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 aresetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_aclk: SIGNAL IS "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF s_axi_mem:s_axi_reg, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 aclk CLK";
BEGIN
  U0 : axi_emc
    GENERIC MAP (
      C_FAMILY => "artix7",
      C_INSTANCE => "axi_emc_inst",
      C_AXI_CLK_PERIOD_PS => 10000,
      C_LFLASH_PERIOD_PS => 10000,
      C_LINEAR_FLASH_SYNC_BURST => 0,
      C_USE_STARTUP => 0,
      C_PORT_DIFF => 0,
      C_S_AXI_REG_ADDR_WIDTH => 5,
      C_S_AXI_REG_DATA_WIDTH => 32,
      C_S_AXI_EN_REG => 0,
      C_S_AXI_MEM_ADDR_WIDTH => 32,
      C_S_AXI_MEM_DATA_WIDTH => 32,
      C_S_AXI_MEM_ID_WIDTH => 1,
      C_S_AXI_MEM0_BASEADDR => X"60000000",
      C_S_AXI_MEM0_HIGHADDR => X"60FFFFFF",
      C_S_AXI_MEM1_BASEADDR => X"B0000000",
      C_S_AXI_MEM1_HIGHADDR => X"BFFFFFFF",
      C_S_AXI_MEM2_BASEADDR => X"C0000000",
      C_S_AXI_MEM2_HIGHADDR => X"CFFFFFFF",
      C_S_AXI_MEM3_BASEADDR => X"D0000000",
      C_S_AXI_MEM3_HIGHADDR => X"DFFFFFFF",
      C_INCLUDE_NEGEDGE_IOREGS => 0,
      C_NUM_BANKS_MEM => 1,
      C_MEM0_TYPE => 1,
      C_MEM1_TYPE => 0,
      C_MEM2_TYPE => 0,
      C_MEM3_TYPE => 0,
      C_MEM0_WIDTH => 16,
      C_MEM1_WIDTH => 16,
      C_MEM2_WIDTH => 16,
      C_MEM3_WIDTH => 16,
      C_MAX_MEM_WIDTH => 16,
      C_PAGE_SIZE => 16,
      C_MEM_A_MSB => 31,
      C_MEM_A_LSB => 0,
      C_PARITY_TYPE_MEM_0 => 0,
      C_PARITY_TYPE_MEM_1 => 0,
      C_PARITY_TYPE_MEM_2 => 0,
      C_PARITY_TYPE_MEM_3 => 0,
      C_INCLUDE_DATAWIDTH_MATCHING_0 => 1,
      C_INCLUDE_DATAWIDTH_MATCHING_1 => 1,
      C_INCLUDE_DATAWIDTH_MATCHING_2 => 1,
      C_INCLUDE_DATAWIDTH_MATCHING_3 => 1,
      C_SYNCH_PIPEDELAY_0 => 1,
      C_TCEDV_PS_MEM_0 => 70000,
      C_TAVDV_PS_MEM_0 => 70000,
      C_TPACC_PS_FLASH_0 => 70000,
      C_THZCE_PS_MEM_0 => 8000,
      C_THZOE_PS_MEM_0 => 8000,
      C_TWC_PS_MEM_0 => 85000,
      C_TWP_PS_MEM_0 => 55000,
      C_TWPH_PS_MEM_0 => 10000,
      C_TLZWE_PS_MEM_0 => 0,
      C_WR_REC_TIME_MEM_0 => 27000,
      C_SYNCH_PIPEDELAY_1 => 1,
      C_TCEDV_PS_MEM_1 => 15000,
      C_TAVDV_PS_MEM_1 => 15000,
      C_TPACC_PS_FLASH_1 => 25000,
      C_THZCE_PS_MEM_1 => 7000,
      C_THZOE_PS_MEM_1 => 7000,
      C_TWC_PS_MEM_1 => 15000,
      C_TWP_PS_MEM_1 => 12000,
      C_TWPH_PS_MEM_1 => 12000,
      C_TLZWE_PS_MEM_1 => 0,
      C_WR_REC_TIME_MEM_1 => 27000,
      C_SYNCH_PIPEDELAY_2 => 1,
      C_TCEDV_PS_MEM_2 => 15000,
      C_TAVDV_PS_MEM_2 => 15000,
      C_TPACC_PS_FLASH_2 => 25000,
      C_THZCE_PS_MEM_2 => 7000,
      C_THZOE_PS_MEM_2 => 7000,
      C_TWC_PS_MEM_2 => 15000,
      C_TWP_PS_MEM_2 => 12000,
      C_TWPH_PS_MEM_2 => 12000,
      C_TLZWE_PS_MEM_2 => 0,
      C_WR_REC_TIME_MEM_2 => 27000,
      C_SYNCH_PIPEDELAY_3 => 1,
      C_TCEDV_PS_MEM_3 => 15000,
      C_TAVDV_PS_MEM_3 => 15000,
      C_TPACC_PS_FLASH_3 => 25000,
      C_THZCE_PS_MEM_3 => 7000,
      C_THZOE_PS_MEM_3 => 7000,
      C_TWC_PS_MEM_3 => 15000,
      C_TWP_PS_MEM_3 => 12000,
      C_TWPH_PS_MEM_3 => 12000,
      C_TLZWE_PS_MEM_3 => 0,
      C_WR_REC_TIME_MEM_3 => 27000
    )
    PORT MAP (
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      rdclk => rdclk,
      s_axi_reg_awaddr => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 5)),
      s_axi_reg_awvalid => '0',
      s_axi_reg_wdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axi_reg_wstrb => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_reg_wvalid => '0',
      s_axi_reg_bready => '0',
      s_axi_reg_araddr => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 5)),
      s_axi_reg_arvalid => '0',
      s_axi_reg_rready => '0',
      s_axi_mem_awid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_mem_awaddr => s_axi_mem_awaddr,
      s_axi_mem_awlen => s_axi_mem_awlen,
      s_axi_mem_awsize => s_axi_mem_awsize,
      s_axi_mem_awburst => s_axi_mem_awburst,
      s_axi_mem_awlock => s_axi_mem_awlock,
      s_axi_mem_awcache => s_axi_mem_awcache,
      s_axi_mem_awprot => s_axi_mem_awprot,
      s_axi_mem_awvalid => s_axi_mem_awvalid,
      s_axi_mem_awready => s_axi_mem_awready,
      s_axi_mem_wdata => s_axi_mem_wdata,
      s_axi_mem_wstrb => s_axi_mem_wstrb,
      s_axi_mem_wlast => s_axi_mem_wlast,
      s_axi_mem_wvalid => s_axi_mem_wvalid,
      s_axi_mem_wready => s_axi_mem_wready,
      s_axi_mem_bresp => s_axi_mem_bresp,
      s_axi_mem_bvalid => s_axi_mem_bvalid,
      s_axi_mem_bready => s_axi_mem_bready,
      s_axi_mem_arid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_mem_araddr => s_axi_mem_araddr,
      s_axi_mem_arlen => s_axi_mem_arlen,
      s_axi_mem_arsize => s_axi_mem_arsize,
      s_axi_mem_arburst => s_axi_mem_arburst,
      s_axi_mem_arlock => s_axi_mem_arlock,
      s_axi_mem_arcache => s_axi_mem_arcache,
      s_axi_mem_arprot => s_axi_mem_arprot,
      s_axi_mem_arvalid => s_axi_mem_arvalid,
      s_axi_mem_arready => s_axi_mem_arready,
      s_axi_mem_rdata => s_axi_mem_rdata,
      s_axi_mem_rresp => s_axi_mem_rresp,
      s_axi_mem_rlast => s_axi_mem_rlast,
      s_axi_mem_rvalid => s_axi_mem_rvalid,
      s_axi_mem_rready => s_axi_mem_rready,
      mem_dq_i => mem_dq_i,
      mem_dq_o => mem_dq_o,
      mem_dq_t => mem_dq_t,
      mem_dq_parity_i => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      mem_a => mem_a,
      mem_ce => mem_ce,
      mem_cen => mem_cen,
      mem_oen => mem_oen,
      mem_wen => mem_wen,
      mem_ben => mem_ben,
      mem_qwen => mem_qwen,
      mem_rpn => mem_rpn,
      mem_adv_ldn => mem_adv_ldn,
      mem_lbon => mem_lbon,
      mem_cken => mem_cken,
      mem_rnw => mem_rnw,
      mem_cre => mem_cre,
      mem_wait => mem_wait,
      gsr => '0',
      gts => '0',
      keyclearb => '0',
      usrcclkts => '0',
      usrdoneo => '1',
      usrdonets => '1'
    );
END design_1_axi_emc_0_0_arch;
