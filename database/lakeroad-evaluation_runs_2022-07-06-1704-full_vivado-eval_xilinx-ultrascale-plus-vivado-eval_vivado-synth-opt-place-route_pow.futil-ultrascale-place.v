// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:24:26 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//pow.futil-ultrascale-place.v
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
  input [0:0]a;
  input [31:0]b;

  wire \<const0> ;
  wire \<const1> ;
  wire ZERO;
  wire [0:0]a;
  wire [31:0]b;
  wire [7:7]co_11;
  wire [7:7]co_3;
  wire [7:7]co_7;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O6_1;
  wire [31:0]out0;
  wire [7:0]NLW_carry_17_CO_UNCONNECTED;
  wire [7:0]NLW_carry_26_CO_UNCONNECTED;
  wire [7:0]NLW_carry_8_CO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    A_LUT_0
       (.I0(a),
        .I1(b[0]),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[0]),
        .O6(luts_O6_1[0]));
  GND GND
       (.G(\<const0> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(ZERO));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_17
       (.CI(co_3),
        .CI_TOP(\<const0> ),
        .CO({co_7,NLW_carry_17_CO_UNCONNECTED[6:0]}),
        .DI({ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO}),
        .O(out0[15:8]),
        .S(b[15:8]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_26
       (.CI(co_7),
        .CI_TOP(\<const0> ),
        .CO({co_11,NLW_carry_26_CO_UNCONNECTED[6:0]}),
        .DI({ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO}),
        .O(out0[23:16]),
        .S(b[23:16]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_35
       (.CI(co_11),
        .CI_TOP(\<const0> ),
        .DI({ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO}),
        .O(out0[31:24]),
        .S(b[31:24]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_8
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .CO({co_3,NLW_carry_8_CO_UNCONNECTED[6:0]}),
        .DI({ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,luts_O5_0[0]}),
        .O(out0[7:0]),
        .S({b[7:1],luts_O6_1[0]}));
endmodule

module lakeroad_xilinx_ultrascale_plus_ult32_2
   (carry_35_0,
    cond0_go_in,
    comb_reg_out,
    a,
    b);
  output carry_35_0;
  input cond0_go_in;
  input comb_reg_out;
  input [31:0]a;
  input [31:0]b;

  wire \<const0> ;
  wire \<const1> ;
  wire [31:0]a;
  wire [31:0]b;
  wire carry_35_0;
  wire [7:7]co_11;
  wire [7:7]co_3;
  wire [7:7]co_7;
  wire comb_reg_out;
  wire cond0_go_in;
  wire lt_out;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O5_12;
  wire [7:0]luts_O5_4;
  wire [7:0]luts_O5_8;
  wire [7:0]luts_O6_1;
  wire [7:0]luts_O6_13;
  wire [7:0]luts_O6_5;
  wire [7:0]luts_O6_9;
  wire [7:0]NLW_carry_17_CO_UNCONNECTED;
  wire [7:0]NLW_carry_26_CO_UNCONNECTED;
  wire [7:0]NLW_carry_35_CO_UNCONNECTED;
  wire [7:0]NLW_carry_8_CO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
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
        .S(luts_O6_5));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_26
       (.CI(co_7),
        .CI_TOP(\<const0> ),
        .CO({co_11,NLW_carry_26_CO_UNCONNECTED[6:0]}),
        .DI(luts_O5_8),
        .S(luts_O6_9));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_35
       (.CI(co_11),
        .CI_TOP(\<const0> ),
        .CO({lt_out,NLW_carry_35_CO_UNCONNECTED[6:0]}),
        .DI(luts_O5_12),
        .S(luts_O6_13));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_8
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .CO({co_3,NLW_carry_8_CO_UNCONNECTED[6:0]}),
        .DI(luts_O5_0),
        .S(luts_O6_1));
  LUT3 #(
    .INIT(8'hB8)) 
    \out[0]_i_1__2 
       (.I0(lt_out),
        .I1(cond0_go_in),
        .I2(comb_reg_out),
        .O(carry_35_0));
endmodule

(* ECO_CHECKSUM = "ef9f74b5" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    out_addr0,
    out_write_data,
    out_write_en,
    out_clk,
    out_read_data,
    out_done,
    base_addr0,
    base_write_data,
    base_write_en,
    base_clk,
    base_read_data,
    base_done,
    exp_addr0,
    exp_write_data,
    exp_write_en,
    exp_clk,
    exp_read_data,
    exp_done);
  input go;
  input clk;
  input reset;
  output done;
  output out_addr0;
  output [31:0]out_write_data;
  output out_write_en;
  output out_clk;
  input [31:0]out_read_data;
  input out_done;
  output base_addr0;
  output [31:0]base_write_data;
  output base_write_en;
  output base_clk;
  input [31:0]base_read_data;
  input base_done;
  output exp_addr0;
  output [31:0]exp_write_data;
  output exp_write_en;
  output exp_clk;
  input [31:0]exp_read_data;
  input exp_done;

  wire \<const0> ;
  wire [31:0]base_read_data;
  wire base_reg_n_1;
  wire base_reg_n_10;
  wire base_reg_n_11;
  wire base_reg_n_12;
  wire base_reg_n_13;
  wire base_reg_n_14;
  wire base_reg_n_15;
  wire base_reg_n_16;
  wire base_reg_n_17;
  wire base_reg_n_18;
  wire base_reg_n_19;
  wire base_reg_n_2;
  wire base_reg_n_20;
  wire base_reg_n_21;
  wire base_reg_n_22;
  wire base_reg_n_23;
  wire base_reg_n_24;
  wire base_reg_n_25;
  wire base_reg_n_26;
  wire base_reg_n_27;
  wire base_reg_n_28;
  wire base_reg_n_29;
  wire base_reg_n_3;
  wire base_reg_n_30;
  wire base_reg_n_31;
  wire base_reg_n_32;
  wire base_reg_n_4;
  wire base_reg_n_5;
  wire base_reg_n_6;
  wire base_reg_n_7;
  wire base_reg_n_8;
  wire base_reg_n_9;
  wire clk;
  wire done;
  wire [31:0]exp_read_data;
  wire exp_reg_done;
  wire exp_reg_n_0;
  wire exp_reg_n_1;
  wire exp_reg_n_10;
  wire exp_reg_n_11;
  wire exp_reg_n_12;
  wire exp_reg_n_13;
  wire exp_reg_n_14;
  wire exp_reg_n_15;
  wire exp_reg_n_16;
  wire exp_reg_n_17;
  wire exp_reg_n_18;
  wire exp_reg_n_19;
  wire exp_reg_n_2;
  wire exp_reg_n_20;
  wire exp_reg_n_21;
  wire exp_reg_n_22;
  wire exp_reg_n_23;
  wire exp_reg_n_24;
  wire exp_reg_n_25;
  wire exp_reg_n_26;
  wire exp_reg_n_27;
  wire exp_reg_n_28;
  wire exp_reg_n_29;
  wire exp_reg_n_3;
  wire exp_reg_n_30;
  wire exp_reg_n_31;
  wire exp_reg_n_4;
  wire exp_reg_n_5;
  wire exp_reg_n_6;
  wire exp_reg_n_7;
  wire exp_reg_n_8;
  wire exp_reg_n_9;
  wire [1:1]fsm_in;
  wire fsm_n_3;
  wire [1:0]fsm_out;
  wire go;
  wire init_go_in;
  wire out_done;
  wire [31:0]out_write_data;
  wire out_write_en;
  wire p_n_1;
  wire p_n_10;
  wire p_n_11;
  wire p_n_12;
  wire p_n_13;
  wire p_n_14;
  wire p_n_15;
  wire p_n_16;
  wire p_n_17;
  wire p_n_18;
  wire p_n_19;
  wire p_n_2;
  wire p_n_20;
  wire p_n_21;
  wire p_n_22;
  wire p_n_23;
  wire p_n_24;
  wire p_n_25;
  wire p_n_26;
  wire p_n_27;
  wire p_n_28;
  wire p_n_29;
  wire p_n_3;
  wire p_n_30;
  wire p_n_31;
  wire p_n_32;
  wire p_n_33;
  wire p_n_4;
  wire p_n_5;
  wire p_n_6;
  wire p_n_7;
  wire p_n_8;
  wire p_n_9;
  wire reset;

  assign base_addr0 = \<const0> ;
  assign base_clk = clk;
  assign base_write_data[31] = \<const0> ;
  assign base_write_data[30] = \<const0> ;
  assign base_write_data[29] = \<const0> ;
  assign base_write_data[28] = \<const0> ;
  assign base_write_data[27] = \<const0> ;
  assign base_write_data[26] = \<const0> ;
  assign base_write_data[25] = \<const0> ;
  assign base_write_data[24] = \<const0> ;
  assign base_write_data[23] = \<const0> ;
  assign base_write_data[22] = \<const0> ;
  assign base_write_data[21] = \<const0> ;
  assign base_write_data[20] = \<const0> ;
  assign base_write_data[19] = \<const0> ;
  assign base_write_data[18] = \<const0> ;
  assign base_write_data[17] = \<const0> ;
  assign base_write_data[16] = \<const0> ;
  assign base_write_data[15] = \<const0> ;
  assign base_write_data[14] = \<const0> ;
  assign base_write_data[13] = \<const0> ;
  assign base_write_data[12] = \<const0> ;
  assign base_write_data[11] = \<const0> ;
  assign base_write_data[10] = \<const0> ;
  assign base_write_data[9] = \<const0> ;
  assign base_write_data[8] = \<const0> ;
  assign base_write_data[7] = \<const0> ;
  assign base_write_data[6] = \<const0> ;
  assign base_write_data[5] = \<const0> ;
  assign base_write_data[4] = \<const0> ;
  assign base_write_data[3] = \<const0> ;
  assign base_write_data[2] = \<const0> ;
  assign base_write_data[1] = \<const0> ;
  assign base_write_data[0] = \<const0> ;
  assign base_write_en = \<const0> ;
  assign exp_addr0 = \<const0> ;
  assign exp_clk = clk;
  assign exp_write_data[31] = \<const0> ;
  assign exp_write_data[30] = \<const0> ;
  assign exp_write_data[29] = \<const0> ;
  assign exp_write_data[28] = \<const0> ;
  assign exp_write_data[27] = \<const0> ;
  assign exp_write_data[26] = \<const0> ;
  assign exp_write_data[25] = \<const0> ;
  assign exp_write_data[24] = \<const0> ;
  assign exp_write_data[23] = \<const0> ;
  assign exp_write_data[22] = \<const0> ;
  assign exp_write_data[21] = \<const0> ;
  assign exp_write_data[20] = \<const0> ;
  assign exp_write_data[19] = \<const0> ;
  assign exp_write_data[18] = \<const0> ;
  assign exp_write_data[17] = \<const0> ;
  assign exp_write_data[16] = \<const0> ;
  assign exp_write_data[15] = \<const0> ;
  assign exp_write_data[14] = \<const0> ;
  assign exp_write_data[13] = \<const0> ;
  assign exp_write_data[12] = \<const0> ;
  assign exp_write_data[11] = \<const0> ;
  assign exp_write_data[10] = \<const0> ;
  assign exp_write_data[9] = \<const0> ;
  assign exp_write_data[8] = \<const0> ;
  assign exp_write_data[7] = \<const0> ;
  assign exp_write_data[6] = \<const0> ;
  assign exp_write_data[5] = \<const0> ;
  assign exp_write_data[4] = \<const0> ;
  assign exp_write_data[3] = \<const0> ;
  assign exp_write_data[2] = \<const0> ;
  assign exp_write_data[1] = \<const0> ;
  assign exp_write_data[0] = \<const0> ;
  assign exp_write_en = \<const0> ;
  assign out_addr0 = \<const0> ;
  assign out_clk = clk;
  GND GND
       (.G(\<const0> ));
  std_reg base_reg
       (.E(init_go_in),
        .Q({base_reg_n_1,base_reg_n_2,base_reg_n_3,base_reg_n_4,base_reg_n_5,base_reg_n_6,base_reg_n_7,base_reg_n_8,base_reg_n_9,base_reg_n_10,base_reg_n_11,base_reg_n_12,base_reg_n_13,base_reg_n_14,base_reg_n_15,base_reg_n_16,base_reg_n_17,base_reg_n_18,base_reg_n_19,base_reg_n_20,base_reg_n_21,base_reg_n_22,base_reg_n_23,base_reg_n_24,base_reg_n_25,base_reg_n_26,base_reg_n_27,base_reg_n_28,base_reg_n_29,base_reg_n_30,base_reg_n_31,base_reg_n_32}),
        .base_read_data(base_read_data),
        .clk(clk),
        .exp_reg_done(exp_reg_done),
        .reset(reset));
  std_reg_0 exp_reg
       (.E(init_go_in),
        .Q({exp_reg_n_0,exp_reg_n_1,exp_reg_n_2,exp_reg_n_3,exp_reg_n_4,exp_reg_n_5,exp_reg_n_6,exp_reg_n_7,exp_reg_n_8,exp_reg_n_9,exp_reg_n_10,exp_reg_n_11,exp_reg_n_12,exp_reg_n_13,exp_reg_n_14,exp_reg_n_15,exp_reg_n_16,exp_reg_n_17,exp_reg_n_18,exp_reg_n_19,exp_reg_n_20,exp_reg_n_21,exp_reg_n_22,exp_reg_n_23,exp_reg_n_24,exp_reg_n_25,exp_reg_n_26,exp_reg_n_27,exp_reg_n_28,exp_reg_n_29,exp_reg_n_30,exp_reg_n_31}),
        .clk(clk),
        .exp_read_data(exp_read_data),
        .reset(reset));
  std_reg__parameterized2 fsm
       (.D(fsm_in),
        .E(init_go_in),
        .Q(fsm_out),
        .clk(clk),
        .done(done),
        .exp_reg_done(exp_reg_done),
        .go(go),
        .go_0(fsm_n_3),
        .out_done(out_done),
        .\out_reg[0]_0 (p_n_1),
        .out_write_data(out_write_data),
        .\out_write_data[31] ({p_n_2,p_n_3,p_n_4,p_n_5,p_n_6,p_n_7,p_n_8,p_n_9,p_n_10,p_n_11,p_n_12,p_n_13,p_n_14,p_n_15,p_n_16,p_n_17,p_n_18,p_n_19,p_n_20,p_n_21,p_n_22,p_n_23,p_n_24,p_n_25,p_n_26,p_n_27,p_n_28,p_n_29,p_n_30,p_n_31,p_n_32,p_n_33}),
        .out_write_en(out_write_en),
        .reset(reset));
  pow p
       (.D(fsm_in),
        .H_LUT_34({exp_reg_n_0,exp_reg_n_1,exp_reg_n_2,exp_reg_n_3,exp_reg_n_4,exp_reg_n_5,exp_reg_n_6,exp_reg_n_7,exp_reg_n_8,exp_reg_n_9,exp_reg_n_10,exp_reg_n_11,exp_reg_n_12,exp_reg_n_13,exp_reg_n_14,exp_reg_n_15,exp_reg_n_16,exp_reg_n_17,exp_reg_n_18,exp_reg_n_19,exp_reg_n_20,exp_reg_n_21,exp_reg_n_22,exp_reg_n_23,exp_reg_n_24,exp_reg_n_25,exp_reg_n_26,exp_reg_n_27,exp_reg_n_28,exp_reg_n_29,exp_reg_n_30,exp_reg_n_31}),
        .Q(fsm_out),
        .clk(clk),
        .go(go),
        .out0({base_reg_n_1,base_reg_n_2,base_reg_n_3,base_reg_n_4,base_reg_n_5,base_reg_n_6,base_reg_n_7,base_reg_n_8,base_reg_n_9,base_reg_n_10,base_reg_n_11,base_reg_n_12,base_reg_n_13,base_reg_n_14,base_reg_n_15,base_reg_n_16,base_reg_n_17,base_reg_n_18,base_reg_n_19,base_reg_n_20,base_reg_n_21,base_reg_n_22,base_reg_n_23,base_reg_n_24,base_reg_n_25,base_reg_n_26,base_reg_n_27,base_reg_n_28,base_reg_n_29,base_reg_n_30,base_reg_n_31,base_reg_n_32}),
        .out_done(out_done),
        .\out_reg[0] (p_n_1),
        .\out_reg[0]_0 (fsm_n_3),
        .\out_reg[31] ({p_n_2,p_n_3,p_n_4,p_n_5,p_n_6,p_n_7,p_n_8,p_n_9,p_n_10,p_n_11,p_n_12,p_n_13,p_n_14,p_n_15,p_n_16,p_n_17,p_n_18,p_n_19,p_n_20,p_n_21,p_n_22,p_n_23,p_n_24,p_n_25,p_n_26,p_n_27,p_n_28,p_n_29,p_n_30,p_n_31,p_n_32,p_n_33}),
        .reset(reset));
endmodule

module pow
   (D,
    \out_reg[0] ,
    \out_reg[31] ,
    clk,
    reset,
    out_done,
    go,
    Q,
    \out_reg[0]_0 ,
    H_LUT_34,
    out0);
  output [0:0]D;
  output \out_reg[0] ;
  output [31:0]\out_reg[31] ;
  input clk;
  input reset;
  input out_done;
  input go;
  input [1:0]Q;
  input \out_reg[0]_0 ;
  input [31:0]H_LUT_34;
  input [31:0]out0;

  wire [0:0]D;
  wire [31:0]H_LUT_34;
  wire [1:0]Q;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire [31:16]\comp/out_tmp_reg ;
  wire cond0_go_in;
  wire count_done;
  wire [31:0]count_in;
  wire count_n_34;
  wire count_n_35;
  wire count_n_36;
  wire count_n_37;
  wire count_n_38;
  wire count_n_39;
  wire count_n_40;
  wire count_n_41;
  wire count_n_42;
  wire count_n_43;
  wire count_n_44;
  wire count_n_45;
  wire count_n_46;
  wire count_n_47;
  wire count_n_48;
  wire count_n_49;
  wire count_n_50;
  wire count_n_51;
  wire count_n_52;
  wire count_n_53;
  wire count_n_54;
  wire count_n_55;
  wire count_n_56;
  wire count_n_57;
  wire count_n_58;
  wire count_n_59;
  wire count_n_60;
  wire count_n_61;
  wire count_n_62;
  wire count_n_63;
  wire count_n_64;
  wire count_n_65;
  wire count_write_en;
  wire [2:2]fsm_in;
  wire fsm_n_2;
  wire fsm_n_3;
  wire fsm_n_72;
  wire fsm_n_73;
  wire [1:1]fsm_out;
  wire go;
  wire incr_count_go_in;
  wire [31:0]incr_out;
  wire [31:0]incr_right;
  wire [31:0]lt_left;
  wire lt_n_0;
  wire [31:0]lt_right;
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
  wire [31:0]out0;
  wire out_done;
  wire \out_reg[0] ;
  wire \out_reg[0]_0 ;
  wire [31:0]\out_reg[31] ;
  wire [31:0]p_0_in;
  wire pd0_out;
  wire pd_n_1;
  wire pd_out;
  wire reset;
  wire t_done;
  wire [31:0]t_in;
  wire t_n_1;
  wire t_n_10;
  wire t_n_11;
  wire t_n_12;
  wire t_n_13;
  wire t_n_14;
  wire t_n_15;
  wire t_n_16;
  wire t_n_17;
  wire t_n_2;
  wire t_n_3;
  wire t_n_4;
  wire t_n_5;
  wire t_n_50;
  wire t_n_51;
  wire t_n_52;
  wire t_n_53;
  wire t_n_54;
  wire t_n_55;
  wire t_n_56;
  wire t_n_57;
  wire t_n_58;
  wire t_n_59;
  wire t_n_6;
  wire t_n_60;
  wire t_n_61;
  wire t_n_62;
  wire t_n_63;
  wire t_n_64;
  wire t_n_7;
  wire t_n_8;
  wire t_n_9;
  wire t_write_en;

  std_reg__parameterized0 comb_reg
       (.D(fsm_in),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond0_go_in(cond0_go_in),
        .\out_reg[0]_0 (lt_n_0),
        .\out_reg[2] (fsm_n_3),
        .reset(reset));
  std_reg_1 count
       (.A_LUT_0(fsm_n_2),
        .D(t_in[0]),
        .E(count_write_en),
        .Q(fsm_out),
        .b(incr_right),
        .clk(clk),
        .count_done(count_done),
        .\out_reg[0]_0 (mul_n_32),
        .\out_reg[31]_0 ({count_n_34,count_n_35,count_n_36,count_n_37,count_n_38,count_n_39,count_n_40,count_n_41,count_n_42,count_n_43,count_n_44,count_n_45,count_n_46,count_n_47,count_n_48,count_n_49,count_n_50,count_n_51,count_n_52,count_n_53,count_n_54,count_n_55,count_n_56,count_n_57,count_n_58,count_n_59,count_n_60,count_n_61,count_n_62,count_n_63,count_n_64,count_n_65}),
        .\out_reg[31]_1 (count_in),
        .pd0_out(pd0_out),
        .pd_out(pd_out),
        .reset(reset),
        .t_done(t_done));
  std_reg__parameterized1 fsm
       (.D(D),
        .E(count_write_en),
        .H_LUT_34({count_n_34,count_n_35,count_n_36,count_n_37,count_n_38,count_n_39,count_n_40,count_n_41,count_n_42,count_n_43,count_n_44,count_n_45,count_n_46,count_n_47,count_n_48,count_n_49,count_n_50,count_n_51,count_n_52,count_n_53,count_n_54,count_n_55,count_n_56,count_n_57,count_n_58,count_n_59,count_n_60,count_n_61,count_n_62,count_n_63,count_n_64,count_n_65}),
        .H_LUT_34_0(H_LUT_34),
        .Q(fsm_out),
        .a(lt_left),
        .b(lt_right),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond0_go_in(cond0_go_in),
        .count_done(count_done),
        .done_reg(t_write_en),
        .done_reg_0(fsm_n_72),
        .done_reg_1(fsm_n_73),
        .done_reg_2(Q),
        .go(go),
        .mul_done(mul_done),
        .out_done(out_done),
        .\out_reg[0]_0 (fsm_n_2),
        .\out_reg[0]_1 (fsm_n_3),
        .\out_reg[0]_2 (\out_reg[0] ),
        .\out_reg[0]_3 (\out_reg[0]_0 ),
        .\out_reg[2]_0 (fsm_in),
        .pd0_out(pd0_out),
        .pd_out(pd_out),
        .reset(reset),
        .t_done(t_done));
  std_add incr
       (.a(incr_count_go_in),
        .b(incr_right),
        .out0(incr_out));
  std_lt lt
       (.a(lt_left),
        .b(lt_right),
        .carry_35(lt_n_0),
        .comb_reg_out(comb_reg_out),
        .cond0_go_in(cond0_go_in));
  std_mult_pipe mul
       (.B({t_n_1,t_n_2,t_n_3,t_n_4,t_n_5,t_n_6,t_n_7,t_n_8,t_n_9,t_n_10,t_n_11,t_n_12,t_n_13,t_n_14,t_n_15,t_n_16,t_n_17}),
        .E(mul_go),
        .Q({mul_n_17,mul_n_18,mul_n_19,mul_n_20,mul_n_21,mul_n_22,mul_n_23,mul_n_24,mul_n_25,mul_n_26,mul_n_27,mul_n_28,mul_n_29,mul_n_30,mul_n_31,mul_n_32}),
        .clk(clk),
        .\done_buf_reg[0] (fsm_n_2),
        .\done_buf_reg[2] (pd_n_1),
        .mul_done(mul_done),
        .out_tmp_reg(\comp/out_tmp_reg ),
        .out_tmp_reg_0({t_n_50,t_n_51,t_n_52,t_n_53,t_n_54,t_n_55,t_n_56,t_n_57,t_n_58,t_n_59,t_n_60,t_n_61,t_n_62,t_n_63,t_n_64}),
        .p_0_in(p_0_in),
        .pd_out(pd_out),
        .reset(reset),
        .t_done(t_done));
  std_reg__parameterized0_2 pd
       (.D(t_in[31:1]),
        .E(mul_go),
        .Q({mul_n_17,mul_n_18,mul_n_19,mul_n_20,mul_n_21,mul_n_22,mul_n_23,mul_n_24,mul_n_25,mul_n_26,mul_n_27,mul_n_28,mul_n_29,mul_n_30,mul_n_31}),
        .clk(clk),
        .\done_buf_reg[2] (fsm_n_2),
        .mul_done(mul_done),
        .out0(out0),
        .\out_reg[0]_0 (pd_n_1),
        .\out_reg[0]_1 (fsm_n_72),
        .\out_reg[31] (\comp/out_tmp_reg ),
        .p_0_in(p_0_in),
        .pd_out(pd_out),
        .reset(reset),
        .t_done(t_done));
  std_reg__parameterized0_3 pd0
       (.A_LUT_0(fsm_n_2),
        .a(incr_count_go_in),
        .clk(clk),
        .count_done(count_done),
        .out0(incr_out),
        .\out_reg[0]_0 (count_in),
        .\out_reg[0]_1 (fsm_n_73),
        .pd0_out(pd0_out),
        .reset(reset));
  std_reg_4 t
       (.B({t_n_1,t_n_2,t_n_3,t_n_4,t_n_5,t_n_6,t_n_7,t_n_8,t_n_9,t_n_10,t_n_11,t_n_12,t_n_13,t_n_14,t_n_15,t_n_16,t_n_17}),
        .D(t_in),
        .E(t_write_en),
        .clk(clk),
        .mul_done(mul_done),
        .out0__0(fsm_n_2),
        .\out_reg[0]_0 ({t_n_50,t_n_51,t_n_52,t_n_53,t_n_54,t_n_55,t_n_56,t_n_57,t_n_58,t_n_59,t_n_60,t_n_61,t_n_62,t_n_63,t_n_64}),
        .\out_reg[31]_0 (\out_reg[31] ),
        .pd_out(pd_out),
        .reset(reset),
        .t_done(t_done));
endmodule

module std_add
   (out0,
    a,
    b);
  output [31:0]out0;
  input [0:0]a;
  input [31:0]b;

  wire [0:0]a;
  wire [31:0]b;
  wire [31:0]out0;

  lakeroad_xilinx_ultrascale_plus_add32_2 _impl
       (.a(a),
        .b(b),
        .out0(out0));
endmodule

module std_fp_mult_pipe
   (mul_done,
    out_tmp_reg_0,
    Q,
    clk,
    \done_buf_reg[2]_0 ,
    E,
    reset,
    p_0_in,
    B,
    out_tmp_reg_1,
    pd_out,
    t_done,
    \done_buf_reg[0]_0 );
  output mul_done;
  output [15:0]out_tmp_reg_0;
  output [15:0]Q;
  input clk;
  input \done_buf_reg[2]_0 ;
  input [0:0]E;
  input reset;
  input [31:0]p_0_in;
  input [16:0]B;
  input [14:0]out_tmp_reg_1;
  input pd_out;
  input t_done;
  input \done_buf_reg[0]_0 ;

  wire \<const0> ;
  wire \<const1> ;
  wire [16:0]B;
  wire [0:0]E;
  wire GND_2;
  wire [15:0]Q;
  wire VCC_2;
  wire clk;
  wire \done_buf_reg[0]_0 ;
  wire \done_buf_reg[2]_0 ;
  wire \done_buf_reg_n_0_[0] ;
  wire \done_buf_reg_n_0_[1] ;
  wire mul_done;
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
  wire [14:0]out_tmp_reg_1;
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
  wire [31:0]p_0_in;
  wire pd_out;
  wire reset;
  wire start;
  wire t_done;
  wire [7:0]NLW_out0_carry_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  VCC VCC
       (.P(\<const1> ));
  VCC VCC_1
       (.P(VCC_2));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \done_buf[0]_i_1 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[0]_0 ),
        .I3(\done_buf_reg_n_0_[0] ),
        .I4(\done_buf_reg_n_0_[1] ),
        .I5(mul_done),
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
        .Q(mul_done),
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
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY8 out0_carry
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({out0_carry_n_0,NLW_out0_carry_CO_UNCONNECTED[6:0]}),
        .DI({out_tmp_reg_n_99,out_tmp_reg_n_100,out_tmp_reg_n_101,out_tmp_reg_n_102,out_tmp_reg_n_103,out_tmp_reg_n_104,out_tmp_reg_n_105,\<const0> }),
        .O(out_tmp_reg_0[7:0]),
        .S({out0_carry_i_1__0_n_0,out0_carry_i_2_n_0,out0_carry_i_3_n_0,out0_carry_i_4_n_0,out0_carry_i_5_n_0,out0_carry_i_6_n_0,out0_carry_i_7_n_0,\out_tmp_reg[16]__0_n_0 }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out0_carry__0
       (.CI(out0_carry_n_0),
        .CI_TOP(GND_2),
        .DI({\<const0> ,out_tmp_reg_n_92,out_tmp_reg_n_93,out_tmp_reg_n_94,out_tmp_reg_n_95,out_tmp_reg_n_96,out_tmp_reg_n_97,out_tmp_reg_n_98}),
        .O(out_tmp_reg_0[15:8]),
        .S({out0_carry_i_1_n_0,out0_carry_i_2__0_n_0,out0_carry_i_3__0_n_0,out0_carry_i_4__0_n_0,out0_carry_i_5__0_n_0,out0_carry_i_6__0_n_0,out0_carry_i_7__0_n_0,out0_carry_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_1
       (.I0(out_tmp_reg_n_91),
        .I1(out0_n_91),
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
endmodule

module std_lt
   (carry_35,
    cond0_go_in,
    comb_reg_out,
    a,
    b);
  output carry_35;
  input cond0_go_in;
  input comb_reg_out;
  input [31:0]a;
  input [31:0]b;

  wire [31:0]a;
  wire [31:0]b;
  wire carry_35;
  wire comb_reg_out;
  wire cond0_go_in;

  lakeroad_xilinx_ultrascale_plus_ult32_2 _impl
       (.a(a),
        .b(b),
        .carry_35_0(carry_35),
        .comb_reg_out(comb_reg_out),
        .cond0_go_in(cond0_go_in));
endmodule

module std_mult_pipe
   (mul_done,
    out_tmp_reg,
    Q,
    clk,
    \done_buf_reg[2] ,
    E,
    reset,
    p_0_in,
    B,
    out_tmp_reg_0,
    pd_out,
    t_done,
    \done_buf_reg[0] );
  output mul_done;
  output [15:0]out_tmp_reg;
  output [15:0]Q;
  input clk;
  input \done_buf_reg[2] ;
  input [0:0]E;
  input reset;
  input [31:0]p_0_in;
  input [16:0]B;
  input [14:0]out_tmp_reg_0;
  input pd_out;
  input t_done;
  input \done_buf_reg[0] ;

  wire [16:0]B;
  wire [0:0]E;
  wire [15:0]Q;
  wire clk;
  wire \done_buf_reg[0] ;
  wire \done_buf_reg[2] ;
  wire mul_done;
  wire [15:0]out_tmp_reg;
  wire [14:0]out_tmp_reg_0;
  wire [31:0]p_0_in;
  wire pd_out;
  wire reset;
  wire t_done;

  std_fp_mult_pipe comp
       (.B(B),
        .E(E),
        .Q(Q),
        .clk(clk),
        .\done_buf_reg[0]_0 (\done_buf_reg[0] ),
        .\done_buf_reg[2]_0 (\done_buf_reg[2] ),
        .mul_done(mul_done),
        .out_tmp_reg_0(out_tmp_reg),
        .out_tmp_reg_1(out_tmp_reg_0),
        .p_0_in(p_0_in),
        .pd_out(pd_out),
        .reset(reset),
        .t_done(t_done));
endmodule

module std_reg
   (exp_reg_done,
    Q,
    reset,
    E,
    clk,
    base_read_data);
  output exp_reg_done;
  output [31:0]Q;
  input reset;
  input [0:0]E;
  input clk;
  input [31:0]base_read_data;

  wire \<const1> ;
  wire [0:0]E;
  wire [31:0]Q;
  wire [31:0]base_read_data;
  wire clk;
  wire exp_reg_done;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(exp_reg_done),
        .R(reset));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[10]),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[11]),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[12]),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[13]),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[14]),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[15]),
        .Q(Q[15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[16]),
        .Q(Q[16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[17]),
        .Q(Q[17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[18]),
        .Q(Q[18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[19]),
        .Q(Q[19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[20]),
        .Q(Q[20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[21]),
        .Q(Q[21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[22]),
        .Q(Q[22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[23]),
        .Q(Q[23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[24]),
        .Q(Q[24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[25]),
        .Q(Q[25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[26]),
        .Q(Q[26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[27]),
        .Q(Q[27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[28]),
        .Q(Q[28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[29]),
        .Q(Q[29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[30]),
        .Q(Q[30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[31]),
        .Q(Q[31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[3]),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[4]),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[5]),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[6]),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[7]),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[8]),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(base_read_data[9]),
        .Q(Q[9]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_0
   (Q,
    reset,
    E,
    exp_read_data,
    clk);
  output [31:0]Q;
  input reset;
  input [0:0]E;
  input [31:0]exp_read_data;
  input clk;

  wire [0:0]E;
  wire [31:0]Q;
  wire clk;
  wire [31:0]exp_read_data;
  wire reset;

  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[10]),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[11]),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[12]),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[13]),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[14]),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[15]),
        .Q(Q[15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[16]),
        .Q(Q[16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[17]),
        .Q(Q[17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[18]),
        .Q(Q[18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[19]),
        .Q(Q[19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[20]),
        .Q(Q[20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[21]),
        .Q(Q[21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[22]),
        .Q(Q[22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[23]),
        .Q(Q[23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[24]),
        .Q(Q[24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[25]),
        .Q(Q[25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[26]),
        .Q(Q[26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[27]),
        .Q(Q[27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[28]),
        .Q(Q[28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[29]),
        .Q(Q[29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[30]),
        .Q(Q[30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[31]),
        .Q(Q[31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[3]),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[4]),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[5]),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[6]),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[7]),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[8]),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(exp_read_data[9]),
        .Q(Q[9]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_1
   (count_done,
    D,
    b,
    \out_reg[31]_0 ,
    reset,
    E,
    clk,
    Q,
    \out_reg[0]_0 ,
    pd_out,
    t_done,
    pd0_out,
    A_LUT_0,
    \out_reg[31]_1 );
  output count_done;
  output [0:0]D;
  output [31:0]b;
  output [31:0]\out_reg[31]_0 ;
  input reset;
  input [0:0]E;
  input clk;
  input [0:0]Q;
  input [0:0]\out_reg[0]_0 ;
  input pd_out;
  input t_done;
  input pd0_out;
  input A_LUT_0;
  input [31:0]\out_reg[31]_1 ;

  wire \<const1> ;
  wire A_LUT_0;
  wire [0:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire [31:0]b;
  wire clk;
  wire count_done;
  wire [0:0]\out_reg[0]_0 ;
  wire [31:0]\out_reg[31]_0 ;
  wire [31:0]\out_reg[31]_1 ;
  wire pd0_out;
  wire pd_out;
  wire reset;
  wire t_done;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    A_LUT_0_i_2__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [0]),
        .O(b[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    A_LUT_18_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [16]),
        .O(b[16]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    A_LUT_27_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [24]),
        .O(b[24]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    A_LUT_9_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [8]),
        .O(b[8]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    B_LUT_10_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [9]),
        .O(b[9]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    B_LUT_19_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [17]),
        .O(b[17]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    B_LUT_1_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [1]),
        .O(b[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    B_LUT_28_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [25]),
        .O(b[25]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    C_LUT_11_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [10]),
        .O(b[10]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    C_LUT_20_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [18]),
        .O(b[18]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    C_LUT_29_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [26]),
        .O(b[26]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    C_LUT_2_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [2]),
        .O(b[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    D_LUT_12_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [11]),
        .O(b[11]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    D_LUT_21_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [19]),
        .O(b[19]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    D_LUT_30_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [27]),
        .O(b[27]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    D_LUT_3_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [3]),
        .O(b[3]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    E_LUT_13_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [12]),
        .O(b[12]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    E_LUT_22_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [20]),
        .O(b[20]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    E_LUT_31_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [28]),
        .O(b[28]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    E_LUT_4_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [4]),
        .O(b[4]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    F_LUT_14_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [13]),
        .O(b[13]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    F_LUT_23_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [21]),
        .O(b[21]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    F_LUT_32_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [29]),
        .O(b[29]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    F_LUT_5_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [5]),
        .O(b[5]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    G_LUT_15_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [14]),
        .O(b[14]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    G_LUT_24_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [22]),
        .O(b[22]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    G_LUT_33_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [30]),
        .O(b[30]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    G_LUT_6_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [6]),
        .O(b[6]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    H_LUT_16_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [15]),
        .O(b[15]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    H_LUT_25_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [23]),
        .O(b[23]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    H_LUT_34_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [31]),
        .O(b[31]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    H_LUT_7_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(\out_reg[31]_0 [7]),
        .O(b[7]));
  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(count_done),
        .R(reset));
  LUT5 #(
    .INIT(32'h111133F3)) 
    \out[0]_i_1__1 
       (.I0(count_done),
        .I1(Q),
        .I2(\out_reg[0]_0 ),
        .I3(pd_out),
        .I4(t_done),
        .O(D));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [0]),
        .Q(\out_reg[31]_0 [0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [10]),
        .Q(\out_reg[31]_0 [10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [11]),
        .Q(\out_reg[31]_0 [11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [12]),
        .Q(\out_reg[31]_0 [12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [13]),
        .Q(\out_reg[31]_0 [13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [14]),
        .Q(\out_reg[31]_0 [14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [15]),
        .Q(\out_reg[31]_0 [15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [16]),
        .Q(\out_reg[31]_0 [16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [17]),
        .Q(\out_reg[31]_0 [17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [18]),
        .Q(\out_reg[31]_0 [18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [19]),
        .Q(\out_reg[31]_0 [19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [1]),
        .Q(\out_reg[31]_0 [1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [20]),
        .Q(\out_reg[31]_0 [20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [21]),
        .Q(\out_reg[31]_0 [21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [22]),
        .Q(\out_reg[31]_0 [22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [23]),
        .Q(\out_reg[31]_0 [23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [24]),
        .Q(\out_reg[31]_0 [24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [25]),
        .Q(\out_reg[31]_0 [25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [26]),
        .Q(\out_reg[31]_0 [26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [27]),
        .Q(\out_reg[31]_0 [27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [28]),
        .Q(\out_reg[31]_0 [28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [29]),
        .Q(\out_reg[31]_0 [29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [2]),
        .Q(\out_reg[31]_0 [2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [30]),
        .Q(\out_reg[31]_0 [30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [31]),
        .Q(\out_reg[31]_0 [31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [3]),
        .Q(\out_reg[31]_0 [3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [4]),
        .Q(\out_reg[31]_0 [4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [5]),
        .Q(\out_reg[31]_0 [5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [6]),
        .Q(\out_reg[31]_0 [6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [7]),
        .Q(\out_reg[31]_0 [7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [8]),
        .Q(\out_reg[31]_0 [8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_1 [9]),
        .Q(\out_reg[31]_0 [9]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_4
   (t_done,
    B,
    \out_reg[31]_0 ,
    \out_reg[0]_0 ,
    reset,
    E,
    clk,
    pd_out,
    out0__0,
    mul_done,
    D);
  output t_done;
  output [16:0]B;
  output [31:0]\out_reg[31]_0 ;
  output [14:0]\out_reg[0]_0 ;
  input reset;
  input [0:0]E;
  input clk;
  input pd_out;
  input out0__0;
  input mul_done;
  input [31:0]D;

  wire \<const1> ;
  wire [16:0]B;
  wire [31:0]D;
  wire [0:0]E;
  wire clk;
  wire mul_done;
  wire out0__0;
  wire [14:0]\out_reg[0]_0 ;
  wire [31:0]\out_reg[31]_0 ;
  wire pd_out;
  wire reset;
  wire t_done;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(t_done),
        .R(reset));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_17__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [16]),
        .I4(mul_done),
        .O(B[16]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_18
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [15]),
        .I4(mul_done),
        .O(B[15]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_19
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [14]),
        .I4(mul_done),
        .O(B[14]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_20
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [13]),
        .I4(mul_done),
        .O(B[13]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_21
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [12]),
        .I4(mul_done),
        .O(B[12]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_22
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [11]),
        .I4(mul_done),
        .O(B[11]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_23
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [10]),
        .I4(mul_done),
        .O(B[10]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_24
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [9]),
        .I4(mul_done),
        .O(B[9]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_25
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [8]),
        .I4(mul_done),
        .O(B[8]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_26
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [7]),
        .I4(mul_done),
        .O(B[7]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_27
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [6]),
        .I4(mul_done),
        .O(B[6]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_28
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [5]),
        .I4(mul_done),
        .O(B[5]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_29
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [4]),
        .I4(mul_done),
        .O(B[4]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_30
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [3]),
        .I4(mul_done),
        .O(B[3]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_31
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [2]),
        .I4(mul_done),
        .O(B[2]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_32
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [1]),
        .I4(mul_done),
        .O(B[1]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_33
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [0]),
        .I4(mul_done),
        .O(B[0]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .Q(\out_reg[31]_0 [0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(D[10]),
        .Q(\out_reg[31]_0 [10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(D[11]),
        .Q(\out_reg[31]_0 [11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(D[12]),
        .Q(\out_reg[31]_0 [12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(D[13]),
        .Q(\out_reg[31]_0 [13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(D[14]),
        .Q(\out_reg[31]_0 [14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(D[15]),
        .Q(\out_reg[31]_0 [15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(D[16]),
        .Q(\out_reg[31]_0 [16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(D[17]),
        .Q(\out_reg[31]_0 [17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(D[18]),
        .Q(\out_reg[31]_0 [18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(D[19]),
        .Q(\out_reg[31]_0 [19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .Q(\out_reg[31]_0 [1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(D[20]),
        .Q(\out_reg[31]_0 [20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(D[21]),
        .Q(\out_reg[31]_0 [21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(D[22]),
        .Q(\out_reg[31]_0 [22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(D[23]),
        .Q(\out_reg[31]_0 [23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(D[24]),
        .Q(\out_reg[31]_0 [24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(D[25]),
        .Q(\out_reg[31]_0 [25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(D[26]),
        .Q(\out_reg[31]_0 [26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(D[27]),
        .Q(\out_reg[31]_0 [27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(D[28]),
        .Q(\out_reg[31]_0 [28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(D[29]),
        .Q(\out_reg[31]_0 [29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .Q(\out_reg[31]_0 [2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(D[30]),
        .Q(\out_reg[31]_0 [30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(D[31]),
        .Q(\out_reg[31]_0 [31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(D[3]),
        .Q(\out_reg[31]_0 [3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(D[4]),
        .Q(\out_reg[31]_0 [4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(D[5]),
        .Q(\out_reg[31]_0 [5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(D[6]),
        .Q(\out_reg[31]_0 [6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(D[7]),
        .Q(\out_reg[31]_0 [7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(D[8]),
        .Q(\out_reg[31]_0 [8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(D[9]),
        .Q(\out_reg[31]_0 [9]),
        .R(reset));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_1
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [31]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [14]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_10
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [22]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [5]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_11
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [21]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [4]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_12
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [20]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [3]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_13
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [19]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [2]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_14
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [18]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [1]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_15
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [17]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [0]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_2
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [30]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [13]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_3
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [29]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [12]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_4
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [28]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [11]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_5
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [27]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [10]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_6
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [26]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [9]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_7
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [25]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [8]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_8
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [24]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [7]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out_tmp_reg_i_9
       (.I0(pd_out),
        .I1(t_done),
        .I2(out0__0),
        .I3(\out_reg[31]_0 [23]),
        .I4(mul_done),
        .O(\out_reg[0]_0 [6]));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (comb_reg_done,
    comb_reg_out,
    D,
    reset,
    cond0_go_in,
    clk,
    \out_reg[0]_0 ,
    \out_reg[2] );
  output comb_reg_done;
  output comb_reg_out;
  output [0:0]D;
  input reset;
  input cond0_go_in;
  input clk;
  input \out_reg[0]_0 ;
  input \out_reg[2] ;

  wire \<const1> ;
  wire [0:0]D;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire \out_reg[0]_0 ;
  wire \out_reg[2] ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(cond0_go_in),
        .Q(comb_reg_done),
        .R(reset));
  LUT3 #(
    .INIT(8'h40)) 
    \out[2]_i_2 
       (.I0(comb_reg_out),
        .I1(comb_reg_done),
        .I2(\out_reg[2] ),
        .O(D));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_0 ),
        .Q(comb_reg_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0_2
   (pd_out,
    \out_reg[0]_0 ,
    p_0_in,
    E,
    D,
    reset,
    \out_reg[0]_1 ,
    clk,
    t_done,
    \done_buf_reg[2] ,
    mul_done,
    out0,
    \out_reg[31] ,
    Q);
  output pd_out;
  output \out_reg[0]_0 ;
  output [31:0]p_0_in;
  output [0:0]E;
  output [30:0]D;
  input reset;
  input \out_reg[0]_1 ;
  input clk;
  input t_done;
  input \done_buf_reg[2] ;
  input mul_done;
  input [31:0]out0;
  input [15:0]\out_reg[31] ;
  input [14:0]Q;

  wire \<const1> ;
  wire [30:0]D;
  wire [0:0]E;
  wire [14:0]Q;
  wire clk;
  wire \done_buf_reg[2] ;
  wire mul_done;
  wire [31:0]out0;
  wire \out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire [15:0]\out_reg[31] ;
  wire [31:0]p_0_in;
  wire pd_out;
  wire reset;
  wire t_done;

  VCC VCC
       (.P(\<const1> ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \done_buf[1]_i_1 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(mul_done),
        .O(\out_reg[0]_0 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_1
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[16]),
        .I4(mul_done),
        .O(p_0_in[16]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_10
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[7]),
        .I4(mul_done),
        .O(p_0_in[7]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_10__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[23]),
        .I4(mul_done),
        .O(p_0_in[23]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_11
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[6]),
        .I4(mul_done),
        .O(p_0_in[6]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_11__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[22]),
        .I4(mul_done),
        .O(p_0_in[22]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_12
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[5]),
        .I4(mul_done),
        .O(p_0_in[5]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_12__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[21]),
        .I4(mul_done),
        .O(p_0_in[21]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_13
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[4]),
        .I4(mul_done),
        .O(p_0_in[4]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_13__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[20]),
        .I4(mul_done),
        .O(p_0_in[20]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_14
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[3]),
        .I4(mul_done),
        .O(p_0_in[3]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_14__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[19]),
        .I4(mul_done),
        .O(p_0_in[19]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_15
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[2]),
        .I4(mul_done),
        .O(p_0_in[2]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_15__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[18]),
        .I4(mul_done),
        .O(p_0_in[18]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_16
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[1]),
        .I4(mul_done),
        .O(p_0_in[1]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_16__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[17]),
        .I4(mul_done),
        .O(p_0_in[17]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_17
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[0]),
        .I4(mul_done),
        .O(p_0_in[0]));
  LUT4 #(
    .INIT(16'h0001)) 
    out0_i_1__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(mul_done),
        .O(E));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_2
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[15]),
        .I4(mul_done),
        .O(p_0_in[15]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_2__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[31]),
        .I4(mul_done),
        .O(p_0_in[31]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_3
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[14]),
        .I4(mul_done),
        .O(p_0_in[14]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_3__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[30]),
        .I4(mul_done),
        .O(p_0_in[30]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_4
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[13]),
        .I4(mul_done),
        .O(p_0_in[13]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_4__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[29]),
        .I4(mul_done),
        .O(p_0_in[29]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_5
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[12]),
        .I4(mul_done),
        .O(p_0_in[12]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_5__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[28]),
        .I4(mul_done),
        .O(p_0_in[28]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_6
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[11]),
        .I4(mul_done),
        .O(p_0_in[11]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_6__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[27]),
        .I4(mul_done),
        .O(p_0_in[27]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_7
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[10]),
        .I4(mul_done),
        .O(p_0_in[10]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_7__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[26]),
        .I4(mul_done),
        .O(p_0_in[26]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_8
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[9]),
        .I4(mul_done),
        .O(p_0_in[9]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_8__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[25]),
        .I4(mul_done),
        .O(p_0_in[25]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_9
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[8]),
        .I4(mul_done),
        .O(p_0_in[8]));
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_9__0
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[24]),
        .I4(mul_done),
        .O(p_0_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[10]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[9]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[11]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[10]),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[12]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[11]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[13]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[12]),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[14]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[13]),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[15]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[14]),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[16]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [0]),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[17]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [1]),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[18]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [2]),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[19]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [3]),
        .O(D[18]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[1]_i_1__2 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[20]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [4]),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[21]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [5]),
        .O(D[20]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[22]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [6]),
        .O(D[21]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[23]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [7]),
        .O(D[22]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[24]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [8]),
        .O(D[23]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[25]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [9]),
        .O(D[24]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[26]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [10]),
        .O(D[25]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[27]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [11]),
        .O(D[26]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[28]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [12]),
        .O(D[27]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[29]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [13]),
        .O(D[28]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[2]_i_1__1 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[30]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [14]),
        .O(D[29]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[31]_i_2__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [15]),
        .O(D[30]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[3]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[4]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[5]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[6]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[5]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[7]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[6]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[8]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[7]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[9]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[8]),
        .O(D[8]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_1 ),
        .Q(pd_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0_3
   (pd0_out,
    a,
    \out_reg[0]_0 ,
    reset,
    \out_reg[0]_1 ,
    clk,
    A_LUT_0,
    count_done,
    out0);
  output pd0_out;
  output [0:0]a;
  output [31:0]\out_reg[0]_0 ;
  input reset;
  input \out_reg[0]_1 ;
  input clk;
  input A_LUT_0;
  input count_done;
  input [31:0]out0;

  wire \<const1> ;
  wire A_LUT_0;
  wire [0:0]a;
  wire clk;
  wire count_done;
  wire [31:0]out0;
  wire [31:0]\out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire pd0_out;
  wire reset;

  LUT3 #(
    .INIT(8'h01)) 
    A_LUT_0_i_1__0
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .O(a));
  VCC VCC
       (.P(\<const1> ));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[0]_i_1__5 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[0]),
        .O(\out_reg[0]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[10]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[10]),
        .O(\out_reg[0]_0 [10]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[11]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[11]),
        .O(\out_reg[0]_0 [11]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[12]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[12]),
        .O(\out_reg[0]_0 [12]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[13]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[13]),
        .O(\out_reg[0]_0 [13]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[14]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[14]),
        .O(\out_reg[0]_0 [14]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[15]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[15]),
        .O(\out_reg[0]_0 [15]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[16]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[16]),
        .O(\out_reg[0]_0 [16]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[17]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[17]),
        .O(\out_reg[0]_0 [17]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[18]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[18]),
        .O(\out_reg[0]_0 [18]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[19]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[19]),
        .O(\out_reg[0]_0 [19]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[1]_i_1__1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[1]),
        .O(\out_reg[0]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[20]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[20]),
        .O(\out_reg[0]_0 [20]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[21]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[21]),
        .O(\out_reg[0]_0 [21]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[22]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[22]),
        .O(\out_reg[0]_0 [22]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[23]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[23]),
        .O(\out_reg[0]_0 [23]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[24]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[24]),
        .O(\out_reg[0]_0 [24]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[25]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[25]),
        .O(\out_reg[0]_0 [25]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[26]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[26]),
        .O(\out_reg[0]_0 [26]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[27]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[27]),
        .O(\out_reg[0]_0 [27]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[28]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[28]),
        .O(\out_reg[0]_0 [28]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[29]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[29]),
        .O(\out_reg[0]_0 [29]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[2]_i_1__0 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[2]),
        .O(\out_reg[0]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[30]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[30]),
        .O(\out_reg[0]_0 [30]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[31]_i_2 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[31]),
        .O(\out_reg[0]_0 [31]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[3]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[3]),
        .O(\out_reg[0]_0 [3]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[4]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[4]),
        .O(\out_reg[0]_0 [4]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[5]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[5]),
        .O(\out_reg[0]_0 [5]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[6]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[6]),
        .O(\out_reg[0]_0 [6]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[7]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[7]),
        .O(\out_reg[0]_0 [7]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[8]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[8]),
        .O(\out_reg[0]_0 [8]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[9]_i_1 
       (.I0(pd0_out),
        .I1(A_LUT_0),
        .I2(count_done),
        .I3(out0[9]),
        .O(\out_reg[0]_0 [9]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_1 ),
        .Q(pd0_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1
   (D,
    Q,
    \out_reg[0]_0 ,
    \out_reg[0]_1 ,
    a,
    cond0_go_in,
    b,
    E,
    done_reg,
    \out_reg[0]_2 ,
    done_reg_0,
    done_reg_1,
    out_done,
    go,
    done_reg_2,
    pd0_out,
    pd_out,
    comb_reg_done,
    \out_reg[0]_3 ,
    t_done,
    count_done,
    \out_reg[2]_0 ,
    comb_reg_out,
    H_LUT_34,
    H_LUT_34_0,
    mul_done,
    reset,
    clk);
  output [0:0]D;
  output [0:0]Q;
  output \out_reg[0]_0 ;
  output \out_reg[0]_1 ;
  output [31:0]a;
  output cond0_go_in;
  output [31:0]b;
  output [0:0]E;
  output [0:0]done_reg;
  output \out_reg[0]_2 ;
  output done_reg_0;
  output done_reg_1;
  input out_done;
  input go;
  input [1:0]done_reg_2;
  input pd0_out;
  input pd_out;
  input comb_reg_done;
  input \out_reg[0]_3 ;
  input t_done;
  input count_done;
  input [0:0]\out_reg[2]_0 ;
  input comb_reg_out;
  input [31:0]H_LUT_34;
  input [31:0]H_LUT_34_0;
  input mul_done;
  input reset;
  input clk;

  wire [0:0]D;
  wire [0:0]E;
  wire [31:0]H_LUT_34;
  wire [31:0]H_LUT_34_0;
  wire [0:0]Q;
  wire [31:0]a;
  wire [31:0]b;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire count_done;
  wire [0:0]done_reg;
  wire done_reg_0;
  wire done_reg_1;
  wire [1:0]done_reg_2;
  wire [1:0]fsm_in;
  wire [2:0]fsm_out;
  wire fsm_write_en;
  wire go;
  wire mul_done;
  wire \out[1]_i_4_n_0 ;
  wire \out[2]_i_4_n_0 ;
  wire \out[31]_i_3_n_0 ;
  wire out_done;
  wire \out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire \out_reg[0]_2 ;
  wire \out_reg[0]_3 ;
  wire [0:0]\out_reg[2]_0 ;
  wire pd0_out;
  wire pd_out;
  wire reset;
  wire t_done;

  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_0_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[0]),
        .O(a[0]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_0_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[0]),
        .O(b[0]));
  LUT6 #(
    .INIT(64'hFFFFFBFFFFFFFFFF)) 
    A_LUT_0_i_3
       (.I0(fsm_out[0]),
        .I1(done_reg_2[0]),
        .I2(done_reg_2[1]),
        .I3(go),
        .I4(fsm_out[2]),
        .I5(Q),
        .O(\out_reg[0]_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_18_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[16]),
        .O(a[16]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_18_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[16]),
        .O(b[16]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_27_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[24]),
        .O(a[24]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_27_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[24]),
        .O(b[24]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_9_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[8]),
        .O(a[8]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_9_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[8]),
        .O(b[8]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_10_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[9]),
        .O(a[9]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_10_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[9]),
        .O(b[9]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_19_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[17]),
        .O(a[17]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_19_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[17]),
        .O(b[17]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_1_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[1]),
        .O(a[1]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_1_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[1]),
        .O(b[1]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_28_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[25]),
        .O(a[25]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_28_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[25]),
        .O(b[25]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_11_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[10]),
        .O(a[10]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_11_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[10]),
        .O(b[10]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_20_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[18]),
        .O(a[18]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_20_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[18]),
        .O(b[18]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_29_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[26]),
        .O(a[26]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_29_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[26]),
        .O(b[26]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_2_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[2]),
        .O(a[2]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_2_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[2]),
        .O(b[2]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_12_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[11]),
        .O(a[11]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_12_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[11]),
        .O(b[11]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_21_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[19]),
        .O(a[19]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_21_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[19]),
        .O(b[19]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_30_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[27]),
        .O(a[27]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_30_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[27]),
        .O(b[27]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_3_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[3]),
        .O(a[3]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_3_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[3]),
        .O(b[3]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_13_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[12]),
        .O(a[12]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_13_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[12]),
        .O(b[12]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_22_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[20]),
        .O(a[20]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_22_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[20]),
        .O(b[20]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_31_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[28]),
        .O(a[28]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_31_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[28]),
        .O(b[28]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_4_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[4]),
        .O(a[4]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_4_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[4]),
        .O(b[4]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_14_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[13]),
        .O(a[13]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_14_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[13]),
        .O(b[13]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_23_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[21]),
        .O(a[21]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_23_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[21]),
        .O(b[21]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_32_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[29]),
        .O(a[29]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_32_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[29]),
        .O(b[29]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_5_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[5]),
        .O(a[5]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_5_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[5]),
        .O(b[5]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_15_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[14]),
        .O(a[14]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_15_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[14]),
        .O(b[14]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_24_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[22]),
        .O(a[22]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_24_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[22]),
        .O(b[22]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_33_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[30]),
        .O(a[30]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_33_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[30]),
        .O(b[30]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_6_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[6]),
        .O(a[6]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_6_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[6]),
        .O(b[6]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_16_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[15]),
        .O(a[15]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_16_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[15]),
        .O(b[15]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_25_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[23]),
        .O(a[23]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_25_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[23]),
        .O(b[23]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_34_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[31]),
        .O(a[31]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_34_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[31]),
        .O(b[31]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_7_i_1
       (.I0(cond0_go_in),
        .I1(H_LUT_34[7]),
        .O(a[7]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_7_i_2
       (.I0(cond0_go_in),
        .I1(H_LUT_34_0[7]),
        .O(b[7]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    done_i_1
       (.I0(done_reg_2[0]),
        .I1(done_reg_2[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[0]),
        .I5(comb_reg_done),
        .O(cond0_go_in));
  LUT6 #(
    .INIT(64'h0F08000800080008)) 
    \out[0]_i_1__0 
       (.I0(count_done),
        .I1(t_done),
        .I2(\out[31]_i_3_n_0 ),
        .I3(Q),
        .I4(pd0_out),
        .I5(pd_out),
        .O(fsm_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h04F4)) 
    \out[0]_i_1__3 
       (.I0(\out_reg[0]_0 ),
        .I1(t_done),
        .I2(pd_out),
        .I3(pd0_out),
        .O(done_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0F44)) 
    \out[0]_i_1__4 
       (.I0(\out_reg[0]_0 ),
        .I1(count_done),
        .I2(pd_out),
        .I3(pd0_out),
        .O(done_reg_1));
  LUT6 #(
    .INIT(64'hFF40404040404040)) 
    \out[1]_i_1__0 
       (.I0(\out_reg[0]_0 ),
        .I1(pd0_out),
        .I2(pd_out),
        .I3(\out_reg[0]_1 ),
        .I4(comb_reg_out),
        .I5(comb_reg_done),
        .O(fsm_in[1]));
  LUT6 #(
    .INIT(64'h00008800F0000000)) 
    \out[1]_i_2 
       (.I0(\out[1]_i_4_n_0 ),
        .I1(fsm_out[2]),
        .I2(out_done),
        .I3(go),
        .I4(done_reg_2[1]),
        .I5(done_reg_2[0]),
        .O(D));
  LUT5 #(
    .INIT(32'h00000080)) 
    \out[1]_i_3 
       (.I0(done_reg_2[0]),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(Q),
        .I4(fsm_out[0]),
        .O(\out_reg[0]_2 ));
  LUT2 #(
    .INIT(4'h1)) 
    \out[1]_i_4 
       (.I0(fsm_out[0]),
        .I1(Q),
        .O(\out[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF404040)) 
    \out[2]_i_1 
       (.I0(\out_reg[0]_0 ),
        .I1(pd0_out),
        .I2(pd_out),
        .I3(\out_reg[0]_1 ),
        .I4(comb_reg_done),
        .I5(\out[2]_i_4_n_0 ),
        .O(fsm_write_en));
  LUT5 #(
    .INIT(32'h00200000)) 
    \out[2]_i_3 
       (.I0(fsm_out[0]),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(done_reg_2[1]),
        .I4(done_reg_2[0]),
        .O(\out_reg[0]_1 ));
  LUT6 #(
    .INIT(64'h000B000A000A000A)) 
    \out[2]_i_4 
       (.I0(fsm_out[2]),
        .I1(\out_reg[0]_3 ),
        .I2(Q),
        .I3(fsm_out[0]),
        .I4(t_done),
        .I5(count_done),
        .O(\out[2]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0103010F)) 
    \out[31]_i_1__0 
       (.I0(t_done),
        .I1(Q),
        .I2(\out[31]_i_3_n_0 ),
        .I3(count_done),
        .I4(pd0_out),
        .O(E));
  LUT6 #(
    .INIT(64'h0101010103030F03)) 
    \out[31]_i_1__1 
       (.I0(count_done),
        .I1(Q),
        .I2(\out[31]_i_3_n_0 ),
        .I3(mul_done),
        .I4(pd_out),
        .I5(t_done),
        .O(done_reg));
  LUT5 #(
    .INIT(32'hFFFFFBFF)) 
    \out[31]_i_3 
       (.I0(fsm_out[2]),
        .I1(go),
        .I2(done_reg_2[1]),
        .I3(done_reg_2[0]),
        .I4(fsm_out[0]),
        .O(\out[31]_i_3_n_0 ));
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
        .Q(Q),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(\out_reg[2]_0 ),
        .Q(fsm_out[2]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized2
   (Q,
    E,
    go_0,
    out_write_data,
    out_write_en,
    done,
    D,
    exp_reg_done,
    out_done,
    go,
    \out_reg[0]_0 ,
    \out_write_data[31] ,
    reset,
    clk);
  output [1:0]Q;
  output [0:0]E;
  output go_0;
  output [31:0]out_write_data;
  output out_write_en;
  output done;
  input [0:0]D;
  input exp_reg_done;
  input out_done;
  input go;
  input \out_reg[0]_0 ;
  input [31:0]\out_write_data[31] ;
  input reset;
  input clk;

  wire [0:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire clk;
  wire done;
  wire exp_reg_done;
  wire [0:0]fsm_in;
  wire fsm_write_en;
  wire go;
  wire go_0;
  wire out_done;
  wire \out_reg[0]_0 ;
  wire [31:0]out_write_data;
  wire [31:0]\out_write_data[31] ;
  wire out_write_en;
  wire reset;

  LUT2 #(
    .INIT(4'h8)) 
    done_INST_0
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(done));
  LUT5 #(
    .INIT(32'h0000C0A0)) 
    \out[0]_i_1 
       (.I0(exp_reg_done),
        .I1(out_done),
        .I2(go),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(fsm_in));
  LUT6 #(
    .INIT(64'hFFFFF0F0F8F8FCF0)) 
    \out[1]_i_1 
       (.I0(out_done),
        .I1(go),
        .I2(\out_reg[0]_0 ),
        .I3(exp_reg_done),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(fsm_write_en));
  LUT3 #(
    .INIT(8'hDF)) 
    \out[2]_i_5 
       (.I0(go),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(go_0));
  LUT4 #(
    .INIT(16'h0010)) 
    \out[31]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(go),
        .I3(exp_reg_done),
        .O(E));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(D),
        .Q(Q[1]),
        .R(reset));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[0]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [0]),
        .O(out_write_data[0]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[10]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [10]),
        .O(out_write_data[10]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[11]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [11]),
        .O(out_write_data[11]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[12]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [12]),
        .O(out_write_data[12]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[13]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [13]),
        .O(out_write_data[13]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[14]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [14]),
        .O(out_write_data[14]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[15]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [15]),
        .O(out_write_data[15]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[16]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [16]),
        .O(out_write_data[16]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[17]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [17]),
        .O(out_write_data[17]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[18]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [18]),
        .O(out_write_data[18]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[19]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [19]),
        .O(out_write_data[19]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[1]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [1]),
        .O(out_write_data[1]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[20]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [20]),
        .O(out_write_data[20]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[21]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [21]),
        .O(out_write_data[21]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[22]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [22]),
        .O(out_write_data[22]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[23]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [23]),
        .O(out_write_data[23]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[24]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [24]),
        .O(out_write_data[24]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[25]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [25]),
        .O(out_write_data[25]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[26]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [26]),
        .O(out_write_data[26]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[27]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [27]),
        .O(out_write_data[27]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[28]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [28]),
        .O(out_write_data[28]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[29]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [29]),
        .O(out_write_data[29]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[2]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [2]),
        .O(out_write_data[2]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[30]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [30]),
        .O(out_write_data[30]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[31]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [31]),
        .O(out_write_data[31]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[3]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [3]),
        .O(out_write_data[3]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[4]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [4]),
        .O(out_write_data[4]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[5]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [5]),
        .O(out_write_data[5]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[6]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [6]),
        .O(out_write_data[6]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[7]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [7]),
        .O(out_write_data[7]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[8]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [8]),
        .O(out_write_data[8]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[9]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [9]),
        .O(out_write_data[9]));
  LUT4 #(
    .INIT(16'h0040)) 
    out_write_en_INST_0
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(go),
        .I3(out_done),
        .O(out_write_en));
endmodule
