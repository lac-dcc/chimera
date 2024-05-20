// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench_ha;
  reg a, b;
  wire sout, cout;
  reg clk;

  ha_nand dut(a, b, sout, cout);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    a = 0; b = 0;
    #10;
    a = 0; b = 1;
    #10;
    a = 1; b = 0;
    #10;
    a = 1; b = 1;
    #10;
    $finish;
  end
  
  always @(posedge clk) begin
    $display("a = %b, b = %b, sum = %b, carry = %b", a, b, sout, cout);
  end
endmodule
