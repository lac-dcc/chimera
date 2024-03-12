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
    output reg[31:0] IR_M,
	 output reg[31:0] PC_M,
    output reg[31:0] PC4_M,
    output reg[31:0] PC8_M,
    output reg[31:0] AO_M,
	 output reg[31:0] MDO_M,
    output reg[31:0] RT_M
    );
	initial begin
		IR_M <= 0;
	end
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
		end
	end
	
endmodule
