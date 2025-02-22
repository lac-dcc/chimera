// This program was cloned from: https://github.com/FPGADude/Digital-Design
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Authored by David J. Marion aka FPGA Dude
// Created on 4/13/2022
//
// Description: simple alu
//////////////////////////////////////////////////////////////////////////////////
module alu #(parameter W = 32)(
    input       [1:0] opcode,
    input       [W-1:0] operand_A,
    input       [W-1:0] operand_B,
    output reg  [W-1:0] alu_result,
    output      [2:0] flags
    );
    
    wire N, Z, C;
    wire [W:0] carry_check;
    
    always @* begin
        case(opcode)
            2'b00 : alu_result = operand_A + operand_B; // add
            2'b01 : alu_result = operand_A - operand_B; // sub
            2'b10 : alu_result = operand_A & operand_B; // AND
            2'b11 : alu_result = operand_A | operand_B; // OR
        endcase
    end
    
    assign carry_check = operand_A + operand_B;
    assign N = alu_result[W-1];
    assign Z = ~|alu_result;
    assign C = carry_check[W];  
    assign flags = {N, Z, C};
      
endmodule
