// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 02:32:55 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//pipelined-mac.futil-ultrascale-route.v
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

module lakeroad_xilinx_ultrascale_plus_add4_2
   (out0,
    a,
    b);
  output [3:0]out0;
  input [0:0]a;
  input [3:0]b;

  wire \<const0> ;
  wire \<const1> ;
  wire ZERO;
  wire [0:0]a;
  wire [3:0]b;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O6_1;
  wire [3:0]out0;

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
    carry_8
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .DI({ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,luts_O5_0[0]}),
        .O(out0),
        .S({ZERO,ZERO,ZERO,ZERO,b[3:1],luts_O6_1[0]}));
endmodule

module lakeroad_xilinx_ultrascale_plus_ult4_2
   (carry_8_0,
    b,
    comb_reg_out,
    a);
  output carry_8_0;
  input [0:0]b;
  input comb_reg_out;
  input [3:0]a;

  wire \<const0> ;
  wire \<const1> ;
  wire ONE;
  wire [3:0]a;
  wire [0:0]b;
  wire carry_8_0;
  wire comb_reg_out;
  wire lt0_out;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O6_1;
  wire [7:0]NLW_carry_8_CO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
    A_LUT_0
       (.I0(a[0]),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[0]),
        .O6(luts_O6_1[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
    B_LUT_1
       (.I0(a[1]),
        .I1(b),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[1]),
        .O6(luts_O6_1[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
    C_LUT_2
       (.I0(a[2]),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[2]),
        .O6(luts_O6_1[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
    D_LUT_3
       (.I0(a[3]),
        .I1(b),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[3]),
        .O6(luts_O6_1[3]));
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
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .CO({lt0_out,NLW_carry_8_CO_UNCONNECTED[6:0]}),
        .DI({ONE,ONE,ONE,ONE,luts_O5_0[3:0]}),
        .S({ONE,ONE,ONE,ONE,luts_O6_1[3:0]}));
  LUT3 #(
    .INIT(8'hB8)) 
    \out[0]_i_1__11 
       (.I0(lt0_out),
        .I1(b),
        .I2(comb_reg_out),
        .O(carry_8_0));
endmodule

(* ECO_CHECKSUM = "24c8d84e" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    a_addr0,
    a_write_data,
    a_write_en,
    a_clk,
    a_read_data,
    a_done,
    b_addr0,
    b_write_data,
    b_write_en,
    b_clk,
    b_read_data,
    b_done,
    out_addr0,
    out_write_data,
    out_write_en,
    out_clk,
    out_read_data,
    out_done);
  input go;
  input clk;
  input reset;
  output done;
  output [3:0]a_addr0;
  output [31:0]a_write_data;
  output a_write_en;
  output a_clk;
  input [31:0]a_read_data;
  input a_done;
  output [3:0]b_addr0;
  output [31:0]b_write_data;
  output b_write_en;
  output b_clk;
  input [31:0]b_read_data;
  input b_done;
  output out_addr0;
  output [31:0]out_write_data;
  output out_write_en;
  output out_clk;
  input [31:0]out_read_data;
  input out_done;

  wire \<const0> ;
  wire [3:0]a_addr0;
  wire [31:0]a_read_data;
  wire [3:0]add0_out;
  wire [3:0]add0_right;
  wire [31:0]add_right;
  wire [31:0]b_read_data;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire done;
  wire [1:0]fsm3_out;
  wire [1:0]fsm_in;
  wire fsm_n_0;
  wire fsm_n_100;
  wire fsm_n_101;
  wire fsm_n_102;
  wire fsm_n_103;
  wire fsm_n_151;
  wire fsm_n_152;
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
  wire fsm_n_67;
  wire fsm_n_68;
  wire fsm_n_69;
  wire fsm_n_70;
  wire fsm_n_71;
  wire fsm_n_72;
  wire fsm_n_73;
  wire fsm_n_74;
  wire fsm_n_75;
  wire fsm_n_76;
  wire fsm_n_77;
  wire fsm_n_78;
  wire fsm_n_79;
  wire fsm_n_80;
  wire fsm_n_81;
  wire fsm_n_82;
  wire fsm_n_83;
  wire fsm_n_84;
  wire fsm_n_85;
  wire fsm_n_86;
  wire fsm_n_87;
  wire fsm_n_88;
  wire fsm_n_89;
  wire fsm_n_90;
  wire fsm_n_91;
  wire fsm_n_92;
  wire fsm_n_93;
  wire fsm_n_94;
  wire fsm_n_95;
  wire fsm_n_96;
  wire fsm_n_97;
  wire fsm_n_98;
  wire fsm_n_99;
  wire [2:0]fsm_out;
  wire [0:0]fsm_out_0;
  wire go;
  wire idx0_done;
  wire [3:0]idx0_in;
  wire idx0_n_1;
  wire [3:0]idx0_out;
  wire idx0_write_en;
  wire in_range0_go_in;
  wire incr_idx_go_in;
  wire [3:0]lt0_left;
  wire lt0_n_0;
  wire mac_n_10;
  wire mac_n_11;
  wire mac_n_12;
  wire mac_n_13;
  wire mac_n_14;
  wire mac_n_15;
  wire mac_n_16;
  wire mac_n_17;
  wire mac_n_18;
  wire mac_n_19;
  wire mac_n_20;
  wire mac_n_21;
  wire mac_n_22;
  wire mac_n_23;
  wire mac_n_24;
  wire mac_n_25;
  wire mac_n_26;
  wire mac_n_27;
  wire mac_n_28;
  wire mac_n_29;
  wire mac_n_30;
  wire mac_n_31;
  wire mac_n_32;
  wire mac_n_33;
  wire mac_n_34;
  wire mac_n_35;
  wire mac_n_36;
  wire mac_n_37;
  wire mac_n_38;
  wire mac_n_39;
  wire mac_n_40;
  wire mac_n_5;
  wire mac_n_6;
  wire mac_n_7;
  wire mac_n_8;
  wire mac_n_9;
  wire out_done;
  wire [31:0]out_write_data;
  wire out_write_en;
  wire p_0_in__0;
  wire pipe1_done;
  wire pipe2_done;
  wire read_a_n_1;
  wire read_a_n_10;
  wire read_a_n_11;
  wire read_a_n_12;
  wire read_a_n_13;
  wire read_a_n_14;
  wire read_a_n_15;
  wire read_a_n_16;
  wire read_a_n_17;
  wire read_a_n_18;
  wire read_a_n_19;
  wire read_a_n_2;
  wire read_a_n_20;
  wire read_a_n_21;
  wire read_a_n_22;
  wire read_a_n_23;
  wire read_a_n_24;
  wire read_a_n_25;
  wire read_a_n_26;
  wire read_a_n_27;
  wire read_a_n_28;
  wire read_a_n_29;
  wire read_a_n_3;
  wire read_a_n_30;
  wire read_a_n_31;
  wire read_a_n_32;
  wire read_a_n_4;
  wire read_a_n_5;
  wire read_a_n_6;
  wire read_a_n_7;
  wire read_a_n_8;
  wire read_a_n_9;
  wire read_a_write_en;
  wire read_b_done;
  wire read_b_n_0;
  wire read_b_n_1;
  wire read_b_n_10;
  wire read_b_n_11;
  wire read_b_n_12;
  wire read_b_n_13;
  wire read_b_n_14;
  wire read_b_n_15;
  wire read_b_n_16;
  wire read_b_n_17;
  wire read_b_n_18;
  wire read_b_n_19;
  wire read_b_n_2;
  wire read_b_n_20;
  wire read_b_n_21;
  wire read_b_n_22;
  wire read_b_n_23;
  wire read_b_n_24;
  wire read_b_n_25;
  wire read_b_n_26;
  wire read_b_n_27;
  wire read_b_n_28;
  wire read_b_n_29;
  wire read_b_n_3;
  wire read_b_n_30;
  wire read_b_n_31;
  wire read_b_n_4;
  wire read_b_n_5;
  wire read_b_n_6;
  wire read_b_n_7;
  wire read_b_n_8;
  wire read_b_n_9;
  wire reset;

  assign a_clk = clk;
  assign a_write_data[31] = \<const0> ;
  assign a_write_data[30] = \<const0> ;
  assign a_write_data[29] = \<const0> ;
  assign a_write_data[28] = \<const0> ;
  assign a_write_data[27] = \<const0> ;
  assign a_write_data[26] = \<const0> ;
  assign a_write_data[25] = \<const0> ;
  assign a_write_data[24] = \<const0> ;
  assign a_write_data[23] = \<const0> ;
  assign a_write_data[22] = \<const0> ;
  assign a_write_data[21] = \<const0> ;
  assign a_write_data[20] = \<const0> ;
  assign a_write_data[19] = \<const0> ;
  assign a_write_data[18] = \<const0> ;
  assign a_write_data[17] = \<const0> ;
  assign a_write_data[16] = \<const0> ;
  assign a_write_data[15] = \<const0> ;
  assign a_write_data[14] = \<const0> ;
  assign a_write_data[13] = \<const0> ;
  assign a_write_data[12] = \<const0> ;
  assign a_write_data[11] = \<const0> ;
  assign a_write_data[10] = \<const0> ;
  assign a_write_data[9] = \<const0> ;
  assign a_write_data[8] = \<const0> ;
  assign a_write_data[7] = \<const0> ;
  assign a_write_data[6] = \<const0> ;
  assign a_write_data[5] = \<const0> ;
  assign a_write_data[4] = \<const0> ;
  assign a_write_data[3] = \<const0> ;
  assign a_write_data[2] = \<const0> ;
  assign a_write_data[1] = \<const0> ;
  assign a_write_data[0] = \<const0> ;
  assign a_write_en = \<const0> ;
  assign b_addr0[3:0] = a_addr0;
  assign b_clk = clk;
  assign b_write_data[31] = \<const0> ;
  assign b_write_data[30] = \<const0> ;
  assign b_write_data[29] = \<const0> ;
  assign b_write_data[28] = \<const0> ;
  assign b_write_data[27] = \<const0> ;
  assign b_write_data[26] = \<const0> ;
  assign b_write_data[25] = \<const0> ;
  assign b_write_data[24] = \<const0> ;
  assign b_write_data[23] = \<const0> ;
  assign b_write_data[22] = \<const0> ;
  assign b_write_data[21] = \<const0> ;
  assign b_write_data[20] = \<const0> ;
  assign b_write_data[19] = \<const0> ;
  assign b_write_data[18] = \<const0> ;
  assign b_write_data[17] = \<const0> ;
  assign b_write_data[16] = \<const0> ;
  assign b_write_data[15] = \<const0> ;
  assign b_write_data[14] = \<const0> ;
  assign b_write_data[13] = \<const0> ;
  assign b_write_data[12] = \<const0> ;
  assign b_write_data[11] = \<const0> ;
  assign b_write_data[10] = \<const0> ;
  assign b_write_data[9] = \<const0> ;
  assign b_write_data[8] = \<const0> ;
  assign b_write_data[7] = \<const0> ;
  assign b_write_data[6] = \<const0> ;
  assign b_write_data[5] = \<const0> ;
  assign b_write_data[4] = \<const0> ;
  assign b_write_data[3] = \<const0> ;
  assign b_write_data[2] = \<const0> ;
  assign b_write_data[1] = \<const0> ;
  assign b_write_data[0] = \<const0> ;
  assign b_write_en = \<const0> ;
  assign out_addr0 = \<const0> ;
  assign out_clk = clk;
  GND GND
       (.G(\<const0> ));
  std_add add0
       (.a(incr_idx_go_in),
        .b(add0_right),
        .out0(add0_out));
  std_reg__parameterized1 comb_reg
       (.clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .in_range0_go_in(in_range0_go_in),
        .\out_reg[0]_0 (lt0_n_0),
        .reset(reset));
  std_reg__parameterized0 fsm
       (.A({fsm_n_40,fsm_n_41,fsm_n_42,fsm_n_43,fsm_n_44,fsm_n_45,fsm_n_46,fsm_n_47,fsm_n_48,fsm_n_49,fsm_n_50,fsm_n_51,fsm_n_52,fsm_n_53,fsm_n_54,fsm_n_55,fsm_n_56}),
        .B({fsm_n_57,fsm_n_58,fsm_n_59,fsm_n_60,fsm_n_61,fsm_n_62,fsm_n_63,fsm_n_64,fsm_n_65,fsm_n_66,fsm_n_67,fsm_n_68,fsm_n_69,fsm_n_70,fsm_n_71}),
        .D(fsm_in),
        .D_LUT_3(idx0_out),
        .E(idx0_write_en),
        .H_LUT_34({mac_n_9,mac_n_10,mac_n_11,mac_n_12,mac_n_13,mac_n_14,mac_n_15,mac_n_16,mac_n_17,mac_n_18,mac_n_19,mac_n_20,mac_n_21,mac_n_22,mac_n_23,mac_n_24,mac_n_25,mac_n_26,mac_n_27,mac_n_28,mac_n_29,mac_n_30,mac_n_31,mac_n_32,mac_n_33,mac_n_34,mac_n_35,mac_n_36,mac_n_37,mac_n_38,mac_n_39,mac_n_40}),
        .H_LUT_34_0(mac_n_7),
        .Q(fsm3_out),
        .a(lt0_left),
        .a_addr0(a_addr0),
        .b(add_right),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .done(done),
        .done_reg(add0_right),
        .go(go),
        .idx0_done(idx0_done),
        .in_range0_go_in(in_range0_go_in),
        .out0(add0_out),
        .out0_0(mac_n_5),
        .out0__0({read_a_n_1,read_a_n_2,read_a_n_3,read_a_n_4,read_a_n_5,read_a_n_6,read_a_n_7,read_a_n_8,read_a_n_9,read_a_n_10,read_a_n_11,read_a_n_12,read_a_n_13,read_a_n_14,read_a_n_15,read_a_n_16,read_a_n_17,read_a_n_18,read_a_n_19,read_a_n_20,read_a_n_21,read_a_n_22,read_a_n_23,read_a_n_24,read_a_n_25,read_a_n_26,read_a_n_27,read_a_n_28,read_a_n_29,read_a_n_30,read_a_n_31,read_a_n_32}),
        .out_done(out_done),
        .\out_reg[0]_0 (fsm_n_38),
        .\out_reg[0]_1 (fsm_n_39),
        .\out_reg[0]_2 ({fsm_n_72,fsm_n_73,fsm_n_74,fsm_n_75,fsm_n_76,fsm_n_77,fsm_n_78,fsm_n_79,fsm_n_80,fsm_n_81,fsm_n_82,fsm_n_83,fsm_n_84,fsm_n_85,fsm_n_86,fsm_n_87,fsm_n_88}),
        .\out_reg[0]_3 ({fsm_n_89,fsm_n_90,fsm_n_91,fsm_n_92,fsm_n_93,fsm_n_94,fsm_n_95,fsm_n_96,fsm_n_97,fsm_n_98,fsm_n_99,fsm_n_100,fsm_n_101,fsm_n_102,fsm_n_103}),
        .\out_reg[0]_4 (fsm_n_152),
        .\out_reg[0]_5 (idx0_in),
        .\out_reg[0]_6 (fsm_out_0),
        .\out_reg[0]_7 (mac_n_6),
        .\out_reg[1]_0 (incr_idx_go_in),
        .\out_reg[1]_1 (read_a_write_en),
        .\out_reg[1]_2 (out_write_en),
        .\out_reg[2]_0 (fsm_n_0),
        .\out_reg[2]_1 (fsm_out),
        .\out_reg[2]_2 (fsm_n_151),
        .\out_reg[2]_3 (idx0_n_1),
        .\out_reg[3]_0 (mac_n_8),
        .out_tmp_reg({read_b_n_0,read_b_n_1,read_b_n_2,read_b_n_3,read_b_n_4,read_b_n_5,read_b_n_6,read_b_n_7,read_b_n_8,read_b_n_9,read_b_n_10,read_b_n_11,read_b_n_12,read_b_n_13,read_b_n_14,read_b_n_15,read_b_n_16,read_b_n_17,read_b_n_18,read_b_n_19,read_b_n_20,read_b_n_21,read_b_n_22,read_b_n_23,read_b_n_24,read_b_n_25,read_b_n_26,read_b_n_27,read_b_n_28,read_b_n_29,read_b_n_30,read_b_n_31}),
        .out_write_data(out_write_data),
        .p_0_in__0(p_0_in__0),
        .pipe1_done(pipe1_done),
        .pipe2_done(pipe2_done),
        .read_b_done(read_b_done),
        .reset(reset));
  std_reg__parameterized0_0 idx0
       (.D(idx0_in),
        .E(idx0_write_en),
        .Q(idx0_out),
        .clk(clk),
        .done_reg_0(idx0_n_1),
        .idx0_done(idx0_done),
        .\out_reg[2]_0 (fsm_out[2]),
        .reset(reset));
  std_lt lt0
       (.a(lt0_left),
        .b(in_range0_go_in),
        .carry_8(lt0_n_0),
        .comb_reg_out(comb_reg_out));
  pipelined_mac mac
       (.A({fsm_n_40,fsm_n_41,fsm_n_42,fsm_n_43,fsm_n_44,fsm_n_45,fsm_n_46,fsm_n_47,fsm_n_48,fsm_n_49,fsm_n_50,fsm_n_51,fsm_n_52,fsm_n_53,fsm_n_54,fsm_n_55,fsm_n_56}),
        .B({fsm_n_57,fsm_n_58,fsm_n_59,fsm_n_60,fsm_n_61,fsm_n_62,fsm_n_63,fsm_n_64,fsm_n_65,fsm_n_66,fsm_n_67,fsm_n_68,fsm_n_69,fsm_n_70,fsm_n_71}),
        .D(fsm_in),
        .Q(fsm_out_0),
        .b(add_right),
        .clk(clk),
        .done_reg(mac_n_5),
        .go(go),
        .out0({fsm_n_72,fsm_n_73,fsm_n_74,fsm_n_75,fsm_n_76,fsm_n_77,fsm_n_78,fsm_n_79,fsm_n_80,fsm_n_81,fsm_n_82,fsm_n_83,fsm_n_84,fsm_n_85,fsm_n_86,fsm_n_87,fsm_n_88}),
        .out0__0({fsm_n_89,fsm_n_90,fsm_n_91,fsm_n_92,fsm_n_93,fsm_n_94,fsm_n_95,fsm_n_96,fsm_n_97,fsm_n_98,fsm_n_99,fsm_n_100,fsm_n_101,fsm_n_102,fsm_n_103}),
        .\out_reg[0] (mac_n_6),
        .\out_reg[0]_0 (fsm_n_38),
        .\out_reg[15] (fsm_n_152),
        .\out_reg[15]_0 (fsm_out[1:0]),
        .\out_reg[1] (fsm3_out),
        .\out_reg[1]_0 (mac_n_7),
        .\out_reg[1]_1 (mac_n_8),
        .\out_reg[1]_2 (fsm_n_0),
        .\out_reg[1]_3 (fsm_n_39),
        .\out_reg[1]_4 (fsm_n_151),
        .\out_reg[31] ({mac_n_9,mac_n_10,mac_n_11,mac_n_12,mac_n_13,mac_n_14,mac_n_15,mac_n_16,mac_n_17,mac_n_18,mac_n_19,mac_n_20,mac_n_21,mac_n_22,mac_n_23,mac_n_24,mac_n_25,mac_n_26,mac_n_27,mac_n_28,mac_n_29,mac_n_30,mac_n_31,mac_n_32,mac_n_33,mac_n_34,mac_n_35,mac_n_36,mac_n_37,mac_n_38,mac_n_39,mac_n_40}),
        .p_0_in__0(p_0_in__0),
        .pipe1_done(pipe1_done),
        .pipe2_done(pipe2_done),
        .reset(reset));
  std_reg read_a
       (.E(read_a_write_en),
        .Q({read_a_n_1,read_a_n_2,read_a_n_3,read_a_n_4,read_a_n_5,read_a_n_6,read_a_n_7,read_a_n_8,read_a_n_9,read_a_n_10,read_a_n_11,read_a_n_12,read_a_n_13,read_a_n_14,read_a_n_15,read_a_n_16,read_a_n_17,read_a_n_18,read_a_n_19,read_a_n_20,read_a_n_21,read_a_n_22,read_a_n_23,read_a_n_24,read_a_n_25,read_a_n_26,read_a_n_27,read_a_n_28,read_a_n_29,read_a_n_30,read_a_n_31,read_a_n_32}),
        .a_read_data(a_read_data),
        .clk(clk),
        .read_b_done(read_b_done),
        .reset(reset));
  std_reg_1 read_b
       (.E(read_a_write_en),
        .Q({read_b_n_0,read_b_n_1,read_b_n_2,read_b_n_3,read_b_n_4,read_b_n_5,read_b_n_6,read_b_n_7,read_b_n_8,read_b_n_9,read_b_n_10,read_b_n_11,read_b_n_12,read_b_n_13,read_b_n_14,read_b_n_15,read_b_n_16,read_b_n_17,read_b_n_18,read_b_n_19,read_b_n_20,read_b_n_21,read_b_n_22,read_b_n_23,read_b_n_24,read_b_n_25,read_b_n_26,read_b_n_27,read_b_n_28,read_b_n_29,read_b_n_30,read_b_n_31}),
        .b_read_data(b_read_data),
        .clk(clk),
        .reset(reset));
endmodule

module pipelined_mac
   (pipe1_done,
    pipe2_done,
    Q,
    \out_reg[1] ,
    done_reg,
    \out_reg[0] ,
    \out_reg[1]_0 ,
    \out_reg[1]_1 ,
    \out_reg[31] ,
    clk,
    p_0_in__0,
    reset,
    A,
    out0,
    B,
    out0__0,
    \out_reg[1]_2 ,
    go,
    \out_reg[15] ,
    \out_reg[15]_0 ,
    \out_reg[1]_3 ,
    \out_reg[1]_4 ,
    \out_reg[0]_0 ,
    b,
    D);
  output pipe1_done;
  output pipe2_done;
  output [0:0]Q;
  output [1:0]\out_reg[1] ;
  output done_reg;
  output \out_reg[0] ;
  output \out_reg[1]_0 ;
  output \out_reg[1]_1 ;
  output [31:0]\out_reg[31] ;
  input clk;
  input p_0_in__0;
  input reset;
  input [16:0]A;
  input [16:0]out0;
  input [14:0]B;
  input [14:0]out0__0;
  input \out_reg[1]_2 ;
  input go;
  input \out_reg[15] ;
  input [1:0]\out_reg[15]_0 ;
  input \out_reg[1]_3 ;
  input \out_reg[1]_4 ;
  input \out_reg[0]_0 ;
  input [31:0]b;
  input [1:0]D;

  wire [16:0]A;
  wire [14:0]B;
  wire [1:0]D;
  wire [0:0]Q;
  wire [31:0]add_left;
  wire [31:0]add_out;
  wire [31:0]b;
  wire clk;
  wire done_reg;
  wire [1:1]fsm0_in;
  wire fsm0_n_36;
  wire [1:0]fsm0_out;
  wire fsm1_n_3;
  wire [1:0]fsm1_out;
  wire fsm2_n_1;
  wire fsm3_n_2;
  wire fsm3_n_3;
  wire fsm3_n_5;
  wire fsm3_n_6;
  wire fsm3_n_7;
  wire fsm_n_2;
  wire [1:1]fsm_out;
  wire go;
  wire mult_pipe_done;
  wire mult_pipe_n_10;
  wire mult_pipe_n_11;
  wire mult_pipe_n_12;
  wire mult_pipe_n_13;
  wire mult_pipe_n_14;
  wire mult_pipe_n_15;
  wire mult_pipe_n_16;
  wire mult_pipe_n_17;
  wire mult_pipe_n_18;
  wire mult_pipe_n_19;
  wire mult_pipe_n_2;
  wire mult_pipe_n_20;
  wire mult_pipe_n_21;
  wire mult_pipe_n_22;
  wire mult_pipe_n_23;
  wire mult_pipe_n_24;
  wire mult_pipe_n_25;
  wire mult_pipe_n_26;
  wire mult_pipe_n_27;
  wire mult_pipe_n_28;
  wire mult_pipe_n_29;
  wire mult_pipe_n_3;
  wire mult_pipe_n_30;
  wire mult_pipe_n_31;
  wire mult_pipe_n_32;
  wire mult_pipe_n_33;
  wire mult_pipe_n_4;
  wire mult_pipe_n_5;
  wire mult_pipe_n_6;
  wire mult_pipe_n_7;
  wire mult_pipe_n_8;
  wire mult_pipe_n_9;
  wire [16:0]out0;
  wire [14:0]out0__0;
  wire \out_reg[0] ;
  wire \out_reg[0]_0 ;
  wire \out_reg[15] ;
  wire [1:0]\out_reg[15]_0 ;
  wire [1:0]\out_reg[1] ;
  wire \out_reg[1]_0 ;
  wire \out_reg[1]_1 ;
  wire \out_reg[1]_2 ;
  wire \out_reg[1]_3 ;
  wire \out_reg[1]_4 ;
  wire [31:0]\out_reg[31] ;
  wire out_valid_done;
  wire out_valid_write_en;
  wire p_0_in__0;
  wire pd0_out;
  wire pd1_out;
  wire pd2_n_1;
  wire pd2_out;
  wire pd_n_1;
  wire pd_out;
  wire pipe1_done;
  wire pipe1_n_10;
  wire pipe1_n_11;
  wire pipe1_n_12;
  wire pipe1_n_13;
  wire pipe1_n_14;
  wire pipe1_n_15;
  wire pipe1_n_16;
  wire pipe1_n_17;
  wire pipe1_n_18;
  wire pipe1_n_19;
  wire pipe1_n_2;
  wire pipe1_n_20;
  wire pipe1_n_21;
  wire pipe1_n_22;
  wire pipe1_n_23;
  wire pipe1_n_24;
  wire pipe1_n_25;
  wire pipe1_n_26;
  wire pipe1_n_27;
  wire pipe1_n_28;
  wire pipe1_n_29;
  wire pipe1_n_3;
  wire pipe1_n_30;
  wire pipe1_n_31;
  wire pipe1_n_32;
  wire pipe1_n_33;
  wire pipe1_n_4;
  wire pipe1_n_5;
  wire pipe1_n_6;
  wire pipe1_n_7;
  wire pipe1_n_8;
  wire pipe1_n_9;
  wire pipe1_write_en;
  wire pipe2_done;
  wire reset;
  wire stage2_go_in;
  wire stage2_valid_done;
  wire stage2_valid_out;
  wire stage2_valid_write_en;

  std_add__parameterized0 add
       (.a(add_left),
        .b(b),
        .out0(add_out));
  std_reg__parameterized2 fsm
       (.D(D),
        .Q({fsm_out,Q}),
        .clk(clk),
        .\out_reg[0]_0 (fsm_n_2),
        .\out_reg[0]_1 (pipe1_done),
        .\out_reg[0]_2 (\out_reg[1]_2 ),
        .\out_reg[0]_3 (fsm3_n_6),
        .pd0_out(pd0_out),
        .pd_out(pd_out),
        .reset(reset));
  std_reg__parameterized2_2 fsm0
       (.A_LUT_0_i_3(\out_reg[1] ),
        .D(fsm0_in),
        .H_LUT_34({pipe1_n_2,pipe1_n_3,pipe1_n_4,pipe1_n_5,pipe1_n_6,pipe1_n_7,pipe1_n_8,pipe1_n_9,pipe1_n_10,pipe1_n_11,pipe1_n_12,pipe1_n_13,pipe1_n_14,pipe1_n_15,pipe1_n_16,pipe1_n_17,pipe1_n_18,pipe1_n_19,pipe1_n_20,pipe1_n_21,pipe1_n_22,pipe1_n_23,pipe1_n_24,pipe1_n_25,pipe1_n_26,pipe1_n_27,pipe1_n_28,pipe1_n_29,pipe1_n_30,pipe1_n_31,pipe1_n_32,pipe1_n_33}),
        .Q(fsm0_out),
        .a(add_left),
        .clk(clk),
        .go(go),
        .\out_reg[0]_0 (fsm0_n_36),
        .\out_reg[0]_1 (fsm3_n_6),
        .\out_reg[1]_0 (\out_reg[1]_0 ),
        .\out_reg[31] (pipe2_done),
        .\out_reg[31]_0 (\out_reg[1]_2 ),
        .pd0_out(pd0_out),
        .pd_out(pd_out),
        .reset(reset),
        .stage2_go_in(stage2_go_in),
        .stage2_valid_out(stage2_valid_out));
  std_reg__parameterized2_3 fsm1
       (.Q(fsm1_out),
        .clk(clk),
        .\out_reg[0]_0 (fsm1_n_3),
        .\out_reg[0]_1 (fsm3_n_2),
        .\out_reg[0]_2 (fsm3_n_7),
        .\out_reg[0]_3 (\out_reg[15]_0 [1]),
        .\out_reg[0]_4 (\out_reg[0]_0 ),
        .\out_reg[1]_0 (\out_reg[1]_3 ),
        .\out_reg[1]_1 (\out_reg[1]_4 ),
        .pd1_out(pd1_out),
        .pd2_out(pd2_out),
        .reset(reset),
        .stage2_valid_done(stage2_valid_done),
        .stage2_valid_write_en(stage2_valid_write_en));
  std_reg__parameterized2_4 fsm2
       (.clk(clk),
        .\out_reg[0]_0 (fsm2_n_1),
        .\out_reg[0]_1 (fsm3_n_2),
        .out_valid_done(out_valid_done),
        .out_valid_write_en(out_valid_write_en),
        .pd1_out(pd1_out),
        .pd2_out(pd2_out),
        .reset(reset),
        .stage2_valid_out(stage2_valid_out));
  std_reg__parameterized2_5 fsm3
       (.Q(\out_reg[1] ),
        .clk(clk),
        .go(go),
        .go_0(fsm3_n_6),
        .out0__0({fsm_out,Q}),
        .\out_reg[0]_0 (fsm3_n_3),
        .\out_reg[0]_1 (\out_reg[0] ),
        .\out_reg[0]_2 (fsm3_n_5),
        .\out_reg[0]_3 (pd_n_1),
        .\out_reg[0]_4 (pd2_n_1),
        .\out_reg[15] (pipe1_done),
        .\out_reg[15]_0 (\out_reg[15] ),
        .\out_reg[15]_1 (\out_reg[15]_0 ),
        .\out_reg[1]_0 (fsm3_n_2),
        .\out_reg[1]_1 (fsm3_n_7),
        .\out_reg[1]_2 (\out_reg[1]_1 ),
        .\out_reg[1]_3 (\out_reg[1]_2 ),
        .\out_reg[1]_4 (fsm0_out[1]),
        .pd0_out(pd0_out),
        .pd1_out(pd1_out),
        .pd2_out(pd2_out),
        .pd_out(pd_out),
        .reset(reset));
  std_mult_pipe mult_pipe
       (.A(A),
        .B(B),
        .D({mult_pipe_n_2,mult_pipe_n_3,mult_pipe_n_4,mult_pipe_n_5,mult_pipe_n_6,mult_pipe_n_7,mult_pipe_n_8,mult_pipe_n_9,mult_pipe_n_10,mult_pipe_n_11,mult_pipe_n_12,mult_pipe_n_13,mult_pipe_n_14,mult_pipe_n_15,mult_pipe_n_16,mult_pipe_n_17,mult_pipe_n_18,mult_pipe_n_19,mult_pipe_n_20,mult_pipe_n_21,mult_pipe_n_22,mult_pipe_n_23,mult_pipe_n_24,mult_pipe_n_25,mult_pipe_n_26,mult_pipe_n_27,mult_pipe_n_28,mult_pipe_n_29,mult_pipe_n_30,mult_pipe_n_31,mult_pipe_n_32,mult_pipe_n_33}),
        .E(pipe1_write_en),
        .Q(Q),
        .clk(clk),
        .\done_buf_reg[0] (\out_reg[1]_2 ),
        .\done_buf_reg[0]_0 (done_reg),
        .mult_pipe_done(mult_pipe_done),
        .out0(out0),
        .out0__0(out0__0),
        .out0__0_0(\out_reg[0] ),
        .out0__0_1(pipe1_done),
        .\out_reg[15] (fsm3_n_3),
        .p_0_in__0(p_0_in__0),
        .reset(reset));
  std_reg__parameterized1_6 out_valid
       (.clk(clk),
        .out_valid_done(out_valid_done),
        .out_valid_write_en(out_valid_write_en),
        .reset(reset));
  std_reg__parameterized1_7 pd
       (.clk(clk),
        .\out_reg[0]_0 (pd_n_1),
        .\out_reg[0]_1 (fsm_n_2),
        .pd0_out(pd0_out),
        .pd_out(pd_out),
        .reset(reset));
  std_reg__parameterized1_8 pd0
       (.clk(clk),
        .\out_reg[0]_0 (fsm0_n_36),
        .pd0_out(pd0_out),
        .reset(reset));
  std_reg__parameterized1_9 pd1
       (.clk(clk),
        .\out_reg[0]_0 (fsm1_n_3),
        .pd1_out(pd1_out),
        .reset(reset));
  std_reg__parameterized1_10 pd2
       (.clk(clk),
        .\out_reg[0]_0 (pd2_n_1),
        .\out_reg[0]_1 (fsm2_n_1),
        .pd1_out(pd1_out),
        .pd2_out(pd2_out),
        .reset(reset));
  std_reg_11 pipe1
       (.D({mult_pipe_n_2,mult_pipe_n_3,mult_pipe_n_4,mult_pipe_n_5,mult_pipe_n_6,mult_pipe_n_7,mult_pipe_n_8,mult_pipe_n_9,mult_pipe_n_10,mult_pipe_n_11,mult_pipe_n_12,mult_pipe_n_13,mult_pipe_n_14,mult_pipe_n_15,mult_pipe_n_16,mult_pipe_n_17,mult_pipe_n_18,mult_pipe_n_19,mult_pipe_n_20,mult_pipe_n_21,mult_pipe_n_22,mult_pipe_n_23,mult_pipe_n_24,mult_pipe_n_25,mult_pipe_n_26,mult_pipe_n_27,mult_pipe_n_28,mult_pipe_n_29,mult_pipe_n_30,mult_pipe_n_31,mult_pipe_n_32,mult_pipe_n_33}),
        .E(pipe1_write_en),
        .Q(Q),
        .clk(clk),
        .\done_buf_reg[0] (\out_reg[0] ),
        .done_reg_0(pipe1_done),
        .done_reg_1(done_reg),
        .mult_pipe_done(mult_pipe_done),
        .\out_reg[31]_0 ({pipe1_n_2,pipe1_n_3,pipe1_n_4,pipe1_n_5,pipe1_n_6,pipe1_n_7,pipe1_n_8,pipe1_n_9,pipe1_n_10,pipe1_n_11,pipe1_n_12,pipe1_n_13,pipe1_n_14,pipe1_n_15,pipe1_n_16,pipe1_n_17,pipe1_n_18,pipe1_n_19,pipe1_n_20,pipe1_n_21,pipe1_n_22,pipe1_n_23,pipe1_n_24,pipe1_n_25,pipe1_n_26,pipe1_n_27,pipe1_n_28,pipe1_n_29,pipe1_n_30,pipe1_n_31,pipe1_n_32,pipe1_n_33}),
        .reset(reset));
  std_reg_12 pipe2
       (.D(add_out),
        .E(stage2_go_in),
        .clk(clk),
        .\out_reg[31]_0 (\out_reg[31] ),
        .pipe2_done(pipe2_done),
        .reset(reset));
  std_reg__parameterized1_13 stage2_valid
       (.D(fsm0_in),
        .Q(fsm0_out[0]),
        .clk(clk),
        .\out_reg[0]_0 (fsm1_out),
        .\out_reg[0]_1 (fsm3_n_2),
        .\out_reg[1] (fsm3_n_5),
        .\out_reg[1]_0 (\out_reg[1]_2 ),
        .pd1_out(pd1_out),
        .pipe2_done(pipe2_done),
        .reset(reset),
        .stage2_valid_done(stage2_valid_done),
        .stage2_valid_out(stage2_valid_out),
        .stage2_valid_write_en(stage2_valid_write_en));
endmodule

module std_add
   (out0,
    a,
    b);
  output [3:0]out0;
  input [0:0]a;
  input [3:0]b;

  wire [0:0]a;
  wire [3:0]b;
  wire [3:0]out0;

  lakeroad_xilinx_ultrascale_plus_add4_2 _impl
       (.a(a),
        .b(b),
        .out0(out0));
endmodule

(* ORIG_REF_NAME = "std_add" *) 
module std_add__parameterized0
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

module std_fp_mult_pipe
   (mult_pipe_done,
    E,
    D,
    clk,
    p_0_in__0,
    reset,
    A,
    out0_0,
    B,
    out0__0_0,
    \done_buf_reg[0]_0 ,
    \done_buf_reg[0]_1 ,
    out0__0_1,
    Q,
    out0__0_2,
    \out_reg[15] );
  output mult_pipe_done;
  output [0:0]E;
  output [31:0]D;
  input clk;
  input p_0_in__0;
  input reset;
  input [16:0]A;
  input [16:0]out0_0;
  input [14:0]B;
  input [14:0]out0__0_0;
  input \done_buf_reg[0]_0 ;
  input \done_buf_reg[0]_1 ;
  input out0__0_1;
  input [0:0]Q;
  input out0__0_2;
  input \out_reg[15] ;

  wire \<const0> ;
  wire \<const1> ;
  wire [16:0]A;
  wire [14:0]B;
  wire [31:0]D;
  wire [0:0]E;
  wire GND_2;
  wire [0:0]Q;
  wire VCC_2;
  wire clk;
  wire \done_buf_reg[0]_0 ;
  wire \done_buf_reg[0]_1 ;
  wire \done_buf_reg_n_0_[0] ;
  wire \done_buf_reg_n_0_[1] ;
  wire mult_pipe_done;
  wire mult_pipe_go;
  wire [16:0]out0_0;
  wire [14:0]out0__0_0;
  wire out0__0_1;
  wire out0__0_2;
  wire out0__0_n_100;
  wire out0__0_n_101;
  wire out0__0_n_102;
  wire out0__0_n_103;
  wire out0__0_n_104;
  wire out0__0_n_105;
  wire out0__0_n_91;
  wire out0__0_n_92;
  wire out0__0_n_93;
  wire out0__0_n_94;
  wire out0__0_n_95;
  wire out0__0_n_96;
  wire out0__0_n_97;
  wire out0__0_n_98;
  wire out0__0_n_99;
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
  wire out0_n_24;
  wire out0_n_25;
  wire out0_n_26;
  wire out0_n_27;
  wire out0_n_28;
  wire out0_n_29;
  wire out0_n_30;
  wire out0_n_31;
  wire out0_n_32;
  wire out0_n_33;
  wire out0_n_34;
  wire out0_n_35;
  wire out0_n_36;
  wire out0_n_37;
  wire out0_n_38;
  wire out0_n_39;
  wire out0_n_40;
  wire out0_n_41;
  wire out0_n_42;
  wire out0_n_43;
  wire out0_n_44;
  wire out0_n_45;
  wire out0_n_46;
  wire out0_n_47;
  wire out0_n_48;
  wire out0_n_49;
  wire out0_n_50;
  wire out0_n_51;
  wire out0_n_52;
  wire out0_n_53;
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
  wire \out[23]_i_10_n_0 ;
  wire \out[23]_i_11_n_0 ;
  wire \out[23]_i_12_n_0 ;
  wire \out[23]_i_13_n_0 ;
  wire \out[23]_i_14_n_0 ;
  wire \out[23]_i_15_n_0 ;
  wire \out[23]_i_16_n_0 ;
  wire \out[23]_i_2_n_0 ;
  wire \out[23]_i_3_n_0 ;
  wire \out[23]_i_4_n_0 ;
  wire \out[23]_i_5_n_0 ;
  wire \out[23]_i_6_n_0 ;
  wire \out[23]_i_7_n_0 ;
  wire \out[23]_i_8_n_0 ;
  wire \out[23]_i_9_n_0 ;
  wire \out[31]_i_10_n_0 ;
  wire \out[31]_i_11_n_0 ;
  wire \out[31]_i_12_n_0 ;
  wire \out[31]_i_13_n_0 ;
  wire \out[31]_i_14_n_0 ;
  wire \out[31]_i_15_n_0 ;
  wire \out[31]_i_16_n_0 ;
  wire \out[31]_i_17_n_0 ;
  wire \out[31]_i_3_n_0 ;
  wire \out[31]_i_4_n_0 ;
  wire \out[31]_i_5_n_0 ;
  wire \out[31]_i_6_n_0 ;
  wire \out[31]_i_7_n_0 ;
  wire \out[31]_i_8_n_0 ;
  wire \out[31]_i_9_n_0 ;
  wire \out_reg[15] ;
  wire \out_reg[23]_i_1_n_0 ;
  wire \out_tmp_reg_n_0_[0] ;
  wire \out_tmp_reg_n_0_[10] ;
  wire \out_tmp_reg_n_0_[11] ;
  wire \out_tmp_reg_n_0_[12] ;
  wire \out_tmp_reg_n_0_[13] ;
  wire \out_tmp_reg_n_0_[14] ;
  wire \out_tmp_reg_n_0_[15] ;
  wire \out_tmp_reg_n_0_[16] ;
  wire \out_tmp_reg_n_0_[1] ;
  wire \out_tmp_reg_n_0_[2] ;
  wire \out_tmp_reg_n_0_[3] ;
  wire \out_tmp_reg_n_0_[4] ;
  wire \out_tmp_reg_n_0_[5] ;
  wire \out_tmp_reg_n_0_[6] ;
  wire \out_tmp_reg_n_0_[7] ;
  wire \out_tmp_reg_n_0_[8] ;
  wire \out_tmp_reg_n_0_[9] ;
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
  wire p_0_in__0;
  wire reset;
  wire start;
  wire [7:0]\NLW_out_reg[23]_i_1_CO_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  VCC VCC
       (.P(\<const1> ));
  VCC VCC_1
       (.P(VCC_2));
  LUT4 #(
    .INIT(16'h0002)) 
    \done_buf[0]_i_1 
       (.I0(\done_buf_reg[0]_0 ),
        .I1(\done_buf_reg_n_0_[1] ),
        .I2(\done_buf_reg_n_0_[0] ),
        .I3(\done_buf_reg[0]_1 ),
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
        .R(p_0_in__0));
  FDRE \done_buf_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\done_buf_reg_n_0_[1] ),
        .Q(mult_pipe_done),
        .R(p_0_in__0));
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
    out0
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,out0_0}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ACOUT({out0_n_24,out0_n_25,out0_n_26,out0_n_27,out0_n_28,out0_n_29,out0_n_30,out0_n_31,out0_n_32,out0_n_33,out0_n_34,out0_n_35,out0_n_36,out0_n_37,out0_n_38,out0_n_39,out0_n_40,out0_n_41,out0_n_42,out0_n_43,out0_n_44,out0_n_45,out0_n_46,out0_n_47,out0_n_48,out0_n_49,out0_n_50,out0_n_51,out0_n_52,out0_n_53}),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,A}),
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
        .P({out0_n_89,out0_n_90,out0_n_91,out0_n_92,out0_n_93,out0_n_94,out0_n_95,out0_n_96,out0_n_97,out0_n_98,out0_n_99,out0_n_100,out0_n_101,out0_n_102,out0_n_103,out0_n_104,out0_n_105}),
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
        .RSTP(\<const0> ));
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
    out0__0
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,A}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,out0__0_0}),
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
        .CEP(mult_pipe_go),
        .CLK(clk),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({out0__0_n_91,out0__0_n_92,out0__0_n_93,out0__0_n_94,out0__0_n_95,out0__0_n_96,out0__0_n_97,out0__0_n_98,out0__0_n_99,out0__0_n_100,out0__0_n_101,out0__0_n_102,out0__0_n_103,out0__0_n_104,out0__0_n_105}),
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
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[0]_i_1__12 
       (.I0(\out_tmp_reg_n_0_[0] ),
        .I1(\out_reg[15] ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[10]_i_1 
       (.I0(\out_tmp_reg_n_0_[10] ),
        .I1(\out_reg[15] ),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[11]_i_1 
       (.I0(\out_tmp_reg_n_0_[11] ),
        .I1(\out_reg[15] ),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[12]_i_1 
       (.I0(\out_tmp_reg_n_0_[12] ),
        .I1(\out_reg[15] ),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[13]_i_1 
       (.I0(\out_tmp_reg_n_0_[13] ),
        .I1(\out_reg[15] ),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[14]_i_1 
       (.I0(\out_tmp_reg_n_0_[14] ),
        .I1(\out_reg[15] ),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[15]_i_1 
       (.I0(\out_tmp_reg_n_0_[15] ),
        .I1(\out_reg[15] ),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[1]_i_1__6 
       (.I0(\out_tmp_reg_n_0_[1] ),
        .I1(\out_reg[15] ),
        .O(D[1]));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_10 
       (.I0(out0__0_n_100),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_100),
        .O(\out[23]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_11 
       (.I0(out0__0_n_101),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_101),
        .O(\out[23]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_12 
       (.I0(out0__0_n_102),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_102),
        .O(\out[23]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_13 
       (.I0(out0__0_n_103),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_103),
        .O(\out[23]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_14 
       (.I0(out0__0_n_104),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_104),
        .O(\out[23]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_15 
       (.I0(out0__0_n_105),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_105),
        .O(\out[23]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_16 
       (.I0(\out_tmp_reg_n_0_[16] ),
        .I1(\out_reg[15] ),
        .O(\out[23]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_2 
       (.I0(out0__0_n_99),
        .I1(\out_reg[15] ),
        .O(\out[23]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_3 
       (.I0(out0__0_n_100),
        .I1(\out_reg[15] ),
        .O(\out[23]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_4 
       (.I0(out0__0_n_101),
        .I1(\out_reg[15] ),
        .O(\out[23]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_5 
       (.I0(out0__0_n_102),
        .I1(\out_reg[15] ),
        .O(\out[23]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_6 
       (.I0(out0__0_n_103),
        .I1(\out_reg[15] ),
        .O(\out[23]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_7 
       (.I0(out0__0_n_104),
        .I1(\out_reg[15] ),
        .O(\out[23]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_8 
       (.I0(out0__0_n_105),
        .I1(\out_reg[15] ),
        .O(\out[23]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_9 
       (.I0(out0__0_n_99),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_99),
        .O(\out[23]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[2]_i_1__1 
       (.I0(\out_tmp_reg_n_0_[2] ),
        .I1(\out_reg[15] ),
        .O(D[2]));
  LUT5 #(
    .INIT(32'h00000800)) 
    \out[31]_i_1 
       (.I0(mult_pipe_done),
        .I1(\done_buf_reg[0]_0 ),
        .I2(out0__0_2),
        .I3(Q),
        .I4(out0__0_1),
        .O(E));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_10 
       (.I0(out0__0_n_91),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_91),
        .O(\out[31]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_11 
       (.I0(out0__0_n_92),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_92),
        .O(\out[31]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_12 
       (.I0(out0__0_n_93),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_93),
        .O(\out[31]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_13 
       (.I0(out0__0_n_94),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_94),
        .O(\out[31]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_14 
       (.I0(out0__0_n_95),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_95),
        .O(\out[31]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_15 
       (.I0(out0__0_n_96),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_96),
        .O(\out[31]_i_15_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_16 
       (.I0(out0__0_n_97),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_97),
        .O(\out[31]_i_16_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_17 
       (.I0(out0__0_n_98),
        .I1(\out_reg[15] ),
        .I2(out_tmp_reg_n_98),
        .O(\out[31]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_3 
       (.I0(out0__0_n_92),
        .I1(\out_reg[15] ),
        .O(\out[31]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_4 
       (.I0(out0__0_n_93),
        .I1(\out_reg[15] ),
        .O(\out[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_5 
       (.I0(out0__0_n_94),
        .I1(\out_reg[15] ),
        .O(\out[31]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_6 
       (.I0(out0__0_n_95),
        .I1(\out_reg[15] ),
        .O(\out[31]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_7 
       (.I0(out0__0_n_96),
        .I1(\out_reg[15] ),
        .O(\out[31]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_8 
       (.I0(out0__0_n_97),
        .I1(\out_reg[15] ),
        .O(\out[31]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_9 
       (.I0(out0__0_n_98),
        .I1(\out_reg[15] ),
        .O(\out[31]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[3]_i_1__1 
       (.I0(\out_tmp_reg_n_0_[3] ),
        .I1(\out_reg[15] ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[4]_i_1 
       (.I0(\out_tmp_reg_n_0_[4] ),
        .I1(\out_reg[15] ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[5]_i_1 
       (.I0(\out_tmp_reg_n_0_[5] ),
        .I1(\out_reg[15] ),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[6]_i_1 
       (.I0(\out_tmp_reg_n_0_[6] ),
        .I1(\out_reg[15] ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[7]_i_1 
       (.I0(\out_tmp_reg_n_0_[7] ),
        .I1(\out_reg[15] ),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[8]_i_1 
       (.I0(\out_tmp_reg_n_0_[8] ),
        .I1(\out_reg[15] ),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[9]_i_1 
       (.I0(\out_tmp_reg_n_0_[9] ),
        .I1(\out_reg[15] ),
        .O(D[9]));
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY8 \out_reg[23]_i_1 
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({\out_reg[23]_i_1_n_0 ,\NLW_out_reg[23]_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\out[23]_i_2_n_0 ,\out[23]_i_3_n_0 ,\out[23]_i_4_n_0 ,\out[23]_i_5_n_0 ,\out[23]_i_6_n_0 ,\out[23]_i_7_n_0 ,\out[23]_i_8_n_0 ,\<const0> }),
        .O(D[23:16]),
        .S({\out[23]_i_9_n_0 ,\out[23]_i_10_n_0 ,\out[23]_i_11_n_0 ,\out[23]_i_12_n_0 ,\out[23]_i_13_n_0 ,\out[23]_i_14_n_0 ,\out[23]_i_15_n_0 ,\out[23]_i_16_n_0 }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_reg[31]_i_2 
       (.CI(\out_reg[23]_i_1_n_0 ),
        .CI_TOP(GND_2),
        .DI({\<const0> ,\out[31]_i_3_n_0 ,\out[31]_i_4_n_0 ,\out[31]_i_5_n_0 ,\out[31]_i_6_n_0 ,\out[31]_i_7_n_0 ,\out[31]_i_8_n_0 ,\out[31]_i_9_n_0 }),
        .O(D[31:24]),
        .S({\out[31]_i_10_n_0 ,\out[31]_i_11_n_0 ,\out[31]_i_12_n_0 ,\out[31]_i_13_n_0 ,\out[31]_i_14_n_0 ,\out[31]_i_15_n_0 ,\out[31]_i_16_n_0 ,\out[31]_i_17_n_0 }));
  LUT5 #(
    .INIT(32'h00000200)) 
    \out_tmp[16]_i_1 
       (.I0(\done_buf_reg[0]_0 ),
        .I1(mult_pipe_done),
        .I2(out0__0_1),
        .I3(Q),
        .I4(out0__0_2),
        .O(mult_pipe_go));
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
        .ACIN({out0_n_24,out0_n_25,out0_n_26,out0_n_27,out0_n_28,out0_n_29,out0_n_30,out0_n_31,out0_n_32,out0_n_33,out0_n_34,out0_n_35,out0_n_36,out0_n_37,out0_n_38,out0_n_39,out0_n_40,out0_n_41,out0_n_42,out0_n_43,out0_n_44,out0_n_45,out0_n_46,out0_n_47,out0_n_48,out0_n_49,out0_n_50,out0_n_51,out0_n_52,out0_n_53}),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,B}),
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
        .CEP(mult_pipe_go),
        .CLK(clk),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({out_tmp_reg_n_91,out_tmp_reg_n_92,out_tmp_reg_n_93,out_tmp_reg_n_94,out_tmp_reg_n_95,out_tmp_reg_n_96,out_tmp_reg_n_97,out_tmp_reg_n_98,out_tmp_reg_n_99,out_tmp_reg_n_100,out_tmp_reg_n_101,out_tmp_reg_n_102,out_tmp_reg_n_103,out_tmp_reg_n_104,out_tmp_reg_n_105}),
        .PCIN({out0_n_106,out0_n_107,out0_n_108,out0_n_109,out0_n_110,out0_n_111,out0_n_112,out0_n_113,out0_n_114,out0_n_115,out0_n_116,out0_n_117,out0_n_118,out0_n_119,out0_n_120,out0_n_121,out0_n_122,out0_n_123,out0_n_124,out0_n_125,out0_n_126,out0_n_127,out0_n_128,out0_n_129,out0_n_130,out0_n_131,out0_n_132,out0_n_133,out0_n_134,out0_n_135,out0_n_136,out0_n_137,out0_n_138,out0_n_139,out0_n_140,out0_n_141,out0_n_142,out0_n_143,out0_n_144,out0_n_145,out0_n_146,out0_n_147,out0_n_148,out0_n_149,out0_n_150,out0_n_151,out0_n_152,out0_n_153}),
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
  FDRE \out_tmp_reg[0] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_105),
        .Q(\out_tmp_reg_n_0_[0] ),
        .R(reset));
  FDRE \out_tmp_reg[10] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_95),
        .Q(\out_tmp_reg_n_0_[10] ),
        .R(reset));
  FDRE \out_tmp_reg[11] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_94),
        .Q(\out_tmp_reg_n_0_[11] ),
        .R(reset));
  FDRE \out_tmp_reg[12] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_93),
        .Q(\out_tmp_reg_n_0_[12] ),
        .R(reset));
  FDRE \out_tmp_reg[13] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_92),
        .Q(\out_tmp_reg_n_0_[13] ),
        .R(reset));
  FDRE \out_tmp_reg[14] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_91),
        .Q(\out_tmp_reg_n_0_[14] ),
        .R(reset));
  FDRE \out_tmp_reg[15] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_90),
        .Q(\out_tmp_reg_n_0_[15] ),
        .R(reset));
  FDRE \out_tmp_reg[16] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_89),
        .Q(\out_tmp_reg_n_0_[16] ),
        .R(reset));
  FDRE \out_tmp_reg[1] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_104),
        .Q(\out_tmp_reg_n_0_[1] ),
        .R(reset));
  FDRE \out_tmp_reg[2] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_103),
        .Q(\out_tmp_reg_n_0_[2] ),
        .R(reset));
  FDRE \out_tmp_reg[3] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_102),
        .Q(\out_tmp_reg_n_0_[3] ),
        .R(reset));
  FDRE \out_tmp_reg[4] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_101),
        .Q(\out_tmp_reg_n_0_[4] ),
        .R(reset));
  FDRE \out_tmp_reg[5] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_100),
        .Q(\out_tmp_reg_n_0_[5] ),
        .R(reset));
  FDRE \out_tmp_reg[6] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_99),
        .Q(\out_tmp_reg_n_0_[6] ),
        .R(reset));
  FDRE \out_tmp_reg[7] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_98),
        .Q(\out_tmp_reg_n_0_[7] ),
        .R(reset));
  FDRE \out_tmp_reg[8] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_97),
        .Q(\out_tmp_reg_n_0_[8] ),
        .R(reset));
  FDRE \out_tmp_reg[9] 
       (.C(clk),
        .CE(mult_pipe_go),
        .D(out0_n_96),
        .Q(\out_tmp_reg_n_0_[9] ),
        .R(reset));
endmodule

module std_lt
   (carry_8,
    b,
    comb_reg_out,
    a);
  output carry_8;
  input [0:0]b;
  input comb_reg_out;
  input [3:0]a;

  wire [3:0]a;
  wire [0:0]b;
  wire carry_8;
  wire comb_reg_out;

  lakeroad_xilinx_ultrascale_plus_ult4_2 _impl
       (.a(a),
        .b(b),
        .carry_8_0(carry_8),
        .comb_reg_out(comb_reg_out));
endmodule

module std_mult_pipe
   (mult_pipe_done,
    E,
    D,
    clk,
    p_0_in__0,
    reset,
    A,
    out0,
    B,
    out0__0,
    \done_buf_reg[0] ,
    \done_buf_reg[0]_0 ,
    out0__0_0,
    Q,
    out0__0_1,
    \out_reg[15] );
  output mult_pipe_done;
  output [0:0]E;
  output [31:0]D;
  input clk;
  input p_0_in__0;
  input reset;
  input [16:0]A;
  input [16:0]out0;
  input [14:0]B;
  input [14:0]out0__0;
  input \done_buf_reg[0] ;
  input \done_buf_reg[0]_0 ;
  input out0__0_0;
  input [0:0]Q;
  input out0__0_1;
  input \out_reg[15] ;

  wire [16:0]A;
  wire [14:0]B;
  wire [31:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire clk;
  wire \done_buf_reg[0] ;
  wire \done_buf_reg[0]_0 ;
  wire mult_pipe_done;
  wire [16:0]out0;
  wire [14:0]out0__0;
  wire out0__0_0;
  wire out0__0_1;
  wire \out_reg[15] ;
  wire p_0_in__0;
  wire reset;

  std_fp_mult_pipe comp
       (.A(A),
        .B(B),
        .D(D),
        .E(E),
        .Q(Q),
        .clk(clk),
        .\done_buf_reg[0]_0 (\done_buf_reg[0] ),
        .\done_buf_reg[0]_1 (\done_buf_reg[0]_0 ),
        .mult_pipe_done(mult_pipe_done),
        .out0_0(out0),
        .out0__0_0(out0__0),
        .out0__0_1(out0__0_0),
        .out0__0_2(out0__0_1),
        .\out_reg[15] (\out_reg[15] ),
        .p_0_in__0(p_0_in__0),
        .reset(reset));
endmodule

module std_reg
   (read_b_done,
    Q,
    reset,
    E,
    clk,
    a_read_data);
  output read_b_done;
  output [31:0]Q;
  input reset;
  input [0:0]E;
  input clk;
  input [31:0]a_read_data;

  wire \<const1> ;
  wire [0:0]E;
  wire [31:0]Q;
  wire [31:0]a_read_data;
  wire clk;
  wire read_b_done;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(read_b_done),
        .R(reset));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[10]),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[11]),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[12]),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[13]),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[14]),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[15]),
        .Q(Q[15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[16]),
        .Q(Q[16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[17]),
        .Q(Q[17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[18]),
        .Q(Q[18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[19]),
        .Q(Q[19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[20]),
        .Q(Q[20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[21]),
        .Q(Q[21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[22]),
        .Q(Q[22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[23]),
        .Q(Q[23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[24]),
        .Q(Q[24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[25]),
        .Q(Q[25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[26]),
        .Q(Q[26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[27]),
        .Q(Q[27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[28]),
        .Q(Q[28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[29]),
        .Q(Q[29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[30]),
        .Q(Q[30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[31]),
        .Q(Q[31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[3]),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[4]),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[5]),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[6]),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[7]),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[8]),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(a_read_data[9]),
        .Q(Q[9]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_1
   (Q,
    reset,
    E,
    b_read_data,
    clk);
  output [31:0]Q;
  input reset;
  input [0:0]E;
  input [31:0]b_read_data;
  input clk;

  wire [0:0]E;
  wire [31:0]Q;
  wire [31:0]b_read_data;
  wire clk;
  wire reset;

  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[10]),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[11]),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[12]),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[13]),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[14]),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[15]),
        .Q(Q[15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[16]),
        .Q(Q[16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[17]),
        .Q(Q[17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[18]),
        .Q(Q[18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[19]),
        .Q(Q[19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[20]),
        .Q(Q[20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[21]),
        .Q(Q[21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[22]),
        .Q(Q[22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[23]),
        .Q(Q[23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[24]),
        .Q(Q[24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[25]),
        .Q(Q[25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[26]),
        .Q(Q[26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[27]),
        .Q(Q[27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[28]),
        .Q(Q[28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[29]),
        .Q(Q[29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[30]),
        .Q(Q[30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[31]),
        .Q(Q[31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[3]),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[4]),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[5]),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[6]),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[7]),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[8]),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(b_read_data[9]),
        .Q(Q[9]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_11
   (done_reg_0,
    done_reg_1,
    \out_reg[31]_0 ,
    reset,
    E,
    clk,
    Q,
    \done_buf_reg[0] ,
    mult_pipe_done,
    D);
  output done_reg_0;
  output done_reg_1;
  output [31:0]\out_reg[31]_0 ;
  input reset;
  input [0:0]E;
  input clk;
  input [0:0]Q;
  input \done_buf_reg[0] ;
  input mult_pipe_done;
  input [31:0]D;

  wire \<const1> ;
  wire [31:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire clk;
  wire \done_buf_reg[0] ;
  wire done_reg_0;
  wire done_reg_1;
  wire mult_pipe_done;
  wire [31:0]\out_reg[31]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  LUT4 #(
    .INIT(16'hFFFB)) 
    \done_buf[0]_i_3 
       (.I0(done_reg_0),
        .I1(Q),
        .I2(\done_buf_reg[0] ),
        .I3(mult_pipe_done),
        .O(done_reg_1));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(done_reg_0),
        .R(reset));
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
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_12
   (pipe2_done,
    \out_reg[31]_0 ,
    reset,
    E,
    clk,
    D);
  output pipe2_done;
  output [31:0]\out_reg[31]_0 ;
  input reset;
  input [0:0]E;
  input clk;
  input [31:0]D;

  wire \<const1> ;
  wire [31:0]D;
  wire [0:0]E;
  wire clk;
  wire [31:0]\out_reg[31]_0 ;
  wire pipe2_done;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(pipe2_done),
        .R(reset));
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
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (\out_reg[2]_0 ,
    \out_reg[2]_1 ,
    b,
    D,
    \out_reg[0]_0 ,
    \out_reg[0]_1 ,
    A,
    B,
    \out_reg[0]_2 ,
    \out_reg[0]_3 ,
    p_0_in__0,
    a,
    in_range0_go_in,
    E,
    done_reg,
    \out_reg[1]_0 ,
    \out_reg[1]_1 ,
    out_write_data,
    \out_reg[1]_2 ,
    done,
    \out_reg[2]_2 ,
    \out_reg[0]_4 ,
    \out_reg[0]_5 ,
    a_addr0,
    go,
    Q,
    H_LUT_34,
    pipe2_done,
    H_LUT_34_0,
    \out_reg[3]_0 ,
    out_done,
    \out_reg[0]_6 ,
    \out_reg[0]_7 ,
    pipe1_done,
    out0_0,
    out_tmp_reg,
    out0__0,
    read_b_done,
    idx0_done,
    comb_reg_done,
    comb_reg_out,
    \out_reg[2]_3 ,
    D_LUT_3,
    out0,
    reset,
    clk);
  output \out_reg[2]_0 ;
  output [2:0]\out_reg[2]_1 ;
  output [31:0]b;
  output [1:0]D;
  output \out_reg[0]_0 ;
  output \out_reg[0]_1 ;
  output [16:0]A;
  output [14:0]B;
  output [16:0]\out_reg[0]_2 ;
  output [14:0]\out_reg[0]_3 ;
  output p_0_in__0;
  output [3:0]a;
  output in_range0_go_in;
  output [0:0]E;
  output [3:0]done_reg;
  output [0:0]\out_reg[1]_0 ;
  output [0:0]\out_reg[1]_1 ;
  output [31:0]out_write_data;
  output \out_reg[1]_2 ;
  output done;
  output \out_reg[2]_2 ;
  output \out_reg[0]_4 ;
  output [3:0]\out_reg[0]_5 ;
  output [3:0]a_addr0;
  input go;
  input [1:0]Q;
  input [31:0]H_LUT_34;
  input pipe2_done;
  input H_LUT_34_0;
  input \out_reg[3]_0 ;
  input out_done;
  input [0:0]\out_reg[0]_6 ;
  input \out_reg[0]_7 ;
  input pipe1_done;
  input out0_0;
  input [31:0]out_tmp_reg;
  input [31:0]out0__0;
  input read_b_done;
  input idx0_done;
  input comb_reg_done;
  input comb_reg_out;
  input \out_reg[2]_3 ;
  input [3:0]D_LUT_3;
  input [3:0]out0;
  input reset;
  input clk;

  wire [16:0]A;
  wire A_LUT_0_i_3_n_0;
  wire [14:0]B;
  wire [1:0]D;
  wire [3:0]D_LUT_3;
  wire [0:0]E;
  wire [31:0]H_LUT_34;
  wire H_LUT_34_0;
  wire [1:0]Q;
  wire [3:0]a;
  wire [3:0]a_addr0;
  wire [31:0]b;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire done;
  wire [3:0]done_reg;
  wire [3:0]fsm_in;
  wire [3:3]fsm_out;
  wire fsm_write_en;
  wire go;
  wire idx0_done;
  wire in_range0_go_in;
  wire [3:0]out0;
  wire out0_0;
  wire [31:0]out0__0;
  wire \out[1]_i_2__4_n_0 ;
  wire \out[1]_i_3__1_n_0 ;
  wire \out[2]_i_2_n_0 ;
  wire \out[2]_i_4_n_0 ;
  wire \out[2]_i_5_n_0 ;
  wire \out[2]_i_6_n_0 ;
  wire \out[3]_i_10_n_0 ;
  wire \out[3]_i_11_n_0 ;
  wire \out[3]_i_3_n_0 ;
  wire \out[3]_i_4_n_0 ;
  wire \out[3]_i_5_n_0 ;
  wire \out[3]_i_6_n_0 ;
  wire \out[3]_i_8_n_0 ;
  wire \out[3]_i_9_n_0 ;
  wire out_done;
  wire \out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire [16:0]\out_reg[0]_2 ;
  wire [14:0]\out_reg[0]_3 ;
  wire \out_reg[0]_4 ;
  wire [3:0]\out_reg[0]_5 ;
  wire [0:0]\out_reg[0]_6 ;
  wire \out_reg[0]_7 ;
  wire [0:0]\out_reg[1]_0 ;
  wire [0:0]\out_reg[1]_1 ;
  wire \out_reg[1]_2 ;
  wire \out_reg[2]_0 ;
  wire [2:0]\out_reg[2]_1 ;
  wire \out_reg[2]_2 ;
  wire \out_reg[2]_3 ;
  wire \out_reg[3]_0 ;
  wire [31:0]out_tmp_reg;
  wire [31:0]out_write_data;
  wire p_0_in__0;
  wire pipe1_done;
  wire pipe2_done;
  wire read_b_done;
  wire reset;

  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_0_i_1__0
       (.I0(in_range0_go_in),
        .I1(D_LUT_3[0]),
        .O(a[0]));
  LUT5 #(
    .INIT(32'h00002000)) 
    A_LUT_0_i_1__1
       (.I0(\out_reg[2]_1 [1]),
        .I1(fsm_out),
        .I2(go),
        .I3(\out_reg[2]_1 [0]),
        .I4(idx0_done),
        .O(\out_reg[1]_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_0_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[0]),
        .O(b[0]));
  LUT6 #(
    .INIT(64'h0040000000000000)) 
    A_LUT_0_i_2__0
       (.I0(idx0_done),
        .I1(\out_reg[2]_1 [0]),
        .I2(go),
        .I3(fsm_out),
        .I4(\out_reg[2]_1 [1]),
        .I5(D_LUT_3[0]),
        .O(done_reg[0]));
  LUT6 #(
    .INIT(64'h0000040000400000)) 
    A_LUT_0_i_3
       (.I0(pipe2_done),
        .I1(H_LUT_34_0),
        .I2(\out_reg[2]_1 [0]),
        .I3(\out_reg[2]_1 [1]),
        .I4(fsm_out),
        .I5(\out_reg[2]_1 [2]),
        .O(A_LUT_0_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_18_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[16]),
        .O(b[16]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_27_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[24]),
        .O(b[24]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_9_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[8]),
        .O(b[8]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_10_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[9]),
        .O(b[9]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_19_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[17]),
        .O(b[17]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_1_i_1__0
       (.I0(in_range0_go_in),
        .I1(D_LUT_3[1]),
        .O(a[1]));
  LUT6 #(
    .INIT(64'h0040000000000000)) 
    B_LUT_1_i_1__1
       (.I0(idx0_done),
        .I1(\out_reg[2]_1 [0]),
        .I2(go),
        .I3(fsm_out),
        .I4(\out_reg[2]_1 [1]),
        .I5(D_LUT_3[1]),
        .O(done_reg[1]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_1_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[1]),
        .O(b[1]));
  LUT6 #(
    .INIT(64'h0000000000000048)) 
    B_LUT_1_i_2__0
       (.I0(\out_reg[2]_1 [2]),
        .I1(go),
        .I2(fsm_out),
        .I3(\out_reg[2]_1 [0]),
        .I4(\out_reg[2]_1 [1]),
        .I5(comb_reg_done),
        .O(in_range0_go_in));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_28_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[25]),
        .O(b[25]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_11_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[10]),
        .O(b[10]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_20_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[18]),
        .O(b[18]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_29_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[26]),
        .O(b[26]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_2_i_1__0
       (.I0(in_range0_go_in),
        .I1(D_LUT_3[2]),
        .O(a[2]));
  LUT6 #(
    .INIT(64'h0040000000000000)) 
    C_LUT_2_i_1__1
       (.I0(idx0_done),
        .I1(\out_reg[2]_1 [0]),
        .I2(go),
        .I3(fsm_out),
        .I4(\out_reg[2]_1 [1]),
        .I5(D_LUT_3[2]),
        .O(done_reg[2]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_2_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[2]),
        .O(b[2]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_12_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[11]),
        .O(b[11]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_21_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[19]),
        .O(b[19]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_30_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[27]),
        .O(b[27]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_3_i_1__0
       (.I0(in_range0_go_in),
        .I1(D_LUT_3[3]),
        .O(a[3]));
  LUT6 #(
    .INIT(64'h0040000000000000)) 
    D_LUT_3_i_1__1
       (.I0(idx0_done),
        .I1(\out_reg[2]_1 [0]),
        .I2(go),
        .I3(fsm_out),
        .I4(\out_reg[2]_1 [1]),
        .I5(D_LUT_3[3]),
        .O(done_reg[3]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_3_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[3]),
        .O(b[3]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_13_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[12]),
        .O(b[12]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_22_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[20]),
        .O(b[20]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_31_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[28]),
        .O(b[28]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_4_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[4]),
        .O(b[4]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_14_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[13]),
        .O(b[13]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_23_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[21]),
        .O(b[21]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_32_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[29]),
        .O(b[29]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_5_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[5]),
        .O(b[5]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_15_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[14]),
        .O(b[14]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_24_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[22]),
        .O(b[22]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_33_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[30]),
        .O(b[30]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_6_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[6]),
        .O(b[6]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_16_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[15]),
        .O(b[15]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_25_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[23]),
        .O(b[23]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_34_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[31]),
        .O(b[31]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_7_i_2
       (.I0(A_LUT_0_i_3_n_0),
        .I1(H_LUT_34[7]),
        .O(b[7]));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    \b_addr0[0]_INST_0 
       (.I0(\out_reg[2]_1 [1]),
        .I1(fsm_out),
        .I2(go),
        .I3(\out_reg[2]_1 [0]),
        .I4(read_b_done),
        .I5(D_LUT_3[0]),
        .O(a_addr0[0]));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    \b_addr0[1]_INST_0 
       (.I0(\out_reg[2]_1 [1]),
        .I1(fsm_out),
        .I2(go),
        .I3(\out_reg[2]_1 [0]),
        .I4(read_b_done),
        .I5(D_LUT_3[1]),
        .O(a_addr0[1]));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    \b_addr0[2]_INST_0 
       (.I0(\out_reg[2]_1 [1]),
        .I1(fsm_out),
        .I2(go),
        .I3(\out_reg[2]_1 [0]),
        .I4(read_b_done),
        .I5(D_LUT_3[2]),
        .O(a_addr0[2]));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    \b_addr0[3]_INST_0 
       (.I0(\out_reg[2]_1 [1]),
        .I1(fsm_out),
        .I2(go),
        .I3(\out_reg[2]_1 [0]),
        .I4(read_b_done),
        .I5(D_LUT_3[3]),
        .O(a_addr0[3]));
  LUT4 #(
    .INIT(16'h4000)) 
    done_INST_0
       (.I0(\out_reg[2]_1 [2]),
        .I1(fsm_out),
        .I2(\out_reg[2]_1 [0]),
        .I3(\out_reg[2]_1 [1]),
        .O(done));
  LUT4 #(
    .INIT(16'h0430)) 
    \done_buf[0]_i_2 
       (.I0(\out_reg[2]_1 [2]),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .O(\out_reg[2]_0 ));
  LUT5 #(
    .INIT(32'hFFEFFAFF)) 
    \done_buf[1]_i_1 
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [2]),
        .I2(fsm_out),
        .I3(\out_reg[2]_1 [1]),
        .I4(\out_reg[2]_1 [0]),
        .O(p_0_in__0));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_1
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[31]),
        .O(\out_reg[0]_3 [14]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_10
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[22]),
        .O(\out_reg[0]_3 [5]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_11
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[21]),
        .O(\out_reg[0]_3 [4]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_12
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[20]),
        .O(\out_reg[0]_3 [3]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_13
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[19]),
        .O(\out_reg[0]_3 [2]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_14
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[18]),
        .O(\out_reg[0]_3 [1]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_15
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[17]),
        .O(\out_reg[0]_3 [0]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_2
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[30]),
        .O(\out_reg[0]_3 [13]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_3
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[29]),
        .O(\out_reg[0]_3 [12]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_4
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[28]),
        .O(\out_reg[0]_3 [11]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_5
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[27]),
        .O(\out_reg[0]_3 [10]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_6
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[26]),
        .O(\out_reg[0]_3 [9]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_7
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[25]),
        .O(\out_reg[0]_3 [8]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_8
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[24]),
        .O(\out_reg[0]_3 [7]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0__0_i_9
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[23]),
        .O(\out_reg[0]_3 [6]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_1
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[16]),
        .O(A[16]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_10
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[7]),
        .O(A[7]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_11
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[6]),
        .O(A[6]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_12
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[5]),
        .O(A[5]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_13
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[4]),
        .O(A[4]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_14
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[3]),
        .O(A[3]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_15
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[2]),
        .O(A[2]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_16
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[1]),
        .O(A[1]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_17
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[0]),
        .O(A[0]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_18
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[16]),
        .O(\out_reg[0]_2 [16]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_19
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[15]),
        .O(\out_reg[0]_2 [15]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_2
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[15]),
        .O(A[15]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_20
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[14]),
        .O(\out_reg[0]_2 [14]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_21
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[13]),
        .O(\out_reg[0]_2 [13]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_22
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[12]),
        .O(\out_reg[0]_2 [12]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_23
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[11]),
        .O(\out_reg[0]_2 [11]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_24
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[10]),
        .O(\out_reg[0]_2 [10]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_25
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[9]),
        .O(\out_reg[0]_2 [9]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_26
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[8]),
        .O(\out_reg[0]_2 [8]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_27
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[7]),
        .O(\out_reg[0]_2 [7]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_28
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[6]),
        .O(\out_reg[0]_2 [6]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_29
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[5]),
        .O(\out_reg[0]_2 [5]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_3
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[14]),
        .O(A[14]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_30
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[4]),
        .O(\out_reg[0]_2 [4]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_31
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[3]),
        .O(\out_reg[0]_2 [3]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_32
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[2]),
        .O(\out_reg[0]_2 [2]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_33
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[1]),
        .O(\out_reg[0]_2 [1]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_34
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out0__0[0]),
        .O(\out_reg[0]_2 [0]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_4
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[13]),
        .O(A[13]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_5
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[12]),
        .O(A[12]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_6
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[11]),
        .O(A[11]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_7
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[10]),
        .O(A[10]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_8
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[9]),
        .O(A[9]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out0_i_9
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[8]),
        .O(A[8]));
  LUT5 #(
    .INIT(32'h00000010)) 
    \out[0]_i_1__2 
       (.I0(\out_reg[0]_6 ),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(\out_reg[0]_7 ),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hFFFF0800)) 
    \out[0]_i_1__4 
       (.I0(out_done),
        .I1(\out[3]_i_8_n_0 ),
        .I2(\out_reg[2]_1 [0]),
        .I3(\out_reg[2]_1 [1]),
        .I4(\out[3]_i_4_n_0 ),
        .O(fsm_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \out[0]_i_1__5 
       (.I0(\out_reg[2]_1 [0]),
        .I1(\out_reg[2]_1 [1]),
        .I2(out0[0]),
        .O(\out_reg[0]_5 [0]));
  LUT4 #(
    .INIT(16'hFCBB)) 
    \out[15]_i_3 
       (.I0(\out_reg[2]_1 [0]),
        .I1(\out_reg[2]_1 [1]),
        .I2(\out_reg[2]_1 [2]),
        .I3(fsm_out),
        .O(\out_reg[0]_4 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAEAAAAA)) 
    \out[1]_i_1 
       (.I0(\out[1]_i_2__4_n_0 ),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_reg[2]_0 ),
        .I5(\out[1]_i_3__1_n_0 ),
        .O(fsm_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \out[1]_i_1__5 
       (.I0(\out_reg[2]_1 [0]),
        .I1(\out_reg[2]_1 [1]),
        .I2(out0[1]),
        .O(\out_reg[0]_5 [1]));
  LUT6 #(
    .INIT(64'h0F00040404000404)) 
    \out[1]_i_2__2 
       (.I0(\out_reg[2]_1 [1]),
        .I1(\out_reg[0]_0 ),
        .I2(\out_reg[0]_7 ),
        .I3(pipe1_done),
        .I4(\out_reg[0]_6 ),
        .I5(\out_reg[0]_1 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \out[1]_i_2__4 
       (.I0(\out_reg[2]_1 [1]),
        .I1(\out_reg[2]_1 [0]),
        .I2(go),
        .I3(fsm_out),
        .I4(\out_reg[2]_1 [2]),
        .I5(out_done),
        .O(\out[1]_i_2__4_n_0 ));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out[1]_i_3__1 
       (.I0(\out_reg[2]_1 [1]),
        .I1(fsm_out),
        .I2(go),
        .I3(\out_reg[2]_1 [0]),
        .I4(read_b_done),
        .O(\out[1]_i_3__1_n_0 ));
  LUT4 #(
    .INIT(16'h0040)) 
    \out[1]_i_3__2 
       (.I0(\out_reg[2]_1 [2]),
        .I1(fsm_out),
        .I2(\out_reg[2]_1 [0]),
        .I3(\out_reg[2]_1 [1]),
        .O(\out_reg[2]_2 ));
  LUT3 #(
    .INIT(8'h08)) 
    \out[1]_i_3__3 
       (.I0(\out_reg[2]_1 [0]),
        .I1(fsm_out),
        .I2(\out_reg[2]_1 [2]),
        .O(\out_reg[0]_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \out[1]_i_4__1 
       (.I0(\out_reg[2]_1 [0]),
        .I1(\out_reg[2]_1 [1]),
        .I2(fsm_out),
        .O(\out_reg[0]_1 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF808080)) 
    \out[2]_i_1 
       (.I0(comb_reg_done),
        .I1(comb_reg_out),
        .I2(\out[2]_i_2_n_0 ),
        .I3(\out_reg[2]_3 ),
        .I4(\out[2]_i_4_n_0 ),
        .I5(\out[2]_i_5_n_0 ),
        .O(fsm_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \out[2]_i_1__0 
       (.I0(\out_reg[2]_1 [0]),
        .I1(\out_reg[2]_1 [1]),
        .I2(out0[2]),
        .O(\out_reg[0]_5 [2]));
  LUT5 #(
    .INIT(32'h01001000)) 
    \out[2]_i_2 
       (.I0(\out_reg[2]_1 [1]),
        .I1(\out_reg[2]_1 [0]),
        .I2(fsm_out),
        .I3(go),
        .I4(\out_reg[2]_1 [2]),
        .O(\out[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0800)) 
    \out[2]_i_4 
       (.I0(\out_reg[2]_1 [0]),
        .I1(go),
        .I2(fsm_out),
        .I3(\out_reg[2]_1 [1]),
        .O(\out[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000C00080800000)) 
    \out[2]_i_5 
       (.I0(read_b_done),
        .I1(\out[2]_i_6_n_0 ),
        .I2(\out_reg[2]_1 [2]),
        .I3(\out_reg[3]_0 ),
        .I4(\out_reg[2]_1 [0]),
        .I5(\out_reg[2]_1 [1]),
        .O(\out[2]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[2]_i_6 
       (.I0(go),
        .I1(fsm_out),
        .O(\out[2]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00001000)) 
    \out[31]_i_1__1 
       (.I0(\out_reg[2]_1 [1]),
        .I1(fsm_out),
        .I2(go),
        .I3(\out_reg[2]_1 [0]),
        .I4(read_b_done),
        .O(\out_reg[1]_1 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFC840)) 
    \out[3]_i_1 
       (.I0(\out_reg[2]_1 [1]),
        .I1(\out[3]_i_3_n_0 ),
        .I2(read_b_done),
        .I3(idx0_done),
        .I4(\out[3]_i_4_n_0 ),
        .I5(\out[3]_i_5_n_0 ),
        .O(fsm_write_en));
  LUT2 #(
    .INIT(4'h1)) 
    \out[3]_i_10 
       (.I0(\out_reg[2]_1 [0]),
        .I1(\out_reg[2]_1 [1]),
        .O(\out[3]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \out[3]_i_11 
       (.I0(\out_reg[2]_1 [2]),
        .I1(fsm_out),
        .O(\out[3]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h0000300000000100)) 
    \out[3]_i_1__0 
       (.I0(\out_reg[2]_1 [2]),
        .I1(idx0_done),
        .I2(\out_reg[2]_1 [0]),
        .I3(go),
        .I4(fsm_out),
        .I5(\out_reg[2]_1 [1]),
        .O(E));
  LUT6 #(
    .INIT(64'hAFEAAAAAAAEAAAAA)) 
    \out[3]_i_2 
       (.I0(\out[3]_i_6_n_0 ),
        .I1(\out_reg[3]_0 ),
        .I2(\out_reg[2]_1 [0]),
        .I3(\out_reg[2]_1 [1]),
        .I4(\out[3]_i_8_n_0 ),
        .I5(out_done),
        .O(fsm_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \out[3]_i_2__0 
       (.I0(\out_reg[2]_1 [0]),
        .I1(\out_reg[2]_1 [1]),
        .I2(out0[3]),
        .O(\out_reg[0]_5 [3]));
  LUT3 #(
    .INIT(8'h40)) 
    \out[3]_i_3 
       (.I0(fsm_out),
        .I1(go),
        .I2(\out_reg[2]_1 [0]),
        .O(\out[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00EA0000C0AA0000)) 
    \out[3]_i_4 
       (.I0(\out[3]_i_9_n_0 ),
        .I1(comb_reg_done),
        .I2(\out[3]_i_10_n_0 ),
        .I3(fsm_out),
        .I4(go),
        .I5(\out_reg[2]_1 [2]),
        .O(\out[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFC08800)) 
    \out[3]_i_5 
       (.I0(out_done),
        .I1(go),
        .I2(\out_reg[3]_0 ),
        .I3(\out_reg[2]_1 [1]),
        .I4(\out_reg[2]_1 [0]),
        .I5(\out[3]_i_11_n_0 ),
        .O(\out[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h80808080FF808080)) 
    \out[3]_i_6 
       (.I0(\out[2]_i_4_n_0 ),
        .I1(\out_reg[2]_1 [2]),
        .I2(idx0_done),
        .I3(\out[2]_i_2_n_0 ),
        .I4(comb_reg_done),
        .I5(comb_reg_out),
        .O(\out[3]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \out[3]_i_8 
       (.I0(go),
        .I1(fsm_out),
        .I2(\out_reg[2]_1 [2]),
        .O(\out[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h02000200020F0200)) 
    \out[3]_i_9 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\out_reg[2]_1 [0]),
        .I3(\out_reg[2]_1 [1]),
        .I4(idx0_done),
        .I5(\out_reg[2]_1 [2]),
        .O(\out[3]_i_9_n_0 ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[0]),
        .Q(\out_reg[2]_1 [0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[1]),
        .Q(\out_reg[2]_1 [1]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[2]),
        .Q(\out_reg[2]_1 [2]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[3]),
        .Q(fsm_out),
        .R(reset));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_1
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[31]),
        .O(B[14]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_10
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[22]),
        .O(B[5]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_11
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[21]),
        .O(B[4]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_12
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[20]),
        .O(B[3]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_13
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[19]),
        .O(B[2]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_14
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[18]),
        .O(B[1]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_15
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[17]),
        .O(B[0]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_2
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[30]),
        .O(B[13]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_3
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[29]),
        .O(B[12]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_4
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[28]),
        .O(B[11]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_5
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[27]),
        .O(B[10]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_6
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[26]),
        .O(B[9]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_7
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[25]),
        .O(B[8]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_8
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[24]),
        .O(B[7]));
  LUT5 #(
    .INIT(32'h00100000)) 
    out_tmp_reg_i_9
       (.I0(out0_0),
        .I1(\out_reg[2]_1 [0]),
        .I2(\out_reg[2]_1 [1]),
        .I3(fsm_out),
        .I4(out_tmp_reg[23]),
        .O(B[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[0]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[0]),
        .O(out_write_data[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[10]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[10]),
        .O(out_write_data[10]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[11]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[11]),
        .O(out_write_data[11]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[12]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[12]),
        .O(out_write_data[12]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[13]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[13]),
        .O(out_write_data[13]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[14]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[14]),
        .O(out_write_data[14]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[15]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[15]),
        .O(out_write_data[15]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[16]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[16]),
        .O(out_write_data[16]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[17]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[17]),
        .O(out_write_data[17]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[18]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[18]),
        .O(out_write_data[18]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[19]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[19]),
        .O(out_write_data[19]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[1]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[1]),
        .O(out_write_data[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[20]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[20]),
        .O(out_write_data[20]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[21]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[21]),
        .O(out_write_data[21]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[22]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[22]),
        .O(out_write_data[22]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[23]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[23]),
        .O(out_write_data[23]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[24]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[24]),
        .O(out_write_data[24]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[25]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[25]),
        .O(out_write_data[25]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[26]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[26]),
        .O(out_write_data[26]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[27]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[27]),
        .O(out_write_data[27]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[28]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[28]),
        .O(out_write_data[28]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[29]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[29]),
        .O(out_write_data[29]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[2]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[2]),
        .O(out_write_data[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[30]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[30]),
        .O(out_write_data[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[31]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[31]),
        .O(out_write_data[31]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[3]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[3]),
        .O(out_write_data[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[4]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[4]),
        .O(out_write_data[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[5]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[5]),
        .O(out_write_data[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[6]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[6]),
        .O(out_write_data[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[7]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[7]),
        .O(out_write_data[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[8]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[8]),
        .O(out_write_data[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_write_data[9]_INST_0 
       (.I0(\out_reg[1]_2 ),
        .I1(H_LUT_34[9]),
        .O(out_write_data[9]));
  LUT6 #(
    .INIT(64'h0000000000002000)) 
    out_write_en_INST_0
       (.I0(\out_reg[2]_1 [1]),
        .I1(\out_reg[2]_1 [0]),
        .I2(go),
        .I3(fsm_out),
        .I4(\out_reg[2]_1 [2]),
        .I5(out_done),
        .O(\out_reg[1]_2 ));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0_0
   (idx0_done,
    done_reg_0,
    Q,
    reset,
    E,
    clk,
    \out_reg[2]_0 ,
    D);
  output idx0_done;
  output done_reg_0;
  output [3:0]Q;
  input reset;
  input [0:0]E;
  input clk;
  input [0:0]\out_reg[2]_0 ;
  input [3:0]D;

  wire \<const1> ;
  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire clk;
  wire done_reg_0;
  wire idx0_done;
  wire [0:0]\out_reg[2]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(idx0_done),
        .R(reset));
  LUT2 #(
    .INIT(4'h2)) 
    \out[2]_i_3 
       (.I0(idx0_done),
        .I1(\out_reg[2]_0 ),
        .O(done_reg_0));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1
   (comb_reg_done,
    comb_reg_out,
    reset,
    in_range0_go_in,
    clk,
    \out_reg[0]_0 );
  output comb_reg_done;
  output comb_reg_out;
  input reset;
  input in_range0_go_in;
  input clk;
  input \out_reg[0]_0 ;

  wire \<const1> ;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire in_range0_go_in;
  wire \out_reg[0]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(in_range0_go_in),
        .Q(comb_reg_done),
        .R(reset));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_0 ),
        .Q(comb_reg_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1_10
   (pd2_out,
    \out_reg[0]_0 ,
    reset,
    \out_reg[0]_1 ,
    clk,
    pd1_out);
  output pd2_out;
  output \out_reg[0]_0 ;
  input reset;
  input \out_reg[0]_1 ;
  input clk;
  input pd1_out;

  wire \<const1> ;
  wire clk;
  wire \out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire pd1_out;
  wire pd2_out;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  LUT2 #(
    .INIT(4'h7)) 
    \out[1]_i_4__0 
       (.I0(pd2_out),
        .I1(pd1_out),
        .O(\out_reg[0]_0 ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_1 ),
        .Q(pd2_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1_13
   (stage2_valid_done,
    stage2_valid_out,
    D,
    reset,
    stage2_valid_write_en,
    clk,
    \out_reg[1] ,
    Q,
    \out_reg[1]_0 ,
    pipe2_done,
    \out_reg[0]_0 ,
    pd1_out,
    \out_reg[0]_1 );
  output stage2_valid_done;
  output stage2_valid_out;
  output [0:0]D;
  input reset;
  input stage2_valid_write_en;
  input clk;
  input \out_reg[1] ;
  input [0:0]Q;
  input \out_reg[1]_0 ;
  input pipe2_done;
  input [1:0]\out_reg[0]_0 ;
  input pd1_out;
  input \out_reg[0]_1 ;

  wire \<const1> ;
  wire [0:0]D;
  wire [0:0]Q;
  wire clk;
  wire \out[0]_i_1__6_n_0 ;
  wire [1:0]\out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire \out_reg[1] ;
  wire \out_reg[1]_0 ;
  wire pd1_out;
  wire pipe2_done;
  wire reset;
  wire stage2_valid_done;
  wire stage2_valid_out;
  wire stage2_valid_write_en;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(stage2_valid_write_en),
        .Q(stage2_valid_done),
        .R(reset));
  LUT6 #(
    .INIT(64'hFFEFFFFF00040000)) 
    \out[0]_i_1__6 
       (.I0(stage2_valid_done),
        .I1(\out_reg[0]_0 [0]),
        .I2(\out_reg[0]_0 [1]),
        .I3(pd1_out),
        .I4(\out_reg[0]_1 ),
        .I5(stage2_valid_out),
        .O(\out[0]_i_1__6_n_0 ));
  LUT5 #(
    .INIT(32'hC4000400)) 
    \out[1]_i_2 
       (.I0(stage2_valid_out),
        .I1(\out_reg[1] ),
        .I2(Q),
        .I3(\out_reg[1]_0 ),
        .I4(pipe2_done),
        .O(D));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out[0]_i_1__6_n_0 ),
        .Q(stage2_valid_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1_6
   (out_valid_done,
    reset,
    out_valid_write_en,
    clk);
  output out_valid_done;
  input reset;
  input out_valid_write_en;
  input clk;

  wire \<const1> ;
  wire clk;
  wire out_valid_done;
  wire out_valid_write_en;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(out_valid_write_en),
        .Q(out_valid_done),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1_7
   (pd_out,
    \out_reg[0]_0 ,
    reset,
    \out_reg[0]_1 ,
    clk,
    pd0_out);
  output pd_out;
  output \out_reg[0]_0 ;
  input reset;
  input \out_reg[0]_1 ;
  input clk;
  input pd0_out;

  wire \<const1> ;
  wire clk;
  wire \out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire pd0_out;
  wire pd_out;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  LUT2 #(
    .INIT(4'h8)) 
    \out[1]_i_3__0 
       (.I0(pd_out),
        .I1(pd0_out),
        .O(\out_reg[0]_0 ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_1 ),
        .Q(pd_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1_8
   (pd0_out,
    reset,
    \out_reg[0]_0 ,
    clk);
  output pd0_out;
  input reset;
  input \out_reg[0]_0 ;
  input clk;

  wire \<const1> ;
  wire clk;
  wire \out_reg[0]_0 ;
  wire pd0_out;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_0 ),
        .Q(pd0_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1_9
   (pd1_out,
    reset,
    \out_reg[0]_0 ,
    clk);
  output pd1_out;
  input reset;
  input \out_reg[0]_0 ;
  input clk;

  wire \<const1> ;
  wire clk;
  wire \out_reg[0]_0 ;
  wire pd1_out;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_0 ),
        .Q(pd1_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized2
   (Q,
    \out_reg[0]_0 ,
    \out_reg[0]_1 ,
    \out_reg[0]_2 ,
    \out_reg[0]_3 ,
    pd_out,
    pd0_out,
    reset,
    D,
    clk);
  output [1:0]Q;
  output \out_reg[0]_0 ;
  input \out_reg[0]_1 ;
  input \out_reg[0]_2 ;
  input \out_reg[0]_3 ;
  input pd_out;
  input pd0_out;
  input reset;
  input [1:0]D;
  input clk;

  wire [1:0]D;
  wire [1:0]Q;
  wire clk;
  wire fsm_write_en;
  wire \out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire \out_reg[0]_2 ;
  wire \out_reg[0]_3 ;
  wire pd0_out;
  wire pd_out;
  wire reset;

  LUT6 #(
    .INIT(64'h0000FFFF00200020)) 
    \out[0]_i_1__7 
       (.I0(\out_reg[0]_2 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\out_reg[0]_3 ),
        .I4(pd0_out),
        .I5(pd_out),
        .O(\out_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF0008000C)) 
    \out[1]_i_1__0 
       (.I0(\out_reg[0]_1 ),
        .I1(\out_reg[0]_2 ),
        .I2(\out_reg[0]_3 ),
        .I3(pd_out),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(fsm_write_en));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(D[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(D[1]),
        .Q(Q[1]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized2_2
   (Q,
    a,
    stage2_go_in,
    \out_reg[1]_0 ,
    \out_reg[0]_0 ,
    \out_reg[31] ,
    \out_reg[31]_0 ,
    \out_reg[0]_1 ,
    pd0_out,
    D,
    stage2_valid_out,
    H_LUT_34,
    A_LUT_0_i_3,
    go,
    pd_out,
    reset,
    clk);
  output [1:0]Q;
  output [31:0]a;
  output stage2_go_in;
  output \out_reg[1]_0 ;
  output \out_reg[0]_0 ;
  input \out_reg[31] ;
  input \out_reg[31]_0 ;
  input \out_reg[0]_1 ;
  input pd0_out;
  input [0:0]D;
  input stage2_valid_out;
  input [31:0]H_LUT_34;
  input [1:0]A_LUT_0_i_3;
  input go;
  input pd_out;
  input reset;
  input clk;

  wire [1:0]A_LUT_0_i_3;
  wire [0:0]D;
  wire [31:0]H_LUT_34;
  wire [1:0]Q;
  wire [31:0]a;
  wire clk;
  wire [0:0]fsm0_in;
  wire fsm0_write_en;
  wire go;
  wire \out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire \out_reg[1]_0 ;
  wire \out_reg[31] ;
  wire \out_reg[31]_0 ;
  wire pd0_out;
  wire pd_out;
  wire reset;
  wire stage2_go_in;
  wire stage2_valid_out;

  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_0_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[0]),
        .O(a[0]));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    A_LUT_0_i_4
       (.I0(Q[1]),
        .I1(A_LUT_0_i_3[0]),
        .I2(A_LUT_0_i_3[1]),
        .I3(go),
        .I4(pd0_out),
        .I5(Q[0]),
        .O(\out_reg[1]_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_18_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[16]),
        .O(a[16]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_27_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[24]),
        .O(a[24]));
  LUT2 #(
    .INIT(4'h8)) 
    A_LUT_9_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[8]),
        .O(a[8]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_10_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[9]),
        .O(a[9]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_19_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[17]),
        .O(a[17]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_1_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[1]),
        .O(a[1]));
  LUT2 #(
    .INIT(4'h8)) 
    B_LUT_28_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[25]),
        .O(a[25]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_11_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[10]),
        .O(a[10]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_20_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[18]),
        .O(a[18]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_29_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[26]),
        .O(a[26]));
  LUT2 #(
    .INIT(4'h8)) 
    C_LUT_2_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[2]),
        .O(a[2]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_12_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[11]),
        .O(a[11]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_21_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[19]),
        .O(a[19]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_30_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[27]),
        .O(a[27]));
  LUT2 #(
    .INIT(4'h8)) 
    D_LUT_3_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[3]),
        .O(a[3]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_13_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[12]),
        .O(a[12]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_22_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[20]),
        .O(a[20]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_31_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[28]),
        .O(a[28]));
  LUT2 #(
    .INIT(4'h8)) 
    E_LUT_4_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[4]),
        .O(a[4]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_14_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[13]),
        .O(a[13]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_23_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[21]),
        .O(a[21]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_32_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[29]),
        .O(a[29]));
  LUT2 #(
    .INIT(4'h8)) 
    F_LUT_5_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[5]),
        .O(a[5]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_15_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[14]),
        .O(a[14]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_24_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[22]),
        .O(a[22]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_33_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[30]),
        .O(a[30]));
  LUT2 #(
    .INIT(4'h8)) 
    G_LUT_6_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[6]),
        .O(a[6]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_16_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[15]),
        .O(a[15]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_25_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[23]),
        .O(a[23]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_34_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[31]),
        .O(a[31]));
  LUT2 #(
    .INIT(4'h8)) 
    H_LUT_7_i_1
       (.I0(stage2_go_in),
        .I1(H_LUT_34[7]),
        .O(a[7]));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \out[0]_i_1__0 
       (.I0(stage2_valid_out),
        .I1(\out_reg[31]_0 ),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_reg[0]_1 ),
        .I5(pd0_out),
        .O(fsm0_in));
  LUT6 #(
    .INIT(64'h00000020FFFF0020)) 
    \out[0]_i_1__8 
       (.I0(\out_reg[31]_0 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\out_reg[0]_1 ),
        .I4(pd0_out),
        .I5(pd_out),
        .O(\out_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h00000008F0F0F0FC)) 
    \out[1]_i_1__1 
       (.I0(\out_reg[31] ),
        .I1(\out_reg[31]_0 ),
        .I2(Q[1]),
        .I3(\out_reg[0]_1 ),
        .I4(pd0_out),
        .I5(Q[0]),
        .O(fsm0_write_en));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \out[31]_i_1__0 
       (.I0(\out_reg[31] ),
        .I1(Q[1]),
        .I2(\out_reg[0]_1 ),
        .I3(pd0_out),
        .I4(Q[0]),
        .I5(\out_reg[31]_0 ),
        .O(stage2_go_in));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm0_write_en),
        .D(fsm0_in),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm0_write_en),
        .D(D),
        .Q(Q[1]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized2_3
   (Q,
    stage2_valid_write_en,
    \out_reg[0]_0 ,
    stage2_valid_done,
    \out_reg[0]_1 ,
    pd1_out,
    \out_reg[1]_0 ,
    \out_reg[0]_2 ,
    \out_reg[1]_1 ,
    \out_reg[0]_3 ,
    \out_reg[0]_4 ,
    pd2_out,
    reset,
    clk);
  output [1:0]Q;
  output stage2_valid_write_en;
  output \out_reg[0]_0 ;
  input stage2_valid_done;
  input \out_reg[0]_1 ;
  input pd1_out;
  input \out_reg[1]_0 ;
  input \out_reg[0]_2 ;
  input \out_reg[1]_1 ;
  input [0:0]\out_reg[0]_3 ;
  input \out_reg[0]_4 ;
  input pd2_out;
  input reset;
  input clk;

  wire [1:0]Q;
  wire clk;
  wire [1:0]fsm1_in;
  wire fsm1_write_en;
  wire \out[0]_i_2_n_0 ;
  wire \out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire \out_reg[0]_2 ;
  wire [0:0]\out_reg[0]_3 ;
  wire \out_reg[0]_4 ;
  wire \out_reg[1]_0 ;
  wire \out_reg[1]_1 ;
  wire pd1_out;
  wire pd2_out;
  wire reset;
  wire stage2_valid_done;
  wire stage2_valid_write_en;

  LUT5 #(
    .INIT(32'h00140000)) 
    done_i_1
       (.I0(stage2_valid_done),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(pd1_out),
        .I4(\out_reg[0]_1 ),
        .O(stage2_valid_write_en));
  LUT6 #(
    .INIT(64'hFFFF000071000000)) 
    \out[0]_i_1__3 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(stage2_valid_done),
        .I3(\out_reg[1]_0 ),
        .I4(\out_reg[0]_2 ),
        .I5(\out[0]_i_2_n_0 ),
        .O(fsm1_in[0]));
  LUT5 #(
    .INIT(32'h0080FF80)) 
    \out[0]_i_1__9 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(\out_reg[0]_1 ),
        .I3(pd1_out),
        .I4(pd2_out),
        .O(\out_reg[0]_0 ));
  LUT5 #(
    .INIT(32'h00600000)) 
    \out[0]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(stage2_valid_done),
        .I3(\out_reg[0]_3 ),
        .I4(\out_reg[0]_4 ),
        .O(\out[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFF08080C)) 
    \out[1]_i_1__3 
       (.I0(stage2_valid_done),
        .I1(\out_reg[0]_1 ),
        .I2(pd1_out),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(fsm1_write_en));
  LUT6 #(
    .INIT(64'h00C0C08800808088)) 
    \out[1]_i_2__3 
       (.I0(\out_reg[1]_1 ),
        .I1(\out_reg[0]_2 ),
        .I2(stage2_valid_done),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(\out_reg[1]_0 ),
        .O(fsm1_in[1]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm1_write_en),
        .D(fsm1_in[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm1_write_en),
        .D(fsm1_in[1]),
        .Q(Q[1]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized2_4
   (out_valid_write_en,
    \out_reg[0]_0 ,
    pd2_out,
    \out_reg[0]_1 ,
    out_valid_done,
    stage2_valid_out,
    pd1_out,
    reset,
    clk);
  output out_valid_write_en;
  output \out_reg[0]_0 ;
  input pd2_out;
  input \out_reg[0]_1 ;
  input out_valid_done;
  input stage2_valid_out;
  input pd1_out;
  input reset;
  input clk;

  wire clk;
  wire [1:0]fsm2_in;
  wire [1:0]fsm2_out;
  wire fsm2_write_en;
  wire \out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire out_valid_done;
  wire out_valid_write_en;
  wire pd1_out;
  wire pd2_out;
  wire reset;
  wire stage2_valid_out;

  LUT5 #(
    .INIT(32'h00140000)) 
    done_i_1__0
       (.I0(out_valid_done),
        .I1(fsm2_out[0]),
        .I2(fsm2_out[1]),
        .I3(pd2_out),
        .I4(\out_reg[0]_1 ),
        .O(out_valid_write_en));
  LUT6 #(
    .INIT(64'h000C0C0800000008)) 
    \out[0]_i_1__1 
       (.I0(stage2_valid_out),
        .I1(\out_reg[0]_1 ),
        .I2(pd2_out),
        .I3(fsm2_out[1]),
        .I4(fsm2_out[0]),
        .I5(out_valid_done),
        .O(fsm2_in[0]));
  LUT5 #(
    .INIT(32'h00FF8080)) 
    \out[0]_i_1__10 
       (.I0(\out_reg[0]_1 ),
        .I1(fsm2_out[0]),
        .I2(fsm2_out[1]),
        .I3(pd1_out),
        .I4(pd2_out),
        .O(\out_reg[0]_0 ));
  LUT5 #(
    .INIT(32'hFF404044)) 
    \out[1]_i_1__4 
       (.I0(pd2_out),
        .I1(\out_reg[0]_1 ),
        .I2(out_valid_done),
        .I3(fsm2_out[1]),
        .I4(fsm2_out[0]),
        .O(fsm2_write_en));
  LUT6 #(
    .INIT(64'h000C0C0400000004)) 
    \out[1]_i_2__1 
       (.I0(stage2_valid_out),
        .I1(\out_reg[0]_1 ),
        .I2(pd2_out),
        .I3(fsm2_out[1]),
        .I4(fsm2_out[0]),
        .I5(out_valid_done),
        .O(fsm2_in[1]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm2_write_en),
        .D(fsm2_in[0]),
        .Q(fsm2_out[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm2_write_en),
        .D(fsm2_in[1]),
        .Q(fsm2_out[1]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized2_5
   (Q,
    \out_reg[1]_0 ,
    \out_reg[0]_0 ,
    \out_reg[0]_1 ,
    \out_reg[0]_2 ,
    go_0,
    \out_reg[1]_1 ,
    \out_reg[1]_2 ,
    \out_reg[0]_3 ,
    go,
    \out_reg[1]_3 ,
    \out_reg[0]_4 ,
    pd_out,
    pd0_out,
    pd1_out,
    pd2_out,
    out0__0,
    \out_reg[15] ,
    \out_reg[15]_0 ,
    \out_reg[15]_1 ,
    \out_reg[1]_4 ,
    reset,
    clk);
  output [1:0]Q;
  output \out_reg[1]_0 ;
  output \out_reg[0]_0 ;
  output \out_reg[0]_1 ;
  output \out_reg[0]_2 ;
  output go_0;
  output \out_reg[1]_1 ;
  output \out_reg[1]_2 ;
  input \out_reg[0]_3 ;
  input go;
  input \out_reg[1]_3 ;
  input \out_reg[0]_4 ;
  input pd_out;
  input pd0_out;
  input pd1_out;
  input pd2_out;
  input [1:0]out0__0;
  input \out_reg[15] ;
  input \out_reg[15]_0 ;
  input [1:0]\out_reg[15]_1 ;
  input [0:0]\out_reg[1]_4 ;
  input reset;
  input clk;

  wire [1:0]Q;
  wire clk;
  wire [1:0]fsm3_in;
  wire fsm3_write_en;
  wire go;
  wire go_0;
  wire [1:0]out0__0;
  wire \out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire \out_reg[0]_2 ;
  wire \out_reg[0]_3 ;
  wire \out_reg[0]_4 ;
  wire \out_reg[15] ;
  wire \out_reg[15]_0 ;
  wire [1:0]\out_reg[15]_1 ;
  wire \out_reg[1]_0 ;
  wire \out_reg[1]_1 ;
  wire \out_reg[1]_2 ;
  wire \out_reg[1]_3 ;
  wire [0:0]\out_reg[1]_4 ;
  wire pd0_out;
  wire pd1_out;
  wire pd2_out;
  wire pd_out;
  wire reset;

  LUT4 #(
    .INIT(16'h4000)) 
    done_i_2
       (.I0(Q[1]),
        .I1(go),
        .I2(Q[0]),
        .I3(\out_reg[1]_3 ),
        .O(\out_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h0200000000000000)) 
    \out[0]_i_1 
       (.I0(go),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(pd_out),
        .I4(pd0_out),
        .I5(\out_reg[1]_3 ),
        .O(fsm3_in[0]));
  LUT6 #(
    .INIT(64'hFFFBFFFBFFFBFFFF)) 
    \out[15]_i_2 
       (.I0(\out_reg[0]_1 ),
        .I1(out0__0[0]),
        .I2(\out_reg[15] ),
        .I3(\out_reg[15]_0 ),
        .I4(\out_reg[15]_1 [1]),
        .I5(\out_reg[15]_1 [0]),
        .O(\out_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF00C08080)) 
    \out[1]_i_1__2 
       (.I0(\out_reg[0]_3 ),
        .I1(go),
        .I2(\out_reg[1]_3 ),
        .I3(\out_reg[0]_4 ),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(fsm3_write_en));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    \out[1]_i_2__0 
       (.I0(\out_reg[1]_3 ),
        .I1(Q[0]),
        .I2(go),
        .I3(Q[1]),
        .I4(pd1_out),
        .I5(pd2_out),
        .O(fsm3_in[1]));
  LUT5 #(
    .INIT(32'h00000004)) 
    \out[1]_i_3 
       (.I0(pd0_out),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_reg[1]_4 ),
        .O(\out_reg[0]_2 ));
  LUT4 #(
    .INIT(16'h0040)) 
    \out[1]_i_4 
       (.I0(Q[1]),
        .I1(go),
        .I2(Q[0]),
        .I3(pd1_out),
        .O(\out_reg[1]_1 ));
  LUT3 #(
    .INIT(8'hFD)) 
    \out[31]_i_2 
       (.I0(go),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(go_0));
  LUT2 #(
    .INIT(4'h2)) 
    \out[3]_i_7 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\out_reg[1]_2 ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm3_write_en),
        .D(fsm3_in[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm3_write_en),
        .D(fsm3_in[1]),
        .Q(Q[1]),
        .R(reset));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \out_tmp[16]_i_2 
       (.I0(pd_out),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(out0__0[1]),
        .O(\out_reg[0]_1 ));
endmodule
