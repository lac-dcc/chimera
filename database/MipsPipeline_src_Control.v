// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

`timescale 1ns / 1ps
module Control(OpCode, Funct,
	PCSrc, Branch, RegWrite, RegDst, 
	MemRead, MemWrite, MemtoReg, 
	ALUSrc1, ALUSrc2, ExtOp, LuOp, JOp, LoadByte
);
	input wire [5:0] OpCode;
	input wire [5:0] Funct;
	output wire [1:0] PCSrc;
	output wire Branch;
	output wire RegWrite;
	output wire [1:0] RegDst;
	output wire MemRead;
	output wire MemWrite;
	output wire [1:0] MemtoReg;
	output wire ALUSrc1;
	output wire ALUSrc2;
	output wire ExtOp;
	output wire LuOp;
	output wire JOp;
	output wire LoadByte;
	
	// Your code below

	assign PCSrc = (OpCode == 6'h02 || OpCode == 6'h03) ? 1 :		// j,jal: 1 -- jr,jalr: 2 -- 0 
					(OpCode == 0 && (Funct == 6'h08 || Funct == 6'h09)) ? 2 : 0;
	     
	assign Branch = OpCode == 6'h04 || OpCode == 6'h05 || OpCode == 6'h06 || OpCode == 6'h07 || OpCode == 6'h01;
	
	assign RegWrite = (OpCode == 6'h2b || OpCode == 6'h04 || OpCode == 6'h05 || OpCode == 6'h06 || OpCode == 6'h07 || OpCode == 6'h01 ||
						OpCode == 6'h02 || (OpCode == 6'h00 && Funct == 6'h08)) ? 0 : 1;
	
	assign RegDst = (OpCode == 6'h23 || OpCode == 6'h20 || OpCode == 6'h0f || OpCode == 6'h08 || OpCode == 6'h09 ||
						OpCode == 6'h0c || OpCode == 6'h0a || OpCode == 6'h0b) ? 0 :
							OpCode == 6'h03 ? 2 : 1;	// 0: rt; 1: rd; 2: ra

	assign MemRead = OpCode == 6'h23 || OpCode == 6'h20;

	assign MemWrite = OpCode == 6'h2b;

	assign MemtoReg = OpCode == 6'h23 || OpCode == 6'h20 ? 1 :
						(OpCode == 6'h03 || (OpCode == 6'h00 && Funct == 6'h09)) ? 2 : 0;
	
	assign ALUSrc1 = (OpCode == 6'h00 && (Funct == 6'h00 || Funct == 6'h02 || Funct == 6'h03)) ? 1 : 0;
	
	assign ALUSrc2 = (OpCode == 6'h23 || OpCode == 6'h20 || OpCode == 6'h2b || OpCode == 6'h0f ||
						OpCode == 6'h08 || OpCode == 6'h09 || OpCode == 6'h0c ||
							OpCode == 6'h0a || OpCode == 6'h0b) ? 1 : 0;

	assign ExtOp = OpCode == 6'h0c ? 0 : 1;

	assign LuOp = OpCode == 6'h0f;

	assign JOp = OpCode == 6'h02 || OpCode == 6'h03 || (OpCode == 6'h00 && (Funct == 6'h08 || Funct == 6'h09));
	
	assign LoadByte = OpCode == 6'h20;
	// Your code above
	
endmodule