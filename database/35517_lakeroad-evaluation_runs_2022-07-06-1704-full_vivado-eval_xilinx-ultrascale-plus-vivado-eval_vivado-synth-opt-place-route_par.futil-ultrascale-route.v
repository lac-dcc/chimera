// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:03:36 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//par.futil-ultrascale-route.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "65f989af" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    a_addr0,
    a_write_data,
    a_write_en,
    a_clk,
    a_read_data,
    a_done,
    b_addr0,
    b_write_data,
    b_write_en,
    b_clk,
    b_read_data,
    b_done,
    c_addr0,
    c_write_data,
    c_write_en,
    c_clk,
    c_read_data,
    c_done);
  input go;
  input clk;
  input reset;
  output done;
  output a_addr0;
  output [31:0]a_write_data;
  output a_write_en;
  output a_clk;
  input [31:0]a_read_data;
  input a_done;
  output b_addr0;
  output [31:0]b_write_data;
  output b_write_en;
  output b_clk;
  input [31:0]b_read_data;
  input b_done;
  output c_addr0;
  output [31:0]c_write_data;
  output c_write_en;
  output c_clk;
  input [31:0]c_read_data;
  input c_done;

  wire \<const0> ;
  wire a_done;
  wire b_done;
  wire c_done;
  wire clk;
  wire done;
  wire go;

  assign a_addr0 = \<const0> ;
  assign a_clk = clk;
  assign a_write_data[31] = \<const0> ;
  assign a_write_data[30] = \<const0> ;
  assign a_write_data[29] = \<const0> ;
  assign a_write_data[28] = \<const0> ;
  assign a_write_data[27] = \<const0> ;
  assign a_write_data[26] = \<const0> ;
  assign a_write_data[25] = \<const0> ;
  assign a_write_data[24] = \<const0> ;
  assign a_write_data[23] = \<const0> ;
  assign a_write_data[22] = \<const0> ;
  assign a_write_data[21] = \<const0> ;
  assign a_write_data[20] = \<const0> ;
  assign a_write_data[19] = \<const0> ;
  assign a_write_data[18] = \<const0> ;
  assign a_write_data[17] = \<const0> ;
  assign a_write_data[16] = \<const0> ;
  assign a_write_data[15] = \<const0> ;
  assign a_write_data[14] = \<const0> ;
  assign a_write_data[13] = \<const0> ;
  assign a_write_data[12] = \<const0> ;
  assign a_write_data[11] = \<const0> ;
  assign a_write_data[10] = \<const0> ;
  assign a_write_data[9] = \<const0> ;
  assign a_write_data[8] = \<const0> ;
  assign a_write_data[7] = \<const0> ;
  assign a_write_data[6] = \<const0> ;
  assign a_write_data[5] = \<const0> ;
  assign a_write_data[4] = \<const0> ;
  assign a_write_data[3] = \<const0> ;
  assign a_write_data[2] = \<const0> ;
  assign a_write_data[1] = \<const0> ;
  assign a_write_data[0] = go;
  assign a_write_en = go;
  assign b_addr0 = \<const0> ;
  assign b_clk = clk;
  assign b_write_data[31] = \<const0> ;
  assign b_write_data[30] = \<const0> ;
  assign b_write_data[29] = \<const0> ;
  assign b_write_data[28] = \<const0> ;
  assign b_write_data[27] = \<const0> ;
  assign b_write_data[26] = \<const0> ;
  assign b_write_data[25] = \<const0> ;
  assign b_write_data[24] = \<const0> ;
  assign b_write_data[23] = \<const0> ;
  assign b_write_data[22] = \<const0> ;
  assign b_write_data[21] = \<const0> ;
  assign b_write_data[20] = \<const0> ;
  assign b_write_data[19] = \<const0> ;
  assign b_write_data[18] = \<const0> ;
  assign b_write_data[17] = \<const0> ;
  assign b_write_data[16] = \<const0> ;
  assign b_write_data[15] = \<const0> ;
  assign b_write_data[14] = \<const0> ;
  assign b_write_data[13] = \<const0> ;
  assign b_write_data[12] = \<const0> ;
  assign b_write_data[11] = \<const0> ;
  assign b_write_data[10] = \<const0> ;
  assign b_write_data[9] = \<const0> ;
  assign b_write_data[8] = \<const0> ;
  assign b_write_data[7] = \<const0> ;
  assign b_write_data[6] = \<const0> ;
  assign b_write_data[5] = \<const0> ;
  assign b_write_data[4] = \<const0> ;
  assign b_write_data[3] = \<const0> ;
  assign b_write_data[2] = \<const0> ;
  assign b_write_data[1] = \<const0> ;
  assign b_write_data[0] = go;
  assign b_write_en = go;
  assign c_addr0 = \<const0> ;
  assign c_clk = clk;
  assign c_write_data[31] = \<const0> ;
  assign c_write_data[30] = \<const0> ;
  assign c_write_data[29] = \<const0> ;
  assign c_write_data[28] = \<const0> ;
  assign c_write_data[27] = \<const0> ;
  assign c_write_data[26] = \<const0> ;
  assign c_write_data[25] = \<const0> ;
  assign c_write_data[24] = \<const0> ;
  assign c_write_data[23] = \<const0> ;
  assign c_write_data[22] = \<const0> ;
  assign c_write_data[21] = \<const0> ;
  assign c_write_data[20] = \<const0> ;
  assign c_write_data[19] = \<const0> ;
  assign c_write_data[18] = \<const0> ;
  assign c_write_data[17] = \<const0> ;
  assign c_write_data[16] = \<const0> ;
  assign c_write_data[15] = \<const0> ;
  assign c_write_data[14] = \<const0> ;
  assign c_write_data[13] = \<const0> ;
  assign c_write_data[12] = \<const0> ;
  assign c_write_data[11] = \<const0> ;
  assign c_write_data[10] = \<const0> ;
  assign c_write_data[9] = \<const0> ;
  assign c_write_data[8] = \<const0> ;
  assign c_write_data[7] = \<const0> ;
  assign c_write_data[6] = \<const0> ;
  assign c_write_data[5] = \<const0> ;
  assign c_write_data[4] = \<const0> ;
  assign c_write_data[3] = \<const0> ;
  assign c_write_data[2] = \<const0> ;
  assign c_write_data[1] = \<const0> ;
  assign c_write_data[0] = go;
  assign c_write_en = go;
  GND GND
       (.G(\<const0> ));
  LUT3 #(
    .INIT(8'h80)) 
    done_INST_0
       (.I0(a_done),
        .I1(b_done),
        .I2(c_done),
        .O(done));
endmodule
