// This program was cloned from: https://github.com/M17-Project/OpenHT-fpga
// License: GNU General Public License v3.0

// =============================================================================
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// -----------------------------------------------------------------------------
// Copyright (c) 2018 by Lattice Semiconductor Corporation
// ALL RIGHTS RESERVED
// --------------------------------------------------------------------
//
// Permission:
//
// Lattice SG Pte. Ltd. grants permission to use this code
// pursuant to the terms of the Lattice Reference Design License Agreement.
//
//
// Disclaimer:
//
// This VHDL or Verilog source code is intended as a design reference
// which illustrates how these types of functions can be implemented.
// It is the user's responsibility to verify their design for
// consistency and functionality through the use of formal
// verification methods. Lattice provides no warranty
// regarding the use or functionality of this code.
//
// -----------------------------------------------------------------------------
//
//                     Lattice SG Pte. Ltd.
//                     101 Thomson Road, United Square #07-02
//                     Singapore 307591
//
//
//                     TEL: 1-800-Lattice (USA and Canada)
//                     +65-6631-2000 (Singapore)
//                     +1-503-268-8001 (other locations)
//
//                     web: http://www.latticesemi.com/
//                     email: techsupport@latticesemi.com
//
// -----------------------------------------------------------------------------
//
// =============================================================================
// FILE DETAILS
// Project : <>
// File : tb_top.v
// Title :
// Dependencies :
// Description :
// =============================================================================
// REVISION HISTORY
// Version : 1.0
// Author(s) :
// Mod. Date :    02.13.2019
// Changes Made : Initial version
// -----------------------------------------------------------------------------
// Version : 1.0
// Author(s) :
// Mod. Date :
// Changes Made :
// =============================================================================


`ifndef __TB_TOP__
`define __TB_TOP__

`timescale 1ps/100fs

module tb_top();

`include "dut_params.v"

parameter  CLK_IN_PERIOD = 1000000/(2*CLKI_FREQ);
reg        clki_i;
reg        rstn_i;
reg        lmmi_clk_i, lmmi_resetn_i, lmmi_request_i, lmmi_wr_rdn_i;
reg  [6:0] lmmi_offset_i;
reg  [7:0] lmmi_wdata_i;
wire [7:0] lmmi_rdata_o;
wire       lmmi_rdata_valid_o, lmmi_ready_o;
wire       lock_o;
wire       clkop_o, clkos_o, clkos2_o, clkos3_o, clkos4_o, clkos5_o;
reg error_flag_w;
reg error_flag_w2;
reg error_flag_w3;
reg error_flag_w4;
reg error_flag_w5;
reg error_flag_w6;
integer    i;
realtime phase_fbk_time = 0;
reg enclkop_i;
reg enclkos_i;
reg enclkos2_i;
reg enclkos3_i;
reg enclkos4_i;
reg enclkos5_i;
// local variables for clkop
real clk_freq_clkop;          // clk freq (measured)
localparam exp_clk_freq_clkop = (CLKOP_BYPASS == 0)? CLKOP_FREQ_ACTUAL : CLKI_FREQ;    // expected clk freq (calculated from equation)
realtime time_phase_clkop = 0;      // expected phase time
real phase_shift_actual_clkop;
wire done_r;
wire dyn_p_start_r;
wire dyn_s_start_r;
wire dyn_s2_start_r;
wire dyn_s3_start_r;
wire dyn_s4_start_r;
wire dyn_s5_start_r;
wire dyn_p_end_r;
reg lock_done;
reg dyn_p_done;
reg dyn_s_done;
reg dyn_s2_done;
reg dyn_s3_done;
reg dyn_s4_done;
reg dyn_s5_done;

reg error_flag_lock;


realtime trim_rise_fbk = 0;
realtime trim_fall_fbk = 0;

reg            phasedir_i;
reg            phasestep_i;
reg            phaseloadreg_i;
reg      [2:0] phasesel_i;

reg    pllpd_en_n_i;
reg    legacy_i;

reg  refdetreset;
wire refdetlos;

reg first_sample_trim_clkop;
reg first_sample_trim_clkos;

// local variables for clkos
realtime prev_time_clkos = 0;     // store previous clk posedge
realtime curr_time_clkos = 0;     // store current clk posedge
real clk_freq_clkos;          // clk freq (measured)
localparam exp_clk_freq_clkos = (CLKOS_BYPASS == 0)? CLKOS_FREQ_ACTUAL : CLKI_FREQ;      // expected clk freq (calculated from equation)
realtime time_phase_clkos = 0;      // expected phase time
real phase_shift_actual_clkos;

reg error_flag_pdn;

reg error_flag_reset;
reg reset_done;


///trim
reg error_trim_rise_p;
reg error_trim_rise_s;
reg error_trim_fall_p;
reg error_trim_fall_s;

realtime edge_trim_rise_clkop= 0;      // expected phase time
realtime edge_trim_rise_clkos= 0;
real time_trim_rise_clkop;
real time_trim_rise_clkos;

realtime edge_trim_fall_clkop= 0;      // expected phase time
realtime edge_trim_fall_clkos= 0;
real time_trim_fall_clkop;
real time_trim_fall_clkos;

reg error_dyn_phase_p;
reg error_dyn_phase_s;
reg error_dyn_phase_s2;
reg error_dyn_phase_s3;
reg error_dyn_phase_s4;
reg error_dyn_phase_s5;


// local variables for clkos2
realtime prev_time_clkos2 = 0;     // store previous clk posedge
realtime curr_time_clkos2 = 0;     // store current clk posedge
real clk_freq_clkos2;          // clk freq (measured)
localparam exp_clk_freq_clkos2 = (CLKOS2_BYPASS == 0)? CLKOS2_FREQ_ACTUAL : CLKI_FREQ;       // expected clk freq (calculated from equation)
realtime time_phase_clkos2 = 0;      // expected phase realtime
real phase_shift_actual_clkos2;


// local variables for clkos3
realtime prev_time_clkos3 = 0;     // store previous clk posedge
realtime curr_time_clkos3 = 0;     // store current clk posedge
real clk_freq_clkos3;          // clk freq (measured)
localparam exp_clk_freq_clkos3 = (CLKOS3_BYPASS == 0)? CLKOS3_FREQ_ACTUAL : CLKI_FREQ;      // expected clk freq (calculated from equation)
realtime time_phase_clkos3 = 0;      // expected phase time
real phase_shift_actual_clkos3;

    // local variables for clkos4
realtime prev_time_clkos4 = 0;     // store previous clk posedge
realtime curr_time_clkos4 = 0;     // store current clk posedge
real clk_freq_clkos4;          // clk freq (measured)
localparam exp_clk_freq_clkos4 = (CLKOS4_BYPASS == 0)? CLKOS4_FREQ_ACTUAL : CLKI_FREQ;       // expected clk freq (calculated from equation)
realtime time_phase_clkos4 = 0;      // expected phase time
real phase_shift_actual_clkos4;

reg powerdown_done;


    // local variables for clkos5
