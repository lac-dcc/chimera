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

module Control_Unit_Top( 
    input [6:0]Op,funct7,
    input [2:0]funct3,
    input MAC_OP,       //different than MAC_OP, MAC_OP is a signal which only tells if its a matrix instruction or not
    input [1:0] MACOP,  //whereas MACOP tells which type of matrix instruction it is: load, clear, operation or store
        
    output RegWrite, ALUSrc, MemWrite, ResultSrc, Branch,
    output [1:0] ImmSrc,
    output [5:0] ALUControl,
    output [3:0] MACControl,
    output [1:0] MACDM
    );
//    output RegDst;
    
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
//                .RegDst(RegDst)
    );

    ALU_Decoder ALU_Decoder(
                 .ALUOp(ALUOp),
                 .funct3(funct3),
                 .funct7(funct7),
                 .op(Op),
                 .ALUControl(ALUControl)
    );
    
    MAC_Decoder MAC_Decoder(
//                .OP(Op),
                .funct3(funct3),
                .MAC_OP(MAC_OP),
                .MACOP(MACOP),
                
                .MACControl(MACControl),
                .MACDM(MACDM)
    );
    
endmodule