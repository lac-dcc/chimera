// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 17:44:01 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog
//               runs/2022-07-07-1040-8-bit-add-motivating-example/vivado-8-bit-add-motivating-example//behavioral-no-reg.v-netlist.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* STRUCTURAL_NETLIST = "yes" *)
module main
   (clock,
    reset,
    a,
    b,
    y);
  input clock;
  input reset;
  input [7:0]a;
  input [7:0]b;
  output [7:0]y;

  wire [7:0]a;
  wire [7:0]b;
  wire [7:0]y;
  wire \y[4]_INST_0_i_1_n_0 ;
  wire \y[7]_INST_0_i_1_n_0 ;
  wire \y[7]_INST_0_i_2_n_0 ;

  LUT2 #(
    .INIT(4'h6)) 
    \y[0]_INST_0 
       (.I0(a[0]),
        .I1(b[0]),
        .O(y[0]));
  LUT4 #(
    .INIT(16'h8778)) 
    \y[1]_INST_0 
       (.I0(a[0]),
        .I1(b[0]),
        .I2(b[1]),
        .I3(a[1]),
        .O(y[1]));
  LUT6 #(
    .INIT(64'hF880077F077FF880)) 
    \y[2]_INST_0 
       (.I0(b[0]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(b[1]),
        .I4(b[2]),
        .I5(a[2]),
        .O(y[2]));
  LUT3 #(
    .INIT(8'h96)) 
    \y[3]_INST_0 
       (.I0(\y[4]_INST_0_i_1_n_0 ),
        .I1(b[3]),
        .I2(a[3]),
        .O(y[3]));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \y[4]_INST_0 
       (.I0(\y[4]_INST_0_i_1_n_0 ),
        .I1(a[3]),
        .I2(b[3]),
        .I3(b[4]),
        .I4(a[4]),
        .O(y[4]));
  LUT6 #(
    .INIT(64'hEEEEE888E8888888)) 
    \y[4]_INST_0_i_1 
       (.I0(b[2]),
        .I1(a[2]),
        .I2(b[0]),
        .I3(a[0]),
        .I4(a[1]),
        .I5(b[1]),
        .O(\y[4]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \y[5]_INST_0 
       (.I0(\y[7]_INST_0_i_1_n_0 ),
        .I1(b[5]),
        .I2(a[5]),
        .O(y[5]));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \y[6]_INST_0 
       (.I0(\y[7]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(b[5]),
        .I3(b[6]),
        .I4(a[6]),
        .O(y[6]));
  LUT6 #(
    .INIT(64'h001717FFFFE8E800)) 
    \y[7]_INST_0 
       (.I0(b[5]),
        .I1(a[5]),
        .I2(\y[7]_INST_0_i_1_n_0 ),
        .I3(a[6]),
        .I4(b[6]),
        .I5(\y[7]_INST_0_i_2_n_0 ),
        .O(y[7]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \y[7]_INST_0_i_1 
       (.I0(b[4]),
        .I1(a[4]),
        .I2(\y[4]_INST_0_i_1_n_0 ),
        .I3(a[3]),
        .I4(b[3]),
        .O(\y[7]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \y[7]_INST_0_i_2 
       (.I0(a[7]),
        .I1(b[7]),
        .O(\y[7]_INST_0_i_2_n_0 ));
endmodule
