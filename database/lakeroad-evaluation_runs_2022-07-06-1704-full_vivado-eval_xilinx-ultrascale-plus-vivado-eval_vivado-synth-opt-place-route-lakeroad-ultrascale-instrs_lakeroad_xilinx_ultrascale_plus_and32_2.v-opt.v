// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:39:57 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route-lakeroad-ultrascale-instrs//lakeroad_xilinx_ultrascale_plus_and32_2.v-opt.v
// Design      : lakeroad_xilinx_ultrascale_plus_and32_2
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NETLIST_CHECKSUM = "a180ed69" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module lakeroad_xilinx_ultrascale_plus_and32_2
   (a,
    b,
    out0);
  input [31:0]a;
  input [31:0]b;
  output [31:0]out0;

  wire [31:0]a;
  wire [31:0]b;
  wire [31:0]out0;

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
    lut2_10
       (.I0(a[10]),
        .I1(b[10]),
        .O(out0[10]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_11
       (.I0(a[11]),
        .I1(b[11]),
        .O(out0[11]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_12
       (.I0(a[12]),
        .I1(b[12]),
        .O(out0[12]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_13
       (.I0(a[13]),
        .I1(b[13]),
        .O(out0[13]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_14
       (.I0(a[14]),
        .I1(b[14]),
        .O(out0[14]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_15
       (.I0(a[15]),
        .I1(b[15]),
        .O(out0[15]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_16
       (.I0(a[16]),
        .I1(b[16]),
        .O(out0[16]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_17
       (.I0(a[17]),
        .I1(b[17]),
        .O(out0[17]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_18
       (.I0(a[18]),
        .I1(b[18]),
        .O(out0[18]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_19
       (.I0(a[19]),
        .I1(b[19]),
        .O(out0[19]));
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
    lut2_20
       (.I0(a[20]),
        .I1(b[20]),
        .O(out0[20]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_21
       (.I0(a[21]),
        .I1(b[21]),
        .O(out0[21]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_22
       (.I0(a[22]),
        .I1(b[22]),
        .O(out0[22]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_23
       (.I0(a[23]),
        .I1(b[23]),
        .O(out0[23]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_24
       (.I0(a[24]),
        .I1(b[24]),
        .O(out0[24]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_25
       (.I0(a[25]),
        .I1(b[25]),
        .O(out0[25]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_26
       (.I0(a[26]),
        .I1(b[26]),
        .O(out0[26]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_27
       (.I0(a[27]),
        .I1(b[27]),
        .O(out0[27]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_28
       (.I0(a[28]),
        .I1(b[28]),
        .O(out0[28]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_29
       (.I0(a[29]),
        .I1(b[29]),
        .O(out0[29]));
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
    lut2_30
       (.I0(a[30]),
        .I1(b[30]),
        .O(out0[30]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_31
       (.I0(a[31]),
        .I1(b[31]),
        .O(out0[31]));
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
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_8
       (.I0(a[8]),
        .I1(b[8]),
        .O(out0[8]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_9
       (.I0(a[9]),
        .I1(b[9]),
        .O(out0[9]));
endmodule
