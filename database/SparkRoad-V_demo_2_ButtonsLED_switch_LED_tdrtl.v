// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Tue Jul 23 19:11:32 2019

`timescale 1ns / 1ps
module switch_LED  // Buttons_LED.v(15)
  (
  btn,
  clk_24M,
  led
  );

  input [4:0] btn;  // Buttons_LED.v(17)
  input clk_24M;  // Buttons_LED.v(16)
  output [15:0] led;  // Buttons_LED.v(18)

  wire [4:0] key_pulse;  // Buttons_LED.v(22)
  wire [2:0] n1;
  wire [2:0] n2;
  wire [2:0] n3;
  wire [2:0] n4;
  wire [3:0] n5;
  wire \key_pulse[0]_neg ;
  wire \key_pulse[1]_neg ;
  wire \key_pulse[2]_neg ;
  wire \key_pulse[3]_neg ;
  wire mux1_b3_sel_is_2_o;
  wire mux2_b3_sel_is_2_o;
  wire mux2_b6_sel_is_2_o;
  wire mux3_b10_sel_is_2_o;
  wire mux3_b12_sel_is_2_o;
  wire mux3_b3_sel_is_2_o;
  wire mux3_b6_sel_is_2_o;
  wire mux4_b10_sel_is_2_o;
  wire mux4_b3_sel_is_2_o;
  wire mux4_b6_sel_is_2_o;
  wire rst_n;  // Buttons_LED.v(21)

  not \key_pulse[0]_inv  (\key_pulse[0]_neg , key_pulse[0]);
  not \key_pulse[1]_inv  (\key_pulse[1]_neg , key_pulse[1]);
  not \key_pulse[2]_inv  (\key_pulse[2]_neg , key_pulse[2]);
  not \key_pulse[3]_inv  (\key_pulse[3]_neg , key_pulse[3]);
  and mux1_b3_sel_is_2 (mux1_b3_sel_is_2_o, \key_pulse[3]_neg , key_pulse[4]);
  and mux2_b3_sel_is_2 (mux2_b3_sel_is_2_o, \key_pulse[2]_neg , key_pulse[3]);
  and mux2_b6_sel_is_2 (mux2_b6_sel_is_2_o, \key_pulse[2]_neg , mux1_b3_sel_is_2_o);
  and mux3_b10_sel_is_2 (mux3_b10_sel_is_2_o, \key_pulse[0]_neg , mux4_b6_sel_is_2_o);
  and mux3_b12_sel_is_2 (mux3_b12_sel_is_2_o, \key_pulse[0]_neg , mux4_b10_sel_is_2_o);
  and mux3_b3_sel_is_2 (mux3_b3_sel_is_2_o, \key_pulse[0]_neg , key_pulse[1]);
  and mux3_b6_sel_is_2 (mux3_b6_sel_is_2_o, \key_pulse[0]_neg , mux4_b3_sel_is_2_o);
  and mux4_b10_sel_is_2 (mux4_b10_sel_is_2_o, \key_pulse[1]_neg , mux2_b6_sel_is_2_o);
  and mux4_b3_sel_is_2 (mux4_b3_sel_is_2_o, \key_pulse[1]_neg , key_pulse[2]);
  and mux4_b6_sel_is_2 (mux4_b6_sel_is_2_o, \key_pulse[1]_neg , mux2_b3_sel_is_2_o);
  reg_ar_as_w1 reg0_b0 (
    .clk(clk_24M),
    .d(n1[0]),
    .en(key_pulse[0]),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[0]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk_24M),
    .d(n1[1]),
    .en(key_pulse[0]),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[1]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b10 (
    .clk(clk_24M),
    .d(n4[1]),
    .en(mux3_b10_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[10]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b11 (
    .clk(clk_24M),
    .d(n4[2]),
    .en(mux3_b10_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[11]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b12 (
    .clk(clk_24M),
    .d(n5[0]),
    .en(mux3_b12_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[12]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b13 (
    .clk(clk_24M),
    .d(n5[1]),
    .en(mux3_b12_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[13]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b14 (
    .clk(clk_24M),
    .d(n5[2]),
    .en(mux3_b12_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[14]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b15 (
    .clk(clk_24M),
    .d(n5[3]),
    .en(mux3_b12_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[15]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk_24M),
    .d(n1[2]),
    .en(key_pulse[0]),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[2]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk_24M),
    .d(n2[0]),
    .en(mux3_b3_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[3]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk_24M),
    .d(n2[1]),
    .en(mux3_b3_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[4]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk_24M),
    .d(n2[2]),
    .en(mux3_b3_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[5]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk_24M),
    .d(n3[0]),
    .en(mux3_b6_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[6]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk_24M),
    .d(n3[1]),
    .en(mux3_b6_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[7]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b8 (
    .clk(clk_24M),
    .d(n3[2]),
    .en(mux3_b6_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[8]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b9 (
    .clk(clk_24M),
    .d(n4[0]),
    .en(mux3_b10_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led[9]));  // Buttons_LED.v(54)
  not u0 (n4[1], led[10]);  // Buttons_LED.v(49)
  not u1 (n5[3], led[15]);  // Buttons_LED.v(51)
  not u10 (n4[2], led[11]);  // Buttons_LED.v(49)
  not u11 (n3[1], led[7]);  // Buttons_LED.v(47)
  not u12 (n3[2], led[8]);  // Buttons_LED.v(47)
  not u13 (n2[1], led[4]);  // Buttons_LED.v(45)
  not u14 (n2[2], led[5]);  // Buttons_LED.v(45)
  not u15 (n1[1], led[1]);  // Buttons_LED.v(43)
  not u16 (n1[2], led[2]);  // Buttons_LED.v(43)
  not u2 (n5[2], led[14]);  // Buttons_LED.v(51)
  not u3 (n5[1], led[13]);  // Buttons_LED.v(51)
  not u4 (n5[0], led[12]);  // Buttons_LED.v(51)
  not u6 (n1[0], led[0]);  // Buttons_LED.v(43)
  not u7 (n2[0], led[3]);  // Buttons_LED.v(45)
  not u8 (n3[0], led[6]);  // Buttons_LED.v(47)
  not u9 (n4[0], led[9]);  // Buttons_LED.v(49)
  \debounce(N=5)  ux_btn (
    .clk(clk_24M),
    .key(btn),
    .rst(rst_n),
    .key_pulse(key_pulse));  // Buttons_LED.v(25)
  rst_int ux_rst (
    .sclk(clk_24M),
    .rst_n(rst_n));  // Buttons_LED.v(32)

endmodule 

module reg_ar_as_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(enout),
    .reset(reset),
    .set(set),
    .q(q));

endmodule 

module \debounce(N=5)   // debounce.v(2)
  (
  clk,
  key,
  rst,
  key_pulse
  );

  input clk;  // debounce.v(7)
  input [4:0] key;  // debounce.v(9)
  input rst;  // debounce.v(8)
  output [4:0] key_pulse;  // debounce.v(10)

  parameter N = 5;
  wire [18:0] cnt;  // debounce.v(32)
  wire [4:0] key_edge;  // debounce.v(15)
  wire [4:0] key_rst;  // debounce.v(13)
  wire [4:0] key_rst_pre;  // debounce.v(12)
  wire [4:0] key_sec;  // debounce.v(46)
  wire [4:0] key_sec_pre;  // debounce.v(45)
  wire [4:0] n0;
  wire [4:0] n10;
  wire [18:0] n3;
  wire [18:0] n4;
  wire n2;
  wire n5;
  wire n6;
  wire n8;
  wire n9;

  add_pu19_pu19_o19 add0 (
    .i0(cnt),
    .i1(19'b0000000000000000001),
    .o(n3));  // debounce.v(42)
  eq_w19 eq0 (
    .i0(cnt),
    .i1(19'b1110101011000000001),
    .o(n6));  // debounce.v(54)
  binary_mux_s1_w1 mux0_b0 (
    .i0(n3[0]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[0]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b1 (
    .i0(n3[1]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[1]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b10 (
    .i0(n3[10]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[10]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b11 (
    .i0(n3[11]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[11]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b12 (
    .i0(n3[12]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[12]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b13 (
    .i0(n3[13]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[13]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b14 (
    .i0(n3[14]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[14]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b15 (
    .i0(n3[15]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[15]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b16 (
    .i0(n3[16]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[16]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b17 (
    .i0(n3[17]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[17]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b18 (
    .i0(n3[18]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[18]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b2 (
    .i0(n3[2]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[2]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b3 (
    .i0(n3[3]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[3]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b4 (
    .i0(n3[4]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[4]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b5 (
    .i0(n3[5]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[5]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b6 (
    .i0(n3[6]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[6]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b7 (
    .i0(n3[7]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[7]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b8 (
    .i0(n3[8]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[8]));  // debounce.v(42)
  binary_mux_s1_w1 mux0_b9 (
    .i0(n3[9]),
    .i1(1'b0),
    .sel(n2),
    .o(n4[9]));  // debounce.v(42)
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(key_rst[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst_pre[0]));  // debounce.v(27)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(key_rst[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst_pre[1]));  // debounce.v(27)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(key_rst[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst_pre[2]));  // debounce.v(27)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(key_rst[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst_pre[3]));  // debounce.v(27)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk),
    .d(key_rst[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst_pre[4]));  // debounce.v(27)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk),
    .d(n4[0]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[0]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk),
    .d(n4[1]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[1]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b10 (
    .clk(clk),
    .d(n4[10]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[10]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b11 (
    .clk(clk),
    .d(n4[11]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[11]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b12 (
    .clk(clk),
    .d(n4[12]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[12]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b13 (
    .clk(clk),
    .d(n4[13]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[13]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b14 (
    .clk(clk),
    .d(n4[14]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[14]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b15 (
    .clk(clk),
    .d(n4[15]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[15]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b16 (
    .clk(clk),
    .d(n4[16]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[16]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b17 (
    .clk(clk),
    .d(n4[17]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[17]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b18 (
    .clk(clk),
    .d(n4[18]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[18]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk),
    .d(n4[2]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[2]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk),
    .d(n4[3]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[3]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b4 (
    .clk(clk),
    .d(n4[4]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[4]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b5 (
    .clk(clk),
    .d(n4[5]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[5]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b6 (
    .clk(clk),
    .d(n4[6]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[6]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b7 (
    .clk(clk),
    .d(n4[7]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[7]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b8 (
    .clk(clk),
    .d(n4[8]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[8]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b9 (
    .clk(clk),
    .d(n4[9]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[9]));  // debounce.v(42)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk),
    .d(key[0]),
    .en(n6),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec[0]));  // debounce.v(55)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk),
    .d(key[1]),
    .en(n6),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec[1]));  // debounce.v(55)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk),
    .d(key[2]),
    .en(n6),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec[2]));  // debounce.v(55)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk),
    .d(key[3]),
    .en(n6),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec[3]));  // debounce.v(55)
  reg_ar_as_w1 reg2_b4 (
    .clk(clk),
    .d(key[4]),
    .en(n6),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec[4]));  // debounce.v(55)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk),
    .d(key_sec[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec_pre[0]));  // debounce.v(62)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk),
    .d(key_sec[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec_pre[1]));  // debounce.v(62)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk),
    .d(key_sec[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec_pre[2]));  // debounce.v(62)
  reg_ar_as_w1 reg3_b3 (
    .clk(clk),
    .d(key_sec[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec_pre[3]));  // debounce.v(62)
  reg_ar_as_w1 reg3_b4 (
    .clk(clk),
    .d(key_sec[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec_pre[4]));  // debounce.v(62)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk),
    .d(key[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst[0]));  // debounce.v(27)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk),
    .d(key[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst[1]));  // debounce.v(27)
  reg_ar_as_w1 reg4_b2 (
    .clk(clk),
    .d(key[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst[2]));  // debounce.v(27)
  reg_ar_as_w1 reg4_b3 (
    .clk(clk),
    .d(key[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst[3]));  // debounce.v(27)
  reg_ar_as_w1 reg4_b4 (
    .clk(clk),
    .d(key[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst[4]));  // debounce.v(27)
  not u10 (n10[1], key_sec[1]);  // debounce.v(64)
  and u11 (key_pulse[2], key_sec_pre[2], n10[2]);  // debounce.v(64)
  and u12 (key_pulse[4], key_sec_pre[4], n10[4]);  // debounce.v(64)
  and u13 (key_pulse[1], key_sec_pre[1], n10[1]);  // debounce.v(64)
  or u14 (n5, key_edge[2], n9);  // debounce.v(39)
  or u15 (n8, key_edge[0], key_edge[1]);  // debounce.v(39)
  not u16 (n10[0], key_sec[0]);  // debounce.v(64)
  and u17 (key_pulse[0], key_sec_pre[0], n10[0]);  // debounce.v(64)
  or u18 (n2, n8, n5);  // debounce.v(39)
  and u19 (key_edge[1], key_rst_pre[1], n0[1]);  // debounce.v(30)
  or u2 (n9, key_edge[3], key_edge[4]);  // debounce.v(39)
  and u20 (key_edge[2], key_rst_pre[2], n0[2]);  // debounce.v(30)
  and u21 (key_edge[3], key_rst_pre[3], n0[3]);  // debounce.v(30)
  and u22 (key_edge[4], key_rst_pre[4], n0[4]);  // debounce.v(30)
  not u23 (n0[1], key_rst[1]);  // debounce.v(30)
  not u24 (n0[2], key_rst[2]);  // debounce.v(30)
  not u25 (n0[3], key_rst[3]);  // debounce.v(30)
  not u26 (n0[4], key_rst[4]);  // debounce.v(30)
  not u3 (n10[4], key_sec[4]);  // debounce.v(64)
  not u4 (n10[3], key_sec[3]);  // debounce.v(64)
  not u6 (n0[0], key_rst[0]);  // debounce.v(30)
  not u7 (n10[2], key_sec[2]);  // debounce.v(64)
  and u8 (key_pulse[3], key_sec_pre[3], n10[3]);  // debounce.v(64)
  and u9 (key_edge[0], key_rst_pre[0], n0[0]);  // debounce.v(30)

endmodule 

module rst_int  // rst.v(9)
  (
  sclk,
  rst_n
  );

  input sclk;  // rst.v(11)
  output rst_n;  // rst.v(12)

  wire [3:0] counter;  // rst.v(15)
  wire [3:0] n1;
  wire n0;

  add_pu4_pu4_o4 add0 (
    .i0(counter),
    .i1(4'b0001),
    .o(n1));  // rst.v(22)
  eq_w4 eq0 (
    .i0(counter),
    .i1(4'b1111),
    .o(n0));  // rst.v(19)
  reg_ar_ss_w1 reg0_b0 (
    .clk(sclk),
    .d(n1[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(n0),
    .q(counter[0]));  // rst.v(23)
  reg_ar_ss_w1 reg0_b1 (
    .clk(sclk),
    .d(n1[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(n0),
    .q(counter[1]));  // rst.v(23)
  reg_ar_ss_w1 reg0_b2 (
    .clk(sclk),
    .d(n1[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(n0),
    .q(counter[2]));  // rst.v(23)
  reg_ar_ss_w1 reg0_b3 (
    .clk(sclk),
    .d(n1[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(n0),
    .q(counter[3]));  // rst.v(23)
  reg_ar_as_w1 rst_n_reg (
    .clk(sclk),
    .d(n0),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rst_n));  // rst.v(31)

endmodule 

module add_pu19_pu19_o19
  (
  i0,
  i1,
  o
  );

  input [18:0] i0;
  input [18:0] i1;
  output [18:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a11;
  wire net_a12;
  wire net_a13;
  wire net_a14;
  wire net_a15;
  wire net_a16;
  wire net_a17;
  wire net_a18;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_a8;
  wire net_a9;
  wire net_b0;
  wire net_b1;
  wire net_b10;
  wire net_b11;
  wire net_b12;
  wire net_b13;
  wire net_b14;
  wire net_b15;
  wire net_b16;
  wire net_b17;
  wire net_b18;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_b8;
  wire net_b9;
  wire net_cout0;
  wire net_cout1;
  wire net_cout10;
  wire net_cout11;
  wire net_cout12;
  wire net_cout13;
  wire net_cout14;
  wire net_cout15;
  wire net_cout16;
  wire net_cout17;
  wire net_cout18;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_cout8;
  wire net_cout9;
  wire net_sum0;
  wire net_sum1;
  wire net_sum10;
  wire net_sum11;
  wire net_sum12;
  wire net_sum13;
  wire net_sum14;
  wire net_sum15;
  wire net_sum16;
  wire net_sum17;
  wire net_sum18;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a18 = i0[18];
  assign net_a17 = i0[17];
  assign net_a16 = i0[16];
  assign net_a15 = i0[15];
  assign net_a14 = i0[14];
  assign net_a13 = i0[13];
  assign net_a12 = i0[12];
  assign net_a11 = i0[11];
  assign net_a10 = i0[10];
  assign net_a9 = i0[9];
  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b18 = i1[18];
  assign net_b17 = i1[17];
  assign net_b16 = i1[16];
  assign net_b15 = i1[15];
  assign net_b14 = i1[14];
  assign net_b13 = i1[13];
  assign net_b12 = i1[12];
  assign net_b11 = i1[11];
  assign net_b10 = i1[10];
  assign net_b9 = i1[9];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[18] = net_sum18;
  assign o[17] = net_sum17;
  assign o[16] = net_sum16;
  assign o[15] = net_sum15;
  assign o[14] = net_sum14;
  assign o[13] = net_sum13;
  assign o[12] = net_sum12;
  assign o[11] = net_sum11;
  assign o[10] = net_sum10;
  assign o[9] = net_sum9;
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_10 (
    .a(net_a10),
    .b(net_b10),
    .c(net_cout9),
    .cout(net_cout10),
    .sum(net_sum10));
  AL_FADD comp_11 (
    .a(net_a11),
    .b(net_b11),
    .c(net_cout10),
    .cout(net_cout11),
    .sum(net_sum11));
  AL_FADD comp_12 (
    .a(net_a12),
    .b(net_b12),
    .c(net_cout11),
    .cout(net_cout12),
    .sum(net_sum12));
  AL_FADD comp_13 (
    .a(net_a13),
    .b(net_b13),
    .c(net_cout12),
    .cout(net_cout13),
    .sum(net_sum13));
  AL_FADD comp_14 (
    .a(net_a14),
    .b(net_b14),
    .c(net_cout13),
    .cout(net_cout14),
    .sum(net_sum14));
  AL_FADD comp_15 (
    .a(net_a15),
    .b(net_b15),
    .c(net_cout14),
    .cout(net_cout15),
    .sum(net_sum15));
  AL_FADD comp_16 (
    .a(net_a16),
    .b(net_b16),
    .c(net_cout15),
    .cout(net_cout16),
    .sum(net_sum16));
  AL_FADD comp_17 (
    .a(net_a17),
    .b(net_b17),
    .c(net_cout16),
    .cout(net_cout17),
    .sum(net_sum17));
  AL_FADD comp_18 (
    .a(net_a18),
    .b(net_b18),
    .c(net_cout17),
    .cout(net_cout18),
    .sum(net_sum18));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD comp_8 (
    .a(net_a8),
    .b(net_b8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD comp_9 (
    .a(net_a9),
    .b(net_b9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));

endmodule 

module eq_w19
  (
  i0,
  i1,
  o
  );

  input [18:0] i0;
  input [18:0] i1;
  output o;

  wire \or_or_or_or_xor_i0[0_o ;
  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_or_xor_i0[9]_i_o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[14]_i1[_o ;
  wire \or_or_xor_i0[4]_i1[4_o ;
  wire \or_or_xor_i0[9]_i1[9_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[11]_i1[11]_o ;
  wire \or_xor_i0[12]_i1[12]_o ;
  wire \or_xor_i0[14]_i1[14]_o ;
  wire \or_xor_i0[16]_i1[16]_o ;
  wire \or_xor_i0[17]_i1[17]_o ;
  wire \or_xor_i0[2]_i1[2]_o_o ;
  wire \or_xor_i0[4]_i1[4]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \or_xor_i0[7]_i1[7]_o_o ;
  wire \or_xor_i0[9]_i1[9]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[10]_i1[10]_o ;
  wire \xor_i0[11]_i1[11]_o ;
  wire \xor_i0[12]_i1[12]_o ;
  wire \xor_i0[13]_i1[13]_o ;
  wire \xor_i0[14]_i1[14]_o ;
  wire \xor_i0[15]_i1[15]_o ;
  wire \xor_i0[16]_i1[16]_o ;
  wire \xor_i0[17]_i1[17]_o ;
  wire \xor_i0[18]_i1[18]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;
  wire \xor_i0[9]_i1[9]_o ;

  not none_diff (o, \or_or_or_or_xor_i0[0_o );
  or \or_or_or_or_xor_i0[0  (\or_or_or_or_xor_i0[0_o , \or_or_or_xor_i0[0]_i_o , \or_or_or_xor_i0[9]_i_o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[4]_i1[4_o );
  or \or_or_or_xor_i0[9]_i  (\or_or_or_xor_i0[9]_i_o , \or_or_xor_i0[9]_i1[9_o , \or_or_xor_i0[14]_i1[_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[2]_i1[2]_o_o );
  or \or_or_xor_i0[14]_i1[  (\or_or_xor_i0[14]_i1[_o , \or_xor_i0[14]_i1[14]_o , \or_xor_i0[16]_i1[16]_o );
  or \or_or_xor_i0[4]_i1[4  (\or_or_xor_i0[4]_i1[4_o , \or_xor_i0[4]_i1[4]_o_o , \or_xor_i0[6]_i1[6]_o_o );
  or \or_or_xor_i0[9]_i1[9  (\or_or_xor_i0[9]_i1[9_o , \or_xor_i0[9]_i1[9]_o_o , \or_xor_i0[11]_i1[11]_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  or \or_xor_i0[11]_i1[11]  (\or_xor_i0[11]_i1[11]_o , \xor_i0[11]_i1[11]_o , \or_xor_i0[12]_i1[12]_o );
  or \or_xor_i0[12]_i1[12]  (\or_xor_i0[12]_i1[12]_o , \xor_i0[12]_i1[12]_o , \xor_i0[13]_i1[13]_o );
  or \or_xor_i0[14]_i1[14]  (\or_xor_i0[14]_i1[14]_o , \xor_i0[14]_i1[14]_o , \xor_i0[15]_i1[15]_o );
  or \or_xor_i0[16]_i1[16]  (\or_xor_i0[16]_i1[16]_o , \xor_i0[16]_i1[16]_o , \or_xor_i0[17]_i1[17]_o );
  or \or_xor_i0[17]_i1[17]  (\or_xor_i0[17]_i1[17]_o , \xor_i0[17]_i1[17]_o , \xor_i0[18]_i1[18]_o );
  or \or_xor_i0[2]_i1[2]_o  (\or_xor_i0[2]_i1[2]_o_o , \xor_i0[2]_i1[2]_o , \xor_i0[3]_i1[3]_o );
  or \or_xor_i0[4]_i1[4]_o  (\or_xor_i0[4]_i1[4]_o_o , \xor_i0[4]_i1[4]_o , \xor_i0[5]_i1[5]_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \or_xor_i0[7]_i1[7]_o_o );
  or \or_xor_i0[7]_i1[7]_o  (\or_xor_i0[7]_i1[7]_o_o , \xor_i0[7]_i1[7]_o , \xor_i0[8]_i1[8]_o );
  or \or_xor_i0[9]_i1[9]_o  (\or_xor_i0[9]_i1[9]_o_o , \xor_i0[9]_i1[9]_o , \xor_i0[10]_i1[10]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (\xor_i0[10]_i1[10]_o , i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (\xor_i0[11]_i1[11]_o , i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (\xor_i0[12]_i1[12]_o , i0[12], i1[12]);
  xor \xor_i0[13]_i1[13]  (\xor_i0[13]_i1[13]_o , i0[13], i1[13]);
  xor \xor_i0[14]_i1[14]  (\xor_i0[14]_i1[14]_o , i0[14], i1[14]);
  xor \xor_i0[15]_i1[15]  (\xor_i0[15]_i1[15]_o , i0[15], i1[15]);
  xor \xor_i0[16]_i1[16]  (\xor_i0[16]_i1[16]_o , i0[16], i1[16]);
  xor \xor_i0[17]_i1[17]  (\xor_i0[17]_i1[17]_o , i0[17], i1[17]);
  xor \xor_i0[18]_i1[18]  (\xor_i0[18]_i1[18]_o , i0[18], i1[18]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (\xor_i0[8]_i1[8]_o , i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (\xor_i0[9]_i1[9]_o , i0[9], i1[9]);

endmodule 

module binary_mux_s1_w1
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module add_pu4_pu4_o4
  (
  i0,
  i1,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  output [3:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_a3;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_b3;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_cout3;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;
  wire net_sum3;

  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));

endmodule 

module eq_w4
  (
  i0,
  i1,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  output o;

  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[2]_i1[2]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;

  not none_diff (o, \or_or_xor_i0[0]_i1[0_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[2]_i1[2]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  or \or_xor_i0[2]_i1[2]_o  (\or_xor_i0[2]_i1[2]_o_o , \xor_i0[2]_i1[2]_o , \xor_i0[3]_i1[3]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);

endmodule 

module reg_ar_ss_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire setout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(setout),
    .reset(reset),
    .set(1'b0),
    .q(q));
  AL_MUX u_set0 (
    .i0(enout),
    .i1(1'b1),
    .sel(set),
    .o(setout));

endmodule 

module AL_MUX
  (
  input i0,
  input i1,
  input sel,
  output o
  );

  wire not_sel, sel_i0, sel_i1;
  not u0 (not_sel, sel);
  and u1 (sel_i1, sel, i1);
  and u2 (sel_i0, not_sel, i0);
  or u3 (o, sel_i1, sel_i0);

endmodule

module AL_DFF
  (
  input reset,
  input set,
  input clk,
  input d,
  output reg q
  );

  parameter INI = 1'b0;

  always @(posedge reset or posedge set or posedge clk)
  begin
    if (reset)
      q <= 1'b0;
    else if (set)
      q <= 1'b1;
    else
      q <= d;
  end

endmodule

module AL_FADD
  (
  input a,
  input b,
  input c,
  output sum,
  output cout
  );

  wire prop;
  wire not_prop;
  wire sel_i0;
  wire sel_i1;

  xor u0 (prop, a, b);
  xor u1 (sum, prop, c);
  not u2 (not_prop, prop);
  and u3 (sel_i1, prop, c);
  and u4 (sel_i0, not_prop, a);
  or  u5 (cout, sel_i0, sel_i1);

endmodule

