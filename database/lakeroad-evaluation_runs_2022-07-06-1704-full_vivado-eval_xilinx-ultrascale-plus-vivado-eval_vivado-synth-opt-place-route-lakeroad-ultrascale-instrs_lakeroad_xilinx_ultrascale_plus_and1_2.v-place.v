// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:59:07 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route-lakeroad-ultrascale-instrs//lakeroad_xilinx_ultrascale_plus_and1_2.v-place.v
// Design      : lakeroad_xilinx_ultrascale_plus_and1_2
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "f4717d39" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module lakeroad_xilinx_ultrascale_plus_and1_2
   (a,
    b,
    out0);
  input a;
  input b;
  output out0;

  wire a;
  wire b;
  wire out0;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    lut2_0
       (.I0(a),
        .I1(b),
        .O(out0));
endmodule
