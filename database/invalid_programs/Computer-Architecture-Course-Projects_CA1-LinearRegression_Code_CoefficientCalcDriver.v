// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "CoefficientCalcDP.v"
`include "CoefficientCalcController.v"

module CoefficientCalcDriver (
    x_bus,
    y_bus,
    en,
    cout,
    clk,
    rst,
    coeff_done,
    coeff_ready,
    b1,
    b0
);

  input [19:0] x_bus, y_bus;
  input en, cout, clk, rst;
  output coeff_done, coeff_ready;
  output [19:0] b0, b1;

  wire sel1, sl2, sel3, sel4, sel5, mean_x_ld, mean_y_ld, sum_xx_ld, sum_xy_ld, b0_ld, b1_ld;

  CoefficientCalcDP data_path (
      .x_bus(x_bus),
      .y_bus(y_bus),
      .clk(clk),
      .rst(rst),
      .sel1(sel1),
      .sel2(sel2),
      .sel3(sel3),
      .sel4(sel4),
      .sel5(sel5),
      .mean_x_ld(mean_x_ld),
      .mean_y_ld(mean_y_ld),
      .sum_xx_ld(sum_xx_ld),
      .sum_xy_ld(sum_xy_ld),
      .b0_ld(b0_ld),
      .b1_ld(b1_ld),
      .b0(b0),
      .b1(b1)
  );
  
  CoefficientCalcController controller (
      .en(en),
      .cout(cout),
      .clk(clk),
      .rst(rst),
      .coeff_ready(coeff_ready),
      .coeff_done(coeff_done),
      .sel1(sel1),
      .sel2(sel2),
      .sel3(sel3),
      .sel4(sel4),
      .sel5(sel5),
      .mean_x_ld(mean_x_ld),
      .mean_y_ld(mean_y_ld),
      .sum_xx_ld(sum_xx_ld),
      .sum_xy_ld(sum_xy_ld),
      .b1_ld(b1_ld),
      .b0_ld(b0_ld)
  );
endmodule
