// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2023 04:37:21 PM
// Design Name: 
// Module Name: Memory_Cycle
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

`include "Data_Memory.v"

module Memory_Cycle(
    input clk, rst,
    input  MemWriteM, RegWriteM, ResultSrcM,
    input  [4:0]  RD_M,
    input  [31:0] PCTargetE, ALU_ResultM, PCPlus4M, WriteDataM,
    
    output RegWriteW, ResultSrcW,
    output [4:0] RD_W,
    output [31:0] PCPlus4W, ALUResultW, ReadDataW    
    );
    
    
    //wire
    wire [31:0] ReadDataM;
    
    
    
    //output registers
      reg  RegWriteM_r, ResultSrcM_r;
      reg  [4:0]  RD_M_r;
      reg  [31:0] ALU_ResultM_r, PCPlus4M_r, ReadDataM_r;
    
    
    //modules instentiated
    
    Data_Memory Data_Memory(
        .clk(clk),
        .rst(rst),
        .WD(WriteDataM),
        .A(ALU_ResultM),
        .WE(MemWriteM),      
        .RD(ReadDataM)        

    );
    
    
    //registers logic
    
    
    
    always@ (posedge clk or negedge rst)begin
        if (rst == 1'b0)begin
            RegWriteM_r              <= 1'b0;        
            ResultSrcM_r             <= 1'b0;
            RD_M_r                   <= 5'h00;
            PCPlus4M_r               <= 32'h00000000;
            ALU_ResultM_r            <= 32'h00000000;
            ReadDataM_r              <= 32'h00000000;
        end
        else begin
             RegWriteM_r              <= RegWriteM;        
             ResultSrcM_r             <= ResultSrcM;
             RD_M_r                   <= RD_M;
             PCPlus4M_r               <= PCPlus4M;
             ALU_ResultM_r            <= ALU_ResultM;
             ReadDataM_r              <= ReadDataM;
        end
    end 
    
    //declaring outputs
        assign RegWriteW        = RegWriteM_r; 
        assign ResultSrcW       = ResultSrcM_r;
        assign RD_W             = RD_M_r;
        assign PCPlus4W         = PCPlus4M_r;
        assign ALUResultW       = ALU_ResultM_r;
        assign ReadDataW        = ReadDataM_r;   
    
    
    
endmodule
