realtime prev_time_clkos5 = 0;     // store previous clk posedge
realtime curr_time_clkos5 = 0;     // store current clk posedge
real clk_freq_clkos5;          // clk freq (measured)
localparam exp_clk_freq_clkos5 = (CLKOS5_BYPASS == 0)? CLKOS5_FREQ_ACTUAL : CLKI_FREQ;      // expected clk freq (calculated from equation)
realtime time_phase_clkos5 = 0;      // expected phase time
real phase_shift_actual_clkos5;

real  phase_shift_expected_clkop = CLKOP_PHASE_ACTUAL;
real  phase_shift_expected_clkos = CLKOS_PHASE_ACTUAL;
real  phase_shift_expected_clkos2 = CLKOS2_PHASE_ACTUAL;
real  phase_shift_expected_clkos3 = CLKOS3_PHASE_ACTUAL;
real  phase_shift_expected_clkos4 = CLKOS4_PHASE_ACTUAL;
real  phase_shift_expected_clkos5 = CLKOS5_PHASE_ACTUAL;


reg    apb_penable_i;
reg    apb_psel_i ;
reg    apb_pwrite_i ;
reg    [7:0] apb_paddr_i;
reg    [8:0 ]apb_pwdata_i;

reg  [31:0]  clkop_trim_cnt_rise;
reg  [31:0]  clkos_trim_cnt_rise;
reg  [31:0]  clkop_trim_cnt_fall;
reg  [31:0]  clkos_trim_cnt_fall;
reg   clkop_trim_rise_test_done ;
reg   clkos_trim_rise_test_done ;
reg   clkop_trim_fall_test_done ;
reg   clkos_trim_fall_test_done ;

wire clkop_error_detected  ;
wire clkos_error_detected  ;
wire clkos2_error_detected ;
wire clkos3_error_detected ;
wire clkos4_error_detected ;
wire clkos5_error_detected ;
wire clkop_test_done  ;
wire clkos_test_done  ;
wire clkos2_test_done ;
wire clkos3_test_done ;
wire clkos4_test_done ;
wire clkos5_test_done ;

localparam fbk_freq = (FBK_MODE == "CLKOP" || FBK_MODE == "INTCLKOP")? exp_clk_freq_clkop:
                          (FBK_MODE == "CLKOS" || FBK_MODE == "INTCLKOS")? exp_clk_freq_clkos:
                          (FBK_MODE == "CLKOS2" || FBK_MODE == "INTCLKOS2")? exp_clk_freq_clkos2:
                          (FBK_MODE == "CLKOS3" || FBK_MODE == "INTCLKOS3")? exp_clk_freq_clkos3:
                          (FBK_MODE == "CLKOS4" || FBK_MODE == "INTCLKOS4")? exp_clk_freq_clkos4:
                          (FBK_MODE == "CLKOS5" || FBK_MODE == "INTCLKOS5")? exp_clk_freq_clkos5:
              exp_clk_freq_clkos5;

localparam clkop_trim_time = (CLKOP_TRIM == "0b0000" || CLKOP_TRIM == "0b1000")? 0.00:
                             (CLKOP_TRIM == "0b0001" || CLKOP_TRIM == "0b1001")? 70.00:
                             (CLKOP_TRIM == "0b0010" || CLKOP_TRIM == "0b1010")? 140.00:
                 280.00;

localparam clkos_trim_time = (CLKOS_TRIM == "0b0000" || CLKOS_TRIM == "0b1000")? 0.00:
                             (CLKOS_TRIM == "0b0001" || CLKOS_TRIM == "0b1001")? 70.00:
                             (CLKOS_TRIM == "0b0010" || CLKOS_TRIM == "0b1010")? 140.00:
                 280.00;

////initialize
initial begin
  refdetreset = 1'b0;
  powerdown_done = (POWERDOWN_EN == 1)? 0 : 1;

  clkop_trim_rise_test_done = (((TRIM_EN_P == 1 && CLKOP_TRIM_MODE == "Rising") || (TRIM_EN_S == 1 && CLKOS_TRIM_MODE == "Rising")) && DYN_PORTS_EN == 0)? 0 : 1;
  clkos_trim_rise_test_done = (((TRIM_EN_P == 1 && CLKOP_TRIM_MODE == "Rising") || (TRIM_EN_S == 1 && CLKOS_TRIM_MODE == "Rising"))  && DYN_PORTS_EN == 0)? 0 : 1;

  clkop_trim_fall_test_done = (((TRIM_EN_P == 1 && CLKOP_TRIM_MODE == "Falling") || (TRIM_EN_S == 1 && CLKOS_TRIM_MODE == "Falling")) && DYN_PORTS_EN == 0)? 0 : 1;
  clkos_trim_fall_test_done = (((TRIM_EN_P == 1 && CLKOP_TRIM_MODE == "Falling") || (TRIM_EN_S == 1 && CLKOS_TRIM_MODE == "Falling")) && DYN_PORTS_EN == 0)? 0 : 1;

  dyn_p_done = (DYN_PORTS_EN == 1 && FBK_MODE != "CLKOP" && FBK_MODE != "INTCLKOP" && CLKOP_BYPASS == 0 && TRIM_EN_P == 0)? 0 : 1;
  dyn_s_done = (DYN_PORTS_EN == 1 && CLKOS_EN == 1 && FBK_MODE != "CLKOS" && FBK_MODE != "INTCLKOS" && CLKOS_BYPASS == 0)? 0 : 1;
  dyn_s2_done = (DYN_PORTS_EN == 1 && CLKOS2_EN == 1 && FBK_MODE != "CLKOS2" && FBK_MODE != "INTCLKOS2" && CLKOS2_BYPASS == 0)? 0 : 1;
  dyn_s3_done = (DYN_PORTS_EN == 1 && CLKOS3_EN == 1 && FBK_MODE != "CLKOS3" && FBK_MODE != "INTCLKOS3" && CLKOS3_BYPASS == 0)? 0 : 1;
  dyn_s4_done = (DYN_PORTS_EN == 1 && CLKOS4_EN == 1 && FBK_MODE != "CLKOS4" && FBK_MODE != "INTCLKOS4" && CLKOS4_BYPASS == 0)? 0 : 1;
  dyn_s5_done = (DYN_PORTS_EN == 1 && CLKOS5_EN == 1 && FBK_MODE != "CLKOS5" && FBK_MODE != "INTCLKOS5" && CLKOS5_BYPASS == 0)? 0 : 1;
  reset_done = 1'b0;
  clkop_trim_cnt_rise = 32'd0;
  clkos_trim_cnt_rise = 32'd0;
  clkop_trim_cnt_fall = 32'd0;
  clkos_trim_cnt_fall = 32'd0;
    error_dyn_phase_p = 1'b0;
    error_dyn_phase_s = 1'b0;
    error_dyn_phase_s2 = 1'b0;
    error_dyn_phase_s3 = 1'b0;
    error_dyn_phase_s4 = 1'b0;
    error_dyn_phase_s5 = 1'b0;
    error_flag_pdn = 1'b0;
    error_flag_w = 1'b0;
    error_flag_w2 = 1'b0;
    error_flag_w3 = 1'b0;
    error_flag_w4 = 1'b0;
    error_flag_w5 = 1'b0;
    error_flag_w6 = 1'b0;
  error_flag_reset = 1'b0;

  error_trim_rise_p = 1'b0;
    error_trim_rise_s = 1'b0;
    error_trim_fall_p = 1'b0;
    error_trim_fall_s = 1'b0;

    first_sample_trim_clkop  = 1'b0;
    first_sample_trim_clkos  = 1'b0;

  error_flag_lock = 1'b0;

  lock_done = 1'b1;
  pllpd_en_n_i = 1'b1;
  legacy_i = 1'b0;
    phasedir_i = 1'b1;
    phasestep_i = 1'b0;
    phaseloadreg_i = 1'b0;
    phasesel_i [2:0] = 3'b000;

  end


