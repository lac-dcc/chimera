// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:22:57 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//pow.futil-vanilla-opt.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NETLIST_CHECKSUM = "265182e5" *) 
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
        .Q(fsm_out),
        .clk(clk),
        .go(go),
        .out0({base_reg_n_1,base_reg_n_2,base_reg_n_3,base_reg_n_4,base_reg_n_5,base_reg_n_6,base_reg_n_7,base_reg_n_8,base_reg_n_9,base_reg_n_10,base_reg_n_11,base_reg_n_12,base_reg_n_13,base_reg_n_14,base_reg_n_15,base_reg_n_16,base_reg_n_17,base_reg_n_18,base_reg_n_19,base_reg_n_20,base_reg_n_21,base_reg_n_22,base_reg_n_23,base_reg_n_24,base_reg_n_25,base_reg_n_26,base_reg_n_27,base_reg_n_28,base_reg_n_29,base_reg_n_30,base_reg_n_31,base_reg_n_32}),
        .out_carry__0({exp_reg_n_0,exp_reg_n_1,exp_reg_n_2,exp_reg_n_3,exp_reg_n_4,exp_reg_n_5,exp_reg_n_6,exp_reg_n_7,exp_reg_n_8,exp_reg_n_9,exp_reg_n_10,exp_reg_n_11,exp_reg_n_12,exp_reg_n_13,exp_reg_n_14,exp_reg_n_15,exp_reg_n_16,exp_reg_n_17,exp_reg_n_18,exp_reg_n_19,exp_reg_n_20,exp_reg_n_21,exp_reg_n_22,exp_reg_n_23,exp_reg_n_24,exp_reg_n_25,exp_reg_n_26,exp_reg_n_27,exp_reg_n_28,exp_reg_n_29,exp_reg_n_30,exp_reg_n_31}),
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
    out_carry__0,
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
  input [31:0]out_carry__0;
  input [31:0]out0;

  wire [0:0]D;
  wire [1:0]Q;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire [31:16]\comp/out_tmp_reg ;
  wire cond0_go_in;
  wire count_done;
  wire [31:0]count_in;
  wire count_n_1;
  wire count_n_10;
  wire count_n_11;
  wire count_n_12;
  wire count_n_13;
  wire count_n_14;
  wire count_n_15;
  wire count_n_16;
  wire count_n_17;
  wire count_n_18;
  wire count_n_19;
  wire count_n_2;
  wire count_n_20;
  wire count_n_21;
  wire count_n_22;
  wire count_n_23;
  wire count_n_24;
  wire count_n_25;
  wire count_n_26;
  wire count_n_27;
  wire count_n_28;
  wire count_n_29;
  wire count_n_3;
  wire count_n_30;
  wire count_n_31;
  wire count_n_32;
  wire count_n_4;
  wire count_n_5;
  wire count_n_6;
  wire count_n_7;
  wire count_n_8;
  wire count_n_9;
  wire count_write_en;
  wire [2:2]fsm_in;
  wire fsm_n_10;
  wire fsm_n_2;
  wire fsm_n_3;
  wire fsm_n_5;
  wire fsm_n_9;
  wire [1:1]fsm_out;
  wire go;
  wire [31:0]incr_out;
  wire lt_out;
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
  wire [31:0]out_carry__0;
  wire out_done;
  wire \out_reg[0] ;
  wire \out_reg[0]_0 ;
  wire [31:0]\out_reg[31] ;
  wire [31:0]p_0_in;
  wire pd0_n_1;
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
       (.CO(lt_out),
        .D(fsm_in),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond0_go_in(cond0_go_in),
        .\out_reg[0]_0 (fsm_n_5),
        .\out_reg[2] (fsm_n_3),
        .reset(reset));
  std_reg_1 count
       (.D(t_in[0]),
        .DI({count_n_9,count_n_10,count_n_11,count_n_12,count_n_13,count_n_14,count_n_15,count_n_16}),
        .E(count_write_en),
        .Q(fsm_out),
        .S({count_n_1,count_n_2,count_n_3,count_n_4,count_n_5,count_n_6,count_n_7,count_n_8}),
        .clk(clk),
        .count_done(count_done),
        .incr_out(incr_out),
        .out_carry(fsm_n_5),
        .out_carry__0(out_carry__0),
        .\out_reg[0]_0 (mul_n_32),
        .\out_reg[14]_0 ({count_n_25,count_n_26,count_n_27,count_n_28,count_n_29,count_n_30,count_n_31,count_n_32}),
        .\out_reg[15]_0 ({count_n_17,count_n_18,count_n_19,count_n_20,count_n_21,count_n_22,count_n_23,count_n_24}),
        .\out_reg[31]_0 (count_in),
        .\out_reg[7]_0 (pd0_n_1),
        .\out_reg[7]_i_2_0 (fsm_n_2),
        .pd0_out(pd0_out),
        .pd_out(pd_out),
        .reset(reset),
        .t_done(t_done));
  std_reg__parameterized1 fsm
       (.D(D),
        .E(count_write_en),
        .Q(fsm_out),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond0_go_in(cond0_go_in),
        .count_done(count_done),
        .done_reg(t_write_en),
        .done_reg_0(fsm_n_9),
        .done_reg_1(fsm_n_10),
        .done_reg_2(Q),
        .go(go),
        .mul_done(mul_done),
        .out_done(out_done),
        .\out_reg[0]_0 (fsm_n_2),
        .\out_reg[0]_1 (fsm_n_5),
        .\out_reg[0]_2 (\out_reg[0] ),
        .\out_reg[0]_3 (\out_reg[0]_0 ),
        .\out_reg[2]_0 (fsm_n_3),
        .\out_reg[2]_1 (fsm_in),
        .pd0_out(pd0_out),
        .pd_out(pd_out),
        .reset(reset),
        .t_done(t_done));
  std_lt lt
       (.CO(lt_out),
        .DI({count_n_9,count_n_10,count_n_11,count_n_12,count_n_13,count_n_14,count_n_15,count_n_16}),
        .S({count_n_1,count_n_2,count_n_3,count_n_4,count_n_5,count_n_6,count_n_7,count_n_8}),
        .out_carry__0_0({count_n_25,count_n_26,count_n_27,count_n_28,count_n_29,count_n_30,count_n_31,count_n_32}),
        .out_carry__0_1({count_n_17,count_n_18,count_n_19,count_n_20,count_n_21,count_n_22,count_n_23,count_n_24}));
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
        .\out_reg[0]_1 (fsm_n_9),
        .\out_reg[31] (\comp/out_tmp_reg ),
        .p_0_in(p_0_in),
        .pd_out(pd_out),
        .reset(reset),
        .t_done(t_done));
  std_reg__parameterized0_3 pd0
       (.clk(clk),
        .count_done(count_done),
        .incr_out(incr_out),
        .\out_reg[0]_0 (pd0_n_1),
        .\out_reg[0]_1 (count_in),
        .\out_reg[0]_2 (fsm_n_10),
        .\out_reg[0]_3 (fsm_n_2),
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
   (CO,
    out_carry__0_0,
    out_carry__0_1,
    DI,
    S);
  output [0:0]CO;
  input [7:0]out_carry__0_0;
  input [7:0]out_carry__0_1;
  input [7:0]DI;
  input [7:0]S;

  wire \<const0> ;
  wire [0:0]CO;
  wire [7:0]DI;
  wire GND_2;
  wire [7:0]S;
  wire [7:0]out_carry__0_0;
  wire [7:0]out_carry__0_1;
  wire out_carry_n_0;
  wire [7:0]NLW_out_carry_CO_UNCONNECTED;
  wire [7:0]NLW_out_carry__0_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out_carry
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({out_carry_n_0,NLW_out_carry_CO_UNCONNECTED[6:0]}),
        .DI(out_carry__0_0),
        .S(out_carry__0_1));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out_carry__0
       (.CI(out_carry_n_0),
        .CI_TOP(GND_2),
        .CO({CO,NLW_out_carry__0_CO_UNCONNECTED[6:0]}),
        .DI(DI),
        .S(S));
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
    S,
    DI,
    \out_reg[15]_0 ,
    \out_reg[14]_0 ,
    D,
    incr_out,
    reset,
    E,
    clk,
    out_carry,
    out_carry__0,
    Q,
    \out_reg[0]_0 ,
    pd_out,
    t_done,
    \out_reg[7]_0 ,
    pd0_out,
    \out_reg[7]_i_2_0 ,
    \out_reg[31]_0 );
  output count_done;
  output [7:0]S;
  output [7:0]DI;
  output [7:0]\out_reg[15]_0 ;
  output [7:0]\out_reg[14]_0 ;
  output [0:0]D;
  output [31:0]incr_out;
  input reset;
  input [0:0]E;
  input clk;
  input out_carry;
  input [31:0]out_carry__0;
  input [0:0]Q;
  input [0:0]\out_reg[0]_0 ;
  input pd_out;
  input t_done;
  input [0:0]\out_reg[7]_0 ;
  input pd0_out;
  input \out_reg[7]_i_2_0 ;
  input [31:0]\out_reg[31]_0 ;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]D;
  wire [7:0]DI;
  wire [0:0]E;
  wire GND_2;
  wire [0:0]Q;
  wire [7:0]S;
  wire clk;
  wire count_done;
  wire [31:0]incr_out;
  wire [31:1]incr_right;
  wire \out[7]_i_11_n_0 ;
  wire out_carry;
  wire [31:0]out_carry__0;
  wire [0:0]\out_reg[0]_0 ;
  wire [7:0]\out_reg[14]_0 ;
  wire [7:0]\out_reg[15]_0 ;
  wire \out_reg[15]_i_2_n_0 ;
  wire \out_reg[23]_i_2_n_0 ;
  wire [31:0]\out_reg[31]_0 ;
  wire [0:0]\out_reg[7]_0 ;
  wire \out_reg[7]_i_2_0 ;
  wire \out_reg[7]_i_2_n_0 ;
  wire \out_reg_n_0_[0] ;
  wire \out_reg_n_0_[10] ;
  wire \out_reg_n_0_[11] ;
  wire \out_reg_n_0_[12] ;
  wire \out_reg_n_0_[13] ;
  wire \out_reg_n_0_[14] ;
  wire \out_reg_n_0_[15] ;
  wire \out_reg_n_0_[16] ;
  wire \out_reg_n_0_[17] ;
  wire \out_reg_n_0_[18] ;
  wire \out_reg_n_0_[19] ;
  wire \out_reg_n_0_[1] ;
  wire \out_reg_n_0_[20] ;
  wire \out_reg_n_0_[21] ;
  wire \out_reg_n_0_[22] ;
  wire \out_reg_n_0_[23] ;
  wire \out_reg_n_0_[24] ;
  wire \out_reg_n_0_[25] ;
  wire \out_reg_n_0_[26] ;
  wire \out_reg_n_0_[27] ;
  wire \out_reg_n_0_[28] ;
  wire \out_reg_n_0_[29] ;
  wire \out_reg_n_0_[2] ;
  wire \out_reg_n_0_[30] ;
  wire \out_reg_n_0_[31] ;
  wire \out_reg_n_0_[3] ;
  wire \out_reg_n_0_[4] ;
  wire \out_reg_n_0_[5] ;
  wire \out_reg_n_0_[6] ;
  wire \out_reg_n_0_[7] ;
  wire \out_reg_n_0_[8] ;
  wire \out_reg_n_0_[9] ;
  wire pd0_out;
  wire pd_out;
  wire reset;
  wire t_done;
  wire [7:0]\NLW_out_reg[15]_i_2_CO_UNCONNECTED ;
  wire [7:0]\NLW_out_reg[23]_i_2_CO_UNCONNECTED ;
  wire [7:0]\NLW_out_reg[7]_i_2_CO_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
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
  LUT4 #(
    .INIT(16'h0100)) 
    \out[15]_i_10 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[8] ),
        .O(incr_right[8]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[15]_i_3 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[15] ),
        .O(incr_right[15]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[15]_i_4 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[14] ),
        .O(incr_right[14]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[15]_i_5 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[13] ),
        .O(incr_right[13]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[15]_i_6 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[12] ),
        .O(incr_right[12]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[15]_i_7 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[11] ),
        .O(incr_right[11]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[15]_i_8 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[10] ),
        .O(incr_right[10]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[15]_i_9 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[9] ),
        .O(incr_right[9]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[23]_i_10 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[16] ),
        .O(incr_right[16]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[23]_i_3 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[23] ),
        .O(incr_right[23]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[23]_i_4 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[22] ),
        .O(incr_right[22]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[23]_i_5 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[21] ),
        .O(incr_right[21]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[23]_i_6 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[20] ),
        .O(incr_right[20]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[23]_i_7 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[19] ),
        .O(incr_right[19]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[23]_i_8 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[18] ),
        .O(incr_right[18]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[23]_i_9 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[17] ),
        .O(incr_right[17]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[31]_i_10 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[26] ),
        .O(incr_right[26]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[31]_i_11 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[25] ),
        .O(incr_right[25]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[31]_i_12 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[24] ),
        .O(incr_right[24]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[31]_i_5 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[31] ),
        .O(incr_right[31]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[31]_i_6 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[30] ),
        .O(incr_right[30]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[31]_i_7 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[29] ),
        .O(incr_right[29]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[31]_i_8 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[28] ),
        .O(incr_right[28]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[31]_i_9 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[27] ),
        .O(incr_right[27]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[7]_i_10 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[1] ),
        .O(incr_right[1]));
  LUT4 #(
    .INIT(16'h0001)) 
    \out[7]_i_11 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[0] ),
        .O(\out[7]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[7]_i_4 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[7] ),
        .O(incr_right[7]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[7]_i_5 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[6] ),
        .O(incr_right[6]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[7]_i_6 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[5] ),
        .O(incr_right[5]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[7]_i_7 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[4] ),
        .O(incr_right[4]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[7]_i_8 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[3] ),
        .O(incr_right[3]));
  LUT4 #(
    .INIT(16'h0100)) 
    \out[7]_i_9 
       (.I0(pd0_out),
        .I1(\out_reg[7]_i_2_0 ),
        .I2(count_done),
        .I3(\out_reg_n_0_[2] ),
        .O(incr_right[2]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry__0_i_1
       (.I0(\out_reg_n_0_[30] ),
        .I1(out_carry__0[30]),
        .I2(out_carry),
        .I3(out_carry__0[31]),
        .I4(\out_reg_n_0_[31] ),
        .O(DI[7]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry__0_i_10
       (.I0(out_carry),
        .I1(out_carry__0[29]),
        .I2(\out_reg_n_0_[29] ),
        .I3(out_carry__0[28]),
        .I4(\out_reg_n_0_[28] ),
        .O(S[6]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry__0_i_11
       (.I0(out_carry),
        .I1(out_carry__0[27]),
        .I2(\out_reg_n_0_[27] ),
        .I3(out_carry__0[26]),
        .I4(\out_reg_n_0_[26] ),
        .O(S[5]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry__0_i_12
       (.I0(out_carry),
        .I1(out_carry__0[25]),
        .I2(\out_reg_n_0_[25] ),
        .I3(out_carry__0[24]),
        .I4(\out_reg_n_0_[24] ),
        .O(S[4]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry__0_i_13
       (.I0(out_carry),
        .I1(out_carry__0[23]),
        .I2(\out_reg_n_0_[23] ),
        .I3(out_carry__0[22]),
        .I4(\out_reg_n_0_[22] ),
        .O(S[3]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry__0_i_14
       (.I0(out_carry),
        .I1(out_carry__0[21]),
        .I2(\out_reg_n_0_[21] ),
        .I3(out_carry__0[20]),
        .I4(\out_reg_n_0_[20] ),
        .O(S[2]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry__0_i_15
       (.I0(out_carry),
        .I1(out_carry__0[19]),
        .I2(\out_reg_n_0_[19] ),
        .I3(out_carry__0[18]),
        .I4(\out_reg_n_0_[18] ),
        .O(S[1]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry__0_i_16
       (.I0(out_carry),
        .I1(out_carry__0[17]),
        .I2(\out_reg_n_0_[17] ),
        .I3(out_carry__0[16]),
        .I4(\out_reg_n_0_[16] ),
        .O(S[0]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry__0_i_2
       (.I0(\out_reg_n_0_[28] ),
        .I1(out_carry__0[28]),
        .I2(out_carry),
        .I3(out_carry__0[29]),
        .I4(\out_reg_n_0_[29] ),
        .O(DI[6]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry__0_i_3
       (.I0(\out_reg_n_0_[26] ),
        .I1(out_carry__0[26]),
        .I2(out_carry),
        .I3(out_carry__0[27]),
        .I4(\out_reg_n_0_[27] ),
        .O(DI[5]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry__0_i_4
       (.I0(\out_reg_n_0_[24] ),
        .I1(out_carry__0[24]),
        .I2(out_carry),
        .I3(out_carry__0[25]),
        .I4(\out_reg_n_0_[25] ),
        .O(DI[4]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry__0_i_5
       (.I0(\out_reg_n_0_[22] ),
        .I1(out_carry__0[22]),
        .I2(out_carry),
        .I3(out_carry__0[23]),
        .I4(\out_reg_n_0_[23] ),
        .O(DI[3]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry__0_i_6
       (.I0(\out_reg_n_0_[20] ),
        .I1(out_carry__0[20]),
        .I2(out_carry),
        .I3(out_carry__0[21]),
        .I4(\out_reg_n_0_[21] ),
        .O(DI[2]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry__0_i_7
       (.I0(\out_reg_n_0_[18] ),
        .I1(out_carry__0[18]),
        .I2(out_carry),
        .I3(out_carry__0[19]),
        .I4(\out_reg_n_0_[19] ),
        .O(DI[1]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry__0_i_8
       (.I0(\out_reg_n_0_[16] ),
        .I1(out_carry__0[16]),
        .I2(out_carry),
        .I3(out_carry__0[17]),
        .I4(\out_reg_n_0_[17] ),
        .O(DI[0]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry__0_i_9
       (.I0(out_carry),
        .I1(out_carry__0[31]),
        .I2(\out_reg_n_0_[31] ),
        .I3(out_carry__0[30]),
        .I4(\out_reg_n_0_[30] ),
        .O(S[7]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry_i_1
       (.I0(\out_reg_n_0_[14] ),
        .I1(out_carry__0[14]),
        .I2(out_carry),
        .I3(out_carry__0[15]),
        .I4(\out_reg_n_0_[15] ),
        .O(\out_reg[14]_0 [7]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry_i_10
       (.I0(out_carry),
        .I1(out_carry__0[13]),
        .I2(\out_reg_n_0_[13] ),
        .I3(out_carry__0[12]),
        .I4(\out_reg_n_0_[12] ),
        .O(\out_reg[15]_0 [6]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry_i_11
       (.I0(out_carry),
        .I1(out_carry__0[11]),
        .I2(\out_reg_n_0_[11] ),
        .I3(out_carry__0[10]),
        .I4(\out_reg_n_0_[10] ),
        .O(\out_reg[15]_0 [5]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry_i_12
       (.I0(out_carry),
        .I1(out_carry__0[9]),
        .I2(\out_reg_n_0_[9] ),
        .I3(out_carry__0[8]),
        .I4(\out_reg_n_0_[8] ),
        .O(\out_reg[15]_0 [4]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry_i_13
       (.I0(out_carry),
        .I1(out_carry__0[7]),
        .I2(\out_reg_n_0_[7] ),
        .I3(out_carry__0[6]),
        .I4(\out_reg_n_0_[6] ),
        .O(\out_reg[15]_0 [3]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry_i_14
       (.I0(out_carry),
        .I1(out_carry__0[5]),
        .I2(\out_reg_n_0_[5] ),
        .I3(out_carry__0[4]),
        .I4(\out_reg_n_0_[4] ),
        .O(\out_reg[15]_0 [2]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry_i_15
       (.I0(out_carry),
        .I1(out_carry__0[3]),
        .I2(\out_reg_n_0_[3] ),
        .I3(out_carry__0[2]),
        .I4(\out_reg_n_0_[2] ),
        .O(\out_reg[15]_0 [1]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry_i_16
       (.I0(out_carry),
        .I1(out_carry__0[1]),
        .I2(\out_reg_n_0_[1] ),
        .I3(out_carry__0[0]),
        .I4(\out_reg_n_0_[0] ),
        .O(\out_reg[15]_0 [0]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry_i_2
       (.I0(\out_reg_n_0_[12] ),
        .I1(out_carry__0[12]),
        .I2(out_carry),
        .I3(out_carry__0[13]),
        .I4(\out_reg_n_0_[13] ),
        .O(\out_reg[14]_0 [6]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry_i_3
       (.I0(\out_reg_n_0_[10] ),
        .I1(out_carry__0[10]),
        .I2(out_carry),
        .I3(out_carry__0[11]),
        .I4(\out_reg_n_0_[11] ),
        .O(\out_reg[14]_0 [5]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry_i_4
       (.I0(\out_reg_n_0_[8] ),
        .I1(out_carry__0[8]),
        .I2(out_carry),
        .I3(out_carry__0[9]),
        .I4(\out_reg_n_0_[9] ),
        .O(\out_reg[14]_0 [4]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry_i_5
       (.I0(\out_reg_n_0_[6] ),
        .I1(out_carry__0[6]),
        .I2(out_carry),
        .I3(out_carry__0[7]),
        .I4(\out_reg_n_0_[7] ),
        .O(\out_reg[14]_0 [3]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry_i_6
       (.I0(\out_reg_n_0_[4] ),
        .I1(out_carry__0[4]),
        .I2(out_carry),
        .I3(out_carry__0[5]),
        .I4(\out_reg_n_0_[5] ),
        .O(\out_reg[14]_0 [2]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry_i_7
       (.I0(\out_reg_n_0_[2] ),
        .I1(out_carry__0[2]),
        .I2(out_carry),
        .I3(out_carry__0[3]),
        .I4(\out_reg_n_0_[3] ),
        .O(\out_reg[14]_0 [1]));
  LUT5 #(
    .INIT(32'h04000F04)) 
    out_carry_i_8
       (.I0(\out_reg_n_0_[0] ),
        .I1(out_carry__0[0]),
        .I2(out_carry),
        .I3(out_carry__0[1]),
        .I4(\out_reg_n_0_[1] ),
        .O(\out_reg[14]_0 [0]));
  LUT5 #(
    .INIT(32'hEBAAAAEB)) 
    out_carry_i_9
       (.I0(out_carry),
        .I1(out_carry__0[15]),
        .I2(\out_reg_n_0_[15] ),
        .I3(out_carry__0[14]),
        .I4(\out_reg_n_0_[14] ),
        .O(\out_reg[15]_0 [7]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [0]),
        .Q(\out_reg_n_0_[0] ),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [10]),
        .Q(\out_reg_n_0_[10] ),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [11]),
        .Q(\out_reg_n_0_[11] ),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [12]),
        .Q(\out_reg_n_0_[12] ),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [13]),
        .Q(\out_reg_n_0_[13] ),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [14]),
        .Q(\out_reg_n_0_[14] ),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [15]),
        .Q(\out_reg_n_0_[15] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_reg[15]_i_2 
       (.CI(\out_reg[7]_i_2_n_0 ),
        .CI_TOP(GND_2),
        .CO({\out_reg[15]_i_2_n_0 ,\NLW_out_reg[15]_i_2_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(incr_out[15:8]),
        .S(incr_right[15:8]));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [16]),
        .Q(\out_reg_n_0_[16] ),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [17]),
        .Q(\out_reg_n_0_[17] ),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [18]),
        .Q(\out_reg_n_0_[18] ),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [19]),
        .Q(\out_reg_n_0_[19] ),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [1]),
        .Q(\out_reg_n_0_[1] ),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [20]),
        .Q(\out_reg_n_0_[20] ),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [21]),
        .Q(\out_reg_n_0_[21] ),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [22]),
        .Q(\out_reg_n_0_[22] ),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [23]),
        .Q(\out_reg_n_0_[23] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_reg[23]_i_2 
       (.CI(\out_reg[15]_i_2_n_0 ),
        .CI_TOP(GND_2),
        .CO({\out_reg[23]_i_2_n_0 ,\NLW_out_reg[23]_i_2_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(incr_out[23:16]),
        .S(incr_right[23:16]));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [24]),
        .Q(\out_reg_n_0_[24] ),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [25]),
        .Q(\out_reg_n_0_[25] ),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [26]),
        .Q(\out_reg_n_0_[26] ),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [27]),
        .Q(\out_reg_n_0_[27] ),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [28]),
        .Q(\out_reg_n_0_[28] ),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [29]),
        .Q(\out_reg_n_0_[29] ),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [2]),
        .Q(\out_reg_n_0_[2] ),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [30]),
        .Q(\out_reg_n_0_[30] ),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [31]),
        .Q(\out_reg_n_0_[31] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_reg[31]_i_4 
       (.CI(\out_reg[23]_i_2_n_0 ),
        .CI_TOP(GND_2),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(incr_out[31:24]),
        .S(incr_right[31:24]));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [3]),
        .Q(\out_reg_n_0_[3] ),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [4]),
        .Q(\out_reg_n_0_[4] ),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [5]),
        .Q(\out_reg_n_0_[5] ),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [6]),
        .Q(\out_reg_n_0_[6] ),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [7]),
        .Q(\out_reg_n_0_[7] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_reg[7]_i_2 
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({\out_reg[7]_i_2_n_0 ,\NLW_out_reg[7]_i_2_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\out_reg[7]_0 }),
        .O(incr_out[7:0]),
        .S({incr_right[7:1],\out[7]_i_11_n_0 }));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [8]),
        .Q(\out_reg_n_0_[8] ),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [9]),
        .Q(\out_reg_n_0_[9] ),
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
    \out_reg[2] ,
    \out_reg[0]_0 ,
    CO);
  output comb_reg_done;
  output comb_reg_out;
  output [0:0]D;
  input reset;
  input cond0_go_in;
  input clk;
  input \out_reg[2] ;
  input \out_reg[0]_0 ;
  input [0:0]CO;

  wire \<const1> ;
  wire [0:0]CO;
  wire [0:0]D;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire \out[0]_i_1__2_n_0 ;
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
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[0]_i_1__2 
       (.I0(comb_reg_out),
        .I1(\out_reg[0]_0 ),
        .I2(CO),
        .O(\out[0]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \out[2]_i_2 
       (.I0(comb_reg_out),
        .I1(comb_reg_done),
        .I2(\out_reg[2] ),
        .O(D));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out[0]_i_1__2_n_0 ),
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
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00000100)) 
    out0_i_17
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(out0[0]),
        .I4(mul_done),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[10]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[9]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[11]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[10]),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[12]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[11]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[13]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[12]),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[14]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[13]),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[15]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[14]),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[16]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [0]),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[17]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [1]),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[18]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [2]),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[20]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [4]),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[21]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [5]),
        .O(D[20]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[22]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [6]),
        .O(D[21]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[23]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [7]),
        .O(D[22]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[24]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [8]),
        .O(D[23]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[25]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [9]),
        .O(D[24]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[26]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [10]),
        .O(D[25]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[27]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [11]),
        .O(D[26]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[28]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [12]),
        .O(D[27]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[29]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [13]),
        .O(D[28]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[2]_i_1__1 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[30]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [14]),
        .O(D[29]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[31]_i_2__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(\out_reg[31] [15]),
        .O(D[30]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[3]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[4]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[5]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[6]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[5]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[7]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[6]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[8]_i_1__0 
       (.I0(pd_out),
        .I1(t_done),
        .I2(\done_buf_reg[2] ),
        .I3(Q[7]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
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
    \out_reg[0]_0 ,
    \out_reg[0]_1 ,
    reset,
    \out_reg[0]_2 ,
    clk,
    \out_reg[0]_3 ,
    count_done,
    incr_out);
  output pd0_out;
  output [0:0]\out_reg[0]_0 ;
  output [31:0]\out_reg[0]_1 ;
  input reset;
  input \out_reg[0]_2 ;
  input clk;
  input \out_reg[0]_3 ;
  input count_done;
  input [31:0]incr_out;

  wire \<const1> ;
  wire clk;
  wire count_done;
  wire [31:0]incr_out;
  wire [0:0]\out_reg[0]_0 ;
  wire [31:0]\out_reg[0]_1 ;
  wire \out_reg[0]_2 ;
  wire \out_reg[0]_3 ;
  wire pd0_out;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[0]_i_1__5 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[0]),
        .O(\out_reg[0]_1 [0]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[10]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[10]),
        .O(\out_reg[0]_1 [10]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[11]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[11]),
        .O(\out_reg[0]_1 [11]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[12]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[12]),
        .O(\out_reg[0]_1 [12]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[13]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[13]),
        .O(\out_reg[0]_1 [13]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[14]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[14]),
        .O(\out_reg[0]_1 [14]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[15]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[15]),
        .O(\out_reg[0]_1 [15]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[16]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[16]),
        .O(\out_reg[0]_1 [16]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[17]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[17]),
        .O(\out_reg[0]_1 [17]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[18]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[18]),
        .O(\out_reg[0]_1 [18]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[19]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[19]),
        .O(\out_reg[0]_1 [19]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[1]_i_1__1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[1]),
        .O(\out_reg[0]_1 [1]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[20]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[20]),
        .O(\out_reg[0]_1 [20]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[21]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[21]),
        .O(\out_reg[0]_1 [21]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[22]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[22]),
        .O(\out_reg[0]_1 [22]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[23]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[23]),
        .O(\out_reg[0]_1 [23]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[24]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[24]),
        .O(\out_reg[0]_1 [24]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[25]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[25]),
        .O(\out_reg[0]_1 [25]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[26]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[26]),
        .O(\out_reg[0]_1 [26]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[27]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[27]),
        .O(\out_reg[0]_1 [27]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[28]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[28]),
        .O(\out_reg[0]_1 [28]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[29]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[29]),
        .O(\out_reg[0]_1 [29]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[2]_i_1__0 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[2]),
        .O(\out_reg[0]_1 [2]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[30]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[30]),
        .O(\out_reg[0]_1 [30]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[31]_i_2 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[31]),
        .O(\out_reg[0]_1 [31]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[3]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[3]),
        .O(\out_reg[0]_1 [3]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[4]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[4]),
        .O(\out_reg[0]_1 [4]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[5]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[5]),
        .O(\out_reg[0]_1 [5]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[6]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[6]),
        .O(\out_reg[0]_1 [6]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[7]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[7]),
        .O(\out_reg[0]_1 [7]));
  LUT3 #(
    .INIT(8'h01)) 
    \out[7]_i_3 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .O(\out_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[8]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[8]),
        .O(\out_reg[0]_1 [8]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \out[9]_i_1 
       (.I0(pd0_out),
        .I1(\out_reg[0]_3 ),
        .I2(count_done),
        .I3(incr_out[9]),
        .O(\out_reg[0]_1 [9]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_2 ),
        .Q(pd0_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1
   (D,
    Q,
    \out_reg[0]_0 ,
    \out_reg[2]_0 ,
    cond0_go_in,
    \out_reg[0]_1 ,
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
    \out_reg[2]_1 ,
    comb_reg_out,
    mul_done,
    reset,
    clk);
  output [0:0]D;
  output [0:0]Q;
  output \out_reg[0]_0 ;
  output \out_reg[2]_0 ;
  output cond0_go_in;
  output \out_reg[0]_1 ;
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
  input [0:0]\out_reg[2]_1 ;
  input comb_reg_out;
  input mul_done;
  input reset;
  input clk;

  wire [0:0]D;
  wire [0:0]E;
  wire [0:0]Q;
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
  wire \out_reg[2]_0 ;
  wire [0:0]\out_reg[2]_1 ;
  wire pd0_out;
  wire pd_out;
  wire reset;
  wire t_done;

  LUT6 #(
    .INIT(64'hFFFFFBFFFFFFFFFF)) 
    \done_buf[0]_i_2 
       (.I0(fsm_out[0]),
        .I1(done_reg_2[0]),
        .I2(done_reg_2[1]),
        .I3(go),
        .I4(fsm_out[2]),
        .I5(Q),
        .O(\out_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    done_i_1
       (.I0(comb_reg_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(done_reg_2[1]),
        .I4(done_reg_2[0]),
        .I5(fsm_out[0]),
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
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h04F4)) 
    \out[0]_i_1__3 
       (.I0(\out_reg[0]_0 ),
        .I1(t_done),
        .I2(pd_out),
        .I3(pd0_out),
        .O(done_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0F44)) 
    \out[0]_i_1__4 
       (.I0(\out_reg[0]_0 ),
        .I1(count_done),
        .I2(pd_out),
        .I3(pd0_out),
        .O(done_reg_1));
  LUT6 #(
    .INIT(64'h40FF404040404040)) 
    \out[1]_i_1__0 
       (.I0(\out_reg[0]_0 ),
        .I1(pd0_out),
        .I2(pd_out),
        .I3(\out_reg[2]_0 ),
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
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \out[1]_i_3 
       (.I0(done_reg_2[0]),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(Q),
        .I4(fsm_out[0]),
        .O(\out_reg[0]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \out[1]_i_4 
       (.I0(fsm_out[0]),
        .I1(Q),
        .O(\out[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF4040FF40)) 
    \out[2]_i_1 
       (.I0(\out_reg[0]_0 ),
        .I1(pd0_out),
        .I2(pd_out),
        .I3(comb_reg_done),
        .I4(\out_reg[2]_0 ),
        .I5(\out[2]_i_4_n_0 ),
        .O(fsm_write_en));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFBFFFFFF)) 
    \out[2]_i_3 
       (.I0(fsm_out[2]),
        .I1(go),
        .I2(done_reg_2[1]),
        .I3(done_reg_2[0]),
        .I4(fsm_out[0]),
        .O(\out_reg[2]_0 ));
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
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFFFBFF)) 
    \out[31]_i_3 
       (.I0(fsm_out[2]),
        .I1(go),
        .I2(done_reg_2[1]),
        .I3(done_reg_2[0]),
        .I4(fsm_out[0]),
        .O(\out[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF7FF)) 
    out_carry_i_17
       (.I0(fsm_out[0]),
        .I1(done_reg_2[0]),
        .I2(done_reg_2[1]),
        .I3(go),
        .I4(fsm_out[2]),
        .I5(comb_reg_done),
        .O(\out_reg[0]_1 ));
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
        .D(\out_reg[2]_1 ),
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

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    done_INST_0
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(done));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \out[2]_i_5 
       (.I0(go),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(go_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00400000)) 
    \out_write_data[30]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\out_write_data[31] [30]),
        .O(out_write_data[30]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    out_write_en_INST_0
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(go),
        .I3(out_done),
        .O(out_write_en));
endmodule
