// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
  reg [7:0]in;
  wire [2:0]out;
  
  priority_encoder dut(in, out);
  
  always
  begin
  in= $random;
  #10;
  end
  initial 
     begin $monitor("in: %b  out: %b",in, out);
     #100 $finish;
     end
endmodule
