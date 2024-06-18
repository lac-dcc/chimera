// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:26:59 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//if-static-different-latencies.futil-ultrascale-place.v
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
    i_write_en);
  output [31:0]out0;
  input [31:0]a;
  input i_write_en;

  wire \<const0> ;
  wire \<const1> ;
  wire ZERO;
  wire [31:0]a;
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
       (.I0(a[0]),
        .I1(i_write_en),
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
        .S(a[15:8]));
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
        .S(a[23:16]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_35
       (.CI(co_11),
        .CI_TOP(\<const0> ),
        .DI({ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO}),
        .O(out0[31:24]),
        .S(a[31:24]));
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
        .S({a[7:1],luts_O6_1[0]}));
endmodule

module lakeroad_xilinx_ultrascale_plus_eq1_2
   (eq_out,
    cond0_go_in);
  output eq_out;
  input cond0_go_in;

  wire cond0_go_in;

  assign eq_out = cond0_go_in;
endmodule

(* ECO_CHECKSUM = "f854badb" *) 
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
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire done;
  wire eq_out;
  wire fsm_n_0;
  wire fsm_n_1;
  wire fsm_n_10;
  wire fsm_n_11;
  wire fsm_n_12;
  wire fsm_n_13;
  wire fsm_n_14;
  wire fsm_n_15;
  wire fsm_n_16;
  wire fsm_n_17;
  wire fsm_n_18;
  wire fsm_n_19;
  wire fsm_n_2;
  wire fsm_n_20;
  wire fsm_n_21;
  wire fsm_n_22;
  wire fsm_n_23;
  wire fsm_n_24;
  wire fsm_n_25;
  wire fsm_n_26;
  wire fsm_n_27;
  wire fsm_n_28;
  wire fsm_n_29;
  wire fsm_n_3;
  wire fsm_n_30;
  wire fsm_n_31;
  wire fsm_n_32;
  wire fsm_n_4;
  wire fsm_n_5;
  wire fsm_n_6;
  wire fsm_n_7;
  wire fsm_n_8;
  wire fsm_n_9;
  wire go;
  wire i_done;
  wire [31:0]i_read_data;
  wire [31:0]i_write_data;
  wire i_write_en;
  wire reset;
  wire t0_done;
  wire t1_done;
  wire t1_write_en;
  wire t2_done;
  wire t2_write_en;
  wire t3_done;
  wire t3_write_en;
  wire t4_done;
  wire t4_write_en;
  wire true_go_in;

  assign i_clk = clk;
  GND GND
       (.G(\<const0> ));
  std_add add
       (.a({fsm_n_1,fsm_n_2,fsm_n_3,fsm_n_4,fsm_n_5,fsm_n_6,fsm_n_7,fsm_n_8,fsm_n_9,fsm_n_10,fsm_n_11,fsm_n_12,fsm_n_13,fsm_n_14,fsm_n_15,fsm_n_16,fsm_n_17,fsm_n_18,fsm_n_19,fsm_n_20,fsm_n_21,fsm_n_22,fsm_n_23,fsm_n_24,fsm_n_25,fsm_n_26,fsm_n_27,fsm_n_28,fsm_n_29,fsm_n_30,fsm_n_31,fsm_n_32}),
        .i_write_en(i_write_en),
        .out0(add_out));
  std_reg__parameterized0 comb_reg
       (.clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond0_go_in(cond0_go_in),
        .\out_reg[0]_0 (fsm_n_0),
        .reset(reset));
  std_eq eq
       (.cond0_go_in(cond0_go_in),
        .eq_out(eq_out));
  std_reg__parameterized1 fsm
       (.a({fsm_n_1,fsm_n_2,fsm_n_3,fsm_n_4,fsm_n_5,fsm_n_6,fsm_n_7,fsm_n_8,fsm_n_9,fsm_n_10,fsm_n_11,fsm_n_12,fsm_n_13,fsm_n_14,fsm_n_15,fsm_n_16,fsm_n_17,fsm_n_18,fsm_n_19,fsm_n_20,fsm_n_21,fsm_n_22,fsm_n_23,fsm_n_24,fsm_n_25,fsm_n_26,fsm_n_27,fsm_n_28,fsm_n_29,fsm_n_30,fsm_n_31,fsm_n_32}),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond0_go_in(cond0_go_in),
        .done(done),
        .eq_out(eq_out),
        .go(go),
        .i_done(i_done),
        .i_read_data(i_read_data),
        .i_write_data(i_write_data),
        .i_write_en(i_write_en),
        .lut2_0(fsm_n_0),
        .out0(add_out),
        .reset(reset),
        .t0_done(t0_done),
        .t1_done(t1_done),
        .t1_write_en(t1_write_en),
        .t2_done(t2_done),
        .t2_write_en(t2_write_en),
        .t3_done(t3_done),
        .t3_write_en(t3_write_en),
        .t4_done(t4_done),
        .t4_write_en(t4_write_en),
        .true_go_in(true_go_in));
  std_reg t0
       (.clk(clk),
        .reset(reset),
        .t0_done(t0_done),
        .true_go_in(true_go_in));
  std_reg_0 t1
       (.clk(clk),
        .reset(reset),
        .t1_done(t1_done),
        .t1_write_en(t1_write_en));
  std_reg_1 t2
       (.clk(clk),
        .reset(reset),
        .t2_done(t2_done),
        .t2_write_en(t2_write_en));
  std_reg_2 t3
       (.clk(clk),
        .reset(reset),
        .t3_done(t3_done),
        .t3_write_en(t3_write_en));
  std_reg_3 t4
       (.clk(clk),
        .reset(reset),
        .t4_done(t4_done),
        .t4_write_en(t4_write_en));
