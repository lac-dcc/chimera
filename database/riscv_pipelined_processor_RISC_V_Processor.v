// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps

module RISC_V_Processor(input clk, input reset);
    wire [63:0] PC_In;
    wire [63:0] PC_Out;
    Program_Counter PC (clk, reset, PC_In, PC_Out);
    wire [63:0] PC_adder_out;
    Adder PC_ADD (PC_Out, 64'd4, PC_adder_out);
    
    wire [31:0] Instruction;
    Instruction_Memory IM (PC_Out, Instruction);
    
    wire [6:0] opcode;
    wire [4:0] rd, rs1, rs2;
    wire [2:0] funct3;
    wire [6:0] funct7;
    Rtype_parser IP (Instruction, opcode, rd, funct3, rs1, rs2, funct7);
    
    wire Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite;
    wire [1:0] ALUOp;
    Control_Unit CU (opcode, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, ALUOp);
    
    wire [63:0] WriteData, ReadData1, ReadData2;
    registerFile RF (WriteData, rs1, rs2, rd, RegWrite, clk, reset, ReadData1, ReadData2);

    wire [63:0] imm_data;
    imm_data_gen Imm_Gen (Instruction, imm_data);
    
    wire [63:0] op2;
    mux2to1 m2 (ReadData2, imm_data, ALUSrc, op2);
    
    wire [3:0] operation;
    ALU_Control ALU_CU (ALUOp, {Instruction[30], Instruction[14:12]}, operation);
    
    wire [63:0] branch_address;
    Adder Branch_Adder (PC_Out, imm_data[63:0], branch_address);
    
    wire [63:0] result;
    wire zero, lt;
    ALU_64_bit ALU (ReadData1, op2, operation, result, zero, lt);
    
    wire takeBranch = Branch & ((funct3[2] == 0 & zero) | (funct3[2] == 1 & lt));
    mux2to1 pc_mux (PC_adder_out, branch_address, takeBranch, PC_In);
    
    wire [63:0] Read_Data;
    Data_Memory DM (result, ReadData2, clk, MemWrite, MemRead, Read_Data);
    
    mux2to1 final_mux (result, Read_Data, MemToReg, WriteData);
    
endmodule
