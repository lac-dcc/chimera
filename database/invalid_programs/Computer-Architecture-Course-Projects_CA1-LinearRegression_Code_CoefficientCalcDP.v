// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "inner_modules/Adder.v"
`include "inner_modules/Divide.v"
`include "inner_modules/Multiplier.v"
`include "inner_modules/MUX.v"
`include "inner_modules/Register.v"

module CoefficientCalcDP (
    x_bus,
    y_bus,
    clk,
    rst,
    sel1,
    sel2,
    sel3,
    sel4,
    sel5,
    mean_x_ld,
    mean_y_ld,
    sum_xx_ld,
    sum_xy_ld,
    b0_ld,
    b1_ld,
    b0,
    b1
);

  input [19:0] x_bus, y_bus;
  input clk, rst, sel1, sel2, sel3, sel4, sel5, mean_x_ld, mean_y_ld, sum_xx_ld, sum_xy_ld, b0_ld, b1_ld;

  output [19:0] b0, b1;

  wire [47:0] div1_out;
  wire [19:0] mean_x, mean_y;
  wire [19:0] adder1_in2;
  wire [47:0] adder1_in1, adder1_out;
  wire [19:0] mul1_in2;
  wire [39:0] mul1_out;
  wire [47:0] sum_xx, sum_xy;
  wire [47:0] adder2_in1, adder2_out;
  wire [47:0] selected_sum_in;
  wire [19:0] mul3_in2;
  wire [79:0] mul3_out;
  wire [39:0] mul2_out;
  wire [47:0] adder3_in2, adder3_out;
  wire [47:0] div2_out;
  wire [39:0] mul4_out;
  wire [19:0] adder4_out;
  wire [47:0] sum_x, sum_y;
  wire [47:0] selected_mean_sum;

  assign mean_x = sum_x[19:0];
  assign mean_y = sum_y[19:0];

  MUX #(.word_len(20), .input_size(2), .sel_len(1)) mux_1_2to1 (.mux_in({x_bus, y_bus}), .sel(sel1), .mux_out(adder1_in2));
  MUX #(.word_len(48), .input_size(2), .sel_len(1)) mux_2_2to1 (.mux_in({sum_x, sum_y}), .sel(sel1), .mux_out(adder1_in1));
  MUX #(.word_len(48), .input_size(2), .sel_len(1)) mux_8_2to1 (.mux_in({div1_out, adder1_out}), .sel(sel5), .mux_out(selected_mean_sum));

  MUX #(.word_len(20), .input_size(2), .sel_len(1)) mux_3_2to1 (.mux_in({x_bus, y_bus}), .sel(sel2), .mux_out(mul1_in2));
  MUX #(.word_len(48), .input_size(2), .sel_len(1)) mux_4_2to1 (.mux_in({sum_xx, sum_xy}), .sel(sel2), .mux_out(adder2_in1));
  MUX #(.word_len(48), .input_size(2), .sel_len(1)) mux_5_2to1 (.mux_in({adder2_out, adder3_out}), .sel(sel3), .mux_out(selected_sum_in));
  MUX #(.word_len(20), .input_size(2), .sel_len(1)) mux_6_2to1 (.mux_in({mean_x, mean_y}), .sel(sel4), .mux_out(mul3_in2));
  MUX #(.word_len(48), .input_size(2), .sel_len(1)) mux_7_2to1 (.mux_in({sum_xx, sum_xy}), .sel(sel4), .mux_out(adder3_in2));

  Divide #(.word_len(48)) div1 (.dividend(adder1_in1), .divisor(48'd150), .result(div1_out));

  Divide #(.word_len(48)) div2 (.dividend(sum_xy), .divisor(sum_xx), .result(div2_out));

  Adder #(.word_len(48)) adder1 (.in1(adder1_in1), .in2({28'b0, adder1_in2}), .cin(1'b0), .result(adder1_out));

  Adder #(.word_len(48)) adder2 (.in1(adder2_in1), .in2({8'b0, mul1_out}), .cin(1'b0), .result(adder2_out));
  Adder #(.word_len(48)) adder3 (.in1(~mul3_out[63:16]), .in2(adder3_in2), .cin(1'b1), .result(adder3_out));

  Adder #(.word_len(20)) adder4 (.in1(~mul4_out[29:10]), .in2(mean_y), .cin(1'b1), .result(adder4_out));

  Multiplier #(.word_len(20)) mul1 (.in1(x_bus), .in2(mul1_in2), .result(mul1_out));
  Multiplier #(.word_len(20)) mul2 (.in1(mean_x), .in2(20'd150), .result(mul2_out));
  Multiplier #(.word_len(40)) mul3 (.in1(mul2_out), .in2({20'b0, mul3_in2}), .result(mul3_out));

  Multiplier #(.word_len(20)) mul4 (.in1(b1), .in2(mean_x), .result(mul4_out));

  Register #(.word_len(48)) mean_x_reg (.par_in(selected_mean_sum), .clk(clk), .rst(rst), .load_en(mean_x_ld), .par_out(sum_x));
  Register #(.word_len(48)) mean_y_reg (.par_in(selected_mean_sum), .clk(clk), .rst(rst), .load_en(mean_y_ld), .par_out(sum_y));

  Register #(.word_len(48)) sum_xx_reg (.par_in(selected_sum_in), .clk(clk), .rst(rst), .load_en(sum_xx_ld), .par_out(sum_xx));
  Register #(.word_len(48)) sum_xy_reg (.par_in(selected_sum_in), .clk(clk), .rst(rst), .load_en(sum_xy_ld), .par_out(sum_xy));

  Register #(.word_len(20)) b1_reg (.par_in({div2_out[9:0], 10'b0}), .clk(clk), .rst(rst), .load_en(b1_ld), .par_out(b1));
  Register #(.word_len(20)) b0_reg (.par_in(adder4_out), .clk(clk), .rst(rst), .load_en(b0_ld), .par_out(b0));

endmodule
