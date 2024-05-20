// This program was cloned from: https://github.com/lnls-dig/infra-cores
// License: GNU Lesser General Public License v3.0

//----------------------------------------------------------------------------
// Title      : Testbench for Si57x Interface
// //----------------------------------------------------------------------------
// Author     : Lucas Maziero Russo
// Company    : CNPEM LNLS-DIG
// Created    : 2020-12-08
// Platform   : FPGA-generic
//-----------------------------------------------------------------------------
// Description: Simulation of the Si57x interface
//-----------------------------------------------------------------------------
// Copyright (c) 2020 CNPEM
// Licensed under GNU Lesser General Public License (LGPL) v3.0
//-----------------------------------------------------------------------------
// Revisions  :
// Date        Version  Author          Description
// 2020-12-08  1.0      lucas.russo        Created
//-----------------------------------------------------------------------------

// Simulation timescale
`include "timescale.v"
// Common definitions
`include "defines.v"

module si57x_interface_tb;

  // Clock and resets
  wire sys_clk;
  wire sys_rstn;

  clk_rst cmp_clk_rst(
   .clk_sys_o                                (sys_clk),
   .sys_rstn_o                               (sys_rstn)
  );

  // DUT
  wire ext_wr = 1'b0;
  wire [37:0] ext_rfreq_value = 'h0;
  wire [6:0] ext_n1_value = 'h0;
  wire [2:0] ext_hs_value = 'h0;

  wire scl_pad_oen;
  wire sda_pad_oen;

  wire si57x_oe_in = 1'b1;
  wire [7:0] si57x_addr = 8'b10101010; // 0x55 & '0'
  wire si57x_oe_out;

  si57x_interface #(
    .g_SYS_CLOCK_FREQ                        ('d100000000),
    .g_I2C_FREQ                              ('d400000),
    .g_INIT_OSC                              (1'b1),
    .g_INIT_RFREQ_VALUE                      (38'h03017a66ad),
    .g_INIT_N1_VALUE                         (7'b0000011),
    .g_INIT_HS_VALUE                         (3'b111)
  )
  dut (
    .clk_sys_i                              (sys_clk),
    .rst_n_i                                (sys_rstn),

    .ext_wr_i                               (ext_wr),
    .ext_rfreq_value_i                      (ext_rfreq_value),
    .ext_n1_value_i                         (ext_n1_value),
    .ext_hs_value_i                         (ext_hs_value),

    .scl_pad_oen_o                          (scl_pad_oen),
    .sda_pad_oen_o                          (sda_pad_oen),

    .si57x_oe_i                             (si57x_oe_in),
    .si57x_addr_i                           (si57x_addr),
    .si57x_oe_o                             (si57x_oe_out)
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
