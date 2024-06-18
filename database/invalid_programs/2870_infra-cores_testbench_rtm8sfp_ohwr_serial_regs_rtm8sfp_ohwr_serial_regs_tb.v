// This program was cloned from: https://github.com/lnls-dig/infra-cores
// License: GNU Lesser General Public License v3.0

//----------------------------------------------------------------------------
// Title      : Testbench for RTM 8SFP serial regs Interface
// //----------------------------------------------------------------------------
// Author     : Lucas Maziero Russo
// Company    : CNPEM LNLS-DIG
// Created    : 2021-01-18
// Platform   : FPGA-generic
//-----------------------------------------------------------------------------
// Description: Simulation of the RTM 8SFP serial regs interface
//-----------------------------------------------------------------------------
// Copyright (c) 2021 CNPEM
// Licensed under GNU Lesser General Public License (LGPL) v3.0
//-----------------------------------------------------------------------------
// Revisions  :
// Date        Version  Author          Description
// 2021-01-18  1.0      lucas.russo        Created
//-----------------------------------------------------------------------------

// Simulation timescale
`include "timescale.v"
// Common definitions
`include "defines.v"

module rtm8sfp_ohwr_serial_regs_tb;

  // Clock and resets
  wire sys_clk;
  wire sys_rstn;

  clk_rst cmp_clk_rst(
   .clk_sys_o                                (sys_clk),
   .sys_rstn_o                               (sys_rstn)
  );

  // DUT
  wire sfp_sta_ctl_rw = 1'b1;

  wire sfp_status_reg_out = 1'b0;
  wire sfp_status_reg_clk_n;
  wire sfp_ctl_oe_n;
  wire sfp_ctl_din_n;
  wire sfp_ctl_str_n;
  wire sfp_status_reg_pl;

  wire [7:0] sfp_led1_out;
  wire [7:0] sfp_los;
  wire [7:0] sfp_txfault;
  wire [7:0] sfp_detect_n;
  wire [7:0] sfp_txdisable = 8'h55;
  wire [7:0] sfp_rs0 = 8'h55;
  wire [7:0] sfp_rs1 = 8'h55;
  wire [7:0] sfp_led1_in = 8'h55;
  wire [7:0] sfp_led2_in = 8'h55;

  rtm8sfp_ohwr_serial_regs #(
    .g_SYS_CLOCK_FREQ                        ('d100000000),
    .g_SERIAL_FREQ                           ('d100000)
  )
  dut (
    .clk_sys_i                               (sys_clk),
    .rst_n_i                                 (sys_rstn),

    .sfp_sta_ctl_rw_i                        (sfp_sta_ctl_rw),

    .sfp_status_reg_clk_n_o                  (sfp_status_reg_clk_n),
    .sfp_status_reg_out_i                    (sfp_status_reg_out),
    .sfp_status_reg_pl_o                     (sfp_status_reg_pl),

    .sfp_ctl_reg_oe_n_o                      (sfp_ctl_oe_n),
    .sfp_ctl_reg_din_n_o                     (sfp_ctl_din_n),
    .sfp_ctl_reg_str_n_o                     (sfp_ctl_str_n),

    .sfp_led1_o                              (sfp_led1_out),
    .sfp_los_o                               (sfp_los),
    .sfp_txfault_o                           (sfp_txfault),
    .sfp_detect_n_o                          (sfp_detect_n),
    .sfp_txdisable_i                         (sfp_txdisable),
    .sfp_rs0_i                               (sfp_rs0),
    .sfp_rs1_i                               (sfp_rs1),
    .sfp_led1_i                              (sfp_led1_in),
    .sfp_led2_i                              (sfp_led2_in)
  );

  initial begin

    $display("-----------------------------------");
    $display("@%0d: Waiting for all resets...", $time);
    $display("-----------------------------------");

    wait (sys_rstn);
    @(posedge sys_clk);

    $display("-------------------------------------");
    $display("@%0d:  Initialization  Done!", $time);
    $display("-------------------------------------");

    repeat (100000) begin
      @(posedge sys_clk);
    end

    $finish();

  end

endmodule
