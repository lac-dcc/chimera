// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Fri Jul 26 17:43:03 2019

`timescale 1ns / 1ps
module buttons_led  // sources/rtl/buttons_led.v(15)
  (
  btn,
  clk_24m,
  led
  );

  input [4:0] btn;  // sources/rtl/buttons_led.v(22)
  input clk_24m;  // sources/rtl/buttons_led.v(21)
  output [15:0] led;  // sources/rtl/buttons_led.v(23)

  parameter CNT_20MS = 19'b1110101011000000001;
  parameter N = 5;
  wire [4:0] key_pulse;  // sources/rtl/buttons_led.v(27)
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
  wire rst_n;  // sources/rtl/buttons_led.v(26)

  binary_mux_s1_w4 mux0 (
    .i0(led[15:12]),
    .i1(n5),
    .sel(key_pulse[4]),
    .o(n6));  // sources/rtl/buttons_led.v(63)
  binary_mux_s1_w7 mux1 (
    .i0({n6,led[11:9]}),
    .i1({led[15:12],n4}),
    .sel(key_pulse[3]),
    .o(n7));  // sources/rtl/buttons_led.v(63)
  binary_mux_s1_w10 mux2 (
    .i0({n7,led[8:6]}),
    .i1({led[15:9],n3}),
    .sel(key_pulse[2]),
    .o(n8));  // sources/rtl/buttons_led.v(63)
  binary_mux_s1_w16 mux3 (
    .i0({n9,led[2:0]}),
    .i1({led[15:3],n1}),
    .sel(key_pulse[0]),
    .o(n10));  // sources/rtl/buttons_led.v(63)
  binary_mux_s1_w13 mux4 (
    .i0({n8,led[5:3]}),
    .i1({led[15:6],n2}),
    .sel(key_pulse[1]),
    .o(n9));  // sources/rtl/buttons_led.v(63)
  reg_ar_as_w16 reg0 (
    .clk(clk_24m),
    .d(n10),
    .reset(16'b0000000000000000),
    .set({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .q(led));  // sources/rtl/buttons_led.v(63)
  not u0 (n4[1], led[10]);  // sources/rtl/buttons_led.v(59)
  not u1 (n5[3], led[15]);  // sources/rtl/buttons_led.v(61)
  not u10 (n4[2], led[11]);  // sources/rtl/buttons_led.v(59)
  not u11 (n3[1], led[7]);  // sources/rtl/buttons_led.v(57)
  not u12 (n3[2], led[8]);  // sources/rtl/buttons_led.v(57)
  not u13 (n2[1], led[4]);  // sources/rtl/buttons_led.v(55)
  not u14 (n2[2], led[5]);  // sources/rtl/buttons_led.v(55)
  not u15 (n1[1], led[1]);  // sources/rtl/buttons_led.v(53)
  not u16 (n1[2], led[2]);  // sources/rtl/buttons_led.v(53)
  not u2 (n5[2], led[14]);  // sources/rtl/buttons_led.v(61)
  not u3 (n5[1], led[13]);  // sources/rtl/buttons_led.v(61)
  not u4 (n5[0], led[12]);  // sources/rtl/buttons_led.v(61)
  not u5 (n0, rst_n);  // sources/rtl/buttons_led.v(50)
  not u6 (n1[0], led[0]);  // sources/rtl/buttons_led.v(53)
  not u7 (n2[0], led[3]);  // sources/rtl/buttons_led.v(55)
  not u8 (n3[0], led[6]);  // sources/rtl/buttons_led.v(57)
  not u9 (n4[0], led[9]);  // sources/rtl/buttons_led.v(59)
  \debounce(N=5)  ux_btn (
    .clk(clk_24m),
    .key(btn),
    .rst_n(rst_n),
    .key_pulse(key_pulse));  // sources/rtl/buttons_led.v(34)
  rst_n ux_rst (
    .clk(clk_24m),
    .rst_n(rst_n));  // sources/rtl/buttons_led.v(42)

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

module \debounce(N=5)   // sources/rtl/debounce.v(14)
  (
  clk,
  key,
  rst_n,
  key_pulse
  );

  input clk;  // sources/rtl/debounce.v(20)
  input [4:0] key;  // sources/rtl/debounce.v(23)
  input rst_n;  // sources/rtl/debounce.v(21)
  output [4:0] key_pulse;  // sources/rtl/debounce.v(24)

  parameter CNT_20MS = 19'b1110101011000000001;
  parameter N = 5;
  wire [18:0] cnt;  // sources/rtl/debounce.v(27)
  wire [4:0] key_sec;  // sources/rtl/debounce.v(40)
  wire [4:0] key_sec_pre;  // sources/rtl/debounce.v(39)
  wire [18:0] n2;
  wire [18:0] n3;
  wire [4:0] n4;
  wire [4:0] n5;
  wire n0;
  wire n1;

  add_pu19_pu19_o19 add0 (
    .i0(cnt),
    .i1(19'b0000000000000000001),
    .o(n2));  // sources/rtl/debounce.v(36)
  eq_w19 eq0 (
    .i0(cnt),
    .i1(19'b1110101011000000001),
    .o(n1));  // sources/rtl/debounce.v(33)
  binary_mux_s1_w19 mux0 (
    .i0(n2),
    .i1(19'b0000000000000000000),
    .sel(n1),
    .o(n3));  // sources/rtl/debounce.v(36)
  binary_mux_s1_w5 mux1 (
    .i0(key_sec),
    .i1(key),
    .sel(n1),
    .o(n4));  // sources/rtl/debounce.v(47)
  reg_ar_as_w5 reg0 (
    .clk(clk),
    .d(key_sec),
    .reset(5'b00000),
    .set({n0,n0,n0,n0,n0}),
    .q(key_sec_pre));  // sources/rtl/debounce.v(55)
  reg_ar_as_w19 reg1 (
    .clk(clk),
    .d(n3),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(19'b0000000000000000000),
    .q(cnt));  // sources/rtl/debounce.v(36)
  reg_ar_as_w5 reg2 (
    .clk(clk),
    .d(n4),
    .reset(5'b00000),
    .set({n0,n0,n0,n0,n0}),
    .q(key_sec));  // sources/rtl/debounce.v(47)
  and u10 (key_pulse[4], n5[4], key_sec_pre[4]);  // sources/rtl/debounce.v(58)
  and u11 (key_pulse[0], n5[0], key_sec_pre[0]);  // sources/rtl/debounce.v(58)
  not u12 (n5[0], key_sec[0]);  // sources/rtl/debounce.v(58)
  not u2 (n5[4], key_sec[4]);  // sources/rtl/debounce.v(58)
  not u3 (n5[3], key_sec[3]);  // sources/rtl/debounce.v(58)
  not u4 (n5[2], key_sec[2]);  // sources/rtl/debounce.v(58)
  not u5 (n0, rst_n);  // sources/rtl/debounce.v(31)
  and u6 (key_pulse[3], n5[3], key_sec_pre[3]);  // sources/rtl/debounce.v(58)
  not u7 (n5[1], key_sec[1]);  // sources/rtl/debounce.v(58)
  and u8 (key_pulse[2], n5[2], key_sec_pre[2]);  // sources/rtl/debounce.v(58)
  and u9 (key_pulse[1], n5[1], key_sec_pre[1]);  // sources/rtl/debounce.v(58)

endmodule 

module rst_n  // sources/rtl/rst.v(14)
  (
  clk,
  rst_n
  );

  input clk;  // sources/rtl/rst.v(16)
  output rst_n;  // sources/rtl/rst.v(17)

  wire [3:0] cnt;  // sources/rtl/rst.v(20)
  wire [3:0] n1;
  wire [3:0] n2;
  wire n0;

  add_pu4_pu4_o4 add0 (
    .i0(cnt),
    .i1(4'b0001),
    .o(n1));  // sources/rtl/rst.v(27)
  eq_w4 eq0 (
    .i0(cnt),
    .i1(4'b1111),
    .o(n0));  // sources/rtl/rst.v(24)
  binary_mux_s1_w4 mux0 (
    .i0(n1),
    .i1(4'b1111),
    .sel(n0),
    .o(n2));  // sources/rtl/rst.v(27)
  reg_ar_as_w4 reg0 (
    .clk(clk),
    .d(n2),
    .reset(4'b0000),
    .set(4'b0000),
    .q(cnt));  // sources/rtl/rst.v(28)
  AL_DFF rst_n_reg (
    .clk(clk),
    .d(n0),
    .reset(1'b0),
    .set(1'b0),
    .q(rst_n));  // sources/rtl/rst.v(36)

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

