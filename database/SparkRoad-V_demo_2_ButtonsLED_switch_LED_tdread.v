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
  wire [15:0] n10;
  wire [2:0] n2;
  wire [2:0] n3;
  wire [2:0] n4;
  wire [3:0] n5;
  wire [3:0] n6;
  wire [6:0] n7;
  wire [9:0] n8;
  wire [12:0] n9;
  wire n0;
  wire rst_n;  // Buttons_LED.v(21)

  binary_mux_s1_w4 mux0 (
    .i0(led[15:12]),
    .i1(n5),
    .sel(key_pulse[4]),
    .o(n6));  // Buttons_LED.v(54)
  binary_mux_s1_w7 mux1 (
    .i0({n6,led[11:9]}),
    .i1({led[15:12],n4}),
    .sel(key_pulse[3]),
    .o(n7));  // Buttons_LED.v(54)
  binary_mux_s1_w10 mux2 (
    .i0({n7,led[8:6]}),
    .i1({led[15:9],n3}),
    .sel(key_pulse[2]),
    .o(n8));  // Buttons_LED.v(54)
  binary_mux_s1_w16 mux3 (
    .i0({n9,led[2:0]}),
    .i1({led[15:3],n1}),
    .sel(key_pulse[0]),
    .o(n10));  // Buttons_LED.v(54)
  binary_mux_s1_w13 mux4 (
    .i0({n8,led[5:3]}),
    .i1({led[15:6],n2}),
    .sel(key_pulse[1]),
    .o(n9));  // Buttons_LED.v(54)
  reg_ar_as_w16 reg0 (
    .clk(clk_24M),
    .d(n10),
    .reset(16'b0000000000000000),
    .set({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .q(led));  // Buttons_LED.v(54)
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
  not u5 (n0, rst_n);  // Buttons_LED.v(40)
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

module binary_mux_s1_w4
  (
  i0,
  i1,
  sel,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  input sel;
  output [3:0] o;



endmodule 

module binary_mux_s1_w7
  (
  i0,
  i1,
  sel,
  o
  );

  input [6:0] i0;
  input [6:0] i1;
  input sel;
  output [6:0] o;



endmodule 

module binary_mux_s1_w10
  (
  i0,
  i1,
  sel,
  o
  );

  input [9:0] i0;
  input [9:0] i1;
  input sel;
  output [9:0] o;



endmodule 

module binary_mux_s1_w16
  (
  i0,
  i1,
  sel,
  o
  );

  input [15:0] i0;
  input [15:0] i1;
  input sel;
  output [15:0] o;



endmodule 

module binary_mux_s1_w13
  (
  i0,
  i1,
  sel,
  o
  );

  input [12:0] i0;
  input [12:0] i1;
  input sel;
  output [12:0] o;



endmodule 

module reg_ar_as_w16
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [15:0] d;
  input en;
  input [15:0] reset;
  input [15:0] set;
  output [15:0] q;



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
  wire [4:0] n7;
  wire n1;
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
  binary_mux_s1_w19 mux0 (
    .i0(n3),
    .i1(19'b0000000000000000000),
    .sel(n2),
    .o(n4));  // debounce.v(42)
  binary_mux_s1_w5 mux1 (
    .i0(key_sec),
    .i1(key),
    .sel(n6),
    .o(n7));  // debounce.v(55)
  reg_ar_as_w5 reg0 (
    .clk(clk),
    .d(key_rst),
    .reset(5'b00000),
    .set({n1,n1,n1,n1,n1}),
    .q(key_rst_pre));  // debounce.v(27)
  reg_ar_as_w19 reg1 (
    .clk(clk),
    .d(n4),
    .reset({n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1}),
    .set(19'b0000000000000000000),
    .q(cnt));  // debounce.v(42)
  reg_ar_as_w5 reg2 (
    .clk(clk),
    .d(n7),
    .reset(5'b00000),
    .set({n1,n1,n1,n1,n1}),
    .q(key_sec));  // debounce.v(55)
  reg_ar_as_w5 reg3 (
    .clk(clk),
    .d(key_sec),
    .reset(5'b00000),
    .set({n1,n1,n1,n1,n1}),
    .q(key_sec_pre));  // debounce.v(62)
  reg_ar_as_w5 reg4 (
    .clk(clk),
    .d(key),
    .reset(5'b00000),
    .set({n1,n1,n1,n1,n1}),
    .q(key_rst));  // debounce.v(27)
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
  not u5 (n1, rst);  // debounce.v(20)
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
  wire [3:0] n2;
  wire n0;

  add_pu4_pu4_o4 add0 (
    .i0(counter),
    .i1(4'b0001),
    .o(n1));  // rst.v(22)
  eq_w4 eq0 (
    .i0(counter),
    .i1(4'b1111),
    .o(n0));  // rst.v(19)
  binary_mux_s1_w4 mux0 (
    .i0(n1),
    .i1(4'b1111),
    .sel(n0),
    .o(n2));  // rst.v(22)
  reg_ar_as_w4 reg0 (
    .clk(sclk),
    .d(n2),
    .reset(4'b0000),
    .set(4'b0000),
    .q(counter));  // rst.v(23)
  AL_DFF rst_n_reg (
    .clk(sclk),
    .d(n0),
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



endmodule 

module binary_mux_s1_w19
  (
  i0,
  i1,
  sel,
  o
  );

  input [18:0] i0;
  input [18:0] i1;
  input sel;
  output [18:0] o;



endmodule 

module binary_mux_s1_w5
  (
  i0,
  i1,
  sel,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  input sel;
  output [4:0] o;



endmodule 

module reg_ar_as_w5
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [4:0] d;
  input en;
  input [4:0] reset;
  input [4:0] set;
  output [4:0] q;



endmodule 

module reg_ar_as_w19
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [18:0] d;
  input en;
  input [18:0] reset;
  input [18:0] set;
  output [18:0] q;



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



endmodule 

module reg_ar_as_w4
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [3:0] d;
  input en;
  input [3:0] reset;
  input [3:0] set;
  output [3:0] q;



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

