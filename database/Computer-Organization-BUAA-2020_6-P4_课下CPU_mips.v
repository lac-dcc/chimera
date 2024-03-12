`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:55:23 11/18/2020 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
	
	
	wire WeGrf, WeDm, AluSrc, sign, branch, JType, JReg, eq;
	wire [1:0] RegDst, WhichtoReg;
	wire [2:0] AluOp;
	wire [31:0] instr;
	
	datapath dp (
    .clk(clk), 
    .reset(reset), 
    .WeGrf(WeGrf), 
    .WeDm(WeDm), 
    .RegDst(RegDst), 
    .WhichtoReg(WhichtoReg), 
    .AluSrc(AluSrc), 
    .AluOp(AluOp), 
    .sign(sign), 
    .branch(branch), 
    .JType(JType), 
    .JReg(JReg), 
    .eq(eq), 
	
    .instr(instr)
    );
	
	control ctrl (
    .eq(eq), 
    .instr(instr), 
	
    .WeGrf(WeGrf), 
    .WeDm(WeDm), 
    .RegDst(RegDst), 
    .WhichtoReg(WhichtoReg), 
    .AluSrc(AluSrc), 
    .AluOp(AluOp), 
    .sign(sign), 
    .branch(branch), 
    .JType(JType), 
    .JReg(JReg)
    );
	

endmodule
