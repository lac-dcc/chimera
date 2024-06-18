// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:52:36 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route-lakeroad-ultrascale-instrs//lakeroad_xilinx_ultrascale_plus_add8_2.v-route.v
// Design      : lakeroad_xilinx_ultrascale_plus_add8_2
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "c773db52" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module lakeroad_xilinx_ultrascale_plus_add8_2
   (a,
    b,
    out0);
  input [7:0]a;
  input [7:0]b;
  output [7:0]out0;

  wire \<const0> ;
  wire \<const1> ;
  wire [7:0]a;
  wire [7:0]b;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O6_1;
  wire [7:0]out0;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    A_LUT_0
       (.I0(a[0]),
        .I1(b[0]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[0]),
        .O6(luts_O6_1[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    B_LUT_1
       (.I0(a[1]),
        .I1(b[1]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[1]),
        .O6(luts_O6_1[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    C_LUT_2
       (.I0(a[2]),
        .I1(b[2]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[2]),
        .O6(luts_O6_1[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    D_LUT_3
       (.I0(a[3]),
        .I1(b[3]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[3]),
        .O6(luts_O6_1[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    E_LUT_4
       (.I0(a[4]),
        .I1(b[4]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[4]),
        .O6(luts_O6_1[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    F_LUT_5
       (.I0(a[5]),
        .I1(b[5]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[5]),
        .O6(luts_O6_1[5]));
  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    G_LUT_6
       (.I0(a[6]),
        .I1(b[6]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[6]),
        .O6(luts_O6_1[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    H_LUT_7
       (.I0(a[7]),
        .I1(b[7]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[7]),
        .O6(luts_O6_1[7]));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_8
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .DI(luts_O5_0),
        .O(out0),
        .S(luts_O6_1));
endmodule
