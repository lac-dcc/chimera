// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 06:39:43 PM
// Design Name: 
// Module Name: Control_Unit_Top
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


`include "ALU_Decoder.v"
`include "Main_Decoder.v"

module Control_Unit_Top(Op,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,funct3,funct7,ALUControl);

    input [6:0]Op,funct7;
    input [2:0]funct3;
    
    output RegWrite, ALUSrc, MemWrite, ResultSrc, Branch;
    output [1:0]ImmSrc;
    output [5:0]ALUControl;
    
     parameter R_ADD_op = 7'b0110011;   //ADD  => OP => 0110011 => R-TYPE

    wire [1:0]ALUOp;
    
    Main_Decoder Main_Decoder(
                .Op(Op),
                .RegWrite(RegWrite),
                .ImmSrc(ImmSrc),
                .MemWrite(MemWrite),
                .ResultSrc(ResultSrc),
                .Branch(Branch),
                .ALUSrc(ALUSrc),
                .ALUOp(ALUOp)
    );

    ALU_Decoder ALU_Decoder(
                 .ALUOp(ALUOp),
                 .funct3(funct3),
                 .funct7(funct7),
                 .op(Op),
                 .ALUControl(ALUControl)
    );


endmodule