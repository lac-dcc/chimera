//---------------------------------------------------------------------------   
// File:        ddr2_sdram.v
// Author:      Zhangxi Tan
// Description: Modified from ddr2_sdram.v
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
//  /   /         Filename: ddr2_sdram.v
// /___/   /\     Date Last Modified: $Date: 2008/07/09 12:33:12 $
// \   \  /  \    Date Created: Wed Aug 16 2006
//  \___\/\___\
//
//Device: Virtex-5
//Design Name: DDR2
//Purpose:
//   Top-level  module. Simple model for what the user might use
//   Typically, the user will only instantiate MEM_INTERFACE_TOP in their
//   code, and generate all backend logic (test bench) separately. 
//   In addition to the memory controller, the module instantiates:
//     1. IDELAY control block
//Reference:
//Revision History:
//*****************************************************************************

`timescale 1ns/1ps

(* X_CORE_INFO = "mig_v2_3_ddr2_sdram_v5, Coregen 10.1.02" , CORE_GENERATION_INFO = "ddr2_sdram_v5,mig_v2_3,{component_name=ddr2_sdram, BANK_WIDTH=2, CKE_WIDTH=1, CLK_WIDTH=2, COL_WIDTH=10, CS_NUM=1, CS_WIDTH=1, DM_WIDTH=8, DQ_WIDTH=64, DQ_PER_DQS=8, DQS_WIDTH=8, ODT_WIDTH=1, ROW_WIDTH=13, ADDITIVE_LAT=3, BURST_LEN=4, BURST_TYPE=0, CAS_LAT=4, ECC_ENABLE=0, MULTI_BANK_EN=1, TWO_T_TIME_EN=1, ODT_TYPE=1, REDUCE_DRV=0, REG_ENABLE=0, TREFI_NS=7800, TRAS=40000, TRCD=15000, TRFC=105000, TRP=15000, TRTP=7500, TWR=15000, TWTR=7500, DDR2_CLK_PERIOD=3750, RST_ACT_LOW=1}" *)
module ddr2_sdram #
  (
   parameter BANK_WIDTH              = 2,       
                                       // # of memory bank addr bits.
   parameter CKE_WIDTH               = 1,       
                                       // # of memory clock enable outputs.
   parameter CLK_WIDTH               = 2,       
                                       // # of clock outputs.
   parameter COL_WIDTH               = 10,       
                                       // # of memory column bits.
   parameter CS_NUM                  = 1,       
                                       // # of separate memory chip selects.
   parameter CS_WIDTH                = 1,       
                                       // # of total memory chip selects.
   parameter CS_BITS                 = 0,       
                                       // set to log2(CS_NUM) (rounded up).
   parameter DM_WIDTH                = 8,       
                                       // # of data mask bits.
   parameter DQ_WIDTH                = 64,       
                                       // # of data width.
   parameter DQ_PER_DQS              = 8,       
                                       // # of DQ data bits per strobe.
   parameter DQS_WIDTH               = 8,       
                                       // # of DQS strobes.
   parameter DQ_BITS                 = 6,       
                                       // set to log2(DQS_WIDTH*DQ_PER_DQS).
   parameter DQS_BITS                = 3,       
                                       // set to log2(DQS_WIDTH).
   parameter ODT_WIDTH               = 1,       
                                       // # of memory on-die term enables.
   parameter ROW_WIDTH               = 13,       
                                       // # of memory row and # of addr bits.
   parameter ADDITIVE_LAT            = 3,       
                                       // additive write latency.
   parameter BURST_LEN               = 4,       
                                       // burst length (in double words).
   parameter BURST_TYPE              = 0,       
                                       // burst type (=0 seq; =1 interleaved).
   parameter CAS_LAT                 = 4,       
                                       // CAS latency.
   parameter ECC_ENABLE              = 0,       
                                       // enable ECC (=1 enable).
   parameter APPDATA_WIDTH           = 128,       
                                       // # of usr read/write data bus bits.
   parameter MULTI_BANK_EN           = 1,       
                                       // Keeps multiple banks open. (= 1 enable).
   parameter TWO_T_TIME_EN           = 1,       
                                       // 2t timing for unbuffered dimms.
   parameter ODT_TYPE                = 1,       
                                       // ODT (=0(none),=1(75),=2(150),=3(50)).
   parameter REDUCE_DRV              = 0,       
                                       // reduced strength mem I/O (=1 yes).
   parameter REG_ENABLE              = 0,       
                                       // registered addr/ctrl (=1 yes).
   parameter TREFI_NS                = 7800,       
                                       // auto refresh interval (ns).
   parameter TRAS                    = 40000,       
                                       // active->precharge delay.
   parameter TRCD                    = 15000,       
                                       // active->read/write delay.
   parameter TRFC                    = 105000,       
                                       // refresh->refresh, refresh->active delay.
   parameter TRP                     = 15000,       
                                       // precharge->command delay.
   parameter TRTP                    = 7500,       
                                       // read->precharge delay.
   parameter TWR                     = 15000,       
                                       // used to determine write->precharge.
   parameter TWTR                    = 7500,       
                                       // write->read delay.
   parameter HIGH_PERFORMANCE_MODE   = "TRUE",       
                              // # = TRUE, the IODELAY performance mode is set
                              // to high.
                              // # = FALSE, the IODELAY performance mode is set
                              // to low.
   parameter SIM_ONLY                = 0,       
                                       // = 1 to skip SDRAM power up delay.
   parameter DEBUG_EN                = 0,       
                                       // Enable debug signals/controls.
                                       // When this parameter is changed from 0 to 1,
                                       // make sure to uncomment the coregen commands
                                       // in ise_flow.bat or create_ise.bat files in
                                       // par folder.
   parameter CLK_PERIOD              = 3750,       
                                       // Core/Memory clock period (in ps).
   parameter DQS_IO_COL              = 16'b0000000000000000,       
                                       // I/O column location of DQS groups
                                       // (=0, left; =1 center, =2 right).
   //parameter DQ_IO_MS                = 64'b10100101_10100101_10100101_10100101_10100101_10100101_10100101_10100101,       
   
   // ML505/506/507 order
   parameter DQ_IO_MS                = 64'b01110101_00111101_00001111_00011110_00101110_11000011_11000001_10111100,
   
                                    // Master/Slave location of DQ I/O (=0 slave).
   parameter CLK_TYPE                = "DIFFERENTIAL",       
                                       // # = "DIFFERENTIAL " ->; Differential input clocks ,
                                       // # = "SINGLE_ENDED" -> Single ended input clocks.
   parameter DLL_FREQ_MODE           = "HIGH",       
                                       // DCM Frequency range.
   parameter RST_ACT_LOW             = 1        
                                       // =1 for active low reset, =0 for active high.
   )
  (
   inout  [DQ_WIDTH-1:0]              ddr2_dq,
   output [ROW_WIDTH-1:0]             ddr2_a,
   output [BANK_WIDTH-1:0]            ddr2_ba,
   output                             ddr2_ras_n,
   output                             ddr2_cas_n,
   output                             ddr2_we_n,
   output [CS_WIDTH-1:0]              ddr2_cs_n,
   output [ODT_WIDTH-1:0]             ddr2_odt,
   output [CKE_WIDTH-1:0]             ddr2_cke,
   output [DM_WIDTH-1:0]              ddr2_dm,

   //added by xtan
   //clock & resets
   input                              rst0,
   input                              rst90,
   input                              rstdiv0,
   input                              rst200,
   input                              clk0,
   input                              clk90,
   input                              clkdiv0,
   input                              clk200,

   output			      idelay_ctrl_rdy,		//used for dramrst	

   input			      af_clk,			//address fifo clk
   input			      rb_clk,			//read buffer clk
   input		       wb_clk,			//write buffer clk
   input         rb_re,    //read buffer enable
   output			      rb_full,			//read buffer is full
   //end of add


   output                             phy_init_done,
   output                             app_wdf_afull,
   output                             app_af_afull,
   output                             rd_data_valid,
   input                              app_wdf_wren,
   input                              app_af_wren,
   input  [30:0]                      app_af_addr,
   input  [2:0]                       app_af_cmd,
   output [(APPDATA_WIDTH)-1:0]                rd_data_fifo_out,
   input  [(APPDATA_WIDTH)-1:0]                app_wdf_data,
   input  [(APPDATA_WIDTH/8)-1:0]              app_wdf_mask_data,
   inout  [DQS_WIDTH-1:0]             ddr2_dqs,
   inout  [DQS_WIDTH-1:0]             ddr2_dqs_n,
   output [CLK_WIDTH-1:0]             ddr2_ck,
   output [CLK_WIDTH-1:0]             ddr2_ck_n
   );

  /////////////////////////////////////////////////////////////////////////////
  // The following parameter "IDELAYCTRL_NUM" indicates the number of
  // IDELAYCTRLs that are LOCed for the design. The IDELAYCTRL LOCs are
  // provided in the UCF file of par folder. MIG provides the parameter value
  // and the LOCs in the UCF file based on the selected Data Read banks for
  // the design. You must not alter this value unless it is needed. If you
  // modify this value, you should make sure that the value of "IDELAYCTRL_NUM"
  // and IDELAYCTRL LOCs in UCF file are same and are relavent to the Data Read
  // banks used.
  /////////////////////////////////////////////////////////////////////////////

  localparam IDELAYCTRL_NUM = 3;



  //Debug signals


  wire [3:0]                        dbg_calib_done;
  wire [3:0]                        dbg_calib_err;
  wire [(6*DQ_WIDTH)-1:0]           dbg_calib_dq_tap_cnt;
  wire [(6*DQS_WIDTH)-1:0]          dbg_calib_dqs_tap_cnt;
  wire [(6*DQS_WIDTH)-1:0]          dbg_calib_gate_tap_cnt;
  wire [DQS_WIDTH-1:0]              dbg_calib_rd_data_sel;
  wire [(5*DQS_WIDTH)-1:0]          dbg_calib_rden_dly;
  wire [(5*DQS_WIDTH)-1:0]          dbg_calib_gate_dly;
  wire                              dbg_idel_up_all;
  wire                              dbg_idel_down_all;
  wire                              dbg_idel_up_dq;
  wire                              dbg_idel_down_dq;
  wire                              dbg_idel_up_dqs;
  wire                              dbg_idel_down_dqs;
  wire                              dbg_idel_up_gate;
  wire                              dbg_idel_down_gate;
  wire [DQ_BITS-1:0]                dbg_sel_idel_dq;
  wire                              dbg_sel_all_idel_dq;
  wire [DQS_BITS:0]                 dbg_sel_idel_dqs;
  wire                              dbg_sel_all_idel_dqs;
  wire [DQS_BITS:0]                 dbg_sel_idel_gate;
  wire                              dbg_sel_all_idel_gate;


    // Debug signals (optional use)

  //***********************************
  // PHY Debug Port demo
  //***********************************
  wire [35:0]                        cs_control0;
  wire [35:0]                        cs_control1;
  wire [35:0]                        cs_control2;
  wire [35:0]                        cs_control3;
  wire [191:0]                       vio0_in;
  wire [95:0]                        vio1_in;
  wire [99:0]                        vio2_in;
  wire [31:0]                        vio3_out;



  //***************************************************************************

   ddr2_idelay_ctrl #
   (
    .IDELAYCTRL_NUM         (IDELAYCTRL_NUM)
   )
   u_ddr2_idelay_ctrl
   (
   .rst200                 (rst200),
   .clk200                 (clk200),
   .idelay_ctrl_rdy        (idelay_ctrl_rdy)
   );

 
 ddr2_top #
 (
   .BANK_WIDTH             (BANK_WIDTH),
   .CKE_WIDTH              (CKE_WIDTH),
   .CLK_WIDTH              (CLK_WIDTH),
   .COL_WIDTH              (COL_WIDTH),
   .CS_NUM                 (CS_NUM),
   .CS_WIDTH               (CS_WIDTH),
   .CS_BITS                (CS_BITS),
   .DM_WIDTH               (DM_WIDTH),
   .DQ_WIDTH               (DQ_WIDTH),
   .DQ_PER_DQS             (DQ_PER_DQS),
   .DQS_WIDTH              (DQS_WIDTH),
   .DQ_BITS                (DQ_BITS),
   .DQS_BITS               (DQS_BITS),
   .ODT_WIDTH              (ODT_WIDTH),
   .ROW_WIDTH              (ROW_WIDTH),
   .ADDITIVE_LAT           (ADDITIVE_LAT),
   .BURST_LEN              (BURST_LEN),
   .BURST_TYPE             (BURST_TYPE),
   .CAS_LAT                (CAS_LAT),
   .ECC_ENABLE             (ECC_ENABLE),
   .APPDATA_WIDTH          (APPDATA_WIDTH),
   .MULTI_BANK_EN          (MULTI_BANK_EN),
   .TWO_T_TIME_EN          (TWO_T_TIME_EN),
   .ODT_TYPE               (ODT_TYPE),
   .REDUCE_DRV             (REDUCE_DRV),
   .REG_ENABLE             (REG_ENABLE),
   .TREFI_NS               (TREFI_NS),
   .TRAS                   (TRAS),
   .TRCD                   (TRCD),
   .TRFC                   (TRFC),
   .TRP                    (TRP),
   .TRTP                   (TRTP),
   .TWR                    (TWR),
   .TWTR                   (TWTR),
   .HIGH_PERFORMANCE_MODE  (HIGH_PERFORMANCE_MODE),
   .SIM_ONLY               (SIM_ONLY),
   .DEBUG_EN               (DEBUG_EN),
   .CLK_PERIOD             (CLK_PERIOD),
   .DQS_IO_COL             (DQS_IO_COL),
   .DQ_IO_MS               (DQ_IO_MS),
   .USE_DM_PORT            (1)
   )
u_ddr2_top_0
(
   .ddr2_dq                (ddr2_dq),
   .ddr2_a                 (ddr2_a),
   .ddr2_ba                (ddr2_ba),
   .ddr2_ras_n             (ddr2_ras_n),
   .ddr2_cas_n             (ddr2_cas_n),
   .ddr2_we_n              (ddr2_we_n),
   .ddr2_cs_n              (ddr2_cs_n),
   .ddr2_odt               (ddr2_odt),
   .ddr2_cke               (ddr2_cke),
   .ddr2_dm                (ddr2_dm),
   .phy_init_done          (phy_init_done),
   .rst0                   (rst0),
   .rst90                  (rst90),
   .rstdiv0                (rstdiv0),
   .clk0                   (clk0),
   .clk90                  (clk90),
   .clkdiv0                (clkdiv0),
   .af_clk                 (af_clk),
   .rb_clk                 (rb_clk),
   .wb_clk                 (wb_clk),
   .rb_re                  (rb_re),
   .rb_full                (rb_full),

   .app_wdf_afull          (app_wdf_afull),
   .app_af_afull           (app_af_afull),
   .rd_data_valid          (rd_data_valid),
   .app_wdf_wren           (app_wdf_wren),
   .app_af_wren            (app_af_wren),
   .app_af_addr            (app_af_addr),
   .app_af_cmd             (app_af_cmd),
   .rd_data_fifo_out       (rd_data_fifo_out),
   .app_wdf_data           (app_wdf_data),
   .app_wdf_mask_data      (app_wdf_mask_data),
   .ddr2_dqs               (ddr2_dqs),
   .ddr2_dqs_n             (ddr2_dqs_n),
   .ddr2_ck                (ddr2_ck),
   .rd_ecc_error           (),
   .ddr2_ck_n              (ddr2_ck_n),

   .dbg_calib_done         (dbg_calib_done),
   .dbg_calib_err          (dbg_calib_err),
   .dbg_calib_dq_tap_cnt   (dbg_calib_dq_tap_cnt),
   .dbg_calib_dqs_tap_cnt  (dbg_calib_dqs_tap_cnt),
   .dbg_calib_gate_tap_cnt  (dbg_calib_gate_tap_cnt),
   .dbg_calib_rd_data_sel  (dbg_calib_rd_data_sel),
   .dbg_calib_rden_dly     (dbg_calib_rden_dly),
   .dbg_calib_gate_dly     (dbg_calib_gate_dly),
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
   .dbg_sel_all_idel_gate  (dbg_sel_all_idel_gate)
   );

 
   //*****************************************************************
  // Hooks to prevent sim/syn compilation errors (mainly for VHDL - but
  // keep it also in Verilog version of code) w/ floating inputs if
  // DEBUG_EN = 0.
  //*****************************************************************

  generate
    if (DEBUG_EN == 0) begin: gen_dbg_tie_off
      assign dbg_idel_up_all       = 'b0;
      assign dbg_idel_down_all     = 'b0;
      assign dbg_idel_up_dq        = 'b0;
      assign dbg_idel_down_dq      = 'b0;
      assign dbg_idel_up_dqs       = 'b0;
      assign dbg_idel_down_dqs     = 'b0;
      assign dbg_idel_up_gate      = 'b0;
      assign dbg_idel_down_gate    = 'b0;
      assign dbg_sel_idel_dq       = 'b0;
      assign dbg_sel_all_idel_dq   = 'b0;
      assign dbg_sel_idel_dqs      = 'b0;
      assign dbg_sel_all_idel_dqs  = 'b0;
      assign dbg_sel_idel_gate     = 'b0;
      assign dbg_sel_all_idel_gate = 'b0;
    end else begin: gen_dbg_enable
      
      //*****************************************************************
      // PHY Debug Port example - see MIG User's Guide, XAPP858 or 
      // Answer Record 29443
      // This logic supports up to 32 DQ and 8 DQS I/O
      // NOTES:
      //   1. PHY Debug Port demo connects to 4 VIO modules:
      //     - 3 VIO modules with only asynchronous inputs
      //      * Monitor IDELAY taps for DQ, DQS, DQS Gate
      //      * Calibration status
      //     - 1 VIO module with synchronous outputs
      //      * Allow dynamic adjustment o f IDELAY taps
      //   2. User may need to modify this code to incorporate other
      //      chipscope-related modules in their larger design (e.g.
      //      if they have other ILA/VIO modules, they will need to
      //      for example instantiate a larger ICON module). In addition
      //      user may want to instantiate more VIO modules to control
      //      IDELAY for more DQ, DQS than is shown here
      //*****************************************************************

      icon4 u_icon
        (
         .control0 (cs_control0),
         .control1 (cs_control1),
         .control2 (cs_control2),
         .control3 (cs_control3)
         );

      //*****************************************************************
      // VIO ASYNC input: Display current IDELAY setting for up to 32
      // DQ taps (32x6) = 192
      //*****************************************************************

      vio_async_in192 u_vio0
        (
         .control  (cs_control0),
         .async_in (vio0_in)
         );

      //*****************************************************************
      // VIO ASYNC input: Display current IDELAY setting for up to 8 DQS
      // and DQS Gate taps (8x6x2) = 96
      //*****************************************************************

      vio_async_in96 u_vio1
        (
         .control  (cs_control1),
         .async_in (vio1_in)
         );

      //*****************************************************************
      // VIO ASYNC input: Display other calibration results
      //*****************************************************************

      vio_async_in100 u_vio2
        (
         .control  (cs_control2),
         .async_in (vio2_in)
         );
      
      //*****************************************************************
      // VIO SYNC output: Dynamically change IDELAY taps
      //*****************************************************************
      
      vio_sync_out32 u_vio3
        (
         .control  (cs_control3),
         .clk      (clkdiv0),
         .sync_out (vio3_out)
         );

      //*****************************************************************
      // Bit assignments:
      // NOTE: Not all VIO, ILA inputs/outputs may be used - these will
      //       be dependent on the user's particular bit width
      //*****************************************************************

      if (DQ_WIDTH <= 32) begin: gen_dq_le_32
        assign vio0_in[(6*DQ_WIDTH)-1:0] 
                 = dbg_calib_dq_tap_cnt[(6*DQ_WIDTH)-1:0];
      end else begin: gen_dq_gt_32
        assign vio0_in = dbg_calib_dq_tap_cnt[191:0];
      end

      if (DQS_WIDTH <= 8) begin: gen_dqs_le_8
        assign vio1_in[(6*DQS_WIDTH)-1:0]
                 = dbg_calib_dqs_tap_cnt[(6*DQS_WIDTH)-1:0];
        assign vio1_in[(12*DQS_WIDTH)-1:(6*DQS_WIDTH)] 
                 =  dbg_calib_gate_tap_cnt[(6*DQS_WIDTH)-1:0];
      end else begin: gen_dqs_gt_32
        assign vio1_in[47:0]  = dbg_calib_dqs_tap_cnt[47:0];
        assign vio1_in[95:48] = dbg_calib_gate_tap_cnt[47:0];
      end
 
//dbg_calib_rd_data_sel

     if (DQS_WIDTH <= 8) begin: gen_rdsel_le_8
        assign vio2_in[(DQS_WIDTH)+7:8]    
	         = dbg_calib_rd_data_sel[(DQS_WIDTH)-1:0];
     end else begin: gen_rdsel_gt_32
      assign vio2_in[15:8]    
                 = dbg_calib_rd_data_sel[7:0];
     end
 
//dbg_calib_rden_dly

     if (DQS_WIDTH <= 8) begin: gen_calrd_le_8
       assign vio2_in[(5*DQS_WIDTH)+19:20]   
                 = dbg_calib_rden_dly[(5*DQS_WIDTH)-1:0];
     end else begin: gen_calrd_gt_32
       assign vio2_in[59:20]   
                 = dbg_calib_rden_dly[39:0];
     end

//dbg_calib_gate_dly

     if (DQS_WIDTH <= 8) begin: gen_calgt_le_8
       assign vio2_in[(5*DQS_WIDTH)+59:60]   
                 = dbg_calib_gate_dly[(5*DQS_WIDTH)-1:0];
     end else begin: gen_calgt_gt_32
       assign vio2_in[99:60]   
                 = dbg_calib_gate_dly[39:0];
     end

//dbg_sel_idel_dq

     if (DQ_BITS <= 5) begin: gen_selid_le_5
       assign dbg_sel_idel_dq[DQ_BITS-1:0]      
                 = vio3_out[DQ_BITS+7:8];
     end else begin: gen_selid_gt_32
       assign dbg_sel_idel_dq[4:0]      
                 = vio3_out[12:8];
     end

//dbg_sel_idel_dqs

     if (DQS_BITS <= 3) begin: gen_seldqs_le_3
       assign dbg_sel_idel_dqs[DQS_BITS:0]     
                 = vio3_out[(DQS_BITS+16):16];
     end else begin: gen_seldqs_gt_32
       assign dbg_sel_idel_dqs[3:0]     
                 = vio3_out[19:16];
     end

//dbg_sel_idel_gate

     if (DQS_BITS <= 3) begin: gen_gtdqs_le_3
       assign dbg_sel_idel_gate[DQS_BITS:0]    
                 = vio3_out[(DQS_BITS+21):21];
     end else begin: gen_gtdqs_gt_32
       assign dbg_sel_idel_gate[3:0]    
                 = vio3_out[24:21];
     end


      assign vio2_in[3:0]              = dbg_calib_done;
      assign vio2_in[7:4]              = dbg_calib_err;
      
      assign dbg_idel_up_all           = vio3_out[0];
      assign dbg_idel_down_all         = vio3_out[1];
      assign dbg_idel_up_dq            = vio3_out[2];
      assign dbg_idel_down_dq          = vio3_out[3];
      assign dbg_idel_up_dqs           = vio3_out[4];
      assign dbg_idel_down_dqs         = vio3_out[5];
      assign dbg_idel_up_gate          = vio3_out[6];
      assign dbg_idel_down_gate        = vio3_out[7];
      assign dbg_sel_all_idel_dq       = vio3_out[15];
      assign dbg_sel_all_idel_dqs      = vio3_out[20];
      assign dbg_sel_all_idel_gate     = vio3_out[25];
    end
  endgenerate

endmodule
