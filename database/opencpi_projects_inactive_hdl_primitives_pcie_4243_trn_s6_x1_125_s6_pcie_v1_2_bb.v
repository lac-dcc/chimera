//-----------------------------------------------------------------------------
//
// (c) Copyright 2008, 2009 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information of Xilinx, Inc.
// and is protected under U.S. and international copyright and other
// intellectual property laws.
//
// DISCLAIMER
//
// This disclaimer is not a license and does not grant any rights to the
// materials distributed herewith. Except as otherwise provided in a valid
// license issued to you by Xilinx, and to the maximum extent permitted by
// applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
// FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
// IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
// MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
// and (2) Xilinx shall not be liable (whether in contract or tort, including
// negligence, or under any other theory of liability) for any loss or damage
// of any kind or nature related to, arising under or in connection with these
// materials, including for any direct, or any indirect, special, incidental,
// or consequential loss or damage (including loss of data, profits, goodwill,
// or any type of loss or damage suffered as a result of any action brought by
// a third party) even if such damage or loss was reasonably foreseeable or
// Xilinx had been advised of the possibility of the same.
//
// CRITICAL APPLICATIONS
//
// Xilinx products are not designed or intended to be fail-safe, or for use in
// any application requiring fail-safe performance, such as life-support or
// safety devices or systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any other
// applications that could lead to death, personal injury, or severe property
// or environmental damage (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and liability of any use of
// Xilinx products in Critical Applications, subject only to applicable laws
// and regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
// AT ALL TIMES.
//
//-----------------------------------------------------------------------------
// Project    : Spartan-6 Integrated Block for PCI Express
// File       : s6_pcie_v1_2.v
// Description: Spartan-6 solution wrapper : Endpoint for PCI Express
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ns

