//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2012 Xilinx, Inc. All rights reserved.
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
// File       : PIO_EP.v
// Version    : 4.1
//
// Description: Endpoint Programmed I/O module.
//
//--------------------------------------------------------------------------------

`timescale 1ps/1ps

module PIO_EP #(
  parameter        TCQ = 1,
  parameter [1:0]  AXISTEN_IF_WIDTH = 00,
  parameter        AXISTEN_IF_RQ_ALIGNMENT_MODE    = "FALSE",
  parameter        AXISTEN_IF_CC_ALIGNMENT_MODE    = "FALSE",
  parameter        AXISTEN_IF_CQ_ALIGNMENT_MODE    = 0,
  parameter        AXISTEN_IF_RC_ALIGNMENT_MODE    = 0,
  parameter        AXISTEN_IF_ENABLE_CLIENT_TAG    = 0,
  parameter        AXISTEN_IF_RQ_PARITY_CHECK      = 0,
  parameter        AXISTEN_IF_CC_PARITY_CHECK      = 0,
  parameter        AXISTEN_IF_RC_STRADDLE          = 0,
  parameter        AXISTEN_IF_ENABLE_RX_MSG_INTFC  = 0,
  parameter [17:0] AXISTEN_IF_ENABLE_MSG_ROUTE     = 18'h2FFFF,

  //Do not modify the parameters below this line
  parameter C_DATA_WIDTH = (AXISTEN_IF_WIDTH[1]) ? 256 : (AXISTEN_IF_WIDTH[0])? 128 : 64,
  parameter PARITY_WIDTH = C_DATA_WIDTH /8,
  parameter KEEP_WIDTH   = C_DATA_WIDTH /32
) (

  input                            user_clk,
  input                            reset_n,


  // PIO TX Engine

            // AXI-S Completer Competion Interface

  output wire [C_DATA_WIDTH-1:0]   s_axis_cc_tdata,
  output wire   [KEEP_WIDTH-1:0]   s_axis_cc_tkeep,
  output wire                      s_axis_cc_tlast,
  output wire                      s_axis_cc_tvalid,
  output wire             [32:0]   s_axis_cc_tuser,
  input                            s_axis_cc_tready,

            // AXI-S Requester Request Interface

  output wire [C_DATA_WIDTH-1:0]   s_axis_rq_tdata,
  output wire   [KEEP_WIDTH-1:0]   s_axis_rq_tkeep,
  output wire                      s_axis_rq_tlast,
  output wire                      s_axis_rq_tvalid,
  output wire             [59:0]   s_axis_rq_tuser,
  input                            s_axis_rq_tready,

             // TX Message Interface

  input                            cfg_msg_transmit_done,
  output wire                      cfg_msg_transmit,
  output wire              [2:0]   cfg_msg_transmit_type,
  output wire             [31:0]   cfg_msg_transmit_data,

             //Tag availability and Flow control Information

  input                    [5:0]   pcie_rq_tag,
  input                            pcie_rq_tag_vld,
  input                    [1:0]   pcie_tfc_nph_av,
  input                    [1:0]   pcie_tfc_npd_av,
  input                            pcie_tfc_np_pl_empty,
  input                    [3:0]   pcie_rq_seq_num,
  input                            pcie_rq_seq_num_vld,

             //Cfg Flow Control Information

  input                    [7:0]   cfg_fc_ph,
  input                    [7:0]   cfg_fc_nph,
  input                    [7:0]   cfg_fc_cplh,
  input                   [11:0]   cfg_fc_pd,
  input                   [11:0]   cfg_fc_npd,
  input                   [11:0]   cfg_fc_cpld,
  output                    [2:0]   cfg_fc_sel,


  //PIO RX Engine

             // Completer Request Interface
  input       [C_DATA_WIDTH-1:0]   m_axis_cq_tdata,
  input                            m_axis_cq_tlast,
  input                            m_axis_cq_tvalid,
  input                   [84:0]   m_axis_cq_tuser,
  input         [KEEP_WIDTH-1:0]   m_axis_cq_tkeep,
  input                    [5:0]   pcie_cq_np_req_count,
  output wire                      m_axis_cq_tready,
  output wire                      pcie_cq_np_req,

             // Requester Completion Interface

  input       [C_DATA_WIDTH-1:0]   m_axis_rc_tdata,
  input                            m_axis_rc_tlast,
  input                            m_axis_rc_tvalid,
  input         [KEEP_WIDTH-1:0]   m_axis_rc_tkeep,
  input                   [74:0]   m_axis_rc_tuser,
  output wire                      m_axis_rc_tready,

             //RX Message Interface

  input                            cfg_msg_received,
  input                    [4:0]   cfg_msg_received_type,
  input                    [7:0]   cfg_msg_data,

  // PIO Interrupt Interface

  output wire                      interrupt_done,  // Indicates whether interrupt is done or in process

    // Legacy Interrupt Interface

  input                            cfg_interrupt_sent, // Core asserts this signal when it sends out a Legacy interrupt
  output wire              [3:0]   cfg_interrupt_int,  // 4 Bits for INTA, INTB, INTC, INTD (assert or deassert)

    // MSI Interrupt Interface

  input                            cfg_interrupt_msi_enable,
  input                            cfg_interrupt_msi_sent,
  input                            cfg_interrupt_msi_fail,

  output wire             [31:0]   cfg_interrupt_msi_int,

    //MSI-X Interrupt Interface

  input                            cfg_interrupt_msix_enable,
  input                            cfg_interrupt_msix_sent,
  input                            cfg_interrupt_msix_fail,

  output wire                      cfg_interrupt_msix_int,
  output wire             [63:0]   cfg_interrupt_msix_address,
  output wire             [31:0]   cfg_interrupt_msix_data,

  output                           req_completion,
  output                           completion_done,

	output [7:0] led

);

  // Local wires

  wire  [13:0]      rd_addr;
  wire  [3:0]       rd_be;
  wire  [31:0]      rd_data;

  wire  [13:0]      wr_addr;
  wire  [7:0]       wr_be;
  wire  [63:0]      wr_data;
  wire              wr_en;
  wire              wr_busy;

  wire              req_compl;
  wire              req_compl_wd;
  wire              req_compl_ur;
  wire              compl_done;

  wire  [2:0]       req_tc;
//  wire              req_td;
//  wire              req_ep;
  wire  [2:0]       req_attr;
  wire  [10:0]       req_len;
  wire  [15:0]      req_rid;
  wire  [7:0]       req_tag;
  wire  [7:0]       req_be;
  wire  [15:0]      req_addr;
  wire  [1:0]       req_at;
  wire              trn_sent;

  wire [63:0]       req_des_qword0;
  wire [63:0]       req_des_qword1;
  wire              req_des_tph_present;
  wire [1:0]        req_des_tph_type;
  wire [7:0]        req_des_tph_st_tag;

  wire              req_mem_lock;
  wire              req_mem;

  wire              payload_len;
//  wire  [15:0]      completer_id;  // currently not used

  wire              gen_transaction;
  wire              gen_leg_intr;
  wire              gen_msi_intr;
  wire              gen_msix_intr;


  //
  // ENDPOINT MEMORY : 8KB memory aperture implemented in FPGA BlockRAM(*)
  //

  PIO_EP_MEM_ACCESS EP_MEM (

    .user_clk(user_clk),     // I
    .reset_n(reset_n),       // I

    // Read Port

    .rd_addr(rd_addr),     // I [10:0]
    .rd_be(rd_be),         // I [3:0]
    .rd_data(rd_data),     // O [31:0]
    .trn_sent( trn_sent ),

    // Write Port

    .wr_addr(wr_addr),     // I [10:0]
    .wr_be(wr_be),         // I [7:0]
    .wr_data(wr_data),     // I [63:0]
    .wr_en(wr_en),         // I
    .wr_busy(wr_busy),     // O

    .payload_len(payload_len),
    .gen_msix_intr(gen_msix_intr),
    .gen_msi_intr(gen_msi_intr),
    .gen_leg_intr(gen_leg_intr),
    .gen_transaction(gen_transaction),

	.led(led)
  );

  //
  // Local-Link Receive Controller
  //

  PIO_RX_ENGINE #(
    .TCQ(TCQ),
    .AXISTEN_IF_WIDTH               ( AXISTEN_IF_WIDTH ),
    .AXISTEN_IF_CQ_ALIGNMENT_MODE   ( AXISTEN_IF_CQ_ALIGNMENT_MODE ),
    .AXISTEN_IF_RC_ALIGNMENT_MODE   ( AXISTEN_IF_RC_ALIGNMENT_MODE ),
    .AXISTEN_IF_RC_STRADDLE         ( AXISTEN_IF_RC_STRADDLE ),
    .AXISTEN_IF_ENABLE_RX_MSG_INTFC ( AXISTEN_IF_ENABLE_RX_MSG_INTFC ),
    .AXISTEN_IF_ENABLE_MSG_ROUTE    ( AXISTEN_IF_ENABLE_MSG_ROUTE )
  ) EP_RX (

    .user_clk( user_clk ),
    .reset_n( reset_n ),

    // Target Request Interface
    .m_axis_cq_tdata( m_axis_cq_tdata ),
    .m_axis_cq_tlast( m_axis_cq_tlast ),
    .m_axis_cq_tvalid( m_axis_cq_tvalid ),
    .m_axis_cq_tuser( m_axis_cq_tuser ),
    .m_axis_cq_tkeep( m_axis_cq_tkeep ),
    .m_axis_cq_tready( m_axis_cq_tready ),
    .pcie_cq_np_req_count ( pcie_cq_np_req_count ),
    .pcie_cq_np_req ( pcie_cq_np_req ),


   // Master Completion Interface

    .m_axis_rc_tdata( m_axis_rc_tdata ),
    .m_axis_rc_tkeep( m_axis_rc_tkeep ),
    .m_axis_rc_tlast( m_axis_rc_tlast ),
    .m_axis_rc_tvalid( m_axis_rc_tvalid ),
    .m_axis_rc_tuser( m_axis_rc_tuser ),
    .m_axis_rc_tready( m_axis_rc_tready ),

   //RX Message Interface

    .cfg_msg_received( cfg_msg_received ),
    .cfg_msg_received_type( cfg_msg_received_type ),
    .cfg_msg_data( cfg_msg_data ),

    .req_compl( req_compl ),
    .req_compl_wd( req_compl_wd ),
    .req_compl_ur( req_compl_ur ),
    .compl_done( compl_done ),

    .req_tc( req_tc ),
//    .req_td( req_td ),
//    .req_ep( req_ep ),
    .req_attr( req_attr ),
    .req_len( req_len ),
    .req_rid( req_rid ),
    .req_tag( req_tag ),
    .req_be( req_be ),
    .req_addr( req_addr ),
    .req_at( req_at ),

    .req_des_qword0( req_des_qword0 ),
    .req_des_qword1( req_des_qword1 ),
    .req_des_tph_present( req_des_tph_present ),
    .req_des_tph_type( req_des_tph_type ),
    .req_des_tph_st_tag( req_des_tph_st_tag ),
    .req_mem_lock( req_mem_lock ),
    .req_mem( req_mem ),

    .wr_addr( wr_addr ),
    .wr_be( wr_be ),
    .wr_data( wr_data ),
    .wr_en( wr_en ),
    .payload_len( payload_len ),
    .wr_busy( wr_busy)
  );

    //
    // Local-Link Transmit Controller
    //

  PIO_TX_ENGINE #(
    .TCQ( TCQ ),
    .AXISTEN_IF_WIDTH             ( AXISTEN_IF_WIDTH ),
    .AXISTEN_IF_RQ_ALIGNMENT_MODE ( AXISTEN_IF_RQ_ALIGNMENT_MODE ),
    .AXISTEN_IF_CC_ALIGNMENT_MODE ( AXISTEN_IF_CC_ALIGNMENT_MODE ),
    .AXISTEN_IF_ENABLE_CLIENT_TAG ( AXISTEN_IF_ENABLE_CLIENT_TAG ),
    .AXISTEN_IF_RQ_PARITY_CHECK   ( AXISTEN_IF_RQ_PARITY_CHECK ),
    .AXISTEN_IF_CC_PARITY_CHECK   ( AXISTEN_IF_CC_PARITY_CHECK )
  )EP_TX(
    .user_clk( user_clk ),
    .reset_n( reset_n ),

    // AXI-S Target Competion Interface

    .s_axis_cc_tdata( s_axis_cc_tdata ),
    .s_axis_cc_tkeep ( s_axis_cc_tkeep ),
//    .s_axis_cc_tparity( s_axis_cc_tparity ),
    .s_axis_cc_tlast( s_axis_cc_tlast ),
    .s_axis_cc_tvalid( s_axis_cc_tvalid ),
    .s_axis_cc_tuser( s_axis_cc_tuser ),
    .s_axis_cc_tready( s_axis_cc_tready ),

    // AXI-S Master Request Interface

    .s_axis_rq_tdata( s_axis_rq_tdata ),
    .s_axis_rq_tkeep( s_axis_rq_tkeep ),
//    .s_axis_rq_tparity( s_axis_rq_tparity ),
    .s_axis_rq_tlast( s_axis_rq_tlast ),
    .s_axis_rq_tvalid( s_axis_rq_tvalid ),
    .s_axis_rq_tuser( s_axis_rq_tuser ),
    .s_axis_rq_tready( s_axis_rq_tready ),

    // TX Message Interface

    .cfg_msg_transmit_done( cfg_msg_transmit_done ),
    .cfg_msg_transmit( cfg_msg_transmit ),
    .cfg_msg_transmit_type( cfg_msg_transmit_type ),
    .cfg_msg_transmit_data( cfg_msg_transmit_data ),

    //Tag availability and Flow control Information

    .pcie_rq_tag( pcie_rq_tag ),
    .pcie_rq_tag_vld( pcie_rq_tag_vld ),
    .pcie_tfc_nph_av( pcie_tfc_nph_av ),
    .pcie_tfc_npd_av( pcie_tfc_npd_av ),
    .pcie_tfc_np_pl_empty( pcie_tfc_np_pl_empty ),
    .pcie_rq_seq_num( pcie_rq_seq_num ),
    .pcie_rq_seq_num_vld( pcie_rq_seq_num_vld ),

    //Cfg Flow Control Information

    .cfg_fc_ph( cfg_fc_ph ),
    .cfg_fc_nph( cfg_fc_nph ),
    .cfg_fc_cplh( cfg_fc_cplh ),
    .cfg_fc_pd( cfg_fc_pd ),
    .cfg_fc_npd( cfg_fc_npd ),
    .cfg_fc_cpld( cfg_fc_cpld ),
    .cfg_fc_sel( cfg_fc_sel ),


    // PIO RX Engine Interface

    .req_compl( req_compl ),
    .req_compl_wd( req_compl_wd ),
    .req_compl_ur( req_compl_ur ),
    .payload_len ( payload_len ),
    .compl_done( compl_done ),

    .req_tc( req_tc ),
    .req_td(1'b0),
    .req_ep(1'b0),
    .req_attr( req_attr[1:0] ),
    .req_len( req_len ),
    .req_rid( req_rid ),
    .req_tag( req_tag ),
    .req_be( req_be ),
    .req_addr( req_addr ),
    .req_at( req_at ),

    .req_des_qword0( req_des_qword0 ),
    .req_des_qword1( req_des_qword1 ),
    .req_des_tph_present( req_des_tph_present ),
    .req_des_tph_type( req_des_tph_type ),
    .req_des_tph_st_tag( req_des_tph_st_tag ),
    .req_mem_lock( req_mem_lock ),
    .req_mem( req_mem ),

    .completer_id(16'h0),

    // PIO Memory Access Control Interface

    .rd_addr( rd_addr ),
    .rd_be( rd_be ),
    .rd_data( rd_data ),
    .trn_sent( trn_sent ),
    .gen_transaction( gen_transaction )

    );

  PIO_INTR_CTRL EP_INTR_CTRL(

    .user_clk( user_clk ),
    .reset_n( reset_n ),

    // Trigger to generate interrupts (to / from Mem access Block)

    .gen_leg_intr( gen_leg_intr ),
    .gen_msi_intr( gen_msi_intr ),
    .gen_msix_intr( gen_msix_intr ),
    .interrupt_done( interrupt_done ),

    // Legacy Interrupt Interface

    .cfg_interrupt_sent( cfg_interrupt_sent ),
    .cfg_interrupt_int( cfg_interrupt_int ),

    // MSI Interrupt Interface

    .cfg_interrupt_msi_enable( cfg_interrupt_msi_enable ),
    .cfg_interrupt_msi_sent( cfg_interrupt_msi_sent ),
    .cfg_interrupt_msi_fail( cfg_interrupt_msi_fail ),

    .cfg_interrupt_msi_int( cfg_interrupt_msi_int ),

    //MSI-X Interrupt Interface

    .cfg_interrupt_msix_enable( cfg_interrupt_msix_enable ),
    .cfg_interrupt_msix_sent( cfg_interrupt_msix_sent ),
    .cfg_interrupt_msix_fail( cfg_interrupt_msix_fail ),

    .cfg_interrupt_msix_int( cfg_interrupt_msix_int ),
    .cfg_interrupt_msix_address( cfg_interrupt_msix_address ),
    .cfg_interrupt_msix_data( cfg_interrupt_msix_data )

    );

    assign req_completion = req_compl || req_compl_wd || req_compl_ur;
    assign completion_done = compl_done || interrupt_done ;

endmodule // PIO_EP



