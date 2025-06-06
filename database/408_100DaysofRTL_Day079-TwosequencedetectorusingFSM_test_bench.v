// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg din,clk,reset;
wire y;

fsm_101_0110 dut(din,clk,reset,y);

initial begin
clk= 1'b0;
forever #5 clk= ~clk;
end

initial begin
reset= 1'b1;
#10 reset= 1'b0;
#5 din= 1'b0;
#10 din= 1'b1;
#10 din= 1'b1;
#10 din= 1'b0;
#10 din= 1'b1;
#10 din= 1'b1;
#10 din= 1'b0;
#10 din= 1'b0;
#10 din= 1'b1;
#10 din= 1'b0;
#10 din= 1'b1;
#10 din= 1'b0;
#10 din= 1'b1;
#10 din= 1'b1;
#10 din= 1'b0;
end

initial begin
$monitor("\t\t clock: %d  input: %d   detect: %d",clk, din, y);
#180 $finish;
end
endmodule

