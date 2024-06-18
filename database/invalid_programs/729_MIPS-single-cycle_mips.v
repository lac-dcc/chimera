// This program was cloned from: https://github.com/the-pinbo/MIPS-single-cycle
// License: MIT License

`include "datapath.v"
`include "control.v"

module mips(input clk, input reset);
//main cpu module

    wire [5:0] OpCode;
    wire [1:0] ALUOp;
    wire RegDst;
    wire ALUSrc;
    wire MemToReg;
    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire Branch;

    datapath Datapath(clk,reset,RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,OpCode);
    control Control(OpCode,RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,ALUOp); 

endmodule
