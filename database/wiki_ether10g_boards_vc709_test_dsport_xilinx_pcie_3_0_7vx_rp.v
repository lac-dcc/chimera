//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2014 Xilinx, Inc. All rights reserved.
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
//
// Project    : Virtex-7 FPGA Gen3 Integrated Block for PCI Express
// File       : xilinx_pcie_3_0_7vx_rp.v
//-----------------------------------------------------------------------------
//--
//-- Description:  PCI Express Endpoint example FPGA design
//--
//------------------------------------------------------------------------------

`timescale 1ps / 1ps

module xilinx_pcie_3_0_7vx_rp # (
  parameter PCIE_EXT_CLK                               = "TRUE",            // Use External Clocking Module
  parameter C_DATA_WIDTH                               = 256,               // RX/TX interface data width
  parameter [2:0] PL_LINK_CAP_MAX_LINK_SPEED           = 3'h4,              // 1- GEN1, 2 - GEN2, 4 - GEN3
  parameter [3:0] PL_LINK_CAP_MAX_LINK_WIDTH           = 4'h8,              // 1- X1, 2 - X2, 4 - X4, 8 - X8
  parameter  [2:0]  PF0_DEV_CAP_MAX_PAYLOAD_SIZE       = 3'h3,
  parameter PL_DISABLE_EI_INFER_IN_L0                  = "TRUE",
  parameter PL_DISABLE_UPCONFIG_CAPABLE                = "FALSE",
  //  USER_CLK[1/2]_FREQ            : 0 = Disable user clock
  //                                : 1 =  31.25 MHz
  //                                : 2 =  62.50 MHz (default)
  //                                : 3 = 125.00 MHz
  //                                : 4 = 250.00 MHz
  //                                : 5 = 500.00 MHz
  parameter  integer USER_CLK2_FREQ                    = 4,
  parameter          REF_CLK_FREQ                      = 0,                 // 0 - 100 MHz, 1 - 125 MHz,  2 - 250 MHz
  parameter        AXISTEN_IF_RQ_ALIGNMENT_MODE        = "FALSE",
  parameter        AXISTEN_IF_CC_ALIGNMENT_MODE        = "FALSE",
  parameter        AXISTEN_IF_CQ_ALIGNMENT_MODE        = "FALSE",
  parameter        AXISTEN_IF_RC_ALIGNMENT_MODE        = "FALSE",
  parameter        AXISTEN_IF_ENABLE_CLIENT_TAG        = "TRUE",
  parameter        AXISTEN_IF_RQ_PARITY_CHECK          = "FALSE",
  parameter        AXISTEN_IF_CC_PARITY_CHECK          = "FALSE",
  parameter        AXISTEN_IF_MC_RX_STRADDLE           = "FALSE",
  parameter        AXISTEN_IF_ENABLE_RX_MSG_INTFC      = "TRUE",
  parameter [17:0] AXISTEN_IF_ENABLE_MSG_ROUTE         = 18'h2FFFF,
  parameter KEEP_WIDTH                                 = C_DATA_WIDTH / 32
)
(
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_txp,
  output  [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_txn,
  input   [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_rxp,
  input   [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_rxn,

`ifdef ENABLE_LEDS
  output                                          led_0,
  output                                          led_1,
  output                                          led_2,
