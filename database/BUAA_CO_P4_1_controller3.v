`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:26:31 11/19/2018 
// Design Name: 
// Module Name:    controller3 
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
module controller3(
    input [5:0] op,
    output reg[1:0] RegDst,
    output reg ALUSrc,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg [1:0] MemtoReg,
    output reg ExtOp,
    output reg Branch1,
    output reg Branch2,
    output reg [2:0] ALUOp
    );
	`define R 6'b000000
	`define lw 6'b100011
	`define sw 6'b101011
	`define lui 6'b001111
	`define ori 6'b001101
	`define beq 6'b000100
	`define jal 6'b000011
	
	always@(*) 
	begin
		case (op)
		`R:
		begin
			RegDst[1]<=0;
			RegDst[0]<=1;
			ALUSrc<=0;
			RegWrite<=1;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg[1]<=0;
			MemtoReg[0]<=0;
			ExtOp<=0;
			Branch1<=0;
			ALUOp[2]<=0;
			ALUOp[1]<=0;
			ALUOp[0]<=0;	
			Branch2<=0;	
		end

		`lw:
		begin
			RegDst[1]<=0;
			RegDst[0]<=0;
			ALUSrc<=1;
			RegWrite<=1;
			MemRead<=1;
			MemWrite<=0;
			MemtoReg[1]<=1;
			MemtoReg[0]<=0;
			ExtOp<=0;
			Branch1<=0;
			ALUOp[2]<=0;
			ALUOp[1]<=0;
			ALUOp[0]<=1;	
			Branch2<=0;		
		end
		
		`sw:
		begin
			RegDst[1]<=0;
			RegDst[0]<=0;
			ALUSrc<=1;
			RegWrite<=0;
			MemRead<=0;
			MemWrite<=1;
			MemtoReg[1]<=0;
			MemtoReg[0]<=0;
			ExtOp<=0;
			Branch1<=0;
			ALUOp[2]<=0;
			ALUOp[1]<=0;
			ALUOp[0]<=1;	
			Branch2<=0;	
		end

       `beq:
		begin
			RegDst[1]<=0;
			RegDst[0]<=0;
			ALUSrc<=0;
			RegWrite<=0;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg[1]<=0;
			MemtoReg[0]<=0;
			ExtOp<=0;
			Branch1<=1;
			ALUOp[2]<=0;
			ALUOp[1]<=1;
			ALUOp[0]<=0;	
			Branch2<=0;	
		end
 
        `lui:
		begin
			RegDst[1]<=0;
			RegDst[0]<=0;
			ALUSrc<=0;
			RegWrite<=1;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg[1]<=0;
			MemtoReg[0]<=1;
			ExtOp<=0;
			Branch1<=0;
			ALUOp[2]<=0;
			ALUOp[1]<=1;
			ALUOp[0]<=1;	
			Branch2<=0;	
		end

        `ori:
		begin
			RegDst[1]<=0;
			RegDst[0]<=0;
			ALUSrc<=1;
			RegWrite<=1;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg[1]<=0;
			MemtoReg[0]<=0;
			ExtOp<=1;
			Branch1<=0;
			ALUOp[2]<=1;
			ALUOp[1]<=1;
			ALUOp[0]<=1;	
			Branch2<=0;	
		end

		  `jal:
		begin
			RegDst[1]<=1;
			RegDst[0]<=0;
			ALUSrc<=0;
			RegWrite<=1;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg[1]<=1;
			MemtoReg[0]<=1;
			ExtOp<=0;
			Branch1<=0;
			ALUOp[2]<=0;
			ALUOp[1]<=1;
			ALUOp[0]<=1;	
			Branch2<=1;	
		end
		endcase
	end	
endmodule
