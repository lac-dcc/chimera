`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:04 11/19/2018 
// Design Name: 
// Module Name:    controller2 
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
module controller2(
    input [5:0] op,
    output [1:0] RegDst,
    output  ALUSrc,
    output RegWrite,
    output  MemRead,
    output  MemWrite,
    output  [1:0] MemtoReg,
    output  ExtOp,
    output  Branch1,
    output  Branch2,
    output  [2:0] ALUOp
    );
	wire r,lw,sw,beq,lui,ori,jal,jr;
	assign r = !op[0]&&!op[1]&&!op[2]&&!op[3]&&!op[4]&&!op[5];
	assign lw = op[0]&&op[1]&&!op[2]&&!op[3]&&!op[4]&&op[5];
	assign sw = op[0]&&op[1]&&!op[2]&&op[3]&&!op[4]&&op[5];
	assign beq = !op[0]&&!op[1]&&op[2]&&!op[3]&&!op[4]&&!op[5];
	assign lui = op[0]&&op[1]&&op[2]&&op[3]&&!op[4]&&!op[5];
	assign ori = op[0]&&!op[1]&&op[2]&&op[3]&&!op[4]&&!op[5];
	assign jal = op[0]&&op[1]&&!op[2]&&!op[3]&&!op[4]&&!op[5];
	
	assign RegDst[1] = jal;
	assign RegDst[0] = r;
	assign ALUSrc = lw||sw||ori;
	assign RegWrite = r||lui||ori||lw||jal;
	assign MemRead = lw;
	assign MemWrite = sw;
	assign MemtoReg[1] = lw||jal;
	assign MemtoReg[0] = lui||jal;
	assign ExtOp = ori;
	assign Branch1 = beq;
	assign Branch2 = jal;
	assign ALUOp[2] = ori;
	assign ALUOp[1] = beq||lui||ori||jal;
	assign ALUOp[0] = lw||sw||lui||ori||jal;
endmodule