generate
   if (ENCLKOP_EN == 1) begin
    initial begin
        enclkop_i = 1;
        #5000000;
        enclkop_i = 0;
    #5000000;
    enclkop_i = 1;
  end
  end
endgenerate


generate
   if (ENCLKOS_EN == 1) begin
    initial begin
        enclkos_i = 1;
        #5000000;
        enclkos_i = 0;
    #5000000;
    enclkos_i = 1;
  end
  end
endgenerate

generate
   if (ENCLKOS2_EN == 1) begin
    initial begin
        enclkos2_i = 1;
        #5000000;
        enclkos2_i = 0;
    #5000000;
    enclkos2_i = 1;
  end
  end
endgenerate


generate
   if (ENCLKOS3_EN == 1) begin
    initial begin
        enclkos3_i = 1;
        #5000000;
        enclkos3_i = 0;
    #5000000;
    enclkos3_i = 1;
  end
  end
endgenerate


generate
   if (ENCLKOS4_EN == 1) begin
    initial begin
        enclkos4_i = 1;
        #5000000;
        enclkos4_i = 0;
    #5000000;
    enclkos4_i = 1;
  end
  end
endgenerate

generate
   if (ENCLKOS5_EN == 1) begin
    initial begin
        enclkos5_i = 1;
        #5000000;
        enclkos5_i = 0;
    #5000000;
    enclkos5_i = 1;
  end
  end
endgenerate

initial begin
  clki_i = 0;
  forever clki_i = #(CLK_IN_PERIOD) ~clki_i;
end

reg CLK_GSR;
initial begin
  CLK_GSR = 0;
  forever CLK_GSR = #5 ~CLK_GSR;
end

///////////////////// GSR /////////////////////
reg USER_GSR = 1;
wire GSROUT;

initial begin
forever begin
#5;
CLK_GSR = ~CLK_GSR;
end
end

GSR GSR_INST (
.GSR_N(USER_GSR),
.CLK(CLK_GSR)
);
/////////////////////////////////////////////////



//version 1.1
// GSR  GSR_INST(
   // .GSR     (1'b0   )
  // ,.CLK     (CLK_GSR)
  // ,.GSROUT  (GSROUT )
// );

wire   usr_fbclk_i;
assign usr_fbclk_i = (FBK_MODE == "USERFBCLK")? clkop_o : 1'b0;

initial begin
  rstn_i = 0;
  lmmi_resetn_i = 1;
  lmmi_clk_i = 1'b1;
  #300000
  $display(" ---------------------------------------------- ");
  $display("\tINFO: RESET DONE: --" );
  $display(" ---------------------------------------------- ");
  reset_done = 1;
  rstn_i = 1;
  lmmi_resetn_i = 1;
  lmmi_request_i  = 1;
  lmmi_wr_rdn_i   = 1;
  lmmi_wdata_i    = 8'hFF;
  lmmi_offset_i   = 7'h7F;
  apb_penable_i = 1;
  apb_psel_i = 1;
  apb_pwrite_i = 1;
  apb_paddr_i = 7'h7F;
  apb_pwdata_i = 8'hFF;

  end


  //#1000
  //$display("Simtime: %d LMMI test begin", $stime);
  //for (i=0; i<54; i=i+1) begin
  //  @(negedge lmmi_clk_i) begin
  //    lmmi_request_i  <= 1;
  //    lmmi_wdata_i    <= 8'hff;
  //    lmmi_offset_i   <= 7'h35;
  //  end
  //  @(negedge lmmi_clk_i)
  //    lmmi_request_i  <= 0;
  //  @(negedge lmmi_clk_i);
  //end
  //$display("Simtime: %d LMMI test end", $stime);


 generate
    if (PLL_LOCK_STICKY == 1) begin
  initial begin
  #700000000
  if(lock_o == 0 && pllpd_en_n_i == 1) begin
             error_flag_lock = 1;
             $display(" ---------------------------------------------- ");
               $display("\tERROR: LOCK TIME MISMATCH: --" );
               $display(" ---------------------------------------------- ");
                end
  lock_done = 1;
end
end
endgenerate




generate
    if (PLL_LOCK_STICKY == 0) begin
  initial begin
  #700000000
  if(lock_o == 0 && pllpd_en_n_i == 1) begin
             error_flag_lock = 1;
             $display(" ---------------------------------------------- ");
               $display("\tERROR: LOCK TIME MISMATCH: --" );
               $display(" ---------------------------------------------- ");
                end
  lock_done = 1;
end
end
endgenerate

assign done_r = clkop_test_done &
                clkos_test_done &
                clkos2_test_done &
                clkos3_test_done &
                clkos4_test_done &
                clkos5_test_done &
                lock_done &
                powerdown_done &
                reset_done &
                dyn_p_end_r;
 generate
    if (POWERDOWN_EN == 1) begin
  initial begin
  pllpd_en_n_i = 1;
  wait(clkop_test_done &
       clkos_test_done &
       clkos2_test_done &
       clkos3_test_done &
       clkos4_test_done &
       clkos5_test_done &
       lock_done &
       reset_done &
       dyn_p_end_r)
  pllpd_en_n_i = 0;
  #500
  if (lock_o) begin
             error_flag_pdn = 1;
             $display(" ---------------------------------------------- ");
               $display("\tERROR: POWERDOWN MISMATCH: --" );
               $display(" ---------------------------------------------- ");
                end
  #500
  pllpd_en_n_i = 1;
  powerdown_done = 1;
end
end
endgenerate




