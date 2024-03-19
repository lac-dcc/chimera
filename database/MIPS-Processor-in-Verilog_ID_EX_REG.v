`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:11 11/14/2012 
// Design Name: 
// Module Name:    ID_EX_REG 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ID_EX_REG(clk, rst,MemWrite, MemRead,RegWrite,RegWriteSel,MemtoReg,DataMemExtendSign,BranchBLTZ_BGTZ,BranchBGEZ,
						BranchNotEqual,BranchEqual,RegDest,ALUASrc,BHW,ALUBSrc,ALUControl,ReadData1, 
						ReadData2,Instruction_ID,Extended15to0Inst,BranchFlush,PCNow_in,PCNext4_in,WriteRegAddress_in,Prediction_in,MemWrite_EX, MemRead_EX,RegWrite_EX,RegWriteSel_EX,
						MemtoReg_EX,DataMemExtendSign_EX,BranchBLTZ_BGTZ_EX,BranchBGEZ_EX,BranchNotEqual_EX,BranchEqual_EX,
						RegDest_EX,ALUASrc_EX,BHW_EX,ALUBSrc_EX,ALUControl_EX,ReadData1_EX, ReadData2_EX,
						Instruction_EX,Extended15to0Inst_EX,BranchFlush_EX,PCNow_out,PCNext4_out,WriteRegAddress_out,Prediction_out);
	
	
	input MemWrite, MemRead,RegWrite,RegWriteSel,DataMemExtendSign,Prediction_in;
	input BranchBLTZ_BGTZ,BranchBGEZ,BranchNotEqual,BranchEqual,BranchFlush;
	input [1:0] MemtoReg,RegDest,ALUASrc,BHW;
	input [4:0] WriteRegAddress_in;
	input [3:0] ALUBSrc,ALUControl;
	input [31:0] ReadData1, ReadData2;
	input [31:0] Instruction_ID,Extended15to0Inst,PCNext4_in,PCNow_in;
   input clk,rst;	
	
	output MemWrite_EX, MemRead_EX,RegWrite_EX,RegWriteSel_EX,DataMemExtendSign_EX,Prediction_out;
	output BranchBLTZ_BGTZ_EX,BranchBGEZ_EX,BranchNotEqual_EX,BranchEqual_EX,BranchFlush_EX;
	output [1:0] MemtoReg_EX,RegDest_EX,ALUASrc_EX,BHW_EX;
   output [3:0] ALUBSrc_EX,ALUControl_EX;
   output [4:0] WriteRegAddress_out;
	output [31:0] ReadData1_EX, ReadData2_EX;
	output [31:0] Instruction_EX,Extended15to0Inst_EX,PCNext4_out,PCNow_out;
	
	reg MemWrite_EX, MemRead_EX,RegWrite_EX,RegWriteSel_EX,DataMemExtendSign_EX,Prediction_out;
	reg BranchBLTZ_BGTZ_EX,BranchBGEZ_EX,BranchNotEqual_EX,BranchEqual_EX,BranchFlush_EX;
	reg [1:0] MemtoReg_EX,RegDest_EX,ALUASrc_EX,BHW_EX;
   reg [3:0] ALUBSrc_EX,ALUControl_EX;
   reg [4:0] WriteRegAddress_out;
	reg [31:0] ReadData1_EX, ReadData2_EX;
	reg [31:0] Instruction_EX,Extended15to0Inst_EX,PCNext4_out,PCNow_out;
	
always@(rst)
begin
	if (rst == 1) begin
		MemWrite_EX 			<=  0;
		MemRead_EX 				<=  0;
		RegWrite_EX 			<=  0;
		RegWriteSel_EX 		<=  0;
		MemtoReg_EX 			<=  0;
		DataMemExtendSign_EX <=  0;
		BranchBLTZ_BGTZ_EX 	<=  0;
		BranchBGEZ_EX 			<=	 0;
		BranchNotEqual_EX 	<=  0;
		BranchEqual_EX		<=  0;
		RegDest_EX				<=  0;
		ALUASrc_EX				<=  0;
		BHW_EX					<=  0;
		ALUBSrc_EX				<=  0;
		ALUControl_EX			<=  0;
		ReadData1_EX		<=  0;
		ReadData2_EX		<=  0;
		Instruction_EX			<=  0;
		Extended15to0Inst_EX <=  0;
		PCNext4_out <= 0;
		BranchFlush_EX <= 0;
		PCNow_out <= 0;
		WriteRegAddress_out <= 0;
		Prediction_out <= 0;
	end
end

always@(posedge clk)
begin
   MemWrite_EX 			<=  MemWrite;
	MemRead_EX 				<=  MemRead;
	RegWrite_EX 			<=  RegWrite;
	RegWriteSel_EX 		<=  RegWriteSel;
	MemtoReg_EX 			<=  MemtoReg;
	DataMemExtendSign_EX <=  DataMemExtendSign;
	BranchBLTZ_BGTZ_EX 	<=  BranchBLTZ_BGTZ;
	BranchBGEZ_EX 			<=	 BranchBGEZ;
	BranchNotEqual_EX 	<=  BranchNotEqual;
	BranchEqual_EX		<=  BranchEqual;
	RegDest_EX				<=  RegDest;
	ALUASrc_EX				<=  ALUASrc;
	BHW_EX					<=  BHW;
	ALUBSrc_EX				<=  ALUBSrc;
	ALUControl_EX			<=  ALUControl;
	ReadData1_EX		<=  ReadData1;
	ReadData2_EX		<=  ReadData2;
	Instruction_EX			<=  Instruction_ID;
	Extended15to0Inst_EX <=  Extended15to0Inst;
	PCNext4_out <= PCNext4_in;
	BranchFlush_EX <= BranchFlush;
	PCNow_out <= PCNow_in;
	WriteRegAddress_out = WriteRegAddress_in;
	Prediction_out <= Prediction_in;
end
	 	
endmodule
