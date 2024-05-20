// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg clk, reset;
wire new_clk;

freq_div dut(clk, reset, new_clk);

initial begin
clk= 1'b0;
forever #10 clk= ~clk;
end
initial begin
reset= 1'b1;
#20
reset= 1'b0;
#200 $finish;
end
endmodule