generate
   if (ENCLKOP_EN == 0) begin
     localparam EN_PHASE_CHECK_CLKOP = (CLKOP_BYPASS)? 0 :
                                       (CLKOP_FREQ_ACTUAL == CLKOS_FREQ_ACTUAL )? (CLKOS_PHASE_ACTUAL  == 0) :
                                       (CLKOP_FREQ_ACTUAL == CLKOS2_FREQ_ACTUAL)? (CLKOS2_PHASE_ACTUAL == 0) :
                                       (CLKOP_FREQ_ACTUAL == CLKOS3_FREQ_ACTUAL)? (CLKOS3_PHASE_ACTUAL == 0) :
                                       (CLKOP_FREQ_ACTUAL == CLKOS4_FREQ_ACTUAL)? (CLKOS4_PHASE_ACTUAL == 0) :
                                       (CLKOP_FREQ_ACTUAL == CLKOS5_FREQ_ACTUAL)? (CLKOS5_PHASE_ACTUAL == 0) : 0;
     wire phase_0_clkop = (CLKOP_BYPASS)? clki_i :
                          (CLKOP_FREQ_ACTUAL == CLKOS_FREQ_ACTUAL )? clkos_o :
                          (CLKOP_FREQ_ACTUAL == CLKOS2_FREQ_ACTUAL)? clkos2_o :
                          (CLKOP_FREQ_ACTUAL == CLKOS3_FREQ_ACTUAL)? clkos3_o :
                          (CLKOP_FREQ_ACTUAL == CLKOS4_FREQ_ACTUAL)? clkos4_o :
                          (CLKOP_FREQ_ACTUAL == CLKOS5_FREQ_ACTUAL)? clkos5_o : clkop_o;
     clock_checker #
     (
      .CLK_NAME                              ("CLKOP"),
      .EXP_CLK_FREQ                          ((CLKOP_BYPASS? CLKI_FREQ : CLKOP_FREQ_ACTUAL)),
      .EXP_PHASE_SHIFT                       (CLKOP_PHASE_ACTUAL),
      .EN_PHASE_CHECK                        (EN_PHASE_CHECK_CLKOP)
     )
     u_clkop_freq_checker
     (
      // Inputs
      .rst_n                                 (rstn_i),
      .pllpd_en_n                            (pllpd_en_n_i),
      .testclk                               (clkop_o),
      .phase_0_testclk                       (phase_0_clkop),
      .lock                                  (lock_o),
      // Outputs
      .error_detected                        (clkop_error_detected),
      .test_done                             (clkop_test_done));
	end
	else begin
	  assign clkop_error_detected = 1'b0;
	  assign clkop_test_done = 1'b1;
	end

  if (CLKOS_EN == 1 && ENCLKOS_EN == 0) begin
     localparam EN_PHASE_CHECK_CLKOS = (CLKOS_BYPASS)? 0 :
                                       (CLKOS_FREQ_ACTUAL == CLKOP_FREQ_ACTUAL )? (CLKOP_PHASE_ACTUAL  == 0) :
                                       (CLKOS_FREQ_ACTUAL == CLKOS2_FREQ_ACTUAL)? (CLKOS2_PHASE_ACTUAL == 0) :
                                       (CLKOS_FREQ_ACTUAL == CLKOS3_FREQ_ACTUAL)? (CLKOS3_PHASE_ACTUAL == 0) :
                                       (CLKOS_FREQ_ACTUAL == CLKOS4_FREQ_ACTUAL)? (CLKOS4_PHASE_ACTUAL == 0) :
                                       (CLKOS_FREQ_ACTUAL == CLKOS5_FREQ_ACTUAL)? (CLKOS5_PHASE_ACTUAL == 0) : 0;
     wire phase_0_clkos = (CLKOS_BYPASS)? clki_i :
                          (CLKOS_FREQ_ACTUAL == CLKOP_FREQ_ACTUAL )? clkop_o :
                          (CLKOS_FREQ_ACTUAL == CLKOS2_FREQ_ACTUAL)? clkos2_o :
                          (CLKOS_FREQ_ACTUAL == CLKOS3_FREQ_ACTUAL)? clkos3_o :
                          (CLKOS_FREQ_ACTUAL == CLKOS4_FREQ_ACTUAL)? clkos4_o :
                          (CLKOS_FREQ_ACTUAL == CLKOS5_FREQ_ACTUAL)? clkos5_o : clkos_o;
    clock_checker #
    (
     .CLK_NAME                              ("CLKOS"),
     .EXP_CLK_FREQ                          ((CLKOS_BYPASS? CLKI_FREQ : CLKOS_FREQ_ACTUAL)),
     .EXP_PHASE_SHIFT                       (CLKOS_PHASE_ACTUAL),
     .EN_PHASE_CHECK                        (EN_PHASE_CHECK_CLKOS)
    )
    u_clkos_freq_checker
    (
     // Inputs
     .rst_n                                 (rstn_i),
     .pllpd_en_n                            (pllpd_en_n_i),
     .testclk                               (clkos_o),
     .phase_0_testclk                       (phase_0_clkos),
     .lock                                  (lock_o),
     // Outputs
     .error_detected                        (clkos_error_detected),
     .test_done                             (clkos_test_done));
	end
	else begin
	  assign clkos_error_detected = 1'b0;
	  assign clkos_test_done = 1'b1;
	end

   if (CLKOS2_EN == 1 && ENCLKOS2_EN == 0) begin
     localparam EN_PHASE_CHECK_CLKOS2 = (CLKOS2_BYPASS)? 0 :
                                        (CLKOS2_FREQ_ACTUAL == CLKOP_FREQ_ACTUAL )? (CLKOP_PHASE_ACTUAL  == 0) :
                                        (CLKOS2_FREQ_ACTUAL == CLKOS_FREQ_ACTUAL )? (CLKOS_PHASE_ACTUAL  == 0) :
                                        (CLKOS2_FREQ_ACTUAL == CLKOS3_FREQ_ACTUAL)? (CLKOS3_PHASE_ACTUAL == 0) :
                                        (CLKOS2_FREQ_ACTUAL == CLKOS4_FREQ_ACTUAL)? (CLKOS4_PHASE_ACTUAL == 0) :
                                        (CLKOS2_FREQ_ACTUAL == CLKOS5_FREQ_ACTUAL)? (CLKOS5_PHASE_ACTUAL == 0) : 0;
     wire phase_0_clkos2 = (CLKOS2_BYPASS)? clki_i :
                           (CLKOS2_FREQ_ACTUAL == CLKOP_FREQ_ACTUAL )? clkop_o :
                           (CLKOS2_FREQ_ACTUAL == CLKOS_FREQ_ACTUAL )? clkos_o :
                           (CLKOS2_FREQ_ACTUAL == CLKOS3_FREQ_ACTUAL)? clkos3_o :
                           (CLKOS2_FREQ_ACTUAL == CLKOS4_FREQ_ACTUAL)? clkos4_o :
                           (CLKOS2_FREQ_ACTUAL == CLKOS5_FREQ_ACTUAL)? clkos5_o : clkos2_o;
     clock_checker #
     (
      .CLK_NAME                              ("CLKOS2"),
      .EXP_CLK_FREQ                          ((CLKOS2_BYPASS? CLKI_FREQ : CLKOS2_FREQ_ACTUAL)),
      .EXP_PHASE_SHIFT                       (CLKOS2_PHASE_ACTUAL),
      .EN_PHASE_CHECK                        (EN_PHASE_CHECK_CLKOS2)
     )
     u_clkos2_freq_checker
     (
      // Inputs
      .rst_n                                 (rstn_i),
      .pllpd_en_n                            (pllpd_en_n_i),
      .testclk                               (clkos2_o),
      .phase_0_testclk                       (phase_0_clkos2),
      .lock                                  (lock_o),
      // Outputs
      .error_detected                        (clkos2_error_detected),
      .test_done                             (clkos2_test_done));
	end
	else begin
	  assign clkos2_error_detected = 1'b0;
	  assign clkos2_test_done = 1'b1;
	end

  if (CLKOS3_EN == 1 && ENCLKOS3_EN == 0) begin
     localparam EN_PHASE_CHECK_CLKOS3 = (CLKOS3_BYPASS)? 0 :
                                        (CLKOS3_FREQ_ACTUAL == CLKOP_FREQ_ACTUAL )? (CLKOP_PHASE_ACTUAL  == 0) :
                                        (CLKOS3_FREQ_ACTUAL == CLKOS_FREQ_ACTUAL )? (CLKOS_PHASE_ACTUAL  == 0) :
                                        (CLKOS3_FREQ_ACTUAL == CLKOS2_FREQ_ACTUAL)? (CLKOS2_PHASE_ACTUAL == 0) :
                                        (CLKOS3_FREQ_ACTUAL == CLKOS4_FREQ_ACTUAL)? (CLKOS4_PHASE_ACTUAL == 0) :
                                        (CLKOS3_FREQ_ACTUAL == CLKOS5_FREQ_ACTUAL)? (CLKOS5_PHASE_ACTUAL == 0) : 0;
     wire phase_0_clkos3 = (CLKOS3_BYPASS)? clki_i :
                           (CLKOS3_FREQ_ACTUAL == CLKOP_FREQ_ACTUAL )? clkop_o :
                           (CLKOS3_FREQ_ACTUAL == CLKOS_FREQ_ACTUAL )? clkos_o :
                           (CLKOS3_FREQ_ACTUAL == CLKOS2_FREQ_ACTUAL)? clkos2_o :
                           (CLKOS3_FREQ_ACTUAL == CLKOS4_FREQ_ACTUAL)? clkos4_o :
                           (CLKOS3_FREQ_ACTUAL == CLKOS5_FREQ_ACTUAL)? clkos5_o : clkos3_o;
     clock_checker #
     (
      .CLK_NAME                              ("CLKOS3"),
      .EXP_CLK_FREQ                          ((CLKOS3_BYPASS? CLKI_FREQ : CLKOS3_FREQ_ACTUAL)),
      .EXP_PHASE_SHIFT                       (CLKOS3_PHASE_ACTUAL),
      .EN_PHASE_CHECK                        (EN_PHASE_CHECK_CLKOS3)
     )
     u_clkos3_freq_checker
     (
      // Inputs
      .rst_n                                 (rstn_i),
      .pllpd_en_n                            (pllpd_en_n_i),
      .testclk                               (clkos3_o),
      .phase_0_testclk                       (phase_0_clkos3),
      .lock                                  (lock_o),
      // Outputs
      .error_detected                        (clkos3_error_detected),
      .test_done                             (clkos3_test_done));
	end
	else begin
	  assign clkos3_error_detected = 1'b0;
	  assign clkos3_test_done = 1'b1;
	end

  if (CLKOS4_EN == 1 && ENCLKOS4_EN == 0) begin
     localparam EN_PHASE_CHECK_CLKOS4 = (CLKOS4_BYPASS)? 0 :
                                        (CLKOS4_FREQ_ACTUAL == CLKOP_FREQ_ACTUAL )? (CLKOP_PHASE_ACTUAL  == 0) :
                                        (CLKOS4_FREQ_ACTUAL == CLKOS_FREQ_ACTUAL )? (CLKOS_PHASE_ACTUAL  == 0) :
                                        (CLKOS4_FREQ_ACTUAL == CLKOS2_FREQ_ACTUAL)? (CLKOS2_PHASE_ACTUAL == 0) :
                                        (CLKOS4_FREQ_ACTUAL == CLKOS3_FREQ_ACTUAL)? (CLKOS3_PHASE_ACTUAL == 0) :
                                        (CLKOS4_FREQ_ACTUAL == CLKOS5_FREQ_ACTUAL)? (CLKOS5_PHASE_ACTUAL == 0) : 0;
     wire phase_0_clkos4 = (CLKOS4_BYPASS)? clki_i :
                           (CLKOS4_FREQ_ACTUAL == CLKOP_FREQ_ACTUAL )? clkop_o :
                           (CLKOS4_FREQ_ACTUAL == CLKOS_FREQ_ACTUAL )? clkos_o :
                           (CLKOS4_FREQ_ACTUAL == CLKOS2_FREQ_ACTUAL)? clkos2_o :
                           (CLKOS4_FREQ_ACTUAL == CLKOS3_FREQ_ACTUAL)? clkos3_o :
                           (CLKOS4_FREQ_ACTUAL == CLKOS5_FREQ_ACTUAL)? clkos5_o : clkos4_o;
     clock_checker #
     (
      .CLK_NAME                              ("CLKOS4"),
      .EXP_CLK_FREQ                          ((CLKOS4_BYPASS? CLKI_FREQ : CLKOS4_FREQ_ACTUAL)),
      .EXP_PHASE_SHIFT                       (CLKOS4_PHASE_ACTUAL),
      .EN_PHASE_CHECK                        (EN_PHASE_CHECK_CLKOS4)
     )
     u_clkos4_freq_checker
     (
      // Inputs
      .rst_n                                 (rstn_i),
      .pllpd_en_n                            (pllpd_en_n_i),
      .testclk                               (clkos4_o),
      .phase_0_testclk                       (phase_0_clkos4),
      .lock                                  (lock_o),
      // Outputs
      .error_detected                        (clkos4_error_detected),
      .test_done                             (clkos4_test_done));
	end
	else begin
	  assign clkos4_error_detected = 1'b0;
	  assign clkos4_test_done = 1'b1;
	end

   if (CLKOS5_EN == 1 && ENCLKOS5_EN == 0) begin
     localparam EN_PHASE_CHECK_CLKOS5 = (CLKOS5_BYPASS)? 0 :
                                        (CLKOS5_FREQ_ACTUAL == CLKOP_FREQ_ACTUAL )? (CLKOP_PHASE_ACTUAL  == 0) :
                                        (CLKOS5_FREQ_ACTUAL == CLKOS_FREQ_ACTUAL )? (CLKOS_PHASE_ACTUAL  == 0) :
                                        (CLKOS5_FREQ_ACTUAL == CLKOS2_FREQ_ACTUAL)? (CLKOS2_PHASE_ACTUAL == 0) :
                                        (CLKOS5_FREQ_ACTUAL == CLKOS3_FREQ_ACTUAL)? (CLKOS3_PHASE_ACTUAL == 0) :
                                        (CLKOS5_FREQ_ACTUAL == CLKOS4_FREQ_ACTUAL)? (CLKOS4_PHASE_ACTUAL == 0) : 0;
     wire phase_0_clkos5 = (CLKOS5_BYPASS)? clki_i :
                           (CLKOS5_FREQ_ACTUAL == CLKOP_FREQ_ACTUAL )? clkop_o :
                           (CLKOS5_FREQ_ACTUAL == CLKOS_FREQ_ACTUAL )? clkos_o :
                           (CLKOS5_FREQ_ACTUAL == CLKOS2_FREQ_ACTUAL)? clkos2_o :
                           (CLKOS5_FREQ_ACTUAL == CLKOS3_FREQ_ACTUAL)? clkos3_o :
                           (CLKOS5_FREQ_ACTUAL == CLKOS4_FREQ_ACTUAL)? clkos4_o : clkos5_o;
     clock_checker #
     (
      .CLK_NAME                              ("CLKOS5"),
      .EXP_CLK_FREQ                          ((CLKOS5_BYPASS? CLKI_FREQ : CLKOS5_FREQ_ACTUAL)),
      .EXP_PHASE_SHIFT                       (CLKOS5_PHASE_ACTUAL),
      .EN_PHASE_CHECK                        (EN_PHASE_CHECK_CLKOS5)
     )
     u_clkos5_freq_checker
     (
      // Inputs
      .rst_n                                 (rstn_i),
      .pllpd_en_n                            (pllpd_en_n_i),
      .testclk                               (clkos5_o),
      .phase_0_testclk                       (phase_0_clkos5),
      .lock                                  (lock_o),
      // Outputs
      .error_detected                        (clkos5_error_detected),
      .test_done                             (clkos5_test_done));
	end
	else begin
	  assign clkos5_error_detected = 1'b0;
	  assign clkos5_test_done = 1'b1;
	end

