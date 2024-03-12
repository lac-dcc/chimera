`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:27:06 11/23/2018 
// Design Name: 
// Module Name:    MEM 
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
module MEM(
    input clk,
    input reset,
    input en,
    input [31:0] IR_E,
	 input [31:0] PC_E,
    input [31:0] PC4_E,
    input [31:0] PC8_E,
    input [31:0] ALU,
	 input [31:0] Mult_Div,
    input [31:0] RT_E,
	 input Zero_E,
	 input more_E,
	 input less_E,
    output reg[31:0] IR_M,
	 output reg[31:0] PC_M,
    output reg[31:0] PC4_M,
    output reg[31:0] PC8_M,
    output reg[31:0] AO_M,
	 output reg[31:0] MDO_M,
    output reg[31:0] RT_M,
	 output [6:2] excode_M,
	 output reg Zero_M,
	 output reg more_M,
	 output reg less_M
    );
	 
	`define op 31:26
	`define lw 6'b100011
	`define lb 6'b100000
	`define lbu 6'b100100
	`define lh 6'b100001
	`define lhu 6'b100101
	`define sw 6'b101011
	`define sb 6'b101000
	`define sh 6'b101001
	
	initial begin
		IR_M <= 0;
	end
	
	assign excode_M = ((IR_M[`op]==`lw&&AO_M[1:0]!=2'b00)||(IR_M[`op]==`lh&&AO_M[0]!=1'b0)||(IR_M[`op]==`lhu&&AO_M[0]!=1'b0)||
								((IR_M[`op]==`lw||IR_M[`op]==`lb||IR_M[`op]==`lbu||IR_M[`op]==`lh||IR_M[`op]==`lhu)&&(AO_M<32'h00000000||
								(AO_M>32'h00002fff&&AO_M<32'h00007f00)||(AO_M>32'h00007f0b&&AO_M<32'h00007f10)||AO_M>32'h00007f1b))||
								((IR_M[`op]==`lb||IR_M[`op]==`lbu||IR_M[`op]==`lh||IR_M[`op]==`lhu)&&((AO_M>=32'h00007f00&&AO_M<=32'h00007f0b)||
								(AO_M>=32'h00007f10&&AO_M<=32'h00007f1b)))) ? 4 :
							((IR_M[`op]==`sw&&AO_M[1:0]!=2'b00)||(IR_M[`op]==`sh&&AO_M[0]!=1'b0)||
								((IR_M[`op]==`sw||IR_M[`op]==`sb||IR_M[`op]==`sh)&&(AO_M<32'h00000000||
								(AO_M>32'h00002fff&&AO_M<32'h00007f00)||(AO_M>32'h00007f07&&AO_M<32'h00007f10)||AO_M>32'h00007f1b))|| //²»ÄÜÏòCOUNTÐ´ 7f07
								((IR_M[`op]==`sb||IR_M[`op]==`sh)&&((AO_M>=32'h00007f00&&AO_M<=32'h00007f0b)||
								(AO_M>=32'h00007f10&&AO_M<=32'h00007f1b)))) ? 5 : 0;
	
	always@(posedge clk) begin
		if(reset) begin
			IR_M <= 32'h00000000;
		end
		else if(en) begin
			IR_M <= IR_E;
			PC_M <= PC_E;
			PC4_M <= PC4_E;
			PC8_M <= PC8_E;
			AO_M <= ALU;
			MDO_M <= Mult_Div;
			RT_M <= RT_E;
			Zero_M <= Zero_E;
			more_M <= more_E;
			less_M <= less_E;
		end
	end
	
endmodule
