// This program was cloned from: https://github.com/jrbuchanan02/multicycle-rv32i
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2023 10:21:37 AM
// Design Name: 
// Module Name: alu_controller
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

module alu_controller(alu_mode, func3, func7, alu_op, b_cond_val);
    parameter OLEN = 4;
    
    parameter [1:0] alu_mode_add = 0;
    parameter [1:0] alu_mode_cmp = 1;
    parameter [1:0] alu_mode_fun = 2;
    parameter [1:0] alu_mode_fn3 = 3;
    
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
    
    parameter [1:0] b_cond_zero = 0;
    parameter [1:0] b_cond_notz = 1;
    parameter [1:0] b_cond_less = 2;
    parameter [1:0] b_cond_notl = 3;
    
    input [1:0] alu_mode;
    input [2:0] func3;
    input [6:0] func7;
    output[OLEN - 1:0] alu_op;
    output[1:0] b_cond_val;
    
    function [OLEN - 1:0] op_from_func;
        input [2:0] func3;
        input [6:0] func7;
        input make_subtraction_impossible;
    begin
        case (func3)
        3'b000: op_from_func = (func7[5] && !make_subtraction_impossible) ? op_sub : op_add;
        3'b001: op_from_func = op_sl;
        3'b010: op_from_func = op_slt;
        3'b011: op_from_func = opsltu;
        3'b100: op_from_func = op_xor;
        3'b101: op_from_func = func7[5] ? op_sra : op_srl;
        3'b110: op_from_func = op_or;
        3'b111: op_from_func = op_and;
        endcase
    end
    endfunction
    
    
    function [OLEN - 1:0] branch_from_func;
        input [2:0] func3;
    begin
        casez(func3[2:1])
        2'b0?: branch_from_func = op_sub;
        2'b10: branch_from_func = op_slt;
        2'b11: branch_from_func = opsltu;
        endcase
    end
    endfunction
    
    function [2:0] b_cond_from_func;
        input [2:0] func3;
    begin
        case ({func3[2], func3[0]})
        2'b00: b_cond_from_func = b_cond_zero; // func 000 or 010
        2'b01: b_cond_from_func = b_cond_notz; // func 001 or 011
        2'b10: b_cond_from_func = b_cond_less; // func 100 or 110
        2'b11: b_cond_from_func = b_cond_notl; // func 101 or 111
        endcase
    end
    endfunction
    
    assign alu_op = alu_mode == alu_mode_add ? op_add :
                    alu_mode == alu_mode_cmp ? branch_from_func(func3) :
                    alu_mode == alu_mode_fun ? op_from_func(func3, func7, 0) :
                    /*alu_mode == alu_mode_fn3 ?*/ op_from_func(func3, func7, 1);
    assign b_cond_val = b_cond_from_func(func3); // only needs to make sense when branching
endmodule
