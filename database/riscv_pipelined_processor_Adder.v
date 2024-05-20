// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps


module Adder(
    input [63:0] a,b,
    output wire [63:0] out
    );
    assign out = a + b;
endmodule
