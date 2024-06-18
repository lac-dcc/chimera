// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
    reg clk;
    reg rst;
    wire clk_0;
    wire clk_90;
    wire clk_180;
    wire clk_270;


clk_phase dut(clk, rst, clk_0, clk_90, clk_180, clk_270);

initial begin
clk = 0;
forever #1 clk = ~clk;
end
initial begin
rst = 1;
#5 rst = 0;

#50 $finish;

end
endmodule
