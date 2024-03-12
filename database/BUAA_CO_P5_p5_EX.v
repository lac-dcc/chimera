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
    input [31:0] IR_D,
	 input [31:0] PC_D,
    input [31:0] PC4_D,
    input [31:0] PC8_D,
    input [31:0] RF_RD1,
    input [31:0] RF_RD2,
    input [31:0] EXT,
    output reg[31:0] IR_E,
	 output reg[31:0] PC_E,
    output reg[31:0] PC4_E,
    output reg[31:0] PC8_E,
    output reg[31:0] RS_E,
    output reg[31:0] RT_E,
    output reg[31:0] EXT_E
    );
	
	initial begin
		IR_E <= 0;
	end
	
	always@(posedge clk) begin
		if(reset) begin
			IR_E <= 32'h00000000;
		end
		else if(en) begin
			IR_E <= IR_D;
			PC_E <= PC_D;
			PC4_E <= PC4_D;
			PC8_E <= PC8_D;
			RS_E <= RF_RD1;
			RT_E <= RF_RD2;
			EXT_E <= EXT;
		end
	end
	
endmodule
