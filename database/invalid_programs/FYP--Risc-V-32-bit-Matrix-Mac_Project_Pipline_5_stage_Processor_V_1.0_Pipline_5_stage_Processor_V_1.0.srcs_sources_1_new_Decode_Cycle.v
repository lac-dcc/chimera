// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2023 06:16:16 PM
// Design Name: 
// Module Name: Decode_Cycle
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
`include "Control_Unit_Top.v"
`include "Register_File.v"
`include "Sign_Extend.v"
`include "Adder.v"

module Decode_Cycle(
    input clk, rst, EN ,RegWriteW, 
    input [4:0] RDW, 
    input [31:0] InstrD, PCD, PCPlus4D, ALUResultM, ResultW,
    
    output RegWriteE,ALUSrcE,MemWriteE,ResultSrcE,BranchE,
    output [5:0] ALUControlE,
    output [31:0] RD1_E, RD2_E, Imm_Ext_E,
    output [4:0] RS1_E, RS2_E, RD_E,
    output [31:0] PCE, PCPlus4E
    );
    
    wire RegWriteD, ALUSrcD, MemWriteD, ResultSrcD, BranchD ;
    wire [1:0] ImmSrcD;
    wire [5:0] ALUControlD;
    wire [31:0] RD1_D, RD2_D, Imm_Ext_D;
    
    //Declaring output registers of Decode_Cycle
    reg RegWriteD_r, ALUSrcD_r, MemWriteD_r, ResultSrcD_r, BranchD_r;
    reg [2:0] ALUControlD_r;
    reg [31:0] RD1_D_r, RD2_D_r, Imm_Ext_D_r;
    reg [4:0] RD_D_r, RS1_D_r, RS2_D_r;
    reg [31:0] PCD_r, PCPlus4D_r, PCBranchD;
    
    //initiating modules control unit top
    Control_Unit_Top Control_Unit_Fetch_Cycle(
                .Op(InstrD[6:0]),
                .funct3(InstrD[14:12]),
                .funct7(InstrD[31:25]),
                
                .RegWrite(RegWriteD),
                .ImmSrc(ImmSrcD),
                .ALUSrc(ALUSrcD),
                .MemWrite(MemWriteD),
                .ResultSrc(ResultSrcD),
                .Branch(BranchD),
                .ALUControl(ALUControlD)
       );
    
      Register_File Register_File(
               .clk(clk),
               .rst(rst),
               .A1(InstrD[19:15]),
               .A2(InstrD[24:20]),
               .A3(RDW),
               .WD3(ResultW),
               .WE3(RegWriteW),
               
               .RD1(RD1_D),
               .RD2(RD2_D)
       );
       
       
       Sign_Extend Sign_Extend(
            .In(InstrD[31:0]),
            .ImmSrc(ImmSrcD),
            .Imm_Ext(Imm_Ext_D)
       );
       
       Adder Deocde_Adder(
        .A(Imm_Ext_D),
        .B(PCPlus4D),
        .Sum(PCBranchD),
        .Carry_Out()
       );
       

     // Declaring Register Logic
    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            RegWriteD_r         <= 1'b0;
            ALUSrcD_r           <= 1'b0;
            MemWriteD_r         <= 1'b0;
            ResultSrcD_r        <= 1'b0;
            BranchD_r           <= 1'b0;
            ALUControlD_r       <= 3'b000;
            RD1_D_r             <= 32'h00000000; 
            RD2_D_r             <= 32'h00000000; 
            Imm_Ext_D_r         <= 32'h00000000;
            RD_D_r              <= 5'h00;
            PCD_r               <= 32'h00000000; 
            PCPlus4D_r          <= 32'h00000000;
            RS1_D_r             <= 5'h00;
            RS2_D_r             <= 5'h00;
        end
        else begin
            RegWriteD_r         <= RegWriteD;
            ALUSrcD_r           <= ALUSrcD;
            MemWriteD_r         <= MemWriteD;
            ResultSrcD_r        <= ResultSrcD;
            BranchD_r           <= BranchD;
            ALUControlD_r       <= ALUControlD;
            RD1_D_r             <= RD1_D; 
            RD2_D_r             <= RD2_D; 
            Imm_Ext_D_r         <= Imm_Ext_D;
            RD_D_r              <= InstrD[11:7];
            PCD_r               <= PCD; 
            PCPlus4D_r          <= PCPlus4D;
            RS1_D_r             <= InstrD[19:15];
            RS2_D_r             <= InstrD[24:20];
        end
    end
    
        // Output asssign statements
        assign RegWriteE        = RegWriteD_r;
        assign ALUSrcE          = ALUSrcD_r;
        assign MemWriteE        = MemWriteD_r;
        assign ResultSrcE       = ResultSrcD_r;
        assign BranchE          = BranchD_r;
        assign ALUControlE      = ALUControlD_r;
        assign RD1_E            = RD1_D_r;
        assign RD2_E            = RD2_D_r;
        assign Imm_Ext_E        = Imm_Ext_D_r;
        assign RD_E             = RD_D_r;
        assign PCE              = PCD_r;
        assign PCPlus4E         = PCPlus4D_r;
        assign RS1_E            = RS1_D_r;
        assign RS2_E            = RS2_D_r;




endmodule








