// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:28:10 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//invoke.futil-vanilla-opt.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module exponent
   (D,
    \out_reg[1] ,
    \out_reg[31] ,
    clk,
    reset,
    \out_reg[2] ,
    \done_buf_reg[2] ,
    \out_reg[2]_0 ,
    \out_reg[2]_1 ,
    Q,
    done_reg,
    out0);
  output [0:0]D;
  output \out_reg[1] ;
  output [31:0]\out_reg[31] ;
  input clk;
  input reset;
  input \out_reg[2] ;
  input \done_buf_reg[2] ;
  input \out_reg[2]_0 ;
  input \out_reg[2]_1 ;
  input [0:0]Q;
  input done_reg;
  input [31:0]out0;

  wire [0:0]D;
  wire [0:0]Q;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire count_done;
  wire [0:0]count_in;
  wire count_n_1;
  wire count_n_3;
  wire count_write_en;
  wire \done_buf_reg[2] ;
  wire done_reg;
  wire [2:2]fsm_in;
  wire fsm_n_10;
  wire fsm_n_11;
  wire fsm_n_13;
  wire fsm_n_14;
  wire fsm_n_5;
  wire [2:0]fsm_out;
  wire incr_count_go_in__1;
  wire mul_done;
  wire mul_n_32;
  wire [31:0]out0;
  wire \out_reg[1] ;
  wire \out_reg[2] ;
  wire \out_reg[2]_0 ;
  wire \out_reg[2]_1 ;
  wire [31:0]\out_reg[31] ;
  wire pd0_out;
  wire pd_out;
  wire pow_done;
  wire [31:0]pow_in;
  wire pow_n_1;
  wire pow_n_10;
  wire pow_n_11;
  wire pow_n_12;
  wire pow_n_13;
  wire pow_n_14;
  wire pow_n_15;
  wire pow_n_2;
  wire pow_n_3;
  wire pow_n_4;
  wire pow_n_48;
  wire pow_n_49;
  wire pow_n_5;
  wire pow_n_50;
  wire pow_n_51;
  wire pow_n_52;
  wire pow_n_53;
  wire pow_n_54;
  wire pow_n_55;
  wire pow_n_56;
  wire pow_n_57;
  wire pow_n_58;
  wire pow_n_59;
  wire pow_n_6;
  wire pow_n_60;
  wire pow_n_61;
  wire pow_n_62;
  wire pow_n_63;
  wire pow_n_64;
  wire pow_n_7;
  wire pow_n_8;
  wire pow_n_9;
  wire pow_write_en;
  wire reset;

  std_reg__parameterized1_1 comb_reg
       (.D(fsm_in),
        .Q(Q),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond0_go_in(cond0_go_in),
        .\out_reg[0]_0 (count_n_3),
        .\out_reg[2] (done_reg),
        .\out_reg[2]_0 ({fsm_out[2],fsm_out[0]}),
        .reset(reset));
  std_reg__parameterized0_2 count
       (.D(count_in),
        .E(count_write_en),
        .Q(count_n_1),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .count_done(count_done),
        .done_reg_0(pow_in[0]),
        .incr_count_go_in__1(incr_count_go_in__1),
        .\out_reg[0]_0 (fsm_out[1]),
        .\out_reg[0]_1 (mul_n_32),
        .\out_reg[0]_2 (fsm_n_5),
        .\out_reg[3]_0 (count_n_3),
        .pd_out(pd_out),
        .pow_done(pow_done),
        .reset(reset));
  std_reg__parameterized2 fsm
       (.D(D),
        .E(count_write_en),
        .Q(fsm_out),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond0_go_in(cond0_go_in),
        .count_done(count_done),
        .\done_buf_reg[2] (fsm_n_10),
        .\done_buf_reg[2]_0 (\done_buf_reg[2] ),
        .done_reg(pow_write_en),
        .done_reg_0(fsm_n_13),
        .done_reg_1(fsm_n_14),
        .done_reg_2(Q),
        .done_reg_3(done_reg),
        .incr_count_go_in__1(incr_count_go_in__1),
        .mul_done(mul_done),
        .\out_reg[0]_0 (fsm_n_5),
        .\out_reg[0]_1 (count_in),
        .\out_reg[0]_2 (fsm_n_11),
        .\out_reg[0]_3 (count_n_1),
        .\out_reg[1]_0 (\out_reg[1] ),
        .\out_reg[2]_0 (\out_reg[2] ),
        .\out_reg[2]_1 (\out_reg[2]_0 ),
        .\out_reg[2]_2 (\out_reg[2]_1 ),
        .\out_reg[2]_3 (fsm_in),
        .pd0_out(pd0_out),
        .pd_out(pd_out),
        .pow_done(pow_done),
        .reset(reset));
  std_mult_pipe mul
       (.B({pow_n_48,pow_n_49,pow_n_50,pow_n_51,pow_n_52,pow_n_53,pow_n_54,pow_n_55,pow_n_56,pow_n_57,pow_n_58,pow_n_59,pow_n_60,pow_n_61,pow_n_62,pow_n_63,pow_n_64}),
        .D(pow_in[31:1]),
        .Q(mul_n_32),
        .clk(clk),
        .\done_buf_reg[2] (fsm_n_10),
        .mul_done(mul_done),
        .out0(out0),
        .out0__0(fsm_n_11),
        .out_tmp_reg({pow_n_1,pow_n_2,pow_n_3,pow_n_4,pow_n_5,pow_n_6,pow_n_7,pow_n_8,pow_n_9,pow_n_10,pow_n_11,pow_n_12,pow_n_13,pow_n_14,pow_n_15}),
        .reset(reset));
  std_reg__parameterized1_3 pd
       (.clk(clk),
        .\out_reg[0]_0 (fsm_n_13),
        .pd_out(pd_out),
        .reset(reset));
  std_reg__parameterized1_4 pd0
       (.clk(clk),
        .\out_reg[0]_0 (fsm_n_14),
        .pd0_out(pd0_out),
        .reset(reset));
  std_reg_5 pow
       (.B({pow_n_48,pow_n_49,pow_n_50,pow_n_51,pow_n_52,pow_n_53,pow_n_54,pow_n_55,pow_n_56,pow_n_57,pow_n_58,pow_n_59,pow_n_60,pow_n_61,pow_n_62,pow_n_63,pow_n_64}),
        .D(pow_in),
        .E(pow_write_en),
        .clk(clk),
        .mul_done(mul_done),
        .\out_reg[31]_0 ({pow_n_1,pow_n_2,pow_n_3,pow_n_4,pow_n_5,pow_n_6,pow_n_7,pow_n_8,pow_n_9,pow_n_10,pow_n_11,pow_n_12,pow_n_13,pow_n_14,pow_n_15}),
        .\out_reg[31]_1 (\out_reg[31] ),
        .out_tmp_reg(fsm_n_11),
        .pow_done(pow_done),
        .reset(reset));
endmodule

