// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
  reg a, b, cin;
  wire sum, carry;

  full_adder dut(a, b, cin, sum, carry);

  initial begin

    a = 0; b = 0; cin = 0;
    #10;
    a = 0; b = 0; cin = 1;
    #10;
    a = 0; b = 1; cin = 0;
    #10;
    a = 0; b = 1; cin = 1;
    #10;
    a = 1; b = 0; cin = 0;
    #10;
    a = 1; b = 0; cin = 1;
    #10;
    a = 1; b = 1; cin = 0;
    #10;
    a = 1; b = 1; cin = 1;
    #10;
  end
  
    initial begin
    $monitor("a = %b, b = %b, cin = %b, sum = %b, carry = %b", a, b, cin, sum, carry);
    #80 $finish;
  end
endmodule

