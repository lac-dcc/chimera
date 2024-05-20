// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:49:10 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route-lakeroad-ultrascale-instrs//lakeroad_xilinx_ultrascale_plus_and8_2.v-route.v
// Design      : lakeroad_xilinx_ultrascale_plus_and8_2
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "eee62f9a" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module lakeroad_xilinx_ultrascale_plus_and8_2
   (a,
    b,
    out0);
  input [7:0]a;
  input [7:0]b;
  output [7:0]out0;

  wire [7:0]a;
  wire [7:0]b;
  wire [7:0]out0;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_0
       (.I0(a[0]),
        .I1(b[0]),
        .O(out0[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_1
       (.I0(a[1]),
        .I1(b[1]),
        .O(out0[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_2
       (.I0(a[2]),
        .I1(b[2]),
        .O(out0[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_3
       (.I0(a[3]),
        .I1(b[3]),
        .O(out0[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_4
       (.I0(a[4]),
        .I1(b[4]),
        .O(out0[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_5
       (.I0(a[5]),
        .I1(b[5]),
        .O(out0[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_6
       (.I0(a[6]),
        .I1(b[6]),
        .O(out0[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_7
       (.I0(a[7]),
        .I1(b[7]),
        .O(out0[7]));
endmodule
