// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:16:45 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//while.futil-ultrascale-route.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module lakeroad_xilinx_ultrascale_plus_add32_2
   (out0,
    i_write_en,
    b);
  output [31:0]out0;
  input i_write_en;
  input [31:0]b;

  wire \<const0> ;
  wire \<const1> ;
  wire ZERO;
  wire [31:0]b;
  wire [7:7]co_11;
  wire [7:7]co_3;
  wire [7:7]co_7;
  wire i_write_en;
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
       (.I0(i_write_en),
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
    b,
    comb_reg_out,
    a);
  output carry_35_0;
  input [0:0]b;
  input comb_reg_out;
  input [31:0]a;

  wire \<const0> ;
  wire \<const1> ;
  wire [31:0]a;
  wire [0:0]b;
  wire carry_35_0;
  wire [7:7]co_11;
  wire [7:7]co_3;
  wire [7:7]co_7;
  wire comb_reg_out;
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
    A_LUT_18
       (.I0(a[16]),
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
    C_LUT_20
       (.I0(a[18]),
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(b),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
    G_LUT_15
       (.I0(a[14]),
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
        .I1(\<const0> ),
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
    \out[0]_i_1__0 
       (.I0(lt_out),
        .I1(b),
        .I2(comb_reg_out),
        .O(carry_35_0));
endmodule

(* ECO_CHECKSUM = "d9fecc25" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    .i_addr0(\<const0> ),
    i_write_data,
    i_write_en,
    i_clk,
    i_read_data,
    i_done);
  input go;
  input clk;
  input reset;
  output done;
  output [31:0]i_write_data;
  output i_write_en;
  output i_clk;
  input [31:0]i_read_data;
  input i_done;
  output \<const0> ;

  wire \<const0> ;
  wire [31:0]add_out;
  wire [31:0]add_right;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire done;
  wire go;
  wire i_done;
  wire [31:0]i_read_data;
  wire [31:0]i_write_data;
  wire i_write_en;
  wire [31:0]lt_left;
  wire lt_n_0;
  wire reset;

  assign i_clk = clk;
  GND GND
       (.G(\<const0> ));
  std_add add
       (.b(add_right),
        .i_write_en(i_write_en),
        .out0(add_out));
  std_reg comb_reg
       (.b(cond0_go_in),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .\out_reg[0]_0 (lt_n_0),
        .reset(reset));
  std_reg__parameterized0 fsm
       (.a(lt_left),
        .b(add_right),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .done(done),
        .go(go),
        .i_done(i_done),
        .i_read_data(i_read_data),
        .i_write_data(i_write_data),
        .i_write_en(i_write_en),
        .out0(add_out),
        .\out_reg[0]_0 (cond0_go_in),
        .reset(reset));
  std_lt lt
       (.a(lt_left),
        .b(cond0_go_in),
        .carry_35(lt_n_0),
        .comb_reg_out(comb_reg_out));
endmodule

module std_add
   (out0,
    i_write_en,
    b);
  output [31:0]out0;
  input i_write_en;
  input [31:0]b;

  wire [31:0]b;
  wire i_write_en;
  wire [31:0]out0;

  lakeroad_xilinx_ultrascale_plus_add32_2 _impl
       (.b(b),
        .i_write_en(i_write_en),
        .out0(out0));
endmodule

module std_lt
   (carry_35,
    b,
    comb_reg_out,
    a);
  output carry_35;
  input [0:0]b;
  input comb_reg_out;
  input [31:0]a;

  wire [31:0]a;
  wire [0:0]b;
  wire carry_35;
  wire comb_reg_out;

  lakeroad_xilinx_ultrascale_plus_ult32_2 _impl
       (.a(a),
        .b(b),
        .carry_35_0(carry_35),
        .comb_reg_out(comb_reg_out));
endmodule

module std_reg
   (comb_reg_done,
    comb_reg_out,
    reset,
    b,
    clk,
    \out_reg[0]_0 );
  output comb_reg_done;
  output comb_reg_out;
  input reset;
  input [0:0]b;
  input clk;
  input \out_reg[0]_0 ;

  wire \<const1> ;
  wire [0:0]b;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire \out_reg[0]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(b),
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
module std_reg__parameterized0
   (i_write_data,
    b,
    i_write_en,
    a,
    \out_reg[0]_0 ,
    done,
    reset,
    clk,
    i_done,
    comb_reg_done,
    go,
    out0,
    i_read_data,
    comb_reg_out);
  output [31:0]i_write_data;
  output [31:0]b;
  output i_write_en;
  output [31:0]a;
  output [0:0]\out_reg[0]_0 ;
  output done;
  input reset;
  input clk;
  input i_done;
  input comb_reg_done;
  input go;
  input [31:0]out0;
  input [31:0]i_read_data;
  input comb_reg_out;

  wire [31:0]a;
  wire [31:0]b;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire done;
  wire [2:0]fsm_out;
  wire fsm_write_en;
  wire go;
  wire i_done;
  wire [31:0]i_read_data;
  wire [31:0]i_write_data;
  wire i_write_en;
  wire [31:0]out0;
  wire \out[0]_i_1_n_0 ;
  wire \out[0]_i_2_n_0 ;
  wire \out[1]_i_1_n_0 ;
  wire \out[2]_i_2_n_0 ;
  wire [0:0]\out_reg[0]_0 ;
  wire reset;

  LUT6 #(
    .INIT(64'h0010100000000000)) 
    A_LUT_0_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[0]),
        .O(b[0]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    A_LUT_0_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[0]),
        .O(a[0]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    A_LUT_18_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[16]),
        .O(b[16]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    A_LUT_18_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[16]),
        .O(a[16]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    A_LUT_27_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[24]),
        .O(b[24]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    A_LUT_27_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[24]),
        .O(a[24]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    A_LUT_9_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[8]),
        .O(b[8]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    A_LUT_9_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[8]),
        .O(a[8]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    B_LUT_10_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[9]),
        .O(b[9]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    B_LUT_10_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[9]),
        .O(a[9]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    B_LUT_19_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[17]),
        .O(b[17]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    B_LUT_19_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[17]),
        .O(a[17]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    B_LUT_1_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[1]),
        .O(b[1]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    B_LUT_1_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[1]),
        .O(a[1]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    B_LUT_28_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[25]),
        .O(b[25]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    B_LUT_28_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[25]),
        .O(a[25]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    C_LUT_11_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[10]),
        .O(b[10]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    C_LUT_11_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[10]),
        .O(a[10]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    C_LUT_20_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[18]),
        .O(b[18]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    C_LUT_20_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[18]),
        .O(a[18]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    C_LUT_29_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[26]),
        .O(b[26]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    C_LUT_29_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[26]),
        .O(a[26]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    C_LUT_2_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[2]),
        .O(b[2]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    C_LUT_2_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[2]),
        .O(a[2]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    D_LUT_12_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[11]),
        .O(b[11]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    D_LUT_12_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[11]),
        .O(a[11]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    D_LUT_21_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[19]),
        .O(b[19]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    D_LUT_21_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[19]),
        .O(a[19]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    D_LUT_30_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[27]),
        .O(b[27]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    D_LUT_30_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[27]),
        .O(a[27]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    D_LUT_3_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[3]),
        .O(b[3]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    D_LUT_3_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[3]),
        .O(a[3]));
  LUT5 #(
    .INIT(32'h00000090)) 
    D_LUT_3_i_2
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(comb_reg_done),
        .O(\out_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    E_LUT_13_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[12]),
        .O(b[12]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    E_LUT_13_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[12]),
        .O(a[12]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    E_LUT_22_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[20]),
        .O(b[20]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    E_LUT_22_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[20]),
        .O(a[20]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    E_LUT_31_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[28]),
        .O(b[28]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    E_LUT_31_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[28]),
        .O(a[28]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    E_LUT_4_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[4]),
        .O(b[4]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    E_LUT_4_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[4]),
        .O(a[4]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    F_LUT_14_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[13]),
        .O(b[13]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    F_LUT_14_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[13]),
        .O(a[13]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    F_LUT_23_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[21]),
        .O(b[21]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    F_LUT_23_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[21]),
        .O(a[21]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    F_LUT_32_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[29]),
        .O(b[29]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    F_LUT_32_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[29]),
        .O(a[29]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    F_LUT_5_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[5]),
        .O(b[5]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    F_LUT_5_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[5]),
        .O(a[5]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    G_LUT_15_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[14]),
        .O(b[14]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    G_LUT_15_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[14]),
        .O(a[14]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    G_LUT_24_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[22]),
        .O(b[22]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    G_LUT_24_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[22]),
        .O(a[22]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    G_LUT_33_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[30]),
        .O(b[30]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    G_LUT_33_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[30]),
        .O(a[30]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    G_LUT_6_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[6]),
        .O(b[6]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    G_LUT_6_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[6]),
        .O(a[6]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    H_LUT_16_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[15]),
        .O(b[15]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    H_LUT_16_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[15]),
        .O(a[15]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    H_LUT_25_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[23]),
        .O(b[23]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    H_LUT_25_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[23]),
        .O(a[23]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    H_LUT_34_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[31]),
        .O(b[31]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    H_LUT_34_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[31]),
        .O(a[31]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    H_LUT_7_i_1
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[7]),
        .O(b[7]));
  LUT6 #(
    .INIT(64'h1000001000000000)) 
    H_LUT_7_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[7]),
        .O(a[7]));
  LUT3 #(
    .INIT(8'h04)) 
    done_INST_0
       (.I0(fsm_out[1]),
        .I1(fsm_out[2]),
        .I2(fsm_out[0]),
        .O(done));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[0]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[0]),
        .O(i_write_data[0]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[10]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[10]),
        .O(i_write_data[10]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[11]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[11]),
        .O(i_write_data[11]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[12]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[12]),
        .O(i_write_data[12]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[13]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[13]),
        .O(i_write_data[13]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[14]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[14]),
        .O(i_write_data[14]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[15]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[15]),
        .O(i_write_data[15]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[16]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[16]),
        .O(i_write_data[16]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[17]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[17]),
        .O(i_write_data[17]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[18]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[18]),
        .O(i_write_data[18]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[19]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[19]),
        .O(i_write_data[19]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[1]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[1]),
        .O(i_write_data[1]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[20]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[20]),
        .O(i_write_data[20]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[21]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[21]),
        .O(i_write_data[21]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[22]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[22]),
        .O(i_write_data[22]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[23]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[23]),
        .O(i_write_data[23]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[24]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[24]),
        .O(i_write_data[24]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[25]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[25]),
        .O(i_write_data[25]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[26]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[26]),
        .O(i_write_data[26]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[27]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[27]),
        .O(i_write_data[27]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[28]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[28]),
        .O(i_write_data[28]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[29]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[29]),
        .O(i_write_data[29]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[2]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[2]),
        .O(i_write_data[2]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[30]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[30]),
        .O(i_write_data[30]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[31]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[31]),
        .O(i_write_data[31]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[3]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[3]),
        .O(i_write_data[3]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[4]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[4]),
        .O(i_write_data[4]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[5]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[5]),
        .O(i_write_data[5]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[6]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[6]),
        .O(i_write_data[6]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[7]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[7]),
        .O(i_write_data[7]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[8]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[8]),
        .O(i_write_data[8]));
  LUT6 #(
    .INIT(64'h0010100000000000)) 
    \i_write_data[9]_INST_0 
       (.I0(i_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(out0[9]),
        .O(i_write_data[9]));
  LUT5 #(
    .INIT(32'h00000060)) 
    i_write_en_INST_0
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(i_done),
        .O(i_write_en));
  LUT6 #(
    .INIT(64'h80800000F0008080)) 
    \out[0]_i_1 
       (.I0(comb_reg_out),
        .I1(comb_reg_done),
        .I2(\out[0]_i_2_n_0 ),
        .I3(i_done),
        .I4(fsm_out[1]),
        .I5(fsm_out[0]),
        .O(\out[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[0]_i_2 
       (.I0(go),
        .I1(fsm_out[2]),
        .O(\out[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00600000)) 
    \out[1]_i_1 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(i_done),
        .O(\out[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0303EB2803030000)) 
    \out[2]_i_1 
       (.I0(i_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(comb_reg_done),
        .I4(fsm_out[2]),
        .I5(go),
        .O(fsm_write_en));
  LUT6 #(
    .INIT(64'h0000000040040000)) 
    \out[2]_i_2 
       (.I0(comb_reg_out),
        .I1(comb_reg_done),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(go),
        .I5(fsm_out[2]),
        .O(\out[2]_i_2_n_0 ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(\out[0]_i_1_n_0 ),
        .Q(fsm_out[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(\out[1]_i_1_n_0 ),
        .Q(fsm_out[1]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(\out[2]_i_2_n_0 ),
        .Q(fsm_out[2]),
        .R(reset));
endmodule
