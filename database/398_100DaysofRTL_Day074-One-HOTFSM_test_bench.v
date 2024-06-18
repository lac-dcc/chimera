// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;

reg clk, reset;
wire [3:0] state;
wire [1:0] out;

one_hot_fsm dut(clk, reset, state, out);

initial begin
  clk = 0;
  forever #10 clk = ~clk;
end 

initial begin
  reset = 1;
  #20 reset = 0;
end 

initial begin
  $monitor("\t\t State: %b   Output: %b", state, out);
  #170 $finish;
end
endmodule
