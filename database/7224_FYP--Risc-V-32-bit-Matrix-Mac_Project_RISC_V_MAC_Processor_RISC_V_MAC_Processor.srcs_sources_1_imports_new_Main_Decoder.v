// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2023 06:31:09 PM
// Design Name: 
// Module Name: Main_Decoder
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

//correctly working, every instruction checked on testbench

module Main_Decoder( Op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc,Branch, ALUOp/*, RegDst*/);
    
    input [6:0]Op;
    
    output RegWrite, ALUSrc, MemWrite, ResultSrc, Branch;
    output [1:0] ImmSrc,ALUOp;
//    output RegDst;
     // I-Type Basic Instructions => SLLI, SRLI, SRAI, ADDI, LI ETC => OP => 0010011
     // parameter I_ADDI_op = 7'b0010011;   //ADDI  => OP => 0010011 => I-TYPE
     parameter I_op_basic = 7'b0010011;   //ADDI  => OP => 0010011 => I-TYPE
          
     parameter I_lw_op = 7'b0000011;     //LW    => OP => 0000011 => I-TYPE
                                             
    // R-type Instructions: => ADD, SUB, AND, OR, XOR, SLL, SRL, SLT => SAME OPCODE => 0110011
     parameter R_op_basic = 7'b0110011;  
                                         
    //S-TYPE INSTRUCTIONS                
     parameter S_sw_op = 7'b0100011;     //SW    => OP => 0100011 => S-TYPE
     
    //B-TYPE INSTRUCTIONS
     parameter B_op_basic = 7'b1100011;  //BEQ = BNE = BLT = BGE => OP => 1100011 SAME OP CODE
     
     //MATRUX-TYPE INSTRUCTIONS
     parameter MAC_OPCODE = 7'b1110111;  //LOAD A, LOAD B, CLR A, CLR B, CLR R, CLR ALL, MAC MULTIPLY, MAC ADD, MAC SUB, SUB MAC, STORE R

    assign RegWrite     = ( Op == R_op_basic | Op == I_lw_op | Op == I_op_basic ) ? 1'b1 : 1'b0;
    assign ResultSrc    = ( Op == I_lw_op )   ? 1'b1 : 1'b0 ;
    assign MemWrite     = ( Op == S_sw_op )   ? 1'b1 : 1'b0 ;
    assign Branch       = ( Op == B_op_basic ) ? 1'b1 : 1'b0 ;
    assign ALUOp        = ( Op == R_op_basic | Op == MAC_OPCODE ) ? 2'b10: ( Op == B_op_basic ) ? 2'b01 : 2'b00 ;
    assign ALUSrc       = ( (Op == I_lw_op | Op == S_sw_op | Op == I_op_basic) & Op != MAC_OPCODE ) ? 1'b1 : 1'b0;
    assign ImmSrc       = ( Op == S_sw_op ) ? 2'b01 : ( Op == B_op_basic ) ? 2'b10 : 2'b00;    
    
//    assign RegDst       = ( Op == R_op_basic || Op == I_op_basic) ? 1'b1 : 1'b0 ;


endmodule
