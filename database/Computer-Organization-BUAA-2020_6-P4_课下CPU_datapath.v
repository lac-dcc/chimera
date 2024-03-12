`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:28:22 11/17/2020 
// Design Name: 
// Module Name:    datapath 
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
module datapath(
    input clk,
    input reset,
    input WeGrf,
    input WeDm,
    input [1:0] RegDst,
    input [1:0] WhichtoReg,
    input AluSrc,
    input [2:0] AluOp,
    input sign,
    input branch,
    input JType,
    input JReg,
	output eq,
	output [31:0] instr,		// exist
	
	output odd      // for failed P4-test :(
	
    );
	reg [31:0] num;
	initial begin
		num = 0;
	end
	integer i;
	always@(*) begin
		num = 0;
		for (i = 0; i < 32; i = i + 1) begin
			if(RegRead1[i] == 1) begin
				num = num + 1;
			end
		end
	end
	assign odd = num[0];

	
	// NPC Wire
	wire [31:0] NPC, PC4;
	// PC Wire
	wire [31:0] PC;
	// IM Wire
	// wire instr already in the output
	
	// GRF Wire
	wire [4:0] RegAddr;
	wire [31:0] RegWrite;
	wire [31:0] RegRead1, RegRead2;
	
	// ALU Wire
	wire [31:0] AluB;
	wire [31:0] res;
	
	// DM Wire
	wire [31:0] MemRead;
	
	// EXT Wire
	wire [31:0] imm32;
	
	NPC npc (
    .branch(branch), 
    .JType(JType), 
    .JReg(JReg), 
    .PC(PC), 
    .RegJump(RegRead1), 
    .imm26(instr[25:0]), 
    .PC4(PC4), 
    .NPC(NPC)
    );
	
	PC pc (
    .clk(clk), 
    .reset(reset), 
    .NPC(NPC), 
    .PC(PC)
    );
	
	IM im (
    .PC(PC), 
    .instr(instr)
    );
	
////////////////////////////
	// GRF Part

	GRF grf (
    .clk(clk), 
    .reset(reset), 
    .WE(WeGrf), 
    .A1(instr[25:21]), 
    .A2(instr[20:16]), 
    .A3(RegAddr), 
    .WD(RegWrite), 
    .RD1(RegRead1), 
    .RD2(RegRead2),
	.PC(PC)
    );
	
	// the mux write value choose
	Mux_4_32 MuxRegWrite (
    .in0(res), 
    .in1(MemRead), 
    .in2(PC4), 
    .in3(), 
    .sel(WhichtoReg), 
    .out(RegWrite)
    );

	// the grf write addr choose
	
	
	Mux_4_5 MuxRegAddr (	// 4 inputs 5-bits output
    .in0(instr[15:11]), 
    .in1(instr[20:16]),
	.in2(5'd31),
	.in3(0),
    .sel(RegDst), 
    .out(RegAddr)
    );
	
///////////////////////////////
//	ALU Part

/// ALU oprend choose
	Mux_2_32 MuxAluB (
    .in0(RegRead2), 
    .in1(imm32), 
    .sel(AluSrc), 
    .out(AluB)
    );
	
	ALU alu (
    .A(RegRead1), 
    .B(AluB), 
    .AluOp(AluOp), 
    .eq(eq), 
    .res(res)
    );


/////////////////////////////
//	DM Part
	DM dm (
    .clk(clk), 
    .reset(reset), 
    .WE(WeDm), 
    .MemAddr(res), 
    .WD(RegRead2), 
    .RD(MemRead),
	.PC(PC)
    );

/////////////////////////////
//	EXT Part
	EXT ext (
    .imm16(instr[15:0]), 
    .sign(sign), 
    .imm32(imm32)
    );




endmodule
