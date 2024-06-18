// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg din,clk,reset;
wire y;

fsm_1011 dut(clk,reset,din,y);

initial begin
clk= 1'b0;
forever #5 clk= ~clk;
end

initial begin
reset= 1'b1;
#10 reset= 1'b0;
#5 din= 1'b0;
#10 din= 1'b1;
#10 din= 1'b0;
#10 din= 1'b1;
#10 din= 1'b1;
#10 din= 1'b0;
#10 din= 1'b1;
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
#160 $finish;
end
endmodule