endgenerate




assign dyn_p_start_r = clkop_test_done &
                       clkos_test_done &
                       clkos2_test_done &
                       clkos3_test_done &
                       clkos4_test_done &
                       clkos5_test_done &
                       reset_done;


generate
if (DYN_PORTS_EN == 1 && FBK_MODE != "CLKOP" && FBK_MODE != "INTCLKOP" && CLKOP_BYPASS == 0) begin
initial begin
wait(dyn_p_start_r)
#400
phasestep_i  = 1'b1;
#10000;
phasedir_i  = 1'b0;
phaseloadreg_i = 1'b0;
#10000
phasestep_i  = 1'b0;
#10000;
phasedir_i  = 1'b0;
phaseloadreg_i = 1'b1;
#5000;
phasesel_i [2:0] = 3'b000;
#10000;
phasestep_i  = 1'b1;
#10000;
phasestep_i  = 1'b0;
dyn_p_done = 1;


end
end
endgenerate

assign dyn_s_start_r = (FBK_MODE == "CLKOP" || FBK_MODE == "INTCLKOP"|| CLKOP_BYPASS == 1)? dyn_p_start_r : dyn_p_start_r & dyn_p_done;


generate
if (CLKOS_EN == 1 && DYN_PORTS_EN == 1 && FBK_MODE != "CLKOS" && FBK_MODE != "INTCLKOS" && CLKOS_BYPASS == 0) begin
initial begin
wait(dyn_s_start_r)
#400
phasestep_i  = 1'b1;
#10000;
phasedir_i  = 1'b0;
phaseloadreg_i = 1'b0;
#10000
phasestep_i  = 1'b0;
#10000;
phasedir_i  = 1'b0;
phaseloadreg_i = 1'b1;
#5000;
phasesel_i [2:0] = 3'b001;
#10000;
phasestep_i  = 1'b1;
#10000;
phasestep_i  = 1'b0;
dyn_s_done = 1;

