// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:38:04 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route-lakeroad-ultrascale-instrs//lakeroad_xilinx_ultrascale_plus_sub5_2.v-place.v
// Design      : lakeroad_xilinx_ultrascale_plus_sub5_2
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "e7298a" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module lakeroad_xilinx_ultrascale_plus_sub5_2
   (a,
    b,
    out0);
  input [4:0]a;
  input [4:0]b;
  output [4:0]out0;

  wire \<const0> ;
  wire \<const1> ;
  wire ONE;
  wire [4:0]a;
  wire [4:0]b;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O6_1;
  wire [4:0]out0;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF3FFFFFFF)) 
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
    .INIT(64'h9FFFFFFF3FFFFFFF)) 
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
    .INIT(64'h9FFFFFFF3FFFFFFF)) 
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
    .INIT(64'h9FFFFFFF3FFFFFFF)) 
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
    .INIT(64'h9FFFFFFF3FFFFFFF)) 
    E_LUT_4
       (.I0(a[4]),
        .I1(b[4]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[4]),
        .O6(luts_O6_1[4]));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  VCC VCC_1
       (.P(ONE));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_8
       (.CI(\<const1> ),
        .CI_TOP(\<const0> ),
        .DI({ONE,ONE,ONE,luts_O5_0[4:0]}),
        .O(out0),
        .S({ONE,ONE,ONE,luts_O6_1[4:0]}));
endmodule
