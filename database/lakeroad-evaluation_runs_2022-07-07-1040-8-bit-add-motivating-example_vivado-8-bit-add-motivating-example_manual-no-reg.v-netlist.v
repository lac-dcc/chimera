// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 17:41:27 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog
//               runs/2022-07-07-1040-8-bit-add-motivating-example/vivado-8-bit-add-motivating-example//manual-no-reg.v-netlist.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module add8
   (y,
    a,
    b);
  output [7:0]y;
  input [7:0]a;
  input [7:0]b;

  wire \<const0> ;
  wire [7:0]a;
  wire [7:0]b;
  wire [7:0]p;
  wire [7:0]y;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry0
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .DI(a),
        .O(y),
        .S(p));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l0
       (.I0(a[0]),
        .I1(b[0]),
        .O(p[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l1
       (.I0(a[1]),
        .I1(b[1]),
        .O(p[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l2
       (.I0(a[2]),
        .I1(b[2]),
        .O(p[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l3
       (.I0(a[3]),
        .I1(b[3]),
        .O(p[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l4
       (.I0(a[4]),
        .I1(b[4]),
        .O(p[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l5
       (.I0(a[5]),
        .I1(b[5]),
        .O(p[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l6
       (.I0(a[6]),
        .I1(b[6]),
        .O(p[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l7
       (.I0(a[7]),
        .I1(b[7]),
        .O(p[7]));
endmodule

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

  add8 inst
       (.a(a),
        .b(b),
        .y(y));
endmodule
