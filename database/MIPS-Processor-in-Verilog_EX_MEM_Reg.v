

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:44:30 11/05/2012 
// Design Name: 
// Module Name:    if_id_reg 
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
module EX_MEM_Reg(clk,rst,MemRead_in,MemWrite_in,BHW_in,DataMemExtendSign_in,ReadData1_in,ReadData2_in,
					RegWrite_in,RegDst_in,RegWriteSel_in,MemToReg_in,ALUResult_in,Zero_in,NextInstruct_in,
					Instruction_in,WriteRegAddress_in,MemRead_out,MemWrite_out,BHW_out,DataMemExtendSign_out,ReadData1_out,
					ReadData2_out,RegWrite_out,RegDst_out,RegWriteSel_out,MemToReg_out,ALUResult_out,Zero_out,
					NextInstruct_out,Instruction_out,WriteRegAddress_out);
    input clk, rst,MemRead_in,MemWrite_in,DataMemExtendSign_in,RegWrite_in,RegWriteSel_in,Zero_in;
	input [1:0] MemToReg_in,BHW_in,RegDst_in;
	input [4:0] WriteRegAddress_in;
	input [31:0] ReadData1_in,ReadData2_in,ALUResult_in,NextInstruct_in,Instruction_in;
    output MemRead_out,MemWrite_out,DataMemExtendSign_out,RegWrite_out,RegWriteSel_out,Zero_out;
	output [1:0] MemToReg_out,BHW_out,RegDst_out;
	output [4:0] WriteRegAddress_out;
	output [31:0] ReadData1_out,ReadData2_out,ALUResult_out,NextInstruct_out,Instruction_out;

	reg MemRead_out,MemWrite_out,DataMemExtendSign_out,RegWrite_out,RegWriteSel_out,Zero_out;
	reg [1:0] MemToReg_out,BHW_out,RegDst_out;
	reg [4:0] WriteRegAddress_out;
	reg [31:0] ReadData1_out,ReadData2_out,ALUResult_out,NextInstruct_out,Instruction_out;

always@(rst)
begin
	if (rst == 1) begin
		MemRead_out <= 0;
		MemWrite_out <= 0;
		BHW_out <= 0;
		DataMemExtendSign_out <= 0;
		ReadData1_out <= 0;
		ReadData2_out <= 0;
		RegWrite_out <= 0;
		RegDst_out <= 0;
		RegWriteSel_out <= 0;
		MemToReg_out <= 0;
		ALUResult_out <= 0;
		Zero_out <= 0;
		NextInstruct_out <= 0;
		Instruction_out <= 0;
		WriteRegAddress_out <= 0;
	end
end

always@(posedge clk)
begin
	MemRead_out <= MemRead_in;
	MemWrite_out <= MemWrite_in;
	BHW_out <= BHW_out;
	DataMemExtendSign_out <= DataMemExtendSign_in;
	ReadData1_out <= ReadData1_in;
	ReadData2_out <= ReadData2_in;
	RegWrite_out <= RegWrite_in;
	RegDst_out <= RegDst_in;
	RegWriteSel_out <= RegWriteSel_in;
	MemToReg_out <= MemToReg_in;
	ALUResult_out <= ALUResult_in;
	Zero_out <= Zero_in;
	NextInstruct_out <= NextInstruct_in;
	Instruction_out <= Instruction_in;
	WriteRegAddress_out <= WriteRegAddress_in;
end
	 


endmodule
