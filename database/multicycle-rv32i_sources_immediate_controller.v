// This program was cloned from: https://github.com/jrbuchanan02/multicycle-rv32i
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2023 09:50:41 AM
// Design Name: 
// Module Name: immediate_controller
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


module immediate_controller(instruction, imm_fmt, immediate);
    parameter XLEN = 32;
    
    input [XLEN - 1:0] instruction;
    input [2:0] imm_fmt;
    output[XLEN - 1:0] immediate;
    
    parameter [2:0] i_type = 0;
    parameter [2:0] s_type = 1;
    parameter [2:0] b_type = 2;
    parameter [2:0] u_type = 3;
    parameter [2:0] j_type = 4;
    parameter [XLEN - 1:0] default_value = 'hxxxxxxxx;
    
    wire [XLEN - 1:0] i_immediate;
    wire [XLEN - 1:0] s_immediate;
    wire [XLEN - 1:0] b_immediate;
    wire [XLEN - 1:0] u_immediate;
    wire [XLEN - 1:0] j_immediate;
    // DISCLAIMER: RISC-V immediate encoding variants make me much angrier than they
    // should.
    sign_extender extend_i(.value(instruction[31:20]),
                           .extended(i_immediate));
    sign_extender extend_s(.value({instruction[31:25], instruction[11:7]}),
                           .extended(s_immediate));
    // "Instead of shifting all bits in the instruction-encoded
    //  immediate left by one in hardware as is conventionally done, the middle bits (imm[10:1]) and sign
    //  bit stay in fixed positions, while the lowest bit in S format (inst[7]) encodes a high-order bit in B
    //  format."
    // In normal English: instead of performing an unconditional shift left by one in hardware and
    // using a multiplexer to select which immediate value we want, we decided to frick up the 
    // instruction format. Unconditional shifts by constant amounts in hardware incur no logic 
    // delay. SINCE THIS MEANS THE IMMEDIATE CONTROLLER IS MORE COMPLICATED, THIS DECISION NEEDLESSLY
    // MAKES THE INSTRUCTION SET MORE COMPLICATED.
    sign_extender extend_b(.value({instruction[31], instruction[7], instruction[30:25], instruction[11:8]}),
                           .extended(b_immediate));
    assign u_immediate = instruction[31:12] << 12;
    // "The location of instruction
    // bits in the U and J format immediates is chosen to maximize overlap with the other formats and
    // with each other."
    // "Maximize overlap" MY ASS. you literally say j-type is a variant of u-type.
    sign_extender extend_j(.value({instruction[31], instruction[19:12], instruction[20], instruction[30:21]}),
                           .extended(j_immediate));
    defparam extend_i.VLEN = 12;
    defparam extend_i.XLEN = 32;
    defparam extend_s.VLEN = 12;
    defparam extend_s.XLEN = 32;
    defparam extend_b.VLEN = 12;
    defparam extend_b.XLEN = 32;
    defparam extend_j.VLEN = 20;
    defparam extend_j.XLEN = 32;
    
    assign immediate = imm_fmt == i_type ? i_immediate << 0 :
                       imm_fmt == s_type ? s_immediate << 0 :
                       imm_fmt == b_type ? b_immediate << 1 :
                       imm_fmt == u_type ? u_immediate << 0 :
                       imm_fmt == j_type ? j_immediate << 1 : default_value;
endmodule
