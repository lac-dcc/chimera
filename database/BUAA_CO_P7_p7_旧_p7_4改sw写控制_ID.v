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
    input [31:0] Instr,
	 input [31:0] PC,
	 output reg[31:0] IR_D,
	 output reg[31:0] PC_D,
    output reg[31:0] PC4_D,
    output reg[31:0] PC8_D,
	 output [4:0] excode_D
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
	assign RI = (Instr[`op]==`j)||(Instr[`op]==`jal)
	||(Instr[`op]==`beq)||(Instr[`op]==`bne)||(Instr[`op]==`blez)||(Instr[`op]==`bgtz)||(Instr[`op]==6'b000001&&Instr[`rt]==5'b00000)||(Instr[`op]==6'b000001&&Instr[`rt]==5'b00001)	
	||Instr[`op]==`lui||Instr[`op]==`ori||Instr[`op]==`addi||Instr[`op]==`addiu||Instr[`op]==`andi||Instr[`op]==`xori||Instr[`op]==`slti||Instr[`op]==`sltiu
	||Instr[`op]==`lw||Instr[`op]==`lb||Instr[`op]==`lbu||Instr[`op]==`lh||Instr[`op]==`lhu
	||Instr[`op]==`sw||Instr[`op]==`sh||Instr[`op]==`sb
	||(Instr[`op]==6'b010000&&(Instr[`rs]==5'b00000||Instr[`rs]==5'b00100))
	||(Instr==32'h42000018)
	||(Instr[`op]==`R&&(Instr[`func]==`jr||Instr[`func]==`jalr||Instr[`func]==`addu||Instr[`func]==`subu||Instr[`func]==`add||Instr[`func]==`sub||Instr[`func]==`sll||Instr[`func]==`srl||Instr[`func]==`sra
		||Instr[`func]==`sllv||Instr[`func]==`srlv||Instr[`func]==`srav||Instr[`func]==`and_||Instr[`func]==`or_||Instr[`func]==`nor_||Instr[`func]==`xor_||Instr[`func]==`slt||Instr[`func]==`sltu
		||Instr[`func]==`mult||Instr[`func]==`multu||Instr[`func]==`div||Instr[`func]==`divu||Instr[`func]==`mfhi||Instr[`func]==`mflo||Instr[`func]==`mthi||Instr[`func]==`mtlo));		  
	
	assign excode_D = (RI==0) ? 10 : 0; 
	
	always@(posedge clk) begin 
		if(reset) begin
			IR_D <= 32'h00000000;
		end
		else if(en) begin
			IR_D <= Instr;
			PC_D <= PC;
			PC4_D <= PC+4;
			PC8_D <= PC+8;
		end
	end
endmodule
