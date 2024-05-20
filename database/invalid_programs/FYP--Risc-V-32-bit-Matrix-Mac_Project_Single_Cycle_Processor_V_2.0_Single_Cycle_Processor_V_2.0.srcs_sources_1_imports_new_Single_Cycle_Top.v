// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 05:31:02 PM
// Design Name: 
// Module Name: Single_Cycle_Top
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


`include "Program_Counter.v"
`include "Instruction_Memory.v"
`include "Register_File.v"
`include "Sign_Extend.v"
`include "ALU.v"
`include "Control_Unit_Top.v"
`include "Data_Memory.v"
`include "PC_Adder.v"
`include "MUX_2_by_1.v"

 
module Single_Cycle_Top(
    input clk,rst,
//    input [31:0] memoryinstr,
    output reg [31:0] OUT,
    output carry, zero, overflow, negative
    );
    
    wire [31:0] PC_Top;//connecting PC with A(address register) of memory
    wire [31:0] RD_Instr;//connecting Instruction memory output(RD) with register file input A1
    wire [31:0] RD1_Top, RD2_Top;
    wire [31:0] Imm_Ext_Top;
    wire [5:0] ALUControl_Top;
    wire [31:0] ALU_Result, ReadData, PCPlus4, Src_B, Result;
    wire RegWrite, MEM_Write, ALU_Src, ResultSrc, Branch_Top;  
    wire [1:0] ImmSrc_Top ;
    
    Program_Counter PC( //instentiating Program Counter
        .clk(clk),
        .rst(rst),
        .PC(PC_Top),
        .PC_Next(PCPlus4)
    );
    
    PC_Adder PC_Adder(
        .curr_address(PC_Top),
        .branch(Branch_Top),
        .ALU_Out(Result),
        .offset(Imm_Ext_Top),
        .next_address(PCPlus4)
        
    );
    
    Instruction_Memory  Instruction_Memory(
        .rst(rst),
        .A(PC_Top),
        .RD(RD_Instr)
    );
    
    Register_File Register_File(
        .clk(clk),
        .rst(rst),
        .WE3(RegWrite),
        .WD3(Result),
        .A1(RD_Instr[19:15]),
        .A2(RD_Instr[24:20]),
        .A3(RD_Instr[11:7]),
        .RD1(RD1_Top),
        .RD2(RD2_Top)
    
    );
    
    Sign_Extend Sign_Extend(
        .In(RD_Instr),
        .ImmSrc(ImmSrc_Top),
        .Imm_Ext(Imm_Ext_Top)
    );
    
    MUX_2_by_1 Mux_RegisterFile_to_ALU(
        .a(RD2_Top),
        .b(Imm_Ext_Top),
        .s(ALU_Src),
        .c(Src_B)
    );
    
    ALU ALU(
       .A(RD1_Top), 
       .B(Src_B),       // ALU 32-bit Inputs                 
       .ALU_Sel(ALUControl_Top),        // ALU Selection
       .ALU_Out(ALU_Result),            // ALU 32-bit Output
       .CarryOut(carry),           // Carry Out Flag
       .Zero(zero),               // Zero Flag
       .Negative(negative),           // Negative Flag
       .Overflow(overflow)            // Overflow Flag
    );
    
    // Updating the architecture by my own logic
    // adding a demuc that checks if its a branch instruction,
    // transfer the alu out/result to the PC adder, else transfer it to data memory
    
    
    
    
    //
    
    
     Control_Unit_Top Control_Unit_Top(
        .Op(RD_Instr[6:0]),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc_Top),
        .ALUSrc(ALU_Src),
        .MemWrite(MEM_Write),
        .ResultSrc(ResultSrc),
        .Branch(Branch_Top),
        .funct3(RD_Instr[14:12]),
        .funct7(RD_Instr[31:25]),//masla here
        .ALUControl(ALUControl_Top)
     );

    Data_Memory Data_Memory(
        .clk(clk),
        .rst(rst),
        .WD(RD2_Top),        //data to store in memory or read it from memory
        .A(ALU_Result),
        .WE(MEM_Write),      //write enable
        .RD(ReadData)        //read the address A data onto RD, read wxisting data basically

    );
    
        MUX_2_by_1 Mux_Data_Memory_to_RegisterFile(
             .a(ALU_Result),
             .b(ReadData),
             .s(ResultSrc),
             .c(Result)
         );
           
        always @(*)
        begin
            OUT = ALU_Result ;
        end
        //assign memoryinstr = RD_Instr;
    
endmodule











