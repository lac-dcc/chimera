// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
    reg in;
    wire out;
    not_gate dut(in, out);
    initial in= 1'b0;
    initial forever #50 in = ~in;
    initial #600 $finish;
endmodule
