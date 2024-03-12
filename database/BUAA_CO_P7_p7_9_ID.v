`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:51 11/23/2018 
// Design Name: 
// Module Name:    ID 
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
module ID(
	 input clk,
	 input reset,
	 input en,
	 input sel,
    input [31:0] Instr,
	 input [31:0] PC,
	 input BD,
	 output reg[31:0] IR_D,
	 output reg[31:0] PC_D,
    output reg[31:0] PC4_D,
    output reg[31:0] PC8_D,
	 output [4:0] excode_D,
	 output reg BD_D
    );
	 
	`define op 31:26
	`define rs 25:21
	`define rt 20:16
	`define func 5:0
	
	`define R 6'b000000
	`define j 6'b000010
	`define lw 6'b100011
	`define lb 6'b100000
	`define lbu 6'b100100
	`define lh 6'b100001
	`define lhu 6'b100101
	`define sw 6'b101011
	`define sb 6'b101000
	`define sh 6'b101001
	`define lui 6'b001111
	`define ori 6'b001101
	`define andi 6'b001100
	`define xori 6'b001110
	`define addi 6'b001000
	`define addiu 6'b001001
	`define slti 6'b001010
	`define sltiu 6'b001011
	`define beq 6'b000100
	`define bne 6'b000101
	`define bgtz 6'b000111
	`define blez 6'b000110
	`define jal 6'b000011
	`define addu 6'b100001
	`define add 6'b100000 
	`define subu 6'b100011
	`define sub 6'b100010
	`define and_ 6'b100100
	`define or_ 6'b100101
	`define xor_ 6'b100110
	`define nor_ 6'b100111
	`define sll 6'b000000
	`define srl 6'b000010
	`define sra 6'b000011
	`define sllv 6'b000100
	`define srlv 6'b000110
	`define srav 6'b000111
	`define jr 6'b001000
	`define jalr 6'b001001
	`define mult 6'b011000
	`define multu 6'b011001
	`define div 6'b011010
	`define divu 6'b011011 
	`define mfhi 6'b010000
	`define mflo 6'b010010
	`define mthi 6'b010001
	`define mtlo 6'b010011
	`define slt	6'b101010
	`define sltu 6'b101011
	
	initial begin
		IR_D <= 0;
	end
	
	wire RI;//译码异常 不认识的op func
	assign RI = (IR_D[`op]==`j)||(IR_D[`op]==`jal)
	||(IR_D[`op]==`beq)||(IR_D[`op]==`bne)||(IR_D[`op]==`blez)||(IR_D[`op]==`bgtz)||(IR_D[`op]==6'b000001&&IR_D[`rt]==5'b00000)||(IR_D[`op]==6'b000001&&IR_D[`rt]==5'b00001)	
	||IR_D[`op]==`lui||IR_D[`op]==`ori||IR_D[`op]==`addi||IR_D[`op]==`addiu||IR_D[`op]==`andi||IR_D[`op]==`xori||IR_D[`op]==`slti||IR_D[`op]==`sltiu
	||IR_D[`op]==`lw||IR_D[`op]==`lb||IR_D[`op]==`lbu||IR_D[`op]==`lh||IR_D[`op]==`lhu
	||IR_D[`op]==`sw||IR_D[`op]==`sh||IR_D[`op]==`sb
	||(IR_D[`op]==6'b010000&&(IR_D[`rs]==5'b00000||IR_D[`rs]==5'b00100))
	||(IR_D==32'h42000018)
	||(IR_D[`op]==`R&&(IR_D[`func]==`jr||IR_D[`func]==`jalr||IR_D[`func]==`addu||IR_D[`func]==`subu||IR_D[`func]==`add||IR_D[`func]==`sub||IR_D[`func]==`sll||IR_D[`func]==`srl||IR_D[`func]==`sra
		||IR_D[`func]==`sllv||IR_D[`func]==`srlv||IR_D[`func]==`srav||IR_D[`func]==`and_||IR_D[`func]==`or_||IR_D[`func]==`nor_||IR_D[`func]==`xor_||IR_D[`func]==`slt||IR_D[`func]==`sltu
		||IR_D[`func]==`mult||IR_D[`func]==`multu||IR_D[`func]==`div||IR_D[`func]==`divu||IR_D[`func]==`mfhi||IR_D[`func]==`mflo||IR_D[`func]==`mthi||IR_D[`func]==`mtlo));		  
	
	assign excode_D = (RI===0) ? 10 : 0; 

	always@(posedge clk) begin 
		if(reset) begin
			IR_D <= 32'h00000000;
			PC_D <= PC;
			BD_D <= BD;
		end
		else if(en) begin
			IR_D <= Instr;
			PC_D <= PC;
			BD_D <= BD;
			PC4_D <= PC+4;
			PC8_D <= PC+8;
		end
	end
endmodule