`endif
  input                                           sys_clk_p,
  input                                           sys_clk_n,
  input                                           sys_rst_n
);

  localparam        TCQ = 1;
  localparam         EP_DEV_ID = 28728;
  localparam integer USER_CLK_FREQ         = ((PL_LINK_CAP_MAX_LINK_SPEED == 3'h4) ? 5 : 4);

  wire                                       user_lnk_up;

  // Wires used for external clocking connectivity
  wire                                       pipe_pclk_in;
  wire                                       pipe_rxusrclk_in;
  wire [(PL_LINK_CAP_MAX_LINK_WIDTH-1):0]    pipe_rxoutclk_in;
  wire                                       pipe_dclk_in;
  wire                                       pipe_userclk1_in;
  wire                                       pipe_userclk2_in;
  wire                                       pipe_oobclk_in;
  wire                                       pipe_mmcm_lock_in;

  wire                                       pipe_txoutclk_out;
  wire [(PL_LINK_CAP_MAX_LINK_WIDTH-1):0]    pipe_rxoutclk_out;
  wire [(PL_LINK_CAP_MAX_LINK_WIDTH-1):0]    pipe_pclk_sel_out;
  wire                                       pipe_gen3_out;

  //----------------------------------------------------------------------------------------------------------------//
  // 3. AXI Interface                                                                                               //
  //----------------------------------------------------------------------------------------------------------------//

  wire                                       user_clk;
  wire                                       user_reset;

  wire                                       s_axis_rq_tlast;
  wire                 [C_DATA_WIDTH-1:0]    s_axis_rq_tdata;
  wire                             [59:0]    s_axis_rq_tuser;
  wire                   [KEEP_WIDTH-1:0]    s_axis_rq_tkeep;
  wire                              [3:0]    s_axis_rq_tready;
  wire                                       s_axis_rq_tvalid;

  wire                 [C_DATA_WIDTH-1:0]    m_axis_rc_tdata;
  wire                             [74:0]    m_axis_rc_tuser;
  wire                                       m_axis_rc_tlast;
  wire                   [KEEP_WIDTH-1:0]    m_axis_rc_tkeep;
  wire                                       m_axis_rc_tvalid;
  wire                                       m_axis_rc_tready;

  wire                 [C_DATA_WIDTH-1:0]    m_axis_cq_tdata;
  wire                             [84:0]    m_axis_cq_tuser;
  wire                                       m_axis_cq_tlast;
  wire                   [KEEP_WIDTH-1:0]    m_axis_cq_tkeep;
  wire                                       m_axis_cq_tvalid;
  wire                                       m_axis_cq_tready;

  wire                 [C_DATA_WIDTH-1:0]    s_axis_cc_tdata;
  wire                             [32:0]    s_axis_cc_tuser;
  wire                                       s_axis_cc_tlast;
  wire                   [KEEP_WIDTH-1:0]    s_axis_cc_tkeep;
  wire                                       s_axis_cc_tvalid;
  wire                              [3:0]    s_axis_cc_tready;

  wire                              [3:0]    pcie_rq_seq_num;
  wire                                       pcie_rq_seq_num_vld;
  wire                              [5:0]    pcie_rq_tag;
  wire                                       pcie_rq_tag_vld;

  wire                              [1:0]    pcie_tfc_nph_av;
  wire                              [1:0]    pcie_tfc_npd_av;
  wire                                       pcie_cq_np_req;
  wire                              [5:0]    pcie_cq_np_req_count;

  //----------------------------------------------------------------------------------------------------------------//
  // 4. Configuration (CFG) Interface                                                                               //
  //----------------------------------------------------------------------------------------------------------------//

  //----------------------------------------------------------------------------------------------------------------//
  // EP and RP                                                                                                      //
  //----------------------------------------------------------------------------------------------------------------//

  wire                                       cfg_phy_link_down;
  wire                              [1:0]    cfg_phy_link_status;
  wire                              [3:0]    cfg_negotiated_width;
  wire                              [2:0]    cfg_current_speed;
  wire                              [2:0]    cfg_max_payload;
  wire                              [2:0]    cfg_max_read_req;
  wire                              [7:0]    cfg_function_status;
  wire                              [5:0]    cfg_function_power_state;
  wire                             [11:0]    cfg_vf_status;
  wire                             [17:0]    cfg_vf_power_state;
  wire                              [1:0]    cfg_link_power_state;

  // Management Interface
  wire                             [18:0]    cfg_mgmt_addr;
  wire                                       cfg_mgmt_write;
  wire                             [31:0]    cfg_mgmt_write_data;
  wire                              [3:0]    cfg_mgmt_byte_enable;
  wire                                       cfg_mgmt_read;
  wire                             [31:0]    cfg_mgmt_read_data;
  wire                                       cfg_mgmt_read_write_done;
  wire                                       cfg_mgmt_type1_cfg_reg_access;

  // Error Reporting Interface
  wire                                       cfg_err_cor_out;
  wire                                       cfg_err_nonfatal_out;
  wire                                       cfg_err_fatal_out;
  wire                                       cfg_local_error;

  wire                                       cfg_ltr_enable;
  wire                              [5:0]    cfg_ltssm_state;
  wire                              [1:0]    cfg_rcb_status;
  wire                              [1:0]    cfg_dpa_substate_change;
  wire                              [1:0]    cfg_obff_enable;
  wire                                       cfg_pl_status_change;

  wire                              [1:0]    cfg_tph_requester_enable;
  wire                              [5:0]    cfg_tph_st_mode;
  wire                              [5:0]    cfg_vf_tph_requester_enable;
  wire                             [17:0]    cfg_vf_tph_st_mode;

  wire                                       cfg_msg_received;
  wire                              [7:0]    cfg_msg_received_data;
  wire                              [4:0]    cfg_msg_received_type;

  wire                                       cfg_msg_transmit;
  wire                              [2:0]    cfg_msg_transmit_type;
  wire                             [31:0]    cfg_msg_transmit_data;
  wire                                       cfg_msg_transmit_done;

  wire                              [7:0]    cfg_fc_ph;
  wire                             [11:0]    cfg_fc_pd;
  wire                              [7:0]    cfg_fc_nph;
  wire                             [11:0]    cfg_fc_npd;
  wire                              [7:0]    cfg_fc_cplh;
  wire                             [11:0]    cfg_fc_cpld;
  wire                              [2:0]    cfg_fc_sel;

  wire                              [2:0]    cfg_per_func_status_control;
  wire                             [15:0]    cfg_per_func_status_data;
  wire                              [2:0]    cfg_per_function_number;
  wire                                       cfg_per_function_output_request;
  wire                                       cfg_per_function_update_done;

  wire                             [63:0]    cfg_dsn;
  wire                                       cfg_power_state_change_ack;
  wire                                       cfg_power_state_change_interrupt;
  wire                                       cfg_err_cor_in;
  wire                                       cfg_err_uncor_in;

  wire                              [1:0]    cfg_flr_in_process;
  wire                              [1:0]    cfg_flr_done;
  wire                              [5:0]    cfg_vf_flr_in_process;
  wire                              [5:0]    cfg_vf_flr_done;

  wire                                       cfg_link_training_enable;

  wire                                       cfg_ext_read_received;
  wire                                       cfg_ext_write_received;
  wire                              [9:0]    cfg_ext_register_number;
  wire                              [7:0]    cfg_ext_function_number;
  wire                             [31:0]    cfg_ext_write_data;
  wire                              [3:0]    cfg_ext_write_byte_enable;
  wire                             [31:0]    cfg_ext_read_data;
  wire                                       cfg_ext_read_data_valid;

  wire                              [7:0]    cfg_ds_port_number;

  //----------------------------------------------------------------------------------------------------------------//
  // EP Only                                                                                                        //
  //----------------------------------------------------------------------------------------------------------------//

  // Interrupt Interface Signals
  wire                              [3:0]    cfg_interrupt_int;
  wire                              [1:0]    cfg_interrupt_pending;
  wire                                       cfg_interrupt_sent;

  wire                              [1:0]    cfg_interrupt_msi_enable;
  wire                              [5:0]    cfg_interrupt_msi_vf_enable;
  wire                              [5:0]    cfg_interrupt_msi_mmenable;
  wire                                       cfg_interrupt_msi_mask_update;
  wire                             [31:0]    cfg_interrupt_msi_data;
  wire                              [3:0]    cfg_interrupt_msi_select;
  wire                             [31:0]    cfg_interrupt_msi_int;
  wire                             [63:0]    cfg_interrupt_msi_pending_status;
  wire                                       cfg_interrupt_msi_sent;
  wire                                       cfg_interrupt_msi_fail;

  wire                              [1:0]    cfg_interrupt_msix_enable;
  wire                              [1:0]    cfg_interrupt_msix_mask;
  wire                              [5:0]    cfg_interrupt_msix_vf_enable;
  wire                              [5:0]    cfg_interrupt_msix_vf_mask;
  wire                             [31:0]    cfg_interrupt_msix_data;
  wire                             [63:0]    cfg_interrupt_msix_address;
  wire                                       cfg_interrupt_msix_int;
  wire                                       cfg_interrupt_msix_sent;
  wire                                       cfg_interrupt_msix_fail;

  wire                              [2:0]    cfg_interrupt_msi_attr;
  wire                                       cfg_interrupt_msi_tph_present;
  wire                              [1:0]    cfg_interrupt_msi_tph_type;
  wire                              [8:0]    cfg_interrupt_msi_tph_st_tag;
  wire                              [2:0]    cfg_interrupt_msi_function_number;

// EP only
  wire                                       cfg_hot_reset_out;
  wire                                       cfg_config_space_enable;
  wire                                       cfg_req_pm_transition_l23_ready;

// RP only
  wire                                       cfg_hot_reset_in;

  wire                              [7:0]    cfg_ds_bus_number;
  wire                              [4:0]    cfg_ds_device_number;
  wire                              [2:0]    cfg_ds_function_number;

  wire                                       drp_rdy;
  wire                             [15:0]    drp_do;
  wire                                       drp_clk;
  wire                                       drp_en;
  wire                                       drp_we;
  wire                             [10:0]    drp_addr;
  wire                             [15:0]    drp_di;

  //----------------------------------------------------------------------------------------------------------------//
  // 8. System(SYS) Interface                                                                                       //
  //----------------------------------------------------------------------------------------------------------------//

  wire                                       sys_clk;
  wire                                       sys_rst_n_c;

  //-----------------------------------------------------------------------------------------------------------------------

  IBUF   sys_reset_n_ibuf (.O(sys_rst_n_c), .I(sys_rst_n));

    IBUFDS_GTE2 refclk_ibuf (.O(sys_clk), .ODIV2(), .I(sys_clk_p), .CEB(1'b0), .IB(sys_clk_n));

   `ifdef ENABLE_LEDS
    // Uncomment UCF location constraints
    OBUF   led_0_obuf (.O(led_0), .I(sys_rst_n_c));
    OBUF   led_1_obuf (.O(led_1), .I(!user_reset));
    OBUF   led_2_obuf (.O(led_2), .I(user_lnk_up));
    OBUF   led_3_obuf (.O(led_3), .I(user_clk_heartbeat[25]));
  `endif


  localparam X8_GEN3 = ((PL_LINK_CAP_MAX_LINK_WIDTH == 8) && (PL_LINK_CAP_MAX_LINK_SPEED == 4)) ? 1'b1 : 1'b0;


  // Generate External Clock Module if External Clocking is selected
  generate
    if (PCIE_EXT_CLK == "TRUE") begin : ext_clk

      //---------- PIPE Clock Module -------------------------------------------------
      pipe_clock #
      (
          .PCIE_ASYNC_EN                  ( "FALSE" ),     // PCIe async enable
          .PCIE_TXBUF_EN                  ( "FALSE" ),     // PCIe TX buffer enable for Gen1/Gen2 only
          .PCIE_LANE                      ( PL_LINK_CAP_MAX_LINK_WIDTH ),     // PCIe number of lanes
          .PCIE_LINK_SPEED                ( 3 ),
          .PCIE_REFCLK_FREQ               ( 0 ),     // PCIe reference clock frequency
          .PCIE_USERCLK1_FREQ             ( USER_CLK_FREQ ),     // PCIe user clock 1 frequency
          .PCIE_USERCLK2_FREQ             ( USER_CLK2_FREQ ),     // PCIe user clock 2 frequency
          .PCIE_DEBUG_MODE                ( 0 )
      )
      pipe_clock_i
      (

          //---------- Input -------------------------------------
          .CLK_CLK                        ( sys_clk ),
          .CLK_TXOUTCLK                   ( pipe_txoutclk_out ),     // Reference clock from lane 0
          .CLK_RXOUTCLK_IN                ( pipe_rxoutclk_out ),
          .CLK_RST_N                      ( 1'b1 ),
          .CLK_PCLK_SEL                   ( pipe_pclk_sel_out ),
          .CLK_GEN3                       ( pipe_gen3_out ),

          //---------- Output ------------------------------------
          .CLK_PCLK                       ( pipe_pclk_in ),
          .CLK_RXUSRCLK                   ( pipe_rxusrclk_in ),
          .CLK_RXOUTCLK_OUT               ( pipe_rxoutclk_in ),
          .CLK_DCLK                       ( pipe_dclk_in ),
          .CLK_USERCLK1                   ( pipe_userclk1_in ),
          .CLK_USERCLK2                   ( pipe_userclk2_in ),
          .CLK_MMCM_LOCK                  ( pipe_mmcm_lock_in ),
          .CLK_OOBCLK                     ( pipe_oobclk_in )

      );
    end
    else begin

       assign PIPE_PCLK_IN = 1'd0;
       assign PIPE_RXUSRCLK_IN = 1'd0;
       assign PIPE_RXOUTCLK_IN = {PL_LINK_CAP_MAX_LINK_WIDTH{1'b0}};
       assign PIPE_DCLK_IN  = 1'd0;
       assign PIPE_USERCLK1_IN  = 1'd0;
       assign PIPE_USERCLK2_IN  = 1'd0;
       assign PIPE_MMCM_LOCK_IN = 1'd0;
       assign PIPE_OOBCLK_IN  = 1'd0;

    end
  endgenerate

`ifdef IPI
  pcie3_x8_ip_rport_7vx #(
