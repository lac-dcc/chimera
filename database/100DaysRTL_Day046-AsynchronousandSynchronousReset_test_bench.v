// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg clk, rst, in;
wire out_async,out_sync;

synchronous_asynchronous_reset dut(clk, rst, in, out_async, out_sync);

initial begin
clk= 0; rst= 0; in= 1;
end

initial forever #130 clk<= ~clk;

initial forever #450 rst<= ~rst;

initial forever #400 in<= ~in;

initial #6000 $stop;

endmodule
