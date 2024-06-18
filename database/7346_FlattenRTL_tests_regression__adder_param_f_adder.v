// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module Adder #(
 parameter WIDTH =8,
 parameter SHIFT =0) (
  input [WIDTH-1:0] a,
  input [WIDTH-1:0] b,
  output [WIDTH-1+SHIFT:0] sum) ; 
  assign sum=(a+b)<<SHIFT; 
endmodule
 
module TopModule (
  input [7:0] a1,
  input [7:0] b1,
  input [15:0] a2,
  input [15:0] b2,
  output [7:0] sum1,
  output [15+1:0] sum2) ; 
  Adder #(.WIDTH(8),.SHIFT(0))adder1(.a(a1),.b(b1),.sum(sum1)); 
  Adder #(.WIDTH(16),.SHIFT(1))adder2(.a(a2),.b(b2),.sum(sum2)); 
endmodule
 
