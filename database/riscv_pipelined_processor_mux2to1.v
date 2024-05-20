// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps

module mux2to1(input [63:0] a, input [63:0] b, input data_out, output reg [63:0] o);
always @(*)
    case (data_out)
        0: o = a;
        1: o = b;
    endcase
endmodule