(* NETLIST_CHECKSUM = "888be32b" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    a0_addr0,
    a0_write_data,
    a0_write_en,
    a0_clk,
    a0_read_data,
    a0_done);
  input go;
  input clk;
  input reset;
  output done;
  output [3:0]a0_addr0;
  output [31:0]a0_write_data;
  output a0_write_en;
  output a0_clk;
  input [31:0]a0_read_data;
  input a0_done;

  wire [3:0]a0_addr0;
  wire a0_done;
  wire [31:0]a0_read_data;
  wire [31:0]a0_write_data;
  wire a0_write_en;
  wire a_read0_0_done;
  wire [31:0]a_read0_0_in;
  wire a_read0_0_n_1;
  wire a_read0_0_n_10;
  wire a_read0_0_n_11;
  wire a_read0_0_n_12;
  wire a_read0_0_n_13;
  wire a_read0_0_n_14;
  wire a_read0_0_n_15;
  wire a_read0_0_n_16;
  wire a_read0_0_n_17;
  wire a_read0_0_n_18;
  wire a_read0_0_n_19;
  wire a_read0_0_n_2;
  wire a_read0_0_n_20;
  wire a_read0_0_n_21;
  wire a_read0_0_n_22;
  wire a_read0_0_n_23;
  wire a_read0_0_n_24;
  wire a_read0_0_n_25;
  wire a_read0_0_n_26;
  wire a_read0_0_n_27;
  wire a_read0_0_n_28;
  wire a_read0_0_n_29;
  wire a_read0_0_n_3;
  wire a_read0_0_n_30;
  wire a_read0_0_n_31;
  wire a_read0_0_n_32;
  wire a_read0_0_n_33;
  wire a_read0_0_n_4;
  wire a_read0_0_n_5;
  wire a_read0_0_n_6;
  wire a_read0_0_n_7;
  wire a_read0_0_n_8;
  wire a_read0_0_n_9;
  wire a_read0_0_write_en;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond00_go_in;
  wire done;
  wire exp0_n_1;
  wire exp0_n_10;
  wire exp0_n_11;
  wire exp0_n_12;
  wire exp0_n_13;
  wire exp0_n_14;
  wire exp0_n_15;
  wire exp0_n_16;
  wire exp0_n_17;
  wire exp0_n_18;
  wire exp0_n_19;
  wire exp0_n_2;
  wire exp0_n_20;
  wire exp0_n_21;
  wire exp0_n_22;
  wire exp0_n_23;
  wire exp0_n_24;
  wire exp0_n_25;
  wire exp0_n_26;
  wire exp0_n_27;
  wire exp0_n_28;
  wire exp0_n_29;
  wire exp0_n_3;
  wire exp0_n_30;
  wire exp0_n_31;
  wire exp0_n_32;
  wire exp0_n_33;
  wire exp0_n_4;
  wire exp0_n_5;
  wire exp0_n_6;
  wire exp0_n_7;
  wire exp0_n_8;
  wire exp0_n_9;
  wire [3:2]fsm_in;
  wire fsm_n_1;
  wire fsm_n_37;
  wire fsm_n_75;
  wire fsm_n_78;
  wire fsm_n_79;
  wire [0:0]fsm_out;
  wire go;
  wire i0_done;
  wire [0:0]i0_in;
  wire i0_n_5;
  wire [3:0]i0_out;
  wire i0_write_en;
  wire reset;
  wire upd2_go_in;

  assign a0_clk = clk;
  std_reg a_read0_0
       (.D(a_read0_0_in),
        .E(a_read0_0_write_en),
        .Q(fsm_out),
        .a_read0_0_done(a_read0_0_done),
        .clk(clk),
        .done_reg_0(a_read0_0_n_1),
        .\out_reg[31]_0 ({a_read0_0_n_2,a_read0_0_n_3,a_read0_0_n_4,a_read0_0_n_5,a_read0_0_n_6,a_read0_0_n_7,a_read0_0_n_8,a_read0_0_n_9,a_read0_0_n_10,a_read0_0_n_11,a_read0_0_n_12,a_read0_0_n_13,a_read0_0_n_14,a_read0_0_n_15,a_read0_0_n_16,a_read0_0_n_17,a_read0_0_n_18,a_read0_0_n_19,a_read0_0_n_20,a_read0_0_n_21,a_read0_0_n_22,a_read0_0_n_23,a_read0_0_n_24,a_read0_0_n_25,a_read0_0_n_26,a_read0_0_n_27,a_read0_0_n_28,a_read0_0_n_29,a_read0_0_n_30,a_read0_0_n_31,a_read0_0_n_32,a_read0_0_n_33}),
        .reset(reset));
  std_reg__parameterized1 comb_reg
       (.D(fsm_in[3]),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond00_go_in(cond00_go_in),
        .\out_reg[0]_0 (i0_n_5),
        .\out_reg[3] (fsm_n_1),
        .reset(reset));
  exponent exp0
       (.D(fsm_in[2]),
        .Q(fsm_out),
        .clk(clk),
        .\done_buf_reg[2] (fsm_n_78),
        .done_reg(fsm_n_79),
        .out0({a_read0_0_n_2,a_read0_0_n_3,a_read0_0_n_4,a_read0_0_n_5,a_read0_0_n_6,a_read0_0_n_7,a_read0_0_n_8,a_read0_0_n_9,a_read0_0_n_10,a_read0_0_n_11,a_read0_0_n_12,a_read0_0_n_13,a_read0_0_n_14,a_read0_0_n_15,a_read0_0_n_16,a_read0_0_n_17,a_read0_0_n_18,a_read0_0_n_19,a_read0_0_n_20,a_read0_0_n_21,a_read0_0_n_22,a_read0_0_n_23,a_read0_0_n_24,a_read0_0_n_25,a_read0_0_n_26,a_read0_0_n_27,a_read0_0_n_28,a_read0_0_n_29,a_read0_0_n_30,a_read0_0_n_31,a_read0_0_n_32,a_read0_0_n_33}),
        .\out_reg[1] (exp0_n_1),
        .\out_reg[2] (fsm_n_37),
        .\out_reg[2]_0 (fsm_n_75),
        .\out_reg[2]_1 (a_read0_0_n_1),
        .\out_reg[31] ({exp0_n_2,exp0_n_3,exp0_n_4,exp0_n_5,exp0_n_6,exp0_n_7,exp0_n_8,exp0_n_9,exp0_n_10,exp0_n_11,exp0_n_12,exp0_n_13,exp0_n_14,exp0_n_15,exp0_n_16,exp0_n_17,exp0_n_18,exp0_n_19,exp0_n_20,exp0_n_21,exp0_n_22,exp0_n_23,exp0_n_24,exp0_n_25,exp0_n_26,exp0_n_27,exp0_n_28,exp0_n_29,exp0_n_30,exp0_n_31,exp0_n_32,exp0_n_33}),
        .reset(reset));
  std_reg__parameterized0 fsm
       (.D(fsm_in),
        .E(i0_write_en),
        .Q(fsm_out),
        .a0_addr0(a0_addr0),
        .\a0_addr0[3] (i0_out),
        .a0_done(a0_done),
        .a0_done_0(fsm_n_37),
        .a0_read_data(a0_read_data),
        .a0_write_data(a0_write_data),
        .\a0_write_data[31] ({a_read0_0_n_2,a_read0_0_n_3,a_read0_0_n_4,a_read0_0_n_5,a_read0_0_n_6,a_read0_0_n_7,a_read0_0_n_8,a_read0_0_n_9,a_read0_0_n_10,a_read0_0_n_11,a_read0_0_n_12,a_read0_0_n_13,a_read0_0_n_14,a_read0_0_n_15,a_read0_0_n_16,a_read0_0_n_17,a_read0_0_n_18,a_read0_0_n_19,a_read0_0_n_20,a_read0_0_n_21,a_read0_0_n_22,a_read0_0_n_23,a_read0_0_n_24,a_read0_0_n_25,a_read0_0_n_26,a_read0_0_n_27,a_read0_0_n_28,a_read0_0_n_29,a_read0_0_n_30,a_read0_0_n_31,a_read0_0_n_32,a_read0_0_n_33}),
        .a_read0_0_done(a_read0_0_done),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond00_go_in(cond00_go_in),
        .done(done),
        .go(go),
        .i0_done(i0_done),
        .\out_reg[0]_0 (a0_write_en),
        .\out_reg[0]_1 (i0_in),
        .\out_reg[0]_2 (exp0_n_1),
        .\out_reg[1]_0 (fsm_n_1),
        .\out_reg[1]_1 (a_read0_0_write_en),
        .\out_reg[1]_2 (fsm_n_75),
        .\out_reg[1]_3 (fsm_n_79),
        .\out_reg[2]_0 (fsm_n_78),
        .\out_reg[31] (a_read0_0_in),
        .\out_reg[31]_0 ({exp0_n_2,exp0_n_3,exp0_n_4,exp0_n_5,exp0_n_6,exp0_n_7,exp0_n_8,exp0_n_9,exp0_n_10,exp0_n_11,exp0_n_12,exp0_n_13,exp0_n_14,exp0_n_15,exp0_n_16,exp0_n_17,exp0_n_18,exp0_n_19,exp0_n_20,exp0_n_21,exp0_n_22,exp0_n_23,exp0_n_24,exp0_n_25,exp0_n_26,exp0_n_27,exp0_n_28,exp0_n_29,exp0_n_30,exp0_n_31,exp0_n_32,exp0_n_33}),
        .reset(reset),
        .upd2_go_in(upd2_go_in));
  std_reg__parameterized0_0 i0
       (.D(i0_in),
        .E(i0_write_en),
        .Q(i0_out),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .i0_done(i0_done),
        .\out_reg[0]_0 (fsm_n_1),
        .\out_reg[2]_0 (i0_n_5),
        .reset(reset),
        .upd2_go_in(upd2_go_in));
