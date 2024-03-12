`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:03:44 11/15/2018 
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

	wire [5:0] op;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [4:0] shamt;
	wire [15:0] imm16;
	wire [5:0] func;
	wire [1:0] RegDst;
   wire ALUSrc;
   wire RegWrite;
   wire MemRead;
   wire MemWrite;
   wire [1:0] MemToReg;
   wire ExtOp;
   wire Branch1;
   wire Branch2;
	wire Branch3;
	wire Branch4;
	wire [31:0] Instr;
   wire [31:0] imm32;
	wire [4:0] RA1;
	wire [4:0] RA2;
   wire [31:0] RD1;
   wire [31:0] RD2;
   wire Zero;
	wire [2:0] ALUCtrl;
   wire [4:0] WA;
   wire [31:0] WD;
	wire [31:0] MemAddr;
	wire [31:0] MemData;
   wire [31:0] RD;
	wire [31:0] A;
   wire [31:0] B;
   wire [31:0] Result;
	wire [31:0] PC;
	wire [31:0] PC4;
	wire [31:0] next_pc;
	wire [31:0] PCbeq;
	wire [31:0] PCj;
	
	assign op = Instr[31:26];
	assign rs = Instr[25:21];
	assign rt = Instr[20:16];
	assign rd = Instr[15:11];
	assign shamt = Instr[10:6];
	assign func = Instr[5:0];
	assign imm16 = Instr[15:0];
	
	assign RA1 = rs;
	assign RA2 = rt;
	assign A = RD1;
	assign MemAddr = Result;
	assign MemData = RD2;
	
	assign PC4 = PC+4;
	assign PCbeq = PC+4+{{14{imm16[15]}},imm16,2'b00};
	assign PCj = {PC[31:28],Instr[25:0],2'b00};
	
	pc my_pc(next_pc,clk,reset,PC);
	im my_im(PC,Instr);
	add_new_controller my_controller(op,func,ALUCtrl,RegDst,ALUSrc,RegWrite,MemRead,MemWrite,MemToReg,ExtOp,Branch1,Branch2,Branch3,Branch4);
	grf my_grf(clk,reset,RegWrite,RA1,RA2,WA,WD,PC,RD1,RD2);
	ext my_ext(imm16,imm32,ExtOp);
	dm my_dm(clk,reset,MemWrite,MemRead,MemAddr,MemData,PC,RD);
	alu my_alu(A,B,ALUCtrl,Result,Zero);
	mux my_mux(rt,rd,RD1,RD2,imm32,Result,imm16,RD,PC,RegDst,ALUSrc,MemToReg,PC4,PCbeq,PCj,Zero,Branch1,Branch2,Branch3,Branch4,op,func,WA,B,WD,next_pc);
	
endmodule
