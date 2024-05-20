// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps

module Rtype_parser(input [31:0] instruction, output [6:0] opcode, output [4:0] rd, output [2:0] funct3, output [4:0] rs1, output [4:0] rs2, output [6:0] funct7);
    assign funct7 = instruction [31:25];
    assign rs2 = instruction [24:20];
    assign rs1 = instruction [19:15];
    assign funct3 = instruction [14:12];
    assign rd = instruction [11:7];
    assign opcode = instruction [6:0];
endmodule
