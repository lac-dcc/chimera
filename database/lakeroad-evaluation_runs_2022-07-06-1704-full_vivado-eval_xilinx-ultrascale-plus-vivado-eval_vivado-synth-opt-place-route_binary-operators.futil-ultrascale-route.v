// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 02:58:36 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//binary-operators.futil-ultrascale-route.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module lakeroad_xilinx_ultrascale_plus_add32_2
   (out0,
    a,
    b);
  output [31:0]out0;
  input [31:0]a;
  input [31:0]b;

  wire \<const0> ;
  wire \<const1> ;
  wire [31:0]a;
  wire [31:0]b;
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
    A_LUT_18
       (.I0(a[16]),
        .I1(b[16]),
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
       (.I0(a[24]),
        .I1(b[24]),
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
       (.I0(a[8]),
        .I1(b[8]),
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
    B_LUT_10
       (.I0(a[9]),
        .I1(b[9]),
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
       (.I0(a[17]),
        .I1(b[17]),
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
       (.I0(a[25]),
        .I1(b[25]),
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
       (.I0(a[10]),
        .I1(b[10]),
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
    C_LUT_20
       (.I0(a[18]),
        .I1(b[18]),
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
       (.I0(a[26]),
        .I1(b[26]),
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
       (.I0(a[11]),
        .I1(b[11]),
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
       (.I0(a[19]),
        .I1(b[19]),
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
    D_LUT_30
       (.I0(a[27]),
        .I1(b[27]),
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
       (.I0(a[12]),
        .I1(b[12]),
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
       (.I0(a[20]),
        .I1(b[20]),
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
       (.I0(a[28]),
        .I1(b[28]),
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
    F_LUT_14
       (.I0(a[13]),
        .I1(b[13]),
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
       (.I0(a[21]),
        .I1(b[21]),
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
       (.I0(a[29]),
        .I1(b[29]),
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
    G_LUT_15
       (.I0(a[14]),
        .I1(b[14]),
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
       (.I0(a[22]),
        .I1(b[22]),
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
       (.I0(a[30]),
        .I1(b[30]),
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
    H_LUT_16
       (.I0(a[15]),
        .I1(b[15]),
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
       (.I0(a[23]),
        .I1(b[23]),
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
       (.I0(a[31]),
        .I1(b[31]),
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

module lakeroad_xilinx_ultrascale_plus_sub32_2
   (out0,
    a,
    b);
  output [31:0]out0;
  input [31:0]a;
  input [31:0]b;

  wire \<const0> ;
  wire \<const1> ;
  wire [31:0]a;
  wire [31:0]b;
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
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
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
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    A_LUT_18
       (.I0(a[16]),
        .I1(b[16]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[0]),
        .O6(luts_O6_9[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    A_LUT_27
       (.I0(a[24]),
        .I1(b[24]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[0]),
        .O6(luts_O6_13[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    A_LUT_9
       (.I0(a[8]),
        .I1(b[8]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[0]),
        .O6(luts_O6_5[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
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
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    B_LUT_10
       (.I0(a[9]),
        .I1(b[9]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[1]),
        .O6(luts_O6_5[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    B_LUT_19
       (.I0(a[17]),
        .I1(b[17]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[1]),
        .O6(luts_O6_9[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    B_LUT_28
       (.I0(a[25]),
        .I1(b[25]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[1]),
        .O6(luts_O6_13[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    C_LUT_11
       (.I0(a[10]),
        .I1(b[10]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[2]),
        .O6(luts_O6_5[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
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
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    C_LUT_20
       (.I0(a[18]),
        .I1(b[18]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[2]),
        .O6(luts_O6_9[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    C_LUT_29
       (.I0(a[26]),
        .I1(b[26]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[2]),
        .O6(luts_O6_13[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    D_LUT_12
       (.I0(a[11]),
        .I1(b[11]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[3]),
        .O6(luts_O6_5[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    D_LUT_21
       (.I0(a[19]),
        .I1(b[19]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[3]),
        .O6(luts_O6_9[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
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
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    D_LUT_30
       (.I0(a[27]),
        .I1(b[27]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[3]),
        .O6(luts_O6_13[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    E_LUT_13
       (.I0(a[12]),
        .I1(b[12]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[4]),
        .O6(luts_O6_5[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    E_LUT_22
       (.I0(a[20]),
        .I1(b[20]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[4]),
        .O6(luts_O6_9[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    E_LUT_31
       (.I0(a[28]),
        .I1(b[28]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[4]),
        .O6(luts_O6_13[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
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
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    F_LUT_14
       (.I0(a[13]),
        .I1(b[13]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[5]),
        .O6(luts_O6_5[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    F_LUT_23
       (.I0(a[21]),
        .I1(b[21]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[5]),
        .O6(luts_O6_9[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    F_LUT_32
       (.I0(a[29]),
        .I1(b[29]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[5]),
        .O6(luts_O6_13[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
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
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    G_LUT_15
       (.I0(a[14]),
        .I1(b[14]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[6]),
        .O6(luts_O6_5[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    G_LUT_24
       (.I0(a[22]),
        .I1(b[22]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[6]),
        .O6(luts_O6_9[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    G_LUT_33
       (.I0(a[30]),
        .I1(b[30]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[6]),
        .O6(luts_O6_13[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
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
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    H_LUT_16
       (.I0(a[15]),
        .I1(b[15]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_4[7]),
        .O6(luts_O6_5[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    H_LUT_25
       (.I0(a[23]),
        .I1(b[23]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_8[7]),
        .O6(luts_O6_9[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
    H_LUT_34
       (.I0(a[31]),
        .I1(b[31]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_12[7]),
        .O6(luts_O6_13[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFF2FFFFFFF)) 
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
       (.CI(\<const1> ),
        .CI_TOP(\<const0> ),
        .CO({co_3,NLW_carry_8_CO_UNCONNECTED[6:0]}),
        .DI(luts_O5_0),
        .O(out0[7:0]),
        .S(luts_O6_1));
endmodule

(* ECO_CHECKSUM = "b18b179e" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    slhs_addr0,
    slhs_write_data,
    slhs_write_en,
    slhs_clk,
    slhs_read_data,
    slhs_done,
    srhs_addr0,
    srhs_write_data,
    srhs_write_en,
    srhs_clk,
    srhs_read_data,
    srhs_done,
    signed_add_addr0,
    signed_add_write_data,
    signed_add_write_en,
    signed_add_clk,
    signed_add_read_data,
    signed_add_done,
    signed_sub_addr0,
    signed_sub_write_data,
    signed_sub_write_en,
    signed_sub_clk,
    signed_sub_read_data,
    signed_sub_done,
    signed_mul_addr0,
    signed_mul_write_data,
    signed_mul_write_en,
    signed_mul_clk,
    signed_mul_read_data,
    signed_mul_done,
    signed_div_addr0,
    signed_div_write_data,
    signed_div_write_en,
    signed_div_clk,
    signed_div_read_data,
    signed_div_done,
    signed_mod_addr0,
    signed_mod_write_data,
    signed_mod_write_en,
    signed_mod_clk,
    signed_mod_read_data,
    signed_mod_done,
    lhs_addr0,
    lhs_write_data,
    lhs_write_en,
    lhs_clk,
    lhs_read_data,
    lhs_done,
    rhs_addr0,
    rhs_write_data,
    rhs_write_en,
    rhs_clk,
    rhs_read_data,
    rhs_done,
    unsigned_add_addr0,
    unsigned_add_write_data,
    unsigned_add_write_en,
    unsigned_add_clk,
    unsigned_add_read_data,
    unsigned_add_done,
    unsigned_sub_addr0,
    unsigned_sub_write_data,
    unsigned_sub_write_en,
    unsigned_sub_clk,
    unsigned_sub_read_data,
    unsigned_sub_done,
    unsigned_mul_addr0,
    unsigned_mul_write_data,
    unsigned_mul_write_en,
    unsigned_mul_clk,
    unsigned_mul_read_data,
    unsigned_mul_done,
    unsigned_div_addr0,
    unsigned_div_write_data,
    unsigned_div_write_en,
    unsigned_div_clk,
    unsigned_div_read_data,
    unsigned_div_done,
    unsigned_mod_addr0,
    unsigned_mod_write_data,
    unsigned_mod_write_en,
    unsigned_mod_clk,
    unsigned_mod_read_data,
    unsigned_mod_done);
  input go;
  input clk;
  input reset;
  output done;
  output slhs_addr0;
  output [3:0]slhs_write_data;
  output slhs_write_en;
  output slhs_clk;
  input [3:0]slhs_read_data;
  input slhs_done;
  output srhs_addr0;
  output [3:0]srhs_write_data;
  output srhs_write_en;
  output srhs_clk;
  input [3:0]srhs_read_data;
  input srhs_done;
  output signed_add_addr0;
  output [3:0]signed_add_write_data;
  output signed_add_write_en;
  output signed_add_clk;
  input [3:0]signed_add_read_data;
  input signed_add_done;
  output signed_sub_addr0;
  output [3:0]signed_sub_write_data;
  output signed_sub_write_en;
  output signed_sub_clk;
  input [3:0]signed_sub_read_data;
  input signed_sub_done;
  output signed_mul_addr0;
  output [3:0]signed_mul_write_data;
  output signed_mul_write_en;
  output signed_mul_clk;
  input [3:0]signed_mul_read_data;
  input signed_mul_done;
  output signed_div_addr0;
  output [3:0]signed_div_write_data;
  output signed_div_write_en;
  output signed_div_clk;
  input [3:0]signed_div_read_data;
  input signed_div_done;
  output signed_mod_addr0;
  output [3:0]signed_mod_write_data;
  output signed_mod_write_en;
  output signed_mod_clk;
  input [3:0]signed_mod_read_data;
  input signed_mod_done;
  output lhs_addr0;
  output [31:0]lhs_write_data;
  output lhs_write_en;
  output lhs_clk;
  input [31:0]lhs_read_data;
  input lhs_done;
  output rhs_addr0;
  output [31:0]rhs_write_data;
  output rhs_write_en;
  output rhs_clk;
  input [31:0]rhs_read_data;
  input rhs_done;
  output unsigned_add_addr0;
  output [31:0]unsigned_add_write_data;
  output unsigned_add_write_en;
  output unsigned_add_clk;
  input [31:0]unsigned_add_read_data;
  input unsigned_add_done;
  output unsigned_sub_addr0;
  output [31:0]unsigned_sub_write_data;
  output unsigned_sub_write_en;
  output unsigned_sub_clk;
  input [31:0]unsigned_sub_read_data;
  input unsigned_sub_done;
  output unsigned_mul_addr0;
  output [31:0]unsigned_mul_write_data;
  output unsigned_mul_write_en;
  output unsigned_mul_clk;
  input [31:0]unsigned_mul_read_data;
  input unsigned_mul_done;
  output unsigned_div_addr0;
  output [31:0]unsigned_div_write_data;
  output unsigned_div_write_en;
  output unsigned_div_clk;
  input [31:0]unsigned_div_read_data;
  input unsigned_div_done;
  output unsigned_mod_addr0;
  output [31:0]unsigned_mod_write_data;
  output unsigned_mod_write_en;
  output unsigned_mod_clk;
  input [31:0]unsigned_mod_read_data;
  input unsigned_mod_done;

  wire \<const0> ;
  wire [3:0]A;
  wire [3:0]B;
  wire [31:0]add_left;
  wire [31:0]add_out;
  wire [31:0]add_right;
  wire clk;
  wire \comp/done0 ;
  wire \comp/finished ;
  wire [31:16]\comp/out_tmp_reg ;
  wire \comp/p_0_in ;
  wire div_n_10;
  wire div_n_11;
  wire div_n_12;
  wire div_n_13;
  wire div_n_14;
  wire div_n_15;
  wire div_n_16;
  wire div_n_17;
  wire div_n_18;
  wire div_n_19;
  wire div_n_20;
  wire div_n_21;
  wire div_n_22;
  wire div_n_23;
  wire div_n_24;
  wire div_n_25;
  wire div_n_26;
  wire div_n_27;
  wire div_n_28;
  wire div_n_29;
  wire div_n_3;
  wire div_n_30;
  wire div_n_31;
  wire div_n_32;
  wire div_n_33;
  wire div_n_34;
  wire div_n_35;
  wire div_n_36;
  wire div_n_37;
  wire div_n_38;
  wire div_n_39;
  wire div_n_4;
  wire div_n_40;
  wire div_n_41;
  wire div_n_42;
  wire div_n_43;
  wire div_n_44;
  wire div_n_45;
  wire div_n_46;
  wire div_n_47;
  wire div_n_48;
  wire div_n_49;
  wire div_n_5;
  wire div_n_50;
  wire div_n_51;
  wire div_n_52;
  wire div_n_53;
  wire div_n_54;
  wire div_n_55;
  wire div_n_56;
  wire div_n_57;
  wire div_n_58;
  wire div_n_59;
  wire div_n_6;
  wire div_n_60;
  wire div_n_61;
  wire div_n_62;
  wire div_n_63;
  wire div_n_64;
  wire div_n_65;
  wire div_n_66;
  wire div_n_67;
  wire div_n_68;
  wire div_n_69;
  wire div_n_7;
  wire div_n_70;
  wire div_n_8;
  wire div_n_9;
  wire dividend_is_zero__31;
  wire do_signed_div_mod_go_in;
  wire do_signed_mul_go_in;
  wire do_unsigned_div_mod_done_in;
  wire do_unsigned_div_mod_go_in;
  wire do_unsigned_mul_go_in;
  wire done;
  wire fsm_n_1;
  wire fsm_n_10;
  wire fsm_n_2;
  wire fsm_n_5;
  wire fsm_n_9;
  wire fsm_n_97;
  wire go;
  wire [2:1]left_abs__2;
  wire [31:0]lhs_read_data;
  wire mul_done;
  wire mul_go;
  wire mul_n_17;
  wire mul_n_18;
  wire mul_n_19;
  wire mul_n_20;
  wire mul_n_21;
  wire mul_n_22;
  wire mul_n_23;
  wire mul_n_24;
  wire mul_n_25;
  wire mul_n_26;
  wire mul_n_27;
  wire mul_n_28;
  wire mul_n_29;
  wire mul_n_30;
  wire mul_n_31;
  wire mul_n_32;
  wire out_quotient0;
  wire p_0_in;
  wire reset;
  wire [31:0]rhs_read_data;
  wire sdiv_done;
  wire sdiv_go;
  wire sdiv_n_11;
  wire sdiv_n_13;
  wire signed_add_done;
  wire [3:0]signed_add_write_data;
  wire signed_add_write_en;
  wire signed_div_done;
  wire [3:0]signed_div_write_data;
  wire signed_div_write_en;
  wire signed_mod_done;
  wire [3:0]signed_mod_write_data;
  wire signed_mul_done;
  wire [3:0]signed_mul_write_data;
  wire signed_mul_write_en;
  wire signed_sub_done;
  wire [3:0]signed_sub_write_data;
  wire signed_sub_write_en;
  wire [3:0]slhs_read_data;
  wire smul_done;
  wire smul_go;
  wire [3:0]srhs_read_data;
  wire [31:0]sub_left;
  wire [31:0]sub_out;
  wire [31:0]sub_right;
  wire unsigned_add_done;
  wire [31:0]unsigned_add_write_data;
  wire unsigned_add_write_en;
  wire unsigned_div_done;
  wire [31:0]unsigned_div_write_data;
  wire unsigned_div_write_en;
  wire unsigned_mod_done;
  wire [31:0]unsigned_mod_write_data;
  wire unsigned_mul_done;
  wire [31:0]unsigned_mul_write_data;
  wire unsigned_mul_write_en;
  wire unsigned_sub_done;
  wire [31:0]unsigned_sub_write_data;
  wire unsigned_sub_write_en;

  assign lhs_addr0 = \<const0> ;
  assign lhs_clk = clk;
  assign lhs_write_data[31] = \<const0> ;
  assign lhs_write_data[30] = \<const0> ;
  assign lhs_write_data[29] = \<const0> ;
  assign lhs_write_data[28] = \<const0> ;
  assign lhs_write_data[27] = \<const0> ;
  assign lhs_write_data[26] = \<const0> ;
  assign lhs_write_data[25] = \<const0> ;
  assign lhs_write_data[24] = \<const0> ;
  assign lhs_write_data[23] = \<const0> ;
  assign lhs_write_data[22] = \<const0> ;
  assign lhs_write_data[21] = \<const0> ;
  assign lhs_write_data[20] = \<const0> ;
  assign lhs_write_data[19] = \<const0> ;
  assign lhs_write_data[18] = \<const0> ;
  assign lhs_write_data[17] = \<const0> ;
  assign lhs_write_data[16] = \<const0> ;
  assign lhs_write_data[15] = \<const0> ;
  assign lhs_write_data[14] = \<const0> ;
  assign lhs_write_data[13] = \<const0> ;
  assign lhs_write_data[12] = \<const0> ;
  assign lhs_write_data[11] = \<const0> ;
  assign lhs_write_data[10] = \<const0> ;
  assign lhs_write_data[9] = \<const0> ;
  assign lhs_write_data[8] = \<const0> ;
  assign lhs_write_data[7] = \<const0> ;
  assign lhs_write_data[6] = \<const0> ;
  assign lhs_write_data[5] = \<const0> ;
  assign lhs_write_data[4] = \<const0> ;
  assign lhs_write_data[3] = \<const0> ;
  assign lhs_write_data[2] = \<const0> ;
  assign lhs_write_data[1] = \<const0> ;
  assign lhs_write_data[0] = \<const0> ;
  assign lhs_write_en = \<const0> ;
  assign rhs_addr0 = \<const0> ;
  assign rhs_clk = clk;
  assign rhs_write_data[31] = \<const0> ;
  assign rhs_write_data[30] = \<const0> ;
  assign rhs_write_data[29] = \<const0> ;
  assign rhs_write_data[28] = \<const0> ;
  assign rhs_write_data[27] = \<const0> ;
  assign rhs_write_data[26] = \<const0> ;
  assign rhs_write_data[25] = \<const0> ;
  assign rhs_write_data[24] = \<const0> ;
  assign rhs_write_data[23] = \<const0> ;
  assign rhs_write_data[22] = \<const0> ;
  assign rhs_write_data[21] = \<const0> ;
  assign rhs_write_data[20] = \<const0> ;
  assign rhs_write_data[19] = \<const0> ;
  assign rhs_write_data[18] = \<const0> ;
  assign rhs_write_data[17] = \<const0> ;
  assign rhs_write_data[16] = \<const0> ;
  assign rhs_write_data[15] = \<const0> ;
  assign rhs_write_data[14] = \<const0> ;
  assign rhs_write_data[13] = \<const0> ;
  assign rhs_write_data[12] = \<const0> ;
  assign rhs_write_data[11] = \<const0> ;
  assign rhs_write_data[10] = \<const0> ;
  assign rhs_write_data[9] = \<const0> ;
  assign rhs_write_data[8] = \<const0> ;
  assign rhs_write_data[7] = \<const0> ;
  assign rhs_write_data[6] = \<const0> ;
  assign rhs_write_data[5] = \<const0> ;
  assign rhs_write_data[4] = \<const0> ;
  assign rhs_write_data[3] = \<const0> ;
  assign rhs_write_data[2] = \<const0> ;
  assign rhs_write_data[1] = \<const0> ;
  assign rhs_write_data[0] = \<const0> ;
  assign rhs_write_en = \<const0> ;
  assign signed_add_addr0 = \<const0> ;
  assign signed_add_clk = clk;
  assign signed_div_addr0 = \<const0> ;
  assign signed_div_clk = clk;
  assign signed_mod_addr0 = \<const0> ;
  assign signed_mod_clk = clk;
  assign signed_mod_write_en = signed_div_write_en;
  assign signed_mul_addr0 = \<const0> ;
  assign signed_mul_clk = clk;
  assign signed_sub_addr0 = \<const0> ;
  assign signed_sub_clk = clk;
  assign slhs_addr0 = \<const0> ;
  assign slhs_clk = clk;
  assign slhs_write_data[3] = \<const0> ;
  assign slhs_write_data[2] = \<const0> ;
  assign slhs_write_data[1] = \<const0> ;
  assign slhs_write_data[0] = \<const0> ;
  assign slhs_write_en = \<const0> ;
  assign srhs_addr0 = \<const0> ;
  assign srhs_clk = clk;
  assign srhs_write_data[3] = \<const0> ;
  assign srhs_write_data[2] = \<const0> ;
  assign srhs_write_data[1] = \<const0> ;
  assign srhs_write_data[0] = \<const0> ;
  assign srhs_write_en = \<const0> ;
  assign unsigned_add_addr0 = \<const0> ;
  assign unsigned_add_clk = clk;
  assign unsigned_div_addr0 = \<const0> ;
  assign unsigned_div_clk = clk;
  assign unsigned_mod_addr0 = \<const0> ;
  assign unsigned_mod_clk = clk;
  assign unsigned_mod_write_en = unsigned_div_write_en;
  assign unsigned_mul_addr0 = \<const0> ;
  assign unsigned_mul_clk = clk;
  assign unsigned_sub_addr0 = \<const0> ;
  assign unsigned_sub_clk = clk;
  GND GND
       (.G(\<const0> ));
  std_add add
       (.a(add_left),
        .b(add_right),
        .out0(add_out));
  std_div_pipe__parameterized0 div
       (.D(fsm_n_97),
        .Q({div_n_7,div_n_8,div_n_9,div_n_10,div_n_11,div_n_12,div_n_13,div_n_14,div_n_15,div_n_16,div_n_17,div_n_18,div_n_19,div_n_20,div_n_21,div_n_22,div_n_23,div_n_24,div_n_25,div_n_26,div_n_27,div_n_28,div_n_29,div_n_30,div_n_31,div_n_32,div_n_33,div_n_34,div_n_35,div_n_36,div_n_37,div_n_38}),
        .SR(out_quotient0),
        .clk(clk),
        .dividend_is_zero__31(dividend_is_zero__31),
        .do_unsigned_div_mod_done_in(do_unsigned_div_mod_done_in),
        .do_unsigned_div_mod_go_in(do_unsigned_div_mod_go_in),
        .lhs_read_data(lhs_read_data),
        .lhs_read_data_11_sp_1(div_n_3),
        .lhs_read_data_15_sp_1(div_n_4),
        .lhs_read_data_1_sp_1(div_n_6),
        .lhs_read_data_7_sp_1(div_n_5),
        .\out_remainder_reg[31]_0 ({div_n_39,div_n_40,div_n_41,div_n_42,div_n_43,div_n_44,div_n_45,div_n_46,div_n_47,div_n_48,div_n_49,div_n_50,div_n_51,div_n_52,div_n_53,div_n_54,div_n_55,div_n_56,div_n_57,div_n_58,div_n_59,div_n_60,div_n_61,div_n_62,div_n_63,div_n_64,div_n_65,div_n_66,div_n_67,div_n_68,div_n_69,div_n_70}),
        .p_0_in(p_0_in),
        .\quotient_msk_reg[31]_0 (fsm_n_1),
        .reset(reset),
        .rhs_read_data(rhs_read_data[30:0]),
        .unsigned_div_done(unsigned_div_done),
        .unsigned_div_write_en(unsigned_div_write_en),
        .unsigned_mod_done(unsigned_mod_done));
  std_reg fsm
       (.D(fsm_n_2),
        .E(sdiv_go),
        .Q(sdiv_n_13),
        .SR(\comp/p_0_in ),
        .a(sub_left),
        .b(sub_right),
        .clk(clk),
        .dividend_is_zero__31(dividend_is_zero__31),
        .do_signed_div_mod_go_in(do_signed_div_mod_go_in),
        .do_signed_mul_go_in(do_signed_mul_go_in),
        .do_unsigned_div_mod_done_in(do_unsigned_div_mod_done_in),
        .do_unsigned_div_mod_go_in(do_unsigned_div_mod_go_in),
        .do_unsigned_mul_go_in(do_unsigned_mul_go_in),
        .done(done),
        .done0(\comp/done0 ),
        .\done_buf_reg[2] (A),
        .\done_buf_reg[2]_0 (B),
        .\done_buf_reg[2]_1 (smul_go),
        .\done_buf_reg[2]_2 (mul_go),
        .done_i_2__0_0(div_n_4),
        .done_i_2__0_1(div_n_3),
        .done_i_2__0_2(div_n_6),
        .done_i_2__0_3(div_n_5),
        .done_reg(\comp/finished ),
        .go(go),
        .go_0(signed_sub_write_en),
        .left_abs__2(left_abs__2),
        .lhs_read_data(lhs_read_data),
        .\lhs_read_data[31] (add_left),
        .mul_done(mul_done),
        .out0(sub_out),
        .\out_reg[0]_0 (signed_add_write_en),
        .\out_reg[0]_1 (unsigned_add_write_en),
        .\out_reg[1]_0 (fsm_n_1),
        .\out_reg[3]_0 (unsigned_sub_write_en),
        .out_tmp_reg(\comp/out_tmp_reg ),
        .p_0_in(p_0_in),
        .reset(reset),
        .reset_0(fsm_n_5),
        .rhs_read_data(rhs_read_data),
        .\rhs_read_data[31] (fsm_n_97),
        .\rhs_read_data[31]_0 (add_right),
        .running_reg(out_quotient0),
        .running_reg_0(sdiv_n_11),
        .sdiv_done(sdiv_done),
        .signed_add_done(signed_add_done),
        .signed_add_write_data(signed_add_write_data),
        .signed_div_done(signed_div_done),
        .signed_mod_done(signed_mod_done),
        .signed_mul_done(signed_mul_done),
        .signed_mul_write_en(signed_mul_write_en),
        .signed_sub_done(signed_sub_done),
        .signed_sub_write_data(signed_sub_write_data),
        .slhs_read_data(slhs_read_data),
        .slhs_read_data_1_sp_1(fsm_n_10),
        .slhs_read_data_2_sp_1(fsm_n_9),
        .smul_done(smul_done),
        .srhs_read_data(srhs_read_data),
        .unsigned_add_done(unsigned_add_done),
        .unsigned_add_write_data(unsigned_add_write_data),
        .\unsigned_add_write_data[31] (add_out),
        .unsigned_div_done(unsigned_div_done),
        .unsigned_div_write_data(unsigned_div_write_data),
        .\unsigned_div_write_data[31] ({div_n_7,div_n_8,div_n_9,div_n_10,div_n_11,div_n_12,div_n_13,div_n_14,div_n_15,div_n_16,div_n_17,div_n_18,div_n_19,div_n_20,div_n_21,div_n_22,div_n_23,div_n_24,div_n_25,div_n_26,div_n_27,div_n_28,div_n_29,div_n_30,div_n_31,div_n_32,div_n_33,div_n_34,div_n_35,div_n_36,div_n_37,div_n_38}),
        .unsigned_mod_done(unsigned_mod_done),
        .unsigned_mod_write_data(unsigned_mod_write_data),
        .\unsigned_mod_write_data[31] ({div_n_39,div_n_40,div_n_41,div_n_42,div_n_43,div_n_44,div_n_45,div_n_46,div_n_47,div_n_48,div_n_49,div_n_50,div_n_51,div_n_52,div_n_53,div_n_54,div_n_55,div_n_56,div_n_57,div_n_58,div_n_59,div_n_60,div_n_61,div_n_62,div_n_63,div_n_64,div_n_65,div_n_66,div_n_67,div_n_68,div_n_69,div_n_70}),
        .unsigned_mul_done(unsigned_mul_done),
        .unsigned_mul_write_data(unsigned_mul_write_data),
        .\unsigned_mul_write_data[15] ({mul_n_17,mul_n_18,mul_n_19,mul_n_20,mul_n_21,mul_n_22,mul_n_23,mul_n_24,mul_n_25,mul_n_26,mul_n_27,mul_n_28,mul_n_29,mul_n_30,mul_n_31,mul_n_32}),
        .unsigned_mul_write_en(unsigned_mul_write_en),
        .unsigned_sub_done(unsigned_sub_done),
        .unsigned_sub_write_data(unsigned_sub_write_data));
  std_mult_pipe mul
       (.E(mul_go),
        .Q({mul_n_17,mul_n_18,mul_n_19,mul_n_20,mul_n_21,mul_n_22,mul_n_23,mul_n_24,mul_n_25,mul_n_26,mul_n_27,mul_n_28,mul_n_29,mul_n_30,mul_n_31,mul_n_32}),
        .clk(clk),
        .do_unsigned_mul_go_in(do_unsigned_mul_go_in),
        .lhs_read_data(lhs_read_data),
        .mul_done(mul_done),
        .out_tmp_reg(\comp/out_tmp_reg ),
        .reset(reset),
        .rhs_read_data(rhs_read_data));
  std_sdiv_pipe sdiv
       (.D(fsm_n_2),
        .E(sdiv_go),
        .Q(sdiv_n_13),
        .SR(\comp/p_0_in ),
        .clk(clk),
        .\dividend_reg[3] (fsm_n_10),
        .\dividend_reg[3]_0 (fsm_n_9),
        .do_signed_div_mod_go_in(do_signed_div_mod_go_in),
        .done0(\comp/done0 ),
        .left_abs__2(left_abs__2),
        .\quotient_msk_reg[0] (\comp/finished ),
        .reset(reset),
        .reset_0(sdiv_n_11),
        .running_reg(fsm_n_5),
        .sdiv_done(sdiv_done),
        .signed_div_write_data(signed_div_write_data),
        .signed_div_write_en(signed_div_write_en),
        .signed_mod_write_data(signed_mod_write_data),
        .slhs_read_data({slhs_read_data[3],slhs_read_data[0]}),
        .srhs_read_data(srhs_read_data));
  std_smult_pipe smul
       (.D(B),
        .E(smul_go),
        .clk(clk),
        .do_signed_mul_go_in(do_signed_mul_go_in),
        .\ltmp_reg[3] (A),
        .reset(reset),
        .signed_mul_write_data(signed_mul_write_data),
        .smul_done(smul_done));
  std_sub sub
       (.a(sub_left),
        .b(sub_right),
        .out0(sub_out));
endmodule

module std_add
   (out0,
    a,
    b);
  output [31:0]out0;
  input [31:0]a;
  input [31:0]b;

  wire [31:0]a;
  wire [31:0]b;
  wire [31:0]out0;

  lakeroad_xilinx_ultrascale_plus_add32_2 _impl
       (.a(a),
        .b(b),
        .out0(out0));
endmodule

module std_div_pipe
   (done_reg_0,
    signed_mod_write_data,
    signed_div_write_data,
    SS,
    signed_div_write_en,
    reset_0,
    E,
    \divisor_reg[6]_0 ,
    done0,
    clk,
    running_reg_0,
    Q,
    do_signed_div_mod_go_in,
    right_sign,
    left_sign,
    different_signs__0,
    srhs_read_data,
    \dividend_reg[3]_0 ,
    \dividend_reg[3]_1 ,
    left_abs__2,
    slhs_read_data,
    reset,
    D);
  output done_reg_0;
  output [3:0]signed_mod_write_data;
  output [3:0]signed_div_write_data;
  output [0:0]SS;
  output signed_div_write_en;
  output reset_0;
  output [0:0]E;
  output [0:0]\divisor_reg[6]_0 ;
  input done0;
  input clk;
  input running_reg_0;
  input [3:0]Q;
  input do_signed_div_mod_go_in;
  input right_sign;
  input left_sign;
  input different_signs__0;
  input [3:0]srhs_read_data;
  input \dividend_reg[3]_0 ;
  input \dividend_reg[3]_1 ;
  input [1:0]left_abs__2;
  input [0:0]slhs_read_data;
  input reset;
  input [0:0]D;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SS;
  wire clk;
  wire [3:0]comp_out_q;
  wire [3:0]comp_out_r;
  wire different_signs__0;
  wire \dividend[0]_i_1_n_0 ;
  wire \dividend[1]_i_1_n_0 ;
  wire \dividend[2]_i_1_n_0 ;
  wire \dividend[2]_i_2_n_0 ;
  wire \dividend[3]_i_1_n_0 ;
  wire \dividend[3]_i_2_n_0 ;
  wire \dividend[3]_i_3_n_0 ;
  wire \dividend_reg[3]_0 ;
  wire \dividend_reg[3]_1 ;
  wire \dividend_reg_n_0_[0] ;
  wire \dividend_reg_n_0_[1] ;
  wire \dividend_reg_n_0_[2] ;
  wire \dividend_reg_n_0_[3] ;
  wire divisor;
  wire \divisor[0]_i_1_n_0 ;
  wire \divisor[1]_i_1_n_0 ;
  wire \divisor[2]_i_1_n_0 ;
  wire \divisor[3]_i_1_n_0 ;
  wire \divisor[4]_i_1_n_0 ;
  wire \divisor[6]_i_2_n_0 ;
  wire [0:0]\divisor_reg[6]_0 ;
  wire \divisor_reg_n_0_[0] ;
  wire \divisor_reg_n_0_[1] ;
  wire \divisor_reg_n_0_[2] ;
  wire \divisor_reg_n_0_[3] ;
  wire \divisor_reg_n_0_[4] ;
  wire \divisor_reg_n_0_[5] ;
  wire do_signed_div_mod_go_in;
  wire done0;
  wire done_reg_0;
  wire [1:0]left_abs__2;
  wire left_sign;
  wire [2:1]out_rem_intermediate__3;
  wire [3:0]quotient;
  wire \quotient[0]_i_1_n_0 ;
  wire \quotient[1]_i_1_n_0 ;
  wire \quotient[2]_i_1_n_0 ;
  wire \quotient[3]_i_1_n_0 ;
  wire \quotient[3]_i_2_n_0 ;
  wire [3:0]quotient_msk;
  wire reset;
  wire reset_0;
  wire right_sign;
  wire running;
  wire running_reg_0;
  wire [3:0]signed_div_write_data;
  wire signed_div_write_en;
  wire [3:0]signed_mod_write_data;
  wire \signed_mod_write_data[2]_INST_0_i_2_n_0 ;
  wire \signed_mod_write_data[3]_INST_0_i_1_n_0 ;
  wire \signed_mod_write_data[3]_INST_0_i_2_n_0 ;
  wire \signed_mod_write_data[3]_INST_0_i_3_n_0 ;
  wire \signed_mod_write_data[3]_INST_0_i_4_n_0 ;
  wire [0:0]slhs_read_data;
  wire [3:0]srhs_read_data;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT6 #(
    .INIT(64'h666666666666F066)) 
    \dividend[0]_i_1 
       (.I0(\divisor_reg_n_0_[0] ),
        .I1(\dividend_reg_n_0_[0] ),
        .I2(slhs_read_data),
        .I3(do_signed_div_mod_go_in),
        .I4(running),
        .I5(done_reg_0),
        .O(\dividend[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF696600006966)) 
    \dividend[1]_i_1 
       (.I0(\dividend_reg_n_0_[1] ),
        .I1(\divisor_reg_n_0_[1] ),
        .I2(\dividend_reg_n_0_[0] ),
        .I3(\divisor_reg_n_0_[0] ),
        .I4(SS),
        .I5(left_abs__2[0]),
        .O(\dividend[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF690069)) 
    \dividend[2]_i_1 
       (.I0(\dividend_reg_n_0_[2] ),
        .I1(\divisor_reg_n_0_[2] ),
        .I2(\dividend[2]_i_2_n_0 ),
        .I3(SS),
        .I4(left_abs__2[1]),
        .O(\dividend[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hB0FB)) 
    \dividend[2]_i_2 
       (.I0(\dividend_reg_n_0_[0] ),
        .I1(\divisor_reg_n_0_[0] ),
        .I2(\dividend_reg_n_0_[1] ),
        .I3(\divisor_reg_n_0_[1] ),
        .O(\dividend[2]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \dividend[3]_i_1 
       (.I0(SS),
        .I1(\quotient[3]_i_1_n_0 ),
        .O(\dividend[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF00000069696969)) 
    \dividend[3]_i_2 
       (.I0(\dividend_reg_n_0_[3] ),
        .I1(\divisor_reg_n_0_[3] ),
        .I2(\dividend[3]_i_3_n_0 ),
        .I3(\dividend_reg[3]_0 ),
        .I4(\dividend_reg[3]_1 ),
        .I5(SS),
        .O(\dividend[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB0FB0000FFFFB0FB)) 
    \dividend[3]_i_3 
       (.I0(\dividend_reg_n_0_[0] ),
        .I1(\divisor_reg_n_0_[0] ),
        .I2(\dividend_reg_n_0_[1] ),
        .I3(\divisor_reg_n_0_[1] ),
        .I4(\dividend_reg_n_0_[2] ),
        .I5(\divisor_reg_n_0_[2] ),
        .O(\dividend[3]_i_3_n_0 ));
  FDRE \dividend_reg[0] 
       (.C(clk),
        .CE(\dividend[3]_i_1_n_0 ),
        .D(\dividend[0]_i_1_n_0 ),
        .Q(\dividend_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE \dividend_reg[1] 
       (.C(clk),
        .CE(\dividend[3]_i_1_n_0 ),
        .D(\dividend[1]_i_1_n_0 ),
        .Q(\dividend_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE \dividend_reg[2] 
       (.C(clk),
        .CE(\dividend[3]_i_1_n_0 ),
        .D(\dividend[2]_i_1_n_0 ),
        .Q(\dividend_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE \dividend_reg[3] 
       (.C(clk),
        .CE(\dividend[3]_i_1_n_0 ),
        .D(\dividend[3]_i_2_n_0 ),
        .Q(\dividend_reg_n_0_[3] ),
        .R(\<const0> ));
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[0]_i_1 
       (.I0(\divisor_reg_n_0_[1] ),
        .I1(SS),
        .O(\divisor[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair234" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[1]_i_1 
       (.I0(\divisor_reg_n_0_[2] ),
        .I1(SS),
        .O(\divisor[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair234" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[2]_i_1 
       (.I0(\divisor_reg_n_0_[3] ),
        .I1(SS),
        .O(\divisor[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair231" *) 
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \divisor[3]_i_1 
       (.I0(srhs_read_data[0]),
        .I1(running),
        .I2(done_reg_0),
        .I3(do_signed_div_mod_go_in),
        .I4(\divisor_reg_n_0_[4] ),
        .O(\divisor[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h48C0FFFF48C00000)) 
    \divisor[4]_i_1 
       (.I0(srhs_read_data[3]),
        .I1(do_signed_div_mod_go_in),
        .I2(srhs_read_data[1]),
        .I3(srhs_read_data[0]),
        .I4(SS),
        .I5(\divisor_reg_n_0_[5] ),
        .O(\divisor[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \divisor[6]_i_1 
       (.I0(running),
        .I1(quotient_msk[3]),
        .I2(quotient_msk[2]),
        .I3(quotient_msk[1]),
        .I4(quotient_msk[0]),
        .I5(SS),
        .O(divisor));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \divisor[6]_i_2 
       (.I0(srhs_read_data[3]),
        .I1(srhs_read_data[2]),
        .I2(SS),
        .I3(srhs_read_data[0]),
        .I4(do_signed_div_mod_go_in),
        .I5(srhs_read_data[1]),
        .O(\divisor[6]_i_2_n_0 ));
  FDRE \divisor_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[0]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[0] ),
        .R(divisor));
  FDRE \divisor_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[1]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[1] ),
        .R(divisor));
  FDRE \divisor_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[2]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[2] ),
        .R(divisor));
  FDRE \divisor_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[3]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[3] ),
        .R(divisor));
  FDRE \divisor_reg[4] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[4]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[4] ),
        .R(divisor));
  FDRE \divisor_reg[5] 
       (.C(clk),
        .CE(\<const1> ),
        .D(D),
        .Q(\divisor_reg_n_0_[5] ),
        .R(divisor));
  FDRE \divisor_reg[6] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[6]_i_2_n_0 ),
        .Q(\divisor_reg[6]_0 ),
        .R(divisor));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(done0),
        .Q(done_reg_0),
        .R(\<const0> ));
  FDRE \out_quotient_reg[0] 
       (.C(clk),
        .CE(E),
        .D(quotient[0]),
        .Q(comp_out_q[0]),
        .R(SS));
  FDRE \out_quotient_reg[1] 
       (.C(clk),
        .CE(E),
        .D(quotient[1]),
        .Q(comp_out_q[1]),
        .R(SS));
  FDRE \out_quotient_reg[2] 
       (.C(clk),
        .CE(E),
        .D(quotient[2]),
        .Q(comp_out_q[2]),
        .R(SS));
  FDRE \out_quotient_reg[3] 
       (.C(clk),
        .CE(E),
        .D(quotient[3]),
        .Q(comp_out_q[3]),
        .R(SS));
  LUT5 #(
    .INIT(32'h00010000)) 
    \out_remainder[3]_i_1 
       (.I0(quotient_msk[0]),
        .I1(quotient_msk[1]),
        .I2(quotient_msk[2]),
        .I3(quotient_msk[3]),
        .I4(running),
        .O(E));
  FDRE \out_remainder_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\dividend_reg_n_0_[0] ),
        .Q(comp_out_r[0]),
        .R(SS));
  FDRE \out_remainder_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\dividend_reg_n_0_[1] ),
        .Q(comp_out_r[1]),
        .R(SS));
  FDRE \out_remainder_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\dividend_reg_n_0_[2] ),
        .Q(comp_out_r[2]),
        .R(SS));
  FDRE \out_remainder_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\dividend_reg_n_0_[3] ),
        .Q(comp_out_r[3]),
        .R(SS));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[0]_i_1 
       (.I0(quotient[0]),
        .I1(quotient_msk[0]),
        .O(\quotient[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[1]_i_1 
       (.I0(quotient[1]),
        .I1(quotient_msk[1]),
        .O(\quotient[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[2]_i_1 
       (.I0(quotient[2]),
        .I1(quotient_msk[2]),
        .O(\quotient[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0100000001010100)) 
    \quotient[3]_i_1 
       (.I0(\divisor_reg_n_0_[4] ),
        .I1(\divisor_reg_n_0_[5] ),
        .I2(\divisor_reg[6]_0 ),
        .I3(\dividend[3]_i_3_n_0 ),
        .I4(\dividend_reg_n_0_[3] ),
        .I5(\divisor_reg_n_0_[3] ),
        .O(\quotient[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[3]_i_2 
       (.I0(quotient[3]),
        .I1(quotient_msk[3]),
        .O(\quotient[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \quotient_msk[3]_i_1 
       (.I0(running),
        .I1(done_reg_0),
        .I2(do_signed_div_mod_go_in),
        .O(SS));
  FDRE \quotient_msk_reg[0] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[1]),
        .Q(quotient_msk[0]),
        .R(SS));
  FDRE \quotient_msk_reg[1] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[2]),
        .Q(quotient_msk[1]),
        .R(SS));
  FDRE \quotient_msk_reg[2] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[3]),
        .Q(quotient_msk[2]),
        .R(SS));
  FDSE \quotient_msk_reg[3] 
       (.C(clk),
        .CE(running),
        .D(\<const0> ),
        .Q(quotient_msk[3]),
        .S(SS));
  FDRE \quotient_reg[0] 
       (.C(clk),
        .CE(\quotient[3]_i_1_n_0 ),
        .D(\quotient[0]_i_1_n_0 ),
        .Q(quotient[0]),
        .R(SS));
  FDRE \quotient_reg[1] 
       (.C(clk),
        .CE(\quotient[3]_i_1_n_0 ),
        .D(\quotient[1]_i_1_n_0 ),
        .Q(quotient[1]),
        .R(SS));
  FDRE \quotient_reg[2] 
       (.C(clk),
        .CE(\quotient[3]_i_1_n_0 ),
        .D(\quotient[2]_i_1_n_0 ),
        .Q(quotient[2]),
        .R(SS));
  FDRE \quotient_reg[3] 
       (.C(clk),
        .CE(\quotient[3]_i_1_n_0 ),
        .D(\quotient[3]_i_2_n_0 ),
        .Q(quotient[3]),
        .R(SS));
  LUT5 #(
    .INIT(32'h00005504)) 
    running_i_2
       (.I0(reset),
        .I1(do_signed_div_mod_go_in),
        .I2(done_reg_0),
        .I3(running),
        .I4(E),
        .O(reset_0));
  FDRE running_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(running_reg_0),
        .Q(running),
        .R(\<const0> ));
  LUT2 #(
    .INIT(4'h8)) 
    \signed_div_write_data[0]_INST_0 
       (.I0(comp_out_q[0]),
        .I1(do_signed_div_mod_go_in),
        .O(signed_div_write_data[0]));
  LUT5 #(
    .INIT(32'h96AA0000)) 
    \signed_div_write_data[1]_INST_0 
       (.I0(comp_out_q[1]),
        .I1(left_sign),
        .I2(right_sign),
        .I3(comp_out_q[0]),
        .I4(do_signed_div_mod_go_in),
        .O(signed_div_write_data[1]));
  LUT6 #(
    .INIT(64'hAA5656AA00000000)) 
    \signed_div_write_data[2]_INST_0 
       (.I0(comp_out_q[2]),
        .I1(comp_out_q[1]),
        .I2(comp_out_q[0]),
        .I3(left_sign),
        .I4(right_sign),
        .I5(do_signed_div_mod_go_in),
        .O(signed_div_write_data[2]));
  LUT6 #(
    .INIT(64'h5556AAAA00000000)) 
    \signed_div_write_data[3]_INST_0 
       (.I0(comp_out_q[3]),
        .I1(comp_out_q[2]),
        .I2(comp_out_q[0]),
        .I3(comp_out_q[1]),
        .I4(different_signs__0),
        .I5(do_signed_div_mod_go_in),
        .O(signed_div_write_data[3]));
  LUT4 #(
    .INIT(16'h6A00)) 
    \signed_mod_write_data[0]_INST_0 
       (.I0(comp_out_r[0]),
        .I1(\signed_mod_write_data[3]_INST_0_i_2_n_0 ),
        .I2(Q[0]),
        .I3(do_signed_div_mod_go_in),
        .O(signed_mod_write_data[0]));
  LUT6 #(
    .INIT(64'h9666AAAA00000000)) 
    \signed_mod_write_data[1]_INST_0 
       (.I0(out_rem_intermediate__3[1]),
        .I1(comp_out_r[0]),
        .I2(\signed_mod_write_data[3]_INST_0_i_2_n_0 ),
        .I3(Q[0]),
        .I4(right_sign),
        .I5(do_signed_div_mod_go_in),
        .O(signed_mod_write_data[1]));
  LUT5 #(
    .INIT(32'h6C6CC66C)) 
    \signed_mod_write_data[1]_INST_0_i_1 
       (.I0(\signed_mod_write_data[3]_INST_0_i_2_n_0 ),
        .I1(comp_out_r[1]),
        .I2(Q[1]),
        .I3(comp_out_r[0]),
        .I4(Q[0]),
        .O(out_rem_intermediate__3[1]));
  LUT4 #(
    .INIT(16'h9A00)) 
    \signed_mod_write_data[2]_INST_0 
       (.I0(out_rem_intermediate__3[2]),
        .I1(\signed_mod_write_data[2]_INST_0_i_2_n_0 ),
        .I2(right_sign),
        .I3(do_signed_div_mod_go_in),
        .O(signed_mod_write_data[2]));
  LUT4 #(
    .INIT(16'h78B4)) 
    \signed_mod_write_data[2]_INST_0_i_1 
       (.I0(\signed_mod_write_data[3]_INST_0_i_4_n_0 ),
        .I1(\signed_mod_write_data[3]_INST_0_i_2_n_0 ),
        .I2(comp_out_r[2]),
        .I3(Q[2]),
        .O(out_rem_intermediate__3[2]));
  LUT5 #(
    .INIT(32'h90090033)) 
    \signed_mod_write_data[2]_INST_0_i_2 
       (.I0(Q[0]),
        .I1(comp_out_r[0]),
        .I2(Q[1]),
        .I3(comp_out_r[1]),
        .I4(\signed_mod_write_data[3]_INST_0_i_2_n_0 ),
        .O(\signed_mod_write_data[2]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h78B4874B00000000)) 
    \signed_mod_write_data[3]_INST_0 
       (.I0(\signed_mod_write_data[3]_INST_0_i_1_n_0 ),
        .I1(\signed_mod_write_data[3]_INST_0_i_2_n_0 ),
        .I2(comp_out_r[3]),
        .I3(Q[3]),
        .I4(\signed_mod_write_data[3]_INST_0_i_3_n_0 ),
        .I5(do_signed_div_mod_go_in),
        .O(signed_mod_write_data[3]));
  LUT6 #(
    .INIT(64'hF7FF757751551011)) 
    \signed_mod_write_data[3]_INST_0_i_1 
       (.I0(comp_out_r[2]),
        .I1(comp_out_r[1]),
        .I2(Q[0]),
        .I3(comp_out_r[0]),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(\signed_mod_write_data[3]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6666666666666660)) 
    \signed_mod_write_data[3]_INST_0_i_2 
       (.I0(left_sign),
        .I1(right_sign),
        .I2(comp_out_r[0]),
        .I3(comp_out_r[1]),
        .I4(comp_out_r[2]),
        .I5(comp_out_r[3]),
        .O(\signed_mod_write_data[3]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h874B0000FFFFFFFF)) 
    \signed_mod_write_data[3]_INST_0_i_3 
       (.I0(\signed_mod_write_data[3]_INST_0_i_4_n_0 ),
        .I1(\signed_mod_write_data[3]_INST_0_i_2_n_0 ),
        .I2(comp_out_r[2]),
        .I3(Q[2]),
        .I4(\signed_mod_write_data[2]_INST_0_i_2_n_0 ),
        .I5(right_sign),
        .O(\signed_mod_write_data[3]_INST_0_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hDF45)) 
    \signed_mod_write_data[3]_INST_0_i_4 
       (.I0(comp_out_r[1]),
        .I1(Q[0]),
        .I2(comp_out_r[0]),
        .I3(Q[1]),
        .O(\signed_mod_write_data[3]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair231" *) 
  LUT2 #(
    .INIT(4'h8)) 
    signed_mod_write_en_INST_0
       (.I0(done_reg_0),
        .I1(do_signed_div_mod_go_in),
        .O(signed_div_write_en));
endmodule

(* ORIG_REF_NAME = "std_div_pipe" *) 
module std_div_pipe__parameterized0
   (p_0_in,
    unsigned_div_write_en,
    do_unsigned_div_mod_done_in,
    .lhs_read_data_11_sp_1(lhs_read_data_11_sn_1),
    .lhs_read_data_15_sp_1(lhs_read_data_15_sn_1),
    .lhs_read_data_7_sp_1(lhs_read_data_7_sn_1),
    .lhs_read_data_1_sp_1(lhs_read_data_1_sn_1),
    Q,
    \out_remainder_reg[31]_0 ,
    clk,
    rhs_read_data,
    do_unsigned_div_mod_go_in,
    reset,
    dividend_is_zero__31,
    unsigned_div_done,
    unsigned_mod_done,
    \quotient_msk_reg[31]_0 ,
    lhs_read_data,
    D,
    SR);
  output p_0_in;
  output unsigned_div_write_en;
  output do_unsigned_div_mod_done_in;
  output [31:0]Q;
  output [31:0]\out_remainder_reg[31]_0 ;
  input clk;
  input [30:0]rhs_read_data;
  input do_unsigned_div_mod_go_in;
  input reset;
  input dividend_is_zero__31;
  input unsigned_div_done;
  input unsigned_mod_done;
  input \quotient_msk_reg[31]_0 ;
  input [31:0]lhs_read_data;
  input [0:0]D;
  input [0:0]SR;
  output lhs_read_data_11_sn_1;
  output lhs_read_data_15_sn_1;
  output lhs_read_data_7_sn_1;
  output lhs_read_data_1_sn_1;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]D;
  wire GND_2;
  wire [31:0]Q;
  wire [0:0]SR;
  wire clk;
  wire div_done;
  wire [31:0]dividend;
  wire \dividend[15]_i_10_n_0 ;
  wire \dividend[15]_i_11_n_0 ;
  wire \dividend[15]_i_12_n_0 ;
  wire \dividend[15]_i_13_n_0 ;
  wire \dividend[15]_i_14_n_0 ;
  wire \dividend[15]_i_15_n_0 ;
  wire \dividend[15]_i_16_n_0 ;
  wire \dividend[15]_i_17_n_0 ;
  wire \dividend[15]_i_2_n_0 ;
  wire \dividend[15]_i_3_n_0 ;
  wire \dividend[15]_i_4_n_0 ;
  wire \dividend[15]_i_5_n_0 ;
  wire \dividend[15]_i_6_n_0 ;
  wire \dividend[15]_i_7_n_0 ;
  wire \dividend[15]_i_8_n_0 ;
  wire \dividend[15]_i_9_n_0 ;
  wire \dividend[23]_i_10_n_0 ;
  wire \dividend[23]_i_11_n_0 ;
  wire \dividend[23]_i_12_n_0 ;
  wire \dividend[23]_i_13_n_0 ;
  wire \dividend[23]_i_14_n_0 ;
  wire \dividend[23]_i_15_n_0 ;
  wire \dividend[23]_i_16_n_0 ;
  wire \dividend[23]_i_17_n_0 ;
  wire \dividend[23]_i_2_n_0 ;
  wire \dividend[23]_i_3_n_0 ;
  wire \dividend[23]_i_4_n_0 ;
  wire \dividend[23]_i_5_n_0 ;
  wire \dividend[23]_i_6_n_0 ;
  wire \dividend[23]_i_7_n_0 ;
  wire \dividend[23]_i_8_n_0 ;
  wire \dividend[23]_i_9_n_0 ;
  wire \dividend[31]_i_10_n_0 ;
  wire \dividend[31]_i_11_n_0 ;
  wire \dividend[31]_i_12_n_0 ;
  wire \dividend[31]_i_13_n_0 ;
  wire \dividend[31]_i_14_n_0 ;
  wire \dividend[31]_i_15_n_0 ;
  wire \dividend[31]_i_16_n_0 ;
  wire \dividend[31]_i_17_n_0 ;
  wire \dividend[31]_i_1_n_0 ;
  wire \dividend[31]_i_3_n_0 ;
  wire \dividend[31]_i_4_n_0 ;
  wire \dividend[31]_i_5_n_0 ;
  wire \dividend[31]_i_6_n_0 ;
  wire \dividend[31]_i_7_n_0 ;
  wire \dividend[31]_i_8_n_0 ;
  wire \dividend[31]_i_9_n_0 ;
  wire \dividend[7]_i_10_n_0 ;
  wire \dividend[7]_i_11_n_0 ;
  wire \dividend[7]_i_12_n_0 ;
  wire \dividend[7]_i_13_n_0 ;
  wire \dividend[7]_i_14_n_0 ;
  wire \dividend[7]_i_15_n_0 ;
  wire \dividend[7]_i_16_n_0 ;
  wire \dividend[7]_i_17_n_0 ;
  wire \dividend[7]_i_18_n_0 ;
  wire \dividend[7]_i_2_n_0 ;
  wire \dividend[7]_i_3_n_0 ;
  wire \dividend[7]_i_4_n_0 ;
  wire \dividend[7]_i_5_n_0 ;
  wire \dividend[7]_i_6_n_0 ;
  wire \dividend[7]_i_7_n_0 ;
  wire \dividend[7]_i_8_n_0 ;
  wire \dividend[7]_i_9_n_0 ;
  wire dividend_is_zero__31;
  wire \dividend_reg[15]_i_1_n_0 ;
  wire \dividend_reg[15]_i_1_n_10 ;
  wire \dividend_reg[15]_i_1_n_11 ;
  wire \dividend_reg[15]_i_1_n_12 ;
  wire \dividend_reg[15]_i_1_n_13 ;
  wire \dividend_reg[15]_i_1_n_14 ;
  wire \dividend_reg[15]_i_1_n_15 ;
  wire \dividend_reg[15]_i_1_n_8 ;
  wire \dividend_reg[15]_i_1_n_9 ;
  wire \dividend_reg[23]_i_1_n_0 ;
  wire \dividend_reg[23]_i_1_n_10 ;
  wire \dividend_reg[23]_i_1_n_11 ;
  wire \dividend_reg[23]_i_1_n_12 ;
  wire \dividend_reg[23]_i_1_n_13 ;
  wire \dividend_reg[23]_i_1_n_14 ;
  wire \dividend_reg[23]_i_1_n_15 ;
  wire \dividend_reg[23]_i_1_n_8 ;
  wire \dividend_reg[23]_i_1_n_9 ;
  wire \dividend_reg[31]_i_2_n_10 ;
  wire \dividend_reg[31]_i_2_n_11 ;
  wire \dividend_reg[31]_i_2_n_12 ;
  wire \dividend_reg[31]_i_2_n_13 ;
  wire \dividend_reg[31]_i_2_n_14 ;
  wire \dividend_reg[31]_i_2_n_15 ;
  wire \dividend_reg[31]_i_2_n_8 ;
  wire \dividend_reg[31]_i_2_n_9 ;
  wire \dividend_reg[7]_i_1_n_0 ;
  wire \dividend_reg[7]_i_1_n_10 ;
  wire \dividend_reg[7]_i_1_n_11 ;
  wire \dividend_reg[7]_i_1_n_12 ;
  wire \dividend_reg[7]_i_1_n_13 ;
  wire \dividend_reg[7]_i_1_n_14 ;
  wire \dividend_reg[7]_i_1_n_15 ;
  wire \dividend_reg[7]_i_1_n_8 ;
  wire \dividend_reg[7]_i_1_n_9 ;
  wire divisor;
  wire \divisor[0]_i_1__0_n_0 ;
  wire \divisor[10]_i_1_n_0 ;
  wire \divisor[11]_i_1_n_0 ;
  wire \divisor[12]_i_1_n_0 ;
  wire \divisor[13]_i_1_n_0 ;
  wire \divisor[14]_i_1_n_0 ;
  wire \divisor[15]_i_1_n_0 ;
  wire \divisor[16]_i_1_n_0 ;
  wire \divisor[17]_i_1_n_0 ;
  wire \divisor[18]_i_1_n_0 ;
  wire \divisor[19]_i_1_n_0 ;
  wire \divisor[1]_i_1__0_n_0 ;
  wire \divisor[20]_i_1_n_0 ;
  wire \divisor[21]_i_1_n_0 ;
  wire \divisor[22]_i_1_n_0 ;
  wire \divisor[23]_i_1_n_0 ;
  wire \divisor[24]_i_1_n_0 ;
  wire \divisor[25]_i_1_n_0 ;
  wire \divisor[26]_i_1_n_0 ;
  wire \divisor[27]_i_1_n_0 ;
  wire \divisor[28]_i_1_n_0 ;
  wire \divisor[29]_i_1_n_0 ;
  wire \divisor[2]_i_1__0_n_0 ;
  wire \divisor[30]_i_1_n_0 ;
  wire \divisor[31]_i_1_n_0 ;
  wire \divisor[32]_i_1_n_0 ;
  wire \divisor[33]_i_1_n_0 ;
  wire \divisor[34]_i_1_n_0 ;
  wire \divisor[35]_i_1_n_0 ;
  wire \divisor[36]_i_1_n_0 ;
  wire \divisor[37]_i_1_n_0 ;
  wire \divisor[38]_i_1_n_0 ;
  wire \divisor[39]_i_1_n_0 ;
  wire \divisor[3]_i_1__0_n_0 ;
  wire \divisor[40]_i_1_n_0 ;
  wire \divisor[41]_i_1_n_0 ;
  wire \divisor[42]_i_1_n_0 ;
  wire \divisor[43]_i_1_n_0 ;
  wire \divisor[44]_i_1_n_0 ;
  wire \divisor[45]_i_1_n_0 ;
  wire \divisor[46]_i_1_n_0 ;
  wire \divisor[47]_i_1_n_0 ;
  wire \divisor[48]_i_1_n_0 ;
  wire \divisor[49]_i_1_n_0 ;
  wire \divisor[4]_i_1__0_n_0 ;
  wire \divisor[50]_i_1_n_0 ;
  wire \divisor[51]_i_1_n_0 ;
  wire \divisor[52]_i_1_n_0 ;
  wire \divisor[53]_i_1_n_0 ;
  wire \divisor[54]_i_1_n_0 ;
  wire \divisor[55]_i_1_n_0 ;
  wire \divisor[56]_i_1_n_0 ;
  wire \divisor[57]_i_1_n_0 ;
  wire \divisor[58]_i_1_n_0 ;
  wire \divisor[59]_i_1_n_0 ;
  wire \divisor[5]_i_1__0_n_0 ;
  wire \divisor[60]_i_1_n_0 ;
  wire \divisor[61]_i_1_n_0 ;
  wire \divisor[6]_i_1__0_n_0 ;
  wire \divisor[7]_i_1_n_0 ;
  wire \divisor[8]_i_1_n_0 ;
  wire \divisor[9]_i_1_n_0 ;
  wire \divisor_reg_n_0_[0] ;
  wire \divisor_reg_n_0_[10] ;
  wire \divisor_reg_n_0_[11] ;
  wire \divisor_reg_n_0_[12] ;
  wire \divisor_reg_n_0_[13] ;
  wire \divisor_reg_n_0_[14] ;
  wire \divisor_reg_n_0_[15] ;
  wire \divisor_reg_n_0_[16] ;
  wire \divisor_reg_n_0_[17] ;
  wire \divisor_reg_n_0_[18] ;
  wire \divisor_reg_n_0_[19] ;
  wire \divisor_reg_n_0_[1] ;
  wire \divisor_reg_n_0_[20] ;
  wire \divisor_reg_n_0_[21] ;
  wire \divisor_reg_n_0_[22] ;
  wire \divisor_reg_n_0_[23] ;
  wire \divisor_reg_n_0_[24] ;
  wire \divisor_reg_n_0_[25] ;
  wire \divisor_reg_n_0_[26] ;
  wire \divisor_reg_n_0_[27] ;
  wire \divisor_reg_n_0_[28] ;
  wire \divisor_reg_n_0_[29] ;
  wire \divisor_reg_n_0_[2] ;
  wire \divisor_reg_n_0_[30] ;
  wire \divisor_reg_n_0_[31] ;
  wire \divisor_reg_n_0_[32] ;
  wire \divisor_reg_n_0_[33] ;
  wire \divisor_reg_n_0_[34] ;
  wire \divisor_reg_n_0_[35] ;
  wire \divisor_reg_n_0_[36] ;
  wire \divisor_reg_n_0_[37] ;
  wire \divisor_reg_n_0_[38] ;
  wire \divisor_reg_n_0_[39] ;
  wire \divisor_reg_n_0_[3] ;
  wire \divisor_reg_n_0_[40] ;
  wire \divisor_reg_n_0_[41] ;
  wire \divisor_reg_n_0_[42] ;
  wire \divisor_reg_n_0_[43] ;
  wire \divisor_reg_n_0_[44] ;
  wire \divisor_reg_n_0_[45] ;
  wire \divisor_reg_n_0_[46] ;
  wire \divisor_reg_n_0_[47] ;
  wire \divisor_reg_n_0_[48] ;
  wire \divisor_reg_n_0_[49] ;
  wire \divisor_reg_n_0_[4] ;
  wire \divisor_reg_n_0_[50] ;
  wire \divisor_reg_n_0_[51] ;
  wire \divisor_reg_n_0_[52] ;
  wire \divisor_reg_n_0_[53] ;
  wire \divisor_reg_n_0_[54] ;
  wire \divisor_reg_n_0_[55] ;
  wire \divisor_reg_n_0_[56] ;
  wire \divisor_reg_n_0_[57] ;
  wire \divisor_reg_n_0_[58] ;
  wire \divisor_reg_n_0_[59] ;
  wire \divisor_reg_n_0_[5] ;
  wire \divisor_reg_n_0_[60] ;
  wire \divisor_reg_n_0_[61] ;
  wire \divisor_reg_n_0_[62] ;
  wire \divisor_reg_n_0_[6] ;
  wire \divisor_reg_n_0_[7] ;
  wire \divisor_reg_n_0_[8] ;
  wire \divisor_reg_n_0_[9] ;
  wire do_unsigned_div_mod_done_in;
  wire do_unsigned_div_mod_go_in;
  wire done0;
  wire finished;
  wire [31:0]lhs_read_data;
  wire lhs_read_data_11_sn_1;
  wire lhs_read_data_15_sn_1;
  wire lhs_read_data_1_sn_1;
  wire lhs_read_data_7_sn_1;
  wire \out_quotient[31]_i_10_n_0 ;
  wire \out_quotient[31]_i_3_n_0 ;
  wire \out_quotient[31]_i_4_n_0 ;
  wire \out_quotient[31]_i_5_n_0 ;
  wire \out_quotient[31]_i_6_n_0 ;
  wire \out_quotient[31]_i_7_n_0 ;
  wire \out_quotient[31]_i_8_n_0 ;
  wire \out_quotient[31]_i_9_n_0 ;
  wire [31:0]\out_remainder_reg[31]_0 ;
  wire p_0_in;
  wire [31:0]quotient;
  wire quotient0_carry__0_i_10_n_0;
  wire quotient0_carry__0_i_11_n_0;
  wire quotient0_carry__0_i_12_n_0;
  wire quotient0_carry__0_i_13_n_0;
  wire quotient0_carry__0_i_14_n_0;
  wire quotient0_carry__0_i_15_n_0;
  wire quotient0_carry__0_i_16_n_0;
  wire quotient0_carry__0_i_1_n_0;
  wire quotient0_carry__0_i_2_n_0;
  wire quotient0_carry__0_i_3_n_0;
  wire quotient0_carry__0_i_4_n_0;
  wire quotient0_carry__0_i_5_n_0;
  wire quotient0_carry__0_i_6_n_0;
  wire quotient0_carry__0_i_7_n_0;
  wire quotient0_carry__0_i_8_n_0;
  wire quotient0_carry__0_i_9_n_0;
  wire quotient0_carry__0_n_0;
  wire quotient0_carry__1_i_1_n_0;
  wire quotient0_carry__1_i_2_n_0;
  wire quotient0_carry__1_i_3_n_0;
  wire quotient0_carry__1_i_4_n_0;
  wire quotient0_carry__1_i_5_n_0;
  wire quotient0_carry__1_i_6_n_0;
  wire quotient0_carry__1_i_7_n_0;
  wire quotient0_carry__1_i_8_n_0;
  wire quotient0_carry__1_n_0;
  wire quotient0_carry__2_i_1_n_0;
  wire quotient0_carry__2_i_2_n_0;
  wire quotient0_carry__2_i_3_n_0;
  wire quotient0_carry__2_i_4_n_0;
  wire quotient0_carry__2_i_5_n_0;
  wire quotient0_carry__2_i_6_n_0;
  wire quotient0_carry__2_i_7_n_0;
  wire quotient0_carry__2_i_8_n_0;
  wire quotient0_carry__2_n_0;
  wire quotient0_carry_i_10_n_0;
  wire quotient0_carry_i_11_n_0;
  wire quotient0_carry_i_12_n_0;
  wire quotient0_carry_i_13_n_0;
  wire quotient0_carry_i_14_n_0;
  wire quotient0_carry_i_15_n_0;
  wire quotient0_carry_i_16_n_0;
  wire quotient0_carry_i_1_n_0;
  wire quotient0_carry_i_2_n_0;
  wire quotient0_carry_i_3_n_0;
  wire quotient0_carry_i_4_n_0;
  wire quotient0_carry_i_5_n_0;
  wire quotient0_carry_i_6_n_0;
  wire quotient0_carry_i_7_n_0;
  wire quotient0_carry_i_8_n_0;
  wire quotient0_carry_i_9_n_0;
  wire quotient0_carry_n_0;
  wire \quotient[0]_i_1__0_n_0 ;
  wire \quotient[10]_i_1_n_0 ;
  wire \quotient[11]_i_1_n_0 ;
  wire \quotient[12]_i_1_n_0 ;
  wire \quotient[13]_i_1_n_0 ;
  wire \quotient[14]_i_1_n_0 ;
  wire \quotient[15]_i_1_n_0 ;
  wire \quotient[16]_i_1_n_0 ;
  wire \quotient[17]_i_1_n_0 ;
  wire \quotient[18]_i_1_n_0 ;
  wire \quotient[19]_i_1_n_0 ;
  wire \quotient[1]_i_1__0_n_0 ;
  wire \quotient[20]_i_1_n_0 ;
  wire \quotient[21]_i_1_n_0 ;
  wire \quotient[22]_i_1_n_0 ;
  wire \quotient[23]_i_1_n_0 ;
  wire \quotient[24]_i_1_n_0 ;
  wire \quotient[25]_i_1_n_0 ;
  wire \quotient[26]_i_1_n_0 ;
  wire \quotient[27]_i_1_n_0 ;
  wire \quotient[28]_i_1_n_0 ;
  wire \quotient[29]_i_1_n_0 ;
  wire \quotient[2]_i_1__0_n_0 ;
  wire \quotient[30]_i_1_n_0 ;
  wire \quotient[31]_i_1_n_0 ;
  wire \quotient[3]_i_1__0_n_0 ;
  wire \quotient[4]_i_1_n_0 ;
  wire \quotient[5]_i_1_n_0 ;
  wire \quotient[6]_i_1_n_0 ;
  wire \quotient[7]_i_1_n_0 ;
  wire \quotient[8]_i_1_n_0 ;
  wire \quotient[9]_i_1_n_0 ;
  wire [31:0]quotient_msk;
  wire \quotient_msk_reg[31]_0 ;
  wire reset;
  wire [30:0]rhs_read_data;
  wire running;
  wire running_i_1__0_n_0;
  wire unsigned_div_done;
  wire unsigned_div_write_en;
  wire unsigned_mod_done;
  wire [7:0]\NLW_dividend_reg[15]_i_1_CO_UNCONNECTED ;
  wire [7:0]\NLW_dividend_reg[23]_i_1_CO_UNCONNECTED ;
  wire [7:0]\NLW_dividend_reg[7]_i_1_CO_UNCONNECTED ;
  wire [7:0]NLW_quotient0_carry_CO_UNCONNECTED;
  wire [7:0]NLW_quotient0_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_quotient0_carry__1_CO_UNCONNECTED;
  wire [7:0]NLW_quotient0_carry__2_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  VCC VCC
       (.P(\<const1> ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[15]_i_10 
       (.I0(\divisor_reg_n_0_[15] ),
        .I1(dividend[15]),
        .I2(p_0_in),
        .I3(lhs_read_data[15]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[15]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[15]_i_11 
       (.I0(\divisor_reg_n_0_[14] ),
        .I1(dividend[14]),
        .I2(p_0_in),
        .I3(lhs_read_data[14]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[15]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[15]_i_12 
       (.I0(\divisor_reg_n_0_[13] ),
        .I1(dividend[13]),
        .I2(p_0_in),
        .I3(lhs_read_data[13]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[15]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[15]_i_13 
       (.I0(\divisor_reg_n_0_[12] ),
        .I1(dividend[12]),
        .I2(p_0_in),
        .I3(lhs_read_data[12]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[15]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[15]_i_14 
       (.I0(\divisor_reg_n_0_[11] ),
        .I1(dividend[11]),
        .I2(p_0_in),
        .I3(lhs_read_data[11]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[15]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[15]_i_15 
       (.I0(\divisor_reg_n_0_[10] ),
        .I1(dividend[10]),
        .I2(p_0_in),
        .I3(lhs_read_data[10]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[15]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[15]_i_16 
       (.I0(\divisor_reg_n_0_[9] ),
        .I1(dividend[9]),
        .I2(p_0_in),
        .I3(lhs_read_data[9]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[15]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[15]_i_17 
       (.I0(\divisor_reg_n_0_[8] ),
        .I1(dividend[8]),
        .I2(p_0_in),
        .I3(lhs_read_data[8]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[15]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[15]_i_2 
       (.I0(\divisor_reg_n_0_[15] ),
        .I1(p_0_in),
        .O(\dividend[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[15]_i_3 
       (.I0(\divisor_reg_n_0_[14] ),
        .I1(p_0_in),
        .O(\dividend[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[15]_i_4 
       (.I0(\divisor_reg_n_0_[13] ),
        .I1(p_0_in),
        .O(\dividend[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[15]_i_5 
       (.I0(\divisor_reg_n_0_[12] ),
        .I1(p_0_in),
        .O(\dividend[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[15]_i_6 
       (.I0(\divisor_reg_n_0_[11] ),
        .I1(p_0_in),
        .O(\dividend[15]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[15]_i_7 
       (.I0(\divisor_reg_n_0_[10] ),
        .I1(p_0_in),
        .O(\dividend[15]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[15]_i_8 
       (.I0(\divisor_reg_n_0_[9] ),
        .I1(p_0_in),
        .O(\dividend[15]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[15]_i_9 
       (.I0(\divisor_reg_n_0_[8] ),
        .I1(p_0_in),
        .O(\dividend[15]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[23]_i_10 
       (.I0(\divisor_reg_n_0_[23] ),
        .I1(dividend[23]),
        .I2(p_0_in),
        .I3(lhs_read_data[23]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[23]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[23]_i_11 
       (.I0(\divisor_reg_n_0_[22] ),
        .I1(dividend[22]),
        .I2(p_0_in),
        .I3(lhs_read_data[22]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[23]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[23]_i_12 
       (.I0(\divisor_reg_n_0_[21] ),
        .I1(dividend[21]),
        .I2(p_0_in),
        .I3(lhs_read_data[21]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[23]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[23]_i_13 
       (.I0(\divisor_reg_n_0_[20] ),
        .I1(dividend[20]),
        .I2(p_0_in),
        .I3(lhs_read_data[20]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[23]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[23]_i_14 
       (.I0(\divisor_reg_n_0_[19] ),
        .I1(dividend[19]),
        .I2(p_0_in),
        .I3(lhs_read_data[19]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[23]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[23]_i_15 
       (.I0(\divisor_reg_n_0_[18] ),
        .I1(dividend[18]),
        .I2(p_0_in),
        .I3(lhs_read_data[18]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[23]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[23]_i_16 
       (.I0(\divisor_reg_n_0_[17] ),
        .I1(dividend[17]),
        .I2(p_0_in),
        .I3(lhs_read_data[17]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[23]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[23]_i_17 
       (.I0(\divisor_reg_n_0_[16] ),
        .I1(dividend[16]),
        .I2(p_0_in),
        .I3(lhs_read_data[16]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[23]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[23]_i_2 
       (.I0(\divisor_reg_n_0_[23] ),
        .I1(p_0_in),
        .O(\dividend[23]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[23]_i_3 
       (.I0(\divisor_reg_n_0_[22] ),
        .I1(p_0_in),
        .O(\dividend[23]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[23]_i_4 
       (.I0(\divisor_reg_n_0_[21] ),
        .I1(p_0_in),
        .O(\dividend[23]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[23]_i_5 
       (.I0(\divisor_reg_n_0_[20] ),
        .I1(p_0_in),
        .O(\dividend[23]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[23]_i_6 
       (.I0(\divisor_reg_n_0_[19] ),
        .I1(p_0_in),
        .O(\dividend[23]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[23]_i_7 
       (.I0(\divisor_reg_n_0_[18] ),
        .I1(p_0_in),
        .O(\dividend[23]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[23]_i_8 
       (.I0(\divisor_reg_n_0_[17] ),
        .I1(p_0_in),
        .O(\dividend[23]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[23]_i_9 
       (.I0(\divisor_reg_n_0_[16] ),
        .I1(p_0_in),
        .O(\dividend[23]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \dividend[31]_i_1 
       (.I0(p_0_in),
        .I1(quotient0_carry__2_n_0),
        .O(\dividend[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[31]_i_10 
       (.I0(\divisor_reg_n_0_[31] ),
        .I1(dividend[31]),
        .I2(p_0_in),
        .I3(lhs_read_data[31]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[31]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[31]_i_11 
       (.I0(\divisor_reg_n_0_[30] ),
        .I1(dividend[30]),
        .I2(p_0_in),
        .I3(lhs_read_data[30]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[31]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[31]_i_12 
       (.I0(\divisor_reg_n_0_[29] ),
        .I1(dividend[29]),
        .I2(p_0_in),
        .I3(lhs_read_data[29]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[31]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[31]_i_13 
       (.I0(\divisor_reg_n_0_[28] ),
        .I1(dividend[28]),
        .I2(p_0_in),
        .I3(lhs_read_data[28]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[31]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[31]_i_14 
       (.I0(\divisor_reg_n_0_[27] ),
        .I1(dividend[27]),
        .I2(p_0_in),
        .I3(lhs_read_data[27]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[31]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[31]_i_15 
       (.I0(\divisor_reg_n_0_[26] ),
        .I1(dividend[26]),
        .I2(p_0_in),
        .I3(lhs_read_data[26]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[31]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[31]_i_16 
       (.I0(\divisor_reg_n_0_[25] ),
        .I1(dividend[25]),
        .I2(p_0_in),
        .I3(lhs_read_data[25]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[31]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[31]_i_17 
       (.I0(\divisor_reg_n_0_[24] ),
        .I1(dividend[24]),
        .I2(p_0_in),
        .I3(lhs_read_data[24]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[31]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[31]_i_3 
       (.I0(\divisor_reg_n_0_[30] ),
        .I1(p_0_in),
        .O(\dividend[31]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[31]_i_4 
       (.I0(\divisor_reg_n_0_[29] ),
        .I1(p_0_in),
        .O(\dividend[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[31]_i_5 
       (.I0(\divisor_reg_n_0_[28] ),
        .I1(p_0_in),
        .O(\dividend[31]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[31]_i_6 
       (.I0(\divisor_reg_n_0_[27] ),
        .I1(p_0_in),
        .O(\dividend[31]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[31]_i_7 
       (.I0(\divisor_reg_n_0_[26] ),
        .I1(p_0_in),
        .O(\dividend[31]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[31]_i_8 
       (.I0(\divisor_reg_n_0_[25] ),
        .I1(p_0_in),
        .O(\dividend[31]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[31]_i_9 
       (.I0(\divisor_reg_n_0_[24] ),
        .I1(p_0_in),
        .O(\dividend[31]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[7]_i_10 
       (.I0(\divisor_reg_n_0_[0] ),
        .I1(p_0_in),
        .O(\dividend[7]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[7]_i_11 
       (.I0(\divisor_reg_n_0_[7] ),
        .I1(dividend[7]),
        .I2(p_0_in),
        .I3(lhs_read_data[7]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[7]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[7]_i_12 
       (.I0(\divisor_reg_n_0_[6] ),
        .I1(dividend[6]),
        .I2(p_0_in),
        .I3(lhs_read_data[6]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[7]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[7]_i_13 
       (.I0(\divisor_reg_n_0_[5] ),
        .I1(dividend[5]),
        .I2(p_0_in),
        .I3(lhs_read_data[5]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[7]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[7]_i_14 
       (.I0(\divisor_reg_n_0_[4] ),
        .I1(dividend[4]),
        .I2(p_0_in),
        .I3(lhs_read_data[4]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[7]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[7]_i_15 
       (.I0(\divisor_reg_n_0_[3] ),
        .I1(dividend[3]),
        .I2(p_0_in),
        .I3(lhs_read_data[3]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[7]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[7]_i_16 
       (.I0(\divisor_reg_n_0_[2] ),
        .I1(dividend[2]),
        .I2(p_0_in),
        .I3(lhs_read_data[2]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[7]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[7]_i_17 
       (.I0(\divisor_reg_n_0_[1] ),
        .I1(dividend[1]),
        .I2(p_0_in),
        .I3(lhs_read_data[1]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[7]_i_17_n_0 ));
  LUT5 #(
    .INIT(32'hF9090909)) 
    \dividend[7]_i_18 
       (.I0(\divisor_reg_n_0_[0] ),
        .I1(dividend[0]),
        .I2(p_0_in),
        .I3(lhs_read_data[0]),
        .I4(do_unsigned_div_mod_go_in),
        .O(\dividend[7]_i_18_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \dividend[7]_i_2 
       (.I0(p_0_in),
        .O(\dividend[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[7]_i_3 
       (.I0(\divisor_reg_n_0_[7] ),
        .I1(p_0_in),
        .O(\dividend[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[7]_i_4 
       (.I0(\divisor_reg_n_0_[6] ),
        .I1(p_0_in),
        .O(\dividend[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[7]_i_5 
       (.I0(\divisor_reg_n_0_[5] ),
        .I1(p_0_in),
        .O(\dividend[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[7]_i_6 
       (.I0(\divisor_reg_n_0_[4] ),
        .I1(p_0_in),
        .O(\dividend[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[7]_i_7 
       (.I0(\divisor_reg_n_0_[3] ),
        .I1(p_0_in),
        .O(\dividend[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[7]_i_8 
       (.I0(\divisor_reg_n_0_[2] ),
        .I1(p_0_in),
        .O(\dividend[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \dividend[7]_i_9 
       (.I0(\divisor_reg_n_0_[1] ),
        .I1(p_0_in),
        .O(\dividend[7]_i_9_n_0 ));
  FDRE \dividend_reg[0] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[7]_i_1_n_15 ),
        .Q(dividend[0]),
        .R(\<const0> ));
  FDRE \dividend_reg[10] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[15]_i_1_n_13 ),
        .Q(dividend[10]),
        .R(\<const0> ));
  FDRE \dividend_reg[11] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[15]_i_1_n_12 ),
        .Q(dividend[11]),
        .R(\<const0> ));
  FDRE \dividend_reg[12] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[15]_i_1_n_11 ),
        .Q(dividend[12]),
        .R(\<const0> ));
  FDRE \dividend_reg[13] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[15]_i_1_n_10 ),
        .Q(dividend[13]),
        .R(\<const0> ));
  FDRE \dividend_reg[14] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[15]_i_1_n_9 ),
        .Q(dividend[14]),
        .R(\<const0> ));
  FDRE \dividend_reg[15] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[15]_i_1_n_8 ),
        .Q(dividend[15]),
        .R(\<const0> ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \dividend_reg[15]_i_1 
       (.CI(\dividend_reg[7]_i_1_n_0 ),
        .CI_TOP(GND_2),
        .CO({\dividend_reg[15]_i_1_n_0 ,\NLW_dividend_reg[15]_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\dividend[15]_i_2_n_0 ,\dividend[15]_i_3_n_0 ,\dividend[15]_i_4_n_0 ,\dividend[15]_i_5_n_0 ,\dividend[15]_i_6_n_0 ,\dividend[15]_i_7_n_0 ,\dividend[15]_i_8_n_0 ,\dividend[15]_i_9_n_0 }),
        .O({\dividend_reg[15]_i_1_n_8 ,\dividend_reg[15]_i_1_n_9 ,\dividend_reg[15]_i_1_n_10 ,\dividend_reg[15]_i_1_n_11 ,\dividend_reg[15]_i_1_n_12 ,\dividend_reg[15]_i_1_n_13 ,\dividend_reg[15]_i_1_n_14 ,\dividend_reg[15]_i_1_n_15 }),
        .S({\dividend[15]_i_10_n_0 ,\dividend[15]_i_11_n_0 ,\dividend[15]_i_12_n_0 ,\dividend[15]_i_13_n_0 ,\dividend[15]_i_14_n_0 ,\dividend[15]_i_15_n_0 ,\dividend[15]_i_16_n_0 ,\dividend[15]_i_17_n_0 }));
  FDRE \dividend_reg[16] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[23]_i_1_n_15 ),
        .Q(dividend[16]),
        .R(\<const0> ));
  FDRE \dividend_reg[17] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[23]_i_1_n_14 ),
        .Q(dividend[17]),
        .R(\<const0> ));
  FDRE \dividend_reg[18] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[23]_i_1_n_13 ),
        .Q(dividend[18]),
        .R(\<const0> ));
  FDRE \dividend_reg[19] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[23]_i_1_n_12 ),
        .Q(dividend[19]),
        .R(\<const0> ));
  FDRE \dividend_reg[1] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[7]_i_1_n_14 ),
        .Q(dividend[1]),
        .R(\<const0> ));
  FDRE \dividend_reg[20] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[23]_i_1_n_11 ),
        .Q(dividend[20]),
        .R(\<const0> ));
  FDRE \dividend_reg[21] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[23]_i_1_n_10 ),
        .Q(dividend[21]),
        .R(\<const0> ));
  FDRE \dividend_reg[22] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[23]_i_1_n_9 ),
        .Q(dividend[22]),
        .R(\<const0> ));
  FDRE \dividend_reg[23] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[23]_i_1_n_8 ),
        .Q(dividend[23]),
        .R(\<const0> ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \dividend_reg[23]_i_1 
       (.CI(\dividend_reg[15]_i_1_n_0 ),
        .CI_TOP(GND_2),
        .CO({\dividend_reg[23]_i_1_n_0 ,\NLW_dividend_reg[23]_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\dividend[23]_i_2_n_0 ,\dividend[23]_i_3_n_0 ,\dividend[23]_i_4_n_0 ,\dividend[23]_i_5_n_0 ,\dividend[23]_i_6_n_0 ,\dividend[23]_i_7_n_0 ,\dividend[23]_i_8_n_0 ,\dividend[23]_i_9_n_0 }),
        .O({\dividend_reg[23]_i_1_n_8 ,\dividend_reg[23]_i_1_n_9 ,\dividend_reg[23]_i_1_n_10 ,\dividend_reg[23]_i_1_n_11 ,\dividend_reg[23]_i_1_n_12 ,\dividend_reg[23]_i_1_n_13 ,\dividend_reg[23]_i_1_n_14 ,\dividend_reg[23]_i_1_n_15 }),
        .S({\dividend[23]_i_10_n_0 ,\dividend[23]_i_11_n_0 ,\dividend[23]_i_12_n_0 ,\dividend[23]_i_13_n_0 ,\dividend[23]_i_14_n_0 ,\dividend[23]_i_15_n_0 ,\dividend[23]_i_16_n_0 ,\dividend[23]_i_17_n_0 }));
  FDRE \dividend_reg[24] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[31]_i_2_n_15 ),
        .Q(dividend[24]),
        .R(\<const0> ));
  FDRE \dividend_reg[25] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[31]_i_2_n_14 ),
        .Q(dividend[25]),
        .R(\<const0> ));
  FDRE \dividend_reg[26] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[31]_i_2_n_13 ),
        .Q(dividend[26]),
        .R(\<const0> ));
  FDRE \dividend_reg[27] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[31]_i_2_n_12 ),
        .Q(dividend[27]),
        .R(\<const0> ));
  FDRE \dividend_reg[28] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[31]_i_2_n_11 ),
        .Q(dividend[28]),
        .R(\<const0> ));
  FDRE \dividend_reg[29] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[31]_i_2_n_10 ),
        .Q(dividend[29]),
        .R(\<const0> ));
  FDRE \dividend_reg[2] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[7]_i_1_n_13 ),
        .Q(dividend[2]),
        .R(\<const0> ));
  FDRE \dividend_reg[30] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[31]_i_2_n_9 ),
        .Q(dividend[30]),
        .R(\<const0> ));
  FDRE \dividend_reg[31] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[31]_i_2_n_8 ),
        .Q(dividend[31]),
        .R(\<const0> ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \dividend_reg[31]_i_2 
       (.CI(\dividend_reg[23]_i_1_n_0 ),
        .CI_TOP(GND_2),
        .DI({\<const0> ,\dividend[31]_i_3_n_0 ,\dividend[31]_i_4_n_0 ,\dividend[31]_i_5_n_0 ,\dividend[31]_i_6_n_0 ,\dividend[31]_i_7_n_0 ,\dividend[31]_i_8_n_0 ,\dividend[31]_i_9_n_0 }),
        .O({\dividend_reg[31]_i_2_n_8 ,\dividend_reg[31]_i_2_n_9 ,\dividend_reg[31]_i_2_n_10 ,\dividend_reg[31]_i_2_n_11 ,\dividend_reg[31]_i_2_n_12 ,\dividend_reg[31]_i_2_n_13 ,\dividend_reg[31]_i_2_n_14 ,\dividend_reg[31]_i_2_n_15 }),
        .S({\dividend[31]_i_10_n_0 ,\dividend[31]_i_11_n_0 ,\dividend[31]_i_12_n_0 ,\dividend[31]_i_13_n_0 ,\dividend[31]_i_14_n_0 ,\dividend[31]_i_15_n_0 ,\dividend[31]_i_16_n_0 ,\dividend[31]_i_17_n_0 }));
  FDRE \dividend_reg[3] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[7]_i_1_n_12 ),
        .Q(dividend[3]),
        .R(\<const0> ));
  FDRE \dividend_reg[4] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[7]_i_1_n_11 ),
        .Q(dividend[4]),
        .R(\<const0> ));
  FDRE \dividend_reg[5] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[7]_i_1_n_10 ),
        .Q(dividend[5]),
        .R(\<const0> ));
  FDRE \dividend_reg[6] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[7]_i_1_n_9 ),
        .Q(dividend[6]),
        .R(\<const0> ));
  FDRE \dividend_reg[7] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[7]_i_1_n_8 ),
        .Q(dividend[7]),
        .R(\<const0> ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \dividend_reg[7]_i_1 
       (.CI(\dividend[7]_i_2_n_0 ),
        .CI_TOP(GND_2),
        .CO({\dividend_reg[7]_i_1_n_0 ,\NLW_dividend_reg[7]_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\dividend[7]_i_3_n_0 ,\dividend[7]_i_4_n_0 ,\dividend[7]_i_5_n_0 ,\dividend[7]_i_6_n_0 ,\dividend[7]_i_7_n_0 ,\dividend[7]_i_8_n_0 ,\dividend[7]_i_9_n_0 ,\dividend[7]_i_10_n_0 }),
        .O({\dividend_reg[7]_i_1_n_8 ,\dividend_reg[7]_i_1_n_9 ,\dividend_reg[7]_i_1_n_10 ,\dividend_reg[7]_i_1_n_11 ,\dividend_reg[7]_i_1_n_12 ,\dividend_reg[7]_i_1_n_13 ,\dividend_reg[7]_i_1_n_14 ,\dividend_reg[7]_i_1_n_15 }),
        .S({\dividend[7]_i_11_n_0 ,\dividend[7]_i_12_n_0 ,\dividend[7]_i_13_n_0 ,\dividend[7]_i_14_n_0 ,\dividend[7]_i_15_n_0 ,\dividend[7]_i_16_n_0 ,\dividend[7]_i_17_n_0 ,\dividend[7]_i_18_n_0 }));
  FDRE \dividend_reg[8] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[15]_i_1_n_15 ),
        .Q(dividend[8]),
        .R(\<const0> ));
  FDRE \dividend_reg[9] 
       (.C(clk),
        .CE(\dividend[31]_i_1_n_0 ),
        .D(\dividend_reg[15]_i_1_n_14 ),
        .Q(dividend[9]),
        .R(\<const0> ));
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[0]_i_1__0 
       (.I0(\divisor_reg_n_0_[1] ),
        .I1(p_0_in),
        .O(\divisor[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[10]_i_1 
       (.I0(\divisor_reg_n_0_[11] ),
        .I1(p_0_in),
        .O(\divisor[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[11]_i_1 
       (.I0(\divisor_reg_n_0_[12] ),
        .I1(p_0_in),
        .O(\divisor[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[12]_i_1 
       (.I0(\divisor_reg_n_0_[13] ),
        .I1(p_0_in),
        .O(\divisor[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[13]_i_1 
       (.I0(\divisor_reg_n_0_[14] ),
        .I1(p_0_in),
        .O(\divisor[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[14]_i_1 
       (.I0(\divisor_reg_n_0_[15] ),
        .I1(p_0_in),
        .O(\divisor[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[15]_i_1 
       (.I0(\divisor_reg_n_0_[16] ),
        .I1(p_0_in),
        .O(\divisor[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[16]_i_1 
       (.I0(\divisor_reg_n_0_[17] ),
        .I1(p_0_in),
        .O(\divisor[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[17]_i_1 
       (.I0(\divisor_reg_n_0_[18] ),
        .I1(p_0_in),
        .O(\divisor[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[18]_i_1 
       (.I0(\divisor_reg_n_0_[19] ),
        .I1(p_0_in),
        .O(\divisor[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[19]_i_1 
       (.I0(\divisor_reg_n_0_[20] ),
        .I1(p_0_in),
        .O(\divisor[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[1]_i_1__0 
       (.I0(\divisor_reg_n_0_[2] ),
        .I1(p_0_in),
        .O(\divisor[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[20]_i_1 
       (.I0(\divisor_reg_n_0_[21] ),
        .I1(p_0_in),
        .O(\divisor[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[21]_i_1 
       (.I0(\divisor_reg_n_0_[22] ),
        .I1(p_0_in),
        .O(\divisor[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[22]_i_1 
       (.I0(\divisor_reg_n_0_[23] ),
        .I1(p_0_in),
        .O(\divisor[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[23]_i_1 
       (.I0(\divisor_reg_n_0_[24] ),
        .I1(p_0_in),
        .O(\divisor[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[24]_i_1 
       (.I0(\divisor_reg_n_0_[25] ),
        .I1(p_0_in),
        .O(\divisor[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[25]_i_1 
       (.I0(\divisor_reg_n_0_[26] ),
        .I1(p_0_in),
        .O(\divisor[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[26]_i_1 
       (.I0(\divisor_reg_n_0_[27] ),
        .I1(p_0_in),
        .O(\divisor[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[27]_i_1 
       (.I0(\divisor_reg_n_0_[28] ),
        .I1(p_0_in),
        .O(\divisor[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[28]_i_1 
       (.I0(\divisor_reg_n_0_[29] ),
        .I1(p_0_in),
        .O(\divisor[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[29]_i_1 
       (.I0(\divisor_reg_n_0_[30] ),
        .I1(p_0_in),
        .O(\divisor[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[2]_i_1__0 
       (.I0(\divisor_reg_n_0_[3] ),
        .I1(p_0_in),
        .O(\divisor[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[30]_i_1 
       (.I0(\divisor_reg_n_0_[31] ),
        .I1(p_0_in),
        .O(\divisor[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[31]_i_1 
       (.I0(rhs_read_data[0]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[32] ),
        .O(\divisor[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[32]_i_1 
       (.I0(rhs_read_data[1]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[33] ),
        .O(\divisor[32]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[33]_i_1 
       (.I0(rhs_read_data[2]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[34] ),
        .O(\divisor[33]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[34]_i_1 
       (.I0(rhs_read_data[3]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[35] ),
        .O(\divisor[34]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[35]_i_1 
       (.I0(rhs_read_data[4]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[36] ),
        .O(\divisor[35]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[36]_i_1 
       (.I0(rhs_read_data[5]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[37] ),
        .O(\divisor[36]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[37]_i_1 
       (.I0(rhs_read_data[6]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[38] ),
        .O(\divisor[37]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[38]_i_1 
       (.I0(rhs_read_data[7]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[39] ),
        .O(\divisor[38]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[39]_i_1 
       (.I0(rhs_read_data[8]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[40] ),
        .O(\divisor[39]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[3]_i_1__0 
       (.I0(\divisor_reg_n_0_[4] ),
        .I1(p_0_in),
        .O(\divisor[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[40]_i_1 
       (.I0(rhs_read_data[9]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[41] ),
        .O(\divisor[40]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[41]_i_1 
       (.I0(rhs_read_data[10]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[42] ),
        .O(\divisor[41]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[42]_i_1 
       (.I0(rhs_read_data[11]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[43] ),
        .O(\divisor[42]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[43]_i_1 
       (.I0(rhs_read_data[12]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[44] ),
        .O(\divisor[43]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[44]_i_1 
       (.I0(rhs_read_data[13]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[45] ),
        .O(\divisor[44]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[45]_i_1 
       (.I0(rhs_read_data[14]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[46] ),
        .O(\divisor[45]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[46]_i_1 
       (.I0(rhs_read_data[15]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[47] ),
        .O(\divisor[46]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[47]_i_1 
       (.I0(rhs_read_data[16]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[48] ),
        .O(\divisor[47]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[48]_i_1 
       (.I0(rhs_read_data[17]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[49] ),
        .O(\divisor[48]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[49]_i_1 
       (.I0(rhs_read_data[18]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[50] ),
        .O(\divisor[49]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[4]_i_1__0 
       (.I0(\divisor_reg_n_0_[5] ),
        .I1(p_0_in),
        .O(\divisor[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[50]_i_1 
       (.I0(rhs_read_data[19]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[51] ),
        .O(\divisor[50]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[51]_i_1 
       (.I0(rhs_read_data[20]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[52] ),
        .O(\divisor[51]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[52]_i_1 
       (.I0(rhs_read_data[21]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[53] ),
        .O(\divisor[52]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[53]_i_1 
       (.I0(rhs_read_data[22]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[54] ),
        .O(\divisor[53]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[54]_i_1 
       (.I0(rhs_read_data[23]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[55] ),
        .O(\divisor[54]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[55]_i_1 
       (.I0(rhs_read_data[24]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[56] ),
        .O(\divisor[55]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[56]_i_1 
       (.I0(rhs_read_data[25]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[57] ),
        .O(\divisor[56]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[57]_i_1 
       (.I0(rhs_read_data[26]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[58] ),
        .O(\divisor[57]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[58]_i_1 
       (.I0(rhs_read_data[27]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[59] ),
        .O(\divisor[58]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[59]_i_1 
       (.I0(rhs_read_data[28]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[60] ),
        .O(\divisor[59]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[5]_i_1__0 
       (.I0(\divisor_reg_n_0_[6] ),
        .I1(p_0_in),
        .O(\divisor[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[60]_i_1 
       (.I0(rhs_read_data[29]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[61] ),
        .O(\divisor[60]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \divisor[61]_i_1 
       (.I0(rhs_read_data[30]),
        .I1(do_unsigned_div_mod_go_in),
        .I2(p_0_in),
        .I3(\divisor_reg_n_0_[62] ),
        .O(\divisor[61]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[62]_i_1 
       (.I0(finished),
        .I1(p_0_in),
        .O(divisor));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[6]_i_1__0 
       (.I0(\divisor_reg_n_0_[7] ),
        .I1(p_0_in),
        .O(\divisor[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[7]_i_1 
       (.I0(\divisor_reg_n_0_[8] ),
        .I1(p_0_in),
        .O(\divisor[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[8]_i_1 
       (.I0(\divisor_reg_n_0_[9] ),
        .I1(p_0_in),
        .O(\divisor[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \divisor[9]_i_1 
       (.I0(\divisor_reg_n_0_[10] ),
        .I1(p_0_in),
        .O(\divisor[9]_i_1_n_0 ));
  FDRE \divisor_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[0]_i_1__0_n_0 ),
        .Q(\divisor_reg_n_0_[0] ),
        .R(divisor));
  FDRE \divisor_reg[10] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[10]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[10] ),
        .R(divisor));
  FDRE \divisor_reg[11] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[11]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[11] ),
        .R(divisor));
  FDRE \divisor_reg[12] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[12]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[12] ),
        .R(divisor));
  FDRE \divisor_reg[13] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[13]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[13] ),
        .R(divisor));
  FDRE \divisor_reg[14] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[14]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[14] ),
        .R(divisor));
  FDRE \divisor_reg[15] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[15]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[15] ),
        .R(divisor));
  FDRE \divisor_reg[16] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[16]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[16] ),
        .R(divisor));
  FDRE \divisor_reg[17] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[17]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[17] ),
        .R(divisor));
  FDRE \divisor_reg[18] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[18]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[18] ),
        .R(divisor));
  FDRE \divisor_reg[19] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[19]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[19] ),
        .R(divisor));
  FDRE \divisor_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[1]_i_1__0_n_0 ),
        .Q(\divisor_reg_n_0_[1] ),
        .R(divisor));
  FDRE \divisor_reg[20] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[20]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[20] ),
        .R(divisor));
  FDRE \divisor_reg[21] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[21]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[21] ),
        .R(divisor));
  FDRE \divisor_reg[22] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[22]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[22] ),
        .R(divisor));
  FDRE \divisor_reg[23] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[23]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[23] ),
        .R(divisor));
  FDRE \divisor_reg[24] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[24]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[24] ),
        .R(divisor));
  FDRE \divisor_reg[25] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[25]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[25] ),
        .R(divisor));
  FDRE \divisor_reg[26] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[26]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[26] ),
        .R(divisor));
  FDRE \divisor_reg[27] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[27]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[27] ),
        .R(divisor));
  FDRE \divisor_reg[28] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[28]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[28] ),
        .R(divisor));
  FDRE \divisor_reg[29] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[29]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[29] ),
        .R(divisor));
  FDRE \divisor_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[2]_i_1__0_n_0 ),
        .Q(\divisor_reg_n_0_[2] ),
        .R(divisor));
  FDRE \divisor_reg[30] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[30]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[30] ),
        .R(divisor));
  FDRE \divisor_reg[31] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[31]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[31] ),
        .R(divisor));
  FDRE \divisor_reg[32] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[32]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[32] ),
        .R(divisor));
  FDRE \divisor_reg[33] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[33]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[33] ),
        .R(divisor));
  FDRE \divisor_reg[34] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[34]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[34] ),
        .R(divisor));
  FDRE \divisor_reg[35] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[35]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[35] ),
        .R(divisor));
  FDRE \divisor_reg[36] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[36]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[36] ),
        .R(divisor));
  FDRE \divisor_reg[37] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[37]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[37] ),
        .R(divisor));
  FDRE \divisor_reg[38] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[38]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[38] ),
        .R(divisor));
  FDRE \divisor_reg[39] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[39]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[39] ),
        .R(divisor));
  FDRE \divisor_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[3]_i_1__0_n_0 ),
        .Q(\divisor_reg_n_0_[3] ),
        .R(divisor));
  FDRE \divisor_reg[40] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[40]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[40] ),
        .R(divisor));
  FDRE \divisor_reg[41] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[41]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[41] ),
        .R(divisor));
  FDRE \divisor_reg[42] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[42]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[42] ),
        .R(divisor));
  FDRE \divisor_reg[43] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[43]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[43] ),
        .R(divisor));
  FDRE \divisor_reg[44] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[44]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[44] ),
        .R(divisor));
  FDRE \divisor_reg[45] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[45]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[45] ),
        .R(divisor));
  FDRE \divisor_reg[46] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[46]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[46] ),
        .R(divisor));
  FDRE \divisor_reg[47] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[47]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[47] ),
        .R(divisor));
  FDRE \divisor_reg[48] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[48]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[48] ),
        .R(divisor));
  FDRE \divisor_reg[49] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[49]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[49] ),
        .R(divisor));
  FDRE \divisor_reg[4] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[4]_i_1__0_n_0 ),
        .Q(\divisor_reg_n_0_[4] ),
        .R(divisor));
  FDRE \divisor_reg[50] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[50]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[50] ),
        .R(divisor));
  FDRE \divisor_reg[51] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[51]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[51] ),
        .R(divisor));
  FDRE \divisor_reg[52] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[52]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[52] ),
        .R(divisor));
  FDRE \divisor_reg[53] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[53]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[53] ),
        .R(divisor));
  FDRE \divisor_reg[54] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[54]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[54] ),
        .R(divisor));
  FDRE \divisor_reg[55] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[55]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[55] ),
        .R(divisor));
  FDRE \divisor_reg[56] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[56]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[56] ),
        .R(divisor));
  FDRE \divisor_reg[57] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[57]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[57] ),
        .R(divisor));
  FDRE \divisor_reg[58] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[58]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[58] ),
        .R(divisor));
  FDRE \divisor_reg[59] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[59]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[59] ),
        .R(divisor));
  FDRE \divisor_reg[5] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[5]_i_1__0_n_0 ),
        .Q(\divisor_reg_n_0_[5] ),
        .R(divisor));
  FDRE \divisor_reg[60] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[60]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[60] ),
        .R(divisor));
  FDRE \divisor_reg[61] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[61]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[61] ),
        .R(divisor));
  FDRE \divisor_reg[62] 
       (.C(clk),
        .CE(\<const1> ),
        .D(D),
        .Q(\divisor_reg_n_0_[62] ),
        .R(divisor));
  FDRE \divisor_reg[6] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[6]_i_1__0_n_0 ),
        .Q(\divisor_reg_n_0_[6] ),
        .R(divisor));
  FDRE \divisor_reg[7] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[7]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[7] ),
        .R(divisor));
  FDRE \divisor_reg[8] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[8]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[8] ),
        .R(divisor));
  FDRE \divisor_reg[9] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\divisor[9]_i_1_n_0 ),
        .Q(\divisor_reg_n_0_[9] ),
        .R(divisor));
  LUT4 #(
    .INIT(16'h0001)) 
    done_i_10
       (.I0(lhs_read_data[1]),
        .I1(lhs_read_data[0]),
        .I2(lhs_read_data[3]),
        .I3(lhs_read_data[2]),
        .O(lhs_read_data_1_sn_1));
  LUT4 #(
    .INIT(16'h0001)) 
    done_i_11
       (.I0(lhs_read_data[7]),
        .I1(lhs_read_data[6]),
        .I2(lhs_read_data[5]),
        .I3(lhs_read_data[4]),
        .O(lhs_read_data_7_sn_1));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    done_i_1__0
       (.I0(finished),
        .I1(dividend_is_zero__31),
        .O(done0));
  LUT4 #(
    .INIT(16'h0001)) 
    done_i_8
       (.I0(lhs_read_data[15]),
        .I1(lhs_read_data[14]),
        .I2(lhs_read_data[13]),
        .I3(lhs_read_data[12]),
        .O(lhs_read_data_15_sn_1));
  LUT4 #(
    .INIT(16'h0001)) 
    done_i_9
       (.I0(lhs_read_data[11]),
        .I1(lhs_read_data[10]),
        .I2(lhs_read_data[9]),
        .I3(lhs_read_data[8]),
        .O(lhs_read_data_11_sn_1));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(done0),
        .Q(div_done),
        .R(\<const0> ));
  LUT2 #(
    .INIT(4'h8)) 
    \out[3]_i_9 
       (.I0(unsigned_div_done),
        .I1(unsigned_mod_done),
        .O(do_unsigned_div_mod_done_in));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \out_quotient[31]_i_10 
       (.I0(quotient_msk[20]),
        .I1(quotient_msk[21]),
        .I2(quotient_msk[22]),
        .I3(quotient_msk[23]),
        .O(\out_quotient[31]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \out_quotient[31]_i_2 
       (.I0(\out_quotient[31]_i_3_n_0 ),
        .I1(\out_quotient[31]_i_4_n_0 ),
        .I2(\out_quotient[31]_i_5_n_0 ),
        .O(finished));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \out_quotient[31]_i_3 
       (.I0(quotient_msk[2]),
        .I1(quotient_msk[1]),
        .I2(quotient_msk[0]),
        .I3(\out_quotient[31]_i_6_n_0 ),
        .I4(\out_quotient[31]_i_7_n_0 ),
        .I5(\out_quotient[31]_i_8_n_0 ),
        .O(\out_quotient[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \out_quotient[31]_i_4 
       (.I0(quotient_msk[27]),
        .I1(quotient_msk[26]),
        .I2(quotient_msk[25]),
        .I3(quotient_msk[24]),
        .I4(\out_quotient[31]_i_9_n_0 ),
        .O(\out_quotient[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \out_quotient[31]_i_5 
       (.I0(quotient_msk[19]),
        .I1(quotient_msk[18]),
        .I2(quotient_msk[17]),
        .I3(quotient_msk[16]),
        .I4(\out_quotient[31]_i_10_n_0 ),
        .O(\out_quotient[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \out_quotient[31]_i_6 
       (.I0(quotient_msk[6]),
        .I1(quotient_msk[5]),
        .I2(quotient_msk[4]),
        .I3(quotient_msk[3]),
        .O(\out_quotient[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \out_quotient[31]_i_7 
       (.I0(quotient_msk[10]),
        .I1(quotient_msk[9]),
        .I2(quotient_msk[8]),
        .I3(quotient_msk[7]),
        .O(\out_quotient[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \out_quotient[31]_i_8 
       (.I0(quotient_msk[11]),
        .I1(quotient_msk[12]),
        .I2(quotient_msk[13]),
        .I3(quotient_msk[14]),
        .I4(quotient_msk[15]),
        .I5(running),
        .O(\out_quotient[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \out_quotient[31]_i_9 
       (.I0(quotient_msk[28]),
        .I1(quotient_msk[29]),
        .I2(quotient_msk[31]),
        .I3(quotient_msk[30]),
        .O(\out_quotient[31]_i_9_n_0 ));
  FDRE \out_quotient_reg[0] 
       (.C(clk),
        .CE(finished),
        .D(quotient[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE \out_quotient_reg[10] 
       (.C(clk),
        .CE(finished),
        .D(quotient[10]),
        .Q(Q[10]),
        .R(SR));
  FDRE \out_quotient_reg[11] 
       (.C(clk),
        .CE(finished),
        .D(quotient[11]),
        .Q(Q[11]),
        .R(SR));
  FDRE \out_quotient_reg[12] 
       (.C(clk),
        .CE(finished),
        .D(quotient[12]),
        .Q(Q[12]),
        .R(SR));
  FDRE \out_quotient_reg[13] 
       (.C(clk),
        .CE(finished),
        .D(quotient[13]),
        .Q(Q[13]),
        .R(SR));
  FDRE \out_quotient_reg[14] 
       (.C(clk),
        .CE(finished),
        .D(quotient[14]),
        .Q(Q[14]),
        .R(SR));
  FDRE \out_quotient_reg[15] 
       (.C(clk),
        .CE(finished),
        .D(quotient[15]),
        .Q(Q[15]),
        .R(SR));
  FDRE \out_quotient_reg[16] 
       (.C(clk),
        .CE(finished),
        .D(quotient[16]),
        .Q(Q[16]),
        .R(SR));
  FDRE \out_quotient_reg[17] 
       (.C(clk),
        .CE(finished),
        .D(quotient[17]),
        .Q(Q[17]),
        .R(SR));
  FDRE \out_quotient_reg[18] 
       (.C(clk),
        .CE(finished),
        .D(quotient[18]),
        .Q(Q[18]),
        .R(SR));
  FDRE \out_quotient_reg[19] 
       (.C(clk),
        .CE(finished),
        .D(quotient[19]),
        .Q(Q[19]),
        .R(SR));
  FDRE \out_quotient_reg[1] 
       (.C(clk),
        .CE(finished),
        .D(quotient[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE \out_quotient_reg[20] 
       (.C(clk),
        .CE(finished),
        .D(quotient[20]),
        .Q(Q[20]),
        .R(SR));
  FDRE \out_quotient_reg[21] 
       (.C(clk),
        .CE(finished),
        .D(quotient[21]),
        .Q(Q[21]),
        .R(SR));
  FDRE \out_quotient_reg[22] 
       (.C(clk),
        .CE(finished),
        .D(quotient[22]),
        .Q(Q[22]),
        .R(SR));
  FDRE \out_quotient_reg[23] 
       (.C(clk),
        .CE(finished),
        .D(quotient[23]),
        .Q(Q[23]),
        .R(SR));
  FDRE \out_quotient_reg[24] 
       (.C(clk),
        .CE(finished),
        .D(quotient[24]),
        .Q(Q[24]),
        .R(SR));
  FDRE \out_quotient_reg[25] 
       (.C(clk),
        .CE(finished),
        .D(quotient[25]),
        .Q(Q[25]),
        .R(SR));
  FDRE \out_quotient_reg[26] 
       (.C(clk),
        .CE(finished),
        .D(quotient[26]),
        .Q(Q[26]),
        .R(SR));
  FDRE \out_quotient_reg[27] 
       (.C(clk),
        .CE(finished),
        .D(quotient[27]),
        .Q(Q[27]),
        .R(SR));
  FDRE \out_quotient_reg[28] 
       (.C(clk),
        .CE(finished),
        .D(quotient[28]),
        .Q(Q[28]),
        .R(SR));
  FDRE \out_quotient_reg[29] 
       (.C(clk),
        .CE(finished),
        .D(quotient[29]),
        .Q(Q[29]),
        .R(SR));
  FDRE \out_quotient_reg[2] 
       (.C(clk),
        .CE(finished),
        .D(quotient[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE \out_quotient_reg[30] 
       (.C(clk),
        .CE(finished),
        .D(quotient[30]),
        .Q(Q[30]),
        .R(SR));
  FDRE \out_quotient_reg[31] 
       (.C(clk),
        .CE(finished),
        .D(quotient[31]),
        .Q(Q[31]),
        .R(SR));
  FDRE \out_quotient_reg[3] 
       (.C(clk),
        .CE(finished),
        .D(quotient[3]),
        .Q(Q[3]),
        .R(SR));
  FDRE \out_quotient_reg[4] 
       (.C(clk),
        .CE(finished),
        .D(quotient[4]),
        .Q(Q[4]),
        .R(SR));
  FDRE \out_quotient_reg[5] 
       (.C(clk),
        .CE(finished),
        .D(quotient[5]),
        .Q(Q[5]),
        .R(SR));
  FDRE \out_quotient_reg[6] 
       (.C(clk),
        .CE(finished),
        .D(quotient[6]),
        .Q(Q[6]),
        .R(SR));
  FDRE \out_quotient_reg[7] 
       (.C(clk),
        .CE(finished),
        .D(quotient[7]),
        .Q(Q[7]),
        .R(SR));
  FDRE \out_quotient_reg[8] 
       (.C(clk),
        .CE(finished),
        .D(quotient[8]),
        .Q(Q[8]),
        .R(SR));
  FDRE \out_quotient_reg[9] 
       (.C(clk),
        .CE(finished),
        .D(quotient[9]),
        .Q(Q[9]),
        .R(SR));
  FDRE \out_remainder_reg[0] 
       (.C(clk),
        .CE(finished),
        .D(dividend[0]),
        .Q(\out_remainder_reg[31]_0 [0]),
        .R(SR));
  FDRE \out_remainder_reg[10] 
       (.C(clk),
        .CE(finished),
        .D(dividend[10]),
        .Q(\out_remainder_reg[31]_0 [10]),
        .R(SR));
  FDRE \out_remainder_reg[11] 
       (.C(clk),
        .CE(finished),
        .D(dividend[11]),
        .Q(\out_remainder_reg[31]_0 [11]),
        .R(SR));
  FDRE \out_remainder_reg[12] 
       (.C(clk),
        .CE(finished),
        .D(dividend[12]),
        .Q(\out_remainder_reg[31]_0 [12]),
        .R(SR));
  FDRE \out_remainder_reg[13] 
       (.C(clk),
        .CE(finished),
        .D(dividend[13]),
        .Q(\out_remainder_reg[31]_0 [13]),
        .R(SR));
  FDRE \out_remainder_reg[14] 
       (.C(clk),
        .CE(finished),
        .D(dividend[14]),
        .Q(\out_remainder_reg[31]_0 [14]),
        .R(SR));
  FDRE \out_remainder_reg[15] 
       (.C(clk),
        .CE(finished),
        .D(dividend[15]),
        .Q(\out_remainder_reg[31]_0 [15]),
        .R(SR));
  FDRE \out_remainder_reg[16] 
       (.C(clk),
        .CE(finished),
        .D(dividend[16]),
        .Q(\out_remainder_reg[31]_0 [16]),
        .R(SR));
  FDRE \out_remainder_reg[17] 
       (.C(clk),
        .CE(finished),
        .D(dividend[17]),
        .Q(\out_remainder_reg[31]_0 [17]),
        .R(SR));
  FDRE \out_remainder_reg[18] 
       (.C(clk),
        .CE(finished),
        .D(dividend[18]),
        .Q(\out_remainder_reg[31]_0 [18]),
        .R(SR));
  FDRE \out_remainder_reg[19] 
       (.C(clk),
        .CE(finished),
        .D(dividend[19]),
        .Q(\out_remainder_reg[31]_0 [19]),
        .R(SR));
  FDRE \out_remainder_reg[1] 
       (.C(clk),
        .CE(finished),
        .D(dividend[1]),
        .Q(\out_remainder_reg[31]_0 [1]),
        .R(SR));
  FDRE \out_remainder_reg[20] 
       (.C(clk),
        .CE(finished),
        .D(dividend[20]),
        .Q(\out_remainder_reg[31]_0 [20]),
        .R(SR));
  FDRE \out_remainder_reg[21] 
       (.C(clk),
        .CE(finished),
        .D(dividend[21]),
        .Q(\out_remainder_reg[31]_0 [21]),
        .R(SR));
  FDRE \out_remainder_reg[22] 
       (.C(clk),
        .CE(finished),
        .D(dividend[22]),
        .Q(\out_remainder_reg[31]_0 [22]),
        .R(SR));
  FDRE \out_remainder_reg[23] 
       (.C(clk),
        .CE(finished),
        .D(dividend[23]),
        .Q(\out_remainder_reg[31]_0 [23]),
        .R(SR));
  FDRE \out_remainder_reg[24] 
       (.C(clk),
        .CE(finished),
        .D(dividend[24]),
        .Q(\out_remainder_reg[31]_0 [24]),
        .R(SR));
  FDRE \out_remainder_reg[25] 
       (.C(clk),
        .CE(finished),
        .D(dividend[25]),
        .Q(\out_remainder_reg[31]_0 [25]),
        .R(SR));
  FDRE \out_remainder_reg[26] 
       (.C(clk),
        .CE(finished),
        .D(dividend[26]),
        .Q(\out_remainder_reg[31]_0 [26]),
        .R(SR));
  FDRE \out_remainder_reg[27] 
       (.C(clk),
        .CE(finished),
        .D(dividend[27]),
        .Q(\out_remainder_reg[31]_0 [27]),
        .R(SR));
  FDRE \out_remainder_reg[28] 
       (.C(clk),
        .CE(finished),
        .D(dividend[28]),
        .Q(\out_remainder_reg[31]_0 [28]),
        .R(SR));
  FDRE \out_remainder_reg[29] 
       (.C(clk),
        .CE(finished),
        .D(dividend[29]),
        .Q(\out_remainder_reg[31]_0 [29]),
        .R(SR));
  FDRE \out_remainder_reg[2] 
       (.C(clk),
        .CE(finished),
        .D(dividend[2]),
        .Q(\out_remainder_reg[31]_0 [2]),
        .R(SR));
  FDRE \out_remainder_reg[30] 
       (.C(clk),
        .CE(finished),
        .D(dividend[30]),
        .Q(\out_remainder_reg[31]_0 [30]),
        .R(SR));
  FDRE \out_remainder_reg[31] 
       (.C(clk),
        .CE(finished),
        .D(dividend[31]),
        .Q(\out_remainder_reg[31]_0 [31]),
        .R(SR));
  FDRE \out_remainder_reg[3] 
       (.C(clk),
        .CE(finished),
        .D(dividend[3]),
        .Q(\out_remainder_reg[31]_0 [3]),
        .R(SR));
  FDRE \out_remainder_reg[4] 
       (.C(clk),
        .CE(finished),
        .D(dividend[4]),
        .Q(\out_remainder_reg[31]_0 [4]),
        .R(SR));
  FDRE \out_remainder_reg[5] 
       (.C(clk),
        .CE(finished),
        .D(dividend[5]),
        .Q(\out_remainder_reg[31]_0 [5]),
        .R(SR));
  FDRE \out_remainder_reg[6] 
       (.C(clk),
        .CE(finished),
        .D(dividend[6]),
        .Q(\out_remainder_reg[31]_0 [6]),
        .R(SR));
  FDRE \out_remainder_reg[7] 
       (.C(clk),
        .CE(finished),
        .D(dividend[7]),
        .Q(\out_remainder_reg[31]_0 [7]),
        .R(SR));
  FDRE \out_remainder_reg[8] 
       (.C(clk),
        .CE(finished),
        .D(dividend[8]),
        .Q(\out_remainder_reg[31]_0 [8]),
        .R(SR));
  FDRE \out_remainder_reg[9] 
       (.C(clk),
        .CE(finished),
        .D(dividend[9]),
        .Q(\out_remainder_reg[31]_0 [9]),
        .R(SR));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient0_carry
       (.CI(\<const1> ),
        .CI_TOP(GND_2),
        .CO({quotient0_carry_n_0,NLW_quotient0_carry_CO_UNCONNECTED[6:0]}),
        .DI({quotient0_carry_i_1_n_0,quotient0_carry_i_2_n_0,quotient0_carry_i_3_n_0,quotient0_carry_i_4_n_0,quotient0_carry_i_5_n_0,quotient0_carry_i_6_n_0,quotient0_carry_i_7_n_0,quotient0_carry_i_8_n_0}),
        .S({quotient0_carry_i_9_n_0,quotient0_carry_i_10_n_0,quotient0_carry_i_11_n_0,quotient0_carry_i_12_n_0,quotient0_carry_i_13_n_0,quotient0_carry_i_14_n_0,quotient0_carry_i_15_n_0,quotient0_carry_i_16_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient0_carry__0
       (.CI(quotient0_carry_n_0),
        .CI_TOP(GND_2),
        .CO({quotient0_carry__0_n_0,NLW_quotient0_carry__0_CO_UNCONNECTED[6:0]}),
        .DI({quotient0_carry__0_i_1_n_0,quotient0_carry__0_i_2_n_0,quotient0_carry__0_i_3_n_0,quotient0_carry__0_i_4_n_0,quotient0_carry__0_i_5_n_0,quotient0_carry__0_i_6_n_0,quotient0_carry__0_i_7_n_0,quotient0_carry__0_i_8_n_0}),
        .S({quotient0_carry__0_i_9_n_0,quotient0_carry__0_i_10_n_0,quotient0_carry__0_i_11_n_0,quotient0_carry__0_i_12_n_0,quotient0_carry__0_i_13_n_0,quotient0_carry__0_i_14_n_0,quotient0_carry__0_i_15_n_0,quotient0_carry__0_i_16_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry__0_i_1
       (.I0(dividend[30]),
        .I1(\divisor_reg_n_0_[30] ),
        .I2(\divisor_reg_n_0_[31] ),
        .I3(dividend[31]),
        .O(quotient0_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry__0_i_10
       (.I0(\divisor_reg_n_0_[29] ),
        .I1(dividend[29]),
        .I2(\divisor_reg_n_0_[28] ),
        .I3(dividend[28]),
        .O(quotient0_carry__0_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry__0_i_11
       (.I0(\divisor_reg_n_0_[27] ),
        .I1(dividend[27]),
        .I2(\divisor_reg_n_0_[26] ),
        .I3(dividend[26]),
        .O(quotient0_carry__0_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry__0_i_12
       (.I0(\divisor_reg_n_0_[25] ),
        .I1(dividend[25]),
        .I2(\divisor_reg_n_0_[24] ),
        .I3(dividend[24]),
        .O(quotient0_carry__0_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry__0_i_13
       (.I0(\divisor_reg_n_0_[23] ),
        .I1(dividend[23]),
        .I2(\divisor_reg_n_0_[22] ),
        .I3(dividend[22]),
        .O(quotient0_carry__0_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry__0_i_14
       (.I0(\divisor_reg_n_0_[21] ),
        .I1(dividend[21]),
        .I2(\divisor_reg_n_0_[20] ),
        .I3(dividend[20]),
        .O(quotient0_carry__0_i_14_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry__0_i_15
       (.I0(\divisor_reg_n_0_[19] ),
        .I1(dividend[19]),
        .I2(\divisor_reg_n_0_[18] ),
        .I3(dividend[18]),
        .O(quotient0_carry__0_i_15_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry__0_i_16
       (.I0(\divisor_reg_n_0_[17] ),
        .I1(dividend[17]),
        .I2(\divisor_reg_n_0_[16] ),
        .I3(dividend[16]),
        .O(quotient0_carry__0_i_16_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry__0_i_2
       (.I0(dividend[28]),
        .I1(\divisor_reg_n_0_[28] ),
        .I2(\divisor_reg_n_0_[29] ),
        .I3(dividend[29]),
        .O(quotient0_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry__0_i_3
       (.I0(dividend[26]),
        .I1(\divisor_reg_n_0_[26] ),
        .I2(\divisor_reg_n_0_[27] ),
        .I3(dividend[27]),
        .O(quotient0_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry__0_i_4
       (.I0(dividend[24]),
        .I1(\divisor_reg_n_0_[24] ),
        .I2(\divisor_reg_n_0_[25] ),
        .I3(dividend[25]),
        .O(quotient0_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry__0_i_5
       (.I0(dividend[22]),
        .I1(\divisor_reg_n_0_[22] ),
        .I2(\divisor_reg_n_0_[23] ),
        .I3(dividend[23]),
        .O(quotient0_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry__0_i_6
       (.I0(dividend[20]),
        .I1(\divisor_reg_n_0_[20] ),
        .I2(\divisor_reg_n_0_[21] ),
        .I3(dividend[21]),
        .O(quotient0_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry__0_i_7
       (.I0(dividend[18]),
        .I1(\divisor_reg_n_0_[18] ),
        .I2(\divisor_reg_n_0_[19] ),
        .I3(dividend[19]),
        .O(quotient0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry__0_i_8
       (.I0(dividend[16]),
        .I1(\divisor_reg_n_0_[16] ),
        .I2(\divisor_reg_n_0_[17] ),
        .I3(dividend[17]),
        .O(quotient0_carry__0_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry__0_i_9
       (.I0(\divisor_reg_n_0_[31] ),
        .I1(dividend[31]),
        .I2(\divisor_reg_n_0_[30] ),
        .I3(dividend[30]),
        .O(quotient0_carry__0_i_9_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient0_carry__1
       (.CI(quotient0_carry__0_n_0),
        .CI_TOP(GND_2),
        .CO({quotient0_carry__1_n_0,NLW_quotient0_carry__1_CO_UNCONNECTED[6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({quotient0_carry__1_i_1_n_0,quotient0_carry__1_i_2_n_0,quotient0_carry__1_i_3_n_0,quotient0_carry__1_i_4_n_0,quotient0_carry__1_i_5_n_0,quotient0_carry__1_i_6_n_0,quotient0_carry__1_i_7_n_0,quotient0_carry__1_i_8_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__1_i_1
       (.I0(\divisor_reg_n_0_[47] ),
        .I1(\divisor_reg_n_0_[46] ),
        .O(quotient0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__1_i_2
       (.I0(\divisor_reg_n_0_[45] ),
        .I1(\divisor_reg_n_0_[44] ),
        .O(quotient0_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__1_i_3
       (.I0(\divisor_reg_n_0_[43] ),
        .I1(\divisor_reg_n_0_[42] ),
        .O(quotient0_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__1_i_4
       (.I0(\divisor_reg_n_0_[41] ),
        .I1(\divisor_reg_n_0_[40] ),
        .O(quotient0_carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__1_i_5
       (.I0(\divisor_reg_n_0_[39] ),
        .I1(\divisor_reg_n_0_[38] ),
        .O(quotient0_carry__1_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__1_i_6
       (.I0(\divisor_reg_n_0_[37] ),
        .I1(\divisor_reg_n_0_[36] ),
        .O(quotient0_carry__1_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__1_i_7
       (.I0(\divisor_reg_n_0_[35] ),
        .I1(\divisor_reg_n_0_[34] ),
        .O(quotient0_carry__1_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__1_i_8
       (.I0(\divisor_reg_n_0_[33] ),
        .I1(\divisor_reg_n_0_[32] ),
        .O(quotient0_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient0_carry__2
       (.CI(quotient0_carry__1_n_0),
        .CI_TOP(GND_2),
        .CO({quotient0_carry__2_n_0,NLW_quotient0_carry__2_CO_UNCONNECTED[6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({quotient0_carry__2_i_1_n_0,quotient0_carry__2_i_2_n_0,quotient0_carry__2_i_3_n_0,quotient0_carry__2_i_4_n_0,quotient0_carry__2_i_5_n_0,quotient0_carry__2_i_6_n_0,quotient0_carry__2_i_7_n_0,quotient0_carry__2_i_8_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    quotient0_carry__2_i_1
       (.I0(\divisor_reg_n_0_[62] ),
        .O(quotient0_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__2_i_2
       (.I0(\divisor_reg_n_0_[61] ),
        .I1(\divisor_reg_n_0_[60] ),
        .O(quotient0_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__2_i_3
       (.I0(\divisor_reg_n_0_[59] ),
        .I1(\divisor_reg_n_0_[58] ),
        .O(quotient0_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__2_i_4
       (.I0(\divisor_reg_n_0_[57] ),
        .I1(\divisor_reg_n_0_[56] ),
        .O(quotient0_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__2_i_5
       (.I0(\divisor_reg_n_0_[55] ),
        .I1(\divisor_reg_n_0_[54] ),
        .O(quotient0_carry__2_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__2_i_6
       (.I0(\divisor_reg_n_0_[53] ),
        .I1(\divisor_reg_n_0_[52] ),
        .O(quotient0_carry__2_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__2_i_7
       (.I0(\divisor_reg_n_0_[51] ),
        .I1(\divisor_reg_n_0_[50] ),
        .O(quotient0_carry__2_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    quotient0_carry__2_i_8
       (.I0(\divisor_reg_n_0_[49] ),
        .I1(\divisor_reg_n_0_[48] ),
        .O(quotient0_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry_i_1
       (.I0(dividend[14]),
        .I1(\divisor_reg_n_0_[14] ),
        .I2(\divisor_reg_n_0_[15] ),
        .I3(dividend[15]),
        .O(quotient0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry_i_10
       (.I0(\divisor_reg_n_0_[13] ),
        .I1(dividend[13]),
        .I2(\divisor_reg_n_0_[12] ),
        .I3(dividend[12]),
        .O(quotient0_carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry_i_11
       (.I0(\divisor_reg_n_0_[11] ),
        .I1(dividend[11]),
        .I2(\divisor_reg_n_0_[10] ),
        .I3(dividend[10]),
        .O(quotient0_carry_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry_i_12
       (.I0(\divisor_reg_n_0_[9] ),
        .I1(dividend[9]),
        .I2(\divisor_reg_n_0_[8] ),
        .I3(dividend[8]),
        .O(quotient0_carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry_i_13
       (.I0(\divisor_reg_n_0_[7] ),
        .I1(dividend[7]),
        .I2(\divisor_reg_n_0_[6] ),
        .I3(dividend[6]),
        .O(quotient0_carry_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry_i_14
       (.I0(\divisor_reg_n_0_[5] ),
        .I1(dividend[5]),
        .I2(\divisor_reg_n_0_[4] ),
        .I3(dividend[4]),
        .O(quotient0_carry_i_14_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry_i_15
       (.I0(\divisor_reg_n_0_[3] ),
        .I1(dividend[3]),
        .I2(\divisor_reg_n_0_[2] ),
        .I3(dividend[2]),
        .O(quotient0_carry_i_15_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry_i_16
       (.I0(\divisor_reg_n_0_[1] ),
        .I1(dividend[1]),
        .I2(\divisor_reg_n_0_[0] ),
        .I3(dividend[0]),
        .O(quotient0_carry_i_16_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry_i_2
       (.I0(dividend[12]),
        .I1(\divisor_reg_n_0_[12] ),
        .I2(\divisor_reg_n_0_[13] ),
        .I3(dividend[13]),
        .O(quotient0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry_i_3
       (.I0(dividend[10]),
        .I1(\divisor_reg_n_0_[10] ),
        .I2(\divisor_reg_n_0_[11] ),
        .I3(dividend[11]),
        .O(quotient0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry_i_4
       (.I0(dividend[8]),
        .I1(\divisor_reg_n_0_[8] ),
        .I2(\divisor_reg_n_0_[9] ),
        .I3(dividend[9]),
        .O(quotient0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry_i_5
       (.I0(dividend[6]),
        .I1(\divisor_reg_n_0_[6] ),
        .I2(\divisor_reg_n_0_[7] ),
        .I3(dividend[7]),
        .O(quotient0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry_i_6
       (.I0(dividend[4]),
        .I1(\divisor_reg_n_0_[4] ),
        .I2(\divisor_reg_n_0_[5] ),
        .I3(dividend[5]),
        .O(quotient0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry_i_7
       (.I0(dividend[2]),
        .I1(\divisor_reg_n_0_[2] ),
        .I2(\divisor_reg_n_0_[3] ),
        .I3(dividend[3]),
        .O(quotient0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    quotient0_carry_i_8
       (.I0(dividend[0]),
        .I1(\divisor_reg_n_0_[0] ),
        .I2(\divisor_reg_n_0_[1] ),
        .I3(dividend[1]),
        .O(quotient0_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    quotient0_carry_i_9
       (.I0(\divisor_reg_n_0_[15] ),
        .I1(dividend[15]),
        .I2(\divisor_reg_n_0_[14] ),
        .I3(dividend[14]),
        .O(quotient0_carry_i_9_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[0]_i_1__0 
       (.I0(quotient[0]),
        .I1(quotient_msk[0]),
        .O(\quotient[0]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[10]_i_1 
       (.I0(quotient[10]),
        .I1(quotient_msk[10]),
        .O(\quotient[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[11]_i_1 
       (.I0(quotient[11]),
        .I1(quotient_msk[11]),
        .O(\quotient[11]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[12]_i_1 
       (.I0(quotient[12]),
        .I1(quotient_msk[12]),
        .O(\quotient[12]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[13]_i_1 
       (.I0(quotient[13]),
        .I1(quotient_msk[13]),
        .O(\quotient[13]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[14]_i_1 
       (.I0(quotient[14]),
        .I1(quotient_msk[14]),
        .O(\quotient[14]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[15]_i_1 
       (.I0(quotient[15]),
        .I1(quotient_msk[15]),
        .O(\quotient[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[16]_i_1 
       (.I0(quotient[16]),
        .I1(quotient_msk[16]),
        .O(\quotient[16]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[17]_i_1 
       (.I0(quotient[17]),
        .I1(quotient_msk[17]),
        .O(\quotient[17]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[18]_i_1 
       (.I0(quotient[18]),
        .I1(quotient_msk[18]),
        .O(\quotient[18]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[19]_i_1 
       (.I0(quotient[19]),
        .I1(quotient_msk[19]),
        .O(\quotient[19]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[1]_i_1__0 
       (.I0(quotient[1]),
        .I1(quotient_msk[1]),
        .O(\quotient[1]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[20]_i_1 
       (.I0(quotient[20]),
        .I1(quotient_msk[20]),
        .O(\quotient[20]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[21]_i_1 
       (.I0(quotient[21]),
        .I1(quotient_msk[21]),
        .O(\quotient[21]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[22]_i_1 
       (.I0(quotient[22]),
        .I1(quotient_msk[22]),
        .O(\quotient[22]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[23]_i_1 
       (.I0(quotient[23]),
        .I1(quotient_msk[23]),
        .O(\quotient[23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[24]_i_1 
       (.I0(quotient[24]),
        .I1(quotient_msk[24]),
        .O(\quotient[24]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[25]_i_1 
       (.I0(quotient[25]),
        .I1(quotient_msk[25]),
        .O(\quotient[25]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[26]_i_1 
       (.I0(quotient[26]),
        .I1(quotient_msk[26]),
        .O(\quotient[26]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[27]_i_1 
       (.I0(quotient[27]),
        .I1(quotient_msk[27]),
        .O(\quotient[27]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[28]_i_1 
       (.I0(quotient[28]),
        .I1(quotient_msk[28]),
        .O(\quotient[28]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[29]_i_1 
       (.I0(quotient[29]),
        .I1(quotient_msk[29]),
        .O(\quotient[29]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[2]_i_1__0 
       (.I0(quotient[2]),
        .I1(quotient_msk[2]),
        .O(\quotient[2]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[30]_i_1 
       (.I0(quotient[30]),
        .I1(quotient_msk[30]),
        .O(\quotient[30]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[31]_i_1 
       (.I0(quotient[31]),
        .I1(quotient_msk[31]),
        .O(\quotient[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[3]_i_1__0 
       (.I0(quotient[3]),
        .I1(quotient_msk[3]),
        .O(\quotient[3]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[4]_i_1 
       (.I0(quotient[4]),
        .I1(quotient_msk[4]),
        .O(\quotient[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[5]_i_1 
       (.I0(quotient[5]),
        .I1(quotient_msk[5]),
        .O(\quotient[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[6]_i_1 
       (.I0(quotient[6]),
        .I1(quotient_msk[6]),
        .O(\quotient[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[7]_i_1 
       (.I0(quotient[7]),
        .I1(quotient_msk[7]),
        .O(\quotient[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[8]_i_1 
       (.I0(quotient[8]),
        .I1(quotient_msk[8]),
        .O(\quotient[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \quotient[9]_i_1 
       (.I0(quotient[9]),
        .I1(quotient_msk[9]),
        .O(\quotient[9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h01110000)) 
    \quotient_msk[31]_i_1 
       (.I0(running),
        .I1(div_done),
        .I2(unsigned_div_done),
        .I3(unsigned_mod_done),
        .I4(\quotient_msk_reg[31]_0 ),
        .O(p_0_in));
  FDRE \quotient_msk_reg[0] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[1]),
        .Q(quotient_msk[0]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[10] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[11]),
        .Q(quotient_msk[10]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[11] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[12]),
        .Q(quotient_msk[11]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[12] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[13]),
        .Q(quotient_msk[12]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[13] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[14]),
        .Q(quotient_msk[13]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[14] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[15]),
        .Q(quotient_msk[14]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[15] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[16]),
        .Q(quotient_msk[15]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[16] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[17]),
        .Q(quotient_msk[16]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[17] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[18]),
        .Q(quotient_msk[17]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[18] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[19]),
        .Q(quotient_msk[18]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[19] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[20]),
        .Q(quotient_msk[19]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[1] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[2]),
        .Q(quotient_msk[1]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[20] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[21]),
        .Q(quotient_msk[20]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[21] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[22]),
        .Q(quotient_msk[21]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[22] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[23]),
        .Q(quotient_msk[22]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[23] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[24]),
        .Q(quotient_msk[23]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[24] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[25]),
        .Q(quotient_msk[24]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[25] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[26]),
        .Q(quotient_msk[25]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[26] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[27]),
        .Q(quotient_msk[26]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[27] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[28]),
        .Q(quotient_msk[27]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[28] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[29]),
        .Q(quotient_msk[28]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[29] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[30]),
        .Q(quotient_msk[29]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[2] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[3]),
        .Q(quotient_msk[2]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[30] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[31]),
        .Q(quotient_msk[30]),
        .R(p_0_in));
  FDSE \quotient_msk_reg[31] 
       (.C(clk),
        .CE(running),
        .D(\<const0> ),
        .Q(quotient_msk[31]),
        .S(p_0_in));
  FDRE \quotient_msk_reg[3] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[4]),
        .Q(quotient_msk[3]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[4] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[5]),
        .Q(quotient_msk[4]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[5] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[6]),
        .Q(quotient_msk[5]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[6] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[7]),
        .Q(quotient_msk[6]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[7] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[8]),
        .Q(quotient_msk[7]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[8] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[9]),
        .Q(quotient_msk[8]),
        .R(p_0_in));
  FDRE \quotient_msk_reg[9] 
       (.C(clk),
        .CE(running),
        .D(quotient_msk[10]),
        .Q(quotient_msk[9]),
        .R(p_0_in));
  FDRE \quotient_reg[0] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[0]_i_1__0_n_0 ),
        .Q(quotient[0]),
        .R(p_0_in));
  FDRE \quotient_reg[10] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[10]_i_1_n_0 ),
        .Q(quotient[10]),
        .R(p_0_in));
  FDRE \quotient_reg[11] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[11]_i_1_n_0 ),
        .Q(quotient[11]),
        .R(p_0_in));
  FDRE \quotient_reg[12] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[12]_i_1_n_0 ),
        .Q(quotient[12]),
        .R(p_0_in));
  FDRE \quotient_reg[13] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[13]_i_1_n_0 ),
        .Q(quotient[13]),
        .R(p_0_in));
  FDRE \quotient_reg[14] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[14]_i_1_n_0 ),
        .Q(quotient[14]),
        .R(p_0_in));
  FDRE \quotient_reg[15] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[15]_i_1_n_0 ),
        .Q(quotient[15]),
        .R(p_0_in));
  FDRE \quotient_reg[16] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[16]_i_1_n_0 ),
        .Q(quotient[16]),
        .R(p_0_in));
  FDRE \quotient_reg[17] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[17]_i_1_n_0 ),
        .Q(quotient[17]),
        .R(p_0_in));
  FDRE \quotient_reg[18] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[18]_i_1_n_0 ),
        .Q(quotient[18]),
        .R(p_0_in));
  FDRE \quotient_reg[19] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[19]_i_1_n_0 ),
        .Q(quotient[19]),
        .R(p_0_in));
  FDRE \quotient_reg[1] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[1]_i_1__0_n_0 ),
        .Q(quotient[1]),
        .R(p_0_in));
  FDRE \quotient_reg[20] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[20]_i_1_n_0 ),
        .Q(quotient[20]),
        .R(p_0_in));
  FDRE \quotient_reg[21] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[21]_i_1_n_0 ),
        .Q(quotient[21]),
        .R(p_0_in));
  FDRE \quotient_reg[22] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[22]_i_1_n_0 ),
        .Q(quotient[22]),
        .R(p_0_in));
  FDRE \quotient_reg[23] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[23]_i_1_n_0 ),
        .Q(quotient[23]),
        .R(p_0_in));
  FDRE \quotient_reg[24] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[24]_i_1_n_0 ),
        .Q(quotient[24]),
        .R(p_0_in));
  FDRE \quotient_reg[25] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[25]_i_1_n_0 ),
        .Q(quotient[25]),
        .R(p_0_in));
  FDRE \quotient_reg[26] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[26]_i_1_n_0 ),
        .Q(quotient[26]),
        .R(p_0_in));
  FDRE \quotient_reg[27] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[27]_i_1_n_0 ),
        .Q(quotient[27]),
        .R(p_0_in));
  FDRE \quotient_reg[28] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[28]_i_1_n_0 ),
        .Q(quotient[28]),
        .R(p_0_in));
  FDRE \quotient_reg[29] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[29]_i_1_n_0 ),
        .Q(quotient[29]),
        .R(p_0_in));
  FDRE \quotient_reg[2] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[2]_i_1__0_n_0 ),
        .Q(quotient[2]),
        .R(p_0_in));
  FDRE \quotient_reg[30] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[30]_i_1_n_0 ),
        .Q(quotient[30]),
        .R(p_0_in));
  FDRE \quotient_reg[31] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[31]_i_1_n_0 ),
        .Q(quotient[31]),
        .R(p_0_in));
  FDRE \quotient_reg[3] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[3]_i_1__0_n_0 ),
        .Q(quotient[3]),
        .R(p_0_in));
  FDRE \quotient_reg[4] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[4]_i_1_n_0 ),
        .Q(quotient[4]),
        .R(p_0_in));
  FDRE \quotient_reg[5] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[5]_i_1_n_0 ),
        .Q(quotient[5]),
        .R(p_0_in));
  FDRE \quotient_reg[6] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[6]_i_1_n_0 ),
        .Q(quotient[6]),
        .R(p_0_in));
  FDRE \quotient_reg[7] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[7]_i_1_n_0 ),
        .Q(quotient[7]),
        .R(p_0_in));
  FDRE \quotient_reg[8] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[8]_i_1_n_0 ),
        .Q(quotient[8]),
        .R(p_0_in));
  FDRE \quotient_reg[9] 
       (.C(clk),
        .CE(quotient0_carry__2_n_0),
        .D(\quotient[9]_i_1_n_0 ),
        .Q(quotient[9]),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000054)) 
    running_i_1__0
       (.I0(finished),
        .I1(running),
        .I2(p_0_in),
        .I3(reset),
        .I4(dividend_is_zero__31),
        .O(running_i_1__0_n_0));
  FDRE running_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(running_i_1__0_n_0),
        .Q(running),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    unsigned_mod_write_en_INST_0
       (.I0(div_done),
        .I1(do_unsigned_div_mod_go_in),
        .O(unsigned_div_write_en));
endmodule

module std_fp_mult_pipe
   (smul_done,
    signed_mul_write_data,
    clk,
    do_signed_mul_go_in,
    reset,
    D,
    \ltmp_reg[3]_0 ,
    E);
  output smul_done;
  output [3:0]signed_mul_write_data;
  input clk;
  input do_signed_mul_go_in;
  input reset;
  input [3:0]D;
  input [3:0]\ltmp_reg[3]_0 ;
  input [0:0]E;

  wire \<const0> ;
  wire \<const1> ;
  wire [3:0]D;
  wire [0:0]E;
  wire clk;
  wire do_signed_mul_go_in;
  wire \done_buf[1]_i_1_n_0 ;
  wire \done_buf_reg_n_0_[0] ;
  wire \done_buf_reg_n_0_[1] ;
  wire [3:0]ltmp;
  wire [3:0]\ltmp_reg[3]_0 ;
  wire \out_tmp[0]_i_1_n_0 ;
  wire \out_tmp[1]_i_1_n_0 ;
  wire \out_tmp[2]_i_1_n_0 ;
  wire \out_tmp[3]_i_2_n_0 ;
  wire \out_tmp[3]_i_3_n_0 ;
  wire \out_tmp[3]_i_4_n_0 ;
  wire \out_tmp[3]_i_5_n_0 ;
  wire reset;
  wire [3:0]rtmp;
  wire [3:0]signed_mul_write_data;
  wire smul_done;
  wire [3:0]smul_out;
  wire start;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair236" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \done_buf[0]_i_1 
       (.I0(\done_buf_reg_n_0_[0] ),
        .I1(\done_buf_reg_n_0_[1] ),
        .I2(smul_done),
        .I3(do_signed_mul_go_in),
        .O(start));
  LUT2 #(
    .INIT(4'hB)) 
    \done_buf[1]_i_1 
       (.I0(smul_done),
        .I1(do_signed_mul_go_in),
        .O(\done_buf[1]_i_1_n_0 ));
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
        .R(\done_buf[1]_i_1_n_0 ));
  FDRE \done_buf_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\done_buf_reg_n_0_[1] ),
        .Q(smul_done),
        .R(\done_buf[1]_i_1_n_0 ));
  FDRE \ltmp_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\ltmp_reg[3]_0 [0]),
        .Q(ltmp[0]),
        .R(reset));
  FDRE \ltmp_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\ltmp_reg[3]_0 [1]),
        .Q(ltmp[1]),
        .R(reset));
  FDRE \ltmp_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\ltmp_reg[3]_0 [2]),
        .Q(ltmp[2]),
        .R(reset));
  FDRE \ltmp_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\ltmp_reg[3]_0 [3]),
        .Q(ltmp[3]),
        .R(reset));
  LUT2 #(
    .INIT(4'h8)) 
    \out_tmp[0]_i_1 
       (.I0(ltmp[0]),
        .I1(rtmp[0]),
        .O(\out_tmp[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \out_tmp[1]_i_1 
       (.I0(rtmp[0]),
        .I1(ltmp[1]),
        .I2(rtmp[1]),
        .I3(ltmp[0]),
        .O(\out_tmp[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4777B88878887888)) 
    \out_tmp[2]_i_1 
       (.I0(ltmp[2]),
        .I1(rtmp[0]),
        .I2(rtmp[1]),
        .I3(ltmp[1]),
        .I4(rtmp[2]),
        .I5(ltmp[0]),
        .O(\out_tmp[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h69CC66CC96339933)) 
    \out_tmp[3]_i_2 
       (.I0(rtmp[3]),
        .I1(\out_tmp[3]_i_3_n_0 ),
        .I2(\out_tmp[3]_i_4_n_0 ),
        .I3(ltmp[0]),
        .I4(rtmp[2]),
        .I5(\out_tmp[3]_i_5_n_0 ),
        .O(\out_tmp[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7888877787778777)) 
    \out_tmp[3]_i_3 
       (.I0(rtmp[0]),
        .I1(ltmp[3]),
        .I2(ltmp[1]),
        .I3(rtmp[2]),
        .I4(ltmp[2]),
        .I5(rtmp[1]),
        .O(\out_tmp[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \out_tmp[3]_i_4 
       (.I0(ltmp[1]),
        .I1(rtmp[1]),
        .O(\out_tmp[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h88A8800080008000)) 
    \out_tmp[3]_i_5 
       (.I0(rtmp[0]),
        .I1(ltmp[2]),
        .I2(ltmp[0]),
        .I3(rtmp[2]),
        .I4(ltmp[1]),
        .I5(rtmp[1]),
        .O(\out_tmp[3]_i_5_n_0 ));
  FDRE \out_tmp_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\out_tmp[0]_i_1_n_0 ),
        .Q(smul_out[0]),
        .R(reset));
  FDRE \out_tmp_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\out_tmp[1]_i_1_n_0 ),
        .Q(smul_out[1]),
        .R(reset));
  FDRE \out_tmp_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\out_tmp[2]_i_1_n_0 ),
        .Q(smul_out[2]),
        .R(reset));
  FDRE \out_tmp_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\out_tmp[3]_i_2_n_0 ),
        .Q(smul_out[3]),
        .R(reset));
  FDRE \rtmp_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(D[0]),
        .Q(rtmp[0]),
        .R(reset));
  FDRE \rtmp_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(D[1]),
        .Q(rtmp[1]),
        .R(reset));
  FDRE \rtmp_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(D[2]),
        .Q(rtmp[2]),
        .R(reset));
  FDRE \rtmp_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(D[3]),
        .Q(rtmp[3]),
        .R(reset));
  (* SOFT_HLUTNM = "soft_lutpair236" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \signed_mul_write_data[0]_INST_0 
       (.I0(smul_out[0]),
        .I1(do_signed_mul_go_in),
        .O(signed_mul_write_data[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \signed_mul_write_data[1]_INST_0 
       (.I0(smul_out[1]),
        .I1(do_signed_mul_go_in),
        .O(signed_mul_write_data[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \signed_mul_write_data[2]_INST_0 
       (.I0(smul_out[2]),
        .I1(do_signed_mul_go_in),
        .O(signed_mul_write_data[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \signed_mul_write_data[3]_INST_0 
       (.I0(smul_out[3]),
        .I1(do_signed_mul_go_in),
        .O(signed_mul_write_data[3]));
endmodule

(* ORIG_REF_NAME = "std_fp_mult_pipe" *) 
module std_fp_mult_pipe__parameterized0
   (\done_buf_reg[2]_0 ,
    out_tmp_reg_0,
    Q,
    clk,
    E,
    reset,
    do_unsigned_mul_go_in,
    rhs_read_data,
    lhs_read_data);
  output \done_buf_reg[2]_0 ;
  output [15:0]out_tmp_reg_0;
  output [15:0]Q;
  input clk;
  input [0:0]E;
  input reset;
  input do_unsigned_mul_go_in;
  input [31:0]rhs_read_data;
  input [31:0]lhs_read_data;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]E;
  wire GND_2;
  wire [15:0]Q;
  wire VCC_2;
  wire clk;
  wire do_unsigned_mul_go_in;
  wire \done_buf[1]_i_1__0_n_0 ;
  wire \done_buf_reg[2]_0 ;
  wire \done_buf_reg_n_0_[0] ;
  wire \done_buf_reg_n_0_[1] ;
  wire [31:0]lhs_read_data;
  wire out0__0_i_10_n_0;
  wire out0__0_i_11_n_0;
  wire out0__0_i_12_n_0;
  wire out0__0_i_13_n_0;
  wire out0__0_i_14_n_0;
  wire out0__0_i_15_n_0;
  wire out0__0_i_16_n_0;
  wire out0__0_i_17_n_0;
  wire out0__0_i_1_n_0;
  wire out0__0_i_2_n_0;
  wire out0__0_i_3_n_0;
  wire out0__0_i_4_n_0;
  wire out0__0_i_5_n_0;
  wire out0__0_i_6_n_0;
  wire out0__0_i_7_n_0;
  wire out0__0_i_8_n_0;
  wire out0__0_i_9_n_0;
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
  wire out0_carry__0_i_1_n_0;
  wire out0_carry__0_i_2_n_0;
  wire out0_carry__0_i_3_n_0;
  wire out0_carry__0_i_4_n_0;
  wire out0_carry__0_i_5_n_0;
  wire out0_carry__0_i_6_n_0;
  wire out0_carry__0_i_7_n_0;
  wire out0_carry__0_i_8_n_0;
  wire out0_carry_i_1_n_0;
  wire out0_carry_i_2_n_0;
  wire out0_carry_i_3_n_0;
  wire out0_carry_i_4_n_0;
  wire out0_carry_i_5_n_0;
  wire out0_carry_i_6_n_0;
  wire out0_carry_i_7_n_0;
  wire out0_carry_n_0;
  wire out0_i_10_n_0;
  wire out0_i_11_n_0;
  wire out0_i_12_n_0;
  wire out0_i_13_n_0;
  wire out0_i_14_n_0;
  wire out0_i_15_n_0;
  wire out0_i_16_n_0;
  wire out0_i_17_n_0;
  wire out0_i_18_n_0;
  wire out0_i_19_n_0;
  wire out0_i_20_n_0;
  wire out0_i_21_n_0;
  wire out0_i_22_n_0;
  wire out0_i_23_n_0;
  wire out0_i_24_n_0;
  wire out0_i_25_n_0;
  wire out0_i_26_n_0;
  wire out0_i_27_n_0;
  wire out0_i_28_n_0;
  wire out0_i_29_n_0;
  wire out0_i_2_n_0;
  wire out0_i_30_n_0;
  wire out0_i_31_n_0;
  wire out0_i_32_n_0;
  wire out0_i_33_n_0;
  wire out0_i_3_n_0;
  wire out0_i_4_n_0;
  wire out0_i_5_n_0;
  wire out0_i_6_n_0;
  wire out0_i_7_n_0;
  wire out0_i_8_n_0;
  wire out0_i_9_n_0;
  wire out0_n_100;
  wire out0_n_101;
  wire out0_n_102;
  wire out0_n_103;
  wire out0_n_104;
  wire out0_n_105;
  wire out0_n_91;
  wire out0_n_92;
  wire out0_n_93;
  wire out0_n_94;
  wire out0_n_95;
  wire out0_n_96;
  wire out0_n_97;
  wire out0_n_98;
  wire out0_n_99;
  wire \out_tmp_reg[16]__0_n_0 ;
  wire [15:0]out_tmp_reg_0;
  wire out_tmp_reg_i_10_n_0;
  wire out_tmp_reg_i_11_n_0;
  wire out_tmp_reg_i_12_n_0;
  wire out_tmp_reg_i_13_n_0;
  wire out_tmp_reg_i_14_n_0;
  wire out_tmp_reg_i_15_n_0;
  wire out_tmp_reg_i_1_n_0;
  wire out_tmp_reg_i_2_n_0;
  wire out_tmp_reg_i_3_n_0;
  wire out_tmp_reg_i_4_n_0;
  wire out_tmp_reg_i_5_n_0;
  wire out_tmp_reg_i_6_n_0;
  wire out_tmp_reg_i_7_n_0;
  wire out_tmp_reg_i_8_n_0;
  wire out_tmp_reg_i_9_n_0;
  wire out_tmp_reg_n_100;
  wire out_tmp_reg_n_101;
  wire out_tmp_reg_n_102;
  wire out_tmp_reg_n_103;
  wire out_tmp_reg_n_104;
  wire out_tmp_reg_n_105;
  wire out_tmp_reg_n_91;
  wire out_tmp_reg_n_92;
  wire out_tmp_reg_n_93;
  wire out_tmp_reg_n_94;
  wire out_tmp_reg_n_95;
  wire out_tmp_reg_n_96;
  wire out_tmp_reg_n_97;
  wire out_tmp_reg_n_98;
  wire out_tmp_reg_n_99;
  wire reset;
  wire [31:0]rhs_read_data;
  wire start;
  wire [7:0]NLW_out0_carry_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  VCC VCC
       (.P(\<const1> ));
  VCC VCC_1
       (.P(VCC_2));
  LUT4 #(
    .INIT(16'h0100)) 
    \done_buf[0]_i_1__0 
       (.I0(\done_buf_reg_n_0_[0] ),
        .I1(\done_buf_reg_n_0_[1] ),
        .I2(\done_buf_reg[2]_0 ),
        .I3(do_unsigned_mul_go_in),
        .O(start));
  LUT2 #(
    .INIT(4'hB)) 
    \done_buf[1]_i_1__0 
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .O(\done_buf[1]_i_1__0_n_0 ));
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
        .R(\done_buf[1]_i_1__0_n_0 ));
  FDRE \done_buf_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\done_buf_reg_n_0_[1] ),
        .Q(\done_buf_reg[2]_0 ),
        .R(\done_buf[1]_i_1__0_n_0 ));
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
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,out0_i_17_n_0,out0_i_18_n_0,out0_i_19_n_0,out0_i_20_n_0,out0_i_21_n_0,out0_i_22_n_0,out0_i_23_n_0,out0_i_24_n_0,out0_i_25_n_0,out0_i_26_n_0,out0_i_27_n_0,out0_i_28_n_0,out0_i_29_n_0,out0_i_30_n_0,out0_i_31_n_0,out0_i_32_n_0,out0_i_33_n_0}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,out0_i_2_n_0,out0_i_3_n_0,out0_i_4_n_0,out0_i_5_n_0,out0_i_6_n_0,out0_i_7_n_0,out0_i_8_n_0,out0_i_9_n_0,out0_i_10_n_0,out0_i_11_n_0,out0_i_12_n_0,out0_i_13_n_0,out0_i_14_n_0,out0_i_15_n_0,out0_i_16_n_0}),
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
        .P({out0_n_91,out0_n_92,out0_n_93,out0_n_94,out0_n_95,out0_n_96,out0_n_97,out0_n_98,out0_n_99,out0_n_100,out0_n_101,out0_n_102,out0_n_103,out0_n_104,out0_n_105}),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
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
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,out0__0_i_1_n_0,out0__0_i_2_n_0,out0__0_i_3_n_0,out0__0_i_4_n_0,out0__0_i_5_n_0,out0__0_i_6_n_0,out0__0_i_7_n_0,out0__0_i_8_n_0,out0__0_i_9_n_0,out0__0_i_10_n_0,out0__0_i_11_n_0,out0__0_i_12_n_0,out0__0_i_13_n_0,out0__0_i_14_n_0,out0__0_i_15_n_0,out0__0_i_16_n_0,out0__0_i_17_n_0}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ACOUT({out0__0_n_24,out0__0_n_25,out0__0_n_26,out0__0_n_27,out0__0_n_28,out0__0_n_29,out0__0_n_30,out0__0_n_31,out0__0_n_32,out0__0_n_33,out0__0_n_34,out0__0_n_35,out0__0_n_36,out0__0_n_37,out0__0_n_38,out0__0_n_39,out0__0_n_40,out0__0_n_41,out0__0_n_42,out0__0_n_43,out0__0_n_44,out0__0_n_45,out0__0_n_46,out0__0_n_47,out0__0_n_48,out0__0_n_49,out0__0_n_50,out0__0_n_51,out0__0_n_52,out0__0_n_53}),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,out0_i_17_n_0,out0_i_18_n_0,out0_i_19_n_0,out0_i_20_n_0,out0_i_21_n_0,out0_i_22_n_0,out0_i_23_n_0,out0_i_24_n_0,out0_i_25_n_0,out0_i_26_n_0,out0_i_27_n_0,out0_i_28_n_0,out0_i_29_n_0,out0_i_30_n_0,out0_i_31_n_0,out0_i_32_n_0,out0_i_33_n_0}),
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
        .P({out0__0_n_89,out0__0_n_90,out0__0_n_91,out0__0_n_92,out0__0_n_93,out0__0_n_94,out0__0_n_95,out0__0_n_96,out0__0_n_97,out0__0_n_98,out0__0_n_99,out0__0_n_100,out0__0_n_101,out0__0_n_102,out0__0_n_103,out0__0_n_104,out0__0_n_105}),
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
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_1
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[16]),
        .O(out0__0_i_1_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_10
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[7]),
        .O(out0__0_i_10_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_11
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[6]),
        .O(out0__0_i_11_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_12
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[5]),
        .O(out0__0_i_12_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_13
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[4]),
        .O(out0__0_i_13_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_14
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[3]),
        .O(out0__0_i_14_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_15
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[2]),
        .O(out0__0_i_15_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_16
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[1]),
        .O(out0__0_i_16_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_17
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[0]),
        .O(out0__0_i_17_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_2
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[15]),
        .O(out0__0_i_2_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_3
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[14]),
        .O(out0__0_i_3_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_4
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[13]),
        .O(out0__0_i_4_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_5
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[12]),
        .O(out0__0_i_5_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_6
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[11]),
        .O(out0__0_i_6_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_7
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[10]),
        .O(out0__0_i_7_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_8
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[9]),
        .O(out0__0_i_8_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0__0_i_9
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[8]),
        .O(out0__0_i_9_n_0));
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY8 out0_carry
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({out0_carry_n_0,NLW_out0_carry_CO_UNCONNECTED[6:0]}),
        .DI({out_tmp_reg_n_99,out_tmp_reg_n_100,out_tmp_reg_n_101,out_tmp_reg_n_102,out_tmp_reg_n_103,out_tmp_reg_n_104,out_tmp_reg_n_105,\<const0> }),
        .O(out_tmp_reg_0[7:0]),
        .S({out0_carry_i_1_n_0,out0_carry_i_2_n_0,out0_carry_i_3_n_0,out0_carry_i_4_n_0,out0_carry_i_5_n_0,out0_carry_i_6_n_0,out0_carry_i_7_n_0,\out_tmp_reg[16]__0_n_0 }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out0_carry__0
       (.CI(out0_carry_n_0),
        .CI_TOP(GND_2),
        .DI({\<const0> ,out_tmp_reg_n_92,out_tmp_reg_n_93,out_tmp_reg_n_94,out_tmp_reg_n_95,out_tmp_reg_n_96,out_tmp_reg_n_97,out_tmp_reg_n_98}),
        .O(out_tmp_reg_0[15:8]),
        .S({out0_carry__0_i_1_n_0,out0_carry__0_i_2_n_0,out0_carry__0_i_3_n_0,out0_carry__0_i_4_n_0,out0_carry__0_i_5_n_0,out0_carry__0_i_6_n_0,out0_carry__0_i_7_n_0,out0_carry__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__0_i_1
       (.I0(out_tmp_reg_n_91),
        .I1(out0_n_91),
        .O(out0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__0_i_2
       (.I0(out_tmp_reg_n_92),
        .I1(out0_n_92),
        .O(out0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__0_i_3
       (.I0(out_tmp_reg_n_93),
        .I1(out0_n_93),
        .O(out0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__0_i_4
       (.I0(out_tmp_reg_n_94),
        .I1(out0_n_94),
        .O(out0_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__0_i_5
       (.I0(out_tmp_reg_n_95),
        .I1(out0_n_95),
        .O(out0_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__0_i_6
       (.I0(out_tmp_reg_n_96),
        .I1(out0_n_96),
        .O(out0_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__0_i_7
       (.I0(out_tmp_reg_n_97),
        .I1(out0_n_97),
        .O(out0_carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__0_i_8
       (.I0(out_tmp_reg_n_98),
        .I1(out0_n_98),
        .O(out0_carry__0_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_1
       (.I0(out_tmp_reg_n_99),
        .I1(out0_n_99),
        .O(out0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_2
       (.I0(out_tmp_reg_n_100),
        .I1(out0_n_100),
        .O(out0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_3
       (.I0(out_tmp_reg_n_101),
        .I1(out0_n_101),
        .O(out0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_4
       (.I0(out_tmp_reg_n_102),
        .I1(out0_n_102),
        .O(out0_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_5
       (.I0(out_tmp_reg_n_103),
        .I1(out0_n_103),
        .O(out0_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_6
       (.I0(out_tmp_reg_n_104),
        .I1(out0_n_104),
        .O(out0_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_7
       (.I0(out_tmp_reg_n_105),
        .I1(out0_n_105),
        .O(out0_carry_i_7_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_10
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[23]),
        .O(out0_i_10_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_11
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[22]),
        .O(out0_i_11_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_12
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[21]),
        .O(out0_i_12_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_13
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[20]),
        .O(out0_i_13_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_14
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[19]),
        .O(out0_i_14_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_15
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[18]),
        .O(out0_i_15_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_16
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[17]),
        .O(out0_i_16_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_17
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[16]),
        .O(out0_i_17_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_18
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[15]),
        .O(out0_i_18_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_19
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[14]),
        .O(out0_i_19_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_2
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[31]),
        .O(out0_i_2_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_20
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[13]),
        .O(out0_i_20_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_21
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[12]),
        .O(out0_i_21_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_22
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[11]),
        .O(out0_i_22_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_23
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[10]),
        .O(out0_i_23_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_24
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[9]),
        .O(out0_i_24_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_25
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[8]),
        .O(out0_i_25_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_26
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[7]),
        .O(out0_i_26_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_27
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[6]),
        .O(out0_i_27_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_28
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[5]),
        .O(out0_i_28_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_29
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[4]),
        .O(out0_i_29_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_3
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[30]),
        .O(out0_i_3_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_30
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[3]),
        .O(out0_i_30_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_31
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[2]),
        .O(out0_i_31_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_32
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[1]),
        .O(out0_i_32_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_33
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[0]),
        .O(out0_i_33_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_4
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[29]),
        .O(out0_i_4_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_5
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[28]),
        .O(out0_i_5_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_6
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[27]),
        .O(out0_i_6_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_7
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[26]),
        .O(out0_i_7_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_8
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[25]),
        .O(out0_i_8_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out0_i_9
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(lhs_read_data[24]),
        .O(out0_i_9_n_0));
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
        .B({\<const0> ,\<const0> ,\<const0> ,out_tmp_reg_i_1_n_0,out_tmp_reg_i_2_n_0,out_tmp_reg_i_3_n_0,out_tmp_reg_i_4_n_0,out_tmp_reg_i_5_n_0,out_tmp_reg_i_6_n_0,out_tmp_reg_i_7_n_0,out_tmp_reg_i_8_n_0,out_tmp_reg_i_9_n_0,out_tmp_reg_i_10_n_0,out_tmp_reg_i_11_n_0,out_tmp_reg_i_12_n_0,out_tmp_reg_i_13_n_0,out_tmp_reg_i_14_n_0,out_tmp_reg_i_15_n_0}),
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
        .P({out_tmp_reg_n_91,out_tmp_reg_n_92,out_tmp_reg_n_93,out_tmp_reg_n_94,out_tmp_reg_n_95,out_tmp_reg_n_96,out_tmp_reg_n_97,out_tmp_reg_n_98,out_tmp_reg_n_99,out_tmp_reg_n_100,out_tmp_reg_n_101,out_tmp_reg_n_102,out_tmp_reg_n_103,out_tmp_reg_n_104,out_tmp_reg_n_105}),
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
        .Q(Q[0]),
        .R(reset));
  FDRE \out_tmp_reg[10]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_95),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_tmp_reg[11]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_94),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_tmp_reg[12]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_93),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_tmp_reg[13]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_92),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_tmp_reg[14]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_91),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_tmp_reg[15]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_90),
        .Q(Q[15]),
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
        .Q(Q[1]),
        .R(reset));
  FDRE \out_tmp_reg[2]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_103),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_tmp_reg[3]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_102),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_tmp_reg[4]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_101),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_tmp_reg[5]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_100),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_tmp_reg[6]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_99),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_tmp_reg[7]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_98),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_tmp_reg[8]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_97),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_tmp_reg[9]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_96),
        .Q(Q[9]),
        .R(reset));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_1
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[31]),
        .O(out_tmp_reg_i_1_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_10
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[22]),
        .O(out_tmp_reg_i_10_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_11
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[21]),
        .O(out_tmp_reg_i_11_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_12
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[20]),
        .O(out_tmp_reg_i_12_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_13
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[19]),
        .O(out_tmp_reg_i_13_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_14
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[18]),
        .O(out_tmp_reg_i_14_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_15
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[17]),
        .O(out_tmp_reg_i_15_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_2
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[30]),
        .O(out_tmp_reg_i_2_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_3
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[29]),
        .O(out_tmp_reg_i_3_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_4
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[28]),
        .O(out_tmp_reg_i_4_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_5
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[27]),
        .O(out_tmp_reg_i_5_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_6
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[26]),
        .O(out_tmp_reg_i_6_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_7
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[25]),
        .O(out_tmp_reg_i_7_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_8
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[24]),
        .O(out_tmp_reg_i_8_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    out_tmp_reg_i_9
       (.I0(\done_buf_reg[2]_0 ),
        .I1(do_unsigned_mul_go_in),
        .I2(rhs_read_data[23]),
        .O(out_tmp_reg_i_9_n_0));
endmodule

module std_mult_pipe
   (mul_done,
    out_tmp_reg,
    Q,
    clk,
    E,
    reset,
    do_unsigned_mul_go_in,
    rhs_read_data,
    lhs_read_data);
  output mul_done;
  output [15:0]out_tmp_reg;
  output [15:0]Q;
  input clk;
  input [0:0]E;
  input reset;
  input do_unsigned_mul_go_in;
  input [31:0]rhs_read_data;
  input [31:0]lhs_read_data;

  wire [0:0]E;
  wire [15:0]Q;
  wire clk;
  wire do_unsigned_mul_go_in;
  wire [31:0]lhs_read_data;
  wire mul_done;
  wire [15:0]out_tmp_reg;
  wire reset;
  wire [31:0]rhs_read_data;

  std_fp_mult_pipe__parameterized0 comp
       (.E(E),
        .Q(Q),
        .clk(clk),
        .do_unsigned_mul_go_in(do_unsigned_mul_go_in),
        .\done_buf_reg[2]_0 (mul_done),
        .lhs_read_data(lhs_read_data),
        .out_tmp_reg_0(out_tmp_reg),
        .reset(reset),
        .rhs_read_data(rhs_read_data));
endmodule

module std_reg
   (done,
    \out_reg[1]_0 ,
    D,
    do_signed_div_mod_go_in,
    E,
    reset_0,
    done0,
    left_abs__2,
    .slhs_read_data_2_sp_1(slhs_read_data_2_sn_1),
    .slhs_read_data_1_sp_1(slhs_read_data_1_sn_1),
    signed_sub_write_data,
    go_0,
    signed_add_write_data,
    \out_reg[0]_0 ,
    \done_buf_reg[2] ,
    do_signed_mul_go_in,
    \done_buf_reg[2]_0 ,
    \done_buf_reg[2]_1 ,
    signed_mul_write_en,
    unsigned_mod_write_data,
    do_unsigned_div_mod_go_in,
    unsigned_div_write_data,
    \rhs_read_data[31] ,
    running_reg,
    dividend_is_zero__31,
    unsigned_sub_write_data,
    \out_reg[3]_0 ,
    a,
    b,
    unsigned_add_write_data,
    \out_reg[0]_1 ,
    \lhs_read_data[31] ,
    \rhs_read_data[31]_0 ,
    unsigned_mul_write_data,
    do_unsigned_mul_go_in,
    \done_buf_reg[2]_2 ,
    unsigned_mul_write_en,
    do_unsigned_div_mod_done_in,
    unsigned_mul_done,
    unsigned_sub_done,
    signed_div_done,
    signed_mod_done,
    srhs_read_data,
    SR,
    Q,
    sdiv_done,
    running_reg_0,
    done_reg,
    slhs_read_data,
    signed_mul_done,
    signed_sub_done,
    go,
    signed_add_done,
    smul_done,
    \unsigned_mod_write_data[31] ,
    \unsigned_div_write_data[31] ,
    p_0_in,
    rhs_read_data,
    done_i_2__0_0,
    done_i_2__0_1,
    done_i_2__0_2,
    done_i_2__0_3,
    lhs_read_data,
    unsigned_mod_done,
    unsigned_div_done,
    out0,
    unsigned_add_done,
    \unsigned_add_write_data[31] ,
    \unsigned_mul_write_data[15] ,
    out_tmp_reg,
    mul_done,
    reset,
    clk);
  output done;
  output \out_reg[1]_0 ;
  output [0:0]D;
  output do_signed_div_mod_go_in;
  output [0:0]E;
  output reset_0;
  output done0;
  output [1:0]left_abs__2;
  output [3:0]signed_sub_write_data;
  output go_0;
  output [3:0]signed_add_write_data;
  output \out_reg[0]_0 ;
  output [3:0]\done_buf_reg[2] ;
  output do_signed_mul_go_in;
  output [3:0]\done_buf_reg[2]_0 ;
  output [0:0]\done_buf_reg[2]_1 ;
  output signed_mul_write_en;
  output [31:0]unsigned_mod_write_data;
  output do_unsigned_div_mod_go_in;
  output [31:0]unsigned_div_write_data;
  output [0:0]\rhs_read_data[31] ;
  output [0:0]running_reg;
  output dividend_is_zero__31;
  output [31:0]unsigned_sub_write_data;
  output \out_reg[3]_0 ;
  output [31:0]a;
  output [31:0]b;
  output [31:0]unsigned_add_write_data;
  output \out_reg[0]_1 ;
  output [31:0]\lhs_read_data[31] ;
  output [31:0]\rhs_read_data[31]_0 ;
  output [31:0]unsigned_mul_write_data;
  output do_unsigned_mul_go_in;
  output [0:0]\done_buf_reg[2]_2 ;
  output unsigned_mul_write_en;
  input do_unsigned_div_mod_done_in;
  input unsigned_mul_done;
  input unsigned_sub_done;
  input signed_div_done;
  input signed_mod_done;
  input [3:0]srhs_read_data;
  input [0:0]SR;
  input [0:0]Q;
  input sdiv_done;
  input running_reg_0;
  input [0:0]done_reg;
  input [3:0]slhs_read_data;
  input signed_mul_done;
  input signed_sub_done;
  input go;
  input signed_add_done;
  input smul_done;
  input [31:0]\unsigned_mod_write_data[31] ;
  input [31:0]\unsigned_div_write_data[31] ;
  input p_0_in;
  input [31:0]rhs_read_data;
  input done_i_2__0_0;
  input done_i_2__0_1;
  input done_i_2__0_2;
  input done_i_2__0_3;
  input [31:0]lhs_read_data;
  input unsigned_mod_done;
  input unsigned_div_done;
  input [31:0]out0;
  input unsigned_add_done;
  input [31:0]\unsigned_add_write_data[31] ;
  input [15:0]\unsigned_mul_write_data[15] ;
  input [15:0]out_tmp_reg;
  input mul_done;
  input reset;
  input clk;
  output slhs_read_data_2_sn_1;
  output slhs_read_data_1_sn_1;

  wire [0:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire [0:0]SR;
  wire [31:0]a;
  wire [31:0]b;
  wire clk;
  wire dividend_is_zero__31;
  wire \divisor[5]_i_2_n_0 ;
  wire do_signed_div_mod_go_in;
  wire do_signed_mul_go_in;
  wire do_unsigned_div_mod_done_in;
  wire do_unsigned_div_mod_go_in;
  wire do_unsigned_mul_go_in;
  wire done;
  wire done0;
  wire [3:0]\done_buf_reg[2] ;
  wire [3:0]\done_buf_reg[2]_0 ;
  wire [0:0]\done_buf_reg[2]_1 ;
  wire [0:0]\done_buf_reg[2]_2 ;
  wire done_i_2__0_0;
  wire done_i_2__0_1;
  wire done_i_2__0_2;
  wire done_i_2__0_3;
  wire done_i_2_n_0;
  wire done_i_3__0_n_0;
  wire done_i_4__0_n_0;
  wire done_i_5__0_n_0;
  wire done_i_5_n_0;
  wire done_i_6_n_0;
  wire done_i_7_n_0;
  wire [0:0]done_reg;
  wire [3:0]fsm_in;
  wire fsm_in2;
  wire fsm_in3;
  wire fsm_in4;
  wire fsm_in5;
  wire fsm_in6;
  wire [3:0]fsm_out;
  wire fsm_write_en;
  wire go;
  wire go_0;
  wire [1:0]left_abs__2;
  wire [31:0]lhs_read_data;
  wire [31:0]\lhs_read_data[31] ;
  wire mul_done;
  wire [31:0]out0;
  wire \out[0]_i_3_n_0 ;
  wire \out[1]_i_2_n_0 ;
  wire \out[1]_i_3_n_0 ;
  wire \out[2]_i_2_n_0 ;
  wire \out[3]_i_4_n_0 ;
  wire \out[3]_i_7_n_0 ;
  wire \out[3]_i_8_n_0 ;
  wire \out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire \out_reg[1]_0 ;
  wire \out_reg[3]_0 ;
  wire [15:0]out_tmp_reg;
  wire p_0_in;
  wire reset;
  wire reset_0;
  wire [31:0]rhs_read_data;
  wire [0:0]\rhs_read_data[31] ;
  wire [31:0]\rhs_read_data[31]_0 ;
  wire [0:0]running_reg;
  wire running_reg_0;
  wire sdiv_done;
  wire [3:3]sdiv_left;
  wire [0:0]sdiv_left__0;
  wire signed_add_done;
  wire [3:0]signed_add_write_data;
  wire \signed_add_write_data[3]_INST_0_i_1_n_0 ;
  wire signed_div_done;
  wire \signed_div_write_data[3]_INST_0_i_3_n_0 ;
  wire signed_mod_done;
  wire signed_mul_done;
  wire signed_mul_write_en;
  wire signed_sub_done;
  wire [3:0]signed_sub_write_data;
  wire \signed_sub_write_data[3]_INST_0_i_1_n_0 ;
  wire [3:0]slhs_read_data;
  wire slhs_read_data_1_sn_1;
  wire slhs_read_data_2_sn_1;
  wire smul_done;
  wire [3:0]srhs_read_data;
  wire unsigned_add_done;
  wire [31:0]unsigned_add_write_data;
  wire [31:0]\unsigned_add_write_data[31] ;
  wire unsigned_div_done;
  wire [31:0]unsigned_div_write_data;
  wire [31:0]\unsigned_div_write_data[31] ;
  wire \unsigned_div_write_data[31]_INST_0_i_2_n_0 ;
  wire unsigned_mod_done;
  wire [31:0]unsigned_mod_write_data;
  wire [31:0]\unsigned_mod_write_data[31] ;
  wire unsigned_mul_done;
  wire [31:0]unsigned_mul_write_data;
  wire [15:0]\unsigned_mul_write_data[15] ;
  wire unsigned_mul_write_en;
  wire unsigned_sub_done;
  wire [31:0]unsigned_sub_write_data;

  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_0_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[0]),
        .O(a[0]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_0_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[0]),
        .O(\lhs_read_data[31] [0]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_0_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[0]),
        .O(b[0]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_0_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[0]),
        .O(\rhs_read_data[31]_0 [0]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_18_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[16]),
        .O(a[16]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_18_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[16]),
        .O(\lhs_read_data[31] [16]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_18_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[16]),
        .O(b[16]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_18_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[16]),
        .O(\rhs_read_data[31]_0 [16]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_27_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[24]),
        .O(a[24]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_27_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[24]),
        .O(\lhs_read_data[31] [24]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_27_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[24]),
        .O(b[24]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_27_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[24]),
        .O(\rhs_read_data[31]_0 [24]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_9_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[8]),
        .O(a[8]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_9_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[8]),
        .O(\lhs_read_data[31] [8]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_9_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[8]),
        .O(b[8]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_9_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[8]),
        .O(\rhs_read_data[31]_0 [8]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_10_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[9]),
        .O(a[9]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_10_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[9]),
        .O(\lhs_read_data[31] [9]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_10_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[9]),
        .O(b[9]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_10_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[9]),
        .O(\rhs_read_data[31]_0 [9]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_19_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[17]),
        .O(a[17]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_19_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[17]),
        .O(\lhs_read_data[31] [17]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_19_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[17]),
        .O(b[17]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_19_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[17]),
        .O(\rhs_read_data[31]_0 [17]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_1_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[1]),
        .O(a[1]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_1_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[1]),
        .O(\lhs_read_data[31] [1]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_1_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[1]),
        .O(b[1]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_1_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[1]),
        .O(\rhs_read_data[31]_0 [1]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_28_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[25]),
        .O(a[25]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_28_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[25]),
        .O(\lhs_read_data[31] [25]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_28_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[25]),
        .O(b[25]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_28_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[25]),
        .O(\rhs_read_data[31]_0 [25]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_11_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[10]),
        .O(a[10]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_11_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[10]),
        .O(\lhs_read_data[31] [10]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_11_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[10]),
        .O(b[10]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_11_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[10]),
        .O(\rhs_read_data[31]_0 [10]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_20_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[18]),
        .O(a[18]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_20_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[18]),
        .O(\lhs_read_data[31] [18]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_20_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[18]),
        .O(b[18]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_20_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[18]),
        .O(\rhs_read_data[31]_0 [18]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_29_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[26]),
        .O(a[26]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_29_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[26]),
        .O(\lhs_read_data[31] [26]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_29_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[26]),
        .O(b[26]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_29_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[26]),
        .O(\rhs_read_data[31]_0 [26]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_2_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[2]),
        .O(a[2]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_2_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[2]),
        .O(\lhs_read_data[31] [2]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_2_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[2]),
        .O(b[2]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_2_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[2]),
        .O(\rhs_read_data[31]_0 [2]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_12_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[11]),
        .O(a[11]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_12_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[11]),
        .O(\lhs_read_data[31] [11]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_12_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[11]),
        .O(b[11]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_12_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[11]),
        .O(\rhs_read_data[31]_0 [11]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_21_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[19]),
        .O(a[19]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_21_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[19]),
        .O(\lhs_read_data[31] [19]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_21_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[19]),
        .O(b[19]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_21_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[19]),
        .O(\rhs_read_data[31]_0 [19]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_30_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[27]),
        .O(a[27]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_30_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[27]),
        .O(\lhs_read_data[31] [27]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_30_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[27]),
        .O(b[27]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_30_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[27]),
        .O(\rhs_read_data[31]_0 [27]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_3_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[3]),
        .O(a[3]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_3_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[3]),
        .O(\lhs_read_data[31] [3]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_3_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[3]),
        .O(b[3]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_3_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[3]),
        .O(\rhs_read_data[31]_0 [3]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_13_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[12]),
        .O(a[12]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_13_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[12]),
        .O(\lhs_read_data[31] [12]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_13_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[12]),
        .O(b[12]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_13_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[12]),
        .O(\rhs_read_data[31]_0 [12]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_22_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[20]),
        .O(a[20]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_22_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[20]),
        .O(\lhs_read_data[31] [20]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_22_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[20]),
        .O(b[20]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_22_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[20]),
        .O(\rhs_read_data[31]_0 [20]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_31_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[28]),
        .O(a[28]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_31_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[28]),
        .O(\lhs_read_data[31] [28]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_31_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[28]),
        .O(b[28]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_31_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[28]),
        .O(\rhs_read_data[31]_0 [28]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_4_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[4]),
        .O(a[4]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_4_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[4]),
        .O(\lhs_read_data[31] [4]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_4_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[4]),
        .O(b[4]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_4_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[4]),
        .O(\rhs_read_data[31]_0 [4]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_14_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[13]),
        .O(a[13]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_14_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[13]),
        .O(\lhs_read_data[31] [13]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_14_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[13]),
        .O(b[13]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_14_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[13]),
        .O(\rhs_read_data[31]_0 [13]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_23_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[21]),
        .O(a[21]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_23_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[21]),
        .O(\lhs_read_data[31] [21]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_23_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[21]),
        .O(b[21]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_23_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[21]),
        .O(\rhs_read_data[31]_0 [21]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_32_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[29]),
        .O(a[29]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_32_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[29]),
        .O(\lhs_read_data[31] [29]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_32_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[29]),
        .O(b[29]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_32_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[29]),
        .O(\rhs_read_data[31]_0 [29]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_5_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[5]),
        .O(a[5]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_5_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[5]),
        .O(\lhs_read_data[31] [5]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_5_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[5]),
        .O(b[5]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_5_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[5]),
        .O(\rhs_read_data[31]_0 [5]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_15_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[14]),
        .O(a[14]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_15_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[14]),
        .O(\lhs_read_data[31] [14]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_15_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[14]),
        .O(b[14]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_15_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[14]),
        .O(\rhs_read_data[31]_0 [14]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_24_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[22]),
        .O(a[22]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_24_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[22]),
        .O(\lhs_read_data[31] [22]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_24_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[22]),
        .O(b[22]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_24_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[22]),
        .O(\rhs_read_data[31]_0 [22]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_33_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[30]),
        .O(a[30]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_33_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[30]),
        .O(\lhs_read_data[31] [30]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_33_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[30]),
        .O(b[30]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_33_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[30]),
        .O(\rhs_read_data[31]_0 [30]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_6_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[6]),
        .O(a[6]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_6_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[6]),
        .O(\lhs_read_data[31] [6]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_6_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[6]),
        .O(b[6]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_6_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[6]),
        .O(\rhs_read_data[31]_0 [6]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_16_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[15]),
        .O(a[15]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_16_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[15]),
        .O(\lhs_read_data[31] [15]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_16_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[15]),
        .O(b[15]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_16_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[15]),
        .O(\rhs_read_data[31]_0 [15]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_25_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[23]),
        .O(a[23]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_25_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[23]),
        .O(\lhs_read_data[31] [23]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_25_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[23]),
        .O(b[23]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_25_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[23]),
        .O(\rhs_read_data[31]_0 [23]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_34_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[31]),
        .O(a[31]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_34_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[31]),
        .O(\lhs_read_data[31] [31]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_34_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[31]),
        .O(b[31]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_34_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[31]),
        .O(\rhs_read_data[31]_0 [31]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_7_i_1
       (.I0(\out_reg[3]_0 ),
        .I1(lhs_read_data[7]),
        .O(a[7]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_7_i_1__0
       (.I0(\out_reg[0]_1 ),
        .I1(lhs_read_data[7]),
        .O(\lhs_read_data[31] [7]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_7_i_2
       (.I0(\out_reg[3]_0 ),
        .I1(rhs_read_data[7]),
        .O(b[7]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_7_i_2__0
       (.I0(\out_reg[0]_1 ),
        .I1(rhs_read_data[7]),
        .O(\rhs_read_data[31]_0 [7]));
  LUT4 #(
    .INIT(16'h48C0)) 
    \dividend[1]_i_2 
       (.I0(slhs_read_data[3]),
        .I1(do_signed_div_mod_go_in),
        .I2(slhs_read_data[1]),
        .I3(slhs_read_data[0]),
        .O(left_abs__2[0]));
  LUT5 #(
    .INIT(32'h04CCC800)) 
    \dividend[2]_i_3 
       (.I0(slhs_read_data[1]),
        .I1(do_signed_div_mod_go_in),
        .I2(slhs_read_data[0]),
        .I3(slhs_read_data[3]),
        .I4(slhs_read_data[2]),
        .O(left_abs__2[1]));
  LUT3 #(
    .INIT(8'h37)) 
    \dividend[3]_i_4 
       (.I0(slhs_read_data[1]),
        .I1(do_signed_div_mod_go_in),
        .I2(slhs_read_data[0]),
        .O(slhs_read_data_1_sn_1));
  LUT3 #(
    .INIT(8'h40)) 
    \dividend[3]_i_5 
       (.I0(slhs_read_data[2]),
        .I1(do_signed_div_mod_go_in),
        .I2(slhs_read_data[3]),
        .O(slhs_read_data_2_sn_1));
  LUT6 #(
    .INIT(64'hB040FFFFB0400000)) 
    \divisor[5]_i_1 
       (.I0(\divisor[5]_i_2_n_0 ),
        .I1(srhs_read_data[3]),
        .I2(do_signed_div_mod_go_in),
        .I3(srhs_read_data[2]),
        .I4(SR),
        .I5(Q),
        .O(D));
  LUT3 #(
    .INIT(8'h37)) 
    \divisor[5]_i_2 
       (.I0(srhs_read_data[1]),
        .I1(do_signed_div_mod_go_in),
        .I2(srhs_read_data[0]),
        .O(\divisor[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \divisor[62]_i_2 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(p_0_in),
        .I2(rhs_read_data[31]),
        .O(\rhs_read_data[31] ));
  LUT4 #(
    .INIT(16'h0004)) 
    done_INST_0
       (.I0(fsm_out[2]),
        .I1(fsm_out[3]),
        .I2(fsm_out[1]),
        .I3(fsm_out[0]),
        .O(done));
  LUT6 #(
    .INIT(64'hAAAEAAAAAAAAAAAA)) 
    done_i_1
       (.I0(done_reg),
        .I1(done_i_2_n_0),
        .I2(sdiv_left),
        .I3(sdiv_left__0),
        .I4(done_i_5_n_0),
        .I5(SR),
        .O(done0));
  LUT2 #(
    .INIT(4'h7)) 
    done_i_2
       (.I0(slhs_read_data[2]),
        .I1(do_signed_div_mod_go_in),
        .O(done_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    done_i_2__0
       (.I0(p_0_in),
        .I1(done_i_3__0_n_0),
        .I2(done_i_4__0_n_0),
        .I3(done_i_5__0_n_0),
        .I4(done_i_6_n_0),
        .I5(done_i_7_n_0),
        .O(dividend_is_zero__31));
  LUT2 #(
    .INIT(4'h8)) 
    done_i_3
       (.I0(slhs_read_data[3]),
        .I1(do_signed_div_mod_go_in),
        .O(sdiv_left));
  LUT6 #(
    .INIT(64'hFFFF8000FFFFFFFF)) 
    done_i_3__0
       (.I0(done_i_2__0_0),
        .I1(done_i_2__0_1),
        .I2(done_i_2__0_2),
        .I3(done_i_2__0_3),
        .I4(do_unsigned_div_mod_done_in),
        .I5(\out_reg[1]_0 ),
        .O(done_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    done_i_4
       (.I0(slhs_read_data[0]),
        .I1(do_signed_div_mod_go_in),
        .O(sdiv_left__0));
  LUT6 #(
    .INIT(64'h00FF000000FE0000)) 
    done_i_4__0
       (.I0(lhs_read_data[25]),
        .I1(lhs_read_data[24]),
        .I2(lhs_read_data[27]),
        .I3(do_unsigned_div_mod_done_in),
        .I4(\out_reg[1]_0 ),
        .I5(lhs_read_data[26]),
        .O(done_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    done_i_5
       (.I0(slhs_read_data[1]),
        .I1(do_signed_div_mod_go_in),
        .O(done_i_5_n_0));
  LUT6 #(
    .INIT(64'h0F000F000F000E00)) 
    done_i_5__0
       (.I0(lhs_read_data[29]),
        .I1(lhs_read_data[28]),
        .I2(do_unsigned_div_mod_done_in),
        .I3(\out_reg[1]_0 ),
        .I4(lhs_read_data[30]),
        .I5(lhs_read_data[31]),
        .O(done_i_5__0_n_0));
  LUT6 #(
    .INIT(64'h00FF000000FE0000)) 
    done_i_6
       (.I0(lhs_read_data[17]),
        .I1(lhs_read_data[16]),
        .I2(lhs_read_data[19]),
        .I3(do_unsigned_div_mod_done_in),
        .I4(\out_reg[1]_0 ),
        .I5(lhs_read_data[18]),
        .O(done_i_6_n_0));
  LUT6 #(
    .INIT(64'h00FF000000FE0000)) 
    done_i_7
       (.I0(lhs_read_data[21]),
        .I1(lhs_read_data[20]),
        .I2(lhs_read_data[23]),
        .I3(do_unsigned_div_mod_done_in),
        .I4(\out_reg[1]_0 ),
        .I5(lhs_read_data[22]),
        .O(done_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \ltmp[0]_i_1 
       (.I0(do_signed_mul_go_in),
        .I1(smul_done),
        .I2(slhs_read_data[0]),
        .O(\done_buf_reg[2] [0]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \ltmp[1]_i_1 
       (.I0(do_signed_mul_go_in),
        .I1(smul_done),
        .I2(slhs_read_data[1]),
        .O(\done_buf_reg[2] [1]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \ltmp[2]_i_1 
       (.I0(do_signed_mul_go_in),
        .I1(smul_done),
        .I2(slhs_read_data[2]),
        .O(\done_buf_reg[2] [2]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \ltmp[3]_i_1 
       (.I0(do_signed_mul_go_in),
        .I1(smul_done),
        .I2(slhs_read_data[3]),
        .O(\done_buf_reg[2] [3]));
  LUT2 #(
    .INIT(4'h2)) 
    out0_i_1
       (.I0(do_unsigned_mul_go_in),
        .I1(mul_done),
        .O(\done_buf_reg[2]_2 ));
  LUT6 #(
    .INIT(64'h00000000FFFF3310)) 
    \out[0]_i_1 
       (.I0(fsm_in5),
        .I1(fsm_in3),
        .I2(\out[0]_i_3_n_0 ),
        .I3(fsm_in4),
        .I4(fsm_in2),
        .I5(done),
        .O(fsm_in[0]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \out[0]_i_2 
       (.I0(\signed_div_write_data[3]_INST_0_i_3_n_0 ),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(signed_mod_done),
        .I4(signed_div_done),
        .O(fsm_in5));
  LUT5 #(
    .INIT(32'h0000A0C0)) 
    \out[0]_i_3 
       (.I0(unsigned_mul_done),
        .I1(unsigned_add_done),
        .I2(\unsigned_div_write_data[31]_INST_0_i_2_n_0 ),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .O(\out[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h0C8C)) 
    \out[1]_i_1 
       (.I0(\out[1]_i_2_n_0 ),
        .I1(\out[2]_i_2_n_0 ),
        .I2(\out[3]_i_8_n_0 ),
        .I3(\out[1]_i_3_n_0 ),
        .O(fsm_in[1]));
  LUT5 #(
    .INIT(32'h0CA00000)) 
    \out[1]_i_2 
       (.I0(unsigned_sub_done),
        .I1(unsigned_mul_done),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(\unsigned_div_write_data[31]_INST_0_i_2_n_0 ),
        .O(\out[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF80000000)) 
    \out[1]_i_3 
       (.I0(signed_div_done),
        .I1(signed_mod_done),
        .I2(fsm_out[1]),
        .I3(fsm_out[0]),
        .I4(\signed_div_write_data[3]_INST_0_i_3_n_0 ),
        .I5(fsm_in6),
        .O(\out[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \out[1]_i_4 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(fsm_out[3]),
        .I3(fsm_out[2]),
        .I4(go),
        .I5(unsigned_add_done),
        .O(fsm_in6));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \out[2]_i_1 
       (.I0(\out[3]_i_8_n_0 ),
        .I1(\out[2]_i_2_n_0 ),
        .I2(\out[3]_i_4_n_0 ),
        .O(fsm_in[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF1F3)) 
    \out[2]_i_2 
       (.I0(signed_add_done),
        .I1(fsm_out[3]),
        .I2(fsm_out[2]),
        .I3(go),
        .I4(fsm_out[1]),
        .I5(fsm_out[0]),
        .O(\out[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \out[3]_i_1 
       (.I0(fsm_in4),
        .I1(\out[3]_i_4_n_0 ),
        .I2(fsm_in3),
        .I3(fsm_in2),
        .I4(\out[3]_i_7_n_0 ),
        .O(fsm_write_en));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    \out[3]_i_2 
       (.I0(\out[3]_i_8_n_0 ),
        .I1(\out_reg[1]_0 ),
        .I2(done),
        .I3(do_unsigned_div_mod_done_in),
        .I4(fsm_in2),
        .I5(\out[3]_i_4_n_0 ),
        .O(fsm_in[3]));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \out[3]_i_3 
       (.I0(go),
        .I1(fsm_out[2]),
        .I2(fsm_out[3]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(signed_mul_done),
        .O(fsm_in4));
  LUT6 #(
    .INIT(64'hFFFFFFFF28200800)) 
    \out[3]_i_4 
       (.I0(\unsigned_div_write_data[31]_INST_0_i_2_n_0 ),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(unsigned_mul_done),
        .I4(unsigned_sub_done),
        .I5(\out[1]_i_3_n_0 ),
        .O(\out[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \out[3]_i_5 
       (.I0(go),
        .I1(fsm_out[2]),
        .I2(fsm_out[3]),
        .I3(fsm_out[0]),
        .I4(fsm_out[1]),
        .I5(signed_sub_done),
        .O(fsm_in3));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \out[3]_i_6 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[3]),
        .I5(signed_add_done),
        .O(fsm_in2));
  LUT6 #(
    .INIT(64'h00008000000F0000)) 
    \out[3]_i_7 
       (.I0(do_unsigned_div_mod_done_in),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(fsm_out[3]),
        .I5(fsm_out[2]),
        .O(\out[3]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hF35FFFFF)) 
    \out[3]_i_8 
       (.I0(signed_mul_done),
        .I1(signed_sub_done),
        .I2(fsm_out[1]),
        .I3(fsm_out[0]),
        .I4(\signed_div_write_data[3]_INST_0_i_3_n_0 ),
        .O(\out[3]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \out_quotient[31]_i_1 
       (.I0(dividend_is_zero__31),
        .I1(p_0_in),
        .O(running_reg));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[0]),
        .Q(fsm_out[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[1]),
        .Q(fsm_out[1]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[2]),
        .Q(fsm_out[2]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[3]),
        .Q(fsm_out[3]),
        .R(reset));
  LUT2 #(
    .INIT(4'h2)) 
    \out_tmp[3]_i_1 
       (.I0(do_signed_mul_go_in),
        .I1(smul_done),
        .O(\done_buf_reg[2]_1 ));
  LUT5 #(
    .INIT(32'h00008000)) 
    \quotient_msk[31]_i_2 
       (.I0(fsm_out[1]),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[3]),
        .O(\out_reg[1]_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    right_sign_i_1
       (.I0(do_signed_div_mod_go_in),
        .I1(sdiv_done),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \rtmp[0]_i_1 
       (.I0(do_signed_mul_go_in),
        .I1(smul_done),
        .I2(srhs_read_data[0]),
        .O(\done_buf_reg[2]_0 [0]));
  LUT3 #(
    .INIT(8'h20)) 
    \rtmp[1]_i_1 
       (.I0(do_signed_mul_go_in),
        .I1(smul_done),
        .I2(srhs_read_data[1]),
        .O(\done_buf_reg[2]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \rtmp[2]_i_1 
       (.I0(do_signed_mul_go_in),
        .I1(smul_done),
        .I2(srhs_read_data[2]),
        .O(\done_buf_reg[2]_0 [2]));
  LUT3 #(
    .INIT(8'h20)) 
    \rtmp[3]_i_1 
       (.I0(do_signed_mul_go_in),
        .I1(smul_done),
        .I2(srhs_read_data[3]),
        .O(\done_buf_reg[2]_0 [3]));
  LUT6 #(
    .INIT(64'hAAA2AAAAAAAAAAAA)) 
    running_i_1
       (.I0(running_reg_0),
        .I1(done_i_2_n_0),
        .I2(sdiv_left),
        .I3(sdiv_left__0),
        .I4(done_i_5_n_0),
        .I5(SR),
        .O(reset_0));
  LUT3 #(
    .INIT(8'h28)) 
    \signed_add_write_data[0]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(srhs_read_data[0]),
        .I2(slhs_read_data[0]),
        .O(signed_add_write_data[0]));
  LUT5 #(
    .INIT(32'h90606060)) 
    \signed_add_write_data[1]_INST_0 
       (.I0(slhs_read_data[1]),
        .I1(srhs_read_data[1]),
        .I2(\out_reg[0]_0 ),
        .I3(slhs_read_data[0]),
        .I4(srhs_read_data[0]),
        .O(signed_add_write_data[1]));
  LUT4 #(
    .INIT(16'h8448)) 
    \signed_add_write_data[2]_INST_0 
       (.I0(\signed_add_write_data[3]_INST_0_i_1_n_0 ),
        .I1(\out_reg[0]_0 ),
        .I2(srhs_read_data[2]),
        .I3(slhs_read_data[2]),
        .O(signed_add_write_data[2]));
  LUT6 #(
    .INIT(64'hC880044C044CC880)) 
    \signed_add_write_data[3]_INST_0 
       (.I0(\signed_add_write_data[3]_INST_0_i_1_n_0 ),
        .I1(\out_reg[0]_0 ),
        .I2(srhs_read_data[2]),
        .I3(slhs_read_data[2]),
        .I4(srhs_read_data[3]),
        .I5(slhs_read_data[3]),
        .O(signed_add_write_data[3]));
  LUT5 #(
    .INIT(32'hF0808000)) 
    \signed_add_write_data[3]_INST_0_i_1 
       (.I0(slhs_read_data[0]),
        .I1(srhs_read_data[0]),
        .I2(\out_reg[0]_0 ),
        .I3(srhs_read_data[1]),
        .I4(slhs_read_data[1]),
        .O(\signed_add_write_data[3]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    signed_add_write_en_INST_0
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[3]),
        .I5(signed_add_done),
        .O(\out_reg[0]_0 ));
  LUT5 #(
    .INIT(32'h00808080)) 
    \signed_div_write_data[3]_INST_0_i_2 
       (.I0(\signed_div_write_data[3]_INST_0_i_3_n_0 ),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(signed_mod_done),
        .I4(signed_div_done),
        .O(do_signed_div_mod_go_in));
  LUT3 #(
    .INIT(8'h02)) 
    \signed_div_write_data[3]_INST_0_i_3 
       (.I0(go),
        .I1(fsm_out[2]),
        .I2(fsm_out[3]),
        .O(\signed_div_write_data[3]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    \signed_mul_write_data[3]_INST_0_i_1 
       (.I0(go),
        .I1(fsm_out[2]),
        .I2(fsm_out[3]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(signed_mul_done),
        .O(do_signed_mul_go_in));
  LUT2 #(
    .INIT(4'h8)) 
    signed_mul_write_en_INST_0
       (.I0(do_signed_mul_go_in),
        .I1(smul_done),
        .O(signed_mul_write_en));
  LUT3 #(
    .INIT(8'h28)) 
    \signed_sub_write_data[0]_INST_0 
       (.I0(go_0),
        .I1(slhs_read_data[0]),
        .I2(srhs_read_data[0]),
        .O(signed_sub_write_data[0]));
  LUT5 #(
    .INIT(32'h48488448)) 
    \signed_sub_write_data[1]_INST_0 
       (.I0(slhs_read_data[1]),
        .I1(go_0),
        .I2(srhs_read_data[1]),
        .I3(srhs_read_data[0]),
        .I4(slhs_read_data[0]),
        .O(signed_sub_write_data[1]));
  LUT4 #(
    .INIT(16'h6090)) 
    \signed_sub_write_data[2]_INST_0 
       (.I0(\signed_sub_write_data[3]_INST_0_i_1_n_0 ),
        .I1(srhs_read_data[2]),
        .I2(go_0),
        .I3(slhs_read_data[2]),
        .O(signed_sub_write_data[2]));
  LUT6 #(
    .INIT(64'h40D0B020B02040D0)) 
    \signed_sub_write_data[3]_INST_0 
       (.I0(\signed_sub_write_data[3]_INST_0_i_1_n_0 ),
        .I1(srhs_read_data[2]),
        .I2(go_0),
        .I3(slhs_read_data[2]),
        .I4(srhs_read_data[3]),
        .I5(slhs_read_data[3]),
        .O(signed_sub_write_data[3]));
  LUT5 #(
    .INIT(32'hDFFF0DFF)) 
    \signed_sub_write_data[3]_INST_0_i_1 
       (.I0(srhs_read_data[0]),
        .I1(slhs_read_data[0]),
        .I2(srhs_read_data[1]),
        .I3(go_0),
        .I4(slhs_read_data[1]),
        .O(\signed_sub_write_data[3]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    signed_sub_write_en_INST_0
       (.I0(go),
        .I1(fsm_out[2]),
        .I2(fsm_out[3]),
        .I3(fsm_out[0]),
        .I4(fsm_out[1]),
        .I5(signed_sub_done),
        .O(go_0));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[0]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [0]),
        .O(unsigned_add_write_data[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[10]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [10]),
        .O(unsigned_add_write_data[10]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[11]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [11]),
        .O(unsigned_add_write_data[11]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[12]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [12]),
        .O(unsigned_add_write_data[12]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[13]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [13]),
        .O(unsigned_add_write_data[13]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[14]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [14]),
        .O(unsigned_add_write_data[14]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[15]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [15]),
        .O(unsigned_add_write_data[15]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[16]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [16]),
        .O(unsigned_add_write_data[16]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[17]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [17]),
        .O(unsigned_add_write_data[17]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[18]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [18]),
        .O(unsigned_add_write_data[18]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[19]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [19]),
        .O(unsigned_add_write_data[19]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[1]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [1]),
        .O(unsigned_add_write_data[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[20]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [20]),
        .O(unsigned_add_write_data[20]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[21]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [21]),
        .O(unsigned_add_write_data[21]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[22]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [22]),
        .O(unsigned_add_write_data[22]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[23]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [23]),
        .O(unsigned_add_write_data[23]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[24]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [24]),
        .O(unsigned_add_write_data[24]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[25]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [25]),
        .O(unsigned_add_write_data[25]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[26]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [26]),
        .O(unsigned_add_write_data[26]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[27]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [27]),
        .O(unsigned_add_write_data[27]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[28]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [28]),
        .O(unsigned_add_write_data[28]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[29]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [29]),
        .O(unsigned_add_write_data[29]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[2]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [2]),
        .O(unsigned_add_write_data[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[30]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [30]),
        .O(unsigned_add_write_data[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[31]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [31]),
        .O(unsigned_add_write_data[31]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[3]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [3]),
        .O(unsigned_add_write_data[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[4]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [4]),
        .O(unsigned_add_write_data[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[5]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [5]),
        .O(unsigned_add_write_data[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[6]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [6]),
        .O(unsigned_add_write_data[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[7]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [7]),
        .O(unsigned_add_write_data[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[8]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [8]),
        .O(unsigned_add_write_data[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_add_write_data[9]_INST_0 
       (.I0(\out_reg[0]_1 ),
        .I1(\unsigned_add_write_data[31] [9]),
        .O(unsigned_add_write_data[9]));
  LUT6 #(
    .INIT(64'h0000000001000000)) 
    unsigned_add_write_en_INST_0
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(fsm_out[3]),
        .I3(fsm_out[2]),
        .I4(go),
        .I5(unsigned_add_done),
        .O(\out_reg[0]_1 ));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[0]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [0]),
        .O(unsigned_div_write_data[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[10]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [10]),
        .O(unsigned_div_write_data[10]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[11]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [11]),
        .O(unsigned_div_write_data[11]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[12]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [12]),
        .O(unsigned_div_write_data[12]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[13]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [13]),
        .O(unsigned_div_write_data[13]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[14]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [14]),
        .O(unsigned_div_write_data[14]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[15]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [15]),
        .O(unsigned_div_write_data[15]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[16]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [16]),
        .O(unsigned_div_write_data[16]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[17]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [17]),
        .O(unsigned_div_write_data[17]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[18]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [18]),
        .O(unsigned_div_write_data[18]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[19]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [19]),
        .O(unsigned_div_write_data[19]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[1]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [1]),
        .O(unsigned_div_write_data[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[20]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [20]),
        .O(unsigned_div_write_data[20]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[21]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [21]),
        .O(unsigned_div_write_data[21]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[22]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [22]),
        .O(unsigned_div_write_data[22]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[23]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [23]),
        .O(unsigned_div_write_data[23]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[24]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [24]),
        .O(unsigned_div_write_data[24]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[25]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [25]),
        .O(unsigned_div_write_data[25]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[26]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [26]),
        .O(unsigned_div_write_data[26]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[27]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [27]),
        .O(unsigned_div_write_data[27]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[28]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [28]),
        .O(unsigned_div_write_data[28]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[29]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [29]),
        .O(unsigned_div_write_data[29]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[2]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [2]),
        .O(unsigned_div_write_data[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[30]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [30]),
        .O(unsigned_div_write_data[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[31]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [31]),
        .O(unsigned_div_write_data[31]));
  LUT5 #(
    .INIT(32'h00808080)) 
    \unsigned_div_write_data[31]_INST_0_i_1 
       (.I0(\unsigned_div_write_data[31]_INST_0_i_2_n_0 ),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(unsigned_mod_done),
        .I4(unsigned_div_done),
        .O(do_unsigned_div_mod_go_in));
  LUT3 #(
    .INIT(8'h40)) 
    \unsigned_div_write_data[31]_INST_0_i_2 
       (.I0(fsm_out[3]),
        .I1(fsm_out[2]),
        .I2(go),
        .O(\unsigned_div_write_data[31]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[3]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [3]),
        .O(unsigned_div_write_data[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[4]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [4]),
        .O(unsigned_div_write_data[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[5]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [5]),
        .O(unsigned_div_write_data[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[6]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [6]),
        .O(unsigned_div_write_data[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[7]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [7]),
        .O(unsigned_div_write_data[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[8]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [8]),
        .O(unsigned_div_write_data[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_div_write_data[9]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_div_write_data[31] [9]),
        .O(unsigned_div_write_data[9]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[0]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [0]),
        .O(unsigned_mod_write_data[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[10]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [10]),
        .O(unsigned_mod_write_data[10]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[11]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [11]),
        .O(unsigned_mod_write_data[11]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[12]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [12]),
        .O(unsigned_mod_write_data[12]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[13]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [13]),
        .O(unsigned_mod_write_data[13]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[14]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [14]),
        .O(unsigned_mod_write_data[14]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[15]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [15]),
        .O(unsigned_mod_write_data[15]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[16]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [16]),
        .O(unsigned_mod_write_data[16]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[17]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [17]),
        .O(unsigned_mod_write_data[17]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[18]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [18]),
        .O(unsigned_mod_write_data[18]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[19]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [19]),
        .O(unsigned_mod_write_data[19]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[1]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [1]),
        .O(unsigned_mod_write_data[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[20]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [20]),
        .O(unsigned_mod_write_data[20]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[21]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [21]),
        .O(unsigned_mod_write_data[21]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[22]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [22]),
        .O(unsigned_mod_write_data[22]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[23]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [23]),
        .O(unsigned_mod_write_data[23]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[24]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [24]),
        .O(unsigned_mod_write_data[24]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[25]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [25]),
        .O(unsigned_mod_write_data[25]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[26]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [26]),
        .O(unsigned_mod_write_data[26]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[27]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [27]),
        .O(unsigned_mod_write_data[27]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[28]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [28]),
        .O(unsigned_mod_write_data[28]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[29]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [29]),
        .O(unsigned_mod_write_data[29]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[2]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [2]),
        .O(unsigned_mod_write_data[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[30]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [30]),
        .O(unsigned_mod_write_data[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[31]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [31]),
        .O(unsigned_mod_write_data[31]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[3]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [3]),
        .O(unsigned_mod_write_data[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[4]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [4]),
        .O(unsigned_mod_write_data[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[5]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [5]),
        .O(unsigned_mod_write_data[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[6]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [6]),
        .O(unsigned_mod_write_data[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[7]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [7]),
        .O(unsigned_mod_write_data[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[8]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [8]),
        .O(unsigned_mod_write_data[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mod_write_data[9]_INST_0 
       (.I0(do_unsigned_div_mod_go_in),
        .I1(\unsigned_mod_write_data[31] [9]),
        .O(unsigned_mod_write_data[9]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[0]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [0]),
        .O(unsigned_mul_write_data[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[10]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [10]),
        .O(unsigned_mul_write_data[10]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[11]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [11]),
        .O(unsigned_mul_write_data[11]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[12]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [12]),
        .O(unsigned_mul_write_data[12]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[13]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [13]),
        .O(unsigned_mul_write_data[13]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[14]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [14]),
        .O(unsigned_mul_write_data[14]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[15]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [15]),
        .O(unsigned_mul_write_data[15]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[16]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[0]),
        .O(unsigned_mul_write_data[16]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[17]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[1]),
        .O(unsigned_mul_write_data[17]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[18]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[2]),
        .O(unsigned_mul_write_data[18]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[19]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[3]),
        .O(unsigned_mul_write_data[19]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[1]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [1]),
        .O(unsigned_mul_write_data[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[20]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[4]),
        .O(unsigned_mul_write_data[20]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[21]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[5]),
        .O(unsigned_mul_write_data[21]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[22]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[6]),
        .O(unsigned_mul_write_data[22]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[23]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[7]),
        .O(unsigned_mul_write_data[23]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[24]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[8]),
        .O(unsigned_mul_write_data[24]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[25]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[9]),
        .O(unsigned_mul_write_data[25]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[26]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[10]),
        .O(unsigned_mul_write_data[26]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[27]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[11]),
        .O(unsigned_mul_write_data[27]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[28]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[12]),
        .O(unsigned_mul_write_data[28]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[29]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[13]),
        .O(unsigned_mul_write_data[29]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[2]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [2]),
        .O(unsigned_mul_write_data[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[30]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[14]),
        .O(unsigned_mul_write_data[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[31]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(out_tmp_reg[15]),
        .O(unsigned_mul_write_data[31]));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    \unsigned_mul_write_data[31]_INST_0_i_1 
       (.I0(fsm_out[3]),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(unsigned_mul_done),
        .O(do_unsigned_mul_go_in));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[3]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [3]),
        .O(unsigned_mul_write_data[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[4]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [4]),
        .O(unsigned_mul_write_data[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[5]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [5]),
        .O(unsigned_mul_write_data[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[6]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [6]),
        .O(unsigned_mul_write_data[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[7]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [7]),
        .O(unsigned_mul_write_data[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[8]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [8]),
        .O(unsigned_mul_write_data[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_mul_write_data[9]_INST_0 
       (.I0(do_unsigned_mul_go_in),
        .I1(\unsigned_mul_write_data[15] [9]),
        .O(unsigned_mul_write_data[9]));
  LUT2 #(
    .INIT(4'h8)) 
    unsigned_mul_write_en_INST_0
       (.I0(do_unsigned_mul_go_in),
        .I1(mul_done),
        .O(unsigned_mul_write_en));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[0]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[0]),
        .O(unsigned_sub_write_data[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[10]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[10]),
        .O(unsigned_sub_write_data[10]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[11]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[11]),
        .O(unsigned_sub_write_data[11]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[12]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[12]),
        .O(unsigned_sub_write_data[12]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[13]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[13]),
        .O(unsigned_sub_write_data[13]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[14]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[14]),
        .O(unsigned_sub_write_data[14]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[15]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[15]),
        .O(unsigned_sub_write_data[15]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[16]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[16]),
        .O(unsigned_sub_write_data[16]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[17]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[17]),
        .O(unsigned_sub_write_data[17]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[18]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[18]),
        .O(unsigned_sub_write_data[18]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[19]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[19]),
        .O(unsigned_sub_write_data[19]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[1]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[1]),
        .O(unsigned_sub_write_data[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[20]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[20]),
        .O(unsigned_sub_write_data[20]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[21]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[21]),
        .O(unsigned_sub_write_data[21]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[22]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[22]),
        .O(unsigned_sub_write_data[22]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[23]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[23]),
        .O(unsigned_sub_write_data[23]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[24]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[24]),
        .O(unsigned_sub_write_data[24]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[25]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[25]),
        .O(unsigned_sub_write_data[25]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[26]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[26]),
        .O(unsigned_sub_write_data[26]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[27]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[27]),
        .O(unsigned_sub_write_data[27]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[28]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[28]),
        .O(unsigned_sub_write_data[28]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[29]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[29]),
        .O(unsigned_sub_write_data[29]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[2]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[2]),
        .O(unsigned_sub_write_data[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[30]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[30]),
        .O(unsigned_sub_write_data[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[31]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[31]),
        .O(unsigned_sub_write_data[31]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[3]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[3]),
        .O(unsigned_sub_write_data[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[4]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[4]),
        .O(unsigned_sub_write_data[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[5]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[5]),
        .O(unsigned_sub_write_data[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[6]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[6]),
        .O(unsigned_sub_write_data[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[7]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[7]),
        .O(unsigned_sub_write_data[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[8]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[8]),
        .O(unsigned_sub_write_data[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \unsigned_sub_write_data[9]_INST_0 
       (.I0(\out_reg[3]_0 ),
        .I1(out0[9]),
        .O(unsigned_sub_write_data[9]));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    unsigned_sub_write_en_INST_0
       (.I0(fsm_out[3]),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[0]),
        .I4(fsm_out[1]),
        .I5(unsigned_sub_done),
        .O(\out_reg[3]_0 ));
endmodule

module std_sdiv_pipe
   (sdiv_done,
    signed_mod_write_data,
    signed_div_write_data,
    SR,
    signed_div_write_en,
    reset_0,
    \quotient_msk_reg[0] ,
    Q,
    done0,
    clk,
    E,
    srhs_read_data,
    slhs_read_data,
    running_reg,
    do_signed_div_mod_go_in,
    \dividend_reg[3] ,
    \dividend_reg[3]_0 ,
    left_abs__2,
    reset,
    D);
  output sdiv_done;
  output [3:0]signed_mod_write_data;
  output [3:0]signed_div_write_data;
  output [0:0]SR;
  output signed_div_write_en;
  output reset_0;
  output [0:0]\quotient_msk_reg[0] ;
  output [0:0]Q;
  input done0;
  input clk;
  input [0:0]E;
  input [3:0]srhs_read_data;
  input [1:0]slhs_read_data;
  input running_reg;
  input do_signed_div_mod_go_in;
  input \dividend_reg[3] ;
  input \dividend_reg[3]_0 ;
  input [1:0]left_abs__2;
  input reset;
  input [0:0]D;

  wire \<const0> ;
  wire [0:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire [0:0]SR;
  wire clk;
  wire different_signs__0;
  wire \dividend_reg[3] ;
  wire \dividend_reg[3]_0 ;
  wire do_signed_div_mod_go_in;
  wire done0;
  wire [1:0]left_abs__2;
  wire left_sign;
  wire [0:0]\quotient_msk_reg[0] ;
  wire reset;
  wire reset_0;
  wire [3:1]right_abs;
  wire [3:0]right_save;
  wire right_sign;
  wire running_reg;
  wire sdiv_done;
  wire [3:0]signed_div_write_data;
  wire signed_div_write_en;
  wire [3:0]signed_mod_write_data;
  wire [1:0]slhs_read_data;
  wire [3:0]srhs_read_data;

  GND GND
       (.G(\<const0> ));
  std_div_pipe comp
       (.D(D),
        .E(\quotient_msk_reg[0] ),
        .Q(right_save),
        .SS(SR),
        .clk(clk),
        .different_signs__0(different_signs__0),
        .\dividend_reg[3]_0 (\dividend_reg[3] ),
        .\dividend_reg[3]_1 (\dividend_reg[3]_0 ),
        .\divisor_reg[6]_0 (Q),
        .do_signed_div_mod_go_in(do_signed_div_mod_go_in),
        .done0(done0),
        .done_reg_0(sdiv_done),
        .left_abs__2(left_abs__2),
        .left_sign(left_sign),
        .reset(reset),
        .reset_0(reset_0),
        .right_sign(right_sign),
        .running_reg_0(running_reg),
        .signed_div_write_data(signed_div_write_data),
        .signed_div_write_en(signed_div_write_en),
        .signed_mod_write_data(signed_mod_write_data),
        .slhs_read_data(slhs_read_data[0]),
        .srhs_read_data(srhs_read_data));
  FDRE left_sign_reg
       (.C(clk),
        .CE(E),
        .D(slhs_read_data[1]),
        .Q(left_sign),
        .R(\<const0> ));
  LUT3 #(
    .INIT(8'h6C)) 
    \right_save[1]_i_1 
       (.I0(srhs_read_data[3]),
        .I1(srhs_read_data[1]),
        .I2(srhs_read_data[0]),
        .O(right_abs[1]));
  (* SOFT_HLUTNM = "soft_lutpair235" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    \right_save[2]_i_1 
       (.I0(srhs_read_data[1]),
        .I1(srhs_read_data[0]),
        .I2(srhs_read_data[3]),
        .I3(srhs_read_data[2]),
        .O(right_abs[2]));
  (* SOFT_HLUTNM = "soft_lutpair235" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \right_save[3]_i_1 
       (.I0(srhs_read_data[2]),
        .I1(srhs_read_data[3]),
        .I2(srhs_read_data[0]),
        .I3(srhs_read_data[1]),
        .O(right_abs[3]));
  FDRE \right_save_reg[0] 
       (.C(clk),
        .CE(E),
        .D(srhs_read_data[0]),
        .Q(right_save[0]),
        .R(\<const0> ));
  FDRE \right_save_reg[1] 
       (.C(clk),
        .CE(E),
        .D(right_abs[1]),
        .Q(right_save[1]),
        .R(\<const0> ));
  FDRE \right_save_reg[2] 
       (.C(clk),
        .CE(E),
        .D(right_abs[2]),
        .Q(right_save[2]),
        .R(\<const0> ));
  FDRE \right_save_reg[3] 
       (.C(clk),
        .CE(E),
        .D(right_abs[3]),
        .Q(right_save[3]),
        .R(\<const0> ));
  FDRE right_sign_reg
       (.C(clk),
        .CE(E),
        .D(srhs_read_data[3]),
        .Q(right_sign),
        .R(\<const0> ));
  LUT2 #(
    .INIT(4'h6)) 
    \signed_div_write_data[3]_INST_0_i_1 
       (.I0(right_sign),
        .I1(left_sign),
        .O(different_signs__0));
endmodule

module std_smult_pipe
   (smul_done,
    signed_mul_write_data,
    clk,
    do_signed_mul_go_in,
    reset,
    D,
    \ltmp_reg[3] ,
    E);
  output smul_done;
  output [3:0]signed_mul_write_data;
  input clk;
  input do_signed_mul_go_in;
  input reset;
  input [3:0]D;
  input [3:0]\ltmp_reg[3] ;
  input [0:0]E;

  wire [3:0]D;
  wire [0:0]E;
  wire clk;
  wire do_signed_mul_go_in;
  wire [3:0]\ltmp_reg[3] ;
  wire reset;
  wire [3:0]signed_mul_write_data;
  wire smul_done;

  std_fp_mult_pipe comp
       (.D(D),
        .E(E),
        .clk(clk),
        .do_signed_mul_go_in(do_signed_mul_go_in),
        .\ltmp_reg[3]_0 (\ltmp_reg[3] ),
        .reset(reset),
        .signed_mul_write_data(signed_mul_write_data),
        .smul_done(smul_done));
endmodule

module std_sub
   (out0,
    a,
    b);
  output [31:0]out0;
  input [31:0]a;
  input [31:0]b;

  wire [31:0]a;
  wire [31:0]b;
  wire [31:0]out0;

  lakeroad_xilinx_ultrascale_plus_sub32_2 _impl
       (.a(a),
        .b(b),
        .out0(out0));
endmodule
