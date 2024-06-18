// This program was cloned from: https://github.com/jrbuchanan02/multicycle-rv32i
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2023 08:56:53 AM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(operation, zero, result, lhs, rhs);
    parameter XLEN = 32;
    parameter SHIFT_BITS = 5;
    parameter OLEN = 4;
    
    input [OLEN - 1:0] operation;
    input [XLEN - 1:0]  lhs;
    input [XLEN - 1:0]  rhs;
    output[XLEN - 1:0]  result;
    output              zero;
    
    parameter [OLEN - 1:0] op_add = 0;
    parameter [OLEN - 1:0] op_sub = 1;
    parameter [OLEN - 1:0] op_slt = 2;
    parameter [OLEN - 1:0] opsltu = 3;
    parameter [OLEN - 1:0] op_and = 4;
    parameter [OLEN - 1:0] op_or  = 5;
    parameter [OLEN - 1:0] op_xor = 6;
    parameter [OLEN - 1:0] op_sl  = 7;
    parameter [OLEN - 1:0] op_srl = 8;
    parameter [OLEN - 1:0] op_sra = 9;
    
    wire [XLEN-1:0] adder_res;
    wire adder_lts, adder_ltu;
    
    adder#(.XLEN(XLEN)) a(.lhs(lhs),
                          .rhs(rhs),
                          .sub(operation != op_add && operation != op_xor),
                          .actually_xor(operation == op_xor),
                          .lts(adder_lts),
                          .ltu(adder_ltu),
                          .res(adder_res));

    assign result = operation == op_add ? adder_res :
                    operation == op_sub ? adder_res :
                    operation == op_slt ? {{XLEN-1{1'b0}}, adder_lts} :
                    operation == opsltu ? {{XLEN-1{1'b0}}, adder_ltu} :
                    operation == op_and ? lhs & rhs :
                    operation == op_or  ? lhs | rhs :
                    operation == op_xor ? adder_res :
                    operation == op_sl  ? lhs << rhs:
                    operation == op_srl ? lhs >> rhs:
                    /*operation == op_sra ? */ lhs >>>rhs;
    assign zero   = result == 0;
    
endmodule