(* CORE_GENERATION_INFO = "s6_pcie_v1_2,s6_pcie_v1_2,{TL_TX_RAM_RADDR_LATENCY=0,TL_TX_RAM_RDATA_LATENCY=2,TL_RX_RAM_RADDR_LATENCY=0,TL_RX_RAM_RDATA_LATENCY=2,TL_RX_RAM_WRITE_LATENCY=0,VC0_TX_LASTPACKET=14,VC0_RX_RAM_LIMIT=7FF,VC0_TOTAL_CREDITS_PH=32,VC0_TOTAL_CREDITS_PD=211,VC0_TOTAL_CREDITS_NPH=8,VC0_TOTAL_CREDITS_CH=40,VC0_TOTAL_CREDITS_CD=211,VC0_CPL_INFINITE=TRUE,BAR0=FF000000,BAR1=FFFF0000,BAR2=00000000,BAR3=00000000,BAR4=00000000,BAR5=00000000,EXPANSION_ROM=000000,USR_CFG=FALSE,USR_EXT_CFG=FALSE,DEV_CAP_MAX_PAYLOAD_SUPPORTED=2,CLASS_CODE=050000,CARDBUS_CIS_POINTER=00000000,PCIE_CAP_CAPABILITY_VERSION=1,PCIE_CAP_DEVICE_PORT_TYPE=0,DEV_CAP_PHANTOM_FUNCTIONS_SUPPORT=0,DEV_CAP_EXT_TAG_SUPPORTED=FALSE,DEV_CAP_ENDPOINT_L0S_LATENCY=7,DEV_CAP_ENDPOINT_L1_LATENCY=7,LINK_CAP_ASPM_SUPPORT=1,MSI_CAP_MULTIMSGCAP=0,MSI_CAP_MULTIMSG_EXTENSION=0,LINK_STATUS_SLOT_CLOCK_CONFIG=FALSE,ENABLE_RX_TD_ECRC_TRIM=FALSE,DISABLE_SCRAMBLING=FALSE,PM_CAP_DSI=FALSE,PM_CAP_D1SUPPORT=TRUE,PM_CAP_D2SUPPORT=TRUE,PM_CAP_PMESUPPORT=0F,PM_DATA0=00,PM_DATA_SCALE0=0,PM_DATA1=00,PM_DATA_SCALE1=0,PM_DATA2=00,PM_DATA_SCALE2=0,PM_DATA3=00,PM_DATA_SCALE3=0,PM_DATA4=00,PM_DATA_SCALE4=0,PM_DATA5=00,PM_DATA_SCALE5=0,PM_DATA6=00,PM_DATA_SCALE6=0,PM_DATA7=00,PM_DATA_SCALE7=0,PCIE_GENERIC=000010101111,GTP_SEL=0,CFG_VEN_ID=10EE,CFG_DEV_ID=4243,CFG_REV_ID=02,CFG_SUBSYS_VEN_ID=10EE,CFG_SUBSYS_ID=0007,REF_CLK_FREQ=1}" *)
(* box_type="user_black_box" *)
module s6_pcie_v1_2
 #(
  parameter   [0:0] TL_TX_RAM_RADDR_LATENCY           = 0,
  parameter   [1:0] TL_TX_RAM_RDATA_LATENCY           = 2,
  parameter   [0:0] TL_RX_RAM_RADDR_LATENCY           = 0,
  parameter   [1:0] TL_RX_RAM_RDATA_LATENCY           = 2,
  parameter   [0:0] TL_RX_RAM_WRITE_LATENCY           = 0,
  parameter   [4:0] VC0_TX_LASTPACKET                 = 14,
  parameter  [11:0] VC0_RX_RAM_LIMIT                  = 12'h7FF,
  parameter   [6:0] VC0_TOTAL_CREDITS_PH              = 32,
  parameter  [10:0] VC0_TOTAL_CREDITS_PD              = 211,
  parameter   [6:0] VC0_TOTAL_CREDITS_NPH             = 8,
  parameter   [6:0] VC0_TOTAL_CREDITS_CH              = 40,
  parameter  [10:0] VC0_TOTAL_CREDITS_CD              = 211,
  parameter         VC0_CPL_INFINITE                  = "TRUE",
  parameter  [31:0] BAR0                              = 32'hFF000000,
  parameter  [31:0] BAR1                              = 32'hFFFF0000,
  parameter  [31:0] BAR2                              = 32'h00000000,
  parameter  [31:0] BAR3                              = 32'h00000000,
  parameter  [31:0] BAR4                              = 32'h00000000,
  parameter  [31:0] BAR5                              = 32'h00000000,
  parameter  [21:0] EXPANSION_ROM                     = 22'h000000,
  parameter         DISABLE_BAR_FILTERING             = "FALSE",
  parameter         DISABLE_ID_CHECK                  = "FALSE",
  parameter         TL_TFC_DISABLE                    = "FALSE",
  parameter         TL_TX_CHECKS_DISABLE              = "FALSE",
  parameter         USR_CFG                           = "FALSE",
  parameter         USR_EXT_CFG                       = "FALSE",
  parameter   [2:0] DEV_CAP_MAX_PAYLOAD_SUPPORTED     = 3'd2,
  parameter  [23:0] CLASS_CODE                        = 24'h050000,
  parameter  [31:0] CARDBUS_CIS_POINTER               = 32'h00000000,
  parameter   [3:0] PCIE_CAP_CAPABILITY_VERSION       = 4'h1,
  parameter   [3:0] PCIE_CAP_DEVICE_PORT_TYPE         = 4'h0,
  parameter         PCIE_CAP_SLOT_IMPLEMENTED         = "FALSE",
  parameter   [4:0] PCIE_CAP_INT_MSG_NUM              = 5'b00000,
  parameter   [1:0] DEV_CAP_PHANTOM_FUNCTIONS_SUPPORT = 2'd0,
  parameter         DEV_CAP_EXT_TAG_SUPPORTED         = "FALSE",
  parameter   [2:0] DEV_CAP_ENDPOINT_L0S_LATENCY      = 3'd7,
  parameter   [2:0] DEV_CAP_ENDPOINT_L1_LATENCY       = 3'd7,
  parameter         SLOT_CAP_ATT_BUTTON_PRESENT       = "FALSE",
  parameter         SLOT_CAP_ATT_INDICATOR_PRESENT    = "FALSE",
  parameter         SLOT_CAP_POWER_INDICATOR_PRESENT  = "FALSE",
  parameter         DEV_CAP_ROLE_BASED_ERROR          = "TRUE",
  parameter   [1:0] LINK_CAP_ASPM_SUPPORT             = 2'd1,
  parameter   [2:0] LINK_CAP_L0S_EXIT_LATENCY         = 3'd7,
  parameter   [2:0] LINK_CAP_L1_EXIT_LATENCY          = 3'd7,
  parameter  [14:0] LL_ACK_TIMEOUT                    = 15'h0000,
  parameter         LL_ACK_TIMEOUT_EN                 = "FALSE",
  parameter  [14:0] LL_REPLAY_TIMEOUT                 = 15'h0000,
  parameter         LL_REPLAY_TIMEOUT_EN              = "FALSE",
  parameter   [2:0] MSI_CAP_MULTIMSGCAP               = 3'd0,
  parameter   [0:0] MSI_CAP_MULTIMSG_EXTENSION        = 1'd0,
  parameter         LINK_STATUS_SLOT_CLOCK_CONFIG     = "FALSE",
  parameter         PLM_AUTO_CONFIG                   = "FALSE",
  parameter         FAST_TRAIN                        = "FALSE",
  parameter         ENABLE_RX_TD_ECRC_TRIM            = "FALSE",
  parameter         DISABLE_SCRAMBLING                = "FALSE",
  parameter   [2:0] PM_CAP_VERSION                    = 3'd3,
  parameter         PM_CAP_PME_CLOCK                  = "FALSE",
  parameter         PM_CAP_DSI                        = "FALSE",
  parameter   [2:0] PM_CAP_AUXCURRENT                 = 3'd0,
  parameter         PM_CAP_D1SUPPORT                  = "TRUE",
  parameter         PM_CAP_D2SUPPORT                  = "TRUE",
  parameter   [4:0] PM_CAP_PMESUPPORT                 = 5'h0F,
  parameter   [7:0] PM_DATA0                          = 8'h00,
  parameter   [1:0] PM_DATA_SCALE0                    = 2'h0,
  parameter   [7:0] PM_DATA1                          = 8'h00,
  parameter   [1:0] PM_DATA_SCALE1                    = 2'h0,
  parameter   [7:0] PM_DATA2                          = 8'h00,
  parameter   [1:0] PM_DATA_SCALE2                    = 2'h0,
  parameter   [7:0] PM_DATA3                          = 8'h00,
  parameter   [1:0] PM_DATA_SCALE3                    = 2'h0,
  parameter   [7:0] PM_DATA4                          = 8'h00,
  parameter   [1:0] PM_DATA_SCALE4                    = 2'h0,
  parameter   [7:0] PM_DATA5                          = 8'h00,
  parameter   [1:0] PM_DATA_SCALE5                    = 2'h0,
  parameter   [7:0] PM_DATA6                          = 8'h00,
  parameter   [1:0] PM_DATA_SCALE6                    = 2'h0,
  parameter   [7:0] PM_DATA7                          = 8'h00,
  parameter   [1:0] PM_DATA_SCALE7                    = 2'h0,
  parameter  [11:0] PCIE_GENERIC                      = 12'b000011101111,
  parameter   [0:0] GTP_SEL                           = 1'b0,
  parameter  [15:0] CFG_VEN_ID                        = 16'h10EE,
  parameter  [15:0] CFG_DEV_ID                        = 16'h4243,
  parameter   [7:0] CFG_REV_ID                        = 8'h02,
  parameter  [15:0] CFG_SUBSYS_VEN_ID                 = 16'h10EE,
  parameter  [15:0] CFG_SUBSYS_ID                     = 16'h0007,
  parameter         REF_CLK_FREQ                      = 1) (
  // PCI Express Fabric Interface
  output            pci_exp_txp,
  output            pci_exp_txn,
  input             pci_exp_rxp,
  input             pci_exp_rxn,

  // Transaction (TRN) Interface
  output            trn_lnk_up_n,

  // Tx
  input      [31:0] trn_td,
  input             trn_tsof_n,
  input             trn_teof_n,
  input             trn_tsrc_rdy_n,
  output            trn_tdst_rdy_n,
  output            trn_terr_drop_n,
  input             trn_tsrc_dsc_n,
  input             trn_terrfwd_n,
  output      [5:0] trn_tbuf_av,
  input             trn_tstr_n,
  output            trn_tcfg_req_n,
  input             trn_tcfg_gnt_n,

  // Rx
  output     [31:0] trn_rd,
  output            trn_rsof_n,
  output            trn_reof_n,
  output            trn_rsrc_rdy_n,
  output            trn_rsrc_dsc_n,
  input             trn_rdst_rdy_n,
  output            trn_rerrfwd_n,
  input             trn_rnp_ok_n,
  output      [6:0] trn_rbar_hit_n,
  input       [2:0] trn_fc_sel,
  output      [7:0] trn_fc_nph,
  output     [11:0] trn_fc_npd,
  output      [7:0] trn_fc_ph,
  output     [11:0] trn_fc_pd,
  output      [7:0] trn_fc_cplh,
  output     [11:0] trn_fc_cpld,

  // Host (CFG) Interface
  output     [31:0] cfg_do,
  output            cfg_rd_wr_done_n,
  input       [9:0] cfg_dwaddr,
  input             cfg_rd_en_n,
  input             cfg_err_ur_n,
  input             cfg_err_cor_n,
  input             cfg_err_ecrc_n,
  input             cfg_err_cpl_timeout_n,
  input             cfg_err_cpl_abort_n,
  input             cfg_err_posted_n,
  input             cfg_err_locked_n,
  input      [47:0] cfg_err_tlp_cpl_header,
  output            cfg_err_cpl_rdy_n,
  input             cfg_interrupt_n,
  output            cfg_interrupt_rdy_n,
  input             cfg_interrupt_assert_n,
  output      [7:0] cfg_interrupt_do,
  input       [7:0] cfg_interrupt_di,
  output      [2:0] cfg_interrupt_mmenable,
  output            cfg_interrupt_msienable,
  input             cfg_turnoff_ok_n,
  output            cfg_to_turnoff_n,
  input             cfg_pm_wake_n,
  output      [2:0] cfg_pcie_link_state_n,
  input             cfg_trn_pending_n,
  input      [63:0] cfg_dsn,
  output      [7:0] cfg_bus_number,
  output      [4:0] cfg_device_number,
  output      [2:0] cfg_function_number,
  output     [15:0] cfg_status,
  output     [15:0] cfg_command,
  output     [15:0] cfg_dstatus,
  output     [15:0] cfg_dcommand,
  output     [15:0] cfg_lstatus,
  output     [15:0] cfg_lcommand,

  // System Interface
  input             sys_clk,
  input             sys_reset_n,
  output            trn_clk,
  output            trn_reset_n,
  output            received_hot_reset
  );
endmodule
