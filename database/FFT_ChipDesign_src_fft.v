//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: fft
//
// Type: Sequential
//
// Purpose: Top moudule. Connect the modules according to the hardware
// structure diagram.
// 
//
// Details: Ports of all wires are marked by comments.
//
// Release History:
// - Version 1.0 20/03/24: Create;
// - Version 1.1 20/04/06: Update butterfly top, and fix some errors;
// - Version 1.2 20/04/14: Update and check tops, and comment;
// - Version 1.3 20/04/14: Add statements;
// - Version 1.4 20/04/16: Fix some errors;
// - Version 1.5 20/04/21: Update connection, fix some errors;
// - Version 1.6 20/04/21: Delete wire data_5.
//
// Notes:
// - Many modules still have not specific signal names.
//**********************************************************

`include "ctrl.v"
`include "s_p.v"
`include "mux.v"
`include "butterfly.v"
`include "reg1.v"
`include "p_s.v"

module fft(

  input  wire        clk,       // clock
  input  wire        rst_n,     // reset
  input  wire [33:0] data_in,   // input from pin
  output wire [33:0] data_out   // output to pin

  );

  wire        mux_flag, demux_flag, s_p_flag;  // seems need a signal called ps_s_flag. Refer warning 02.
  wire[2:0]   rotation;
  wire[135:0] data_1, data_2, data_3, data_4;

  ctrl ctrl0(
    .clk(clk),                // input from top
    .rst_n(rst_n),            // input from top
    .s_p_flag_in(s_p_flag),   // input from s_p
    .mux_flag(mux_flag),      // output to mux
    .rotation(rotation),      // output to butterfly
    .demux_flag(demux_flag)   // output to p_s and reg1
  );

  s_p s_p0(
    .clk(clk),                // input from top
    .rst_n(rst_n),            // input from top
    .data_in_1(data_in),      // input from top
    .data_out_1(data_1),      // output to mux
    .s_p_flag_out(s_p_flag)   // output to ctrl
  );

  mux mux0(
    .mux_flag(mux_flag),      // input from ctrl 
    .clk(clk),
    .rst_n(rst_n),
    .data_in_2(data_1),       // input from s_p
    .data_in_1(data_2),       // input from reg1
    .data_in_3(data_4),
    .data_out(data_3)         // output to butterfly
  );

  butterfly butterfly0(
    .calc_in(data_3),         // input from mux
    .rotation(rotation),      // input from ctrl
    .calc_out(data_4)         // output to demux
  );

  reg1 reg10(
    .clk(clk),                // input from top
    .rst_n(rst_n),            // input from top
    .data_in_2(data_4),
    .data_out_2(data_2),
    .reg_datain_flag(demux_flag)
  );

  p_s p_s0(
    .clk(clk),                // input from top
    .rst_n(rst_n),            // input from top
    .p_s_flag_in(demux_flag), // input from ctrl  #* Warning 02: Please check no p_s_flag in ctrl *#
    .data_in_3(data_4),       // input from demux
    .data_out_3(data_out)     // output to top
  );
  
endmodule
