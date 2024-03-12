//-----------------------------------------------------------------------------
//
// (c) Copyright 2009-2010 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//-----------------------------------------------------------------------------
// Project    : Virtex-6 Integrated Block for PCI Express
// File       : v6_pcie_v2_2.v
// Version    : 2.1
//--
//-- Description: Virtex6 solution wrapper : Endpoint for PCI Express
//--
//--
//--
//--------------------------------------------------------------------------------

`timescale 1ns/1ns

(* CORE_GENERATION_INFO = "v6_pcie_v2_2,v6_pcie_v2_2,{LINK_CAP_MAX_LINK_SPEED=2,LINK_CAP_MAX_LINK_WIDTH=04,PCIE_CAP_DEVICE_PORT_TYPE=0000,DEV_CAP_MAX_PAYLOAD_SUPPORTED=2,USER_CLK_FREQ=3,REF_CLK_FREQ=2,MSI_CAP_ON=TRUE,MSI_CAP_MULTIMSGCAP=0,MSI_CAP_MULTIMSG_EXTENSION=0,MSIX_CAP_ON=FALSE,TL_TX_RAM_RADDR_LATENCY=0,TL_TX_RAM_RDATA_LATENCY=2,TL_RX_RAM_RADDR_LATENCY=0,TL_RX_RAM_RDATA_LATENCY=2,TL_RX_RAM_WRITE_LATENCY=0,VC0_TX_LASTPACKET=29,VC0_RX_RAM_LIMIT=7FF,VC0_TOTAL_CREDITS_PH=32,VC0_TOTAL_CREDITS_PD=308,VC0_TOTAL_CREDITS_NPH=12,VC0_TOTAL_CREDITS_CH=36,VC0_TOTAL_CREDITS_CD=308,VC0_CPL_INFINITE=TRUE,DEV_CAP_PHANTOM_FUNCTIONS_SUPPORT=0,DEV_CAP_EXT_TAG_SUPPORTED=FALSE,LINK_STATUS_SLOT_CLOCK_CONFIG=FALSE,ENABLE_RX_TD_ECRC_TRIM=FALSE,DISABLE_LANE_REVERSAL=TRUE,DISABLE_SCRAMBLING=FALSE,DSN_CAP_ON=TRUE,PIPE_PIPELINE_STAGES=0,REVISION_ID=03,VC_CAP_ON=FALSE}" *)
(* box_type="user_black_box" *)
module v6_pcie_v2_2 # (
  parameter        ALLOW_X8_GEN2 = "FALSE",
  parameter        BAR0 = 32'hFF000000,
  parameter        BAR1 = 32'hFFFF0000,
  parameter        BAR2 = 32'h00000000,
  parameter        BAR3 = 32'h00000000,
  parameter        BAR4 = 32'h00000000,
  parameter        BAR5 = 32'h00000000,

  parameter        CARDBUS_CIS_POINTER = 32'h00000000,
  parameter        CLASS_CODE = 24'h050000,
  parameter        CMD_INTX_IMPLEMENTED = "TRUE",
  parameter        CPL_TIMEOUT_DISABLE_SUPPORTED = "FALSE",
  parameter        CPL_TIMEOUT_RANGES_SUPPORTED = 4'h2,

  parameter        DEV_CAP_ENDPOINT_L0S_LATENCY = 0,
  parameter        DEV_CAP_ENDPOINT_L1_LATENCY = 7,
  parameter        DEV_CAP_EXT_TAG_SUPPORTED = "FALSE",
  parameter        DEV_CAP_MAX_PAYLOAD_SUPPORTED = 2,
  parameter        DEV_CAP_PHANTOM_FUNCTIONS_SUPPORT = 0,
  parameter        DEVICE_ID = 16'h4243,

  parameter        DISABLE_LANE_REVERSAL = "TRUE",
  parameter        DISABLE_SCRAMBLING = "FALSE",
  parameter        DSN_BASE_PTR = 12'h100,
  parameter        DSN_CAP_NEXTPTR = 12'h000,
  parameter        DSN_CAP_ON = "TRUE",

  parameter        ENABLE_MSG_ROUTE = 11'b00000000000,
  parameter        ENABLE_RX_TD_ECRC_TRIM = "FALSE",
  parameter        EXPANSION_ROM = 32'h00000000,
  parameter        EXT_CFG_CAP_PTR = 6'h3F,
  parameter        EXT_CFG_XP_CAP_PTR = 10'h3FF,
  parameter        HEADER_TYPE = 8'h00,
  parameter        INTERRUPT_PIN = 8'h1,

  parameter        LINK_CAP_DLL_LINK_ACTIVE_REPORTING_CAP = "FALSE",
  parameter        LINK_CAP_LINK_BANDWIDTH_NOTIFICATION_CAP = "FALSE",
  parameter        LINK_CAP_MAX_LINK_SPEED = 4'h2,
  parameter        LINK_CAP_MAX_LINK_WIDTH = 6'h04,
  parameter        LINK_CAP_SURPRISE_DOWN_ERROR_CAPABLE = "FALSE",

  parameter        LINK_CTRL2_DEEMPHASIS = "FALSE",
  parameter        LINK_CTRL2_HW_AUTONOMOUS_SPEED_DISABLE = "FALSE",
  parameter        LINK_CTRL2_TARGET_LINK_SPEED = 4'h2,
  parameter        LINK_STATUS_SLOT_CLOCK_CONFIG = "FALSE",

  parameter        LL_ACK_TIMEOUT = 15'h0000,
  parameter        LL_ACK_TIMEOUT_EN = "FALSE",
  parameter        LL_ACK_TIMEOUT_FUNC = 0,
  parameter        LL_REPLAY_TIMEOUT = 15'h0026,
  parameter        LL_REPLAY_TIMEOUT_EN = "TRUE",
  parameter        LL_REPLAY_TIMEOUT_FUNC = 1,

  parameter        LTSSM_MAX_LINK_WIDTH = 6'h04,
  parameter        MSI_CAP_MULTIMSGCAP = 0,
  parameter        MSI_CAP_MULTIMSG_EXTENSION = 0,
  parameter        MSI_CAP_ON = "TRUE",
  parameter        MSI_CAP_PER_VECTOR_MASKING_CAPABLE = "FALSE",
  parameter        MSI_CAP_64_BIT_ADDR_CAPABLE = "TRUE",

  parameter        MSIX_CAP_ON = "FALSE",
  parameter        MSIX_CAP_PBA_BIR = 0,
  parameter        MSIX_CAP_PBA_OFFSET = 29'h0,
  parameter        MSIX_CAP_TABLE_BIR = 0,
  parameter        MSIX_CAP_TABLE_OFFSET = 29'h0,
  parameter        MSIX_CAP_TABLE_SIZE = 11'h000,

  parameter        PCIE_CAP_DEVICE_PORT_TYPE = 4'b0000,
  parameter        PCIE_CAP_INT_MSG_NUM = 5'h1,
  parameter        PCIE_CAP_NEXTPTR = 8'h00,
  parameter        PCIE_DRP_ENABLE = "FALSE",
  parameter        PIPE_PIPELINE_STAGES = 0,                // 0 - 0 stages, 1 - 1 stage, 2 - 2 stages

  parameter        PM_CAP_DSI = "FALSE",
  parameter        PM_CAP_D1SUPPORT = "FALSE",
  parameter        PM_CAP_D2SUPPORT = "FALSE",
  parameter        PM_CAP_NEXTPTR = 8'h48,
  parameter        PM_CAP_PMESUPPORT = 5'h0F,
  parameter        PM_CSR_NOSOFTRST = "TRUE",

  parameter        PM_DATA_SCALE0 = 2'h0,
  parameter        PM_DATA_SCALE1 = 2'h0,
  parameter        PM_DATA_SCALE2 = 2'h0,
  parameter        PM_DATA_SCALE3 = 2'h0,
  parameter        PM_DATA_SCALE4 = 2'h0,
  parameter        PM_DATA_SCALE5 = 2'h0,
  parameter        PM_DATA_SCALE6 = 2'h0,
  parameter        PM_DATA_SCALE7 = 2'h0,

  parameter        PM_DATA0 = 8'h00,
  parameter        PM_DATA1 = 8'h00,
  parameter        PM_DATA2 = 8'h00,
  parameter        PM_DATA3 = 8'h00,
  parameter        PM_DATA4 = 8'h00,
  parameter        PM_DATA5 = 8'h00,
  parameter        PM_DATA6 = 8'h00,
  parameter        PM_DATA7 = 8'h00,

  parameter        REF_CLK_FREQ = 2,                        // 0 - 100 MHz, 1 - 125 MHz, 2 - 250 MHz
  parameter        REVISION_ID = 8'h03,
  parameter        SPARE_BIT0 = 0,
  parameter        SUBSYSTEM_ID = 16'h0007,
  parameter        SUBSYSTEM_VENDOR_ID = 16'h10EE,

  parameter        TL_RX_RAM_RADDR_LATENCY = 0,
  parameter        TL_RX_RAM_RDATA_LATENCY = 2,
  parameter        TL_RX_RAM_WRITE_LATENCY = 0,
  parameter        TL_TX_RAM_RADDR_LATENCY = 0,
  parameter        TL_TX_RAM_RDATA_LATENCY = 2,
  parameter        TL_TX_RAM_WRITE_LATENCY = 0,

  parameter        UPCONFIG_CAPABLE = "TRUE",
  parameter        USER_CLK_FREQ = 3,
  parameter        VC_BASE_PTR = 12'h0,
  parameter        VC_CAP_NEXTPTR = 12'h000,
  parameter        VC_CAP_ON = "FALSE",
  parameter        VC_CAP_REJECT_SNOOP_TRANSACTIONS = "FALSE",

  parameter        VC0_CPL_INFINITE = "TRUE",
  parameter        VC0_RX_RAM_LIMIT = 13'h7FF,
  parameter        VC0_TOTAL_CREDITS_CD = 308,
  parameter        VC0_TOTAL_CREDITS_CH = 36,
  parameter        VC0_TOTAL_CREDITS_NPH = 12,
  parameter        VC0_TOTAL_CREDITS_PD = 308,
  parameter        VC0_TOTAL_CREDITS_PH = 32,
  parameter        VC0_TX_LASTPACKET = 29,

  parameter        VENDOR_ID = 16'h10EE,
  parameter        VSEC_BASE_PTR = 12'h0,
  parameter        VSEC_CAP_NEXTPTR = 12'h000,
  parameter        VSEC_CAP_ON = "FALSE",

  parameter        AER_BASE_PTR = 12'h128,
  parameter        AER_CAP_ECRC_CHECK_CAPABLE = "FALSE",
  parameter        AER_CAP_ECRC_GEN_CAPABLE = "FALSE",
  parameter        AER_CAP_ID = 16'h0001,
  parameter        AER_CAP_INT_MSG_NUM_MSI = 5'h0a,
  parameter        AER_CAP_INT_MSG_NUM_MSIX = 5'h15,
  parameter        AER_CAP_NEXTPTR = 12'h160,
  parameter        AER_CAP_ON = "FALSE",
  parameter        AER_CAP_PERMIT_ROOTERR_UPDATE = "TRUE",
  parameter        AER_CAP_VERSION = 4'h1,

  parameter        CAPABILITIES_PTR = 8'h40,
  parameter        CRM_MODULE_RSTS = 7'h00,
  parameter        DEV_CAP_ENABLE_SLOT_PWR_LIMIT_SCALE = "TRUE",
  parameter        DEV_CAP_ENABLE_SLOT_PWR_LIMIT_VALUE = "TRUE",
  parameter        DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE = "FALSE",
  parameter        DEV_CAP_ROLE_BASED_ERROR = "TRUE",
  parameter        DEV_CAP_RSVD_14_12 = 0,
  parameter        DEV_CAP_RSVD_17_16 = 0,
  parameter        DEV_CAP_RSVD_31_29 = 0,
  parameter        DEV_CONTROL_AUX_POWER_SUPPORTED = "FALSE",

  parameter        DISABLE_ASPM_L1_TIMER = "FALSE",
  parameter        DISABLE_BAR_FILTERING = "FALSE",
  parameter        DISABLE_ID_CHECK = "FALSE",
  parameter        DISABLE_RX_TC_FILTER = "FALSE",
  parameter        DNSTREAM_LINK_NUM = 8'h00,

  parameter        DSN_CAP_ID = 16'h0003,
  parameter        DSN_CAP_VERSION = 4'h1,
  parameter        ENTER_RVRY_EI_L0 = "TRUE",
  parameter        INFER_EI = 5'h0c,
  parameter        IS_SWITCH = "FALSE",

  parameter        LAST_CONFIG_DWORD = 10'h3FF,
  parameter        LINK_CAP_ASPM_SUPPORT = 1,
  parameter        LINK_CAP_CLOCK_POWER_MANAGEMENT = "FALSE",
  parameter        LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN1 = 7,
  parameter        LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN2 = 7,
  parameter        LINK_CAP_L0S_EXIT_LATENCY_GEN1 = 7,
  parameter        LINK_CAP_L0S_EXIT_LATENCY_GEN2 = 7,
  parameter        LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN1 = 7,
  parameter        LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN2 = 7,
  parameter        LINK_CAP_L1_EXIT_LATENCY_GEN1 = 7,
  parameter        LINK_CAP_L1_EXIT_LATENCY_GEN2 = 7,
  parameter        LINK_CAP_RSVD_23_22 = 0,
  parameter        LINK_CONTROL_RCB = 0,

  parameter        MSI_BASE_PTR = 8'h48,
  parameter        MSI_CAP_ID = 8'h05,
  parameter        MSI_CAP_NEXTPTR = 8'h60,
  parameter        MSIX_BASE_PTR = 8'h9c,
  parameter        MSIX_CAP_ID = 8'h11,
  parameter        MSIX_CAP_NEXTPTR = 8'h00,
  parameter        N_FTS_COMCLK_GEN1 = 255,
  parameter        N_FTS_COMCLK_GEN2 = 254,
  parameter        N_FTS_GEN1 = 255,
  parameter        N_FTS_GEN2 = 255,

  parameter        PCIE_BASE_PTR = 8'h60,
  parameter        PCIE_CAP_CAPABILITY_ID = 8'h10,
  parameter        PCIE_CAP_CAPABILITY_VERSION = 4'h2,
  parameter        PCIE_CAP_ON = "TRUE",
  parameter        PCIE_CAP_RSVD_15_14 = 0,
  parameter        PCIE_CAP_SLOT_IMPLEMENTED = "FALSE",
  parameter        PCIE_REVISION = 2,
  parameter        PGL0_LANE = 0,
  parameter        PGL1_LANE = 1,
  parameter        PGL2_LANE = 2,
  parameter        PGL3_LANE = 3,
  parameter        PGL4_LANE = 4,
  parameter        PGL5_LANE = 5,
  parameter        PGL6_LANE = 6,
  parameter        PGL7_LANE = 7,
  parameter        PL_AUTO_CONFIG = 0,
  parameter        PL_FAST_TRAIN = "FALSE",

  parameter        PM_BASE_PTR = 8'h40,
  parameter        PM_CAP_AUXCURRENT = 0,
  parameter        PM_CAP_ID = 8'h01,
  parameter        PM_CAP_ON = "TRUE",
  parameter        PM_CAP_PME_CLOCK = "FALSE",
  parameter        PM_CAP_RSVD_04 = 0,
  parameter        PM_CAP_VERSION = 3,
  parameter        PM_CSR_BPCCEN = "FALSE",
  parameter        PM_CSR_B2B3 = "FALSE",

  parameter        RECRC_CHK = 0,
  parameter        RECRC_CHK_TRIM = "FALSE",
  parameter        ROOT_CAP_CRS_SW_VISIBILITY = "FALSE",
  parameter        SELECT_DLL_IF = "FALSE",
  parameter        SLOT_CAP_ATT_BUTTON_PRESENT = "FALSE",
  parameter        SLOT_CAP_ATT_INDICATOR_PRESENT = "FALSE",
  parameter        SLOT_CAP_ELEC_INTERLOCK_PRESENT = "FALSE",
  parameter        SLOT_CAP_HOTPLUG_CAPABLE = "FALSE",
  parameter        SLOT_CAP_HOTPLUG_SURPRISE = "FALSE",
  parameter        SLOT_CAP_MRL_SENSOR_PRESENT = "FALSE",
  parameter        SLOT_CAP_NO_CMD_COMPLETED_SUPPORT = "FALSE",
  parameter        SLOT_CAP_PHYSICAL_SLOT_NUM = 13'h0000,
  parameter        SLOT_CAP_POWER_CONTROLLER_PRESENT = "FALSE",
  parameter        SLOT_CAP_POWER_INDICATOR_PRESENT = "FALSE",
  parameter        SLOT_CAP_SLOT_POWER_LIMIT_SCALE = 0,
  parameter        SLOT_CAP_SLOT_POWER_LIMIT_VALUE = 8'h00,
  parameter        SPARE_BIT1 = 0,
  parameter        SPARE_BIT2 = 0,
  parameter        SPARE_BIT3 = 0,
  parameter        SPARE_BIT4 = 0,
  parameter        SPARE_BIT5 = 0,
  parameter        SPARE_BIT6 = 0,
  parameter        SPARE_BIT7 = 0,
  parameter        SPARE_BIT8 = 0,
  parameter        SPARE_BYTE0 = 8'h00,
  parameter        SPARE_BYTE1 = 8'h00,
  parameter        SPARE_BYTE2 = 8'h00,
  parameter        SPARE_BYTE3 = 8'h00,
  parameter        SPARE_WORD0 = 32'h00000000,
  parameter        SPARE_WORD1 = 32'h00000000,
  parameter        SPARE_WORD2 = 32'h00000000,
  parameter        SPARE_WORD3 = 32'h00000000,

  parameter        TL_RBYPASS = "FALSE",
  parameter        TL_TFC_DISABLE = "FALSE",
  parameter        TL_TX_CHECKS_DISABLE = "FALSE",
  parameter        EXIT_LOOPBACK_ON_EI  = "TRUE",
  parameter        UPSTREAM_FACING = "TRUE",
  parameter        UR_INV_REQ = "TRUE",

  parameter        VC_CAP_ID = 16'h0002,
  parameter        VC_CAP_VERSION = 4'h1,
  parameter        VSEC_CAP_HDR_ID = 16'h1234,
  parameter        VSEC_CAP_HDR_LENGTH = 12'h018,
  parameter        VSEC_CAP_HDR_REVISION = 4'h1,
  parameter        VSEC_CAP_ID = 16'h000b,
  parameter        VSEC_CAP_IS_LINK_VISIBLE = "TRUE",
  parameter        VSEC_CAP_VERSION = 4'h1
)
(
  //-------------------------------------------------------
  // 1. PCI Express (pci_exp) Interface
  //-------------------------------------------------------

  // Tx
  output  [(LINK_CAP_MAX_LINK_WIDTH - 1):0]     pci_exp_txp,
  output  [(LINK_CAP_MAX_LINK_WIDTH - 1):0]     pci_exp_txn,

  // Rx
  input   [(LINK_CAP_MAX_LINK_WIDTH - 1):0]     pci_exp_rxp,
  input   [(LINK_CAP_MAX_LINK_WIDTH - 1):0]     pci_exp_rxn,

  //-------------------------------------------------------
  // 2. AXI-S Interface
  //-------------------------------------------------------

  // Common
  output                                        user_clk_out,
  output                                        user_reset_out,
  output                                        user_lnk_up,

  // Tx
  output  [5:0]                                 tx_buf_av,
  output                                        tx_err_drop,
  output                                        tx_cfg_req,
  output                                        s_axis_tx_tready,
  input  [63:0]                                 s_axis_tx_tdata,
  input  [7:0]                                  s_axis_tx_tstrb,
  input  [3:0]                                  s_axis_tx_tuser,
  input                                         s_axis_tx_tlast,
  input                                         s_axis_tx_tvalid,
  input                                         tx_cfg_gnt,

  // Rx
  output  [63:0]                                m_axis_rx_tdata,
  output  [7:0]                                 m_axis_rx_tstrb,
  output                                        m_axis_rx_tlast,
  output                                        m_axis_rx_tvalid,
  input                                         m_axis_rx_tready,
  output    [21:0]                              m_axis_rx_tuser,
  input                                         rx_np_ok,

  // Flow Control
  output [11:0]                                 fc_cpld,
  output  [7:0]                                 fc_cplh,
  output [11:0]                                 fc_npd,
  output  [7:0]                                 fc_nph,
  output [11:0]                                 fc_pd,
  output  [7:0]                                 fc_ph,
  input   [2:0]                                 fc_sel,


  //-------------------------------------------------------
  // 3. Configuration (CFG) Interface
  //-------------------------------------------------------

  output [31:0]                                 cfg_do,
  output                                        cfg_rd_wr_done,
  input  [31:0]                                 cfg_di,
  input   [3:0]                                 cfg_byte_en,
  input   [9:0]                                 cfg_dwaddr,
  input                                         cfg_wr_en,
  input                                         cfg_rd_en,

  input                                         cfg_err_cor,
  input                                         cfg_err_ur,
  input                                         cfg_err_ecrc,
  input                                         cfg_err_cpl_timeout,
  input                                         cfg_err_cpl_abort,
  input                                         cfg_err_cpl_unexpect,
  input                                         cfg_err_posted,
  input                                         cfg_err_locked,
  input  [47:0]                                 cfg_err_tlp_cpl_header,
  output                                        cfg_err_cpl_rdy,
  input                                         cfg_interrupt,
  output                                        cfg_interrupt_rdy,
  input                                         cfg_interrupt_assert,
  input  [7:0]                                  cfg_interrupt_di,
  output [7:0]                                  cfg_interrupt_do,
  output [2:0]                                  cfg_interrupt_mmenable,
  output                                        cfg_interrupt_msienable,
  output                                        cfg_interrupt_msixenable,
  output                                        cfg_interrupt_msixfm,
  input                                         cfg_turnoff_ok,
  output                                        cfg_to_turnoff,
  input                                         cfg_trn_pending,
  input                                         cfg_pm_wake,
  output  [7:0]                                 cfg_bus_number,
  output  [4:0]                                 cfg_device_number,
  output  [2:0]                                 cfg_function_number,
  output [15:0]                                 cfg_status,
  output [15:0]                                 cfg_command,
  output [15:0]                                 cfg_dstatus,
  output [15:0]                                 cfg_dcommand,
  output [15:0]                                 cfg_lstatus,
  output [15:0]                                 cfg_lcommand,
  output [15:0]                                 cfg_dcommand2,
  output  [2:0]                                 cfg_pcie_link_state,
  input  [63:0]                                 cfg_dsn,
  output                                        cfg_pmcsr_pme_en,
  output                                        cfg_pmcsr_pme_status,
  output  [1:0]                                 cfg_pmcsr_powerstate,

  //-------------------------------------------------------
  // 4. Physical Layer Control and Status (PL) Interface
  //-------------------------------------------------------

  output [2:0]                                  pl_initial_link_width,
  output [1:0]                                  pl_lane_reversal_mode,
  output                                        pl_link_gen2_capable,
  output                                        pl_link_partner_gen2_supported,
  output                                        pl_link_upcfg_capable,
  output [5:0]                                  pl_ltssm_state,
  output                                        pl_received_hot_rst,
  output                                        pl_sel_link_rate,
  output [1:0]                                  pl_sel_link_width,
  input                                         pl_directed_link_auton,
  input  [1:0]                                  pl_directed_link_change,
  input                                         pl_directed_link_speed,
  input  [1:0]                                  pl_directed_link_width,
  input                                         pl_upstream_prefer_deemph,

  //-------------------------------------------------------
  // 5. System  (SYS) Interface
  //-------------------------------------------------------

  input                                         sys_clk,
  input                                         sys_reset


);

endmodule
