// This program was cloned from: https://github.com/lnls-dig/infra-cores
// License: GNU Lesser General Public License v3.0

//-----------------------------------------------------------------------------
//
// (c) Copyright 2010-2011 Xilinx, Inc. All rights reserved.
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
// Project    : Series-7 Integrated Block for PCI Express
// File       : xilinx_pcie_2_1_rport_7x.v
// Version    : 3.1
//
//--------------------------------------------------------------------------------

`timescale 1ns / 1ps

`include "board_common.vh"

module xilinx_pcie_2_1_rport_7x # (


  parameter                       REF_CLK_FREQ = 0,                                   // 0 - 100 MHz, 1 - 125 MHz,  2 - 250 MHz
  parameter                       PCIE_EXT_CLK = "FALSE", // Use External Clocking Module	//postsynthsim changes
  parameter                       PL_FAST_TRAIN = "FALSE",
  parameter                       ALLOW_X8_GEN2 = "FALSE",
  parameter                       C_DATA_WIDTH = 64,
  parameter                       REM_WIDTH  = (C_DATA_WIDTH == 128) ? 2 : 1,
  parameter                       KEEP_WIDTH = C_DATA_WIDTH / 8,
  parameter                       LINK_CAP_MAX_LINK_WIDTH = 6'h08,
  parameter                       DEVICE_ID = 16'h506F,
  parameter                       LINK_CAP_MAX_LINK_SPEED = 4'h2,
  parameter                       LINK_CTRL2_TARGET_LINK_SPEED = 4'h1,
  parameter                       DEV_CAP_MAX_PAYLOAD_SUPPORTED = 1,
  parameter                       USER_CLK_FREQ = 3,
  parameter                       USER_CLK2_DIV2 = "FALSE",
  parameter                       TRN_DW = "FALSE",
  parameter                       VC0_TX_LASTPACKET = 28,
  parameter                       VC0_RX_RAM_LIMIT = 13'h03ff,
  parameter                       VC0_CPL_INFINITE = "TRUE",
  parameter                       VC0_TOTAL_CREDITS_PD = 154,
  parameter                       VC0_TOTAL_CREDITS_CD = 154

)
(

  input                           sys_clk,
  input                           sys_rst_n,

  input  [3:0]              pci_exp_rxn, pci_exp_rxp,
  output [3:0]              pci_exp_txn, pci_exp_txp

);

  // Local Wires
  // Common
  wire                            trn_clk;
  wire                            user_reset_out;
  wire                            trn_reset_n;
  wire                            trn_lnk_up;

  // Tx
  wire  [C_DATA_WIDTH-1:0]        trn_td;
  wire  [REM_WIDTH-1:0]           trn_trem_n;
  wire                            trn_tsof_n;
  wire                            trn_teof_n;
  wire                            trn_tsrc_rdy_n;
  wire                            trn_tdst_rdy;
  wire                            trn_tsrc_dsc_n;
  wire                            trn_terrfwd_n;
  wire                            trn_tdst_dsc;
  wire  [5:0]                    	trn_tbuf_av;

  // Rx
  wire  [C_DATA_WIDTH-1:0]        trn_rd;
  wire  [REM_WIDTH-1:0]           trn_rrem;
  wire                            trn_rsof;
  wire                            trn_reof;
  wire                            trn_rsrc_rdy;
  wire                            trn_rsrc_dsc;
  wire                            trn_rdst_rdy_n;
  wire                            trn_rerrfwd;
  wire                            trn_rnp_ok_n;
  wire [6:0]                	    trn_rbar_hit;
  wire [7:0]                	    trn_rfc_nph_av;
  wire [11:0]               	    trn_rfc_npd_av;
  wire [7:0]                	    trn_rfc_ph_av;
  wire [11:0]               	    trn_rfc_pd_av;
  wire [7:0]                	    trn_rfc_cplh_av;
  wire [11:0]               	    trn_rfc_cpld_av;

  wire [31:0]               	    cfg_do;
  wire [31:0]               	    cfg_di;
  wire [3:0]             		      cfg_byte_en_n;
  wire [9:0]               	      cfg_dwaddr;
  wire [47:0]               	    cfg_err_tlp_cpl_header;
  wire                            cfg_wr_en_n;
  wire                            cfg_rd_wr_done;
  wire                            cfg_rd_en_n;
  wire                            cfg_err_cor_n;
  wire                            cfg_err_ur_n;
  wire                            cfg_err_ecrc_n;
  wire                            cfg_err_cpl_timeout_n;
  wire                            cfg_err_cpl_abort_n;
  wire                            cfg_err_cpl_unexpect_n;
  wire                            cfg_err_posted_n;
  wire                            cfg_interrupt_n;
  wire                            cfg_interrupt_rdy;
  wire [15:0]               	    cfg_status;
  wire [15:0]               	    cfg_command;
  wire [15:0]               	    cfg_dstatus;
  wire [15:0]               	    cfg_dcommand;
  wire [15:0]               	    cfg_lstatus;
  wire [15:0]               	    cfg_lcommand;
  wire                            cfg_rdy_n;
  wire [2:0]                	    cfg_pcie_link_state;
  wire                            cfg_trn_pending_n;

  wire [2:0]                      pl_initial_link_width;
  wire [1:0]                      pl_lane_reversal_mode;
  wire                            pl_link_gen2_capable;
  wire                            pl_link_partner_gen2_supported;
  wire                            pl_link_upcfg_capable;
  wire [5:0]                      pl_ltssm_state;
  wire                            pl_sel_link_rate;
  wire [1:0]                      pl_sel_link_width;
  wire                            pl_directed_link_auton;
  wire [1:0]                      pl_directed_link_change;
  wire                            pl_directed_link_speed;
  wire [1:0]                      pl_directed_link_width;
  wire                            pl_upstream_prefer_deemph;

  wire                            speed_change_done_n;

  wire                            trn_tstr;
  wire                            trn_tecrc_gen;



  wire [C_DATA_WIDTH-1:0]         s_axis_tx_tdata;
  wire                            s_axis_tx_tvalid;
  wire                            s_axis_tx_tready;
  wire   [KEEP_WIDTH-1:0]         s_axis_tx_tkeep;
  wire                            s_axis_tx_tlast;
  wire              [3:0]         s_axis_tx_tuser;

  wire [C_DATA_WIDTH-1:0]         m_axis_rx_tdata;
  wire                            m_axis_rx_tvalid;
  wire                            m_axis_rx_tready;
  wire   [KEEP_WIDTH-1:0]         m_axis_rx_tkeep;
  wire                            m_axis_rx_tlast;
  wire             [21:0]         m_axis_rx_tuser;

  // Wires used for external clocking connectivity
  wire                                        pipe_pclk_in;
  wire                                        pipe_rxusrclk_in;
  wire  [3:0]    pipe_rxoutclk_in;
  wire                                        pipe_dclk_in;
  wire                                        pipe_userclk1_in;
  wire                                        pipe_userclk2_in;
  wire                                        pipe_mmcm_lock_in;

  wire                                        pipe_txoutclk_out;
  wire [3:0]     pipe_rxoutclk_out;
  wire [3:0]     pipe_pclk_sel_out;
  wire                                        pipe_gen3_out;
  wire                                        pipe_oobclk_in;

  assign trn_reset_n = !user_reset_out;

  // PCI-Express FPGA Endpoint Instance

  pcie_2_1_rport_7x # (

    .REF_CLK_FREQ                              ( REF_CLK_FREQ ),
    .PCIE_EXT_CLK                              ( PCIE_EXT_CLK ),
    .PL_FAST_TRAIN                             ( PL_FAST_TRAIN ),
    .ALLOW_X8_GEN2                             ( ALLOW_X8_GEN2 ),
    .C_DATA_WIDTH                              ( C_DATA_WIDTH ),
    .LINK_CAP_MAX_LINK_WIDTH                   ( LINK_CAP_MAX_LINK_WIDTH ),
    .LINK_CAP_MAX_LINK_SPEED                   ( LINK_CAP_MAX_LINK_SPEED ),
    .LINK_CTRL2_TARGET_LINK_SPEED              ( LINK_CTRL2_TARGET_LINK_SPEED ),
    .DEV_CAP_MAX_PAYLOAD_SUPPORTED             ( DEV_CAP_MAX_PAYLOAD_SUPPORTED ),
    .USER_CLK_FREQ                             ( USER_CLK_FREQ ),
    .USER_CLK2_DIV2                            ( USER_CLK2_DIV2 ),
    .TRN_DW                                    ( TRN_DW ),
    .VC0_TX_LASTPACKET                         ( VC0_TX_LASTPACKET ),
    .VC0_RX_RAM_LIMIT                          ( VC0_RX_RAM_LIMIT ),
    .VC0_CPL_INFINITE                          ( VC0_CPL_INFINITE ),
    .VC0_TOTAL_CREDITS_PD                      ( VC0_TOTAL_CREDITS_PD ),
    .VC0_TOTAL_CREDITS_CD                      ( VC0_TOTAL_CREDITS_CD )

  ) rport (

    //----------------------------------------------------------------------------------------------------------------//
    // 1. PCI Express (pci_exp) Interface                                                                             //
    //----------------------------------------------------------------------------------------------------------------//


    .pci_exp_txp                               ( pci_exp_txp ),
    .pci_exp_txn                               ( pci_exp_txn ),
    .pci_exp_rxp                               ( pci_exp_rxp ),
    .pci_exp_rxn                               ( pci_exp_rxn ),

    //----------------------------------------------------------------------------------------------------------------//
    // 2. Clocking Interface - For Partial Reconfig Support                                                           //
    //----------------------------------------------------------------------------------------------------------------//
    .pipe_pclk_in                              ( pipe_pclk_in ),
    .pipe_rxusrclk_in                          ( pipe_rxusrclk_in ),
    .pipe_rxoutclk_in                          ( pipe_rxoutclk_in ),
    .pipe_dclk_in                              ( pipe_dclk_in ),
    .pipe_userclk1_in                          ( pipe_userclk1_in ),
    .pipe_userclk2_in                          ( pipe_userclk2_in ),
    .pipe_oobclk_in                            ( pipe_oobclk_in ),
    .pipe_mmcm_lock_in                         ( pipe_mmcm_lock_in ),

    .pipe_txoutclk_out                         ( pipe_txoutclk_out ),
    .pipe_rxoutclk_out                         ( pipe_rxoutclk_out ),
    .pipe_pclk_sel_out                         ( pipe_pclk_sel_out ),
    .pipe_gen3_out                             ( pipe_gen3_out ),

    //----------------------------------------------------------------------------------------------------------------//
    // 3. AXI-S Interface                                                                                             //
    //----------------------------------------------------------------------------------------------------------------//


    .user_clk_out                              ( trn_clk ),
    .user_reset_out                            ( user_reset_out ),
    .user_lnk_up                               ( trn_lnk_up ),

    // Tx
    .tx_buf_av                                 ( trn_tbuf_av ),
    .tx_cfg_req                                ( ),
    .tx_err_drop                               ( trn_tdst_dsc ),
    .tx_cfg_gnt                                ( 1'b1 ),

    .s_axis_tx_tdata                           ( s_axis_tx_tdata ),
    .s_axis_tx_tvalid                          ( s_axis_tx_tvalid ),
    .s_axis_tx_tready                          ( s_axis_tx_tready ),
    .s_axis_tx_tkeep                           ( s_axis_tx_tkeep ),
    .s_axis_tx_tlast                           ( s_axis_tx_tlast ),
    .s_axis_tx_tuser                           ( s_axis_tx_tuser ),

    // Rx
    .m_axis_rx_tdata                           ( m_axis_rx_tdata ),
    .m_axis_rx_tvalid                          ( m_axis_rx_tvalid ),
    .m_axis_rx_tready                          ( m_axis_rx_tready ),
    .m_axis_rx_tkeep                           ( m_axis_rx_tkeep ),
    .m_axis_rx_tlast                           ( m_axis_rx_tlast ),
    .m_axis_rx_tuser                           ( m_axis_rx_tuser ),
    .rx_np_ok                                  ( 1'b1 ),
    .rx_np_req                                 ( 1'b1 ),

    .fc_cpld                                   ( ),
    .fc_cplh                                   ( ),
    .fc_npd                                    ( ),
    .fc_nph                                    ( ),
    .fc_pd                                     ( ),
    .fc_ph                                     ( ),
    .fc_sel                                    ( 3'b0 ),

    //----------------------------------------------------------------------------------------------------------------//
    // 4. Configuration (CFG) Interface                                                                               //
    //----------------------------------------------------------------------------------------------------------------//


    .cfg_status                                 ( cfg_status ),
    .cfg_command                                ( cfg_command ),
    .cfg_dstatus                                ( cfg_dstatus ),
    .cfg_dcommand                               ( cfg_dcommand ),
    .cfg_lstatus                                ( cfg_lstatus ),
    .cfg_lcommand                               ( cfg_lcommand ),
    .cfg_dcommand2                              ( ),
    .cfg_pcie_link_state                        ( cfg_pcie_link_state ),

    .cfg_pmcsr_pme_en                           ( ),
    .cfg_pmcsr_pme_status                       ( ),
    .cfg_pmcsr_powerstate                       ( ),
    .cfg_received_func_lvl_rst                  ( ),

    .cfg_mgmt_do                                ( cfg_do ),
    .cfg_mgmt_rd_wr_done                        ( cfg_rd_wr_done ),
    .cfg_mgmt_di                                ( cfg_di ),
    .cfg_mgmt_byte_en                           ( ~cfg_byte_en_n ),
    .cfg_mgmt_dwaddr                            ( cfg_dwaddr ),
    .cfg_mgmt_wr_en                             ( ~cfg_wr_en_n ),
    .cfg_mgmt_rd_en                             ( ~cfg_rd_en_n ),
    .cfg_mgmt_wr_readonly                       ( 1'b0 ),

    .cfg_err_ecrc                               ( ~cfg_err_ecrc_n ),
    .cfg_err_ur                                 ( ~cfg_err_ur_n ),
    .cfg_err_cpl_timeout                        ( ~cfg_err_cpl_timeout_n ),
    .cfg_err_cpl_unexpect                       ( ~cfg_err_cpl_unexpect_n ),
    .cfg_err_cpl_abort                          ( ~cfg_err_cpl_abort_n ),
    .cfg_err_posted                             ( ~cfg_err_posted_n ),
    .cfg_err_cor                                ( ~cfg_err_cor_n ),

    .cfg_err_atomic_egress_blocked              ( 1'b0 ),
    .cfg_err_internal_cor                       ( 1'b0 ),
    .cfg_err_malformed                          ( 1'b0 ),
    .cfg_err_mc_blocked                         ( 1'b0 ),
    .cfg_err_poisoned                           ( 1'b0 ),
    .cfg_err_norecovery                         ( 1'b0 ),
    .cfg_err_tlp_cpl_header                     ( cfg_err_tlp_cpl_header ),
    .cfg_err_cpl_rdy                            ( ),
    .cfg_err_locked                             ( 1'b0 ),
    .cfg_err_acs                                ( 1'b0 ),
    .cfg_err_internal_uncor                     ( 1'b0 ),
    .cfg_trn_pending                            ( ~cfg_trn_pending_n ),

    .cfg_pm_halt_aspm_l0s                       ( 1'b0 ),
    .cfg_pm_halt_aspm_l1                        ( 1'b0 ),

    .cfg_pm_force_state_en                      ( 1'b0 ),
    .cfg_pm_force_state                         ( 2'b00 ),

    .cfg_dsn                                    ( 64'h0 ),
    .cfg_msg_received                           ( ),
    .cfg_msg_data                               ( ),

    .cfg_interrupt                              ( 1'b0 ),
    .cfg_interrupt_rdy                          ( ),
    .cfg_interrupt_assert                       ( 1'b0 ),
    .cfg_interrupt_di                           ( 8'h0 ),

    .cfg_interrupt_do                           ( ),
    .cfg_interrupt_mmenable                     ( ),
    .cfg_interrupt_msienable                    ( ),
    .cfg_interrupt_msixenable                   ( ),
    .cfg_interrupt_msixfm                       ( ),
    .cfg_interrupt_stat                         ( 1'b0 ),
    .cfg_pciecap_interrupt_msgnum               ( 5'h00 ),

    .cfg_to_turnoff                             ( ),
    .cfg_turnoff_ok                             ( 1'b0 ),
    .cfg_bus_number                             ( ),
    .cfg_device_number                          ( ),
    .cfg_function_number                        ( ),
    .cfg_pm_wake                                ( 1'b0 ),
    .cfg_msg_received_pm_as_nak                 ( ),
    .cfg_msg_received_setslotpowerlimit         ( ),

    .cfg_pm_send_pme_to                         ( 1'b0 ),
    .cfg_ds_bus_number                          ( 8'h0 ),
    .cfg_ds_device_number                       ( 5'h0 ),
    .cfg_ds_function_number                     ( 3'b000 ),

    .cfg_mgmt_wr_rw1c_as_rw                     ( 1'b0 ),

    .cfg_bridge_serr_en                         ( ),
    .cfg_slot_control_electromech_il_ctl_pulse  ( ),
    .cfg_root_control_syserr_corr_err_en        ( ),
    .cfg_root_control_syserr_non_fatal_err_en   ( ),
    .cfg_root_control_syserr_fatal_err_en       ( ),
    .cfg_root_control_pme_int_en                ( ),
    .cfg_aer_rooterr_corr_err_reporting_en      ( ),
    .cfg_aer_rooterr_non_fatal_err_reporting_en ( ),
    .cfg_aer_rooterr_fatal_err_reporting_en     ( ),
    .cfg_aer_rooterr_corr_err_received          ( ),
    .cfg_aer_rooterr_non_fatal_err_received     ( ),
    .cfg_aer_rooterr_fatal_err_received         ( ),

    .cfg_msg_received_err_cor                   ( ),
    .cfg_msg_received_err_non_fatal             ( ),
    .cfg_msg_received_err_fatal                 ( ),
    .cfg_msg_received_pm_pme                    ( ),
    .cfg_msg_received_pme_to_ack                ( ),
    .cfg_msg_received_assert_int_a              ( ),
    .cfg_msg_received_assert_int_b              ( ),
    .cfg_msg_received_assert_int_c              ( ),
    .cfg_msg_received_assert_int_d              ( ),
    .cfg_msg_received_deassert_int_a            ( ),
    .cfg_msg_received_deassert_int_b            ( ),
    .cfg_msg_received_deassert_int_c            ( ),
    .cfg_msg_received_deassert_int_d            ( ),

    //----------------------------------------------------------------------------------------------------------------//
    // 5. Physical Layer Control and Status (PL) Interface                                                            //
    //----------------------------------------------------------------------------------------------------------------//

    .pl_directed_link_change                    ( pl_directed_link_change ),
    .pl_directed_link_speed                     ( pl_directed_link_speed ),
    .pl_directed_link_width                     ( pl_directed_link_width ),
    .pl_directed_link_auton                     ( pl_directed_link_auton ),
    .pl_upstream_prefer_deemph                  ( pl_upstream_prefer_deemph ),

    .pl_sel_lnk_rate                            ( pl_sel_link_rate ),
    .pl_sel_lnk_width                           ( pl_sel_link_width ),
    .pl_ltssm_state                             ( pl_ltssm_state ),
    .pl_lane_reversal_mode                      ( pl_lane_reversal_mode ),

    .pl_phy_lnk_up                              ( ),
    .pl_tx_pm_state                             ( ),
    .pl_rx_pm_state                             ( ),

    .pl_link_upcfg_cap                         ( pl_link_upcfg_capable ),
    .pl_link_gen2_cap                          ( pl_link_gen2_capable ),
    .pl_link_partner_gen2_supported            ( pl_link_partner_gen2_supported ),
    .pl_initial_link_width                     ( pl_initial_link_width ),

    .pl_directed_change_done                   ( ),

    .pl_received_hot_rst                       ( ),

    .pl_downstream_deemph_source               ( 1'b0 ),
    .pl_transmit_hot_rst                       ( 1'b0 ),

    //----------------------------------------------------------------------------------------------------------------//
    // 6. AER Interface                                                                                               //
    //----------------------------------------------------------------------------------------------------------------//

    .cfg_err_aer_headerlog                     ( 128'b0 ),
    .cfg_aer_interrupt_msgnum                  ( 5'b0 ),
    .cfg_err_aer_headerlog_set                 ( ),
    .cfg_aer_ecrc_check_en                     ( ),
    .cfg_aer_ecrc_gen_en                       ( ),

    //----------------------------------------------------------------------------------------------------------------//
    // 7. VC interface                                                                                                //
    //----------------------------------------------------------------------------------------------------------------//

    .cfg_vc_tcvc_map                           ( ),

    //----------------------------------------------------------------------------------------------------------------//
    // 8. System  (SYS) Interface                                                                                     //
    //----------------------------------------------------------------------------------------------------------------//
    .common_commands_in           (  4'b0 ), 
    .pipe_rx_0_sigs               ( 25'b0 ), 
    .pipe_rx_1_sigs               ( 25'b0 ), 
    .pipe_rx_2_sigs               ( 25'b0 ), 
    .pipe_rx_3_sigs               ( 25'b0 ), 
    .pipe_rx_4_sigs               ( 25'b0 ), 
    .pipe_rx_5_sigs               ( 25'b0 ), 
    .pipe_rx_6_sigs               ( 25'b0 ), 
    .pipe_rx_7_sigs               ( 25'b0 ), 
                                                       
    .common_commands_out          (  ), 
    .pipe_tx_0_sigs               (  ), 
    .pipe_tx_1_sigs               (  ), 
    .pipe_tx_2_sigs               (  ), 
    .pipe_tx_3_sigs               (  ), 
    .pipe_tx_4_sigs               (  ), 
    .pipe_tx_5_sigs               (  ), 
    .pipe_tx_6_sigs               (  ), 
    .pipe_tx_7_sigs               (  ), 

    .pipe_mmcm_rst_n                           ( 1'b1 ),        // Async      | Async
    .sys_clk                                   ( sys_clk ),
    .sys_rst_n                                 ( sys_rst_n )

  );

// User Application Instances

// Rx User Application Interface

  pci_exp_usrapp_rx # (
     .C_DATA_WIDTH(                      C_DATA_WIDTH)
  ) rx_usrapp (

    .trn_clk                             (trn_clk),
    .trn_reset_n                         (trn_reset_n),
    .trn_lnk_up_n                        (~trn_lnk_up),

    .trn_rd(trn_rd),
    .trn_rrem_n                          ( ~trn_rrem ),
    .trn_rsof_n                          ( ~trn_rsof ),
    .trn_reof_n                          ( ~trn_reof ),
    .trn_rsrc_rdy_n                      ( ~trn_rsrc_rdy ),
    .trn_rsrc_dsc_n                      ( ~trn_rsrc_dsc ),
    .trn_rdst_rdy_n                      ( trn_rdst_rdy_n ),
    .trn_rerrfwd_n                       ( ~trn_rerrfwd ),
    .trn_rnp_ok_n                        ( trn_rnp_ok_n ),
    .trn_rbar_hit_n                      ( ~trn_rbar_hit )
  );

  // Tx User Application Interface
  pci_exp_usrapp_tx # (

    .LINK_CAP_MAX_LINK_SPEED         ( LINK_CAP_MAX_LINK_SPEED )

  ) tx_usrapp (

    .trn_clk                         ( trn_clk ),
    .trn_reset_n                     ( trn_reset_n ),
    .trn_lnk_up_n                    ( ~trn_lnk_up ),

    .trn_td                          ( trn_td ),
    .trn_trem_n                      ( trn_trem_n ),
    .trn_tsof_n                      ( trn_tsof_n ),
    .trn_teof_n                      ( trn_teof_n ),
    .trn_terrfwd_n                   ( trn_terrfwd_n ),
    .trn_tsrc_rdy_n                  ( trn_tsrc_rdy_n ),
    .trn_tdst_rdy_n                  ( ~trn_tdst_rdy ),
    .trn_tsrc_dsc_n                  ( trn_tsrc_dsc_n ),
    .trn_tdst_dsc_n                  ( ~trn_tdst_dsc ),
    .trn_tbuf_av                     ( trn_tbuf_av ),
    .speed_change_done_n             ( speed_change_done_n )

  );

  // Cfg UsrApp

  pci_exp_usrapp_cfg cfg_usrapp (


    .trn_clk                         ( trn_clk ),
    .trn_reset_n                     ( trn_reset_n ),

    .cfg_do                          ( cfg_do ),
    .cfg_di                          ( cfg_di ),
    .cfg_byte_en_n                   ( cfg_byte_en_n ),
    .cfg_dwaddr                      ( cfg_dwaddr ),
    .cfg_wr_en_n                     ( cfg_wr_en_n ),
    .cfg_rd_en_n                     ( cfg_rd_en_n ),
    .cfg_rd_wr_done_n                ( ~cfg_rd_wr_done ),

    .cfg_err_cor_n                   ( cfg_err_cor_n ),
    .cfg_err_ur_n                    ( cfg_err_ur_n ),
    .cfg_err_ecrc_n                  ( cfg_err_ecrc_n ),
    .cfg_err_cpl_timeout_n           ( cfg_err_cpl_timeout_n ),
    .cfg_err_cpl_abort_n             ( cfg_err_cpl_abort_n ),
    .cfg_err_cpl_unexpect_n          ( cfg_err_cpl_unexpect_n ),
    .cfg_err_posted_n                ( cfg_err_posted_n ),
    .cfg_err_tlp_cpl_header          ( cfg_err_tlp_cpl_header ),
    .cfg_interrupt_n                 ( cfg_interrupt_n ),
    .cfg_interrupt_rdy_n             ( ~cfg_interrupt_rdy ),
    .cfg_turnoff_ok_n                ( ),
    .cfg_pm_wake_n                   ( ),
    .cfg_to_turnoff_n                ( 1'b1 ),
    .cfg_bus_number                  ( 8'h0 ),
    .cfg_device_number               ( 5'h0 ),
    .cfg_function_number             ( 3'h0 ),
    .cfg_status                      ( cfg_status ),
    .cfg_command                     ( cfg_command ),
    .cfg_dstatus                     ( cfg_dstatus ),
    .cfg_dcommand                    ( cfg_dcommand ),
    .cfg_lstatus                     ( cfg_lstatus ),
    .cfg_lcommand                    ( cfg_lcommand ),
    .cfg_pcie_link_state_n           ( ~cfg_pcie_link_state ),
    .cfg_trn_pending_n               ( cfg_trn_pending_n )

  );

  // Common UsrApp

  pci_exp_usrapp_com com_usrapp   ();

  // PL UsrApp

  pci_exp_usrapp_pl # (
    .LINK_CAP_MAX_LINK_SPEED         (LINK_CAP_MAX_LINK_SPEED)
  ) pl_usrapp (

    .pl_initial_link_width           ( pl_initial_link_width ),
    .pl_lane_reversal_mode           ( pl_lane_reversal_mode ),
    .pl_link_gen2_capable            ( pl_link_gen2_capable ),
    .pl_link_partner_gen2_supported  ( pl_link_partner_gen2_supported ),
    .pl_link_upcfg_capable           ( pl_link_upcfg_capable ),
    .pl_ltssm_state                  ( pl_ltssm_state ),
    .pl_received_hot_rst             ( 1'b0 ),
    .pl_sel_link_rate                ( pl_sel_link_rate ),
    .pl_sel_link_width               ( pl_sel_link_width ),
    .pl_directed_link_auton          ( pl_directed_link_auton ),
    .pl_directed_link_change         ( pl_directed_link_change ),
    .pl_directed_link_speed          ( pl_directed_link_speed ),
    .pl_directed_link_width          ( pl_directed_link_width ),
    .pl_upstream_prefer_deemph       ( pl_upstream_prefer_deemph ),
    .speed_change_done_n             ( speed_change_done_n),

    .trn_lnk_up_n                    ( ~trn_lnk_up ),
    .trn_clk                         ( trn_clk ),
    .trn_reset_n                     ( trn_reset_n )

  );

  //-------------------------------------------------------------------------------------------------//
  //     PCIe AXI TRN Bridge                                                                         //
  //-------------------------------------------------------------------------------------------------//

  pcie_axi_trn_bridge #(
    .C_DATA_WIDTH                    ( C_DATA_WIDTH )
  ) pcie_axi_trn_bridge_i (
    .user_clk                        ( trn_clk ),
    .user_reset                      ( ~trn_reset_n ),
    .user_lnk_up                     ( trn_lnk_up ),

    .s_axis_tx_tdata                 ( s_axis_tx_tdata ),
    .s_axis_tx_tvalid                ( s_axis_tx_tvalid ),
    .s_axis_tx_tready                ( s_axis_tx_tready ),
    .s_axis_tx_tkeep                 ( s_axis_tx_tkeep ),
    .s_axis_tx_tlast                 ( s_axis_tx_tlast ),
    .s_axis_tx_tuser                 ( s_axis_tx_tuser ),

    .m_axis_rx_tdata                 ( m_axis_rx_tdata ),
    .m_axis_rx_tvalid                ( m_axis_rx_tvalid ),
    .m_axis_rx_tready                ( m_axis_rx_tready ),
    .m_axis_rx_tkeep                 ( m_axis_rx_tkeep ),
    .m_axis_rx_tlast                 ( m_axis_rx_tlast ),
    .m_axis_rx_tuser                 ( m_axis_rx_tuser ),

    .trn_td                          ( trn_td ),
    .trn_tsof                        ( ~trn_tsof_n ),
    .trn_teof                        ( ~trn_teof_n ),
    .trn_tsrc_rdy                    ( ~trn_tsrc_rdy_n ),
    .trn_tdst_rdy                    ( trn_tdst_rdy ),
    .trn_tsrc_dsc                    ( ~trn_tsrc_dsc_n ),
    .trn_trem                        ( ~trn_trem_n ),
    .trn_terrfwd                     ( ~trn_terrfwd_n ),
    .trn_tstr                        ( 1'b0 ),
    .trn_tecrc_gen                   ( 1'b0 ),

    .trn_rd                          ( trn_rd ),
    .trn_rsof                        ( trn_rsof ),
    .trn_reof                        ( trn_reof ),
    .trn_rsrc_rdy                    ( trn_rsrc_rdy ),
    .trn_rdst_rdy                    ( ~trn_rdst_rdy_n ),
    .trn_rsrc_dsc                    ( trn_rsrc_dsc ),
    .trn_rrem                        ( trn_rrem ),
    .trn_rerrfwd                     ( trn_rerrfwd ),
    .trn_rbar_hit                    ( trn_rbar_hit )
  );


endmodule
