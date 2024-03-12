`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:21:31 11/23/2018 
// Design Name: 
// Module Name:    EX 
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
module EX(
    input clk,
    input reset,
    input en,
	 input over,
    input [31:0] IR_D,
	 input [31:0] PC_D,
    input [31:0] PC4_D,
    input [31:0] PC8_D,
    input [31:0] RF_RD1,
    input [31:0] RF_RD2,
    input [31:0] EXT,
	 input Zero,
	 input more,
	 input less,
    output reg[31:0] IR_E,
	 output reg[31:0] PC_E,
    output reg[31:0] PC4_E,
    output reg[31:0] PC8_E,
    output reg[31:0] RS_E,
    output reg[31:0] RT_E,
    output reg[31:0] EXT_E,
	 output [6:2] excode_E,
	 output reg Zero_E,
	 output reg more_E,
	 output reg less_E
    );
	
	`define op 31:26
	`define rt 20:16
	`define func 5:0
	
	`define R 6'b000000
	`define lw 6'b100011
	`define lb 6'b100000
	`define lbu 6'b100100
	`define lh 6'b100001
	`define lhu 6'b100101
	`define sw 6'b101011
	`define sb 6'b101000
	`define sh 6'b101001
	`define add 6'b100000 
	`define sub 6'b100010
	`define addi 6'b001000
	
	initial begin
		IR_E <= 0;
	end
	
	assign excode_E = ((IR_E[`op]==`lw||IR_E[`op]==`lb||IR_E[`op]==`lbu||IR_E[`op]==`lh||IR_E[`op]==`lhu)&&over) ? 4 :
							((IR_E[`op]==`sw||IR_E[`op]==`sh||IR_E[`op]==`sb)&&over) ? 5 :
							(((IR_E[`op]==`R&&(IR_E[`func]==`add||IR_E[`func]==`sub))||(IR_E[`op]==`addi))&&over) ? 12 : 0;
	
	always@(posedge clk) begin
		if(reset) begin
			IR_E <= 32'h00000000;
			PC_E <= PC_D;
		end
		else if(en) begin
			IR_E <= IR_D;
			PC_E <= PC_D;
			PC4_E <= PC4_D;
			PC8_E <= PC8_D;
			RS_E <= RF_RD1;
			RT_E <= RF_RD2;
			EXT_E <= EXT;
			Zero_E <= Zero;
			more_E <= more;
			less_E <= less;
		end
	end
	
endmodule
