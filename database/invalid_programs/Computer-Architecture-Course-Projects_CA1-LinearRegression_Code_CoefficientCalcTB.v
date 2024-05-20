// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "CoefficientCalcDriver.v"
`timescale 1ns / 1ns
`define clock_dur 50

module CoefficientCalc_TB ();

  reg [19:0] x_mem[0:149];
  reg [19:0] y_mem[0:149];
  reg en = 1'b1, clk = 1'b1, rst = 1'b1;
  reg [19:0] x_bus, y_bus;
  reg [7:0] counter = 8'b0;
  wire cout;

  wire coeff_done, coeff_ready;
  reg flag = 1'b0;
  wire [19:0] b0, b1;

  assign cout = (counter == 8'd149);

  CoefficientCalcDriver to_be_tested (
      .x_bus(x_bus),
      .y_bus(y_bus),
      .en(en),
      .cout(cout),
      .clk(clk),
      .rst(rst),
      .coeff_done(coeff_done),
      .coeff_ready(coeff_ready),
      .b1(b1),
      .b0(b0)
  );

  initial begin
    $readmemb("D:\\Uni\\Semester4\\Comp_Architucture\\CA\\CA1\\docs\\x_value.txt", x_mem);
    $readmemb("D:\\Uni\\Semester4\\Comp_Architucture\\CA\\CA1\\docs\\y_value.txt", y_mem);
    rst = 1'b1;
    #(`clock_dur * 2 * 1) rst = 1'b0;

    #(`clock_dur * 2 * 1) en = 1'b1;
    #(`clock_dur * 2 * 1) en = 1'b0;
    x_bus <= x_mem[counter];
    y_bus <= y_mem[counter];
    #(`clock_dur * 2 * 2);

    while (1'b1) begin
    #(`clock_dur * 2 * 1);
    x_bus <= x_mem[counter];
    y_bus <= y_mem[counter];

    if (coeff_ready) counter = (counter + 1'b1) % 8'd150;

    if (coeff_done) $stop;
    end
  end

  always begin
    #(`clock_dur) clk = ~clk;
  end

endmodule
