`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:31:53 11/23/2018 
// Design Name: 
// Module Name:    mux 
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
module mux(
    input [31:0] EXT_E,
	 input [31:0] IR_E,
	 input [31:0] IR_W,
    input [31:0] DR_Wnew,
    input [31:0] AO_W,
	 input [31:0] MDO_W,
    input [31:0] PC8_W,
	 input [31:0] CP0_W,
	 input [31:0] MFRSE,
	 input [31:0] MFRTE,
	 input [31:0] High,
	 input [31:0] Low,
	 input ALUasel,
	 input ALUbsel,
	 input if_mfhi,
	 input if_mflo,
	 input [1:0] RegDst,
	 input [2:0] MemtoReg,
	 output reg[31:0] ALU_A,
	 output reg[31:0] ALU_B,
	 output reg[4:0] MUX_A3,
	 output reg[31:0] MUX_WD,
	 output reg[31:0] MD_out
    );
	
	always@(*) begin
		case(ALUasel) 
			1'b0: ALU_A<=MFRSE;
			1'b1: ALU_A<={27'b0,IR_E[10:6]};
		endcase
		
		case(ALUbsel) 
			1'b0: ALU_B<=MFRTE;
			1'b1: ALU_B<=EXT_E;
		endcase
		
		case(RegDst) 
			2'b00: MUX_A3<=IR_W[20:16];
			2'b01: MUX_A3<=IR_W[15:11];
			2'b10: MUX_A3<=32'h1f;
			2'b11: MUX_A3<=0;
		endcase
		
		case(MemtoReg) 
			3'b000: MUX_WD<=AO_W;
			3'b001: MUX_WD<=DR_Wnew;
			3'b010: MUX_WD<=PC8_W;
			3'b011: MUX_WD<=MDO_W;
			3'b100: MUX_WD<=CP0_W;
		endcase
		
		if(if_mfhi) MD_out<=High;
		else if(if_mflo) MD_out<=Low;
		else MD_out<=0;
	end
	
endmodule
