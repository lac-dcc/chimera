// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:47:55 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route-lakeroad-ultrascale-instrs//lakeroad_xilinx_ultrascale_plus_eq6_2.v-opt.v
// Design      : lakeroad_xilinx_ultrascale_plus_eq6_2
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NETLIST_CHECKSUM = "45bf97b4" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module lakeroad_xilinx_ultrascale_plus_eq6_2
   (a,
    b,
    out0);
  input [5:0]a;
  input [5:0]b;
  output out0;

  wire \<const0> ;
  wire \<const1> ;
  wire ONE;
  wire ZERO;
  wire [5:0]a;
  wire [5:0]b;
  wire [7:0]luts_O6_1;
  wire out0;
  wire [7:0]NLW_carry_8_CO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h9)) 
    A_LUT_0
       (.I0(a[0]),
        .I1(b[0]),
        .O(luts_O6_1[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h9)) 
    B_LUT_1
       (.I0(a[1]),
        .I1(b[1]),
        .O(luts_O6_1[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h9)) 
    C_LUT_2
       (.I0(a[2]),
        .I1(b[2]),
        .O(luts_O6_1[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h9)) 
    D_LUT_3
       (.I0(a[3]),
        .I1(b[3]),
        .O(luts_O6_1[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h9)) 
    E_LUT_4
       (.I0(a[4]),
        .I1(b[4]),
        .O(luts_O6_1[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h9)) 
    F_LUT_5
       (.I0(a[5]),
        .I1(b[5]),
        .O(luts_O6_1[5]));
  GND GND
       (.G(\<const0> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(ZERO));
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
        .CO({out0,NLW_carry_8_CO_UNCONNECTED[6:0]}),
        .DI({ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO}),
        .S({ONE,ONE,luts_O6_1[5:0]}));
endmodule