`else
  pcie3_x8_ip_pcie_3_0_7vx #(
`endif
    .TCQ                              ( TCQ ),
    .PF0_CLASS_CODE                   ( 24'h058000 ),
    .REF_CLK_FREQ                     ( REF_CLK_FREQ ),
    .PCIE_EXT_CLK                     ( PCIE_EXT_CLK ),
    .C_DATA_WIDTH                     ( C_DATA_WIDTH ),
    .PL_LINK_CAP_MAX_LINK_SPEED       ( PL_LINK_CAP_MAX_LINK_SPEED ),
    .PL_LINK_CAP_MAX_LINK_WIDTH       ( PL_LINK_CAP_MAX_LINK_WIDTH ),
    .PL_DISABLE_EI_INFER_IN_L0        (PL_DISABLE_EI_INFER_IN_L0),
    .AXISTEN_IF_RQ_PARITY_CHK         ( AXISTEN_IF_RQ_PARITY_CHECK  ),
    .AXISTEN_IF_ENABLE_RX_MSG_INTFC   ( AXISTEN_IF_ENABLE_RX_MSG_INTFC ),  
    .AXISTEN_IF_ENABLE_CLIENT_TAG     (AXISTEN_IF_ENABLE_CLIENT_TAG),
    .USER_CLK2_FREQ                   ( USER_CLK2_FREQ ),  // PCIe user clock 2 frequency
    .PL_DISABLE_UPCONFIG_CAPABLE      (PL_DISABLE_UPCONFIG_CAPABLE),
    .PL_UPSTREAM_FACING               ( "FALSE")

  ) rport (
    .pci_exp_txn(pci_exp_txn),
    .pci_exp_txp(pci_exp_txp),
    .pci_exp_rxn(pci_exp_rxn),
    .pci_exp_rxp(pci_exp_rxp),
    .pipe_pclk_in(pipe_pclk_in),
    .pipe_mmcm_rst_n(1'b1),
    .pipe_rxusrclk_in(pipe_rxusrclk_in),
    .pipe_rxoutclk_in(pipe_rxoutclk_in),
    .pipe_dclk_in(pipe_dclk_in),
    .pipe_userclk1_in(pipe_userclk1_in),
    .pipe_userclk2_in(pipe_userclk2_in),
    .pipe_oobclk_in(pipe_oobclk_in),
    .pipe_mmcm_lock_in(pipe_mmcm_lock_in),
    .pipe_txoutclk_out(pipe_txoutclk_out),
    .pipe_rxoutclk_out(pipe_rxoutclk_out),
    .pipe_pclk_sel_out(pipe_pclk_sel_out),
    .pipe_gen3_out(pipe_gen3_out),
    .user_clk(user_clk),
    .user_reset(user_reset),
    .user_lnk_up(user_lnk_up),
    .s_axis_rq_tlast(s_axis_rq_tlast),
    .s_axis_rq_tdata(s_axis_rq_tdata),
    .s_axis_rq_tuser(s_axis_rq_tuser),
    .s_axis_rq_tkeep(s_axis_rq_tkeep),
    .s_axis_rq_tready(s_axis_rq_tready),
    .s_axis_rq_tvalid(s_axis_rq_tvalid),
    .m_axis_rc_tdata(m_axis_rc_tdata),
    .m_axis_rc_tuser(m_axis_rc_tuser),
    .m_axis_rc_tlast(m_axis_rc_tlast),
    .m_axis_rc_tkeep(m_axis_rc_tkeep),
    .m_axis_rc_tvalid(m_axis_rc_tvalid),
    .m_axis_rc_tready({22{m_axis_rc_tready}}),
    .m_axis_cq_tdata(m_axis_cq_tdata),
    .m_axis_cq_tuser(m_axis_cq_tuser),
    .m_axis_cq_tlast(m_axis_cq_tlast),
    .m_axis_cq_tkeep(m_axis_cq_tkeep),
    .m_axis_cq_tvalid(m_axis_cq_tvalid),
    .m_axis_cq_tready({22{m_axis_cq_tready}}),
    .s_axis_cc_tdata(s_axis_cc_tdata),
    .s_axis_cc_tuser(s_axis_cc_tuser),
    .s_axis_cc_tlast(s_axis_cc_tlast),
    .s_axis_cc_tkeep(s_axis_cc_tkeep),
    .s_axis_cc_tvalid(s_axis_cc_tvalid),
    .s_axis_cc_tready(s_axis_cc_tready),
    .pcie_rq_seq_num(pcie_rq_seq_num),
    .pcie_rq_seq_num_vld(pcie_rq_seq_num_vld),
    .pcie_rq_tag(pcie_rq_tag),
    .pcie_rq_tag_vld(pcie_rq_tag_vld),
    .pcie_tfc_nph_av(pcie_tfc_nph_av),
    .pcie_tfc_npd_av(pcie_tfc_npd_av),
    .pcie_cq_np_req(1'b1),  //pcie_cq_np_req),
    .pcie_cq_np_req_count(pcie_cq_np_req_count),
    .cfg_phy_link_down(cfg_phy_link_down),
    .cfg_phy_link_status(cfg_phy_link_status),
    .cfg_negotiated_width(cfg_negotiated_width),
    .cfg_current_speed(cfg_current_speed),
    .cfg_max_payload(cfg_max_payload),
    .cfg_max_read_req(cfg_max_read_req),
    .cfg_function_status(cfg_function_status),
    .cfg_function_power_state(cfg_function_power_state),
    .cfg_vf_status(cfg_vf_status),
    .cfg_vf_power_state(cfg_vf_power_state),
    .cfg_link_power_state(cfg_link_power_state),
    .cfg_mgmt_addr(cfg_mgmt_addr),
    .cfg_mgmt_write(cfg_mgmt_write),
    .cfg_mgmt_write_data(cfg_mgmt_write_data),
    .cfg_mgmt_byte_enable(cfg_mgmt_byte_enable),
    .cfg_mgmt_read(cfg_mgmt_read),
    .cfg_mgmt_read_data(cfg_mgmt_read_data),
    .cfg_mgmt_read_write_done(cfg_mgmt_read_write_done),
    .cfg_mgmt_type1_cfg_reg_access(cfg_mgmt_type1_cfg_reg_access),
    .cfg_err_cor_out(cfg_err_cor_out),
    .cfg_err_nonfatal_out(cfg_err_nonfatal_out),
    .cfg_err_fatal_out(cfg_err_fatal_out),
    .cfg_ltr_enable(cfg_ltr_enable),
    .cfg_ltssm_state(cfg_ltssm_state),
    .cfg_rcb_status(cfg_rcb_status),
    .cfg_dpa_substate_change(cfg_dpa_substate_change),
    .cfg_obff_enable(cfg_obff_enable),
    .cfg_pl_status_change(cfg_pl_status_change),
    .cfg_tph_requester_enable(cfg_tph_requester_enable),
    .cfg_tph_st_mode(cfg_tph_st_mode),
    .cfg_vf_tph_requester_enable(cfg_vf_tph_requester_enable),
    .cfg_vf_tph_st_mode(cfg_vf_tph_st_mode),
    .cfg_msg_received(cfg_msg_received),
    .cfg_msg_received_data(cfg_msg_received_data),
    .cfg_msg_received_type(cfg_msg_received_type),
    .cfg_msg_transmit(cfg_msg_transmit),
    .cfg_msg_transmit_type(cfg_msg_transmit_type),
    .cfg_msg_transmit_data(cfg_msg_transmit_data),
    .cfg_msg_transmit_done(cfg_msg_transmit_done),
    .cfg_fc_ph(cfg_fc_ph),
    .cfg_fc_pd(cfg_fc_pd),
    .cfg_fc_nph(cfg_fc_nph),
    .cfg_fc_npd(cfg_fc_npd),
    .cfg_fc_cplh(cfg_fc_cplh),
    .cfg_fc_cpld(cfg_fc_cpld),
    .cfg_fc_sel(cfg_fc_sel),
    .cfg_per_func_status_control(cfg_per_func_status_control),
    .cfg_per_func_status_data(cfg_per_func_status_data),
    .cfg_per_function_number(cfg_per_function_number),
    .cfg_per_function_output_request(cfg_per_function_output_request),
    .cfg_per_function_update_done(cfg_per_function_update_done),
    .cfg_dsn(cfg_dsn),
    .cfg_power_state_change_ack(cfg_power_state_change_ack),
    .cfg_power_state_change_interrupt(cfg_power_state_change_interrupt),
    .cfg_err_cor_in(cfg_err_cor_in),
    .cfg_err_uncor_in(cfg_err_uncor_in),
    .cfg_flr_in_process(cfg_flr_in_process),
    .cfg_flr_done(cfg_flr_done),
    .cfg_vf_flr_in_process(cfg_vf_flr_in_process),
    .cfg_vf_flr_done(cfg_vf_flr_done),
    .cfg_link_training_enable(cfg_link_training_enable),
    .cfg_ext_read_received(cfg_ext_read_received),
    .cfg_ext_write_received(cfg_ext_write_received),
    .cfg_ext_register_number(cfg_ext_register_number),
    .cfg_ext_function_number(cfg_ext_function_number),
    .cfg_ext_write_data(cfg_ext_write_data),
    .cfg_ext_write_byte_enable(cfg_ext_write_byte_enable),
    .cfg_ext_read_data(cfg_ext_read_data),
    .cfg_ext_read_data_valid(cfg_ext_read_data_valid),
    .cfg_ds_port_number(cfg_ds_port_number),
    .cfg_interrupt_int(cfg_interrupt_int),
    .cfg_interrupt_pending(cfg_interrupt_pending),
    .cfg_interrupt_sent(cfg_interrupt_sent),
    .cfg_interrupt_msi_enable(cfg_interrupt_msi_enable),
    .cfg_interrupt_msi_vf_enable(cfg_interrupt_msi_vf_enable),
    .cfg_interrupt_msi_mmenable(cfg_interrupt_msi_mmenable),
    .cfg_interrupt_msi_mask_update(cfg_interrupt_msi_mask_update),
    .cfg_interrupt_msi_data(cfg_interrupt_msi_data),
    .cfg_interrupt_msi_select(cfg_interrupt_msi_select),
    .cfg_interrupt_msi_int(cfg_interrupt_msi_int),
    .cfg_interrupt_msi_pending_status(cfg_interrupt_msi_pending_status),
    .cfg_interrupt_msi_sent(cfg_interrupt_msi_sent),
    .cfg_interrupt_msi_fail(cfg_interrupt_msi_fail),
    .cfg_interrupt_msix_enable(cfg_interrupt_msix_enable),
    .cfg_interrupt_msix_mask(cfg_interrupt_msix_mask),
    .cfg_interrupt_msix_vf_enable(cfg_interrupt_msix_vf_enable),
    .cfg_interrupt_msix_vf_mask(cfg_interrupt_msix_vf_mask),
    .cfg_interrupt_msix_data(cfg_interrupt_msix_data),
    .cfg_interrupt_msix_address(cfg_interrupt_msix_address),
    .cfg_interrupt_msix_int(cfg_interrupt_msix_int),
    .cfg_interrupt_msix_sent(cfg_interrupt_msix_sent),
    .cfg_interrupt_msix_fail(cfg_interrupt_msix_fail),
    .cfg_interrupt_msi_attr(cfg_interrupt_msi_attr),
    .cfg_interrupt_msi_tph_present(cfg_interrupt_msi_tph_present),
    .cfg_interrupt_msi_tph_type(cfg_interrupt_msi_tph_type),
    .cfg_interrupt_msi_tph_st_tag(cfg_interrupt_msi_tph_st_tag),
    .cfg_interrupt_msi_function_number(cfg_interrupt_msi_function_number),
    .cfg_hot_reset_out(cfg_hot_reset_out),
    .cfg_config_space_enable(cfg_config_space_enable),
    .cfg_req_pm_transition_l23_ready(cfg_req_pm_transition_l23_ready),
    .cfg_hot_reset_in(cfg_hot_reset_in),
    .cfg_ds_bus_number(cfg_ds_bus_number),
    .cfg_ds_device_number(cfg_ds_device_number),
    .cfg_ds_function_number(cfg_ds_function_number),
`ifdef IPI
    .cfg_subsys_vend_id(16'h0000),

    // PCIe Fast Config: Startup Interface - Can only be used in Tandem Mode                                          //
    .startup_eos_in   (1'b0),         // 1-bit input: This signal should be driven by the EOS output of the STARTUP primitive.
    .startup_cfgclk   ( ),            // 1-bit output: Configuration main clock output
    .startup_cfgmclk  ( ),            // 1-bit output: Configuration internal oscillator clock output
    .startup_eos      ( ),            // 1-bit output: Active high output signal indicating the End Of Startup.
    .startup_preq     ( ),            // 1-bit output: PROGRAM request to fabric output
    .startup_clk      ( 1'b0 ),       // 1-bit input: User start-up clock input
    .startup_gsr      ( 1'b0 ),       // 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
    .startup_gts      ( 1'b0 ),       // 1-bit input: Global 3-state input (GTS cannot be used for the port name)
    .startup_keyclearb( 1'b1 ),       // 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
    .startup_pack     ( 1'b0 ),       // 1-bit input: PROGRAM acknowledge input
    .startup_usrcclko ( 1'b0 ),       // 1-bit input: User CCLK input
    .startup_usrcclkts( 1'b1 ),       // 1-bit input: User CCLK 3-state enable input
    .startup_usrdoneo ( 1'b0 ),       // 1-bit input: User DONE pin output control
    .startup_usrdonets( 1'b1 ),       // 1-bit input: User DONE 3-state enable output

    // PCIe Fast Config: Startup Interface - Can only be used in Tandem Mode 
    .icap_clk(1'b0), 
    .icap_csib(1'b1),
    .icap_rdwrb(1'b1),
    .icap_i(32'hFFFFFFFF),
    .icap_o(),
    .user_tph_stt_address(),
    .user_tph_function_num(),
    .user_tph_stt_read_data(),
    .user_tph_stt_read_data_valid(),
    .user_tph_stt_read_enable(),
    //.init_pattern_bus()

    //below ports instantiated to fix warnings
    .ext_ch_gt_drprdy(),
    .ext_ch_gt_drpdo(),
    .ext_ch_gt_drpwe(),
    .ext_ch_gt_drpdi(),
    .ext_ch_gt_drpen(),
    .ext_ch_gt_drpaddr(),
    .ext_ch_gt_drpclk(),
    .common_commands_in(26'h0),
    .pipe_rx_0_sigs(84'h0),
    .pipe_rx_1_sigs(84'h0),
    .pipe_rx_2_sigs(84'h0),
    .pipe_rx_3_sigs(84'h0),
    .pipe_rx_4_sigs(84'h0),
    .pipe_rx_5_sigs(84'h0),
    .pipe_rx_6_sigs(84'h0),
    .pipe_rx_7_sigs(84'h0),
    .common_commands_out(),
    .pipe_tx_0_sigs(),
    .pipe_tx_1_sigs(),
    .pipe_tx_2_sigs(),
    .pipe_tx_3_sigs(),
    .pipe_tx_4_sigs(),
    .pipe_tx_5_sigs(),
    .pipe_tx_6_sigs(),
    .pipe_tx_7_sigs(),
    .pcie_drp_clk(1'b1),                         
    .pcie_drp_en(1'b0),                          
    .pcie_drp_we(1'b0),                          
    .pcie_drp_addr(11'h0),                        
    .pcie_drp_di(16'h0),                          
    .pcie_drp_rdy(),                         
    .pcie_drp_do(),                          
    .pipe_debug(),
    .pipe_debug_9(),
    .pipe_debug_8(),
    .pipe_debug_7(),
    .pipe_debug_6(),
    .pipe_debug_5(),
    .pipe_debug_4(),
    .pipe_debug_3(),
    .pipe_debug_2(),
    .pipe_debug_1(),
    .pipe_debug_0(),
    .gt_ch_drp_rdy(),
    .pipe_rate_idle(),
    .pipe_eyescandataerror(),
    .pipe_rxstatus(),
    .pipe_dmonitorout(),
    .pipe_cpll_lock       (),  
    .pipe_qpll_lock       (),     
    .pipe_rxpmaresetdone  (),         
    .pipe_rxbufstatus     (),            
    .pipe_txphaligndone   (),           
    .pipe_txphinitdone    (),            
    .pipe_txdlysresetdone (),        
    .pipe_rxphaligndone   (),           
    .pipe_rxdlysresetdone (),         
    .pipe_rxsyncdone      (),            
    .pipe_rxdisperr       (),          
    .pipe_rxnotintable    (),          
    .pipe_rxcommadet      (),               
    .pipe_qrst_idle(),
    .pipe_rst_idle(),
    .pipe_drp_fsm(),
    .pipe_sync_fsm_rx(),
    .pipe_sync_fsm_tx(),
    .pipe_rate_fsm(),
    .pipe_qrst_fsm(),
    .pipe_rst_fsm(),
    .pipe_rxprbserr(),
    .pipe_loopback(),
    .pipe_rxprbscntreset(),
    .pipe_txprbsforceerr(),
    .pipe_rxprbssel(),
    .pipe_txprbssel(),
    .qpll_drp_start(),
    .qpll_drp_gen3(),
    .qpll_drp_ovrd(),
    .qpll_drp_rst_n(),
    .qpll_drp_clk(),
    .qpll_qpllreset(),
    .qpll_qplld(),
    .qpll_qplloutrefclk(),
    .qpll_qplloutclk(),
    .qpll_qplllock(),
    .qpll_drp_reset(),
    .qpll_drp_done(),
    .qpll_drp_fsm(),
    .qpll_drp_crscode(),
    .int_pclk_sel_slave(),
    .int_qplloutrefclk_out(),
    .int_qplloutclk_out(),
    .int_qplllock_out(),
    .int_oobclk_out(),
    .int_userclk2_out(),
    .int_userclk1_out(),
    .int_dclk_out(),
    .int_rxoutclk_out(),
    .int_pipe_rxusrclk_out(),
    .int_pclk_out_slave(),
`endif    
    .sys_clk(sys_clk),
    .sys_reset(~sys_rst_n_c)

  );

  pci_exp_usrapp_rx # (
    .C_DATA_WIDTH(C_DATA_WIDTH)
  ) rx_usrapp (
    .m_axis_cq_tdata(m_axis_cq_tdata),
    .m_axis_cq_tlast(m_axis_cq_tlast),
    .m_axis_cq_tvalid(m_axis_cq_tvalid),
    .m_axis_cq_tuser(m_axis_cq_tuser),
    .m_axis_cq_tkeep(m_axis_cq_tkeep),
    .pcie_cq_np_req_count(pcie_cq_np_req_count),
    .m_axis_cq_tready(m_axis_cq_tready),
    .m_axis_rc_tdata(m_axis_rc_tdata),
    .m_axis_rc_tlast(m_axis_rc_tlast),
    .m_axis_rc_tvalid(m_axis_rc_tvalid),
    .m_axis_rc_tuser(m_axis_rc_tuser),
    .m_axis_rc_tkeep(m_axis_rc_tkeep),
    .m_axis_rc_tready(m_axis_rc_tready),
    .pcie_cq_np_req(pcie_cq_np_req),
    .user_clk(user_clk),
    .user_reset(user_reset),
    .user_lnk_up(user_lnk_up)

  );

  // Tx User Application Interface
  pci_exp_usrapp_tx # (

    .C_DATA_WIDTH       ( C_DATA_WIDTH),
    .DEV_CAP_MAX_PAYLOAD_SUPPORTED   (PF0_DEV_CAP_MAX_PAYLOAD_SIZE ),
    .LINK_CAP_MAX_LINK_SPEED (PL_LINK_CAP_MAX_LINK_SPEED),
    .LINK_CAP_MAX_LINK_WIDTH (PL_LINK_CAP_MAX_LINK_WIDTH),
    .EP_DEV_ID          ( EP_DEV_ID )

  ) tx_usrapp (
    .s_axis_rq_tlast    (s_axis_rq_tlast),
    .s_axis_rq_tdata    (s_axis_rq_tdata),
    .s_axis_rq_tuser    (s_axis_rq_tuser),
    .s_axis_rq_tkeep    (s_axis_rq_tkeep),
    .s_axis_rq_tready   (s_axis_rq_tready),
    .s_axis_rq_tvalid   (s_axis_rq_tvalid),
    .s_axis_cc_tdata    (s_axis_cc_tdata),
    .s_axis_cc_tuser    (s_axis_cc_tuser),
    .s_axis_cc_tlast    (s_axis_cc_tlast),
    .s_axis_cc_tkeep    (s_axis_cc_tkeep),
    .s_axis_cc_tvalid   (s_axis_cc_tvalid),
    .s_axis_cc_tready   (s_axis_cc_tready),
    .pcie_rq_seq_num    (pcie_rq_seq_num),
    .pcie_rq_seq_num_vld(pcie_rq_seq_num_vld),
    .pcie_rq_tag        (pcie_rq_tag),
    .pcie_rq_tag_vld    (pcie_rq_tag_vld),
    .pcie_tfc_nph_av    (pcie_tfc_nph_av),
    .pcie_tfc_npd_av    (pcie_tfc_npd_av),
    .speed_change_done_n(speed_change_done_n),
    .user_clk           (user_clk),
    .reset              (user_reset),
    .user_lnk_up        (user_lnk_up)


  );

  // Cfg UsrApp

  pci_exp_usrapp_cfg cfg_usrapp (

 .user_clk                                  (user_clk),
 .user_reset                                (user_reset),
  //-------------------------------------------------------------------------------------------//
  // 4. Configuration (CFG) Interface                                                          //
  //-------------------------------------------------------------------------------------------//
  // EP and RP                                                                                 //
  //-------------------------------------------------------------------------------------------//

 .cfg_phy_link_down                         (cfg_phy_link_down),
 .cfg_phy_link_status                       (cfg_phy_link_status),
 .cfg_negotiated_width                      (cfg_negotiated_width),
 .cfg_current_speed                         (cfg_current_speed),
 .cfg_max_payload                           (cfg_max_payload),
 .cfg_max_read_req                          (cfg_max_read_req),
 .cfg_function_status                       (cfg_function_status),
 .cfg_function_power_state                  (cfg_function_power_state),
 .cfg_vf_status                             (cfg_vf_status),
 .cfg_vf_power_state                        (cfg_vf_power_state),
 .cfg_link_power_state                      (cfg_link_power_state),

  // Management Interface
 .cfg_mgmt_addr                             (cfg_mgmt_addr),
 .cfg_mgmt_write                            (cfg_mgmt_write),
 .cfg_mgmt_write_data                       (cfg_mgmt_write_data),
 .cfg_mgmt_byte_enable                      (cfg_mgmt_byte_enable),

 .cfg_mgmt_read                             (cfg_mgmt_read),
 .cfg_mgmt_read_data                        (cfg_mgmt_read_data),
 .cfg_mgmt_read_write_done                  (cfg_mgmt_read_write_done),
 .cfg_mgmt_type1_cfg_reg_access             (cfg_mgmt_type1_cfg_reg_access),

  // Error Reporting Interface
 .cfg_err_cor_out                           (cfg_err_cor_out),
 .cfg_err_nonfatal_out                      (cfg_err_nonfatal_out),
 .cfg_err_fatal_out                         (cfg_err_fatal_out),

 .cfg_ltr_enable                            (cfg_ltr_enable),
 .cfg_ltssm_state                           (cfg_ltssm_state),
 .cfg_rcb_status                            (cfg_rcb_status),
 .cfg_dpa_substate_change                   (cfg_dpa_substate_change),
 .cfg_obff_enable                           (cfg_obff_enable),
 .cfg_pl_status_change                      (cfg_pl_status_change),

 .cfg_tph_requester_enable                  (cfg_tph_requester_enable),
 .cfg_tph_st_mode                           (cfg_tph_st_mode),
 .cfg_vf_tph_requester_enable               (cfg_vf_tph_requester_enable),
 .cfg_vf_tph_st_mode                        (cfg_vf_tph_st_mode),

 .cfg_msg_received                          (cfg_msg_received),
 .cfg_msg_received_data                     (cfg_msg_received_data),
 .cfg_msg_received_type                     (cfg_msg_received_type),

 .cfg_msg_transmit                          (cfg_msg_transmit),
 .cfg_msg_transmit_type                     (cfg_msg_transmit_type),
 .cfg_msg_transmit_data                     (cfg_msg_transmit_data),
 .cfg_msg_transmit_done                     (cfg_msg_transmit_done),

 .cfg_fc_ph                                 (cfg_fc_ph),
 .cfg_fc_pd                                 (cfg_fc_pd),
 .cfg_fc_nph                                (cfg_fc_nph),
 .cfg_fc_npd                                (cfg_fc_npd),
 .cfg_fc_cplh                               (cfg_fc_cplh),
 .cfg_fc_cpld                               (cfg_fc_cpld),
 .cfg_fc_sel                                (cfg_fc_sel),

 .cfg_per_func_status_control               (cfg_per_func_status_control),
 .cfg_per_func_status_data                  (cfg_per_func_status_data),
 .cfg_per_function_number                   (cfg_per_function_number),
 .cfg_per_function_output_request           (cfg_per_function_output_request),
 .cfg_per_function_update_done              (cfg_per_function_update_done),

 .cfg_dsn                                   (cfg_dsn),
 .cfg_power_state_change_ack                (cfg_power_state_change_ack),
 .cfg_power_state_change_interrupt          (cfg_power_state_change_interrupt),
 .cfg_err_cor_in                            (cfg_err_cor_in),
 .cfg_err_uncor_in                          (cfg_err_uncor_in),

 .cfg_flr_in_process                        (cfg_flr_in_process),
 .cfg_flr_done                              (cfg_flr_done),
 .cfg_vf_flr_in_process                     (cfg_vf_flr_in_process),
 .cfg_vf_flr_done                           (cfg_vf_flr_done),

 .cfg_link_training_enable                  (cfg_link_training_enable),

 .cfg_ext_read_received                     (cfg_ext_read_received),
 .cfg_ext_write_received                    (cfg_ext_write_received),
 .cfg_ext_register_number                   (cfg_ext_register_number),
 .cfg_ext_function_number                   (cfg_ext_function_number),
 .cfg_ext_write_data                        (cfg_ext_write_data),
 .cfg_ext_write_byte_enable                 (cfg_ext_write_byte_enable),
 .cfg_ext_read_data                         (cfg_ext_read_data),
 .cfg_ext_read_data_valid                   (cfg_ext_read_data_valid),

 .cfg_ds_port_number                        (cfg_ds_port_number),

  // Interrupt Interface Signals
 .cfg_interrupt_int                         (cfg_interrupt_int),
 .cfg_interrupt_pending                     (cfg_interrupt_pending),
 .cfg_interrupt_sent                        (cfg_interrupt_sent),

 .cfg_interrupt_msi_enable                  (cfg_interrupt_msi_enable),
 .cfg_interrupt_msi_vf_enable               (cfg_interrupt_msi_vf_enable),
 .cfg_interrupt_msi_mmenable                (cfg_interrupt_msi_mmenable),
 .cfg_interrupt_msi_mask_update             (cfg_interrupt_msi_mask_update),
 .cfg_interrupt_msi_data                    (cfg_interrupt_msi_data),
 .cfg_interrupt_msi_select                  (cfg_interrupt_msi_select),
 .cfg_interrupt_msi_int                     (cfg_interrupt_msi_int),
 .cfg_interrupt_msi_pending_status          (cfg_interrupt_msi_pending_status),
 .cfg_interrupt_msi_sent                    (cfg_interrupt_msi_sent),
 .cfg_interrupt_msi_fail                    (cfg_interrupt_msi_fail),

 .cfg_interrupt_msix_enable                 (cfg_interrupt_msix_enable),
 .cfg_interrupt_msix_mask                   (cfg_interrupt_msix_mask),
 .cfg_interrupt_msix_vf_enable              (cfg_interrupt_msix_vf_enable),
 .cfg_interrupt_msix_vf_mask                (cfg_interrupt_msix_vf_mask),
 .cfg_interrupt_msix_data                   (cfg_interrupt_msix_data),
 .cfg_interrupt_msix_address                (cfg_interrupt_msix_address),
 .cfg_interrupt_msix_int                    (cfg_interrupt_msix_int),
 .cfg_interrupt_msix_sent                   (cfg_interrupt_msix_sent),
 .cfg_interrupt_msix_fail                   (cfg_interrupt_msix_fail),

 .cfg_interrupt_msi_attr                    (cfg_interrupt_msi_attr),
 .cfg_interrupt_msi_tph_present             (cfg_interrupt_msi_tph_present),
 .cfg_interrupt_msi_tph_type                (cfg_interrupt_msi_tph_type),
 .cfg_interrupt_msi_tph_st_tag              (cfg_interrupt_msi_tph_st_tag),
 .cfg_interrupt_msi_function_number         (cfg_interrupt_msi_function_number),

 .cfg_hot_reset_out                         (cfg_hot_reset_out),
 .cfg_config_space_enable                   (cfg_config_space_enable),
 .cfg_req_pm_transition_l23_ready           (cfg_req_pm_transition_l23_ready),
  //------------------------------------------------------------------------------------------//
  // RP Only                                                                                  //
  //------------------------------------------------------------------------------------------//
 .cfg_hot_reset_in                          (cfg_hot_reset_in),

 .cfg_ds_bus_number                         (cfg_ds_bus_number),
 .cfg_ds_device_number                      (cfg_ds_device_number),
 .cfg_ds_function_number                    (cfg_ds_function_number)


  );

  // Common UsrApp

  pci_exp_usrapp_com com_usrapp   ();




endmodule