endmodule

module std_fp_mult_pipe
   (\done_buf_reg[2]_0 ,
    D,
    Q,
    clk,
    \done_buf_reg[2]_1 ,
    reset,
    B,
    out_tmp_reg_0,
    out0__0_0,
    out0_0);
  output \done_buf_reg[2]_0 ;
  output [30:0]D;
  output [0:0]Q;
  input clk;
  input \done_buf_reg[2]_1 ;
  input reset;
  input [16:0]B;
  input [14:0]out_tmp_reg_0;
  input out0__0_0;
  input [31:0]out0_0;

  wire \<const0> ;
  wire \<const1> ;
  wire [16:0]B;
  wire [30:0]D;
  wire GND_2;
  wire [0:0]Q;
  wire VCC_2;
  wire clk;
  wire \done_buf_reg[2]_0 ;
  wire \done_buf_reg[2]_1 ;
  wire \done_buf_reg_n_0_[0] ;
  wire \done_buf_reg_n_0_[1] ;
  wire mul_go;
  wire [31:0]out0_0;
  wire out0__0_0;
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
  wire \out_tmp_reg[10]__0_n_0 ;
  wire \out_tmp_reg[11]__0_n_0 ;
  wire \out_tmp_reg[12]__0_n_0 ;
  wire \out_tmp_reg[13]__0_n_0 ;
  wire \out_tmp_reg[14]__0_n_0 ;
  wire \out_tmp_reg[15]__0_n_0 ;
  wire \out_tmp_reg[16]__0_n_0 ;
  wire \out_tmp_reg[1]__0_n_0 ;
  wire \out_tmp_reg[2]__0_n_0 ;
  wire \out_tmp_reg[3]__0_n_0 ;
  wire \out_tmp_reg[4]__0_n_0 ;
  wire \out_tmp_reg[5]__0_n_0 ;
  wire \out_tmp_reg[6]__0_n_0 ;
  wire \out_tmp_reg[7]__0_n_0 ;
  wire \out_tmp_reg[8]__0_n_0 ;
  wire \out_tmp_reg[9]__0_n_0 ;
  wire [14:0]out_tmp_reg_0;
  wire [31:16]out_tmp_reg__0;
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
  wire reset;
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
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \done_buf[0]_i_1 
       (.I0(\done_buf_reg_n_0_[0] ),
        .I1(\done_buf_reg_n_0_[1] ),
        .I2(\done_buf_reg[2]_0 ),
        .I3(out0__0_0),
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
        .R(\done_buf_reg[2]_1 ));
  FDRE \done_buf_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\done_buf_reg_n_0_[1] ),
        .Q(\done_buf_reg[2]_0 ),
        .R(\done_buf_reg[2]_1 ));
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
        .CEP(mul_go),
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
        .O(out_tmp_reg__0[23:16]),
        .S({out0_carry_i_1__0_n_0,out0_carry_i_2_n_0,out0_carry_i_3_n_0,out0_carry_i_4_n_0,out0_carry_i_5_n_0,out0_carry_i_6_n_0,out0_carry_i_7_n_0,\out_tmp_reg[16]__0_n_0 }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out0_carry__0
       (.CI(out0_carry_n_0),
        .CI_TOP(GND_2),
        .DI({\<const0> ,out_tmp_reg_n_92,out_tmp_reg_n_93,out_tmp_reg_n_94,out_tmp_reg_n_95,out_tmp_reg_n_96,out_tmp_reg_n_97,out_tmp_reg_n_98}),
        .O(out_tmp_reg__0[31:24]),
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
  LUT2 #(
    .INIT(4'h1)) 
    out0_i_1
       (.I0(\done_buf_reg[2]_0 ),
        .I1(out0__0_0),
        .O(mul_go));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_10
       (.I0(out0_0[23]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_10__0
       (.I0(out0_0[7]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_11
       (.I0(out0_0[22]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_11__0
       (.I0(out0_0[6]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_12
       (.I0(out0_0[21]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_12__0
       (.I0(out0_0[5]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_13
       (.I0(out0_0[20]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_13__0
       (.I0(out0_0[4]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_14
       (.I0(out0_0[19]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_14__0
       (.I0(out0_0[3]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_15
       (.I0(out0_0[18]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_15__0
       (.I0(out0_0[2]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_16
       (.I0(out0_0[17]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_16__0
       (.I0(out0_0[1]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_17__0
       (.I0(out0_0[0]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_1__0
       (.I0(out0_0[16]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_2
       (.I0(out0_0[31]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_2__0
       (.I0(out0_0[15]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_3
       (.I0(out0_0[30]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[30]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_3__0
       (.I0(out0_0[14]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_4
       (.I0(out0_0[29]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_4__0
       (.I0(out0_0[13]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_5
       (.I0(out0_0[28]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_5__0
       (.I0(out0_0[12]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_6
       (.I0(out0_0[27]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_6__0
       (.I0(out0_0[11]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_7
       (.I0(out0_0[26]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_7__0
       (.I0(out0_0[10]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_8
       (.I0(out0_0[25]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_8__0
       (.I0(out0_0[9]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[9]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_9
       (.I0(out0_0[24]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_9__0
       (.I0(out0_0[8]),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out0__0_0),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[10]_i_1__0 
       (.I0(\out_tmp_reg[10]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[11]_i_1__0 
       (.I0(\out_tmp_reg[11]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[12]_i_1__0 
       (.I0(\out_tmp_reg[12]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[13]_i_1__0 
       (.I0(\out_tmp_reg[13]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[14]_i_1__0 
       (.I0(\out_tmp_reg[14]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[15]_i_1__0 
       (.I0(\out_tmp_reg[15]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[16]_i_1__0 
       (.I0(out_tmp_reg__0[16]),
        .I1(out0__0_0),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[17]_i_1__0 
       (.I0(out_tmp_reg__0[17]),
        .I1(out0__0_0),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[18]_i_1__0 
       (.I0(out_tmp_reg__0[18]),
        .I1(out0__0_0),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[19]_i_1__0 
       (.I0(out_tmp_reg__0[19]),
        .I1(out0__0_0),
        .O(D[18]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[1]_i_1__4 
       (.I0(\out_tmp_reg[1]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[20]_i_1__0 
       (.I0(out_tmp_reg__0[20]),
        .I1(out0__0_0),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[21]_i_1__0 
       (.I0(out_tmp_reg__0[21]),
        .I1(out0__0_0),
        .O(D[20]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[22]_i_1__0 
       (.I0(out_tmp_reg__0[22]),
        .I1(out0__0_0),
        .O(D[21]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_1__0 
       (.I0(out_tmp_reg__0[23]),
        .I1(out0__0_0),
        .O(D[22]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[24]_i_1__0 
       (.I0(out_tmp_reg__0[24]),
        .I1(out0__0_0),
        .O(D[23]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[25]_i_1__0 
       (.I0(out_tmp_reg__0[25]),
        .I1(out0__0_0),
        .O(D[24]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[26]_i_1__0 
       (.I0(out_tmp_reg__0[26]),
        .I1(out0__0_0),
        .O(D[25]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[27]_i_1__0 
       (.I0(out_tmp_reg__0[27]),
        .I1(out0__0_0),
        .O(D[26]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[28]_i_1__0 
       (.I0(out_tmp_reg__0[28]),
        .I1(out0__0_0),
        .O(D[27]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[29]_i_1__0 
       (.I0(out_tmp_reg__0[29]),
        .I1(out0__0_0),
        .O(D[28]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[2]_i_1__4 
       (.I0(\out_tmp_reg[2]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[30]_i_1__0 
       (.I0(out_tmp_reg__0[30]),
        .I1(out0__0_0),
        .O(D[29]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_2__0 
       (.I0(out_tmp_reg__0[31]),
        .I1(out0__0_0),
        .O(D[30]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[3]_i_1__3 
       (.I0(\out_tmp_reg[3]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[4]_i_1__0 
       (.I0(\out_tmp_reg[4]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[5]_i_1__0 
       (.I0(\out_tmp_reg[5]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[6]_i_1__0 
       (.I0(\out_tmp_reg[6]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[7]_i_1__0 
       (.I0(\out_tmp_reg[7]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[8]_i_1__0 
       (.I0(\out_tmp_reg[8]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[9]_i_1__0 
       (.I0(\out_tmp_reg[9]__0_n_0 ),
        .I1(out0__0_0),
        .O(D[8]));
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
        .B({\<const0> ,\<const0> ,\<const0> ,out_tmp_reg_0}),
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
        .CEP(mul_go),
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
        .CE(mul_go),
        .D(out0__0_n_105),
        .Q(Q),
        .R(reset));
  FDRE \out_tmp_reg[10]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_95),
        .Q(\out_tmp_reg[10]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[11]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_94),
        .Q(\out_tmp_reg[11]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[12]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_93),
        .Q(\out_tmp_reg[12]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[13]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_92),
        .Q(\out_tmp_reg[13]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[14]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_91),
        .Q(\out_tmp_reg[14]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[15]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_90),
        .Q(\out_tmp_reg[15]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[16]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_89),
        .Q(\out_tmp_reg[16]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[1]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_104),
        .Q(\out_tmp_reg[1]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[2]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_103),
        .Q(\out_tmp_reg[2]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[3]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_102),
        .Q(\out_tmp_reg[3]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[4]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_101),
        .Q(\out_tmp_reg[4]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[5]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_100),
        .Q(\out_tmp_reg[5]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[6]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_99),
        .Q(\out_tmp_reg[6]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[7]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_98),
        .Q(\out_tmp_reg[7]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[8]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_97),
        .Q(\out_tmp_reg[8]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[9]__0 
       (.C(clk),
        .CE(mul_go),
        .D(out0__0_n_96),
        .Q(\out_tmp_reg[9]__0_n_0 ),
        .R(reset));
endmodule

module std_mult_pipe
   (mul_done,
    D,
    Q,
    clk,
    \done_buf_reg[2] ,
    reset,
    B,
    out_tmp_reg,
    out0__0,
    out0);
  output mul_done;
  output [30:0]D;
  output [0:0]Q;
  input clk;
  input \done_buf_reg[2] ;
  input reset;
  input [16:0]B;
  input [14:0]out_tmp_reg;
  input out0__0;
  input [31:0]out0;

  wire [16:0]B;
  wire [30:0]D;
  wire [0:0]Q;
  wire clk;
  wire \done_buf_reg[2] ;
  wire mul_done;
  wire [31:0]out0;
  wire out0__0;
  wire [14:0]out_tmp_reg;
  wire reset;

  std_fp_mult_pipe comp
       (.B(B),
        .D(D),
        .Q(Q),
        .clk(clk),
        .\done_buf_reg[2]_0 (mul_done),
        .\done_buf_reg[2]_1 (\done_buf_reg[2] ),
        .out0_0(out0),
        .out0__0_0(out0__0),
        .out_tmp_reg_0(out_tmp_reg),
        .reset(reset));
endmodule

module std_reg
   (a_read0_0_done,
    done_reg_0,
    \out_reg[31]_0 ,
    reset,
    E,
    clk,
    Q,
    D);
  output a_read0_0_done;
  output done_reg_0;
  output [31:0]\out_reg[31]_0 ;
  input reset;
  input [0:0]E;
  input clk;
  input [0:0]Q;
  input [31:0]D;

  wire \<const1> ;
  wire [31:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire a_read0_0_done;
  wire clk;
  wire done_reg_0;
  wire [31:0]\out_reg[31]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(a_read0_0_done),
        .R(reset));
  LUT2 #(
    .INIT(4'h2)) 
    \out[3]_i_10 
       (.I0(a_read0_0_done),
        .I1(Q),
        .O(done_reg_0));
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
module std_reg_5
   (pow_done,
    \out_reg[31]_0 ,
    \out_reg[31]_1 ,
    B,
    reset,
    E,
    clk,
    mul_done,
    out_tmp_reg,
    D);
  output pow_done;
  output [14:0]\out_reg[31]_0 ;
  output [31:0]\out_reg[31]_1 ;
  output [16:0]B;
  input reset;
  input [0:0]E;
  input clk;
  input mul_done;
  input out_tmp_reg;
  input [31:0]D;

  wire \<const1> ;
  wire [16:0]B;
  wire [31:0]D;
  wire [0:0]E;
  wire clk;
  wire mul_done;
  wire [14:0]\out_reg[31]_0 ;
  wire [31:0]\out_reg[31]_1 ;
  wire out_tmp_reg;
  wire pow_done;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(pow_done),
        .R(reset));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_17
       (.I0(\out_reg[31]_1 [16]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[16]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_18
       (.I0(\out_reg[31]_1 [15]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[15]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_19
       (.I0(\out_reg[31]_1 [14]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[14]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_20
       (.I0(\out_reg[31]_1 [13]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[13]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_21
       (.I0(\out_reg[31]_1 [12]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[12]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_22
       (.I0(\out_reg[31]_1 [11]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[11]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_23
       (.I0(\out_reg[31]_1 [10]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[10]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_24
       (.I0(\out_reg[31]_1 [9]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[9]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_25
       (.I0(\out_reg[31]_1 [8]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[8]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_26
       (.I0(\out_reg[31]_1 [7]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[7]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_27
       (.I0(\out_reg[31]_1 [6]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[6]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_28
       (.I0(\out_reg[31]_1 [5]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[5]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_29
       (.I0(\out_reg[31]_1 [4]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[4]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_30
       (.I0(\out_reg[31]_1 [3]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[3]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_31
       (.I0(\out_reg[31]_1 [2]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[2]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_32
       (.I0(\out_reg[31]_1 [1]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[1]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out0_i_33
       (.I0(\out_reg[31]_1 [0]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(B[0]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .Q(\out_reg[31]_1 [0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(D[10]),
        .Q(\out_reg[31]_1 [10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(D[11]),
        .Q(\out_reg[31]_1 [11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(D[12]),
        .Q(\out_reg[31]_1 [12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(D[13]),
        .Q(\out_reg[31]_1 [13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(D[14]),
        .Q(\out_reg[31]_1 [14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(D[15]),
        .Q(\out_reg[31]_1 [15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(D[16]),
        .Q(\out_reg[31]_1 [16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(D[17]),
        .Q(\out_reg[31]_1 [17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(D[18]),
        .Q(\out_reg[31]_1 [18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(D[19]),
        .Q(\out_reg[31]_1 [19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .Q(\out_reg[31]_1 [1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(D[20]),
        .Q(\out_reg[31]_1 [20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(D[21]),
        .Q(\out_reg[31]_1 [21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(D[22]),
        .Q(\out_reg[31]_1 [22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(D[23]),
        .Q(\out_reg[31]_1 [23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(D[24]),
        .Q(\out_reg[31]_1 [24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(D[25]),
        .Q(\out_reg[31]_1 [25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(D[26]),
        .Q(\out_reg[31]_1 [26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(D[27]),
        .Q(\out_reg[31]_1 [27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(D[28]),
        .Q(\out_reg[31]_1 [28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(D[29]),
        .Q(\out_reg[31]_1 [29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .Q(\out_reg[31]_1 [2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(D[30]),
        .Q(\out_reg[31]_1 [30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(D[31]),
        .Q(\out_reg[31]_1 [31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(D[3]),
        .Q(\out_reg[31]_1 [3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(D[4]),
        .Q(\out_reg[31]_1 [4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(D[5]),
        .Q(\out_reg[31]_1 [5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(D[6]),
        .Q(\out_reg[31]_1 [6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(D[7]),
        .Q(\out_reg[31]_1 [7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(D[8]),
        .Q(\out_reg[31]_1 [8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(D[9]),
        .Q(\out_reg[31]_1 [9]),
        .R(reset));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_1
       (.I0(\out_reg[31]_1 [31]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [14]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_10
       (.I0(\out_reg[31]_1 [22]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [5]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_11
       (.I0(\out_reg[31]_1 [21]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [4]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_12
       (.I0(\out_reg[31]_1 [20]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [3]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_13
       (.I0(\out_reg[31]_1 [19]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_14
       (.I0(\out_reg[31]_1 [18]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_15
       (.I0(\out_reg[31]_1 [17]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_2
       (.I0(\out_reg[31]_1 [30]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [13]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_3
       (.I0(\out_reg[31]_1 [29]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [12]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_4
       (.I0(\out_reg[31]_1 [28]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [11]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_5
       (.I0(\out_reg[31]_1 [27]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [10]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_6
       (.I0(\out_reg[31]_1 [26]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [9]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_7
       (.I0(\out_reg[31]_1 [25]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [8]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_8
       (.I0(\out_reg[31]_1 [24]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [7]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h02)) 
    out_tmp_reg_i_9
       (.I0(\out_reg[31]_1 [23]),
        .I1(mul_done),
        .I2(out_tmp_reg),
        .O(\out_reg[31]_0 [6]));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (Q,
    \out_reg[1]_0 ,
    cond00_go_in,
    E,
    \out_reg[31] ,
    \out_reg[1]_1 ,
    a0_done_0,
    a0_addr0,
    \out_reg[0]_0 ,
    a0_write_data,
    \out_reg[1]_2 ,
    \out_reg[0]_1 ,
    upd2_go_in,
    \out_reg[2]_0 ,
    \out_reg[1]_3 ,
    done,
    D,
    a_read0_0_done,
    i0_done,
    \out_reg[0]_2 ,
    comb_reg_done,
    comb_reg_out,
    go,
    \out_reg[31]_0 ,
    a0_read_data,
    a0_done,
    \a0_addr0[3] ,
    \a0_write_data[31] ,
    reset,
    clk);
  output [0:0]Q;
  output \out_reg[1]_0 ;
  output cond00_go_in;
  output [0:0]E;
  output [31:0]\out_reg[31] ;
  output [0:0]\out_reg[1]_1 ;
  output a0_done_0;
  output [3:0]a0_addr0;
  output \out_reg[0]_0 ;
  output [31:0]a0_write_data;
  output \out_reg[1]_2 ;
  output [0:0]\out_reg[0]_1 ;
  output upd2_go_in;
  output \out_reg[2]_0 ;
  output \out_reg[1]_3 ;
  output done;
  input [1:0]D;
  input a_read0_0_done;
  input i0_done;
  input \out_reg[0]_2 ;
  input comb_reg_done;
  input comb_reg_out;
  input go;
  input [31:0]\out_reg[31]_0 ;
  input [31:0]a0_read_data;
  input a0_done;
  input [3:0]\a0_addr0[3] ;
  input [31:0]\a0_write_data[31] ;
  input reset;
  input clk;

  wire [1:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire [3:0]a0_addr0;
  wire [3:0]\a0_addr0[3] ;
  wire \a0_addr0[3]_INST_0_i_1_n_0 ;
  wire a0_done;
  wire a0_done_0;
  wire [31:0]a0_read_data;
  wire [31:0]a0_write_data;
  wire [31:0]\a0_write_data[31] ;
  wire a_read0_0_done;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond00_go_in;
  wire done;
  wire [1:0]fsm_in;
  wire [3:1]fsm_out;
  wire fsm_write_en;
  wire go;
  wire i0_done;
  wire \out[0]_i_2_n_0 ;
  wire \out[31]_i_3_n_0 ;
  wire \out[3]_i_3_n_0 ;
  wire \out[3]_i_5_n_0 ;
  wire \out[3]_i_7_n_0 ;
  wire \out[3]_i_8_n_0 ;
  wire \out_reg[0]_0 ;
  wire [0:0]\out_reg[0]_1 ;
  wire \out_reg[0]_2 ;
  wire \out_reg[1]_0 ;
  wire [0:0]\out_reg[1]_1 ;
  wire \out_reg[1]_2 ;
  wire \out_reg[1]_3 ;
  wire \out_reg[2]_0 ;
  wire [31:0]\out_reg[31] ;
  wire [31:0]\out_reg[31]_0 ;
  wire reset;
  wire upd2_go_in;

  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \a0_addr0[0]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .I2(\a0_addr0[3] [0]),
        .O(a0_addr0[0]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \a0_addr0[1]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .I2(\a0_addr0[3] [1]),
        .O(a0_addr0[1]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \a0_addr0[2]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .I2(\a0_addr0[3] [2]),
        .O(a0_addr0[2]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \a0_addr0[3]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .I2(\a0_addr0[3] [3]),
        .O(a0_addr0[3]));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    \a0_addr0[3]_INST_0_i_1 
       (.I0(a_read0_0_done),
        .I1(Q),
        .I2(fsm_out[2]),
        .I3(go),
        .I4(fsm_out[3]),
        .I5(fsm_out[1]),
        .O(\a0_addr0[3]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[0]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [0]),
        .O(a0_write_data[0]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[10]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [10]),
        .O(a0_write_data[10]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[11]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [11]),
        .O(a0_write_data[11]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[12]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [12]),
        .O(a0_write_data[12]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[13]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [13]),
        .O(a0_write_data[13]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[14]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [14]),
        .O(a0_write_data[14]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[15]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [15]),
        .O(a0_write_data[15]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[16]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [16]),
        .O(a0_write_data[16]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[17]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [17]),
        .O(a0_write_data[17]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[18]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [18]),
        .O(a0_write_data[18]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[19]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [19]),
        .O(a0_write_data[19]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[1]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [1]),
        .O(a0_write_data[1]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[20]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [20]),
        .O(a0_write_data[20]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[21]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [21]),
        .O(a0_write_data[21]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[22]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [22]),
        .O(a0_write_data[22]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[23]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [23]),
        .O(a0_write_data[23]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[24]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [24]),
        .O(a0_write_data[24]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[25]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [25]),
        .O(a0_write_data[25]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[26]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [26]),
        .O(a0_write_data[26]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[27]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [27]),
        .O(a0_write_data[27]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[28]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [28]),
        .O(a0_write_data[28]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[29]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [29]),
        .O(a0_write_data[29]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[2]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [2]),
        .O(a0_write_data[2]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[30]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [30]),
        .O(a0_write_data[30]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[31]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [31]),
        .O(a0_write_data[31]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[3]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [3]),
        .O(a0_write_data[3]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[4]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [4]),
        .O(a0_write_data[4]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[5]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [5]),
        .O(a0_write_data[5]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[6]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [6]),
        .O(a0_write_data[6]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[7]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [7]),
        .O(a0_write_data[7]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[8]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [8]),
        .O(a0_write_data[8]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \a0_write_data[9]_INST_0 
       (.I0(\out_reg[0]_0 ),
        .I1(\a0_write_data[31] [9]),
        .O(a0_write_data[9]));
  LUT6 #(
    .INIT(64'h0000000002000000)) 
    a0_write_en_INST_0
       (.I0(Q),
        .I1(fsm_out[1]),
        .I2(fsm_out[3]),
        .I3(go),
        .I4(fsm_out[2]),
        .I5(a0_done),
        .O(\out_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    done_INST_0
       (.I0(fsm_out[1]),
        .I1(Q),
        .I2(fsm_out[2]),
        .I3(fsm_out[3]),
        .O(done));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'hFBFFFFFF)) 
    \done_buf[0]_i_3 
       (.I0(fsm_out[2]),
        .I1(go),
        .I2(fsm_out[3]),
        .I3(fsm_out[1]),
        .I4(Q),
        .O(\out_reg[2]_0 ));
  LUT6 #(
    .INIT(64'h0000000000800020)) 
    done_i_1
       (.I0(Q),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[3]),
        .I4(fsm_out[1]),
        .I5(comb_reg_done),
        .O(cond00_go_in));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    done_i_2
       (.I0(fsm_out[1]),
        .I1(fsm_out[3]),
        .I2(go),
        .I3(fsm_out[2]),
        .O(\out_reg[1]_3 ));
  LUT6 #(
    .INIT(64'h000000000E0B0208)) 
    \out[0]_i_1 
       (.I0(a_read0_0_done),
        .I1(fsm_out[2]),
        .I2(\out[0]_i_2_n_0 ),
        .I3(fsm_out[1]),
        .I4(i0_done),
        .I5(Q),
        .O(fsm_in[0]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[0]_i_1__0 
       (.I0(\out_reg[31]_0 [0]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[0]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [0]));
  LUT2 #(
    .INIT(4'h2)) 
    \out[0]_i_1__1 
       (.I0(upd2_go_in),
        .I1(\a0_addr0[3] [0]),
        .O(\out_reg[0]_1 ));
  LUT2 #(
    .INIT(4'hB)) 
    \out[0]_i_2 
       (.I0(fsm_out[3]),
        .I1(go),
        .O(\out[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[10]_i_1 
       (.I0(\out_reg[31]_0 [10]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[10]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [10]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[11]_i_1 
       (.I0(\out_reg[31]_0 [11]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[11]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [11]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[12]_i_1 
       (.I0(\out_reg[31]_0 [12]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[12]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [12]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[13]_i_1 
       (.I0(\out_reg[31]_0 [13]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[13]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [13]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[14]_i_1 
       (.I0(\out_reg[31]_0 [14]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[14]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [14]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[15]_i_1 
       (.I0(\out_reg[31]_0 [15]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[15]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [15]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[16]_i_1 
       (.I0(\out_reg[31]_0 [16]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[16]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [16]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[17]_i_1 
       (.I0(\out_reg[31]_0 [17]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[17]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [17]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[18]_i_1 
       (.I0(\out_reg[31]_0 [18]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[18]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [18]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[19]_i_1 
       (.I0(\out_reg[31]_0 [19]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[19]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [19]));
  LUT4 #(
    .INIT(16'hFF80)) 
    \out[1]_i_1 
       (.I0(\out_reg[1]_0 ),
        .I1(comb_reg_out),
        .I2(comb_reg_done),
        .I3(\out[3]_i_3_n_0 ),
        .O(fsm_in[1]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[1]_i_1__0 
       (.I0(\out_reg[31]_0 [1]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[1]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [1]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[20]_i_1 
       (.I0(\out_reg[31]_0 [20]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[20]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [20]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[21]_i_1 
       (.I0(\out_reg[31]_0 [21]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[21]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [21]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[22]_i_1 
       (.I0(\out_reg[31]_0 [22]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[22]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [22]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[23]_i_1 
       (.I0(\out_reg[31]_0 [23]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[23]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [23]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[24]_i_1 
       (.I0(\out_reg[31]_0 [24]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[24]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [24]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[25]_i_1 
       (.I0(\out_reg[31]_0 [25]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[25]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [25]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[26]_i_1 
       (.I0(\out_reg[31]_0 [26]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[26]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [26]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[27]_i_1 
       (.I0(\out_reg[31]_0 [27]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[27]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [27]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[28]_i_1 
       (.I0(\out_reg[31]_0 [28]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[28]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [28]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[29]_i_1 
       (.I0(\out_reg[31]_0 [29]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[29]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [29]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[2]_i_1__0 
       (.I0(\out_reg[31]_0 [2]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[2]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [2]));
  LUT6 #(
    .INIT(64'h000000000C00A000)) 
    \out[2]_i_2 
       (.I0(a0_done),
        .I1(i0_done),
        .I2(Q),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\out[0]_i_2_n_0 ),
        .O(a0_done_0));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[30]_i_1 
       (.I0(\out_reg[31]_0 [30]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[30]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [30]));
  LUT6 #(
    .INIT(64'h0000000000001020)) 
    \out[31]_i_1 
       (.I0(fsm_out[1]),
        .I1(fsm_out[3]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(Q),
        .I5(a_read0_0_done),
        .O(\out_reg[1]_1 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[31]_i_2 
       (.I0(\out_reg[31]_0 [31]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[31]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [31]));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    \out[31]_i_3 
       (.I0(a_read0_0_done),
        .I1(Q),
        .I2(fsm_out[2]),
        .I3(go),
        .I4(fsm_out[3]),
        .I5(fsm_out[1]),
        .O(\out[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEFEFE)) 
    \out[3]_i_1 
       (.I0(\out[3]_i_3_n_0 ),
        .I1(\out_reg[0]_2 ),
        .I2(\out[3]_i_5_n_0 ),
        .I3(\out_reg[1]_0 ),
        .I4(comb_reg_done),
        .O(fsm_write_en));
  LUT6 #(
    .INIT(64'h0010000000010000)) 
    \out[3]_i_1__0 
       (.I0(i0_done),
        .I1(Q),
        .I2(fsm_out[1]),
        .I3(fsm_out[3]),
        .I4(go),
        .I5(fsm_out[2]),
        .O(E));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[3]_i_1__1 
       (.I0(\out_reg[31]_0 [3]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[3]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [3]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00320002)) 
    \out[3]_i_3 
       (.I0(a_read0_0_done),
        .I1(\out[3]_i_7_n_0 ),
        .I2(fsm_out[2]),
        .I3(Q),
        .I4(i0_done),
        .I5(\out[3]_i_8_n_0 ),
        .O(\out[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000002000)) 
    \out[3]_i_3__0 
       (.I0(go),
        .I1(fsm_out[3]),
        .I2(fsm_out[1]),
        .I3(fsm_out[2]),
        .I4(Q),
        .I5(i0_done),
        .O(upd2_go_in));
  LUT6 #(
    .INIT(64'h0101010001000100)) 
    \out[3]_i_5 
       (.I0(Q),
        .I1(fsm_out[1]),
        .I2(fsm_out[2]),
        .I3(fsm_out[3]),
        .I4(go),
        .I5(i0_done),
        .O(\out[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'h20100000)) 
    \out[3]_i_6 
       (.I0(fsm_out[1]),
        .I1(fsm_out[3]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(Q),
        .O(\out_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \out[3]_i_7 
       (.I0(go),
        .I1(fsm_out[3]),
        .I2(fsm_out[1]),
        .O(\out[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0200000000000000)) 
    \out[3]_i_8 
       (.I0(Q),
        .I1(fsm_out[1]),
        .I2(fsm_out[3]),
        .I3(go),
        .I4(fsm_out[2]),
        .I5(a0_done),
        .O(\out[3]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \out[3]_i_9 
       (.I0(fsm_out[1]),
        .I1(fsm_out[3]),
        .I2(go),
        .I3(fsm_out[2]),
        .O(\out_reg[1]_2 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[4]_i_1 
       (.I0(\out_reg[31]_0 [4]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[4]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [4]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[5]_i_1 
       (.I0(\out_reg[31]_0 [5]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[5]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [5]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[6]_i_1 
       (.I0(\out_reg[31]_0 [6]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[6]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [6]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[7]_i_1 
       (.I0(\out_reg[31]_0 [7]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[7]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [7]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[8]_i_1 
       (.I0(\out_reg[31]_0 [8]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[8]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [8]));
  LUT4 #(
    .INIT(16'hF888)) 
    \out[9]_i_1 
       (.I0(\out_reg[31]_0 [9]),
        .I1(\out[31]_i_3_n_0 ),
        .I2(a0_read_data[9]),
        .I3(\a0_addr0[3]_INST_0_i_1_n_0 ),
        .O(\out_reg[31] [9]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[0]),
        .Q(Q),
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
        .D(D[0]),
        .Q(fsm_out[2]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(D[1]),
        .Q(fsm_out[3]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0_0
   (i0_done,
    Q,
    \out_reg[2]_0 ,
    reset,
    E,
    clk,
    D,
    upd2_go_in,
    \out_reg[0]_0 ,
    comb_reg_done,
    comb_reg_out);
  output i0_done;
  output [3:0]Q;
  output \out_reg[2]_0 ;
  input reset;
  input [0:0]E;
  input clk;
  input [0:0]D;
  input upd2_go_in;
  input \out_reg[0]_0 ;
  input comb_reg_done;
  input comb_reg_out;

  wire \<const1> ;
  wire [0:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire i0_done;
  wire [3:1]i0_in;
  wire \out_reg[0]_0 ;
  wire \out_reg[2]_0 ;
  wire reset;
  wire upd2_go_in;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(i0_done),
        .R(reset));
  LUT6 #(
    .INIT(64'hFFFF1FFF00001F00)) 
    \out[0]_i_1__5 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(\out_reg[0]_0 ),
        .I4(comb_reg_done),
        .I5(comb_reg_out),
        .O(\out_reg[2]_0 ));
  LUT3 #(
    .INIT(8'h28)) 
    \out[1]_i_1__1 
       (.I0(upd2_go_in),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(i0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \out[2]_i_1__1 
       (.I0(upd2_go_in),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(i0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \out[3]_i_2__0 
       (.I0(upd2_go_in),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(i0_in[3]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(D),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(i0_in[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(i0_in[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(i0_in[3]),
        .Q(Q[3]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0_2
   (count_done,
    Q,
    done_reg_0,
    \out_reg[3]_0 ,
    reset,
    E,
    clk,
    D,
    incr_count_go_in__1,
    \out_reg[0]_0 ,
    \out_reg[0]_1 ,
    pd_out,
    pow_done,
    \out_reg[0]_2 ,
    comb_reg_done,
    comb_reg_out);
  output count_done;
  output [0:0]Q;
  output [0:0]done_reg_0;
  output \out_reg[3]_0 ;
  input reset;
  input [0:0]E;
  input clk;
  input [0:0]D;
  input incr_count_go_in__1;
  input [0:0]\out_reg[0]_0 ;
  input [0:0]\out_reg[0]_1 ;
  input pd_out;
  input pow_done;
  input \out_reg[0]_2 ;
  input comb_reg_done;
  input comb_reg_out;

  wire \<const1> ;
  wire [0:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire count_done;
  wire [3:1]count_in;
  wire [0:0]done_reg_0;
  wire incr_count_go_in__1;
  wire \out[0]_i_2__0_n_0 ;
  wire [0:0]\out_reg[0]_0 ;
  wire [0:0]\out_reg[0]_1 ;
  wire \out_reg[0]_2 ;
  wire \out_reg[3]_0 ;
  wire \out_reg_n_0_[1] ;
  wire \out_reg_n_0_[2] ;
  wire \out_reg_n_0_[3] ;
  wire pd_out;
  wire pow_done;
  wire reset;

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
    \out[0]_i_1__4 
       (.I0(count_done),
        .I1(\out_reg[0]_0 ),
        .I2(\out_reg[0]_1 ),
        .I3(pd_out),
        .I4(pow_done),
        .O(done_reg_0));
  LUT6 #(
    .INIT(64'hFFFF02FF00000200)) 
    \out[0]_i_1__6 
       (.I0(\out[0]_i_2__0_n_0 ),
        .I1(\out_reg_n_0_[3] ),
        .I2(\out_reg_n_0_[2] ),
        .I3(\out_reg[0]_2 ),
        .I4(comb_reg_done),
        .I5(comb_reg_out),
        .O(\out_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \out[0]_i_2__0 
       (.I0(Q),
        .I1(\out_reg_n_0_[1] ),
        .O(\out[0]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \out[1]_i_1__3 
       (.I0(incr_count_go_in__1),
        .I1(\out_reg_n_0_[1] ),
        .I2(Q),
        .O(count_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \out[2]_i_1__3 
       (.I0(incr_count_go_in__1),
        .I1(\out_reg_n_0_[2] ),
        .I2(\out_reg_n_0_[1] ),
        .I3(Q),
        .O(count_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \out[3]_i_2__1 
       (.I0(incr_count_go_in__1),
        .I1(\out_reg_n_0_[3] ),
        .I2(Q),
        .I3(\out_reg_n_0_[1] ),
        .I4(\out_reg_n_0_[2] ),
        .O(count_in[3]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(D),
        .Q(Q),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(count_in[1]),
        .Q(\out_reg_n_0_[1] ),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(count_in[2]),
        .Q(\out_reg_n_0_[2] ),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(count_in[3]),
        .Q(\out_reg_n_0_[3] ),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1
   (comb_reg_done,
    comb_reg_out,
    D,
    reset,
    cond00_go_in,
    clk,
    \out_reg[0]_0 ,
    \out_reg[3] );
  output comb_reg_done;
  output comb_reg_out;
  output [0:0]D;
  input reset;
  input cond00_go_in;
  input clk;
  input \out_reg[0]_0 ;
  input \out_reg[3] ;

  wire \<const1> ;
  wire [0:0]D;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond00_go_in;
  wire \out_reg[0]_0 ;
  wire \out_reg[3] ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(cond00_go_in),
        .Q(comb_reg_done),
        .R(reset));
  LUT3 #(
    .INIT(8'h40)) 
    \out[3]_i_2 
       (.I0(comb_reg_out),
        .I1(comb_reg_done),
        .I2(\out_reg[3] ),
        .O(D));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_0 ),
        .Q(comb_reg_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1_1
   (comb_reg_done,
    comb_reg_out,
    D,
    reset,
    cond0_go_in,
    clk,
    \out_reg[0]_0 ,
    Q,
    \out_reg[2] ,
    \out_reg[2]_0 );
  output comb_reg_done;
  output comb_reg_out;
  output [0:0]D;
  input reset;
  input cond0_go_in;
  input clk;
  input \out_reg[0]_0 ;
  input [0:0]Q;
  input \out_reg[2] ;
  input [1:0]\out_reg[2]_0 ;

  wire \<const1> ;
  wire [0:0]D;
  wire [0:0]Q;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire \out_reg[0]_0 ;
  wire \out_reg[2] ;
  wire [1:0]\out_reg[2]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(cond0_go_in),
        .Q(comb_reg_done),
        .R(reset));
  LUT6 #(
    .INIT(64'h0000004000000000)) 
    \out[2]_i_2__0 
       (.I0(comb_reg_out),
        .I1(comb_reg_done),
        .I2(Q),
        .I3(\out_reg[2] ),
        .I4(\out_reg[2]_0 [1]),
        .I5(\out_reg[2]_0 [0]),
        .O(D));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_0 ),
        .Q(comb_reg_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1_3
   (pd_out,
    reset,
    \out_reg[0]_0 ,
    clk);
  output pd_out;
  input reset;
  input \out_reg[0]_0 ;
  input clk;

  wire \<const1> ;
  wire clk;
  wire \out_reg[0]_0 ;
  wire pd_out;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_0 ),
        .Q(pd_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1_4
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
module std_reg__parameterized2
   (D,
    \out_reg[1]_0 ,
    Q,
    \out_reg[0]_0 ,
    cond0_go_in,
    E,
    \out_reg[0]_1 ,
    incr_count_go_in__1,
    \done_buf_reg[2] ,
    \out_reg[0]_2 ,
    done_reg,
    done_reg_0,
    done_reg_1,
    \out_reg[2]_0 ,
    \done_buf_reg[2]_0 ,
    \out_reg[2]_1 ,
    \out_reg[2]_2 ,
    pd0_out,
    pd_out,
    comb_reg_done,
    pow_done,
    count_done,
    \out_reg[2]_3 ,
    comb_reg_out,
    done_reg_2,
    done_reg_3,
    \out_reg[0]_3 ,
    mul_done,
    reset,
    clk);
  output [0:0]D;
  output \out_reg[1]_0 ;
  output [2:0]Q;
  output \out_reg[0]_0 ;
  output cond0_go_in;
  output [0:0]E;
  output [0:0]\out_reg[0]_1 ;
  output incr_count_go_in__1;
  output \done_buf_reg[2] ;
  output \out_reg[0]_2 ;
  output [0:0]done_reg;
  output done_reg_0;
  output done_reg_1;
  input \out_reg[2]_0 ;
  input \done_buf_reg[2]_0 ;
  input \out_reg[2]_1 ;
  input \out_reg[2]_2 ;
  input pd0_out;
  input pd_out;
  input comb_reg_done;
  input pow_done;
  input count_done;
  input [0:0]\out_reg[2]_3 ;
  input comb_reg_out;
  input [0:0]done_reg_2;
  input done_reg_3;
  input [0:0]\out_reg[0]_3 ;
  input mul_done;
  input reset;
  input clk;

  wire [0:0]D;
  wire [0:0]E;
  wire [2:0]Q;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire count_done;
  wire \done_buf_reg[2] ;
  wire \done_buf_reg[2]_0 ;
  wire [0:0]done_reg;
  wire done_reg_0;
  wire done_reg_1;
  wire [0:0]done_reg_2;
  wire done_reg_3;
  wire [1:0]fsm_in;
  wire fsm_write_en;
  wire incr_count_go_in__1;
  wire mul_done;
  wire \out[2]_i_3_n_0 ;
  wire \out[2]_i_4_n_0 ;
  wire \out[3]_i_3__1_n_0 ;
  wire \out_reg[0]_0 ;
  wire [0:0]\out_reg[0]_1 ;
  wire \out_reg[0]_2 ;
  wire [0:0]\out_reg[0]_3 ;
  wire \out_reg[1]_0 ;
  wire \out_reg[2]_0 ;
  wire \out_reg[2]_1 ;
  wire \out_reg[2]_2 ;
  wire [0:0]\out_reg[2]_3 ;
  wire pd0_out;
  wire pd_out;
  wire pow_done;
  wire reset;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    \done_buf[0]_i_2 
       (.I0(pd_out),
        .I1(pow_done),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(\done_buf_reg[2]_0 ),
        .I5(Q[0]),
        .O(\out_reg[0]_2 ));
  LUT2 #(
    .INIT(4'hE)) 
    \done_buf[1]_i_1 
       (.I0(\out_reg[0]_2 ),
        .I1(mul_done),
        .O(\done_buf_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00000200)) 
    done_i_1__0
       (.I0(done_reg_2),
        .I1(done_reg_3),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(comb_reg_done),
        .O(cond0_go_in));
  LUT6 #(
    .INIT(64'h0F08000800080008)) 
    \out[0]_i_1__2 
       (.I0(count_done),
        .I1(pow_done),
        .I2(\out[3]_i_3__1_n_0 ),
        .I3(Q[1]),
        .I4(pd0_out),
        .I5(pd_out),
        .O(fsm_in[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \out[0]_i_1__3 
       (.I0(incr_count_go_in__1),
        .I1(\out_reg[0]_3 ),
        .O(\out_reg[0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h04F4)) 
    \out[0]_i_1__7 
       (.I0(\out[2]_i_3_n_0 ),
        .I1(pow_done),
        .I2(pd_out),
        .I3(pd0_out),
        .O(done_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0F44)) 
    \out[0]_i_1__8 
       (.I0(\out[2]_i_3_n_0 ),
        .I1(count_done),
        .I2(pd_out),
        .I3(pd0_out),
        .O(done_reg_1));
  LUT6 #(
    .INIT(64'hFF40404040404040)) 
    \out[1]_i_1__2 
       (.I0(\out[2]_i_3_n_0 ),
        .I1(pd0_out),
        .I2(pd_out),
        .I3(\out_reg[0]_0 ),
        .I4(comb_reg_out),
        .I5(comb_reg_done),
        .O(fsm_in[1]));
  LUT2 #(
    .INIT(4'hE)) 
    \out[2]_i_1 
       (.I0(\out_reg[1]_0 ),
        .I1(\out_reg[2]_0 ),
        .O(D));
  LUT6 #(
    .INIT(64'hFFFFFF40FF40FF40)) 
    \out[2]_i_1__2 
       (.I0(\out[2]_i_3_n_0 ),
        .I1(pd0_out),
        .I2(pd_out),
        .I3(\out[2]_i_4_n_0 ),
        .I4(\out_reg[0]_0 ),
        .I5(comb_reg_done),
        .O(fsm_write_en));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFBFFFF)) 
    \out[2]_i_3 
       (.I0(Q[0]),
        .I1(done_reg_2),
        .I2(done_reg_3),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(\out[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h1010101011101010)) 
    \out[2]_i_4 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(pow_done),
        .I4(count_done),
        .I5(\done_buf_reg[2]_0 ),
        .O(\out[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \out[2]_i_5 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(done_reg_3),
        .I3(done_reg_2),
        .O(\out_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0101010103030F03)) 
    \out[31]_i_1__0 
       (.I0(count_done),
        .I1(Q[1]),
        .I2(\out[3]_i_3__1_n_0 ),
        .I3(mul_done),
        .I4(pd_out),
        .I5(pow_done),
        .O(done_reg));
  LUT5 #(
    .INIT(32'h0103010F)) 
    \out[3]_i_1__2 
       (.I0(pow_done),
        .I1(Q[1]),
        .I2(\out[3]_i_3__1_n_0 ),
        .I3(count_done),
        .I4(pd0_out),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    \out[3]_i_3__1 
       (.I0(Q[2]),
        .I1(done_reg_3),
        .I2(done_reg_2),
        .I3(Q[0]),
        .O(\out[3]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF001000100010)) 
    \out[3]_i_4 
       (.I0(\done_buf_reg[2]_0 ),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(\out_reg[2]_1 ),
        .I5(\out_reg[2]_2 ),
        .O(\out_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \out[3]_i_4__0 
       (.I0(pd0_out),
        .I1(Q[0]),
        .I2(\done_buf_reg[2]_0 ),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(count_done),
        .O(incr_count_go_in__1));
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
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(\out_reg[2]_3 ),
        .Q(Q[2]),
        .R(reset));
endmodule
