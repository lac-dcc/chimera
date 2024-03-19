//---------------------------------------------------------------------------   
// File:        ddr2_top.v
// Author:      Zhangxi Tan
// Description: Modified from ddr2_top.v
//------------------------------------------------------------------------------

//*****************************************************************************
// DISCLAIMER OF LIABILITY
//
// This text/file contains proprietary, confidential
// information of Xilinx, Inc., is distributed under license
// from Xilinx, Inc., and may be used, copied and/or
// disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc. Xilinx hereby grants you a
// license to use this text/file solely for design, simulation,
// implementation and creation of design files limited
// to Xilinx devices or technologies. Use with non-Xilinx
// devices or technologies is expressly prohibited and
// immediately terminates your license unless covered by
// a separate agreement.
//
// Xilinx is providing this design, code, or information
// "as-is" solely for use in developing programs and
// solutions for Xilinx devices, with no obligation on the
// part of Xilinx to provide support. By providing this design,
// code, or information as one possible implementation of
// this feature, application or standard, Xilinx is making no
// representation that this implementation is free from any
// claims of infringement. You are responsible for
// obtaining any rights you may require for your implementation.
// Xilinx expressly disclaims any warranty whatsoever with
// respect to the adequacy of the implementation, including
// but not limited to any warranties or representations that this
// implementation is free from claims of infringement, implied
// warranties of merchantability or fitness for a particular
// purpose.
//
// Xilinx products are not intended for use in life support
// appliances, devices, or systems. Use in such applications is
// expressly prohibited.
//
// Any modifications that are made to the Source Code are
// done at the users sole risk and will be unsupported.
//
// Copyright (c) 2006-2007 Xilinx, Inc. All rights reserved.
//
// This copyright and support notice must be retained as part
// of this text at all times.
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: 2.3
//  \   \         Application: MIG
//  /   /         Filename: ddr2_top.v
// /___/   /\     Date Last Modified: $Date: 2008/07/29 15:24:03 $
// \   \  /  \    Date Created: Wed Aug 16 2006
//  \___\/\___\
//
//Device: Virtex-5
//Design Name: DDR2
//Purpose:
//   System level module. This level contains just the memory controller.
//   This level will be intiantated when the user wants to remove the
//   synthesizable test bench, IDELAY control block and the clock
//   generation modules.
//Reference:
//Revision History:
//*****************************************************************************

