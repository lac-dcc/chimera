// This program was cloned from: https://github.com/zephray/RISu064
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none
//
// RISu64
// Copyright 2022 Wenting Zhang
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
`include "defines.vh"

module alu(
    input wire [3:0] op,
    input wire option,
    input wire [63:0] operand1,
    input wire [63:0] operand2,
    output wire [63:0] result
);

    // Shifter
    // TODO: Maybe implement slower shifter option
    wire [63:0] lshifter_result;
    wire [63:0] rshifter_result;
    wire [63:0] shinput = operand1;
    wire [5:0] shamt = operand2[5:0];
    
    wire [63:0] lshifter_1;
    wire [63:0] lshifter_2;
    wire [63:0] lshifter_4;
    wire [63:0] lshifter_8;
    wire [63:0] lshifter_16;

    assign lshifter_1 = shamt[0] ? {shinput[62:0], 1'b0} : shinput;
    assign lshifter_2 = shamt[1] ? {lshifter_1[61:0], 2'b0} : lshifter_1;
    assign lshifter_4 = shamt[2] ? {lshifter_2[59:0], 4'b0} : lshifter_2;
    assign lshifter_8 = shamt[3] ? {lshifter_4[55:0], 8'b0} : lshifter_4;
    assign lshifter_16 = shamt[4] ? {lshifter_8[47:0], 16'b0} : lshifter_8;
    assign lshifter_result = shamt[5] ? {lshifter_16[31:0], 32'b0} : lshifter_16;

    wire rsh_sign = (shinput[31] && (option == `ALUOPT_SRA));
    wire [63:0] rshifter_1;
    wire [63:0] rshifter_2;
    wire [63:0] rshifter_4;
    wire [63:0] rshifter_8;
    wire [63:0] rshifter_16;

    assign rshifter_1 = shamt[0] ? {rsh_sign, shinput[63:1]} : shinput;
    assign rshifter_2 = shamt[1] ? {{2{rsh_sign}}, rshifter_1[63:2]} : rshifter_1;
    assign rshifter_4 = shamt[2] ? {{4{rsh_sign}}, rshifter_2[63:4]} : rshifter_2;
    assign rshifter_8 = shamt[3] ? {{8{rsh_sign}}, rshifter_4[63:8]} : rshifter_4;
    assign rshifter_16 = shamt[4] ? {{16{rsh_sign}}, rshifter_8[63:16]} : rshifter_8;
    assign rshifter_result = shamt[5] ? {{32{rsh_sign}}, rshifter_16[63:32]} : rshifter_16;

    wire [63:0] sub_result = operand1 - operand2;
    assign result =
        ((op == `ALU_ADDSUB) && (option == `ALUOPT_ADD)) ?
            (operand1 + operand2) :
        ((op == `ALU_ADDSUB) && (option == `ALUOPT_SUB)) ?
            (sub_result) :
        (op == `ALU_SLL) ?
            (lshifter_result) :
        (op == `ALU_SLT) ?
            (((operand1[63] != operand2[63]) ?
                {63'd0, operand1[63]} : {63'd0, sub_result[63]})) :
        (op == `ALU_SLTU) ?
            ((operand1 < operand2) ? 64'd1 : 64'd0) :
        (op == `ALU_XOR) ?
            (operand1 ^ operand2) :
        (op == `ALU_SR) ?
            (rshifter_result) :
        (op == `ALU_OR) ?
            (operand1 | operand2) :
        (op == `ALU_AND) ?
            (operand1 & operand2) :
        (op == `ALU_EQ) ?
            ((operand1 == operand2) ? 64'd1 : 64'd0) : 64'b0;

endmodule