end
end
endgenerate

assign dyn_s2_start_r = (CLKOS_EN == 0 || CLKOS_BYPASS == 1 || FBK_MODE == "CLKOS" || FBK_MODE == "INTCLKOS")? dyn_s_start_r : dyn_s_start_r & dyn_s_done;

generate
if (CLKOS2_EN == 1 && DYN_PORTS_EN == 1 && FBK_MODE != "CLKOS2" && FBK_MODE != "INTCLKOS2" && CLKOS2_BYPASS == 0) begin
initial begin
wait(dyn_s2_start_r)
#400
phasestep_i  = 1'b1;
#10000;
phasedir_i  = 1'b0;
phaseloadreg_i = 1'b0;
#10000
phasestep_i  = 1'b0;
#10000;
phasedir_i  = 1'b0;
phaseloadreg_i = 1'b1;
#5000;
phasesel_i [2:0] = 3'b010;
#10000;
phasestep_i  = 1'b1;
#10000;
phasestep_i  = 1'b0;
dyn_s2_done = 1;


end
end
endgenerate

assign dyn_s3_start_r = (CLKOS2_EN == 0 || CLKOS2_BYPASS == 1 || FBK_MODE == "CLKOS2" || FBK_MODE == "INTCLKOS2")? dyn_s2_start_r : dyn_s2_start_r & dyn_s2_done;

generate
if (CLKOS3_EN == 1 && DYN_PORTS_EN == 1 && FBK_MODE != "CLKOS3" && FBK_MODE != "INTCLKOS3" && CLKOS3_BYPASS == 0) begin
initial begin
wait(dyn_s3_start_r)
#400
phasestep_i  = 1'b1;
#10000;
phasedir_i  = 1'b0;
phaseloadreg_i = 1'b0;
#10000
phasestep_i  = 1'b0;
#10000;
phasedir_i  = 1'b0;
phaseloadreg_i = 1'b1;
#5000;
phasesel_i [2:0] = 3'b011;
#10000;
phasestep_i  = 1'b1;
#10000;
phasestep_i  = 1'b0;
dyn_s3_done = 1;


end
end
endgenerate

assign dyn_s4_start_r = (CLKOS3_EN == 0 || CLKOS3_BYPASS == 1 || FBK_MODE == "CLKOS3" || FBK_MODE == "INTCLKOS3")? dyn_s3_start_r : dyn_s3_start_r & dyn_s3_done;

generate
if (CLKOS4_EN == 1 && DYN_PORTS_EN == 1 && FBK_MODE != "CLKOS4" && FBK_MODE != "INTCLKOS4" && CLKOS4_BYPASS == 0) begin
initial begin
wait(dyn_s4_start_r)
#400
phasestep_i  = 1'b1;
#10000;
phasedir_i  = 1'b0;
phaseloadreg_i = 1'b0;
#10000
phasestep_i  = 1'b0;
#10000;
phasedir_i  = 1'b0;
phaseloadreg_i = 1'b1;
#5000;
phasesel_i [2:0] = 3'b100;
#10000;
phasestep_i  = 1'b1;
#10000;
phasestep_i  = 1'b0;
dyn_s4_done = 1;


end
end
endgenerate

