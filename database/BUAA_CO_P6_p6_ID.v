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
    output reg[31:0] PC8_D
    );

	initial begin
		IR_D <= 0;
	end
	
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
