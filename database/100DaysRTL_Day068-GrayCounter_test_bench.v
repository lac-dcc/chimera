// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;

reg clk,reset;
wire [3:0] gray_count;

gray_counter dut(clk, reset, gray_count);

initial begin
clk= 1'b0;
forever #5 clk= ~clk;
end

initial begin
reset= 1'b1;
#10;
reset= 1'b0;
end

initial begin
$monitor("\t\t counter: %d", gray_count);
#175 $finish;
end
endmodule
