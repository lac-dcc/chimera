// Verilog netlist created by TD v4.6.12906
// Fri Jul 26 16:32:54 2019

`timescale 1ns / 1ps
module rgb_led  // sources/rtl/rgb_led.v(14)
  (
  clk_24m,
  led_b,
  led_g,
  led_r
  );

  input clk_24m;  // sources/rtl/rgb_led.v(15)
  output led_b;  // sources/rtl/rgb_led.v(18)
  output led_g;  // sources/rtl/rgb_led.v(17)
  output led_r;  // sources/rtl/rgb_led.v(16)

  parameter CNT = 24000000;
  wire [24:0] cnt_time;  // sources/rtl/rgb_led.v(31)
  wire [2:0] led_rgb;  // sources/rtl/rgb_led.v(22)
  wire [24:0] n2;
  wire [24:0] n3;
  wire [2:0] n4;
  wire n0;
  wire n1;
  wire rst_n;  // sources/rtl/rgb_led.v(21)

  add_pu25_pu25_o25 add0 (
    .i0(cnt_time),
    .i1(25'b0000000000000000000000001),
    .o(n2));  // sources/rtl/rgb_led.v(40)
  eq_w25 eq0 (
    .i0(cnt_time),
    .i1(25'b1011011100011010111111111),
    .o(n1));  // sources/rtl/rgb_led.v(37)
  binary_mux_s1_w25 mux0 (
    .i0(n2),
    .i1(25'b0000000000000000000000000),
    .sel(n1),
    .o(n3));  // sources/rtl/rgb_led.v(40)
  binary_mux_s1_w3 mux1 (
    .i0(led_rgb),
    .i1({led_rgb[0],led_rgb[2:1]}),
    .sel(n1),
    .o(n4));  // sources/rtl/rgb_led.v(50)
  reg_ar_as_w25 reg0 (
    .clk(clk_24m),
    .d(n3),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(25'b0000000000000000000000000),
    .q(cnt_time));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w3 reg1 (
    .clk(clk_24m),
    .d(n4),
    .reset({1'b0,n0,1'b0}),
    .set({n0,1'b0,n0}),
    .q(led_rgb));  // sources/rtl/rgb_led.v(50)
  not u2 (n0, rst_n);  // sources/rtl/rgb_led.v(35)
  buf u3 (led_r, led_rgb[0]);  // sources/rtl/rgb_led.v(53)
  buf u4 (led_g, led_rgb[1]);  // sources/rtl/rgb_led.v(54)
  buf u5 (led_b, led_rgb[2]);  // sources/rtl/rgb_led.v(55)
  rst_n ux_rst_n (
    .sclk(clk_24m),
    .rst_n(rst_n));  // sources/rtl/rgb_led.v(24)

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

module binary_mux_s1_w3
  (
  i0,
  i1,
  sel,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  input sel;
  output [2:0] o;



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

module reg_ar_as_w3
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [2:0] d;
  input en;
  input [2:0] reset;
  input [2:0] set;
  output [2:0] q;



endmodule 

module rst_n  // sources/rtl/rst.v(9)
  (
  sclk,
  rst_n
  );

  input sclk;  // sources/rtl/rst.v(11)
  output rst_n;  // sources/rtl/rst.v(12)

  wire [3:0] counter;  // sources/rtl/rst.v(15)
  wire [3:0] n1;
  wire [3:0] n2;
  wire n0;

  add_pu4_pu4_o4 add0 (
    .i0(counter),
    .i1(4'b0001),
    .o(n1));  // sources/rtl/rst.v(22)
  eq_w4 eq0 (
    .i0(counter),
    .i1(4'b1111),
    .o(n0));  // sources/rtl/rst.v(19)
  binary_mux_s1_w4 mux0 (
    .i0(n1),
    .i1(4'b1111),
    .sel(n0),
    .o(n2));  // sources/rtl/rst.v(22)
  reg_ar_as_w4 reg0 (
    .clk(sclk),
    .d(n2),
    .reset(4'b0000),
    .set(4'b0000),
    .q(counter));  // sources/rtl/rst.v(23)
  AL_DFF rst_n_reg (
    .clk(sclk),
    .d(n0),
    .reset(1'b0),
    .set(1'b0),
    .q(rst_n));  // sources/rtl/rst.v(31)

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