assign dyn_s5_start_r = (CLKOS4_EN == 0 || CLKOS4_BYPASS == 1 || FBK_MODE == "CLKOS4" || FBK_MODE == "INTCLKOS4")? dyn_s4_start_r : dyn_s4_start_r & dyn_s4_done;

generate
if (CLKOS5_EN == 1 && DYN_PORTS_EN == 1 && FBK_MODE != "CLKOS5" && FBK_MODE != "INTCLKOS5" && CLKOS5_BYPASS == 0) begin
initial begin
wait(dyn_s5_start_r)
#400
phasestep_i  = 1'b1;
#10000;
phasedir_i  = 1'b0;
phaseloadreg_i = 1'b0;
#10000
phasestep_i  = 1'b0;
#10000;
phasedir_i  = 1'b0;
phaseloadreg_i = 1'b1;
#5000;
phasesel_i [2:0] = 3'b101;
#10000;
phasestep_i  = 1'b1;
#10000;
phasestep_i  = 1'b0;
dyn_s5_done = 1;


end
end
endgenerate

assign dyn_p_end_r = dyn_p_done & dyn_s_done & dyn_s2_done & dyn_s3_done & dyn_s4_done & dyn_s5_done;
assign done_r = clkop_test_done &
                clkos_test_done &
                clkos2_test_done &
                clkos3_test_done &
                clkos4_test_done &
                clkos5_test_done &
                lock_done &
                powerdown_done &
                reset_done &
                dyn_p_end_r;

