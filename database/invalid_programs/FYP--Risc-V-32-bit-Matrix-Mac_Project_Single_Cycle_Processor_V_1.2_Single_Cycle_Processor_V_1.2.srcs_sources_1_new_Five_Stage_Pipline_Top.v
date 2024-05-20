// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2023 05:09:23 PM
// Design Name: 
// Module Name: Five_Stage_Pipline_Top
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
`include "Data_Memory.v"

`include "Fetch_Cycle.v"
`include "Decode_Cycle.v"
`include "Execute_Cycle.v"
`include "Memory_Cycle.v"
`include "WriteBack_Cycle.v"




module Five_Stage_Pipline_Top(
        input clk, rst
    );
    
    
    //declartion of interm wires
    wire PCSrcE, RegWriteW, RegWriteE, ALUSrcE, MemWriteE, ResultSrcE, BranchE, RegWriteM, MemWriteM, ResultSrcM, ResultSrcW  ;
    wire [4:0]  RDW, RD_M,  RD_E;
    wire [5:0]  ALUControlE;
    wire [31:0] PCTargetE, InstrD, PCD, PCPlus4D, ResultW, RD1_E, RD2_E,Imm_Ext_E, PCE, PCPlus4E, PCPlus4M, WriteDataM, ALU_ResultM      ;
    wire [31:0] PCPlus4W, ALUResultW, ReadDataW ;
    wire [4:0] RS1_E, RS2_E; 
    wire [1:0] ForwardBE, ForwardAE;
    
    //Module Instentiation
    
    
    Fetch_Cycle Fetch(
        .clk(clk), 
        .rst(rst), 
        
        /*.Branch(PCSrcE),*/
        .ALU_Out(ResultW), 
        /*.Offset(),*/
        
        .PCSrcE(PCSrcE),
        .PCTargetE(PCTargetE), 
        .InstrD(InstrD), 
        .PCD(PCD), 
        .PCPlus4D(PCPlus4D) 
      );
    
    
    
      Decode_Cycle Decode(
          .clk(clk), 
          .rst(rst), 
          .RegWriteW(RegWriteW), 
          .RDW(RDW), 
          .InstrD(InstrD), 
          .PCD(PCD), 
          .PCPlus4D(PCPlus4D), 
          .ResultW(ResultW),

          .RegWriteE(RegWriteE),
          .ALUSrcE(ALUSrcE),
          .MemWriteE(MemWriteE),
          .ResultSrcE(ResultSrcE),
          .BranchE(BranchE),
          .ALUControlE(ALUControlE),
          .RD1_E(RD1_E), 
          .RD2_E(RD2_E), 
          .Imm_Ext_E(Imm_Ext_E),
          .RS1_E(RS1_E), 
          .RS2_E(RS2_E), 
          .RD_E(RD_E),
          .PCE(PCE), 
          .PCPlus4E(PCPlus4E)
      );
              
      
      Execute_Cycle Execute(
          .clk(clk),
          .rst(rst),
          .RegWriteE(RegWriteE ), 
          .ALUSrcE(ALUSrcE), 
          .MemWriteE(MemWriteE), 
          .ResultSrcE(ResultSrcE), 
          .BranchE(BranchE),
          
          .ALUControlE(ALUControlE),
          .RD1_E(RD1_E), 
          .RD2_E(RD2_E), 
          .Imm_Ext_E(Imm_Ext_E),
          .RS1_E(), 
          .RS2_E(), 
          .RD_E(RD_E),
          .PCE(PCE), 
          .PCPlus4E(PCPlus4E),
          .ResultW(ResultW),
          .ForwardA_E(ForwardAE),
          .ForwardB_E(ForwardBE),
          
          .PCSrcE(PCSrcE), 
          .MemWriteM(MemWriteM), 
          .RegWriteM(RegWriteM), 
          .ResultSrcM(ResultSrcM),
          .RD_M(RD_M),
          .PCTargetE(PCTargetE), 
          .ALU_ResultM(ALU_ResultM), 
          .PCPlus4M(PCPlus4M), 
          .WriteDataM(WriteDataM)
      
      );
    
        Memory_Cycle Memory(
            .clk(clk), 
            .rst(rst),
            .MemWriteM(MemWriteM), 
            .RegWriteM(RegWriteM), 
            .ResultSrcM(ResultSrcM),
            .RD_M(RD_M),
            .PCTargetE(PCTargetE), 
            .ALU_ResultM(ALU_ResultM), 
            .PCPlus4M(PCPlus4M), 
            .WriteDataM(WriteDataM),
            
            .RegWriteW(RegWriteW), 
            .ResultSrcW(ResultSrcW),
            .RD_W(RDW),
            .PCPlus4W(PCPlus4W), 
            .ALUResultW(ALUResultW), 
            .ReadDataW(ReadDataW)
    );
    
    WriteBack_Cycle WriteBack(
        .clk(clk), 
        .rst(rst), 
        .ResultSrcW(ResultSrcW),
        .PCPlus4W(PCPlus4W), 
        .ALU_ResultW(ALUResultW), 
        .ReadDataW(ReadDataW),
        
        .ResultW(ResultW)
        );

    //hazard unit
    Hazard_Unit Forwarding_Block(
        .clk(clk), 
        .rst(rst), 
        .RegWriteM(RegWriteM), 
        .RegWriteW(RegWriteW), 
        .RD_M(RD_M), 
        .RD_W(RDW), 
        .RS1_E(RS1_E), 
        .RS2_E(RS2_E),
        
        .ForwardAE(ForwardAE), 
        .ForwardBE(ForwardBE)
        
        );


endmodule


































