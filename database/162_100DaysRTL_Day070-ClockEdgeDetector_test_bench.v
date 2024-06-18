// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg clk, temp_clk;
wire posedge_detect, negedge_detect, dualedge_detect;

clk_edge_detector dut(clk, temp_clk, posedge_detect, negedge_detect, dualedge_detect);

initial begin 
clk= 1'b0;
temp_clk= 1'b0;
end

initial forever #5 clk<= ~clk;
initial forever #5.5 temp_clk<= ~temp_clk;

initial begin
$monitor("clock: %b  posedge: %b  negedge: %b  dualedge: %b", clk, posedge_detect, negedge_detect, dualedge_detect);
#30 $finish;
end
endmodule
