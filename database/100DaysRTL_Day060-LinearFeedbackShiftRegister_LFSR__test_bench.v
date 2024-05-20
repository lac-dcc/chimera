// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg clk, reset;
wire [7:0] lfsr_out;

lfsr dut(clk, reset, lfsr_out);

initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
end
always #5 clk = ~clk;
initial begin 
$monitor("\t\t clk: %b   lfsr_out: %b", clk, lfsr_out);
#115 $finish;
end 
endmodule