`timescale 1ns/1ps

module ddr2_top #
  (
   // Following parameters are for 72-bit RDIMM design (for ML561 Reference
   // board design). Actual values may be different. Actual parameters values
   // are passed from design top module ddr2_sdram module. Please refer to
   // the ddr2_sdram module for actual values.
   parameter BANK_WIDTH            = 2,      // # of memory bank addr bits
   parameter CKE_WIDTH             = 1,      // # of memory clock enable outputs
   parameter CLK_WIDTH             = 1,      // # of clock outputs
   parameter COL_WIDTH             = 10,     // # of memory column bits
   parameter CS_NUM                = 1,      // # of separate memory chip selects
   parameter CS_BITS               = 0,      // set to log2(CS_NUM) (rounded up)
   parameter CS_WIDTH              = 1,      // # of total memory chip selects
   parameter USE_DM_PORT           = 1,      // enable Data Mask (=1 enable)
   parameter DM_WIDTH              = 9,      // # of data mask bits
   parameter DQ_WIDTH              = 72,     // # of data width
   parameter DQ_BITS               = 7,      // set to log2(DQS_WIDTH*DQ_PER_DQS)
   parameter DQ_PER_DQS            = 8,      // # of DQ data bits per strobe
   parameter DQS_WIDTH             = 9,      // # of DQS strobes
   parameter DQS_BITS              = 4,      // set to log2(DQS_WIDTH)
   parameter HIGH_PERFORMANCE_MODE = "TRUE", // IODELAY Performance Mode
   parameter ODT_WIDTH             = 1,      // # of memory on-die term enables
   parameter ROW_WIDTH             = 14,     // # of memory row & # of addr bits
   parameter APPDATA_WIDTH         = 144,    // # of usr read/write data bus bits
   parameter ADDITIVE_LAT          = 0,      // additive write latency
   parameter BURST_LEN             = 4,      // burst length (in double words)
   parameter BURST_TYPE            = 0,      // burst type (=0 seq; =1 interlved)
   parameter CAS_LAT               = 5,      // CAS latency
   parameter ECC_ENABLE            = 0,      // enable ECC (=1 enable)
   parameter ODT_TYPE              = 1,      // ODT (=0(none),=1(75),=2(150),=3(50))
   parameter MULTI_BANK_EN         = 1,      // enable bank management
   parameter TWO_T_TIME_EN         = 0,      // 2t timing for unbuffered dimms
   parameter REDUCE_DRV            = 0,      // reduced strength mem I/O (=1 yes)
   parameter REG_ENABLE            = 1,      // registered addr/ctrl (=1 yes)
   parameter TREFI_NS              = 7800,   // auto refresh interval (ns)
   parameter TRAS                  = 40000,  // active->precharge delay
   parameter TRCD                  = 15000,  // active->read/write delay
   parameter TRFC                  = 105000, // ref->ref, ref->active delay
   parameter TRP                   = 15000,  // precharge->command delay
   parameter TRTP                  = 7500,   // read->precharge delay
   parameter TWR                   = 15000,  // used to determine wr->prech
   parameter TWTR                  = 10000,  // write->read delay
   parameter CLK_PERIOD            = 3000,   // Core/Mem clk period (in ps)
   parameter SIM_ONLY              = 0,      // = 1 to skip power up delay
   parameter DEBUG_EN              = 0,      // Enable debug signals/controls
   parameter DQS_IO_COL            = 0,      // I/O column location of DQS groups
   parameter DQ_IO_MS              = 0       // Master/Slave location of DQ I/O
   )
  (
   input                                    clk0,
   input                                    clk90,
   input                                    clkdiv0,
   input                                    rst0,
   input                                    rst90,
   input                                    rstdiv0,
   //added by xtan
   input				    af_clk,			//address fifo clk
   input				    rb_clk,			//read buffer clk
   input				    wb_clk,			//write buffer clk
   input        rb_re,    //read buffer enable
   output				    rb_full,			//read buffer is full
   //end of add
   input [2:0]                              app_af_cmd,
   input [30:0]                             app_af_addr,
   input                                    app_af_wren,
   input                                    app_wdf_wren,
   input [APPDATA_WIDTH-1:0]                app_wdf_data,
   input [(APPDATA_WIDTH/8)-1:0]            app_wdf_mask_data,
   output                                   app_af_afull,
   output                                   app_wdf_afull,
   output                                   rd_data_valid,
   output [APPDATA_WIDTH-1:0]               rd_data_fifo_out,
   output [1:0]                             rd_ecc_error,
   output                                   phy_init_done,
   output [CLK_WIDTH-1:0]                   ddr2_ck,
   output [CLK_WIDTH-1:0]                   ddr2_ck_n,
   output [ROW_WIDTH-1:0]                   ddr2_a,
   output [BANK_WIDTH-1:0]                  ddr2_ba,
   output                                   ddr2_ras_n,
   output                                   ddr2_cas_n,
   output                                   ddr2_we_n,
   output [CS_WIDTH-1:0]                    ddr2_cs_n,
   output [CKE_WIDTH-1:0]                   ddr2_cke,
   output [ODT_WIDTH-1:0]                   ddr2_odt,
   output [DM_WIDTH-1:0]                    ddr2_dm,
   inout [DQS_WIDTH-1:0]                    ddr2_dqs,
   inout [DQS_WIDTH-1:0]                    ddr2_dqs_n,
   inout [DQ_WIDTH-1:0]                     ddr2_dq,
   // Debug signals (optional use)
   input                                    dbg_idel_up_all,
   input                                    dbg_idel_down_all,
   input                                    dbg_idel_up_dq,
   input                                    dbg_idel_down_dq,
   input                                    dbg_idel_up_dqs,
   input                                    dbg_idel_down_dqs,
   input                                    dbg_idel_up_gate,
   input                                    dbg_idel_down_gate,
   input [DQ_BITS-1:0]                      dbg_sel_idel_dq,
   input                                    dbg_sel_all_idel_dq,
   input [DQS_BITS:0]                       dbg_sel_idel_dqs,
   input                                    dbg_sel_all_idel_dqs,
   input [DQS_BITS:0]                       dbg_sel_idel_gate,
   input                                    dbg_sel_all_idel_gate,
   output [3:0]                             dbg_calib_done,
   output [3:0]                             dbg_calib_err,
   output [(6*DQ_WIDTH)-1:0]                dbg_calib_dq_tap_cnt,
   output [(6*DQS_WIDTH)-1:0]               dbg_calib_dqs_tap_cnt,
   output [(6*DQS_WIDTH)-1:0]               dbg_calib_gate_tap_cnt,
   output [DQS_WIDTH-1:0]                   dbg_calib_rd_data_sel,
   output [(5*DQS_WIDTH)-1:0]               dbg_calib_rden_dly,
   output [(5*DQS_WIDTH)-1:0]               dbg_calib_gate_dly
   );

  // memory initialization/control logic
  ddr2_mem_if_top #
    (
     .BANK_WIDTH            (BANK_WIDTH),
     .CKE_WIDTH             (CKE_WIDTH),
     .CLK_WIDTH             (CLK_WIDTH),
     .COL_WIDTH             (COL_WIDTH),
     .CS_BITS               (CS_BITS),
     .CS_NUM                (CS_NUM),
     .CS_WIDTH              (CS_WIDTH),
     .USE_DM_PORT           (USE_DM_PORT),
     .DM_WIDTH              (DM_WIDTH),
     .DQ_WIDTH              (DQ_WIDTH),
     .DQ_BITS               (DQ_BITS),
     .DQ_PER_DQS            (DQ_PER_DQS),
     .DQS_BITS              (DQS_BITS),
     .DQS_WIDTH             (DQS_WIDTH),
     .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
     .ODT_WIDTH             (ODT_WIDTH),
     .ROW_WIDTH             (ROW_WIDTH),
     .APPDATA_WIDTH         (APPDATA_WIDTH),
     .ADDITIVE_LAT          (ADDITIVE_LAT),
     .BURST_LEN             (BURST_LEN),
     .BURST_TYPE            (BURST_TYPE),
     .CAS_LAT               (CAS_LAT),
     .ECC_ENABLE            (ECC_ENABLE),
     .MULTI_BANK_EN         (MULTI_BANK_EN),
     .TWO_T_TIME_EN         (TWO_T_TIME_EN),
     .ODT_TYPE              (ODT_TYPE),
     .DDR_TYPE              (1),
     .REDUCE_DRV            (REDUCE_DRV),
     .REG_ENABLE            (REG_ENABLE),
     .TREFI_NS              (TREFI_NS),
     .TRAS                  (TRAS),
     .TRCD                  (TRCD),
     .TRFC                  (TRFC),
     .TRP                   (TRP),
     .TRTP                  (TRTP),
     .TWR                   (TWR),
     .TWTR                  (TWTR),
     .CLK_PERIOD            (CLK_PERIOD),
     .SIM_ONLY              (SIM_ONLY),
     .DEBUG_EN              (DEBUG_EN),
     .DQS_IO_COL            (DQS_IO_COL),
     .DQ_IO_MS              (DQ_IO_MS)
     )
    u_mem_if_top
      (
       .clk0                   (clk0),
       .clk90                  (clk90),
       .clkdiv0                (clkdiv0),
       .rst0                   (rst0),
       .rst90                  (rst90),
       .rstdiv0                (rstdiv0),
       .af_clk                 (af_clk),
       .rb_clk                 (rb_clk),
       .wb_clk                 (wb_clk),
       .rb_re                  (rb_re),
       .rb_full                (rb_full),
       .app_af_cmd             (app_af_cmd),
       .app_af_addr            (app_af_addr),
       .app_af_wren            (app_af_wren),
       .app_wdf_wren           (app_wdf_wren),
       .app_wdf_data           (app_wdf_data),
       .app_wdf_mask_data      (app_wdf_mask_data),
       .app_af_afull           (app_af_afull),
       .app_wdf_afull          (app_wdf_afull),
       .rd_data_valid          (rd_data_valid),
       .rd_data_fifo_out       (rd_data_fifo_out),
       .rd_ecc_error           (rd_ecc_error),
       .phy_init_done          (phy_init_done),
       .ddr_ck                 (ddr2_ck),
       .ddr_ck_n               (ddr2_ck_n),
       .ddr_addr               (ddr2_a),
       .ddr_ba                 (ddr2_ba),
       .ddr_ras_n              (ddr2_ras_n),
       .ddr_cas_n              (ddr2_cas_n),
       .ddr_we_n               (ddr2_we_n),
       .ddr_cs_n               (ddr2_cs_n),
       .ddr_cke                (ddr2_cke),
       .ddr_odt                (ddr2_odt),
       .ddr_dm                 (ddr2_dm),
       .ddr_dqs                (ddr2_dqs),
       .ddr_dqs_n              (ddr2_dqs_n),
       .ddr_dq                 (ddr2_dq),
       .dbg_idel_up_all        (dbg_idel_up_all),
       .dbg_idel_down_all      (dbg_idel_down_all),
       .dbg_idel_up_dq         (dbg_idel_up_dq),
       .dbg_idel_down_dq       (dbg_idel_down_dq),
       .dbg_idel_up_dqs        (dbg_idel_up_dqs),
       .dbg_idel_down_dqs      (dbg_idel_down_dqs),
       .dbg_idel_up_gate       (dbg_idel_up_gate),
       .dbg_idel_down_gate     (dbg_idel_down_gate),
       .dbg_sel_idel_dq        (dbg_sel_idel_dq),
       .dbg_sel_all_idel_dq    (dbg_sel_all_idel_dq),
       .dbg_sel_idel_dqs       (dbg_sel_idel_dqs),
       .dbg_sel_all_idel_dqs   (dbg_sel_all_idel_dqs),
       .dbg_sel_idel_gate      (dbg_sel_idel_gate),
       .dbg_sel_all_idel_gate  (dbg_sel_all_idel_gate),
       .dbg_calib_done         (dbg_calib_done),
       .dbg_calib_err          (dbg_calib_err),
       .dbg_calib_dq_tap_cnt   (dbg_calib_dq_tap_cnt),
       .dbg_calib_dqs_tap_cnt  (dbg_calib_dqs_tap_cnt),
       .dbg_calib_gate_tap_cnt (dbg_calib_gate_tap_cnt),
       .dbg_calib_rd_data_sel  (dbg_calib_rd_data_sel),
       .dbg_calib_rden_dly     (dbg_calib_rden_dly),
       .dbg_calib_gate_dly     (dbg_calib_gate_dly)
       );

endmodule
