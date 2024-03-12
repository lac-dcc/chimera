// Verilog netlist created by TD v4.6.12906
// Tue Jul 23 18:36:54 2019

`timescale 1ns / 1ps
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

