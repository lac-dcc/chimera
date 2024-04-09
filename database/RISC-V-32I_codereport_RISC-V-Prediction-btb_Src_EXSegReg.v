`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB（Embeded System Lab）
// Engineer: Haojun Xia
// Create Date: 2019/02/08
// Design Name: RISCV-Pipline CPU
// Module Name: EXSegReg
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: ID-EX Segment Register
//////////////////////////////////////////////////////////////////////////////////
module EXSegReg(
    input wire clk,
    input wire en,
    input wire clear,
    //Data Signals
    input wire [31:0] PCD,
    output reg [31:0] PCE, 
    input wire [31:0] JalNPC,
    output reg [31:0] BrNPC, 
    input wire [31:0] ImmD,
    output reg [31:0] ImmE,
    input wire [4:0] RdD,
    output reg [4:0] RdE,
    input wire [4:0] Rs1D,
    output reg [4:0] Rs1E,
    input wire [4:0] Rs2D,
    output reg [4:0] Rs2E,
    input wire [31:0] RegOut1D,
    output reg [31:0] RegOut1E,
    input wire [31:0] RegOut2D,
    output reg [31:0] RegOut2E,
    //Control Signals
    input wire JalrD,
    output reg JalrE,
    input wire [2:0] RegWriteD,
    output reg [2:0] RegWriteE,
    input wire MemToRegD,
    output reg MemToRegE,
    input wire [3:0] MemWriteD,
    output reg [3:0] MemWriteE,
    input wire LoadNpcD,
    output reg LoadNpcE,
    input wire [1:0] RegReadD,
    output reg [1:0] RegReadE, 
    input wire [2:0] BranchTypeD,
    output reg [2:0] BranchTypeE,
    input wire [4:0] AluContrlD,
    output reg [4:0] AluContrlE,
    input wire AluSrc1D,
    output reg AluSrc1E,
    input wire [1:0] AluSrc2D,
    output reg [1:0] AluSrc2E,
	//for BTB
	input wire BranchPredictedD,
	output reg BranchPredictedE
    );
    initial begin
        PCE        = 32'b0; 
        BrNPC      = 32'b0; 
        ImmE       = 32'b0;
        RdE        = 32'b0;
        Rs1E       = 5'b0;
        Rs2E       = 5'b0;
        RegOut1E   = 32'b0;
        RegOut2E   = 32'b0;
        JalrE      = 1'b0;
        RegWriteE  = 1'b0;
        MemToRegE  = 1'b0;
        MemWriteE  = 1'b0;
        LoadNpcE   = 1'b0;
        RegReadE   = 2'b00;
        BranchTypeE = 3'b0;
        AluContrlE = 5'b0;
        AluSrc1E   = 1'b0; 
        AluSrc2E   = 2'b0; 
		BranchPredictedE = 1'b0;
    end
    //
    always@(posedge clk) begin
        if(en)
            if(clear)
                begin
                PCE<=32'b0; 
                BrNPC<=32'b0; 
                ImmE<=32'b0;
                RdE<=32'b0;
                Rs1E<=5'b0;
                Rs2E<=5'b0;
                RegOut1E<=32'b0;
                RegOut2E<=32'b0;
                JalrE<=1'b0;
                RegWriteE<=1'b0;
                MemToRegE<=1'b0;
                MemWriteE<=1'b0;
                LoadNpcE<=1'b0;
                RegReadE<=2'b00;
                BranchTypeE = 3'b0;
                AluContrlE<=5'b0;
                AluSrc1E<=1'b0;
                AluSrc2E<=2'b0;
				BranchPredictedE<=1'b0;
            end else begin
                PCE<=PCD; 
                BrNPC<=JalNPC; 
                ImmE<=ImmD;
                RdE<=RdD;
                Rs1E<=Rs1D;
                Rs2E<=Rs2D;
                RegOut1E<=RegOut1D;
                RegOut2E<=RegOut2D;
                JalrE<=JalrD;
                RegWriteE=RegWriteD;
                MemToRegE<=MemToRegD;
                MemWriteE<=MemWriteD;
                LoadNpcE<=LoadNpcD;
                RegReadE<=RegReadD;
                BranchTypeE = BranchTypeD;
                AluContrlE<=AluContrlD;
                AluSrc1E<=AluSrc1D;
                AluSrc2E<=AluSrc2D;
				BranchPredictedE<=BranchPredictedD;
            end
        end
    
endmodule
