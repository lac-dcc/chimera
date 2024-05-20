// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:05:33 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//invoke-with.futil-ultrascale-synth.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module lakeroad_xilinx_ultrascale_plus_add32_2
   (out0,
    E);
  output [31:0]out0;
  input [0:0]E;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]E;
  wire [7:7]co_11;
  wire [7:7]co_3;
  wire [7:7]co_7;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O5_12;
  wire [7:0]luts_O5_4;
  wire [7:0]luts_O5_8;
  wire [7:0]luts_O6_1;
  wire [7:0]luts_O6_13;
  wire [7:0]luts_O6_5;
  wire [7:0]luts_O6_9;
  wire [31:0]out0;
  wire [7:0]NLW_carry_17_CO_UNCONNECTED;
  wire [7:0]NLW_carry_26_CO_UNCONNECTED;
  wire [7:0]NLW_carry_8_CO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    A_LUT_0
       (.I0(E),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[0]),
        .O6(luts_O6_1[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    A_LUT_18
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[0]),
        .O6(luts_O6_9[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    A_LUT_27
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[0]),
        .O6(luts_O6_13[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    A_LUT_9
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[0]),
        .O6(luts_O6_5[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    B_LUT_1
       (.I0(E),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[1]),
        .O6(luts_O6_1[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    B_LUT_10
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[1]),
        .O6(luts_O6_5[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    B_LUT_19
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[1]),
        .O6(luts_O6_9[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    B_LUT_28
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[1]),
        .O6(luts_O6_13[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    C_LUT_11
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[2]),
        .O6(luts_O6_5[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    C_LUT_2
       (.I0(\<const0> ),
        .I1(E),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[2]),
        .O6(luts_O6_1[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    C_LUT_20
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[2]),
        .O6(luts_O6_9[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    C_LUT_29
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[2]),
        .O6(luts_O6_13[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    D_LUT_12
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[3]),
        .O6(luts_O6_5[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    D_LUT_21
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[3]),
        .O6(luts_O6_9[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    D_LUT_3
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[3]),
        .O6(luts_O6_1[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    D_LUT_30
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[3]),
        .O6(luts_O6_13[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    E_LUT_13
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[4]),
        .O6(luts_O6_5[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    E_LUT_22
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[4]),
        .O6(luts_O6_9[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    E_LUT_31
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[4]),
        .O6(luts_O6_13[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    E_LUT_4
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[4]),
        .O6(luts_O6_1[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    F_LUT_14
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[5]),
        .O6(luts_O6_5[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    F_LUT_23
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[5]),
        .O6(luts_O6_9[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    F_LUT_32
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[5]),
        .O6(luts_O6_13[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    F_LUT_5
       (.I0(\<const0> ),
        .I1(\<const0> ),
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
    G_LUT_15
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[6]),
        .O6(luts_O6_5[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    G_LUT_24
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[6]),
        .O6(luts_O6_9[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    G_LUT_33
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[6]),
        .O6(luts_O6_13[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    G_LUT_6
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[6]),
        .O6(luts_O6_1[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    H_LUT_16
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[7]),
        .O6(luts_O6_5[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    H_LUT_25
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[7]),
        .O6(luts_O6_9[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    H_LUT_34
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[7]),
        .O6(luts_O6_13[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    H_LUT_7
       (.I0(\<const0> ),
        .I1(\<const0> ),
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
    carry_17
       (.CI(co_3),
        .CI_TOP(\<const0> ),
        .CO({co_7,NLW_carry_17_CO_UNCONNECTED[6:0]}),
        .DI(luts_O5_4),
        .O(out0[15:8]),
        .S(luts_O6_5));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_26
       (.CI(co_7),
        .CI_TOP(\<const0> ),
        .CO({co_11,NLW_carry_26_CO_UNCONNECTED[6:0]}),
        .DI(luts_O5_8),
        .O(out0[23:16]),
        .S(luts_O6_9));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_35
       (.CI(co_11),
        .CI_TOP(\<const0> ),
        .DI(luts_O5_12),
        .O(out0[31:24]),
        .S(luts_O6_13));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_8
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .CO({co_3,NLW_carry_8_CO_UNCONNECTED[6:0]}),
        .DI(luts_O5_0),
        .O(out0[7:0]),
        .S(luts_O6_1));
endmodule

(* ORIG_REF_NAME = "lakeroad_xilinx_ultrascale_plus_add32_2" *) 
module lakeroad_xilinx_ultrascale_plus_add32_2_2
   (out0,
    E);
  output [31:0]out0;
  input [0:0]E;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]E;
  wire [7:7]co_11;
  wire [7:7]co_3;
  wire [7:7]co_7;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O5_12;
  wire [7:0]luts_O5_4;
  wire [7:0]luts_O5_8;
  wire [7:0]luts_O6_1;
  wire [7:0]luts_O6_13;
  wire [7:0]luts_O6_5;
  wire [7:0]luts_O6_9;
  wire [31:0]out0;
  wire [7:0]NLW_carry_17_CO_UNCONNECTED;
  wire [7:0]NLW_carry_26_CO_UNCONNECTED;
  wire [7:0]NLW_carry_8_CO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    A_LUT_0
       (.I0(E),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[0]),
        .O6(luts_O6_1[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    A_LUT_18
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[0]),
        .O6(luts_O6_9[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    A_LUT_27
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[0]),
        .O6(luts_O6_13[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    A_LUT_9
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[0]),
        .O6(luts_O6_5[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    B_LUT_1
       (.I0(\<const0> ),
        .I1(E),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[1]),
        .O6(luts_O6_1[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    B_LUT_10
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[1]),
        .O6(luts_O6_5[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    B_LUT_19
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[1]),
        .O6(luts_O6_9[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    B_LUT_28
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[1]),
        .O6(luts_O6_13[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    C_LUT_11
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[2]),
        .O6(luts_O6_5[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    C_LUT_2
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[2]),
        .O6(luts_O6_1[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    C_LUT_20
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[2]),
        .O6(luts_O6_9[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    C_LUT_29
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[2]),
        .O6(luts_O6_13[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    D_LUT_12
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[3]),
        .O6(luts_O6_5[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    D_LUT_21
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[3]),
        .O6(luts_O6_9[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    D_LUT_3
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[3]),
        .O6(luts_O6_1[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    D_LUT_30
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[3]),
        .O6(luts_O6_13[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    E_LUT_13
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[4]),
        .O6(luts_O6_5[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    E_LUT_22
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[4]),
        .O6(luts_O6_9[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    E_LUT_31
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[4]),
        .O6(luts_O6_13[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    E_LUT_4
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[4]),
        .O6(luts_O6_1[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    F_LUT_14
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[5]),
        .O6(luts_O6_5[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    F_LUT_23
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[5]),
        .O6(luts_O6_9[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    F_LUT_32
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[5]),
        .O6(luts_O6_13[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    F_LUT_5
       (.I0(\<const0> ),
        .I1(\<const0> ),
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
    G_LUT_15
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[6]),
        .O6(luts_O6_5[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    G_LUT_24
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[6]),
        .O6(luts_O6_9[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    G_LUT_33
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[6]),
        .O6(luts_O6_13[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    G_LUT_6
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[6]),
        .O6(luts_O6_1[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    H_LUT_16
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[7]),
        .O6(luts_O6_5[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    H_LUT_25
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[7]),
        .O6(luts_O6_9[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    H_LUT_34
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[7]),
        .O6(luts_O6_13[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    H_LUT_7
       (.I0(\<const0> ),
        .I1(\<const0> ),
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
    carry_17
       (.CI(co_3),
        .CI_TOP(\<const0> ),
        .CO({co_7,NLW_carry_17_CO_UNCONNECTED[6:0]}),
        .DI(luts_O5_4),
        .O(out0[15:8]),
        .S(luts_O6_5));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_26
       (.CI(co_7),
        .CI_TOP(\<const0> ),
        .CO({co_11,NLW_carry_26_CO_UNCONNECTED[6:0]}),
        .DI(luts_O5_8),
        .O(out0[23:16]),
        .S(luts_O6_9));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_35
       (.CI(co_11),
        .CI_TOP(\<const0> ),
        .DI(luts_O5_12),
        .O(out0[31:24]),
        .S(luts_O6_13));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_8
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .CO({co_3,NLW_carry_8_CO_UNCONNECTED[6:0]}),
        .DI(luts_O5_0),
        .O(out0[7:0]),
        .S(luts_O6_1));
endmodule

(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    .out_addr0(\<const0> ),
    out_write_data,
    out_write_en,
    out_clk,
    out_read_data,
    out_done);
  input go;
  input clk;
  input reset;
  output done;
  output [31:0]out_write_data;
  output out_write_en;
  output out_clk;
  input [31:0]out_read_data;
  input out_done;
  output \<const0> ;

  wire \<const0> ;
  wire [31:0]a0_out;
  wire [31:0]a1_out;
  wire clk;
  wire comb_reg0_done;
  wire comb_reg0_n_0;
  wire comb_reg0_n_1;
  wire comb_reg0_n_10;
  wire comb_reg0_n_11;
  wire comb_reg0_n_12;
  wire comb_reg0_n_13;
  wire comb_reg0_n_14;
  wire comb_reg0_n_15;
  wire comb_reg0_n_16;
  wire comb_reg0_n_17;
  wire comb_reg0_n_18;
  wire comb_reg0_n_19;
  wire comb_reg0_n_2;
  wire comb_reg0_n_20;
  wire comb_reg0_n_21;
  wire comb_reg0_n_22;
  wire comb_reg0_n_23;
  wire comb_reg0_n_24;
  wire comb_reg0_n_25;
  wire comb_reg0_n_26;
  wire comb_reg0_n_27;
  wire comb_reg0_n_28;
  wire comb_reg0_n_29;
  wire comb_reg0_n_3;
  wire comb_reg0_n_30;
  wire comb_reg0_n_31;
  wire comb_reg0_n_4;
  wire comb_reg0_n_5;
  wire comb_reg0_n_6;
  wire comb_reg0_n_7;
  wire comb_reg0_n_8;
  wire comb_reg0_n_9;
  wire comb_reg_n_1;
  wire comb_reg_n_10;
  wire comb_reg_n_11;
  wire comb_reg_n_12;
  wire comb_reg_n_13;
  wire comb_reg_n_14;
  wire comb_reg_n_15;
  wire comb_reg_n_16;
  wire comb_reg_n_17;
  wire comb_reg_n_18;
  wire comb_reg_n_19;
  wire comb_reg_n_2;
  wire comb_reg_n_20;
  wire comb_reg_n_21;
  wire comb_reg_n_22;
  wire comb_reg_n_23;
  wire comb_reg_n_24;
  wire comb_reg_n_25;
  wire comb_reg_n_26;
  wire comb_reg_n_27;
  wire comb_reg_n_28;
  wire comb_reg_n_29;
  wire comb_reg_n_3;
  wire comb_reg_n_30;
  wire comb_reg_n_31;
  wire comb_reg_n_32;
  wire comb_reg_n_4;
  wire comb_reg_n_5;
  wire comb_reg_n_6;
  wire comb_reg_n_7;
  wire comb_reg_n_8;
  wire comb_reg_n_9;
  wire [31:16]\comp/out_tmp_reg ;
  wire do_adds0_go_in;
  wire done;
  wire fsm_n_101;
  wire fsm_n_103;
  wire fsm_n_35;
  wire fsm_n_36;
  wire fsm_n_37;
  wire fsm_n_38;
  wire fsm_n_39;
  wire fsm_n_40;
  wire fsm_n_41;
  wire fsm_n_42;
  wire fsm_n_43;
  wire fsm_n_44;
  wire fsm_n_45;
  wire fsm_n_46;
  wire fsm_n_47;
  wire fsm_n_48;
  wire fsm_n_49;
  wire fsm_n_50;
  wire fsm_n_51;
  wire fsm_n_52;
  wire fsm_n_53;
  wire fsm_n_54;
  wire fsm_n_55;
  wire fsm_n_56;
  wire fsm_n_57;
  wire fsm_n_58;
  wire fsm_n_59;
  wire fsm_n_60;
  wire fsm_n_61;
  wire fsm_n_62;
  wire fsm_n_63;
  wire fsm_n_64;
  wire fsm_n_65;
  wire fsm_n_66;
  wire [1:0]fsm_out;
  wire go;
  wire invoke_go_in;
  wire m_done;
  wire m_n_17;
  wire m_n_18;
  wire m_n_19;
  wire m_n_20;
  wire m_n_21;
  wire m_n_22;
  wire m_n_23;
  wire m_n_24;
  wire m_n_25;
  wire m_n_26;
  wire m_n_27;
  wire m_n_28;
  wire m_n_29;
  wire m_n_30;
  wire m_n_31;
  wire m_n_32;
  wire out_done;
  wire [31:0]out_write_data;
  wire out_write_en;
  wire [31:0]p_0_in;
  wire reset;

  assign out_clk = clk;
  GND GND
       (.G(\<const0> ));
  std_add a0
       (.E(do_adds0_go_in),
        .out0(a0_out));
  std_add_0 a1
       (.E(do_adds0_go_in),
        .out0(a1_out));
  std_reg comb_reg
       (.D(a0_out),
        .E(do_adds0_go_in),
        .Q({comb_reg_n_1,comb_reg_n_2,comb_reg_n_3,comb_reg_n_4,comb_reg_n_5,comb_reg_n_6,comb_reg_n_7,comb_reg_n_8,comb_reg_n_9,comb_reg_n_10,comb_reg_n_11,comb_reg_n_12,comb_reg_n_13,comb_reg_n_14,comb_reg_n_15,comb_reg_n_16,comb_reg_n_17,comb_reg_n_18,comb_reg_n_19,comb_reg_n_20,comb_reg_n_21,comb_reg_n_22,comb_reg_n_23,comb_reg_n_24,comb_reg_n_25,comb_reg_n_26,comb_reg_n_27,comb_reg_n_28,comb_reg_n_29,comb_reg_n_30,comb_reg_n_31,comb_reg_n_32}),
        .clk(clk),
        .comb_reg0_done(comb_reg0_done),
        .done_reg_0(fsm_n_103),
        .reset(reset));
  std_reg_1 comb_reg0
       (.D(a1_out),
        .E(do_adds0_go_in),
        .Q({comb_reg0_n_0,comb_reg0_n_1,comb_reg0_n_2,comb_reg0_n_3,comb_reg0_n_4,comb_reg0_n_5,comb_reg0_n_6,comb_reg0_n_7,comb_reg0_n_8,comb_reg0_n_9,comb_reg0_n_10,comb_reg0_n_11,comb_reg0_n_12,comb_reg0_n_13,comb_reg0_n_14,comb_reg0_n_15,comb_reg0_n_16,comb_reg0_n_17,comb_reg0_n_18,comb_reg0_n_19,comb_reg0_n_20,comb_reg0_n_21,comb_reg0_n_22,comb_reg0_n_23,comb_reg0_n_24,comb_reg0_n_25,comb_reg0_n_26,comb_reg0_n_27,comb_reg0_n_28,comb_reg0_n_29,comb_reg0_n_30,comb_reg0_n_31}),
        .clk(clk),
        .reset(reset));
  std_reg__parameterized0 fsm
       (.B({fsm_n_35,fsm_n_36,fsm_n_37,fsm_n_38,fsm_n_39,fsm_n_40,fsm_n_41,fsm_n_42,fsm_n_43,fsm_n_44,fsm_n_45,fsm_n_46,fsm_n_47,fsm_n_48,fsm_n_49,fsm_n_50,fsm_n_51}),
        .E(invoke_go_in),
        .Q(fsm_out),
        .clk(clk),
        .comb_reg0_done(comb_reg0_done),
        .done(done),
        .go(go),
        .go_0(fsm_n_103),
        .m_done(m_done),
        .out0({comb_reg_n_1,comb_reg_n_2,comb_reg_n_3,comb_reg_n_4,comb_reg_n_5,comb_reg_n_6,comb_reg_n_7,comb_reg_n_8,comb_reg_n_9,comb_reg_n_10,comb_reg_n_11,comb_reg_n_12,comb_reg_n_13,comb_reg_n_14,comb_reg_n_15,comb_reg_n_16,comb_reg_n_17,comb_reg_n_18,comb_reg_n_19,comb_reg_n_20,comb_reg_n_21,comb_reg_n_22,comb_reg_n_23,comb_reg_n_24,comb_reg_n_25,comb_reg_n_26,comb_reg_n_27,comb_reg_n_28,comb_reg_n_29,comb_reg_n_30,comb_reg_n_31,comb_reg_n_32}),
        .out_done(out_done),
        .\out_reg[1]_0 (do_adds0_go_in),
        .\out_reg[1]_1 (fsm_n_101),
        .\out_reg[31] ({fsm_n_52,fsm_n_53,fsm_n_54,fsm_n_55,fsm_n_56,fsm_n_57,fsm_n_58,fsm_n_59,fsm_n_60,fsm_n_61,fsm_n_62,fsm_n_63,fsm_n_64,fsm_n_65,fsm_n_66}),
        .out_tmp_reg(\comp/out_tmp_reg ),
        .out_tmp_reg_0({comb_reg0_n_0,comb_reg0_n_1,comb_reg0_n_2,comb_reg0_n_3,comb_reg0_n_4,comb_reg0_n_5,comb_reg0_n_6,comb_reg0_n_7,comb_reg0_n_8,comb_reg0_n_9,comb_reg0_n_10,comb_reg0_n_11,comb_reg0_n_12,comb_reg0_n_13,comb_reg0_n_14,comb_reg0_n_15,comb_reg0_n_16,comb_reg0_n_17,comb_reg0_n_18,comb_reg0_n_19,comb_reg0_n_20,comb_reg0_n_21,comb_reg0_n_22,comb_reg0_n_23,comb_reg0_n_24,comb_reg0_n_25,comb_reg0_n_26,comb_reg0_n_27,comb_reg0_n_28,comb_reg0_n_29,comb_reg0_n_30,comb_reg0_n_31}),
        .out_write_data(out_write_data),
        .\out_write_data[15] ({m_n_17,m_n_18,m_n_19,m_n_20,m_n_21,m_n_22,m_n_23,m_n_24,m_n_25,m_n_26,m_n_27,m_n_28,m_n_29,m_n_30,m_n_31,m_n_32}),
        .out_write_en(out_write_en),
        .p_0_in(p_0_in),
        .reset(reset));
  std_mult_pipe m
       (.B({fsm_n_35,fsm_n_36,fsm_n_37,fsm_n_38,fsm_n_39,fsm_n_40,fsm_n_41,fsm_n_42,fsm_n_43,fsm_n_44,fsm_n_45,fsm_n_46,fsm_n_47,fsm_n_48,fsm_n_49,fsm_n_50,fsm_n_51}),
        .E(invoke_go_in),
        .Q(fsm_out),
        .clk(clk),
        .\done_buf_reg[2] (fsm_n_101),
        .go(go),
        .m_done(m_done),
        .out_tmp_reg(\comp/out_tmp_reg ),
        .\out_tmp_reg[15]__0 ({m_n_17,m_n_18,m_n_19,m_n_20,m_n_21,m_n_22,m_n_23,m_n_24,m_n_25,m_n_26,m_n_27,m_n_28,m_n_29,m_n_30,m_n_31,m_n_32}),
        .out_tmp_reg_0({fsm_n_52,fsm_n_53,fsm_n_54,fsm_n_55,fsm_n_56,fsm_n_57,fsm_n_58,fsm_n_59,fsm_n_60,fsm_n_61,fsm_n_62,fsm_n_63,fsm_n_64,fsm_n_65,fsm_n_66}),
        .p_0_in(p_0_in),
        .reset(reset));
endmodule

module std_add
   (out0,
    E);
  output [31:0]out0;
  input [0:0]E;

  wire [0:0]E;
  wire [31:0]out0;

  lakeroad_xilinx_ultrascale_plus_add32_2_2 _impl
       (.E(E),
        .out0(out0));
endmodule

(* ORIG_REF_NAME = "std_add" *) 
module std_add_0
   (out0,
    E);
  output [31:0]out0;
  input [0:0]E;

  wire [0:0]E;
  wire [31:0]out0;

  lakeroad_xilinx_ultrascale_plus_add32_2 _impl
       (.E(E),
        .out0(out0));
endmodule

module std_fp_mult_pipe
   (m_done,
    out_tmp_reg_0,
    \out_tmp_reg[15]__0_0 ,
    clk,
    \done_buf_reg[2]_0 ,
    E,
    reset,
    p_0_in,
    B,
    out_tmp_reg_1,
    Q,
    go);
  output m_done;
  output [15:0]out_tmp_reg_0;
  output [15:0]\out_tmp_reg[15]__0_0 ;
  input clk;
  input \done_buf_reg[2]_0 ;
  input [0:0]E;
  input reset;
  input [31:0]p_0_in;
  input [16:0]B;
  input [14:0]out_tmp_reg_1;
  input [1:0]Q;
  input go;

  wire \<const0> ;
  wire \<const1> ;
  wire [16:0]B;
  wire [0:0]E;
  wire GND_2;
  wire [1:0]Q;
  wire VCC_2;
  wire clk;
  wire \done_buf_reg[2]_0 ;
  wire \done_buf_reg_n_0_[0] ;
  wire \done_buf_reg_n_0_[1] ;
  wire go;
  wire m_done;
  wire out0__0_n_100;
  wire out0__0_n_101;
  wire out0__0_n_102;
  wire out0__0_n_103;
  wire out0__0_n_104;
  wire out0__0_n_105;
  wire out0__0_n_106;
  wire out0__0_n_107;
  wire out0__0_n_108;
  wire out0__0_n_109;
  wire out0__0_n_110;
  wire out0__0_n_111;
  wire out0__0_n_112;
  wire out0__0_n_113;
  wire out0__0_n_114;
  wire out0__0_n_115;
  wire out0__0_n_116;
  wire out0__0_n_117;
  wire out0__0_n_118;
  wire out0__0_n_119;
  wire out0__0_n_120;
  wire out0__0_n_121;
  wire out0__0_n_122;
  wire out0__0_n_123;
  wire out0__0_n_124;
  wire out0__0_n_125;
  wire out0__0_n_126;
  wire out0__0_n_127;
  wire out0__0_n_128;
  wire out0__0_n_129;
  wire out0__0_n_130;
  wire out0__0_n_131;
  wire out0__0_n_132;
  wire out0__0_n_133;
  wire out0__0_n_134;
  wire out0__0_n_135;
  wire out0__0_n_136;
  wire out0__0_n_137;
  wire out0__0_n_138;
  wire out0__0_n_139;
  wire out0__0_n_140;
  wire out0__0_n_141;
  wire out0__0_n_142;
  wire out0__0_n_143;
  wire out0__0_n_144;
  wire out0__0_n_145;
  wire out0__0_n_146;
  wire out0__0_n_147;
  wire out0__0_n_148;
  wire out0__0_n_149;
  wire out0__0_n_150;
  wire out0__0_n_151;
  wire out0__0_n_152;
  wire out0__0_n_153;
  wire out0__0_n_24;
  wire out0__0_n_25;
  wire out0__0_n_26;
  wire out0__0_n_27;
  wire out0__0_n_28;
  wire out0__0_n_29;
  wire out0__0_n_30;
  wire out0__0_n_31;
  wire out0__0_n_32;
  wire out0__0_n_33;
  wire out0__0_n_34;
  wire out0__0_n_35;
  wire out0__0_n_36;
  wire out0__0_n_37;
  wire out0__0_n_38;
  wire out0__0_n_39;
  wire out0__0_n_40;
  wire out0__0_n_41;
  wire out0__0_n_42;
  wire out0__0_n_43;
  wire out0__0_n_44;
  wire out0__0_n_45;
  wire out0__0_n_46;
  wire out0__0_n_47;
  wire out0__0_n_48;
  wire out0__0_n_49;
  wire out0__0_n_50;
  wire out0__0_n_51;
  wire out0__0_n_52;
  wire out0__0_n_53;
  wire out0__0_n_58;
  wire out0__0_n_59;
  wire out0__0_n_60;
  wire out0__0_n_61;
  wire out0__0_n_62;
  wire out0__0_n_63;
  wire out0__0_n_64;
  wire out0__0_n_65;
  wire out0__0_n_66;
  wire out0__0_n_67;
  wire out0__0_n_68;
  wire out0__0_n_69;
  wire out0__0_n_70;
  wire out0__0_n_71;
  wire out0__0_n_72;
  wire out0__0_n_73;
  wire out0__0_n_74;
  wire out0__0_n_75;
  wire out0__0_n_76;
  wire out0__0_n_77;
  wire out0__0_n_78;
  wire out0__0_n_79;
  wire out0__0_n_80;
  wire out0__0_n_81;
  wire out0__0_n_82;
  wire out0__0_n_83;
  wire out0__0_n_84;
  wire out0__0_n_85;
  wire out0__0_n_86;
  wire out0__0_n_87;
  wire out0__0_n_88;
  wire out0__0_n_89;
  wire out0__0_n_90;
  wire out0__0_n_91;
  wire out0__0_n_92;
  wire out0__0_n_93;
  wire out0__0_n_94;
  wire out0__0_n_95;
  wire out0__0_n_96;
  wire out0__0_n_97;
  wire out0__0_n_98;
  wire out0__0_n_99;
  wire out0_carry__0_n_1;
  wire out0_carry__0_n_2;
  wire out0_carry__0_n_3;
  wire out0_carry__0_n_4;
  wire out0_carry__0_n_5;
  wire out0_carry__0_n_6;
  wire out0_carry__0_n_7;
  wire out0_carry_i_1__0_n_0;
  wire out0_carry_i_1_n_0;
  wire out0_carry_i_2__0_n_0;
  wire out0_carry_i_2_n_0;
  wire out0_carry_i_3__0_n_0;
  wire out0_carry_i_3_n_0;
  wire out0_carry_i_4__0_n_0;
  wire out0_carry_i_4_n_0;
  wire out0_carry_i_5__0_n_0;
  wire out0_carry_i_5_n_0;
  wire out0_carry_i_6__0_n_0;
  wire out0_carry_i_6_n_0;
  wire out0_carry_i_7__0_n_0;
  wire out0_carry_i_7_n_0;
  wire out0_carry_i_8_n_0;
  wire out0_carry_n_0;
  wire out0_carry_n_1;
  wire out0_carry_n_2;
  wire out0_carry_n_3;
  wire out0_carry_n_4;
  wire out0_carry_n_5;
  wire out0_carry_n_6;
  wire out0_carry_n_7;
  wire out0_n_100;
  wire out0_n_101;
  wire out0_n_102;
  wire out0_n_103;
  wire out0_n_104;
  wire out0_n_105;
  wire out0_n_106;
  wire out0_n_107;
  wire out0_n_108;
  wire out0_n_109;
  wire out0_n_110;
  wire out0_n_111;
  wire out0_n_112;
  wire out0_n_113;
  wire out0_n_114;
  wire out0_n_115;
  wire out0_n_116;
  wire out0_n_117;
  wire out0_n_118;
  wire out0_n_119;
  wire out0_n_120;
  wire out0_n_121;
  wire out0_n_122;
  wire out0_n_123;
  wire out0_n_124;
  wire out0_n_125;
  wire out0_n_126;
  wire out0_n_127;
  wire out0_n_128;
  wire out0_n_129;
  wire out0_n_130;
  wire out0_n_131;
  wire out0_n_132;
  wire out0_n_133;
  wire out0_n_134;
  wire out0_n_135;
  wire out0_n_136;
  wire out0_n_137;
  wire out0_n_138;
  wire out0_n_139;
  wire out0_n_140;
  wire out0_n_141;
  wire out0_n_142;
  wire out0_n_143;
  wire out0_n_144;
  wire out0_n_145;
  wire out0_n_146;
  wire out0_n_147;
  wire out0_n_148;
  wire out0_n_149;
  wire out0_n_150;
  wire out0_n_151;
  wire out0_n_152;
  wire out0_n_153;
  wire out0_n_58;
  wire out0_n_59;
  wire out0_n_60;
  wire out0_n_61;
  wire out0_n_62;
  wire out0_n_63;
  wire out0_n_64;
  wire out0_n_65;
  wire out0_n_66;
  wire out0_n_67;
  wire out0_n_68;
  wire out0_n_69;
  wire out0_n_70;
  wire out0_n_71;
  wire out0_n_72;
  wire out0_n_73;
  wire out0_n_74;
  wire out0_n_75;
  wire out0_n_76;
  wire out0_n_77;
  wire out0_n_78;
  wire out0_n_79;
  wire out0_n_80;
  wire out0_n_81;
  wire out0_n_82;
  wire out0_n_83;
  wire out0_n_84;
  wire out0_n_85;
  wire out0_n_86;
  wire out0_n_87;
  wire out0_n_88;
  wire out0_n_89;
  wire out0_n_90;
  wire out0_n_91;
  wire out0_n_92;
  wire out0_n_93;
  wire out0_n_94;
  wire out0_n_95;
  wire out0_n_96;
  wire out0_n_97;
  wire out0_n_98;
  wire out0_n_99;
  wire [15:0]\out_tmp_reg[15]__0_0 ;
  wire \out_tmp_reg[16]__0_n_0 ;
  wire [15:0]out_tmp_reg_0;
  wire [14:0]out_tmp_reg_1;
  wire out_tmp_reg_n_100;
  wire out_tmp_reg_n_101;
  wire out_tmp_reg_n_102;
  wire out_tmp_reg_n_103;
  wire out_tmp_reg_n_104;
  wire out_tmp_reg_n_105;
  wire out_tmp_reg_n_58;
  wire out_tmp_reg_n_59;
  wire out_tmp_reg_n_60;
  wire out_tmp_reg_n_61;
  wire out_tmp_reg_n_62;
  wire out_tmp_reg_n_63;
  wire out_tmp_reg_n_64;
  wire out_tmp_reg_n_65;
  wire out_tmp_reg_n_66;
  wire out_tmp_reg_n_67;
  wire out_tmp_reg_n_68;
  wire out_tmp_reg_n_69;
  wire out_tmp_reg_n_70;
  wire out_tmp_reg_n_71;
  wire out_tmp_reg_n_72;
  wire out_tmp_reg_n_73;
  wire out_tmp_reg_n_74;
  wire out_tmp_reg_n_75;
  wire out_tmp_reg_n_76;
  wire out_tmp_reg_n_77;
  wire out_tmp_reg_n_78;
  wire out_tmp_reg_n_79;
  wire out_tmp_reg_n_80;
  wire out_tmp_reg_n_81;
  wire out_tmp_reg_n_82;
  wire out_tmp_reg_n_83;
  wire out_tmp_reg_n_84;
  wire out_tmp_reg_n_85;
  wire out_tmp_reg_n_86;
  wire out_tmp_reg_n_87;
  wire out_tmp_reg_n_88;
  wire out_tmp_reg_n_89;
  wire out_tmp_reg_n_90;
  wire out_tmp_reg_n_91;
  wire out_tmp_reg_n_92;
  wire out_tmp_reg_n_93;
  wire out_tmp_reg_n_94;
  wire out_tmp_reg_n_95;
  wire out_tmp_reg_n_96;
  wire out_tmp_reg_n_97;
  wire out_tmp_reg_n_98;
  wire out_tmp_reg_n_99;
  wire [31:0]p_0_in;
  wire reset;
  wire start;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  VCC VCC
       (.P(\<const1> ));
  VCC VCC_1
       (.P(VCC_2));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \done_buf[0]_i_1 
       (.I0(Q[1]),
        .I1(m_done),
        .I2(\done_buf_reg_n_0_[1] ),
        .I3(\done_buf_reg_n_0_[0] ),
        .I4(Q[0]),
        .I5(go),
        .O(start));
  FDRE \done_buf_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(start),
        .Q(\done_buf_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE \done_buf_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\done_buf_reg_n_0_[0] ),
        .Q(\done_buf_reg_n_0_[1] ),
        .R(\done_buf_reg[2]_0 ));
  FDRE \done_buf_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\done_buf_reg_n_0_[1] ),
        .Q(m_done),
        .R(\done_buf_reg[2]_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x18 4}}" *) 
  DSP48E2 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    out0
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,B}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,p_0_in[31:17]}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(\<const1> ),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(\<const1> ),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(E),
        .CLK(clk),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({out0_n_58,out0_n_59,out0_n_60,out0_n_61,out0_n_62,out0_n_63,out0_n_64,out0_n_65,out0_n_66,out0_n_67,out0_n_68,out0_n_69,out0_n_70,out0_n_71,out0_n_72,out0_n_73,out0_n_74,out0_n_75,out0_n_76,out0_n_77,out0_n_78,out0_n_79,out0_n_80,out0_n_81,out0_n_82,out0_n_83,out0_n_84,out0_n_85,out0_n_86,out0_n_87,out0_n_88,out0_n_89,out0_n_90,out0_n_91,out0_n_92,out0_n_93,out0_n_94,out0_n_95,out0_n_96,out0_n_97,out0_n_98,out0_n_99,out0_n_100,out0_n_101,out0_n_102,out0_n_103,out0_n_104,out0_n_105}),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PCOUT({out0_n_106,out0_n_107,out0_n_108,out0_n_109,out0_n_110,out0_n_111,out0_n_112,out0_n_113,out0_n_114,out0_n_115,out0_n_116,out0_n_117,out0_n_118,out0_n_119,out0_n_120,out0_n_121,out0_n_122,out0_n_123,out0_n_124,out0_n_125,out0_n_126,out0_n_127,out0_n_128,out0_n_129,out0_n_130,out0_n_131,out0_n_132,out0_n_133,out0_n_134,out0_n_135,out0_n_136,out0_n_137,out0_n_138,out0_n_139,out0_n_140,out0_n_141,out0_n_142,out0_n_143,out0_n_144,out0_n_145,out0_n_146,out0_n_147,out0_n_148,out0_n_149,out0_n_150,out0_n_151,out0_n_152,out0_n_153}),
        .RSTA(reset),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(reset),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(reset));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
  DSP48E2 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(0),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    out0__0
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,p_0_in[16:0]}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ACOUT({out0__0_n_24,out0__0_n_25,out0__0_n_26,out0__0_n_27,out0__0_n_28,out0__0_n_29,out0__0_n_30,out0__0_n_31,out0__0_n_32,out0__0_n_33,out0__0_n_34,out0__0_n_35,out0__0_n_36,out0__0_n_37,out0__0_n_38,out0__0_n_39,out0__0_n_40,out0__0_n_41,out0__0_n_42,out0__0_n_43,out0__0_n_44,out0__0_n_45,out0__0_n_46,out0__0_n_47,out0__0_n_48,out0__0_n_49,out0__0_n_50,out0__0_n_51,out0__0_n_52,out0__0_n_53}),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,B}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(\<const1> ),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(\<const1> ),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({out0__0_n_58,out0__0_n_59,out0__0_n_60,out0__0_n_61,out0__0_n_62,out0__0_n_63,out0__0_n_64,out0__0_n_65,out0__0_n_66,out0__0_n_67,out0__0_n_68,out0__0_n_69,out0__0_n_70,out0__0_n_71,out0__0_n_72,out0__0_n_73,out0__0_n_74,out0__0_n_75,out0__0_n_76,out0__0_n_77,out0__0_n_78,out0__0_n_79,out0__0_n_80,out0__0_n_81,out0__0_n_82,out0__0_n_83,out0__0_n_84,out0__0_n_85,out0__0_n_86,out0__0_n_87,out0__0_n_88,out0__0_n_89,out0__0_n_90,out0__0_n_91,out0__0_n_92,out0__0_n_93,out0__0_n_94,out0__0_n_95,out0__0_n_96,out0__0_n_97,out0__0_n_98,out0__0_n_99,out0__0_n_100,out0__0_n_101,out0__0_n_102,out0__0_n_103,out0__0_n_104,out0__0_n_105}),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PCOUT({out0__0_n_106,out0__0_n_107,out0__0_n_108,out0__0_n_109,out0__0_n_110,out0__0_n_111,out0__0_n_112,out0__0_n_113,out0__0_n_114,out0__0_n_115,out0__0_n_116,out0__0_n_117,out0__0_n_118,out0__0_n_119,out0__0_n_120,out0__0_n_121,out0__0_n_122,out0__0_n_123,out0__0_n_124,out0__0_n_125,out0__0_n_126,out0__0_n_127,out0__0_n_128,out0__0_n_129,out0__0_n_130,out0__0_n_131,out0__0_n_132,out0__0_n_133,out0__0_n_134,out0__0_n_135,out0__0_n_136,out0__0_n_137,out0__0_n_138,out0__0_n_139,out0__0_n_140,out0__0_n_141,out0__0_n_142,out0__0_n_143,out0__0_n_144,out0__0_n_145,out0__0_n_146,out0__0_n_147,out0__0_n_148,out0__0_n_149,out0__0_n_150,out0__0_n_151,out0__0_n_152,out0__0_n_153}),
        .RSTA(reset),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(reset),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  CARRY8 out0_carry
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({out0_carry_n_0,out0_carry_n_1,out0_carry_n_2,out0_carry_n_3,out0_carry_n_4,out0_carry_n_5,out0_carry_n_6,out0_carry_n_7}),
        .DI({out_tmp_reg_n_99,out_tmp_reg_n_100,out_tmp_reg_n_101,out_tmp_reg_n_102,out_tmp_reg_n_103,out_tmp_reg_n_104,out_tmp_reg_n_105,\<const0> }),
        .O(out_tmp_reg_0[7:0]),
        .S({out0_carry_i_1__0_n_0,out0_carry_i_2_n_0,out0_carry_i_3_n_0,out0_carry_i_4_n_0,out0_carry_i_5_n_0,out0_carry_i_6_n_0,out0_carry_i_7_n_0,\out_tmp_reg[16]__0_n_0 }));
  CARRY8 out0_carry__0
       (.CI(out0_carry_n_0),
        .CI_TOP(GND_2),
        .CO({out0_carry__0_n_1,out0_carry__0_n_2,out0_carry__0_n_3,out0_carry__0_n_4,out0_carry__0_n_5,out0_carry__0_n_6,out0_carry__0_n_7}),
        .DI({\<const0> ,out_tmp_reg_n_92,out_tmp_reg_n_93,out_tmp_reg_n_94,out_tmp_reg_n_95,out_tmp_reg_n_96,out_tmp_reg_n_97,out_tmp_reg_n_98}),
        .O(out_tmp_reg_0[15:8]),
        .S({out0_carry_i_1_n_0,out0_carry_i_2__0_n_0,out0_carry_i_3__0_n_0,out0_carry_i_4__0_n_0,out0_carry_i_5__0_n_0,out0_carry_i_6__0_n_0,out0_carry_i_7__0_n_0,out0_carry_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_1
       (.I0(out0_n_91),
        .I1(out_tmp_reg_n_91),
        .O(out0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_1__0
       (.I0(out_tmp_reg_n_99),
        .I1(out0_n_99),
        .O(out0_carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_2
       (.I0(out_tmp_reg_n_100),
        .I1(out0_n_100),
        .O(out0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_2__0
       (.I0(out_tmp_reg_n_92),
        .I1(out0_n_92),
        .O(out0_carry_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_3
       (.I0(out_tmp_reg_n_101),
        .I1(out0_n_101),
        .O(out0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_3__0
       (.I0(out_tmp_reg_n_93),
        .I1(out0_n_93),
        .O(out0_carry_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_4
       (.I0(out_tmp_reg_n_102),
        .I1(out0_n_102),
        .O(out0_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_4__0
       (.I0(out_tmp_reg_n_94),
        .I1(out0_n_94),
        .O(out0_carry_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_5
       (.I0(out_tmp_reg_n_103),
        .I1(out0_n_103),
        .O(out0_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_5__0
       (.I0(out_tmp_reg_n_95),
        .I1(out0_n_95),
        .O(out0_carry_i_5__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_6
       (.I0(out_tmp_reg_n_104),
        .I1(out0_n_104),
        .O(out0_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_6__0
       (.I0(out_tmp_reg_n_96),
        .I1(out0_n_96),
        .O(out0_carry_i_6__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_7
       (.I0(out_tmp_reg_n_105),
        .I1(out0_n_105),
        .O(out0_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_7__0
       (.I0(out_tmp_reg_n_97),
        .I1(out0_n_97),
        .O(out0_carry_i_7__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_8
       (.I0(out_tmp_reg_n_98),
        .I1(out0_n_98),
        .O(out0_carry_i_8_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x16 4}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("CASCADE"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    out_tmp_reg
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ACIN({out0__0_n_24,out0__0_n_25,out0__0_n_26,out0__0_n_27,out0__0_n_28,out0__0_n_29,out0__0_n_30,out0__0_n_31,out0__0_n_32,out0__0_n_33,out0__0_n_34,out0__0_n_35,out0__0_n_36,out0__0_n_37,out0__0_n_38,out0__0_n_39,out0__0_n_40,out0__0_n_41,out0__0_n_42,out0__0_n_43,out0__0_n_44,out0__0_n_45,out0__0_n_46,out0__0_n_47,out0__0_n_48,out0__0_n_49,out0__0_n_50,out0__0_n_51,out0__0_n_52,out0__0_n_53}),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,out_tmp_reg_1}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(\<const0> ),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(\<const1> ),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(E),
        .CLK(clk),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({out_tmp_reg_n_58,out_tmp_reg_n_59,out_tmp_reg_n_60,out_tmp_reg_n_61,out_tmp_reg_n_62,out_tmp_reg_n_63,out_tmp_reg_n_64,out_tmp_reg_n_65,out_tmp_reg_n_66,out_tmp_reg_n_67,out_tmp_reg_n_68,out_tmp_reg_n_69,out_tmp_reg_n_70,out_tmp_reg_n_71,out_tmp_reg_n_72,out_tmp_reg_n_73,out_tmp_reg_n_74,out_tmp_reg_n_75,out_tmp_reg_n_76,out_tmp_reg_n_77,out_tmp_reg_n_78,out_tmp_reg_n_79,out_tmp_reg_n_80,out_tmp_reg_n_81,out_tmp_reg_n_82,out_tmp_reg_n_83,out_tmp_reg_n_84,out_tmp_reg_n_85,out_tmp_reg_n_86,out_tmp_reg_n_87,out_tmp_reg_n_88,out_tmp_reg_n_89,out_tmp_reg_n_90,out_tmp_reg_n_91,out_tmp_reg_n_92,out_tmp_reg_n_93,out_tmp_reg_n_94,out_tmp_reg_n_95,out_tmp_reg_n_96,out_tmp_reg_n_97,out_tmp_reg_n_98,out_tmp_reg_n_99,out_tmp_reg_n_100,out_tmp_reg_n_101,out_tmp_reg_n_102,out_tmp_reg_n_103,out_tmp_reg_n_104,out_tmp_reg_n_105}),
        .PCIN({out0__0_n_106,out0__0_n_107,out0__0_n_108,out0__0_n_109,out0__0_n_110,out0__0_n_111,out0__0_n_112,out0__0_n_113,out0__0_n_114,out0__0_n_115,out0__0_n_116,out0__0_n_117,out0__0_n_118,out0__0_n_119,out0__0_n_120,out0__0_n_121,out0__0_n_122,out0__0_n_123,out0__0_n_124,out0__0_n_125,out0__0_n_126,out0__0_n_127,out0__0_n_128,out0__0_n_129,out0__0_n_130,out0__0_n_131,out0__0_n_132,out0__0_n_133,out0__0_n_134,out0__0_n_135,out0__0_n_136,out0__0_n_137,out0__0_n_138,out0__0_n_139,out0__0_n_140,out0__0_n_141,out0__0_n_142,out0__0_n_143,out0__0_n_144,out0__0_n_145,out0__0_n_146,out0__0_n_147,out0__0_n_148,out0__0_n_149,out0__0_n_150,out0__0_n_151,out0__0_n_152,out0__0_n_153}),
        .RSTA(\<const0> ),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(reset),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(reset));
  FDRE \out_tmp_reg[0]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_105),
        .Q(\out_tmp_reg[15]__0_0 [0]),
        .R(reset));
  FDRE \out_tmp_reg[10]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_95),
        .Q(\out_tmp_reg[15]__0_0 [10]),
        .R(reset));
  FDRE \out_tmp_reg[11]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_94),
        .Q(\out_tmp_reg[15]__0_0 [11]),
        .R(reset));
  FDRE \out_tmp_reg[12]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_93),
        .Q(\out_tmp_reg[15]__0_0 [12]),
        .R(reset));
  FDRE \out_tmp_reg[13]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_92),
        .Q(\out_tmp_reg[15]__0_0 [13]),
        .R(reset));
  FDRE \out_tmp_reg[14]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_91),
        .Q(\out_tmp_reg[15]__0_0 [14]),
        .R(reset));
  FDRE \out_tmp_reg[15]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_90),
        .Q(\out_tmp_reg[15]__0_0 [15]),
        .R(reset));
  FDRE \out_tmp_reg[16]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_89),
        .Q(\out_tmp_reg[16]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[1]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_104),
        .Q(\out_tmp_reg[15]__0_0 [1]),
        .R(reset));
  FDRE \out_tmp_reg[2]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_103),
        .Q(\out_tmp_reg[15]__0_0 [2]),
        .R(reset));
  FDRE \out_tmp_reg[3]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_102),
        .Q(\out_tmp_reg[15]__0_0 [3]),
        .R(reset));
  FDRE \out_tmp_reg[4]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_101),
        .Q(\out_tmp_reg[15]__0_0 [4]),
        .R(reset));
  FDRE \out_tmp_reg[5]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_100),
        .Q(\out_tmp_reg[15]__0_0 [5]),
        .R(reset));
  FDRE \out_tmp_reg[6]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_99),
        .Q(\out_tmp_reg[15]__0_0 [6]),
        .R(reset));
  FDRE \out_tmp_reg[7]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_98),
        .Q(\out_tmp_reg[15]__0_0 [7]),
        .R(reset));
  FDRE \out_tmp_reg[8]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_97),
        .Q(\out_tmp_reg[15]__0_0 [8]),
        .R(reset));
  FDRE \out_tmp_reg[9]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_96),
        .Q(\out_tmp_reg[15]__0_0 [9]),
        .R(reset));
endmodule

module std_mult_pipe
   (m_done,
    out_tmp_reg,
    \out_tmp_reg[15]__0 ,
    clk,
    \done_buf_reg[2] ,
    E,
    reset,
    p_0_in,
    B,
    out_tmp_reg_0,
    Q,
    go);
  output m_done;
  output [15:0]out_tmp_reg;
  output [15:0]\out_tmp_reg[15]__0 ;
  input clk;
  input \done_buf_reg[2] ;
  input [0:0]E;
  input reset;
  input [31:0]p_0_in;
  input [16:0]B;
  input [14:0]out_tmp_reg_0;
  input [1:0]Q;
  input go;

  wire [16:0]B;
  wire [0:0]E;
  wire [1:0]Q;
  wire clk;
  wire \done_buf_reg[2] ;
  wire go;
  wire m_done;
  wire [15:0]out_tmp_reg;
  wire [15:0]\out_tmp_reg[15]__0 ;
  wire [14:0]out_tmp_reg_0;
  wire [31:0]p_0_in;
  wire reset;

  std_fp_mult_pipe comp
       (.B(B),
        .E(E),
        .Q(Q),
        .clk(clk),
        .\done_buf_reg[2]_0 (\done_buf_reg[2] ),
        .go(go),
        .m_done(m_done),
        .\out_tmp_reg[15]__0_0 (\out_tmp_reg[15]__0 ),
        .out_tmp_reg_0(out_tmp_reg),
        .out_tmp_reg_1(out_tmp_reg_0),
        .p_0_in(p_0_in),
        .reset(reset));
endmodule

module std_reg
   (comb_reg0_done,
    Q,
    done_reg_0,
    clk,
    reset,
    E,
    D);
  output comb_reg0_done;
  output [31:0]Q;
  input done_reg_0;
  input clk;
  input reset;
  input [0:0]E;
  input [31:0]D;

  wire \<const0> ;
  wire \<const1> ;
  wire [31:0]D;
  wire [0:0]E;
  wire [31:0]Q;
  wire clk;
  wire comb_reg0_done;
  wire done_reg_0;
  wire reset;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(done_reg_0),
        .Q(comb_reg0_done),
        .R(\<const0> ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(D[10]),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(D[11]),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(D[12]),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(D[13]),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(D[14]),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(D[15]),
        .Q(Q[15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(D[16]),
        .Q(Q[16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(D[17]),
        .Q(Q[17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(D[18]),
        .Q(Q[18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(D[19]),
        .Q(Q[19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(D[20]),
        .Q(Q[20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(D[21]),
        .Q(Q[21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(D[22]),
        .Q(Q[22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(D[23]),
        .Q(Q[23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(D[24]),
        .Q(Q[24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(D[25]),
        .Q(Q[25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(D[26]),
        .Q(Q[26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(D[27]),
        .Q(Q[27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(D[28]),
        .Q(Q[28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(D[29]),
        .Q(Q[29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(D[30]),
        .Q(Q[30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(D[31]),
        .Q(Q[31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(D[4]),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(D[5]),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(D[6]),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(D[7]),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(D[8]),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(D[9]),
        .Q(Q[9]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_1
   (Q,
    reset,
    E,
    D,
    clk);
  output [31:0]Q;
  input reset;
  input [0:0]E;
  input [31:0]D;
  input clk;

  wire [31:0]D;
  wire [0:0]E;
  wire [31:0]Q;
  wire clk;
  wire reset;

  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(D[10]),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(D[11]),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(D[12]),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(D[13]),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(D[14]),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(D[15]),
        .Q(Q[15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(D[16]),
        .Q(Q[16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(D[17]),
        .Q(Q[17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(D[18]),
        .Q(Q[18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(D[19]),
        .Q(Q[19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(D[20]),
        .Q(Q[20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(D[21]),
        .Q(Q[21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(D[22]),
        .Q(Q[22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(D[23]),
        .Q(Q[23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(D[24]),
        .Q(Q[24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(D[25]),
        .Q(Q[25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(D[26]),
        .Q(Q[26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(D[27]),
        .Q(Q[27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(D[28]),
        .Q(Q[28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(D[29]),
        .Q(Q[29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(D[30]),
        .Q(Q[30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(D[31]),
        .Q(Q[31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(D[4]),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(D[5]),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(D[6]),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(D[7]),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(D[8]),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(D[9]),
        .Q(Q[9]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (out_write_data,
    Q,
    out_write_en,
    B,
    \out_reg[31] ,
    p_0_in,
    E,
    \out_reg[1]_0 ,
    \out_reg[1]_1 ,
    done,
    go_0,
    go,
    out_done,
    out_tmp_reg,
    \out_write_data[15] ,
    out_tmp_reg_0,
    m_done,
    out0,
    comb_reg0_done,
    reset,
    clk);
  output [31:0]out_write_data;
  output [1:0]Q;
  output out_write_en;
  output [16:0]B;
  output [14:0]\out_reg[31] ;
  output [31:0]p_0_in;
  output [0:0]E;
  output [0:0]\out_reg[1]_0 ;
  output \out_reg[1]_1 ;
  output done;
  output go_0;
  input go;
  input out_done;
  input [15:0]out_tmp_reg;
  input [15:0]\out_write_data[15] ;
  input [31:0]out_tmp_reg_0;
  input m_done;
  input [31:0]out0;
  input comb_reg0_done;
  input reset;
  input clk;

  wire [16:0]B;
  wire [0:0]E;
  wire [1:0]Q;
  wire clk;
  wire comb_reg0_done;
  wire done;
  wire [1:0]fsm_in;
  wire fsm_write_en;
  wire go;
  wire go_0;
  wire m_done;
  wire [31:0]out0;
  wire out_done;
  wire [0:0]\out_reg[1]_0 ;
  wire \out_reg[1]_1 ;
  wire [14:0]\out_reg[31] ;
  wire [15:0]out_tmp_reg;
  wire [31:0]out_tmp_reg_0;
  wire [31:0]out_write_data;
  wire [15:0]\out_write_data[15] ;
  wire out_write_en;
  wire [31:0]p_0_in;
  wire reset;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    A_LUT_0_i_1
       (.I0(Q[1]),
        .I1(comb_reg0_done),
        .I2(Q[0]),
        .I3(go),
        .O(\out_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    done_INST_0
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(done));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hEFFF)) 
    \done_buf[1]_i_1 
       (.I0(Q[1]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(go),
        .O(\out_reg[1]_1 ));
  LUT5 #(
    .INIT(32'h00000002)) 
    done_i_1
       (.I0(go),
        .I1(Q[0]),
        .I2(comb_reg0_done),
        .I3(Q[1]),
        .I4(reset),
        .O(go_0));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_1
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[16]),
        .O(p_0_in[16]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_10
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[23]),
        .O(p_0_in[23]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_10__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[7]),
        .O(p_0_in[7]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_11
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[22]),
        .O(p_0_in[22]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_11__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[6]),
        .O(p_0_in[6]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_12
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[21]),
        .O(p_0_in[21]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_12__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[5]),
        .O(p_0_in[5]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_13
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[20]),
        .O(p_0_in[20]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_13__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[4]),
        .O(p_0_in[4]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_14
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[19]),
        .O(p_0_in[19]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_14__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[3]),
        .O(p_0_in[3]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_15
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[18]),
        .O(p_0_in[18]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_15__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[2]),
        .O(p_0_in[2]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_16
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[17]),
        .O(p_0_in[17]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_16__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[1]),
        .O(p_0_in[1]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_17
       (.I0(out_tmp_reg_0[16]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[16]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_17__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[0]),
        .O(p_0_in[0]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_18
       (.I0(out_tmp_reg_0[15]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[15]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_19
       (.I0(out_tmp_reg_0[14]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[14]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    out0_i_1__0
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(m_done),
        .I3(go),
        .O(E));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_2
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[31]),
        .O(p_0_in[31]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_20
       (.I0(out_tmp_reg_0[13]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[13]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_21
       (.I0(out_tmp_reg_0[12]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[12]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_22
       (.I0(out_tmp_reg_0[11]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[11]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_23
       (.I0(out_tmp_reg_0[10]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[10]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_24
       (.I0(out_tmp_reg_0[9]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[9]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_25
       (.I0(out_tmp_reg_0[8]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[8]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_26
       (.I0(out_tmp_reg_0[7]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[7]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_27
       (.I0(out_tmp_reg_0[6]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[6]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_28
       (.I0(out_tmp_reg_0[5]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[5]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_29
       (.I0(out_tmp_reg_0[4]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[4]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_2__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[15]),
        .O(p_0_in[15]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_3
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[30]),
        .O(p_0_in[30]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_30
       (.I0(out_tmp_reg_0[3]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[3]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_31
       (.I0(out_tmp_reg_0[2]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_32
       (.I0(out_tmp_reg_0[1]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_33
       (.I0(out_tmp_reg_0[0]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(B[0]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_3__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[14]),
        .O(p_0_in[14]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_4
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[29]),
        .O(p_0_in[29]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_4__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[13]),
        .O(p_0_in[13]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_5
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[28]),
        .O(p_0_in[28]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_5__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[12]),
        .O(p_0_in[12]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_6
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[27]),
        .O(p_0_in[27]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_6__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[11]),
        .O(p_0_in[11]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_7
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[26]),
        .O(p_0_in[26]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_7__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[10]),
        .O(p_0_in[10]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_8
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[25]),
        .O(p_0_in[25]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_8__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[9]),
        .O(p_0_in[9]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_9
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[24]),
        .O(p_0_in[24]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out0_i_9__0
       (.I0(go),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out0[8]),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h54040000)) 
    \out[0]_i_1 
       (.I0(Q[0]),
        .I1(comb_reg0_done),
        .I2(Q[1]),
        .I3(out_done),
        .I4(go),
        .O(fsm_in[0]));
  LUT6 #(
    .INIT(64'hFFFFAA00CC00F000)) 
    \out[1]_i_1 
       (.I0(out_done),
        .I1(m_done),
        .I2(comb_reg0_done),
        .I3(go),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(fsm_write_en));
  LUT5 #(
    .INIT(32'h58080000)) 
    \out[1]_i_2 
       (.I0(Q[0]),
        .I1(m_done),
        .I2(Q[1]),
        .I3(out_done),
        .I4(go),
        .O(fsm_in[1]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[1]),
        .Q(Q[1]),
        .R(reset));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_1
       (.I0(out_tmp_reg_0[31]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [14]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_10
       (.I0(out_tmp_reg_0[22]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [5]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_11
       (.I0(out_tmp_reg_0[21]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [4]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_12
       (.I0(out_tmp_reg_0[20]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [3]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_13
       (.I0(out_tmp_reg_0[19]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [2]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_14
       (.I0(out_tmp_reg_0[18]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [1]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_15
       (.I0(out_tmp_reg_0[17]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [0]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_2
       (.I0(out_tmp_reg_0[30]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [13]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_3
       (.I0(out_tmp_reg_0[29]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [12]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_4
       (.I0(out_tmp_reg_0[28]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [11]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_5
       (.I0(out_tmp_reg_0[27]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [10]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_6
       (.I0(out_tmp_reg_0[26]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [9]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_7
       (.I0(out_tmp_reg_0[25]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [8]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_8
       (.I0(out_tmp_reg_0[24]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [7]));
  LUT5 #(
    .INIT(32'h00200000)) 
    out_tmp_reg_i_9
       (.I0(out_tmp_reg_0[23]),
        .I1(m_done),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(go),
        .O(\out_reg[31] [6]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[0]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [0]),
        .O(out_write_data[0]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[10]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [10]),
        .O(out_write_data[10]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[11]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [11]),
        .O(out_write_data[11]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[12]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [12]),
        .O(out_write_data[12]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[13]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [13]),
        .O(out_write_data[13]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[14]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [14]),
        .O(out_write_data[14]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[15]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [15]),
        .O(out_write_data[15]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[16]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[0]),
        .O(out_write_data[16]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[17]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[1]),
        .O(out_write_data[17]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[18]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[2]),
        .O(out_write_data[18]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[19]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[3]),
        .O(out_write_data[19]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[1]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [1]),
        .O(out_write_data[1]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[20]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[4]),
        .O(out_write_data[20]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[21]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[5]),
        .O(out_write_data[21]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[22]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[6]),
        .O(out_write_data[22]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[23]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[7]),
        .O(out_write_data[23]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[24]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[8]),
        .O(out_write_data[24]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[25]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[9]),
        .O(out_write_data[25]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[26]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[10]),
        .O(out_write_data[26]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[27]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[11]),
        .O(out_write_data[27]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[28]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[12]),
        .O(out_write_data[28]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[29]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[13]),
        .O(out_write_data[29]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[2]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [2]),
        .O(out_write_data[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[30]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[14]),
        .O(out_write_data[30]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[31]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(out_tmp_reg[15]),
        .O(out_write_data[31]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[3]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [3]),
        .O(out_write_data[3]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[4]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [4]),
        .O(out_write_data[4]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[5]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [5]),
        .O(out_write_data[5]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[6]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [6]),
        .O(out_write_data[6]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[7]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [7]),
        .O(out_write_data[7]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[8]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [8]),
        .O(out_write_data[8]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \out_write_data[9]_INST_0 
       (.I0(go),
        .I1(Q[0]),
        .I2(out_done),
        .I3(Q[1]),
        .I4(\out_write_data[15] [9]),
        .O(out_write_data[9]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    out_write_en_INST_0
       (.I0(Q[1]),
        .I1(out_done),
        .I2(Q[0]),
        .I3(go),
        .O(out_write_en));
endmodule
