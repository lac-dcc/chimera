// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench_fs;
reg a, b, bin;
  wire diff, bout;
  reg clk;

  fs_nand dut(a, b, bin, diff, bout);
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    a = 0; b = 0; bin = 0;
    #10;
    a = 0; b = 0; bin = 1;
    #10;
    a = 0; b = 1; bin = 0;
    #10;
    a = 0; b = 1; bin = 1;
    #10;
    a = 1; b = 0; bin = 0;
    #10;
    a = 1; b = 0; bin = 1;
    #10;
    a = 1; b = 1; bin = 0;
    #10;
    a = 1; b = 1; bin = 1;
    #10;
    $finish;
  end

  always @(posedge clk) begin
    $display("a: %b, b: %b, bin: %b, difference: %b, borrow: %b", a, b, bin, diff, bout);
  end
endmodule
