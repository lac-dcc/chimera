// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps

module ID_EX(input clk, 
input wire MemToReg, input wire RegWrite,
input wire Branch, input wire MemWrite, input wire MemRead,
input wire [1:0] ALUOp, input wire ALUSrc,  
input wire [63:0] PC_In, input wire [63:0] imm_data, input wire [63:0] ReadData1, input wire [63:0] ReadData2, 
input wire [4:0] RS1, input wire [4:0] RS2, input wire [4:0] RD, input wire [3:0] Funct, 

output reg memtoreg, output reg regwrite,
output reg branch, output reg memwrite, output reg memread,
output reg [1:0] aluop, output reg alusrc,

output reg [63:0] BranchA, output reg [63:0] BranchB,

output reg [63:0] readdata1, readdata2,

output reg [4:0] rs1, output reg [4:0] rs2, output reg [4:0] rd, output reg [3:0] funct);

initial
begin
    memtoreg <= 0;
    regwrite <= 0;
    branch <= 0;
    memwrite <= 0;
    memread <= 0;
    aluop <= 0;
    alusrc <= 0;
end

always @(posedge clk)
begin
    memtoreg <= MemToReg;
    regwrite <= RegWrite;
    branch <= Branch;
    memwrite <= MemWrite;
    memread <= MemRead;
    aluop <= ALUOp;
    alusrc <= ALUSrc;
    BranchA <= PC_In;
    BranchB <= imm_data;
    readdata1 <= ReadData1;
    readdata2 <= ReadData2;
    rs1 <= RS1;
    rs2 <= RS2;
    rd <= RD;
    funct <= Funct;
end
endmodule