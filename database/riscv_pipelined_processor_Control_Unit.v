// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps

module Control_Unit(
    input [6:0] Opcode,
    output reg Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite,
    output reg [1:0] ALUOp
    );
    always @(*)
    begin
        if (Opcode == 7'b0110011) //RType
            begin
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= 2'b10;
            end
        if (Opcode == 7'b0000011) //IType 
            begin
            ALUSrc <= 1;
            MemToReg <= 1;
            RegWrite <= 1;
            MemRead <= 1;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= 2'b00;
            end
        if (Opcode == 7'b0100011) //SType
            begin
            ALUSrc <= 1;
            MemToReg <= 1'bx;
            RegWrite <= 0;
            MemRead <= 0;
            MemWrite <= 1;
            Branch <= 0;
            ALUOp <= 2'b00;
            end
        if (Opcode == 7'b1100011) //SBType - beq/blt
            begin
            ALUSrc <= 0;
            MemToReg <= 1'bx;
            RegWrite <= 0;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 1;
            ALUOp <= 2'b01;
            end
        if (Opcode == 7'b0010011) // addi/sll
            begin
            ALUSrc <= 1;
            MemToReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= 2'b11;
            end
        if (Opcode == 7'b0000000) // NOP
            begin
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 0;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= 2'b00;
            end
    end
endmodule
