// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by Tang Dynasty v5.6.59063
// Sat Oct  8 17:32:32 2022

`timescale 1ns / 1ps
module img_fifo  // ip_fifo.v(14)
  (
  clkr,
  clkw,
  di,
  re,
  rst,
  we,
  do,
  empty_flag,
  full_flag
  );

  input clkr;  // ip_fifo.v(25)
  input clkw;  // ip_fifo.v(24)
  input [7:0] di;  // ip_fifo.v(23)
  input re;  // ip_fifo.v(25)
  input rst;  // ip_fifo.v(22)
  input we;  // ip_fifo.v(24)
  output [15:0] do;  // ip_fifo.v(27)
  output empty_flag;  // ip_fifo.v(28)
  output full_flag;  // ip_fifo.v(29)

  wire empty_flag_syn_2;  // ip_fifo.v(28)
  wire full_flag_syn_2;  // ip_fifo.v(29)

  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  not empty_flag_syn_1 (empty_flag_syn_2, empty_flag);  // ip_fifo.v(28)
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000001101),
    .AEP1(32'b00000000000000000000000000001111),
    .AF(32'b00000000000000000001111111111010),
    .AFM1(32'b00000000000000000001111111111001),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("2"),
    .E(32'b00000000000000000000000000000001),
    .EP1(32'b00000000000000000000000000000011),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    fifo_inst_syn_10 (
    .clkr(clkr),
    .clkw(clkw),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n47,open_n48,open_n49,open_n50,open_n51,open_n52,open_n53,di[1],open_n54}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n75,open_n76,open_n77,open_n78,open_n79,open_n80,open_n81,do[1],do[9]}));  // ip_fifo.v(41)
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000001101),
    .AEP1(32'b00000000000000000000000000001111),
    .AF(32'b00000000000000000001111111111010),
    .AFM1(32'b00000000000000000001111111111001),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("2"),
    .E(32'b00000000000000000000000000000001),
    .EP1(32'b00000000000000000000000000000011),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    fifo_inst_syn_11 (
    .clkr(clkr),
    .clkw(clkw),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n84,open_n85,open_n86,open_n87,open_n88,open_n89,open_n90,di[2],open_n91}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n112,open_n113,open_n114,open_n115,open_n116,open_n117,open_n118,do[2],do[10]}));  // ip_fifo.v(41)
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000001101),
    .AEP1(32'b00000000000000000000000000001111),
    .AF(32'b00000000000000000001111111111010),
    .AFM1(32'b00000000000000000001111111111001),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("2"),
    .E(32'b00000000000000000000000000000001),
    .EP1(32'b00000000000000000000000000000011),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    fifo_inst_syn_12 (
    .clkr(clkr),
    .clkw(clkw),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n121,open_n122,open_n123,open_n124,open_n125,open_n126,open_n127,di[3],open_n128}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n149,open_n150,open_n151,open_n152,open_n153,open_n154,open_n155,do[3],do[11]}));  // ip_fifo.v(41)
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000001101),
    .AEP1(32'b00000000000000000000000000001111),
    .AF(32'b00000000000000000001111111111010),
    .AFM1(32'b00000000000000000001111111111001),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("2"),
    .E(32'b00000000000000000000000000000001),
    .EP1(32'b00000000000000000000000000000011),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    fifo_inst_syn_13 (
    .clkr(clkr),
    .clkw(clkw),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n158,open_n159,open_n160,open_n161,open_n162,open_n163,open_n164,di[4],open_n165}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n186,open_n187,open_n188,open_n189,open_n190,open_n191,open_n192,do[4],do[12]}));  // ip_fifo.v(41)
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000001101),
    .AEP1(32'b00000000000000000000000000001111),
    .AF(32'b00000000000000000001111111111010),
    .AFM1(32'b00000000000000000001111111111001),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("2"),
    .E(32'b00000000000000000000000000000001),
    .EP1(32'b00000000000000000000000000000011),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    fifo_inst_syn_14 (
    .clkr(clkr),
    .clkw(clkw),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n195,open_n196,open_n197,open_n198,open_n199,open_n200,open_n201,di[5],open_n202}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n223,open_n224,open_n225,open_n226,open_n227,open_n228,open_n229,do[5],do[13]}));  // ip_fifo.v(41)
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000001101),
    .AEP1(32'b00000000000000000000000000001111),
    .AF(32'b00000000000000000001111111111010),
    .AFM1(32'b00000000000000000001111111111001),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("2"),
    .E(32'b00000000000000000000000000000001),
    .EP1(32'b00000000000000000000000000000011),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    fifo_inst_syn_15 (
    .clkr(clkr),
    .clkw(clkw),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n232,open_n233,open_n234,open_n235,open_n236,open_n237,open_n238,di[6],open_n239}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n260,open_n261,open_n262,open_n263,open_n264,open_n265,open_n266,do[6],do[14]}));  // ip_fifo.v(41)
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000001101),
    .AEP1(32'b00000000000000000000000000001111),
    .AF(32'b00000000000000000001111111111010),
    .AFM1(32'b00000000000000000001111111111001),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("2"),
    .E(32'b00000000000000000000000000000001),
    .EP1(32'b00000000000000000000000000000011),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    fifo_inst_syn_16 (
    .clkr(clkr),
    .clkw(clkw),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n269,open_n270,open_n271,open_n272,open_n273,open_n274,open_n275,di[7],open_n276}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n297,open_n298,open_n299,open_n300,open_n301,open_n302,open_n303,do[7],do[15]}));  // ip_fifo.v(41)
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000001101),
    .AEP1(32'b00000000000000000000000000001111),
    .AF(32'b00000000000000000001111111111010),
    .AFM1(32'b00000000000000000001111111111001),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("2"),
    .E(32'b00000000000000000000000000000001),
    .EP1(32'b00000000000000000000000000000011),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    fifo_inst_syn_9 (
    .clkr(clkr),
    .clkw(clkw),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n306,open_n307,open_n308,open_n309,open_n310,open_n311,open_n312,di[0],open_n313}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n334,open_n335,open_n336,open_n337,open_n338,open_n339,open_n340,do[0],do[8]}),
    .empty_flag(empty_flag),
    .full_flag(full_flag));  // ip_fifo.v(41)
  not full_flag_syn_1 (full_flag_syn_2, full_flag);  // ip_fifo.v(29)

endmodule 