endmodule

module std_add
   (out0,
    a,
    i_write_en);
  output [31:0]out0;
  input [31:0]a;
  input i_write_en;

  wire [31:0]a;
  wire i_write_en;
  wire [31:0]out0;

  lakeroad_xilinx_ultrascale_plus_add32_2 _impl
       (.a(a),
        .i_write_en(i_write_en),
        .out0(out0));
endmodule

module std_eq
   (eq_out,
    cond0_go_in);
  output eq_out;
  input cond0_go_in;

  wire cond0_go_in;
  wire eq_out;

  lakeroad_xilinx_ultrascale_plus_eq1_2 _impl
       (.cond0_go_in(cond0_go_in),
        .eq_out(eq_out));
endmodule

module std_reg
   (t0_done,
    reset,
    true_go_in,
    clk);
  output t0_done;
  input reset;
  input true_go_in;
  input clk;

  wire \<const1> ;
  wire clk;
  wire reset;
  wire t0_done;
  wire true_go_in;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(true_go_in),
        .Q(t0_done),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_0
   (t1_done,
    reset,
    t1_write_en,
    clk);
  output t1_done;
  input reset;
  input t1_write_en;
  input clk;

  wire \<const1> ;
  wire clk;
  wire reset;
  wire t1_done;
  wire t1_write_en;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(t1_write_en),
        .Q(t1_done),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_1
   (t2_done,
    reset,
    t2_write_en,
    clk);
  output t2_done;
  input reset;
  input t2_write_en;
  input clk;

  wire \<const1> ;
  wire clk;
  wire reset;
  wire t2_done;
  wire t2_write_en;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(t2_write_en),
        .Q(t2_done),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_2
   (t3_done,
    reset,
    t3_write_en,
    clk);
  output t3_done;
  input reset;
  input t3_write_en;
  input clk;

  wire \<const1> ;
  wire clk;
  wire reset;
  wire t3_done;
  wire t3_write_en;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(t3_write_en),
        .Q(t3_done),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_3
   (t4_done,
    reset,
    t4_write_en,
    clk);
  output t4_done;
  input reset;
  input t4_write_en;
  input clk;

  wire \<const1> ;
  wire clk;
  wire reset;
  wire t4_done;
  wire t4_write_en;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(t4_write_en),
        .Q(t4_done),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (comb_reg_done,
    comb_reg_out,
    reset,
    cond0_go_in,
    clk,
    \out_reg[0]_0 );
  output comb_reg_done;
  output comb_reg_out;
  input reset;
  input cond0_go_in;
  input clk;
  input \out_reg[0]_0 ;

  wire \<const1> ;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire \out_reg[0]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(cond0_go_in),
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
module std_reg__parameterized1
   (lut2_0,
    a,
    i_write_data,
    i_write_en,
    t1_write_en,
    t3_write_en,
    t4_write_en,
    t2_write_en,
    true_go_in,
    cond0_go_in,
    done,
    eq_out,
    go,
    comb_reg_done,
    comb_reg_out,
    i_done,
    i_read_data,
    out0,
    reset,
    clk,
    t4_done,
    t0_done,
    t2_done,
    t3_done,
    t1_done);
  output lut2_0;
  output [31:0]a;
  output [31:0]i_write_data;
  output i_write_en;
  output t1_write_en;
  output t3_write_en;
  output t4_write_en;
  output t2_write_en;
  output true_go_in;
  output cond0_go_in;
  output done;
  input eq_out;
  input go;
  input comb_reg_done;
  input comb_reg_out;
  input i_done;
  input [31:0]i_read_data;
  input [31:0]out0;
  input reset;
  input clk;
  input t4_done;
  input t0_done;
  input t2_done;
  input t3_done;
  input t1_done;

  wire [31:0]a;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire done;
  wire eq_out;
  wire [1:0]fsm_out;
  wire fsm_write_en;
  wire go;
  wire i_done;
  wire [31:0]i_read_data;
  wire [31:0]i_write_data;
  wire i_write_en;
  wire lut2_0;
  wire [31:0]out0;
  wire \out[0]_i_1__0_n_0 ;
  wire \out[1]_i_2_n_0 ;
  wire p_0_in;
  wire reset;
  wire t0_done;
  wire t1_done;
  wire t1_write_en;
  wire t2_done;
  wire t2_write_en;
  wire t3_done;
  wire t3_write_en;
  wire t4_done;
  wire t4_write_en;
  wire true_go_in;

  LUT5 #(
    .INIT(32'h04000000)) 
    A_LUT_0_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[0]),
        .O(a[0]));
  LUT5 #(
    .INIT(32'h04000000)) 
    A_LUT_18_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[16]),
        .O(a[16]));
  LUT5 #(
    .INIT(32'h04000000)) 
    A_LUT_27_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[24]),
        .O(a[24]));
  LUT5 #(
    .INIT(32'h04000000)) 
    A_LUT_9_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[8]),
        .O(a[8]));
  LUT5 #(
    .INIT(32'h04000000)) 
    B_LUT_10_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[9]),
        .O(a[9]));
  LUT5 #(
    .INIT(32'h04000000)) 
    B_LUT_19_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[17]),
        .O(a[17]));
  LUT5 #(
    .INIT(32'h04000000)) 
    B_LUT_1_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[1]),
        .O(a[1]));
  LUT5 #(
    .INIT(32'h04000000)) 
    B_LUT_28_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[25]),
        .O(a[25]));
  LUT5 #(
    .INIT(32'h04000000)) 
    C_LUT_11_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[10]),
        .O(a[10]));
  LUT5 #(
    .INIT(32'h04000000)) 
    C_LUT_20_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[18]),
        .O(a[18]));
  LUT5 #(
    .INIT(32'h04000000)) 
    C_LUT_29_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[26]),
        .O(a[26]));
  LUT5 #(
    .INIT(32'h04000000)) 
    C_LUT_2_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[2]),
        .O(a[2]));
  LUT5 #(
    .INIT(32'h04000000)) 
    D_LUT_12_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[11]),
        .O(a[11]));
  LUT5 #(
    .INIT(32'h04000000)) 
    D_LUT_21_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[19]),
        .O(a[19]));
  LUT5 #(
    .INIT(32'h04000000)) 
    D_LUT_30_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[27]),
        .O(a[27]));
  LUT5 #(
    .INIT(32'h04000000)) 
    D_LUT_3_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[3]),
        .O(a[3]));
  LUT5 #(
    .INIT(32'h04000000)) 
    E_LUT_13_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[12]),
        .O(a[12]));
  LUT5 #(
    .INIT(32'h04000000)) 
    E_LUT_22_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[20]),
        .O(a[20]));
  LUT5 #(
    .INIT(32'h04000000)) 
    E_LUT_31_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[28]),
        .O(a[28]));
  LUT5 #(
    .INIT(32'h04000000)) 
    E_LUT_4_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[4]),
        .O(a[4]));
  LUT5 #(
    .INIT(32'h04000000)) 
    F_LUT_14_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[13]),
        .O(a[13]));
  LUT5 #(
    .INIT(32'h04000000)) 
    F_LUT_23_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[21]),
        .O(a[21]));
  LUT5 #(
    .INIT(32'h04000000)) 
    F_LUT_32_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[29]),
        .O(a[29]));
  LUT5 #(
    .INIT(32'h04000000)) 
    F_LUT_5_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[5]),
        .O(a[5]));
  LUT5 #(
    .INIT(32'h04000000)) 
    G_LUT_15_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[14]),
        .O(a[14]));
  LUT5 #(
    .INIT(32'h04000000)) 
    G_LUT_24_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[22]),
        .O(a[22]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h04000000)) 
    G_LUT_33_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[30]),
        .O(a[30]));
  LUT5 #(
    .INIT(32'h04000000)) 
    G_LUT_6_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[6]),
        .O(a[6]));
  LUT5 #(
    .INIT(32'h04000000)) 
    H_LUT_16_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[15]),
        .O(a[15]));
  LUT5 #(
    .INIT(32'h04000000)) 
    H_LUT_25_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[23]),
        .O(a[23]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h04000000)) 
    H_LUT_34_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[31]),
        .O(a[31]));
  LUT5 #(
    .INIT(32'h04000000)) 
    H_LUT_7_i_1
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[7]),
        .O(a[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    done_INST_0
       (.I0(fsm_out[1]),
        .I1(fsm_out[0]),
        .O(done));
  LUT5 #(
    .INIT(32'h00200000)) 
    done_i_1
       (.I0(t0_done),
        .I1(t4_done),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .O(t1_write_en));
  LUT5 #(
    .INIT(32'h04000000)) 
    done_i_1__0
       (.I0(t4_done),
        .I1(go),
        .I2(fsm_out[1]),
        .I3(fsm_out[0]),
        .I4(t2_done),
        .O(t3_write_en));
  LUT5 #(
    .INIT(32'h00200000)) 
    done_i_1__1
       (.I0(t3_done),
        .I1(t4_done),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .O(t4_write_en));
  LUT5 #(
    .INIT(32'h04000000)) 
    done_i_1__2
       (.I0(t4_done),
        .I1(go),
        .I2(fsm_out[1]),
        .I3(fsm_out[0]),
        .I4(t1_done),
        .O(t2_write_en));
  LUT4 #(
    .INIT(16'h0020)) 
    done_i_1__3
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(t4_done),
        .O(true_go_in));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[0]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[0]),
        .O(i_write_data[0]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[10]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[10]),
        .O(i_write_data[10]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[11]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[11]),
        .O(i_write_data[11]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[12]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[12]),
        .O(i_write_data[12]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[13]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[13]),
        .O(i_write_data[13]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[14]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[14]),
        .O(i_write_data[14]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[15]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[15]),
        .O(i_write_data[15]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[16]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[16]),
        .O(i_write_data[16]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[17]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[17]),
        .O(i_write_data[17]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[18]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[18]),
        .O(i_write_data[18]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[19]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[19]),
        .O(i_write_data[19]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[1]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[1]),
        .O(i_write_data[1]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[20]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[20]),
        .O(i_write_data[20]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[21]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[21]),
        .O(i_write_data[21]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[22]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[22]),
        .O(i_write_data[22]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[23]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[23]),
        .O(i_write_data[23]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[24]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[24]),
        .O(i_write_data[24]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[25]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[25]),
        .O(i_write_data[25]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[26]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[26]),
        .O(i_write_data[26]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[27]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[27]),
        .O(i_write_data[27]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[28]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[28]),
        .O(i_write_data[28]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[29]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[29]),
        .O(i_write_data[29]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[2]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[2]),
        .O(i_write_data[2]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[30]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[30]),
        .O(i_write_data[30]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[31]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[31]),
        .O(i_write_data[31]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[3]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[3]),
        .O(i_write_data[3]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[4]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[4]),
        .O(i_write_data[4]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[5]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[5]),
        .O(i_write_data[5]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[6]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[6]),
        .O(i_write_data[6]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[7]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[7]),
        .O(i_write_data[7]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[8]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[8]),
        .O(i_write_data[8]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[9]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(out0[9]),
        .O(i_write_data[9]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    i_write_en_INST_0
       (.I0(fsm_out[1]),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(i_done),
        .O(i_write_en));
  LUT4 #(
    .INIT(16'h0002)) 
    lut2_0_i_1
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(comb_reg_done),
        .O(cond0_go_in));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT6 #(
    .INIT(64'hFFFFFFF700000004)) 
    \out[0]_i_1 
       (.I0(eq_out),
        .I1(go),
        .I2(fsm_out[1]),
        .I3(fsm_out[0]),
        .I4(comb_reg_done),
        .I5(comb_reg_out),
        .O(lut2_0));
  LUT6 #(
    .INIT(64'h0000AAAAAAAACAAA)) 
    \out[0]_i_1__0 
       (.I0(p_0_in),
        .I1(comb_reg_out),
        .I2(comb_reg_done),
        .I3(go),
        .I4(fsm_out[0]),
        .I5(fsm_out[1]),
        .O(\out[0]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hEBEAEAEA)) 
    \out[1]_i_1 
       (.I0(p_0_in),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(go),
        .I4(comb_reg_done),
        .O(fsm_write_en));
  LUT6 #(
    .INIT(64'h0000FF00FF007F40)) 
    \out[1]_i_2 
       (.I0(comb_reg_out),
        .I1(go),
        .I2(comb_reg_done),
        .I3(p_0_in),
        .I4(fsm_out[0]),
        .I5(fsm_out[1]),
        .O(\out[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00C0A000)) 
    \out[1]_i_3 
       (.I0(t4_done),
        .I1(i_done),
        .I2(go),
        .I3(fsm_out[0]),
        .I4(fsm_out[1]),
        .O(p_0_in));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(\out[0]_i_1__0_n_0 ),
        .Q(fsm_out[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(\out[1]_i_2_n_0 ),
        .Q(fsm_out[1]),
        .R(reset));
endmodule
