// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns / 1ps

module _16bit_tb;
  reg clk, rst;
  reg [15:0] i;
  wire [15:0] o;

  _16bit uut (
    .clk(clk),
    .rst(rst),
    .i(i),
    .o(o)
  );

  always begin
    clk = ~clk;
    #5;
  end

  initial begin
    $dumpfile("16bit_tb.vcd");
    $dumpvars(0, _16bit_tb);

    clk <= 0;
    rst <= 1;
    i <= 16'b0000_0000_0000_0000;
    #10 rst <= 0;
    #10 i <= 16'b0000_0000_0000_0001;
    #10 i <= 16'b0000_0000_0000_0010;
    #10 i <= 16'b0000_0000_0000_0100;
    #10 $finish;
  end

  initial begin
    $monitor("clk=%b, rst=%b, i=%16b, o=%16b", clk, rst, i, o);
  end

endmodule