initial begin
`ifdef CADENCE_DUMP
      $timeformat (-15 ,1 , "ps", 15);
      //$shm_open ("test_pll.shm");
      //$shm_probe(tb_top,("AC"));
      $recordfile("test_pll.trn");
  `ifdef TRN_INSTANCE
        $recordvars(`TRN_INSTANCE);
  `else
        $recordvars(tb_top);
  `endif
`endif
end

initial begin
  wait(done_r)
  #44;
    if(clkop_error_detected  == 0 &&
       clkos_error_detected  == 0 &&
       clkos2_error_detected == 0 &&
       clkos3_error_detected == 0 &&
       clkos4_error_detected == 0 &&
       clkos5_error_detected == 0 &&
       error_flag_lock == 0 &&
       error_flag_pdn == 0 &&
       error_flag_reset == 0 &&
       error_trim_rise_p == 0 &&
       error_trim_rise_s == 0 &&
       error_trim_fall_p == 0 &&
       error_trim_fall_s == 0 &&
       error_dyn_phase_p == 0 &&
       error_dyn_phase_s == 0 &&
       error_dyn_phase_s2 == 0 &&
       error_dyn_phase_s3 == 0 &&
       error_dyn_phase_s4 == 0 &&
       error_dyn_phase_s5 == 0) begin
      $display("\t \t ********** CLOCK MATCH **********\n");
      $display("\t \t *ALL TESTS PASSED*\n");
      $display("\t \t *SIMULATION PASSED*\n");
    end
    else begin
      $display("\t \t ****** CLOCK MISMATCH ******\n");
      $display("\t \t ************ TEST CASE FAIL ***********\n");
    end
    $stop;
end

  // #10000000
  // $finish(1);
// end
`include "dut_inst.v"

endmodule
`endif

`ifndef __RTL_MODULE__CLOCK_CHECKER__
`define __RTL_MODULE__CLOCK_CHECKER__
`timescale 1ps / 1fs
//==========================================================================
// Module : clock_checker
//==========================================================================
module clock_checker #

( //--begin_param--
//----------------------------
// Parameters
//----------------------------
parameter                     CLK_NAME = "CLK",
parameter                     EXP_CLK_FREQ = 100.0,
parameter                     EXP_PHASE_SHIFT = 0.0,
parameter                     EN_PHASE_CHECK = 0,
parameter                     MAX_SAMPLE_CNT = 255

) //--end_param--

( //--begin_ports--
//----------------------------
// Inputs
//----------------------------

input                         rst_n,
input                         pllpd_en_n,   // power down active low
input                         testclk,
input                         phase_0_testclk,
input                         lock,

//----------------------------
// Outputs
//----------------------------
output wire                   error_detected,
output reg                    test_done

); //--end_ports--


function [31:0] clog2 ;
    input [31:0] value ;
    reg [31:0] num ;
    begin
        num = (value - 1) ;
        for (clog2 = 0 ; (num > 0) ; clog2 = (clog2 + 1))
            num = (num >> 1) ;
    end
endfunction

//--------------------------------------------------------------------------
//--- Local Parameters/Defines ---
//--------------------------------------------------------------------------
localparam                    CNTWID = clog2(MAX_SAMPLE_CNT+1);

//--------------------------------------------------------------------------
//--- Combinational Wire/Reg ---
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
//--- Registers ---
//--------------------------------------------------------------------------

reg                           lock_testclk;
reg                           testclk_div2_pos;
reg                           testclk_div2_neg;
reg                           testclk_div4_pos;
reg         [CNTWID-1:0]      testclk_sample_cntr;
reg                           freq_error;
reg                           phase_error;

realtime                      pos_time_testclk;
realtime                      neg_time_testclk;
realtime                      phase_0_time;
realtime                      phase_testclk_time;

real                          obs_testclk_timediff;
real                          obs_testclk_freq;
real                          obs_phase_shift;
real                          obs_phase_timediff;

assign                        error_detected = freq_error | phase_error;

initial begin
  lock_testclk = 1'd0;
  testclk_div2_pos = 1'b0;
  testclk_div2_neg = 1'b0;
  testclk_div4_pos = 1'b0;
  testclk_sample_cntr = {CNTWID{1'b0}};
  test_done = 0;
  pos_time_testclk = 0;
  neg_time_testclk = 0;
  phase_0_time = 0;
  phase_testclk_time = 0;
  freq_error = 1'd0;
  phase_error = 1'd0;
  obs_phase_shift = 0;
  obs_phase_timediff = 0;
end

//    +----+    +----+    +----+    +----+    +----+    +----+    +----+    +----+    +--
//    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |  phase 0 clock
//----+    +----+    +----+    +----+    +----+    +----+    +----+    +----+    +----+
//
//              |                   |                   |                   |
//              |                   |                   |                   |
//              V                   V                   V                   V
//      phase time1               time1               time1               time1
//
//       +----+    +----+    +----+    +----+    +----+    +----+    +----+    +----+
//       |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    testclk
//   ----+    +----+    +----+    +----+    +----+    +----+    +----+    +----+    +----
//
//                 |                   |                   |                   |
//                 |                   |                   |                   |
//                 V                   V                   V                   V
//         phase time2               time2               time2               time2
//
//    phase shift = 360*EXP_CLK_FREQ*(time2-time1)*(1e-6)
//
//       +---------+         +---------+         +---------+         +---------+
//       |         |         |         |         |         |         |         |         divide by 2 clock
//   ----+         +---------+         +---------+         +---------+         +---------
//
//
//       +-------------------+                   +-------------------+                   divide by 4 clock will serve as
//       |                   |                   |                   |                   enable for checking
//   ----+                   +-------------------+                   +-------------------
//
//
//            +---------+         +---------+         +---------+         +---------+    divide by 2 clock
//            |         |         |         |         |         |         |         |    shifted by 90
//   ---------+         +---------+         +---------+         +---------+         +----
//
//            |         |         |         |         |         |         |         |
//            |         |         |         |         |         |         |         |
//            |         V         |         V         |         V         |         V
//            |       time2       |       time2       |       time2       |       time2
//            V                   V                   V                   V
//					time1               time1               time1               time1
//
//		clock frequency = (1e6 MHz) / abs(time2-time1)

always @(posedge phase_0_testclk or negedge rst_n) begin
  if(~rst_n) begin
    phase_0_time <= 0;
  end
  else begin
    if(lock_testclk & pllpd_en_n) begin
      if(testclk_div2_pos & testclk_div4_pos)
        phase_0_time <= $time;
    end
  end
end

always @(posedge testclk or negedge rst_n) begin
  if(~rst_n) begin
    lock_testclk <= 1'd0;
  end
  else begin
    lock_testclk <= lock;
  end
end

// Generate a divide by 2 version of the clock
always @(posedge testclk or negedge rst_n) begin
  if(~rst_n) begin
    testclk_div2_pos <= 1'd0;
    phase_testclk_time <= 0;
  end
  else begin
    if(lock_testclk & pllpd_en_n) begin
      testclk_div2_pos <= ~testclk_div2_pos;
      if(testclk_div2_neg & testclk_div4_pos)
        phase_testclk_time <= $time;
    end
  end
end

// Generate a divide by 4 version of the clock
// This will be used as enable signal for checking the timestamp
always @(posedge testclk_div2_pos or negedge rst_n) begin
  if(~rst_n) begin
    testclk_div4_pos <= 1'd0;
  end
  else begin
    if(lock_testclk & pllpd_en_n & ~test_done) begin
      testclk_div4_pos <= ~testclk_div4_pos;
    end
  end
end

// counter for ending simulation
always @(posedge testclk_div4_pos or negedge rst_n) begin
  if(~rst_n) begin
    testclk_sample_cntr <= {CNTWID{1'b0}};
    test_done <= 1'd0;
  end
  else begin
    if(lock_testclk & pllpd_en_n) begin
      testclk_sample_cntr <= (testclk_sample_cntr==MAX_SAMPLE_CNT)? testclk_sample_cntr : testclk_sample_cntr + 1;
      test_done <= (testclk_sample_cntr==MAX_SAMPLE_CNT);
    end
  end
end

// Generate a divide by 2 version of the clock with 90 degress shift
// The timestamp will be sampled at posedge and negedge of this div2 clock
always @(negedge testclk or negedge rst_n) begin
  if(~rst_n) begin
    testclk_div2_neg <= 1'd0;
  end
  else begin
    if(lock_testclk & pllpd_en_n) begin
      testclk_div2_neg <= ~testclk_div2_neg & testclk_div2_pos;
    end
  end
end

// Sample time at posedge and negedge of divide by 2 clock
always @(posedge testclk_div2_neg or negedge rst_n) begin
  if(~rst_n) begin
    pos_time_testclk <= 0;
  end
  else begin
    if(testclk_div4_pos)
      pos_time_testclk <= $time;
  end
end

always @(negedge testclk_div2_neg or negedge rst_n) begin
  if(~rst_n) begin
    neg_time_testclk <= 0;
  end
  else begin
    if(testclk_div4_pos)
      neg_time_testclk <= $time;
  end
end

// Check timestamp difference
always @(negedge testclk_div4_pos or negedge rst_n) begin
  if(rst_n & lock_testclk & pllpd_en_n) begin
    obs_testclk_timediff = (neg_time_testclk > pos_time_testclk)? (neg_time_testclk - pos_time_testclk) :
                                                                  (pos_time_testclk - neg_time_testclk);
    obs_testclk_freq     = 1000000.0/obs_testclk_timediff;
    `ifdef PLL_DEBUG
      $display("%t:[DEBUG] %s observed period : %f ps (Freq: %f MHz)  (POS1:%t, POS2:%t) ",
               $time,CLK_NAME,obs_testclk_timediff,obs_testclk_freq,neg_time_testclk,pos_time_testclk);
    `endif
    if(( ((EXP_CLK_FREQ > obs_testclk_freq) && ((EXP_CLK_FREQ - obs_testclk_freq)/EXP_CLK_FREQ) > 0.1) ||
         ((EXP_CLK_FREQ < obs_testclk_freq) && ((obs_testclk_freq - EXP_CLK_FREQ)/EXP_CLK_FREQ) > 0.1)
       ) && lock_testclk == 1 && test_done == 0) begin
      freq_error = 1'b1;
      $display("%t:[ERROR] Frequency Mismatch. %s observed period : %f ps (Freq: %f MHz)  (POS1:%t, POS2:%t) : Expected Frequency = %f ",
               $time,CLK_NAME,obs_testclk_timediff,obs_testclk_freq,neg_time_testclk,pos_time_testclk,EXP_CLK_FREQ);
    end

    if(EN_PHASE_CHECK & EXP_PHASE_SHIFT > 0) begin
      obs_phase_timediff = phase_testclk_time-phase_0_time;
      obs_phase_shift    = (360*EXP_CLK_FREQ*obs_phase_timediff)/1000000.0;
      `ifdef PLL_DEBUG
        $display("%t:[DEBUG] %s observed phase shift : %f degrees (TimeDiff: %f ps)  (POS1:%t, POS2:%t) ",
                 $time,CLK_NAME,obs_phase_shift,obs_phase_timediff,phase_0_time,phase_testclk_time);
      `endif
      if(( ((EXP_PHASE_SHIFT > obs_phase_shift) && ((EXP_PHASE_SHIFT-obs_phase_shift)/EXP_PHASE_SHIFT) > 0.1) ||
           ((EXP_PHASE_SHIFT < obs_phase_shift) && ((obs_phase_shift-EXP_PHASE_SHIFT)/EXP_PHASE_SHIFT) > 0.1)
         ) && lock_testclk == 1 && test_done == 0) begin
        phase_error = 1'b1;
        $display("%t:[ERROR] Phase Mismatch. %s observed phase shift : %f degrees (TimeDiff: %f ps)  (POS1:%t, POS2:%t) : Expected Phase Shift = %f ",
                 $time,CLK_NAME,obs_phase_shift,obs_phase_timediff,phase_0_time,phase_testclk_time,EXP_PHASE_SHIFT);
      end
    end
  end
end

// End of clock test
always @* begin
  if(test_done) begin
    $display("%t:[INFO] Maximum sampling count reached (%d).Done test for clock %s.",$time,testclk_sample_cntr,CLK_NAME);
  end
end

//--------------------------------------------------------------------------
//--- Module Instantiation ---
//--------------------------------------------------------------------------


endmodule //--clock_checker--
`endif // __RTL_MODULE__CLOCK_CHECKER__
