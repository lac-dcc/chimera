`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:22 11/23/2018 
// Design Name: 
// Module Name:    WB 
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
module WB(
    input clk,
    input reset,
    input en,
    input [31:0] IR_M,
	 input [31:0] PC_M,
    input [31:0] PC4_M,
    input [31:0] PC8_M,
    input [31:0] AO_M,
	 input [31:0] MDO_M,
    input [31:0] DM,
	 input [31:0] CP0_M,
    output reg[31:0] IR_W,
	 output reg[31:0] PC_W,
    output reg[31:0] PC4_W,
    output reg[31:0] PC8_W,
    output reg[31:0] AO_W,
	 output reg[31:0] MDO_W,
    output reg[31:0] DR_W,
	 output reg[31:0] CP0_W
    );
	initial begin
		IR_W <= 0;
	end
	always@(posedge clk) begin
		if(reset) begin
			IR_W <= 32'h00000000;
			PC_W <= PC_M;
		end
		else if(en) begin
			IR_W <= IR_M;
			PC_W <= PC_M;
			PC4_W <= PC4_M;
			PC8_W <= PC8_M;
			AO_W <= AO_M;
			MDO_W <= MDO_M;
			DR_W <= DM;
			CP0_W <= CP0_M;
		end
	end
	
endmodule
