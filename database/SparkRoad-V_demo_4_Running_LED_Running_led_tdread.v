// Verilog netlist created by TD v4.6.12906
// Thu Aug  8 16:54:13 2019

`timescale 1ns / 1ps
module running_led  // sources/rtl/running_led.v(14)
  (
  clk_24m,
  led
  );

  input clk_24m;  // sources/rtl/running_led.v(16)
  output [15:0] led;  // sources/rtl/running_led.v(17)

  parameter CNT = 25'b0101101110001101100000000;
  wire [24:0] cnt_time;  // sources/rtl/running_led.v(37)
  wire [24:0] n1;
  wire [24:0] n2;
  wire [15:0] n6;
  wire [15:0] n7;
  wire [15:0] n8;
  wire flag;  // sources/rtl/running_led.v(38)
  wire n0;
  wire n3;
  wire n4;
  wire n5;

  add_pu25_pu25_o25 add0 (
    .i0(cnt_time),
    .i1(25'b0000000000000000000000001),
    .o(n1));  // sources/rtl/running_led.v(46)
  eq_w25 eq0 (
    .i0(cnt_time),
    .i1(25'b0101101110001101011111111),
    .o(n0));  // sources/rtl/running_led.v(43)
  eq_w16 eq1 (
    .i0(led),
    .i1(16'b0000000000000000),
    .o(n5));  // sources/rtl/running_led.v(73)
  AL_DFF flag_reg (
    .clk(clk_24m),
    .d(n4),
    .reset(1'b0),
    .set(1'b0),
    .q(flag));  // sources/rtl/running_led.v(57)
  binary_mux_s1_w25 mux0 (
    .i0(n1),
    .i1(25'b0000000000000000000000000),
    .sel(n0),
    .o(n2));  // sources/rtl/running_led.v(46)
  binary_mux_s1_w16 mux1 (
    .i0({led[14:0],led[15]}),
    .i1({led[0],led[15:1]}),
    .sel(flag),
    .o(n6));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w16 mux2 (
    .i0(led),
    .i1(n6),
    .sel(n0),
    .o(n7));  // sources/rtl/running_led.v(83)
  binary_mux_s1_w16 mux3 (
    .i0(n7),
    .i1(16'b1111111111111110),
    .sel(n5),
    .o(n8));  // sources/rtl/running_led.v(83)
  reg_ar_as_w16 reg0 (
    .clk(clk_24m),
    .d(n8),
    .reset(16'b0000000000000000),
    .set(16'b0000000000000000),
    .q(led));  // sources/rtl/running_led.v(84)
  reg_ar_as_w25 reg1 (
    .clk(clk_24m),
    .d(n2),
    .reset(25'b0000000000000000000000000),
    .set(25'b0000000000000000000000000),
    .q(cnt_time));  // sources/rtl/running_led.v(47)
  AL_MUX u2 (
    .i0(1'b1),
    .i1(flag),
    .sel(led[15]),
    .o(n3));  // sources/rtl/running_led.v(56)
  AL_MUX u3 (
    .i0(1'b0),
    .i1(n3),
    .sel(led[0]),
    .o(n4));  // sources/rtl/running_led.v(56)
  rst_n ux_rst_n (
    .clk(clk_24m));  // sources/rtl/running_led.v(31)

endmodule 

module add_pu25_pu25_o25
  (
  i0,
  i1,
  o
  );

  input [24:0] i0;
  input [24:0] i1;
  output [24:0] o;



endmodule 

module eq_w25
  (
  i0,
  i1,
  o
  );

  input [24:0] i0;
  input [24:0] i1;
  output o;



endmodule 

module eq_w16
  (
  i0,
  i1,
  o
  );

  input [15:0] i0;
  input [15:0] i1;
  output o;



endmodule 

module binary_mux_s1_w25
  (
  i0,
  i1,
  sel,
  o
  );

  input [24:0] i0;
  input [24:0] i1;
  input sel;
  output [24:0] o;



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

module reg_ar_as_w25
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [24:0] d;
  input en;
  input [24:0] reset;
  input [24:0] set;
  output [24:0] q;



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

